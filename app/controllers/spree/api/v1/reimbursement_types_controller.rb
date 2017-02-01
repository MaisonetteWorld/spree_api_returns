module Spree
  module Api
    module V1
      class ReimbursementTypesController < Spree::Api::BaseController
        def index
          authorize! :admin, ReimbursementType
          @reimbursement_types = Spree::ReimbursementType.active.ransack(params[:q]).result
          respond_with(@reimbursement_types)
        end
      end
    end
  end
end
