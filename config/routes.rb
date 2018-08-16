Rails.application.routes.draw do
  



get 'latest', to: 'post_infos#latest', as: 'post_infos_latest'
get 'search', to: 'post_infos#search', as: 'post_infos_search'


resources :post_infos
resources :operations

 # These routes will be for signup. The first renders a form in the browse, the second will 
 # receive the form and create a user in our database using the data given to us by the user.
 get '/signup'    => 'users#new'
 post '/users'    => 'users#create'
 get '/allusers'  => 'users#show'
 resources :users, only:[:edit, :update, :destroy]
 

 # these routes are for showing users a login form, logging them in and logging them out.
  get '/login'  => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


  resources :help_infos, only:[:new, :create, :edit, :update, :show]


root 'post_infos#search'
#'post_infos#index'


end
