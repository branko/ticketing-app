class Tag < ApplicationRecord
  has_many :ticket_tags
  has_many :tickets, through: :ticket_tags

  validates_presence_of :name
end
