require('sinatra')
require('sinatra/contrib/all')
require( 'pry-byebug' )

require_relative('models/album')
require_relative('models/artist')

get '/' do
  @artists = Artist.all()
  @albums = Album.all()
  erb(:library)
end

post '/artist/new' do 
  @artist = Artist.new(params)
  @artist.save() 
  redirect(to('/'))
end

post '/album/new' do
  @album = Album.new(params)
  @album.save
  redirect(to('/'))
end

get '/instructions' do
  erb(:instructions)
end