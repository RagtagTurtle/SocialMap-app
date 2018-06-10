Rails.application.routes.draw do

  post "/users" => "users#create"

  namespace :api do
    get '/trips' => 'trips#index'
    post '/trips' => 'trips#create'
    get '/trips/:id' => 'trips#show'
  end
end
