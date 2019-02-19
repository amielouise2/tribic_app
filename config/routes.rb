Rails.application.routes.draw do
  get '/robots.:format' => 'pages#robots'
  devise_for :models
  root to: 'pages#home'
  get 'home' =>'pages#home'
  get 'about' => 'pages#about'
  get 'portfolio' => 'pages#portfolio'
  get 'careers' => 'pages#careers'
  get 'contact' => 'pages#contact'
  resources :blogs, only: [:index, :show]
  get 'articles/eventx_release' => 'articles#eventx_release'

  get 'facebook', to: redirect('https://www.facebook.com/tribicsoftware')
  get 'twitter', to: redirect('https://twitter.com/tribicsoftware')
  get 'linkedin', to: redirect('https://www.linkedin.com/company/tribic/')
  get 'google', to: redirect('https://www.google.com/tribic')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles do
    member do
    get :publish
    get :archive
    get :revive
  end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
