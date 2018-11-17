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

  get '/reviews/new' do
    if logged_in?
      erb :'reviews/create_review'
    else
      redirect to '/login'
    end
  end

end
