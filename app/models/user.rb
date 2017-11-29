class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :notes, dependent: :destroy

  has_many :active_relationships, class_name: 'Following', foreign_key: :follower_id, dependent: :destroy
  has_many :leaders, through: :active_relationships

  has_many :passive_relationships, class_name: 'Following', foreign_key: :leader_id, dependent: :destroy
  has_many :followers, through: :passive_relationships

  def follow(other_user)
    leaders << other_user
  end

  def unfollow(other_user)
    leaders.delete(other_user)
  end

  def following?(other_user)
    leaders.include?(other_user)
  end

end
