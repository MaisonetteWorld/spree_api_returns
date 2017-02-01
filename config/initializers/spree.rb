Spree::Api::V1::ReturnAuthorizationsController.class_eval do
  private

  def return_authorization_params
    permitted_attributes = [
      :amount,
      :memo,
      :stock_location_id,
      { return_items_attributes: [:inventory_unit_id, :pre_tax_amount] },
      :return_authorization_reason_id]
    params.require(:return_authorization).permit(permitted_attributes)
  end
end
