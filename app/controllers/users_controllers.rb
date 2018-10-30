require 'rack-flash'

class UsersController < ApplicationController
  use Rack::Flash

  get '/signup' do
    erb :'users/create_user'
  end

  post '/signup' do
    user = User.new(params)
    user.save
    session[:user_id] = user.id

    flash[:message] = "Welcome #{user.username}"

    redirect "/reviews"

  end

  get '/login' do
    erb :'users/login'
  end

  get '/reviews' do
    erb :'users/reviews'
  end

end
