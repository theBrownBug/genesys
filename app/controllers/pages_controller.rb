# frozen_string_literal: true

class PagesController < ApplicationController
  skip_authorization_check

  def home
    @current_nav_identifier = :home

    # get all reviews that are live
    @reviews = Review.where(is_live: true)
  end
end
