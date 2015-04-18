class CreateVolunteerApplications < ActiveRecord::Migration
  def change
    create_table :volunteer_applications do |t|
   	  t.integer :user_id,					 null: false
   	  t.string :name,						 null: false
   	  t.boolean :approved, 					 null: false, default: false
   	  t.string :street_address,              null: false
      t.string :city, 						 null: false
      t.string :zip_code,					 null: false
      t.string :phone,				 		 null: false
      t.string :company,					 null: false
 
      t.timestamps null: false
    end
  end
end
