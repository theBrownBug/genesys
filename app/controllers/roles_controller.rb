class RolesController < ApplicationController
  before_action only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
  end

  # GET /users/1/roles
  def show
    @role = Role.find(params[:id])
  end



  # GET /users/new
  def new
    @user = User.new
  end

end