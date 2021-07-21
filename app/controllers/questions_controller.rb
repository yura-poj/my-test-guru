class QuestionsController < ApplicationController

  def show
    test_id = params[:test_id]
    id = params[:id]
    render plain: Test.find(test_id).questions.find(id).inspect
  end

  def index
    render plain: Test.find(params[:test_id]).questions.inspect
  end
end
