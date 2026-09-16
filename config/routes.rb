Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :lists, only: [] do
    resources :contents, only: [ :index ], module: :lists
  end
end
