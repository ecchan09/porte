
  Rails.application.routes.draw do
  get 'owners/show'

  # get 'owners/edit'

  get 'users/show'

  # get 'users/edit'

  get 'tops' => 'tops#index'
  post 'tops' => 'tops#index'
  post 'tops/search' => 'tops#search'
  get 'tops/search' => 'tops#search'


  root 'tops#index'
  devise_for :owners
  devise_for :users
  resources :rooms, :only => [:show, :create] do
  resources :messages, :only => [:create]
  end
  resources :users,  only: [:index, :new, :create,:show, :edit, :update]
  resources :owners,  only: [:index, :new, :create,:show, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
