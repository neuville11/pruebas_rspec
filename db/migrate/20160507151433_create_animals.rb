class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
    	t.string :specie, null: false
    end
  end
end
