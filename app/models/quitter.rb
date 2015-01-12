class Quitter < ActiveRecord::Base


validates :name, presence: true, length: {maximum: 50}
validates :start_date, presence: true, length: {maximum: 50}

validates_each :start_date do |record, attr, value|
  begin
    Date.parse(value)
  rescue
    record.errors.add(attr, "Invalid date")
  end
end

validates :times_per_week, presence: true, length: {maximum: 2}, numericality: { greater_than: 0}
validates :cost_per_pack, presence: true, length: {maximum: 10}, numericality: { greater_than: 0}  
  


end