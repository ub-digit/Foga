Rails.application.routes.draw do
  

  #get 'operations/index'

resources :post_infos
resources :operations

root 'post_infos#index'

# deprecated in v5.2
#match ':controller(/:action(/:id))', :via => :get




 # get 'post_infos/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
