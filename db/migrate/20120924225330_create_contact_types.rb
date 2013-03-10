class CreateContactTypes < ActiveRecord::Migration
  def change
    create_table :contact_types do |t|
      t.string     :number
      t.references :experience
      
      t.timestamps
    end
  end
end
