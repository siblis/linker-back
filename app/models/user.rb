class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :collections, dependent: :destroy
  acts_as_token_authenticatable

  def reset_authentication_token!
    update_column(:authentication_token, Devise.friendly_token)
  end
end
