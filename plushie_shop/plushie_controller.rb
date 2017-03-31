require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/plushie')
require_relative('./models/brand')

get  '/plushies' do
  @plushies = Plushie.all()
  erb(:index)
end

get '/plushies/new' do
  @brands = Brand.all()
  erb(:new)
end

post '/plushies' do
  @plushie = Plushie.new(params)
  @plushie.save()
  erb(:create)
  redirect to '/plushies'
end

get '/plushies/:id' do
  @plushie = Plushie.find(params[:id])
  erb(:show)
end

post '/plushies/:id/delete' do
  @plushie = Plushie.find(params[:id])
  @plushie.delete()
  redirect to '/plushies'
end