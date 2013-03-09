class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.string     :number
      t.references :experience
      
      t.timestamps
    end
  end
end
