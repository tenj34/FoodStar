class ItemsController < ApplicationController
  get '/new' do
    erb :'reviews/new'
  end

  post '/reviews' do
    if params["item"] != ""
      redirect '/reviews'
    else
      redirect '/new'
    end
  end
end
