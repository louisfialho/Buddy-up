class AddOtherToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :language, :string
    add_column :users, :favorite_sport, :string
    add_column :users, :description, :string
    add_column :users, :skill_level, :integer
  end
end
