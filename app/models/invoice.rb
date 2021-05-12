class Invoice < ApplicationRecord
  belongs_to :account
  validates :price :quantity :payment_due, :description, :payment_terms, :status, :client_name, :client_email, :client_address, presence: true
  validates :payment_terms, acceptance: { accept: [1, 15, 30], message:  "Payment terms must be Net 15 or 30" }
  validates :status, acceptance: { accept: ['draft', 'pending', 'paid'], message: "Must be draft, pending or paid" }

  after_initialize :update_total


  def update_total
    self.total = self.price * self.quantity
  end
end
