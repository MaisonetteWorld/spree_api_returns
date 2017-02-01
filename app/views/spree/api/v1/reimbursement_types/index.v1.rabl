object false
child(@reimbursement_types => :reimbrusement_types) do
  # TODO: attributes *reimbursement_type_attributes
  attributes *[:id, :name, :active, :mutable, :created_at, :updated_at, :type]
end
node(:count) { @reimbursement_types.count }
