Rails.application.routes.draw do
  get 'products/index'

  root 'products#index'
end
