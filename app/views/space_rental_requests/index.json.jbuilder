json.array!(@space_rental_requests) do |space_rental_request|
  json.extract! space_rental_request, :id, :location, :start, :end
  json.url space_rental_request_url(space_rental_request, format: :json)
end
