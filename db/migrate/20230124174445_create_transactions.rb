class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :transactions, id: :uuid  do |t|
      t.belongs_to :user, null: false, foreign_key: true, index: true
      t.uuid :transaction_id, index: true
      t.float 'amount'
      t.integer 'status', default: 0, null: false
      t.string 'type'
      t.jsonb 'decline_details'
      t.text 'description'
      t.string :customer_email, null: false
      t.string :customer_phone, null: false
      t.string :notification_url
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
    end
  end
end
