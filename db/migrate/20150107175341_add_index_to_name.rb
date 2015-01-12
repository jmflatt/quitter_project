class AddIndexToName < ActiveRecord::Migration
  def change
    add_index :quitters, :name, unique: true
  end
end