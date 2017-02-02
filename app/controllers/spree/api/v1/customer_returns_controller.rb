module Spree
  module Api
    module V1
      class CustomerReturnsController < Spree::Api::BaseController
        def create
          authorize! :create, CustomerReturn
          @customer_return = Spree::CustomerReturn.new
          @rma_return_items = build_return_items_from_params
          @customer_return.stock_location = Spree::StockLocation.find @permitted_resource_params['stock_location_id']
          @customer_return.save

          if @customer_return.save
            respond_with(customer_returns, status: 201, default_template: :index)
          else
            invalid_resource!(@customer_return)
          end
        end

        def index
          authorize! :admin, CustomerReturn
          respond_with(customer_returns)
        end

        def new
          authorize! :create, CustomerReturn
          load_form_data

          respond_with(@rma_return_items)
        end

        def show
          respond_with(customer_return)
        end

        private

        def customer_return
          @customer_return ||= Spree::CustomerReturn.find(params[:id])
          authorize! :read, @customer_return
          @customer_return
        end


        def customer_returns
          @customer_returns ||= Spree::ReturnItem.
            accessible_by(current_ability, :read).
            where(inventory_unit_id: order.inventory_units.pluck(:id)).
            map(&:customer_return).uniq.compact
        end

        def order
          @order ||= Spree::Order.find_by!(number: order_id)
          authorize! :read, @order

          @order
        end

        def load_form_data
          return_items = order.inventory_units.map(&:current_or_new_return_item).reject(&:customer_return_id)
          @rma_return_items = return_items.select(&:return_authorization_id)
        end

        def permitted_customer_return_attributes
          [
            :stock_location_id,
            {
              return_items_attributes: [
                :id,
                :return_authorization_id,
                :inventory_unit_id,
                :exchange_variant_id,
                :resellable
              ]
            }
          ]
        end

        def permitted_resource_params
          @permitted_resource_params ||= params.require('customer_return').permit(permitted_customer_return_attributes)
        end

        def build_return_items_from_params
          return_items_params = permitted_resource_params.delete(:return_items_attributes).values
          @customer_return.return_items = return_items_params.map do |item_params|
            return_item = item_params[:id] ? Spree::ReturnItem.find(item_params[:id]) : Spree::ReturnItem.new
            return_item.attributes = item_params
            return_item
          end.compact

          @customer_return.return_items
        end
      end
    end
  end
end
