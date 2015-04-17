class VolunteerApplication < ActiveRecord::Base
	after_save :volunteer_status

	def volunteer_status
		if self.approved
			@user = User.find_by_id(self.user_id) 
			@user.volunteer = true
			@user.save!
		end
	end
end
