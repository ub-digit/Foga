Rails.application.routes.draw do
  


 #  Started using Ransack bundle. Search on title implemented but not displayed correctly.
  #get 'operations/index'
get 'post_infos/latest'



  get 'post_infos/latest'
  get 'post_infos/search'

resources :post_infos
resources :operations

<<<<<<< 44c1afa586b384c23dd2846c368f64e2415bb229

root 'post_infos#index'
=======
root 'post_infos#search'
#'post_infos#index'
>>>>>>> Changes in display; dt as date only, text area larger. Search as root. Operation deletion.

#match ':controller(/:action(/:id))', :via => :get



  #get 'post_infos/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # deprecated in v5.2
end
