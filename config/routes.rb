Rails.application.routes.draw do
  devise_for :users
  resources :todo_lists, only: [:show] do
    resources :todo_list_items
  end

  resources :teams do
    resources :todo_lists do
      resources :todo_list_items
    end
  end
end
