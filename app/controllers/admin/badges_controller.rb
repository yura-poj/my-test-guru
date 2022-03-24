class Admin::BadgesController < Admin::BaseController
  before_action :authenticate_user!

  before_action :set_badges, only: %i[index destroy]
  before_action :set_badge, only: %i[show update edit destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_badge_not_found


  def show
  end

  def index
    @earned_badges = current_user.badges
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to admin_categories_path, notice: t('.success')
    else
      redirect_back fallback_location: admin_categories_path
    end
  end

  def edit
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badge_path(@badge)
    else
      render :edit
    end
  end

  def destroy
    EarnedBadge.where(badge: @badge).each { |earned_badge| earned_badge.destroy }
    @badge.destroy

    render :index
  end
  
  private
  
  def set_badge
    @badge = Badge.find(params[:id])
  end

  def set_badges
    @badges = Badge.all
  end

  def badge_params
    params.require(:badge).permit(:title, :action_type, :category_id, :test_id, :image_url)
  end

  def rescue_with_badge_not_found
    render plain: 'Badge was not found'
  end
  
end
