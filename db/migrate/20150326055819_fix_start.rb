class FixStart < ActiveRecord::Migration
  def change
    rename_column :events, :start, :starts_at
  end
end