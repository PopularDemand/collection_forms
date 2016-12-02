Rails.application.routes.draw do

  resources :posts, except: [:destroy, :index]
end
