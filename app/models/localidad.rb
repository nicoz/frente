class Localidad < ActiveRecord::Base
  attr_accessible :habilitado, :nombre

  validates :nombre, :uniqueness => true, :presence => true

  has_many :adherentes
  has_many :comites

  scope :activos, where(:habilitado => true)
  scope :inactivos, where(:habilitado => false)
end
