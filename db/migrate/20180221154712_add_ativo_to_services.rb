class AddAtivoToServices < ActiveRecord::Migration[5.1]
  def up
    add_column :services, :ativo, :boolean, default: true
    Service.update_all(ativo: true)
  end

  def down
    remove_column :services, :ativo, :boolean, default: true
  end

end
