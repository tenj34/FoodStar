class UsersController < ApplicationController
  get '/signup' do
    erb :'users/create_user'
  end

  post '/signup' do
    user = User.new(params)
  end

  get '/login' do
    erb :'users/login'
  end

end
