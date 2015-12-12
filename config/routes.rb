Rails.application.routes.draw do
  resources :url_histories
  resources :crawler_sessions

  root                'crawler_sessions#index'
  get    'about'   => 'static_pages#about'
end
