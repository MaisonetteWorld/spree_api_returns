object false
child(@customer_returns => :customer_returns) do
  attributes *[:id, :number, :created_at]
  node(:date) { |r| pretty_time(r.created_at) }
  node(:reimbursement_status) { |r| r.fully_reimbursed? ? Spree.t(:reimbursed) : Spree.t(:incomplete) }
end
node(:count) { @customer_returns.count }
