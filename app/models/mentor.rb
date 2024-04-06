class Mentor < ApplicationRecord
  has_many :mentor_skills
  has_many :skills, through :mentor_skills

  validates :email, presence: true, uniqueness: true

  validates :name, presence: true
end
