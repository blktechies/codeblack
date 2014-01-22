Codeblack::Application.routes.draw do
	root "posts#index"
	resources :posts
	resources :users

	get "/signin", to: "sessions#new"
	post "/signin", to: "sessions#create"
end
