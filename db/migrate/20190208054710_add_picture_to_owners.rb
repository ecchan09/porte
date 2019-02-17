class AddPictureToOwners < ActiveRecord::Migration[5.1]
  def change
    add_column :owners, :picture, :string
  end
end
