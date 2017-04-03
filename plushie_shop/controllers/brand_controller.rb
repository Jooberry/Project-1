require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/plushie')
require_relative('../models/brand')

get  '/brands' do
  @brands = Brand.all()
  erb(:"brands/index")
end

get '/brands/new' do
  @plushies = Plushie.all()
  erb(:"brands/new")
end

post '/brands' do
  @brand = Brand.new(params)
  @brand.save()
  redirect to '/brands'
end

get '/brands/:id' do
  @brand = Brand.find(params[:id])
  erb(:"brands/show")
end

post '/brands/:id/delete' do
  @brand = Brand.find(params[:id])
  @brand.delete()
  redirect to '/brands'
end

get '/brands/:id/edit' do
  @brand = Brand.find(params[:id])
  @plushies = Plushie.all()
  erb(:"brands/edit")
end

post '/brands/:id' do 
  @brand = Brand.new(params)
  @brand.update
  erb(:"brands/show")
end
