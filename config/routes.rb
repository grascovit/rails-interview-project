Rails.application.routes.draw do
  root to: 'dashboard#index'

  namespace :api do
    namespace :v1 do
      resources :questions, only: %i[index]
    end
  end
end
