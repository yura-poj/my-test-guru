class TestsController < ApplicationController

  before_action :find_test, only: %i[show update edit destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def show
    @questions = @test.questions.includes(answers: :user)
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def edit
  end

  def index
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def destroy
    @test.destroy
    render :index
  end

  private

  def rescue_with_test_not_found
    render plain: 'Test was not found'
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end
end
