Codeblack::Application.routes.draw do
	root "posts#index"
	resources :posts
	resources :users
end
