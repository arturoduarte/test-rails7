Rails.application.routes.draw do
  resources :categories, except: :show
  # delete '/products/:id', to: 'products#destroy'
  # patch '/products/:id', to: 'products#update'
  # post 'products', to: 'products#create'
  # get '/products/new', to: 'products#new', as: :new_product
  # get '/products', to: 'products#index'
  # get '/products/:id', to: 'products#show', as: :product
  # get '/products/:id/edit', to: 'products#edit', as: :edit_product

  resources :products, path: '/'
  # root 'products#index'

  namespace :authentication, path: '', as: '' do
    resources :users, only: %i[new create]
    resources :sessions, only: %i[new create]
  end
end
