class AddTittleToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :company_name, :string
  end
end
