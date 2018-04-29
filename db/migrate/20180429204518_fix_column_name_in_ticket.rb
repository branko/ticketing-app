class FixColumnNameInTicket < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :creator, :creator_id
  end
end
