class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.integer :requestor_id
      t.integer :receiver_id
      t.boolean :accepted
      t.string :meeting_location_name
      t.string :meeting_location_address

      t.timestamps null: false
    end
  end
end
