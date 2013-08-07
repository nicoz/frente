class AddDefaultValueToHabilitadoInLocalidades < ActiveRecord::Migration
  def change
  	change_column :localidads, :habilitado, :boolean, :default => true
  end
end
