class AddOrderAndFamilyToAnimals < ActiveRecord::Migration[7.0]
  def change
    add_column :animals, :order, :string
    add_column :animals, :family, :string
  end
end
