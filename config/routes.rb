Rails.application.routes.draw do

  devise_for :customers
  put "/customers/:id/hide" => "customers#hide", as: 'customers_hide'

  resources :customers, only: [:index, :show, :edit, :update, :destroy]
  get 'customers/:id/favorite', to: 'customers#favorite', as: 'customers_favorite'

  get 'blogs/search', to: 'blogs#search'
  get 'blogs/search_title', to: 'blogs#search_title'
  resources :blogs, shallow: true do
  	 collection do
     	post :upload_file
  	 end
  	resources :blog_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end


  root to: 'homes#top'
  get 'homes/about', to: 'homes#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
