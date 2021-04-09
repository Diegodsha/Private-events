class Event < ApplicationRecord
  belongs_to :creator, foreign_key: :creator_id, class_name: 'User'
  has_and_belongs_to_many :attendees, join_table: 'users_events', class_name: 'User'

  validates :name, presence: true, length: { minimum: 2 }
  validates :description, presence: true, length: { maximum: 35 }

  scope :past, -> { where('date < ?', Time.now) }
  scope :upcoming, -> { where('date >= ?', Time.now) }
end
