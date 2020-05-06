class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.integer :job_id, null: false
      t.integer :user_id, null: false
    end

    add_index :entries, [:job_id, :user_id], unique: true, name: 'UIX_job_id_user_id'
  end
end