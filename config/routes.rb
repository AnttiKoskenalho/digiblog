Blog::Application.routes.draw do
  get "sessions/new"
  get "users/new"
  get "user/new"
  scope "/blog/" do
		resources :posts do
			resources :comments
		end

		get "welcome/index"
		root 'posts#index'
	end
end
