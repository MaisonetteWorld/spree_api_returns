object false
child(@refund_reasons => :refund_reasons) do
  # TODO: attributes *refund_reason_attributes
  attributes *[:id, :name, :active, :mutable, :created_at, :updated_at]
end
node(:count) { @refund_reasons.count }
