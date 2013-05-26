class AddTittleToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :tittle, :string
  end
end
