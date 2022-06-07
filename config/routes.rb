Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'items#index'
  # get 'items/test'
  resources :items, only: [:new, :create, :index, :update, :edit, :delete, :destroy] do
    resources :comments, only: [:create]
    
  end
  resources :comments, only: [:destroy]
  put 'items/:id/test', to: 'items#test', as: 'test'
  put 'comments/:id/dell_comment', to: 'comments#dell_comment', as: 'dell_comment'
  get 'items/:id/show', to: 'items#show', as: 'show'
  get 'items/deleted', to: 'items#deleted', as: 'deleted'
  get 'items/:item_id/comments/deleted_comments', to: 'comments#deleted_comments', as: 'deleted_comments'
  

end
