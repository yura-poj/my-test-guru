class TestPassagesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_test_passage, only: %i[show result update gist]

  def show
    @user = current_user
  end

  def result; end

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

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
