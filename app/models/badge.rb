class Badge < ApplicationRecord
  belongs_to :test, optional: true
  belongs_to :category, optional: true

  has_many :earned_badges
  has_many :users, through: :earned_badges

  # action type:
  # 1 is badge for completing test with one try
  # 2 is badge for completing all test with some category
  # 3 is badge for completing all test with some level
  enum action_type: { test: 1, category: 2, level: 3 }

  validates :title, presence: true,
                    uniqueness: { scope: :action_type, message: 'should be once per action type' }
  validate :reference_must_present

  def reference_must_present
    unless test_id.present? or category_id.present?
      errors.add(:category_id, :test_id, 'Category_id or test_id must present')
    end
  end
end
