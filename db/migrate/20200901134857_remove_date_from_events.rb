class RemoveDateFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :date
  end
end
