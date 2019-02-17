class CreatePrivates < ActiveRecord::Migration[5.1]
  def change
    create_table :privates do |t|
      t.string        :station
      t.string        :name

    end
  end
end
