class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.string :title
      t.integer :experience
      t.string :item
      t.string :png
      t.string :content

      t.timestamps null: false
    end
  end
end
