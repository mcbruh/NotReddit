Rails.application.routes.draw do
	root to: 'posts#index'

	devise_for :users, controllers: {:omniauth_callbacks => "users/omniauth_callbacks"}

	get '/users/:id', to: 'users#show', as: :user

	resources :posts do
		resources :comments
		member do 
			put :upvote, to: 'posts#upvote'
			put :downvote, to: 'posts#downvote'
		end
	end
	
	resources :comments do
		resources :comments
		member do
			put :upvote, to: 'comments#upvote'
			put :downvote, to: 'comments#downvote'
		end
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
