class Ticket < ApplicationRecord
  has_many :ticket_tags, dependent: :destroy
  has_many :tags, through: :ticket_tags
  has_many :comments, dependent: :destroy

  belongs_to :project
  validates_presence_of :name, :status, :body
end