class Project < ApplicationRecord
  has_many :tickets, dependent: :destroy
  validates_presence_of :name, :description
end