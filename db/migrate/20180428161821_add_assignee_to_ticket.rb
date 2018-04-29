class AddAssigneeToTicket < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :assignee, :integer
  end
end
