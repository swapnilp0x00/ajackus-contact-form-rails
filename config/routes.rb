Rails.application.routes.draw do
  resources :contacts
  get 'contact', to: 'contacts#new'
  post 'contact', to: 'contacts#post'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
