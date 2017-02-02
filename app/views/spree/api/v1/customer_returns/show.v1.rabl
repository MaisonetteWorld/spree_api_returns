object false
child(@customer_return => :customer_return) do
  attributes *[:id, :created_at]
  child(:return_items => :return_item) do
    attributes *[:id, :display_pre_tax_amount, :created_at]
    node(:product) { |item| item.inventory_unit.variant.name }
    node(:options) { |item| item.inventory_unit.variant.options_text }
    node(:sku) { |item| item.inventory_unit.variant.sku }
    node(:state) { |item| item.inventory_unit.state.humanize }
  end
end
