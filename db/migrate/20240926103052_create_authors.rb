class CreateAuthors < ActiveRecord::Migration[7.2]
  def change
    create_table :authors, id: :uuid do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.timestamps
    end
  end
end
