module BadgesHelper

  def target_column(badge:)
    target = {category: badge.category&.title, test: badge.test&.title, level: badge.test&.level}
    target[badge.action_type.to_sym]
  end
end
