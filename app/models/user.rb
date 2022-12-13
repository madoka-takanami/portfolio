class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :restaurants, dependent: :destroy
  has_many :active_relationship, class_name: 'Relationship', foreign_key: 'following_id', dependent: :destroy
  has_many :following, through: :active_relationship, source: :followed
  has_many :passive_relationship, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :followed, through: :passive_relationships, source: :following
  has_many :visits, dependent: :destroy
  has_many :visited_rst, through: :visits, source: :restaurant
  has_many :spots, dependent: :destroy

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :notion, presence: true
  validates :introduction, length: { maximum: 250 }

  enum generation: { not_select: 0, twenties: 1, thirties: 2, forties: 3, fifties: 4, over_sixties: 5 }

  def own?(object)
    id == object.user_id
  end

  def follow(user_id)
    active_relationship.build(followed_id: user_id)
  end
# この中からあることを探す↓
  def unfollow(user_id)
    follow = self.active_relationship.find_by(user_id)
    follow.destroy
  end
# 直接値をとりに行く↓
  def following?(user_id)
    following.include?(user_id)
  end

  def visit(restaurant)
    visited_rst << restaurant
  end

  def unvisited(restaurant)
    visited_rst.delete(restaurant)
  end

  def visited?(restaurant)
    visited_rst.include?(restaurant)
  end
end
