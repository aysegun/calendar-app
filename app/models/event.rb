class Event < ApplicationRecord
  validates :title, presence: true
  # validates :end_time, numericality: true
end
