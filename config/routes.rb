Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :books do
    resources :chapters
  end
end
