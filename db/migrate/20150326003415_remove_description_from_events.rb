class RemoveDescriptionFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :full_description, :string
    remove_column :events, :date, :datetime
  end
end
