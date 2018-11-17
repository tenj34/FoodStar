require 'rack-flash'

class UsersController < ApplicationController
  use Rack::Flash

  get '/signup' do
    if !logged_in?
      erb :'users/create_user'
    else
      redirect to '/show'
    end
  end

  post '/signup' do
    @user = User.new(:username => params[:username], :password => params[:password], :email => params[:email])

    if @user.save
      session[:user_id] = @traveler.id
      redirect to '/show'
    else
      erb '/signup'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'/users/login'
    else
      redirect to '/show'
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/show'
    else
      redirect to 'signup'
    end
  end

  

end
