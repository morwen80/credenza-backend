class CreateFooditems < ActiveRecord::Migration[5.0]
  def change
    create_table :fooditems do |t|
      t.string :food
      t.integer :itemnumber
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end
