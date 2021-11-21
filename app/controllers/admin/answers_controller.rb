class Admin::AnswersController < Admin::BaseController
  before_action :authenticate_user!

  before_action :find_question, only: %i[new create]
  before_action :set_answer, only: %i[show edit update destroy]

  # GET /answers or /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1 or /answers/1.json
  def show; end

  # GET /answers/new
  def new
    @answer = @question.answers.new
  end

  # GET /answers/1/edit
  def edit; end

  # POST /answers or /answers.json
  def create
    @answer = Answer.new(answer_params)

    if @answer.save
      redirect_to @answer
    else
      render :new
    end
  end

  # PATCH/PUT /answers/1 or /answers/1.json
  def update
    if @answer.update(answer_params)
      redirect_to @answer
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to @answer.question
  end

  private

  def find_question
    @question = Question.find(params[:question_id])
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(%i[body correct question_id])
  end
end
