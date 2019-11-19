
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  post '/articles' do
    new_art = Article.create(params)
    redirect "/articles/#{new_art.id}"
  end

  patch '/articles/:id' do
    article = Article.find(params[:id])
    article.update("content" => params["content"], "title" => params["title"])
    redirect "/articles/#{article.id}"
  end

  delete '/articles/:id' do
    article = Article.find(params["id"])
    article.destroy
    redirect "/articles"
  end

 

end
