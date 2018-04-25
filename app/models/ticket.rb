class Ticket < ApplicationRecord
  has_many :ticket_tags, dependent: :destroy
  has_many :tags, through: :ticket_tags

  belongs_to :project
  validates_presence_of :name, :status, :body
end