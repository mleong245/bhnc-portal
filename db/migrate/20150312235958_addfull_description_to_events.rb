class AddfullDescriptionToEvents < ActiveRecord::Migration
  def change
    add_column :events, :full_description, :string
  end
end
