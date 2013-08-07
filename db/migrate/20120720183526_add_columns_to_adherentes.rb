class AddColumnsToAdherentes < ActiveRecord::Migration
  def change
    add_column :adherentes, :apellidos, :string
    add_index :adherentes, :apellidos
    add_column :adherentes, :nombres, :string
    add_index :adherentes, :nombres
    add_column :adherentes, :ci, :string
    add_index :adherentes, :ci, :unique => true
    add_column :adherentes, :cc, :string
    add_index :adherentes, :cc, :unique => true
    add_column :adherentes, :fecha_nacimiento, :date
    add_column :adherentes, :domicilio, :string
    add_column :adherentes, :telefono, :string
    add_column :adherentes, :domicilio_cobro, :string
    add_column :adherentes, :telefono_cobro, :string
    add_column :adherentes, :departamento, :string
    add_column :adherentes, :email, :string
    add_index :adherentes, :email
    add_column :adherentes, :coordinadora, :string
    add_column :adherentes, :comite, :string
    add_column :adherentes, :fecha_solicitud, :date
    add_column :adherentes, :cotizacion, :float
  end
end
