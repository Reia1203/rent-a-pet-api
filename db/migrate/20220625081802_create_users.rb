class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.text :bio
      t.string :open_id
      t.string :gender

      t.timestamps
    end
  end
end
