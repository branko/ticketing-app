class CreateTicketTags < ActiveRecord::Migration[5.2]
  def change
    create_table :ticket_tags do |t|
      t.integer :ticket_id
      t.integer :tag_id
    end
  end
end
