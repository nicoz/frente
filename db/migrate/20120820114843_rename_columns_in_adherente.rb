class RenameColumnsInAdherente < ActiveRecord::Migration
  def up
  	rename_column :adherentes, :calle_principal, :calle_principal_id
  	rename_column :adherentes, :primera_lateral, :primera_lateral_id
  	rename_column :adherentes, :segunda_lateral, :segunda_lateral_id
  end

  def down
  end
end
