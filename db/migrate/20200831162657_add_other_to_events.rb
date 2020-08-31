class AddOtherToEvents < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :user, foreign_key: true
    add_column :events, :sport, :string
    add_column :events, :date, :date
    add_column :events, :start_time, :time
    add_column :events, :end_time, :time
    add_column :events, :location, :string
    add_column :events, :address, :string
    add_column :events, :longitude, :float
    add_column :events, :latitude, :float
  end
end
