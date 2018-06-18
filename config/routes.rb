Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  post "/users" => "users#create"

  namespace :api do
    get '/trips' => 'trips#index'
    post '/trips' => 'trips#create'
    get '/trips/:id' => 'trips#show'
    patch '/trips/:id' => 'trips#update'
    delete '/trips/:id' => 'trips#destroy'

    get '/city_trips' => 'city_trips#index'
    post '/city_trips' => 'city_trips#create'
    get '/city_trips/:id' => 'city_trips#show'
    patch '/city_trips/:id' => 'city_trips#update'
    delete '/city_trips/:id' => 'city_trips#destroy'

    get '/cities' => 'cities#index'
    post '/cities' => 'cities#create'
    get '/cities/:id' => 'cities#show'
    patch '/cities/:id' => 'cities#update'
    delete 'cities/:id' => 'cities#destroy'

    get '/recommendations' => 'recommendations#index'
    post '/recommendations' => 'recommendations#create'
    get '/recommendations/:id' => 'recommendations#show'
    patch '/recommendations/:id' => 'recommendations#update'
    delete '/recommendations/:id' => 'recommendations#destroy'

    get '/vibes' => 'vibes#index'
    post '/vibes' => 'vibes#create'
    get '/vibes/:id' => 'vibes#show'
    patch '/vibes/:id' => 'vibes#update'
    delete '/vibes/:id' => 'vibes#destroy'

    get '/trip_vibes' => 'trip_vibes#index'
    post '/trip_vibes' => 'trip_vibes#create'
    get '/trip_vibes/:id' => 'trip_vibes#show'
    patch '/trip_vibes/:id' => 'trip_vibes#update'
    delete '/trip_vibes/:id' => 'tip_vibes#destroy'

    get '/activities' => 'activities#index'
    post '/activities' => 'activities#create'
    get '/activities/:id' => 'activities#show'
    patch '/activities/:id' => 'activities#update'
    delete '/activities/:id' => 'activities#destroy'

    get '/trip_activities' => 'trip_activities#index'
    post '/trip_activities' => 'trip_activities#create'
    get '/trip_activities/:id' => 'trip_activities#show'
    patch '/trip_activities/:id' => 'trip_activities#update'
    delete '/trip_activities/:id' => 'trip_activities#destroy'
  end
end
