Spree::Core::Engine.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :refund_reasons, only: [:index]
      resources :reimbursement_types, only: [:index]
      resources :return_authorization_reasons, only: [:index]
    end
  end
end
