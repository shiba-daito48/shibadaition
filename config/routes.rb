Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
 
  
  
  get 'shibas/shibadai' => 'shibas#shibadai'
  resources :perfumes

  resources :shibas do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
 
  get 'shibas/:shiba_id/likes' => 'likes#create'
  get 'shibas/:shiba_id/likes/:id' => 'likes#destroy'
  

  root 'shibas#shibadai'
  

  
end
