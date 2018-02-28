class CreateTechnicians < ActiveRecord::Migration[5.1]
  def change
    create_table :technicians do |t|
      t.string :nome, null: false
      t.date :data_nascimento
      t.integer :matricula
      t.string :cargo
      t.boolean :ativo, default: true

      t.timestamps
    end
  end
end
