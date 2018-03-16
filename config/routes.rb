Rails.application.routes.draw do
  


 #  Started using Ransack bundle. Search on title implemented but not displayed correctly.
  #get 'operations/index'
get 'post_infos/latest'



  get 'post_infos/search'

resources :post_infos
resources :operations


root 'post_infos#index'

#match ':controller(/:action(/:id))', :via => :get



  #get 'post_infos/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # deprecated in v5.2
end
