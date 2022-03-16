class Admin::BadgesController < Admin::BaseController
  before_action :authenticate_user!

  before_action :set_badge, only: %i[show update edit destroy]

  def show
  end

  def index
    @badges = Badge.all
    @earned_badges = current_user.badges
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to admin_badge_path(@badge), notice: t('.success')
    else
      render :new
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

  def badge_params
    params.require(:badge).permit(:title, :action_type, :object_id)
  end
  
end
