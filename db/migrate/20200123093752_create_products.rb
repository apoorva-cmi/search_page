class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :country
      t.string :tags
      t.decimal :price

      t.timestamps
    end
  end
end
