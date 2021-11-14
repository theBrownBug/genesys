# frozen_string_literal: true

class ErrorsController < ApplicationController
  skip_before_action :ie_warning
  skip_before_action :verify_authenticity_token, only: [:error422]
  skip_authorization_check

  def error403; end

  def error404; end

  def error422; end

  def error500
    render
  rescue StandardError
    render layout: 'plain_error'
  end

  def ie_warning; end
end
