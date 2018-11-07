class ReviewsController < ApplicationController
  get '/new' do
    erb :'reviews/new'
  end

  post '/reviews' do
    if params["review"] !=""
      @review = current_user.reviews.create(review: params[:review])
      redirect '/reviews'
    else
      redirect '/new'
    end
  end
end
