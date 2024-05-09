Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"


  resources :groups, only: [:index, :new, :create, :show, :edit, :update, :destroy], controller: "groups"
  resources :posts, only: [:show, :create, :index], controller: "posts" do

    collection do
      post :index
    end
  end
  
end
