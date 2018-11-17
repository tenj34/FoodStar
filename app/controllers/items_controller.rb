class ItemsController < ApplicationController

  get '/show' do
    if logged_in?
      @reviews  = Review.all
      erb :'reviews/show'
    else
      flash[:notice] = "Please log in first"
      redirect to '/login'
   end
  end
end
