Rails.application.routes.draw do
  namespace :api, constraints: { format: :json }, :defaults => { :format => 'json' } do
    namespace :v0 do
      resources :quotes, only: [:show]
    end
  end

  root 'api/v0/quotes#show' 
end
