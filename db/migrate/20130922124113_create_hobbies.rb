class CreateHobbies < ActiveRecord::Migration
  def change
    create_table :hobbies do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
