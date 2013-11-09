class CreateWishlists < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|
      t.string :title
      t.references :user, index: true
      t.text :description

      t.timestamps
    end
  end
end
