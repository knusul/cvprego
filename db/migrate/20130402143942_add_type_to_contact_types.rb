class AddTypeToContactTypes < ActiveRecord::Migration
  def change
    add_column :contact_types, :type, :string
  end
end
