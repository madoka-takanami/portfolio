class Restaurant < ApplicationRecord
  belongs_to :user

  validates :rst_name, presence: true
  validates :memo, length: { maximum: 300 }

  enum rst_type: { default: 0, lunch: 1, cafe: 2, noodle: 3, dinner: 4, kannpai: 5 }
end
