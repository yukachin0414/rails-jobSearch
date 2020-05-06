class Job < ApplicationRecord
  belongs_to :company
  has_many :jobs_skills
  has_many :skills, through: :jobs_skills
  accepts_nested_attributes_for :jobs_skills, allow_destroy: true
  has_many :entries
  has_many :favorites
  has_many_attached :images
end