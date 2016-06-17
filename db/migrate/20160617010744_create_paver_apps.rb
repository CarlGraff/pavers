class CreatePaverApps < ActiveRecord::Migration
  def change
    create_table :paver_apps do |t|
      t.text :Name
      t.text :Line1
      t.text :Line2
      t.text :Line3
      t.text :Line4
      t.text :Paver
      t.text :Placement
      t.text :Row
      t.text :Col

      t.timestamps null: false
    end
  end
end
