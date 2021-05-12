class InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :description, :price, :quantity, :total, :payment_due, :payment_terms, :status, :client_email, :client_email, :client_address
end
