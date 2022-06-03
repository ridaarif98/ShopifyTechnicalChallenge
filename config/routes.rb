Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'items#index'
  # get 'items/test'
  resources :items, only: [:new, :create, :index, :update, :edit, :delete] do
    resources :comments, only: [:create]
  end
  put 'items/:id/test', to: 'items#test', as: 'test'
  get 'items/:id/show', to: 'items#show', as: 'show'
  get 'items/deleted', to: 'items#deleted', as: 'deleted'
  

end
