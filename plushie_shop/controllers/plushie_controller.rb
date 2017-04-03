require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/plushie')
require_relative('../models/brand')

get  '/plushies' do
  @plushies = Plushie.all()
  erb(:"plushies/index")
end

get '/plushies/new' do
  @brands = Brand.all()
  erb(:"plushies/new")
end

post '/plushies' do
  @plushie = Plushie.new(params)
  @plushie.save()
  redirect to '/plushies'
end

get '/plushies/:id' do
  @plushie = Plushie.find(params[:id])
  erb(:"plushies/show")
end

post '/plushies/:id/delete' do
  @plushie = Plushie.find(params[:id])
  @plushie.delete()
  redirect to '/plushies'
end

get '/plushies/:id/edit' do
  @plushie = Plushie.find(params[:id])
  erb(:"plushies/edit")
end

post '/plushies/:id' do 
  @plushie = Plushie.new(params)
  @plushie.update
  erb(:"plushies/show")
end

binding.pry
nil