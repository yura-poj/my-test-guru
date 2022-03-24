class TestPassagesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_test_passage, only: %i[show result update gist result_if_test_is_completed]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_passage_not_found


  def show
    @user = current_user
  end

  def result
    @earned_badges = Badge.earned_badges(@test_passage)
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    if result.presence
      current_user.gists.create(question: @test_passage.current_question, gist_id: result[:id])
      flash_options = { notice: t('.success', go: view_context.link_to(t('.link_to_gist'), result[:html_url]))}
    else
      flash_options = { alert: t('.failure')}
    end
    redirect_to @test_passage, flash_options
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    result_if_test_is_completed
  end

  def result_if_test_is_completed
    @test_passage.completed? ? test_completed : ( render :show)
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def test_completed
    TestsMailer.completed_test(@test_passage).deliver_now
    redirect_to result_test_passage_url(@test_passage)
  end

  def rescue_with_test_passage_not_found
    render plain: 'Test passage was not found'
  end
end
