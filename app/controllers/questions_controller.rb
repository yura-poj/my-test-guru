class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index]
  before_action :find_question, only: %i[show delete]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show
    id = params[:id]
    render plain: @question.inspect
  end

  def index
    render plain: @test.questions.inspect
  end

  def new;end

  def create
    question = Question.create(test_params)

    render plain: question.inspect
  end

  def destroy
    @question.destroy
  end

  private

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[id])
  end

  def test_params
    params.require(:question).permit(:body, :test_id)
  end
end
