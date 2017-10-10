Rails.application.routes.draw do
  get 'resolved/index'

  get 'welcome/index'

  resources :events do
    resources :comments
  end

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
