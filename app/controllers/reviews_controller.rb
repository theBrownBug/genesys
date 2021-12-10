# frozen_string_literal: true
class ReviewsController < ApplicationController
  load_and_authorize_resource

  def index
    @reviews = Review.all.order(created_at: :desc)

    ratings = Review.order(rating: :desc).group(:rating).count

    @ratings_metrics = helpers.ratings_metrics(ratings, @reviews.count)

    @review = Review.new
  end

  # POST /reviews
  def create
    @review = Review.new(review_params)
    @review.is_live = false if @review.is_live.nil?

    if @review.save
      redirect_to reviews_url, notice: 'Thank you - your review was successfully created! '
    else
      redirect_to reviews_url, notice: 'Review could not be created at this time.'
    end
  end

  # PATCH/PUT /reviews/1
  def update
    if @review.update(review_params) && (can? :update, Review, :all)
      redirect_to reviews_url, notice: "Review ##{@review.id} has been updated!"
    elsif @review.update(review_params) && (can? :update, Review, :likes)
      render json: @review
    else
      redirect_to reviews_url, notice: 'Review failed to update.'
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :rating, :likes, :dislikes, :is_live, :is_live_landing)
  end
end
