class AddUserProfileSettings < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :company, :string
    add_column :users, :position, :string
    add_column :users, :phone_number, :string
    add_column :users, :location, :string
    add_column :users, :networking_status, :boolean
  end
end
