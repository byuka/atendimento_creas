class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.references :service, foreign_key: true, null: false
      t.references :technician, foreign_key: true, null: false
      t.references :person, foreign_key: true, null: false
      t.references :assistance, foreign_key: true
      t.text :descricao

      t.timestamps
    end
  end
end
