class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id
  has_and_belongs_to_many :attended_events, join_table: 'users_events', class_name: 'Event'

  validates :name, presence: true
end
