Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/help'

  get 'static_pages/about'

  get 'users/new'

  get 'users/create'

  get 'users/sshow'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
