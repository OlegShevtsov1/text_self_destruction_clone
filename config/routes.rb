Rails.application.routes.draw do
  root 'static_pages#show'
  namespace :v1 do
    resources :messages, only: %i[create show]
  end
end
