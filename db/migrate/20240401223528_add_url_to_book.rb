class AddUrlToBook < ActiveRecord::Migration[7.0]
  def change
    remove_column :books, :description, :string
    add_column :books, :url, :string, null: false, default: ""
  end
end
