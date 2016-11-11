Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, class_name: "User"
  devise_scope :user do
    unauthenticated do
      root to: "home#index"
    end
    authenticated do
      root to: "dashboard#index" , as: :authenticated_root
    end
  end
  resources :notes

  # patch 'notes/update_position' => 'notes#update_position', as: 'update_position'
  post 'notes/update_position' => 'notes#update_position', as: 'update_position'

end
