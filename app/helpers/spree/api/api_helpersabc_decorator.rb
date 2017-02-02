Spree::Api::ApiHelpers.class_eval do
  Spree::Api::ApiHelpers::ATTRIBUTES << :reimbursement_type_attributes
  Spree::Api::ApiHelpers::ATTRIBUTES << :customer_return_attributes

  mattr_reader *Spree::Api::ApiHelpers::ATTRIBUTES

  @@reimbursement_type_attributes = [:id, :name, :active, :mutable, :created_at, :updated_at, :type]

  @@customer_return_attributes = [
    :id,
    :return_authorization_id,
    :inventory_unit_id,
    :exchange_variant_id,
    :resellable,
    :pre_tax_amount
  ]

end
