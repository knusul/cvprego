class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
