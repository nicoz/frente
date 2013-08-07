class CreateCuenta < ActiveRecord::Migration
  def change
    create_table :cuenta do |t|
      t.integer :mes
      t.integer :anio
      t.float :importe
      t.boolean :pagado, :default => false
      t.integer :adherente_id

      t.timestamps
    end

    add_index :cuenta, [:anio, :mes, :adherente_id], :unique => true

  end
end
