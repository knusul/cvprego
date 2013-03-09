class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :from_date
      t.string :to_date

      t.timestamps
    end
  end
end
