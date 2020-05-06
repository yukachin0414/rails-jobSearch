class AddTitleToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :title, :string, limit: 50, null: false
  end
end
