# frozen_string_literal: true

class ReviewsController < ApplicationController
  load_and_authorize_resource

  def index
    @reviews = Review.all.order(created_at: :desc)
    @reviews_live_landing = @reviews.where(is_live_landing: true)

    ratings = Review.order(rating: :desc).group(:rating).count

    @ratings_metrics = helpers.ratings_metrics(ratings, @reviews.count)

    @review = Review.new
  end

  # POST /reviews
  def create
    @review = Review.new(review_params)

    if @review.save
      redirect_to reviews_url, notice: 'Thank you - your review was successfully created! '
    else
      redirect_to reviews_url, notice: 'Review could not be created at this time.'
    end
  end

  # PATCH/PUT /reviews/1
  def update
    if can? :update, Review, :all
      helpers.check_if_order_no_updated(@review, review_params)
      redirect_to reviews_url, notice: "Review ##{@review.id} has been updated!" if @review.update(review_params)
    elsif (can? :update, Review, :likes) && @review.update(review_params_likes)
      render json: @review
    else
      redirect_to reviews_url, notice: 'Review failed to update.'
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :rating, :likes, :dislikes, :is_live, :is_live_landing, :order_no)
  end

  def review_params_likes
    params.require(:review).permit(:likes)
  end
end
