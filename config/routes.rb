Rails.application.routes.draw do
 resources :books
 patch '/books/:id', to: 'books#update', as: 'patch_book'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
