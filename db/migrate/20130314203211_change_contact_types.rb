class ChangeContactTypes < ActiveRecord::Migration
  def up
    change_table :contact_types do |t|
      t.rename :experience_id, :card_id
    end

  end

  def down
  end
end
