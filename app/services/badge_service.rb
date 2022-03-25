class BadgeService
  def initialize(test_passage:)
    @earned_badges = []
    @test_passage = test_passage
    @test = @test_passage.test
    @user = @test_passage.user
  end
  
  def earned_badges
    check_badge_test
    check_badge_category
    check_badge_level

    @earned_badges
  end

  private

  def check_badge_test
    badge = Badge.find_by(action_type: :test, test: @test)
    push_badge(badge: badge) if badge and test_with_one_try?
  end

  def check_badge_category
    badge = Badge.find_by(action_type: :category, category: @test.category)
    push_badge(badge: badge) if badge and all_test_in_category_done?
  end

  def check_badge_level
    badge = Badge.find_by(action_type: :level, test: @test)
    push_badge(badge: badge) if badge and all_test_in_level_done?
  end

  def push_badge(badge:)
    @user.badges.push(badge)
    @earned_badges << badge
  end

  def test_with_one_try?
    TestPassage.where(user: @user, test: @test).length == 1 and @test_passage.success?
  end

  def all_test_in_category_done?
    Test.where(category: @test.category).all? { |test| test_success?(test: test) }
  end

  def all_test_in_level_done?
    Test.where(level: @test.level).all? { |test| test_success?(test: test) }
  end

  def test_success?(test:)
    TestPassage.where(user: @user, test: test).any? { |test_passage| test_passage.success? }
  end
end
