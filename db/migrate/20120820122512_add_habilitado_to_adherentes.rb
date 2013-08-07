class AddHabilitadoToAdherentes < ActiveRecord::Migration
  def change
    add_column :adherentes, :habilitado, :boolean, :default => true
  end
end
