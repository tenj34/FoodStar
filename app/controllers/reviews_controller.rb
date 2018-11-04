class ReviewsController < ApplicationController
  get '/new' do
    erb :'reviews/new'
  end
end
