Rails.application.routes.draw do
  root 'top#index'
  resources :plan_items
end
