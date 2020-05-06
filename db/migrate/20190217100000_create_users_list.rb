class CreateUsersList < ActiveRecord::Migration[5.2]
  def change
    create_table :admins_users do |t|
      t.string :email,null: false
      t.string :encrypted_password, null: false
      t.timestamps null: false
      t.integer :job_id, null: false
      t.integer :favorite_id, null: false
    end
  end
end
