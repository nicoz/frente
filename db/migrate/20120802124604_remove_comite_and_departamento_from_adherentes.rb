class RemoveComiteAndDepartamentoFromAdherentes < ActiveRecord::Migration
  def up
  	remove_column :adherentes, :comite
  	remove_column :adherentes, :departamento
  end

  def down
  end
end
