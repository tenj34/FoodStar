class UsersController < ApplicationController
  get '/signup' do
    erb :'users/create_user'
  end

  post '/signup' do
    user = User.new(params)
    if user.save
      session[:user_id] = user.id

      flash[:message] = "Welcome #{user.username}"

      redirect "/reviews"
    end
    
  end

  get '/login' do
    erb :'users/login'
  end

end
