Rails.application.routes.draw do
  namespace :api , default: { format: :json } do #decimos que poor defecto devovlera json
    namespace :v1 do
      resources :pets, only: [ :index, :show, :update ]
    end
  end
  devise_for :users
  root to: 'pages#home'
end
