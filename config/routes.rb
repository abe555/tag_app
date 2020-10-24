Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "posts#index"

  resource :posts

  resource :tags do
  	get 'posts' => 'posts#search'
  end

end

