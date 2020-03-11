require 'sinatra/base'
require './lib/bookmarks'
require './database_connection_setup.rb'

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    redirect '/bookmarks'
  end 

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmarks.find(id: params[:id])
    erb :'bookmarks/edit'
  end

  post '/bookmarks' do
    Bookmarks.create(url: params[:url])
    redirect '/bookmarks'
  end

  post '/bookmarks/new' do
    Bookmarks.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmarks.delete(id: params[:id])
    redirect '/bookmarks'
  end

  patch '/bookmarks/:id' do
    Bookmarks.update(id: params[:id], title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

run! if app_file == $0 
end