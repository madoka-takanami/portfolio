class Restaurant < ApplicationRecord
  belongs_to :user

  validates :rst_name, presence: true
  validates :memo, length: {maximum: 300}
end
