Spree::Core::Engine.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :refund_reasons, only: [:index]
      resources :reimbursement_types, only: [:index]
      resources :return_authorization_reasons, only: [:index]

      resources :orders, except: [:show] do
        resources :customer_returns, only: [:new, :create, :show, :index]
      end
    end
  end
end
