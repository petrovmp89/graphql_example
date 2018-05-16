class Message < ApplicationRecord
  belongs_to :channel
  validates_presence_of :channel_id, :text
end
