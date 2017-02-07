class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :experiences
      t.integer :force
      t.integer :vie
      t.integer :level

      t.timestamps null: false
    end
  end
end
