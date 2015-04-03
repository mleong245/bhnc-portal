class AddDetailsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :location, :string, :required => true
    add_column :events, :start, :datetime, :required => true
    add_column :events, :end, :datetime, :required => true
  end
end
