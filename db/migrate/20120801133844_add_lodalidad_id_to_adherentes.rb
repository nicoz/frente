class AddLodalidadIdToAdherentes < ActiveRecord::Migration
  def change
    add_column :adherentes, :localidad_id, :integer
  end
end
