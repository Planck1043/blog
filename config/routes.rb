Rails.application.routes.draw do
	root "articles#index"
	resources :users
	resources :sessions
	resources :articles
end
