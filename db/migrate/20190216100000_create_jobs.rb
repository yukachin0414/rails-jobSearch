# frozen_string_literal: true

class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.integer :income_upper, null: false
      t.integer :income_lower, null: false
      t.text :description, null: false
      t.integer :company_id, null: false
      t.timestamps null: false
    end
  end
end
