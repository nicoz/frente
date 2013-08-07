class CreateCalles < ActiveRecord::Migration
  def change
    create_table :calles do |t|
      t.string :nombre
      t.integer :localidad_id
      t.boolean :habilitado, :default => true

      t.timestamps
    end
  end
end
