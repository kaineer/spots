require 'rubygems'
require 'sinatra'

require 'haml'

$:.unshift( File.dirname( __FILE__ ) )
set :public, File.join( File.dirname( __FILE__ ), "../public" )

require 'models'

Models.startup

get '/' do
  @spots = Spot.all
  @spot = Spot.new
  haml :spots
end

post %r{^/spot/update/?(\d+)?} do |spot_id|
  if spot_id
    @spot = Spot.first( :id => spot_id )
    @spot.update( params[ :spot ] )
  else
    Spot.create( params[ :spot ] )
  end

  redirect "/"
end

get "/ajax/spot/edit/:spot_id" do
  @spot = Spot.first( :id => params[ :spot_id ] )
  haml :form, :layout => false
end
