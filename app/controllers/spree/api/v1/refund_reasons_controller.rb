module Spree
  module Api
    module V1
      class RefundReasonsController < Spree::Api::BaseController
        def index
          authorize! :admin, RefundReason
          @refund_reasons = Spree::RefundReason.active.ransack(params[:q]).result
          respond_with(@refund_reasons)
        end
      end
    end
  end
end
