class AddBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.string :description, null: false
      t.string :slug, null: false
      t.integer :votes, null: false, default: 0

      t.timestamps
    end
  end
end
