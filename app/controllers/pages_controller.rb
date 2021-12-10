# frozen_string_literal: true

class PagesController < ApplicationController
  skip_authorization_check

  def home
    @current_nav_identifier = :home

    @reviews = Review.where(is_live_landing: true).order(order_no: :asc)
  end
end
