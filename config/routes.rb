Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :random_arrays, only: [:create, :show]
    end
  end
end
