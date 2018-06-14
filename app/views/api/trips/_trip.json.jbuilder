json.id trip.id
json.user trip.user_id
json.climate trip.climate
json.start_date trip.start_date
json.end_date trip.end_date

json.cities do
  json.array! trip.cities, partial: "api/cities/city", as: :city  
end

json.city_trips do
  json.array! trip.city_trips, partial: "api/city_trips/city_trip", as: :city_trip
end

json.recommendations do
  json.array! trip.recommendations, partial: "api/recommendations/recommendation", as: :recommendation
end