Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  get 'users/:id' => 'pages#show', as: 'user_page'
  get 'items/new' => 'items#new', as:'item_new'
  get 'items', to: redirect('items/new')
  get 'items/:id' => 'items#show', as:'item_show'
  get 'items/:id/edit' => 'items#edit', as:'item_edit'
  patch 'items/:id' => 'items#update'
  post 'transaction' => 'item_transactions#create'
  get 'transaction/:id' => 'item_transactions#show', as:'transaction_show'
  get 'transactions/:id' => 'item_transactions#index', as: 'transaction_index'
  post 'transaction_comment/:id' => 'item_transaction_comments#create', as:'transaction_comment'
  get 'transaction_comment_delete/:id' => 'item_transaction_comments#destroy', as:'transaction_comment_delete'

  resources :users
  resources :items, only: [:create, :destroy]
  resources :items , only: [:create , :destroy ] do
        resources :comments
  end
end
