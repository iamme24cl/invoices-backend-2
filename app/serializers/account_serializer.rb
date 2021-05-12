class AccountSerializer < ActiveModel::Serializer
  attributes :id, :name, :address
  has_many :invoices
end
