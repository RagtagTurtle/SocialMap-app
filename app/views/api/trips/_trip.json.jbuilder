json.id trip.id
json.user_first_name trip.user.first_name
json.user_last_name trip.user.last_name
json.bio trip.bio
json.cover_image trip.cover_image
json.climate trip.climate
json.start_date trip.friendly_start_date
json.end_date trip.friendly_end_date

json.name trip.name
json.state_name trip.state_name
json.latitude trip.latitude
json.longitude trip.longitude
json.city_id trip.city_integer
json.last_created_trip trip.last_created_trip

json.city_trips do
  json.array! trip.city_trips, partial: "api/city_trips/city_trip", as: :city_trip
end

json.recommendations do
  json.array! trip.recommendations, partial: "api/recommendations/recommendation", as: :recommendation
end

json.trip_vibes do
  json.array! trip.trip_vibes, partial: "api/trip_vibes/trip_vibe", as: :trip_vibe
end

json.trip_activities do
  json.array! trip.trip_activities, partial: "api/trip_activities/trip_activity", as: :trip_activity
end

