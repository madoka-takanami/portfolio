class Restaurant < ApplicationRecord
  belongs_to :user

  validates :rst_name, presence: true
  validates :memo, length: { maximum: 300 }

  enum rst_type: { lunch: 0, cafe: 1, noodle: 2, dinner: 3, kannpai: 4 }
end
