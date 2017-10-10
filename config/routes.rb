Rails.application.routes.draw do 
  resources :events do
    resources :comments
  end
  get 'feed' => 'events#feed'
  get 'resolved/index'

  get 'welcome/index'
  
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
