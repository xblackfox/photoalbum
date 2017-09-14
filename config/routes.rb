Rails.application.routes.draw do
  devise_for :users

  root "albums#index"

  resources :albums do 
  	resources :photos do
  		resources :comments
  	end
  end


end
