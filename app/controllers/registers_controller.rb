# frozen_string_literal: true

# For the registration of user interest
class RegistersController < ApplicationController
  before_action :set_register, only: %i[show edit update destroy]

  # GET /registers
  def index
    @registers = Register.all
  end

  # GET /registers/1
  def show; end

  # GET /registers/new
  def new
    @register = Register.new
  end

  # GET /registers/1/edit
  def edit; end

  # POST /registers
  def create
    @register = Register.new(register_params)

    if @register.save
      redirect_to @register, notice: 'Register was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /registers/1
  def update
    if @register.update(register_params)
      redirect_to @register, notice: 'Register was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /registers/1
  def destroy
    @register.destroy
    redirect_to registers_url, notice: 'Register was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_register
    @register = Register.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def register_params
    params.require(:register).permit(:email, :option)
  end
end
