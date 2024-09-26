class CreateCompetencies < ActiveRecord::Migration[7.2]
  def change
    create_table :competencies, id: :uuid do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
