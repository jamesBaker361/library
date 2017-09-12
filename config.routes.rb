
Rails.application.routes.draw do
  get 'welcome/index'
 
  resources :books
 
end