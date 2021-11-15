class CreateSpaces < ActiveRecord::Migration[6.0]
  def change
    create_table :spaces do |t|
      t.string :description
      t.integer :price
      t.string :amenities
      t.string :address
      t.integer :size
      t.string :category
      t.string :name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
