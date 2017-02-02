object false
child(@rma_return_items => :rma_return_items) do
  # TODO: attributes *customer_return_attributes
  attributes *[
    :id,
    :return_authorization_id,
    :inventory_unit_id,
    :exchange_variant_id,
    :resellable,
    :pre_tax_amount
  ]
end
# node(:attributes) { *customer_return_attributes }
# node(:required_attributes) { required_fields_for(@rma_return_items) }
