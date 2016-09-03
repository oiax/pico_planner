Rails.application.routes.draw do
  root 'top#index'
  get 'plan_items' => 'plan_items#index', as: :plan_items
end
