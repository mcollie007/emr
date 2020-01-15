Rails.application.routes.draw do
  root "emergency_transfer#index"

  resources :emergency_transfer do
    member do
      get :patients_list
      get :summary
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
