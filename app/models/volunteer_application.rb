class VolunteerApplication < ActiveRecord::Base
	after_save :volunteer_status

  validates_formatting_of :zip_code, :using => :us_zip, :allow_blank => true
  validates_formatting_of :phone, :using => :us_phone, :allow_blank => true
  validates_formatting_of :street_address, :using => :address, :allow_blank => true

	def volunteer_status
		if self.approved
			@user = User.find_by_id(self.user_id) 
			@user.volunteer = true
			@user.save!
		end
	end
end
