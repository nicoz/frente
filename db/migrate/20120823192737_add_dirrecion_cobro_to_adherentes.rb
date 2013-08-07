class AddDirrecionCobroToAdherentes < ActiveRecord::Migration
  def change
    add_column :adherentes, :calle_principal_cobro_id, :integer
    add_column :adherentes, :primera_lateral_cobro_id, :integer
    add_column :adherentes, :segunda_lateral_cobro_id, :integer
  end
end
