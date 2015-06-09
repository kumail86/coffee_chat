class ChangeAcceptedType < ActiveRecord::Migration
  def change
    change_column :meetings, :accepted, :string
    rename_column :meetings, :accepted, :meeting_status
  end
end
