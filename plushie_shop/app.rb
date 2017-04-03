require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/brand_controller')
require_relative('controllers/plushie_controller')

get '/' do
  erb( :index )
end