class Skill < ApplicationRecord
  has_many :jobs_skills
  has_many :jobs, through: :jobs_skills
  accepts_nested_attributes_for :jobs_skills, allow_destroy: true
end