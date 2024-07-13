Rails.application.routes.draw do
  resources :gemini_configs, except: [:destroy] do 
    resources :gemini_config_parts, shallow: true
  end

  resources :conversations do 
    resources :conversation_contents, shallow: true
  end
  use_doorkeeper

  resources :packages do 
    resources :package_versions, shallow: true
  end
  
  resources :users

  devise_for :users, controllers: {
    registrations: "users/registrations",
  }
  
  resources :games do 
    resources :game_versions, shallow: true do 
      resources :game_version_package_versions, shallow: true
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "games#index"
end
