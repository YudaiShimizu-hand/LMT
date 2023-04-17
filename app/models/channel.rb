class Channel < ApplicationRecord

    validates :name, presence: true, uniqueness: true

    has_many :channel_users
    has_many :users, through: :channel_users
    has_many :channel_posts

    accepts_nested_attributes_for :channel_users
end
