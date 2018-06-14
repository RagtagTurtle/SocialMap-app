json.id city.id
json.name city.name
json.state city.state
json.geography city.geography
json.region city.region

json.recommendations do
  json.array! city.recommendations, partial: "api/recommendations/recommendation", as: :recommendation
end