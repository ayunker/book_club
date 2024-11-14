class AddLockedAtToMeeting < ActiveRecord::Migration[8.0]
  def change
    add_column :meetings, :locked_at, :datetime
  end
end
