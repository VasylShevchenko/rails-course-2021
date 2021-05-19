Rails.application.routes.draw do
  get 'articles/new',        action: :new, controller: 'articles'
  get 'articles',            action: :index, controller: 'articles'
  get 'articles/show/:id',   action: :show, controller: 'articles'
  get 'articles/edit',       action: :edit, controller: 'articles'
  put 'articles/update',     action: :update, controller: 'articles'
  delete 'articles/destroy', action: :destroy, controller: 'articles'
  post 'articles',           action: :create, controller: 'articles'

  # get 'articles/new',        to: 'articles#new'
  # get 'articles',            to: 'articles#index'
  # get 'articles/:id',   to: 'articles#show'
  # get 'articles/:id/edit',   to: 'articles#edit'
  # put 'articles/update',     to: 'articles#update'
  # delete 'articles/destroy', to: 'articles#destroy'
  # post 'articles',           to: 'articles#create'

  resources :articles do
    get 'my-articles', on: :collection
  end

  # devise_for :users
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  root to: 'users#index'

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
