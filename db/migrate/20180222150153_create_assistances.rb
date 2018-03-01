class CreateAssistances < ActiveRecord::Migration[5.1]
  def change
    create_table :assistances do |t|
      t.string :nome, null: false
      t.text :descricao
      t.boolean :ativo, default: true

      t.timestamps
    end
  end
end
