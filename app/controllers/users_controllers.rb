require 'rack-flash'

class UsersController < ApplicationController
  use Rack::Flash

  get '/signup' do
    if logged_in?
      redirect to '/reviews'
    else
      erb :'users/create_user'
    end
  end

  post '/signup' do
    user = User.new(:username => params[:username], :password => params[:password], :email => params[:email])

    if user.save && user.username!= "" && user.email!="" && user.password!=""
      User.create(:username => params[:username], :password => params[:password], :email => params[:email])
      session[:user_id] = user.id
        redirect "/reviews"
      else
        redirect '/signup'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'/users/login'
    else
      redirect to '/tweets'
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to "/tweets"
    else
      redirect to "/signup"
    end
  end

  get '/reviews' do
    erb :'users/reviews'
  end

end
