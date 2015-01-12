class RemoveIndexFromName < ActiveRecord::Migration
  def change
    remove_index("quitters", :name)
  end
end
