Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :articles
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users
  resources :cards
  resources :carrousels
	resources :investigateds

	get 'home/index'
	root to: 'home#index'






	namespace :api, defaults: { format: 'json' } do

	    mount_devise_token_auth_for 'User', at: 'auth'
		namespace :v1 do 
			resources :investigateds
			  resources :cards
			  resources :carrousels
		end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
