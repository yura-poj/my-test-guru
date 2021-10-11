class QuestionsController < ApplicationController

  before_action :set_test, only: %i[index new create]
  before_action :find_question, only: %i[show delete edit update destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def edit
    @test = @question.test
  end

  def index
    render plain: @test.questions.inspect
  end

  def new
    @question = Question.new(test_id: params[:test_id])
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def destroy
    @test = @question.test
    @question.destroy
    redirect_to @test
  end

  private

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end

  def set_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end
end
