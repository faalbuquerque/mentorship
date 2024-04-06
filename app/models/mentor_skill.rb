class MentorSkill < ApplicationRecord
  belongs_to :mentor
  belongs_to :skill

  enum :level, %i[begginer intermediary advanced]
end
