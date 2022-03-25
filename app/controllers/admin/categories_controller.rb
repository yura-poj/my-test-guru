class Admin::CategoriesController < Admin::BaseController
  before_action :authenticate_user!
  before_action :set_category, only: %i[destroy new_badge]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_answer_not_found

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path
  end

  def index
    @categories = Category.all
  end

  def new_badge
    @badge = Badge.new
  end

  private

  def rescue_with_category_not_found
    render plain: 'category was not found'
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title)
  end
end
