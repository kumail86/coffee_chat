class ChangeTimeType < ActiveRecord::Migration
  def change
    change_column :meetings, :meeting_time, :string
  end
end
