class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get "/recipe/new" do
    erb :new
  end

  post "/recipe" do
    recipe= Recipe.new(params)
    recipe.save
    erb :create
    redirect "/recipe/#{recipe.id}"
  end

  get "/recipe/:id" do
    @recipe=Recipe.find(params[:id])
    erb :show
  end

  get "/recipe/:id/edit" do
    @recipe=Recipe.find(params[:id])
    erb :edit
  end

  patch "/recipe/:id" do
    @recipe=Recipe.find(params[:id])
    @recipe.update(name:params[:name],ingredients:params[:ingredients],cook_time:params[:cook_time])
    redirect "/recipe/#{recipe.id}"
  end

  get "/recipe" do
    @recipe=Recipe.all
    erb :index
  end

  get "/recipe/:id/delete" do
    @recipe=Recipe.find(params[:id])
    erb :delete
  end

  delete "/recipe/:id" do
    @recipe=Recipe.find(params[:id])
    @recipe.delete
    redirect "/recipe"

  end





end
