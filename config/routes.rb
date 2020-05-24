Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  scope '/api' do
  	resources :menus
  	resources :products
  	resources :sections
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
