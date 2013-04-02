class RenameContactTypesTypeToName < ActiveRecord::Migration
  def change
    change_table :contact_types do |t|
      t.rename :type, :name
    end
  end
end
