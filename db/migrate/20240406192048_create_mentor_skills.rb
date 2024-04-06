class CreateMentorSkills < ActiveRecord::Migration[7.1]
  def change
    create_table :mentor_skills do |t|
      t.references :mentor, index: true, foreign_key: true
      t.references :skill, index: true, foreign_key: true
      t.integer :level

      t.timestamps
    end

    add_index :mentor_skills, [:skill_id, :mentor_id], unique: true
  end
end
