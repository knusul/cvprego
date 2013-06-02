class AddLevelToLanguages < ActiveRecord::Migration
  def change
    add_column :languages, :level, :string
  end
end
