class Calle < ActiveRecord::Base
  attr_accessible :habilitado, :localidad_id, :nombre

  belongs_to :localidad

  validates :nombre, :uniqueness => true, :presence => true
  validates :localidad_id, :presence => true
  validates :localidad, :presence => true

  def adherentes
    Adherente.where("calle_principal_id = ? or primera_lateral_id = ? or segunda_lateral_id = ? and habilitado = ?", id, id, id, true)
  end

  def to_s
    nombre
  end

  scope :activas, where(:habilitado => true)
  scope :inactivas, where(:habilitado => false)
  scope :por_nombre , lambda { |nombre| where("nombre like ?", "%#{nombre}%") }
  scope :por_localidad_y_nombre , lambda { |localidad, nombre|
    where("nombre like ? and localidad_id = ?", "%#{nombre}%", localidad.to_i)}
  scope :por_localidad_y_nombre_filtrado , lambda { |localidad, nombre, distinto1, distinto2|
    where("nombre like ? and localidad_id = ? and nombre != ? and nombre != ?", "%#{nombre}%", localidad.to_i, distinto1, distinto2) }
end
