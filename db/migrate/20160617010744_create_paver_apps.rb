class CreatePavers < ActiveRecord::Migration
  def change
    create_table :pavers do |t|
      t.string :Placement
      t.string :Name
      t.string :Logo
      t.string :Line1
      t.string :Line2
      t.string :Line3
      t.string :Line4
      t.string :Line5
      t.string :Paver  
      t.string :Row
      t.string :Col
      t.string :PayPal_ID
      t.string :Email
      t.timestamps null: false
    end
  end
end
