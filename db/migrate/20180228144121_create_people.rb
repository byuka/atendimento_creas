class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :nome, null: false
      t.date :data_nascimento
      t.string :cpf
      t.string :rg
      t.string :endereco_logradouro
      t.string :endereco_numero
      t.string :endereco_bairro
      t.string :naturalidade
      t.string :nome_progenitor
      t.string :nome_progenitora
      t.string :etinia
      t.string :escolaridade
      t.text :obs
      t.boolean :ativo, default:true

      t.timestamps
    end
  end
end
