class BadgesController < ApplicationController
  before_action :set_badges, only: %i[index]
  before_action :set_badge, only: %i[show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_badge_not_found

  def show
  end

  def index
    @earned_badges = current_user.badges
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def set_badges
    @badges = Badge.all
  end

  def rescue_with_badge_not_found
    render plain: 'Badge was not found'
  end
end
