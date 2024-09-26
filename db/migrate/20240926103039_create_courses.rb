class CreateCourses < ActiveRecord::Migration[7.2]
  def change
    create_table :courses, id: :uuid do |t|
      t.uuid :author_id, null: false
      t.string :name, null: false
      t.string :description
      t.timestamps
    end
  end
end
