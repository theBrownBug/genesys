# frozen_string_literal: true
module ReviewsHelper
  def ratings_metrics(ratings, reviews_count)
    ratings_metrics = ratings.map { |rating, count| [rating, rating_metrics(rating, count, reviews_count)] }.to_h
    ratings_metrics[:average] = (ratings.map { |rating, count| rating.to_i * count }.sum.to_f / reviews_count).round(2)

    ratings_metrics
  end

  def review_params_create
    params.require(:review).permit(:title, :body, :rating, :likes, :dislikes, :is_live, :is_live_landing)
  end

  def review_params_update
    params.require(:review).permit(:likes, :is_live, :is_live_landing)
  end

  private

  def rating_metrics(rating, count, reviews_count)
    { count: count,
      rating_percentage: ((count.to_f / reviews_count) * 100).round(0),
      color: RATING_COLOR[rating] }
  end
end
