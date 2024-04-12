class EnforceNotNullMeetingSlug < ActiveRecord::Migration[7.0]
  def change
    change_column_null :meetings, :slug, false
  end
end
