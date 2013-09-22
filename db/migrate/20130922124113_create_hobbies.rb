class CreateHobbies < ActiveRecord::Migration
  def change
    create_table :hobbies do |t|
      t.string :name
      t.ingerer :user_id

      t.timestamps
    end
  end
end
