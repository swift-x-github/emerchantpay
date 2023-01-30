class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :notes, id: :uuid  do |t|
      t.string 'transaction_id', index: true
      t.float 'amount'
      t.integer 'status', default: 0, null: false
      t.text 'description'
      t.string :notification_url
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
    end
  end
end
