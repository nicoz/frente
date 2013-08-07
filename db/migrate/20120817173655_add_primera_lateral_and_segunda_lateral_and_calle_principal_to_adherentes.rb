class AddPrimeraLateralAndSegundaLateralAndCallePrincipalToAdherentes < ActiveRecord::Migration
  def change
    add_column :adherentes, :calle_principal, :integer
    add_column :adherentes, :primera_lateral, :integer
    add_column :adherentes, :segunda_lateral, :integer
  end
end
