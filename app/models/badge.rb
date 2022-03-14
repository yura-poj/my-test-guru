class Badge < ApplicationRecord
  has_many :earned_badges
  has_many :users, through: :earned_badges

  # action type:
  # 1 is badge for completing test with one try
  # 2 is badge for completing all test with some category
  # 3 is badge for completing all test with some level
  enum action_type: { test: 1, category: 2, level: 3 }

  def self.earned_badges(test_passage)
    @badges = []
    @test_passage = test_passage
    @test = @test_passage.test
    check_badge_test
    check_badge_category
    check_badge_level
    return @badges
  end

  private

  def self.check_badge_test
    badge = Badge.find_by(action_type: :test, object_id: @test.id)
    push_badge(badge: badge) if badge and test_with_one_try?
  end

  def self.check_badge_category
    badge = Badge.find_by(action_type: :category, object_id: @test.category.id)
    push_badge(badge: badge) if badge and all_test_in_category_done?
  end

  def self.check_badge_level
    badge = Badge.find_by(action_type: :level, object_id: @test.level)
    push_badge(badge: badge) if badge and test_with_one_try?
  end

  def self.push_badge(badge:)
    current_user.push(badge)
    @badges.push(badge)
  end

  def self.test_with_one_try?
    TestPassage.where(user: current_user, test: @test).length == 1 and @test_passage.success?
  end

  def self.all_test_in_category_done?
    Test.where(category: @test.category).all? { |test| test_success?(test: test) }
  end

  def self.all_test_in_level_done?
    Test.where(level: @test.level).all? { |test| test_success?(test: test) }
  end

  def self.test_success?(test:)
    TestPassage.where(user: current_user, test: test).any? { |test_passage| test_passage.success? }
  end
end
