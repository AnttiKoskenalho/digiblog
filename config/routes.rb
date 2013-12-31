Blog::Application.routes.draw do
  scope "/blog/" do
		resources :posts do
			resources :comments
		end

		get "welcome/index"
		root 'posts#index'
	end
end
