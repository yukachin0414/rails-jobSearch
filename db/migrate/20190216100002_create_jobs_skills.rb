class CreateJobsSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs_skills do |t|
      t.integer :job_id, null: false
      t.integer :skill_id, null: false
    end
  end
end