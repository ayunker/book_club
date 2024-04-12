class AddSlugToMeetings < ActiveRecord::Migration[7.0]
  def change
    add_column :meetings, :slug, :string
    add_index :meetings, :slug, unique: true
  end
end
