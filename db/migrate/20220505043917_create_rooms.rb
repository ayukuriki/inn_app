class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :user_id
      t.text :introduction
      t.float :price
      t.string :address
      t.string :image

      t.timestamps
    end
  end
end
