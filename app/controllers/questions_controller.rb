# frozen_string_literal: true

class QuestionsController < ApplicationController
  load_and_authorize_resource
  before_action :set_question, only: %i[show edit update destroy]

  # GET /questions
  def index
    @questions = Question.all
  end

  # GET /questions/1
  def show; end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit; end

  # POST /questions
  def create
    @question = Question.new(question_params)
    @question.is_live = false # by default the question wont be live, because a new question does not have an associated answer
    @question.popularity = 0
    if @question.save
      if can? :edit, Question
        redirect_to questions_path, notice: 'Question created.'
      else
        redirect_to questions_path, notice: 'Your question has been successfully submitted. We will update the FAQs soon.'
      end
    else
      render :new
    end
  end

  # PATCH/PUT /questions/1
  def update
    @question.is_live = false unless @question.get_answer

    if @question.update(question_params)
      redirect_to @question, notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /questions/1
  def destroy
    @question.destroy
    redirect_to questions_url, notice: 'Question was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def question_params
    params.require(:question).permit(:question, :is_live, :popularity)
  end
end
