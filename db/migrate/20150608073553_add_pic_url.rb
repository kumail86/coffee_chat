class AddPicUrl < ActiveRecord::Migration
  def change
    add_column :users, :pic_url, :string
  end
end
