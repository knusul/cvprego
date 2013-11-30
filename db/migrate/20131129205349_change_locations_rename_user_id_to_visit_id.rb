class ChangeLocationsRenameUserIdToVisitId < ActiveRecord::Migration
  def change
    Location.delete_all
    change_table :locations do |t|
      t.rename :user_id, :visit_id
    end
  end
end
