# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the sign_in page$/ then new_user_session_path
    when /^the sign_up page$/ then new_user_registration_path
    when /^the users page$/ then user_registration_path
    when /^the landing page$/ then '/'
    when /^the edit profile page/ then edit_user_registration_path
    when /^the volunteer sign up page/ then user_new_volunteer_path
    when /^the create new event page/ then '/admin/event/new'
    when /^the admin events page/ then '/admin/event'
    when /^the admin landing page/ then '/admin'

    #CHANGE THIS FOR VOLUNTEER AVAILABLE HOURS
    when /^the edit hours page/ then '/hours/'
    when /^the admin path for (.*)/ then "/admin/available_hour/#{$1}"
    when /^the space rental requests page/ then new_space_rental_request_path


    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))
    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
