class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.text :bio
      t.string :species
      t.string :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
