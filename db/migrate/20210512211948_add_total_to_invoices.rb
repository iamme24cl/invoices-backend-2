class AddTotalToInvoices < ActiveRecord::Migration[6.1]
  def change
    add_column :invoices, :total, :float, :default => 0.0
  end
end
