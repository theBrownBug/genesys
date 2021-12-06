class AnswersController < ApplicationController
  before_action :get_question
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers
  def index
    @answers = @question.answer
  end

  # GET /answers/1
  def show
  end

  # GET /answers/new
  def new
    @answer = @question.build_answer
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  def create
    @answer = @question.build_answer(answer_params)
    @answer.likes =0
    @answer.rating=0
    respond_to do |format|
      if @answer.save
        format.html { redirect_to question_path(@question), notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to question_answer_path(@question), notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /answers/1
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to question_answer_path(@question), notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = @question.answer
    end

    # Only allow a list of trusted parameters through.
    def answer_params
      params.require(:answer).permit(:answer, :rating, :likes, :question_id)
    end

    def get_question
      @question = Question.find(params[:question_id])
    end

end
