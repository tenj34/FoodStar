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

  post '/show' do
    @review = current_user.reviews.build(params)

    if @review.save
      redirect to "reviews/#{@review.id}"
    else
      erb :'reviews/create_review'
    end
  end

  

end
