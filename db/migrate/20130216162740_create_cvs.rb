class CreateCvs < ActiveRecord::Migration
  def change
    create_table :cvs do |t|
      t.string :title

      t.timestamps
    end
  end
end
