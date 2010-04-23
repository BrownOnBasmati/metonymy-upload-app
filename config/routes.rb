ActionController::Routing::Routes.draw do |map|
  map.resources :artists
  map.resources :images
  map.resources :editions

  #map.resources :artists, :has_many => [:images, :editions]
  #map.resources :images, :has_many => [:artists, :editions]
  #map.resources :editions, :belongs_to => [:artist, :image]

  map.resources :artists do |artists|
      artists.resources :images
      artists.resources :editions
  end

  map.connect "artists/:artist_id/images/new/:id", :controller => "images", :action => "new"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
