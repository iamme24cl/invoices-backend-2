class Account < ApplicationRecord
  has_many :invoices
  validates :name, :address, presence: true
end
