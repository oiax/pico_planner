Rails.application.routes.draw do
  root 'top#index'
  get 'plan_items' => 'plan_items#index', as: :plan_items
  get 'plan_items/:id' => 'plan_items#show', as: :plan_item
  get 'plan_items/new' => 'plan_items#new', as: :new_plan_item
  get 'plan_items/:id/edit' => 'plan_items#edit', as: :edit_plan_item
  post 'plan_items' => 'plan_items#create'
  patch 'plan_items/:id' => 'plan_items#update'
  delete 'plan_items/:id' => 'plan_items#destroy'
end
