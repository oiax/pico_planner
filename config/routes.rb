Rails.application.routes.draw do
  root 'top#index'
  get 'lessons/form' => 'lessons#form'
  get 'plan_items' => 'plan_items#index', as: :plan_items
  get 'plan_items/:id' => 'plan_items#show', as: :plan_item
end
