class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.references :user, foreign_key: true
      t.references :owner, foreign_key: true

      t.timestamps
    end
  end
end
