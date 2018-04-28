class AddUserIdToTicket < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :creator, :integer
  end
end
