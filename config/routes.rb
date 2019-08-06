Rails.application.routes.draw do
  devise_for :users
  resources :teams do
    resources :todo_lists do
      resources :todo_list_items
    end
  end
end
