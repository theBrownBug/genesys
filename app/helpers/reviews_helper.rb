# frozen_string_literal: true

# rubocop:disable Metrics/AbcSize
module ReviewsHelper
  def ratings_metrics(ratings, reviews_count)
    ratings_metrics = ratings.map { |rating, count| [rating, rating_metrics(rating, count, reviews_count)] }.to_h
    ratings_metrics[:average] = (ratings.map { |rating, count| rating.to_i * count }.sum.to_f / reviews_count).round(2)

    ratings_metrics
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

        Rails.logger.debug review.order_no
      end
    end
  end

  private

  def rating_metrics(rating, count, reviews_count)
    { count: count,
      rating_percentage: ((count.to_f / reviews_count) * 100).round(0),
      color: RATING_COLOR[rating] }
  end
end
# rubocop:enable Metrics/AbcSize
