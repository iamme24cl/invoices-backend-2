class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.string :description
      t.float :price
      t.integer :quantity
      t.datetime :payment_due
      t.integer :payment_terms
      t.string :status
      t.string :client_name
      t.string :client_email
      t.string :client_address

      t.timestamps
    end
  end
end
