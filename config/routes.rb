Rails.application.routes.draw do
	 
	resources :users
	get 'sign_in',to: "users#sign_in"  
	post 'user_sign_in',to: "users#user_sign_in"
	get 'logout', to: "users#logout"
    resources :posts
	
	#end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
