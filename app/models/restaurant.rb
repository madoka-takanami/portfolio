class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :visits

  validates :rst_name, presence: true
  validates :memo, length: { maximum: 300 }

  enum rst_type: { default: 0, lunch: 1, cafe: 2, noodle: 3, dinner: 4, kannpai: 5 }

  def rst_icon
    return self.image.variant(resize: '30x30').processed
  end

end
