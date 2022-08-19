Rails.application.routes.draw do
	devise_for :users
	get 'welcome/index'
	root 'welcome#index'
	resources :users do
		resources :blogs do
  		post "/blog/is_approved", to: "blogs#is_approved"
  		resources :comments
  		end
	end 
end
