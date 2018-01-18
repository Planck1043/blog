Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
	root "pages#index"
	resources :users
	resources :sessions
	resources :articles do
		collection do
			get :search
		end
	end
	resources :sorts
	resources :pages
end
