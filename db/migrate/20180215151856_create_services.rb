class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string :nome, null: false
      t.text :descricao

      t.timestamps
    end
  end
end
