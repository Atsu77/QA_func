Rails.application.routes.draw do
  devise_for :users, controller: { omniauth_callbacks: 'omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'top#index'
end
