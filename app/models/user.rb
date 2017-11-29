class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]

  has_many :notes, dependent: :destroy
  has_many :likes

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

  def liked?(note)
    likes.exists?(note_id: note.id)
  end


  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    # If you are using confirmable and the provider(s) you use validate emails,
    # uncomment the line below to skip the confirmation emails.
    # user.skip_confirmation!
  end
end

end
