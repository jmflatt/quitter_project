class CreateQuitterRows < ActiveRecord::Migration
  def change
    add_column :quitters, :name, :string
    add_column :quitters, :start_date, :string
    add_column :quitters, :times_per_week, :string
    add_column :quitters, :cost_per_pack, :string
  end
end
