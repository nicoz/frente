class Adherente < ActiveRecord::Base
  attr_accessible :nombres, :apellidos, :ci, :cc, :fecha_nacimiento,
                  :domicilio, :telefono, :domicilio_cobro, :telefono_cobro,
  		  :departamento, :email, :coordinadora, :fecha_solicitud,
  		  :cotizacion, :localidad_id, :comite_id, :calle_principal_id, :primera_lateral_id, :segunda_lateral_id,
  		  :calle_principal_cobro_id, :primera_lateral_cobro_id, :segunda_lateral_cobro_id,
        :calle_principal, :primera_lateral, :segunda_lateral


  validates :nombres,:apellidos, :ci, :cc, :presence => true
  validates :ci, :uniqueness => true
  validates :cc, :uniqueness => true

  belongs_to :localidad
  belongs_to :comite

  #calles domicilio
  belongs_to :calle_principal, :class_name => 'Calle', :foreign_key => :calle_principal_id
  belongs_to :primera_lateral, :class_name => 'Calle', :foreign_key => :primera_lateral_id
  belongs_to :segunda_lateral, :class_name => 'Calle', :foreign_key => :segunda_lateral_id

  #calles domicilio cobro
  belongs_to :calle_principal_cobro, :class_name => 'Calle', :foreign_key => :calle_principal_cobro_id
  belongs_to :primera_lateral_cobro, :class_name => 'Calle', :foreign_key => :primera_lateral_cobro_id
  belongs_to :segunda_lateral_cobro, :class_name => 'Calle', :foreign_key => :segunda_lateral_cobro_id

  has_many :cuentas

  scope :activos, where(:habilitado => true)
  scope :inactivos, where(:habilitado => false)
  scope :rango_etareo, lambda { |desde, hasta| where("fecha_nacimiento between ? and ?", desde, hasta) }
  scope :por_comite, lambda { |comite| where("comite_id = ?", comite)}
  scope :con_cuenta, where("cotizacion > 0")

  def estado_cuenta_corriente()
    saldo = 0
    cuentas.deudora.each do |cuenta|
      saldo += cuenta.importe unless cuenta.importe.nil?
    end

    saldo
  end

  def direccion()
    dir = "#{calle_principal.nombre unless calle_principal.nil?} #{domicilio}"
    dir += "#{" Entre #{primera_lateral.nombre}" unless primera_lateral.nil?}"
    dir += "#{" Entre #{segunda_lateral.nombre}" unless segunda_lateral.nil?}" if primera_lateral.nil?
    dir += "#{" y #{segunda_lateral.nombre}" unless primera_lateral.nil? and segunda_lateral.nil?}" unless primera_lateral.nil?
  end

  def edad()
    age = Date.today.year - fecha_nacimiento.year unless fecha_nacimiento.nil?
    age = 1 if age.nil? or age = 0
  end

end
