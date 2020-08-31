class AddOrganizerToEvents < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :organizer, null: false, foreign_key: { to_table: :users }
  end
end
