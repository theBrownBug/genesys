# frozen_string_literal: true

class ReviewsController < ApplicationController
  load_and_authorize_resource

  before_action :set_review, only: %i[show edit update destroy]

  def index
    @reviews = Review.all.order(created_at: :desc)
    @reviews_live_landing = @reviews.where(is_live_landing: true)

    ratings = Review.order(rating: :desc).group(:rating).count
    @ratings_metrics = ratings_metrics(ratings)

    @review = Review.new
  end

  # GET /reviews/1
  def show; end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit; end

  # POST /reviews
  def create
    @review = Review.new(review_params)

    if @review.save
      redirect_to reviews_url
    else
      redirect_to reviews_url, notice: 'Review could not be created at this time.'
    end
  end

  # PATCH/PUT /reviews/1
  def update
    if can? :update, Review, :order_no
      check_if_order_no_updated(@review, review_params)
      redirect_to reviews_url, notice: "Review ##{@review.id} has been updated!" if @review.update(review_params)
    elsif (can? :update, Review, :likes) && @review.update(review_params_likes)
      render json: @review
    end
  end

  # DELETE /reviews/1
  def destroy
    @review.destroy
    redirect_to reviews_url, notice: 'Review was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def review_params
    params.require(:review).permit(:title, :body, :rating, :likes, :dislikes, :is_live, :is_live_landing, :order_no)
  end

  def review_params_likes
    params.require(:review).permit(:likes)
  end

  def rating_metrics(rating, count)
    colors = { 5 => '8CD47E', 4 => '7ABD7E', 3 => 'F8D66D', 2 => 'FFB54C', 1 => 'FF6961' }
    { count: count,
      rating_percentage: ((count.to_f / @reviews.count) * 100).round(0),
      color: colors[rating] }
  end

  def ratings_metrics(ratings)
    ratings_metrics = ratings.map { |rating, count| [rating, rating_metrics(rating, count)] }.to_h
    ratings_metrics[:average] = (ratings.map { |rating, count| rating.to_i * count }.sum.to_f / @reviews.count).round(2)

    ratings_metrics
  end

  def update_order_nos(id, order_no, order_no_new)
    reviews_to_update = Review.where(is_live_landing: true)
    order_no_difference = order_no_new - order_no

    if order_no_difference.negative?
      reviews_to_update.each do |review|
        next unless review.order_no.between?(order_no_new, order_no) && review.id != id

        review.order_no += 1
        review.save
      end
    else
      reviews_to_update.each do |review|
        next unless review.order_no.between?(order_no, order_no_new) && review.id != id

        review.order_no -= 1
        review.save
      end
    end
  end

  def check_if_order_no_updated(review, review_params)
    if review_params[:order_no].to_i != review.order_no
      if !review.order_no
        update_order_nos(review.id, Review.where(is_live_landing: true).size + 1, review_params[:order_no].to_i)
      elsif !review_params[:order_no]
        update_order_nos(review.id, review.order_no, Review.where(is_live_landing: true).size + 1)

        review.order_no = nil
        review.save
      else
        update_order_nos(review.id, review.order_no, review_params[:order_no].to_i)
      end
    end
  end
end
