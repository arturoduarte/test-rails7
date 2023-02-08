Rails.application.routes.draw do

  # delete '/products/:id', to: 'products#destroy'
  # patch '/products/:id', to: 'products#update'
  # post 'products', to: 'products#create'
  # get '/products/new', to: 'products#new', as: :new_product
  # get '/products', to: 'products#index'
  # get '/products/:id', to: 'products#show', as: :product
  # get '/products/:id/edit', to: 'products#edit', as: :edit_product

  namespace :authentication, path: '', as: '' do
    resources :users, only: %i[new create], path: 'register', path_names: { new: '/' }
    resources :sessions, only: %i[new create destroy], path: 'login', path_names: { new: '/' }
  end

  resources :users, only: :show, path: '/user', param: :username
  resources :categories, except: :show
  resources :products, path: '/'
  # root 'products#index'
end
