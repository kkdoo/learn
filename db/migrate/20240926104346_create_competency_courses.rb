class CreateCompetencyCourses < ActiveRecord::Migration[7.2]
  def change
    create_table :competency_courses, primary_key: [:course_id, :competency_id] do |t|
      t.uuid :competency_id, null: false
      t.uuid :course_id, null: false
      t.timestamps
    end
  end
end
