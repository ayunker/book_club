class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.references :book, null: false, foreign_key: true
      t.string :user_ref, null: false

      t.timestamps
    end
  end
end
