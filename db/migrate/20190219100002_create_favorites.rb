class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :job_id, null: false
      t.integer :user_id, null: false
    end

    add_index :favorites, [:job_id, :user_id], unique: true, name: 'UIX_job_id_user_id'
  end
end