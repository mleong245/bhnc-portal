class Events < ActiveRecord::Base

    params.require(:event).permit(:Event_name, :Event_date, :Event_Description)
end

