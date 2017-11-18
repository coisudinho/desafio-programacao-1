Rails.application.routes.draw do
	resources :balances
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	match "/upload", to: "balances#upload", via: :post

	root to: "balances#index"
end
