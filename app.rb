require 'sinatra/base'
require './lib/bookmarks'
require_relative './database_connection_setup'
require 'uri'
require 'sinatra/flash'
require_relative './lib/comment'

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

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

  get '/bookmarks/:id/comments/new' do
    @bookmark_id = params[:id]
    erb :'comments/new'
  end

  post '/bookmarks' do
    flash[:notice] = "Please submit a valid URL" unless Bookmarks.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  post '/bookmarks/:id/comments' do
    Comment.create(bookmark_id: params[:id], text: params[:comment])
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