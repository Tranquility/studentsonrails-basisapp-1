class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.string :name
      t.float :price
      t.string :link
      t.references :wishlist, index: true

      t.timestamps
    end
  end
end
