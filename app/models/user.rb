class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :restaurants, dependent: :destroy

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :notion, presence: true
  validates :introduction, length: { maximum: 250 }

  enum generation: { not_select: 0, twenties: 1, thirties: 2, forties: 3, fifties: 4, over_sixties: 5 }
end
