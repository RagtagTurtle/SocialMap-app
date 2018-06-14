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
  end
end
