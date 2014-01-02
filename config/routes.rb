Blog::Application.routes.draw do
	scope "/blog/" do
		get "log_in" => "sessions#new", :as => "log_in"
		get "log_out" => "sessions#destroy", :as => "log_out"
		get "sign_up" => "users#new", :as => "sign_up"
		
		resources :users
		resources :sessions

		resources :posts do
			resources :comments
		end

		get "welcome/index"
		root 'posts#index'
	end
end
