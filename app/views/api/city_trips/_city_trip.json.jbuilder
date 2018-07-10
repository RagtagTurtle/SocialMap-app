json.id city_trip.id
json.city_id city_trip.city_id
json.trip_id city_trip.trip_id

json.city do
  if city_trip.city
    json.partial! city_trip.city, partial: "api/cities/city", as: :city
  else
    {}
  end
end
