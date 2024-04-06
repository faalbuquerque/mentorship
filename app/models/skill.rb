class Skill < ApplicationRecord
  has_many :mentor_skills
  has_many :mentors, through :mentor_skills

  validates :name, presence: true, uniqueness: true
end
