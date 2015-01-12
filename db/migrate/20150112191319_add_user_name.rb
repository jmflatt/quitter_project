class AddUserName < ActiveRecord::Migration
  def change
      add_column :quitters, :user_name, :string
      add_index :quitters, :user_name, unique: true
  end
end
