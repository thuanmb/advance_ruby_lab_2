Rails.application.routes.draw do
  get 'sessions/new'
  post 'sessions/create'

  resources :users
end
