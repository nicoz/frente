class Comite < ActiveRecord::Base
  attr_accessible :habilitado, :localidad_id, :nombre

  belongs_to :localidad
  has_many :adherentes

  validates :nombre, :uniqueness => true, :presence => true
  validates :localidad_id, :presence => true
  validates :localidad, :presence => true

  scope :activos, where(:habilitado => true)
  scope :inactivos, where(:habilitado => false)
  scope :comite_por_localidad, lambda { |localidad|
    where("localidad_id = ?", localidad)
  }
end
