module Spree
  module Api
    module V1
      class ReturnAuthorizationReasonsController < Spree::Api::BaseController
        def index
          authorize! :admin, ReturnAuthorizationReason
          @return_authorization_reasons = Spree::ReturnAuthorizationReason.active.ransack(params[:q]).result
          respond_with(@return_authorization_reasons)
        end
      end
    end
  end
end
