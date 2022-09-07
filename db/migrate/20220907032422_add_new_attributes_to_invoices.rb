class AddNewAttributesToInvoices < ActiveRecord::Migration[6.1]
  def change
    add_column :invoices, :invoice_uuid, :string 
    add_column :invoices, :emitter_rfc, :string
    add_column :invoices, :receiver_rfc, :string
    add_column :invoices, :currency, :string
    add_column :invoices, :expires_at, :datetime
    add_column :invoices, :signed_at, :datetime
  end
end
