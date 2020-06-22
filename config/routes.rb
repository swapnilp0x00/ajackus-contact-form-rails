Rails.application.routes.draw do
  get 'contacts', to: 'contacts#new'
  post 'contacts', to: 'contacts#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
