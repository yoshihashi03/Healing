Rails.application.routes.draw do

  devise_for :customers
  put "/customers/:id/hide" => "customers#hide", as: 'customers_hide'

  resources :customers, only: [:index, :show, :edit, :update, :destroy]
    get '/customers/favorite', to: 'customers#favorite'

  resources :blogs do
  	collection do
    	post :upload_file
  	end
  	resources :blog_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  	get 'search', to: 'search'
  end

  root to: 'homes#top'
  get 'homes/about', to: 'homes#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
