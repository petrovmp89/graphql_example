class Message < ApplicationRecord
  belongs_to :room
  validates_presence_of :room_id, :text
end
