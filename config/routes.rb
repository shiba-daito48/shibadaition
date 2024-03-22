Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
 
  
  get 'perfumes/new1' => 'perfumes#new1'
  get 'perfumes/new2' => 'perfumes#new2'
  get 'perfumes/new3' => 'perfumes#new3'
  get 'perfumes/new4' => 'perfumes#new4'
  get 'perfumes/new5' => 'perfumes#new5'
  get 'perfumes/new6' => 'perfumes#new6'
  get 'perfumes/show' => 'perfumes#show'
  get 'perfumes/show1' => 'perfumes#show1'
  get 'perfumes/show2' => 'perfumes#show2'
  get 'perfumes/show3' => 'perfumes#show3'
  get 'perfumes/show4' => 'perfumes#show4'
  get 'perfumes/show5' => 'perfumes#show5'
  get 'perfumes/show6' => 'perfumes#show6'
  get 'perfumes/show7' => 'perfumes#show7'

  get 'shibas/shibadai' => 'shibas#shibadai'
  get 'shibas/a' => 'shibas#a'
  resources :perfumes

  resources :shibas do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
 
  get 'shibas/:shiba_id/likes' => 'likes#create'
  get 'shibas/:shiba_id/likes/:id' => 'likes#destroy'
  

  root 'shibas#shibadai'
  
  
  
end
