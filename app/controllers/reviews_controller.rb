class ReviewsController < ApplicationController
  get '/new' do
    erb :'items/new'
  end
end
