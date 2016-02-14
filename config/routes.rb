Rails.application.routes.draw do

  namespace :api do
    namespace :v1, { defaults: { format: :json } } do
      resources :orders, only: %i(create)
    end
  end
end
