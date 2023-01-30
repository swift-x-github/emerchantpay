# frozen_string_literal: true

class CreateClients < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :clients, id: :uuid do |t|
      t.string 'customer_email', index: true
      t.string 'customer_phone'
      t.float 'balance', default: 0
      t.float 'captured_amount', default: 0
      t.integer 'status', default: 0, null: false
      t.text 'description'
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
    end
  end
end
