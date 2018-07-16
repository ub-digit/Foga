Rails.application.routes.draw do
  

#get 'operations/index'


get 'post_infos/latest'
get 'post_infos/search'

resources :post_infos
resources :operations

 # These routes will be for signup. The first renders a form in the browse, the second will 
 # receive the form and create a user in our database using the data given to us by the user.
 get '/signup' => 'users#new'
 post '/users' => 'users#create'
 get '/allusers' => 'users#show'
 

 # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  #get '/help' => 'help#new'
  #get '/show_help' => 'help#show'
  resources :help_infos


root 'post_infos#search'
#'post_infos#index'


end
