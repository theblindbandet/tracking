class CreateLoginRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :login_records do |t|
      t.date :date
      t.time :logged_in_at
      t.time :logged_out_at

      t.timestamps
    end
  end
end
