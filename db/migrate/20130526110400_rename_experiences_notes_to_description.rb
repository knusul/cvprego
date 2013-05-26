class RenameExperiencesNotesToDescription < ActiveRecord::Migration
  def change
    rename_column :experiences, :notes, :description
  end
end
