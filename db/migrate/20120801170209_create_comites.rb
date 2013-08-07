class CreateComites < ActiveRecord::Migration
  def change
    create_table :comites do |t|
      t.string :nombre
      t.boolean :habilitado, :default => true
      t.integer :localidad_id

      t.timestamps
    end
  end
end
