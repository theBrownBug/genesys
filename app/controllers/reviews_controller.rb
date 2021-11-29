# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update destroy]

  def index
    @reviews = Review.all.order(created_at: :desc)

    ratings = Review.order(rating: :desc).group(:rating).count
    @ratings_metrics = ratings_metrics(ratings)
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
      redirect_to @review, notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /reviews/1
  def update
    if @review.update(review_params)
      redirect_to reviews_url, notice: "Review ##{@review.id} has been updated!"
    else
      render :edit
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
    params.require(:review).permit(:title, :body, :rating, :likes, :dislikes, :is_live)
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
end
