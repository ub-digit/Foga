Rails.application.routes.draw do
  

resources :post_infos
resources :actions

# match ':controller(/:action(/:id))', :via => :get








  #get 'actions/index'

  #get 'post_infos/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
