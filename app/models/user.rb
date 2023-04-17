class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_one :user_detail
         has_many :channel_users
         has_many :channels, through: :channel_users
         accepts_nested_attributes_for :user_detail  #子として扱うものを追記。複数記述可。
end
