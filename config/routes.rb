Rails.application.routes.draw do
  namespace :api , defaults: { format: :json } do #decimos que poor defecto devovlera json
    namespace :v1 do
      resources :pets, only: [ :index, :show, :updat, :create, :destroy ]
    end
  end
  namespace :api , defaults: { format: :json } do #decimos que poor defecto devovlera json
    namespace :v1 do
        resource :owners, only: [ :create, :show, :update, :destroy ]
    end
  end
  devise_for :users
  root to: 'pages#home'
end
