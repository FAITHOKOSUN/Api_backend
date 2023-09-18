Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api, defaults: { format: 'json' } do
    resources :animals
  end

  resources :animals
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'home_pages#home'

  get 'api-docs/v1/swagger.yaml', to: 'swagger#generate_swagger_yaml'
  put '/animals/{id}', to: 'animals#update' # Updated with curly braces
  patch '/animals/{id}', to: 'animals#update' # Updated with curly braces
  delete '/animals/{id}', to: 'animals#destroy' # Updated with curly braces
end
