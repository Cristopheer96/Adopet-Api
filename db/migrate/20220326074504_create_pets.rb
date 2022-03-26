class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.references :owner, null: false, foreign_key: true
      t.string :size
      t.string :gender
      t.string :age
      t.string :coatsize
      t.string :state
      t.string :ubication

      t.timestamps
    end
  end
end
