class AddCfdiDigitalStampToInvoices < ActiveRecord::Migration[6.1]
  def change
    add_column :invoices, :cfdi_digital_stamp, :text
  end
end
