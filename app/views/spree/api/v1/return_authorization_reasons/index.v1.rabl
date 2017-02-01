object false
child(@return_authorization_reasons => :return_authorization_reasons) do
  # TODO: attributes *return_authorization_reason_attributes
  attributes *[:id, :name, :active, :mutable, :created_at, :updated_at]
end
node(:count) { @return_authorization_reasons.count }
