class AdminsUser < ApplicationRecord
  belongs_to :user
  has_many :entry
  has_many :jobs, through: :entries
  accepts_nested_attributes_for :jobs_skills, allow_destroy: true
end