class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.text :description
      t.float :balance
      t.string :email, null: false
      t.integer :status, default: 0, null: false
      t.integer :role, default: 1, null: false
      t.timestamps
      t.index ['email'], name: 'index_users_on_email', unique: true
    end
  end
end
