Rails.application.routes.draw do
  resources :url_histories
  resources :screenshots
  resources :urls
  resources :crawler_sessions
  root                'crawler_sessions#index'
  get    'about'   => 'static_pages#about'
end
