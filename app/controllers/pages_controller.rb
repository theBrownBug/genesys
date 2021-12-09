# frozen_string_literal: true

class PagesController < ApplicationController
  skip_authorization_check

  def home
    @current_nav_identifier = :home
    U = User.create(first_name: "all", last_name: "all", email: "test@gmail.com", password: "password", user_type: 0,role_ids: [1,2,3])

    @reviews = Review.where(is_live_landing: true)
  end
end
