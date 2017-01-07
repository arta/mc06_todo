Rails.application.routes.draw do

  resources :todo_lists do
    resources :todo_items, only: [:create, :destroy] do
      patch 'complete', on: :member
    end
  end

  root 'todo_lists#index'
end
