class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.string :status
      t.string :emitter
      t.string :receiver
      t.integer :amount
      t.datetime :emitted_at
      t.integer :user_id

      t.timestamps
    end
  end
end
