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
    user = User.new(params)
    if user.save
      session[:user_id] = user.id

        flash[:message] = "Welcome #{user.username}!"

        redirect "/reviews"
    elsif !logged_in?

        flash[:message] = "Your username, email, or password is missing. Please try again."

        redirect '/signup'
    end

    redirect "/reviews"

  end

  get '/login' do
    erb :'users/login'
  end

  get '/reviews' do
    erb :'users/reviews'
  end

end
