# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name, limit: 50, null: false
      t.timestamps null: false
    end
  end
end
