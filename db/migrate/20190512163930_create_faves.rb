class CreateFaves < ActiveRecord::Migration[5.0]
  def change
    create_table :faves do |t|
      t.string :food

      t.timestamps
    end
  end
end
