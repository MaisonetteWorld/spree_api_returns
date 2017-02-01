Spree::Api::ApiHelpers.class_eval do
  Spree::Api::ApiHelpers::ATTRIBUTES << :reimbursement_type_attributes

  @@reimbursement_type_attributes = [:id, :name, :active, :mutable, :created_at, :updated_at, :type]
end
