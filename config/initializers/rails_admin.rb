RailsAdmin.config do |config|
  config.authorize_with :cancan
  config.current_user_method { current_user }
end

RailsAdmin.config do |config|
  config.model 'Event' do
    edit do
      field :name do
        required true
      end
      field :location do
        required true
      end
      field :description
      field :starts_at do
        required true
      end
      field :end do
        required true
      end
    end
  end
end
