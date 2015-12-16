Rails.application.routes.draw do
  post '/register' => 'auth#register'
  # patch '/confirm' => 'auth#confirm'
  post '/login' => 'auth#login'
  delete '/logout/:id' => 'auth#logout'

  resources :users, except: [:new, :edit]

  resources :rides, except: [:new, :edit]

  resource :ride_passengers, except: [:new, :edit, :update, :show]


end
