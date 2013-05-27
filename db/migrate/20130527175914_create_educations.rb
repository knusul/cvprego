class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :from_date
      t.string :to_date
      t.string :name
      t.integer :user_id
      t.timestamps
    end
  end
end
