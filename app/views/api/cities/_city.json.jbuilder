json.id city.id
json.name city.name
json.state city.state
json.geography city.geography
json.region city.region
json.latitude city.latitude
json.longitude city.longitude
json.bio city.bio
json.cover_image city.cover_image
json.short_bio city.short_bio

json.recommendations do
  json.array! city.recommendations, partial: "api/recommendations/recommendation", as: :recommendation
end
