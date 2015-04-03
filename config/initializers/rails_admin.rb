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
      field :start do
        required true
      end
      field :end do
        required true
      end
    end
  end
end
