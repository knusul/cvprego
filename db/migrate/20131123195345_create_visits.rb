class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :count, :default => 0
      t.date :date
      t.integer :card_id
    end
  end
end
