class AddTotalHoursColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :total_hours, :decimal, default: 0, precision: 10, scale: 2
  end
end
