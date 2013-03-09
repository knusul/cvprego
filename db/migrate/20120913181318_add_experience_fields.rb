class AddExperienceFields < ActiveRecord::Migration
  def change
    change_table :experiences do |t|
      t.string :email
      t.text :notes
    end
  end
end
