class Comment < ApplicationRecord
  belongs_to :ticket

  validates_presence_of :creator_id, :body

  def creator
    User.find_by id: self.creator_id
  end

  def ticket
    Ticket.find_by id: self.ticket_id
  end
end