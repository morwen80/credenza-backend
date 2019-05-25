class AddFavedToFooditems < ActiveRecord::Migration[5.0]
  def change
    add_column :fooditems, :faved, :boolean
  end
end
