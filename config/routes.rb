Rails.application.routes.draw do
	
   resources :posts do
    member do
      put "like", to: "posts#upvote"
      put "dislike", to: "posts#downvote"
    end
    resources :comments
  end

  devise_for :users
  
  	devise_scope :user do
	  get '/users', to: 'devise/registrations#new'
	  get '/users/password', to: 'devise/passwords#new'
	end

	root 'posts#index'
	
end
