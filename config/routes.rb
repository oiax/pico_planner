Rails.application.routes.draw do
  root 'top#index'
  get 'plan_items' => 'plan_items#index', as: :plan_items
  get 'plan_items/new' => 'plan_items#new', as: :new_plan_item
  post 'plan_items' => 'plan_items#create'
end
