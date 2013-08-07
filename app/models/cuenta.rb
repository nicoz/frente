class Cuenta < ActiveRecord::Base
  attr_accessible :adherente_id, :anio, :importe, :mes, :pagado

  belongs_to :adherente

  scope :deudora, where(:pagado => false)
  scope :historico, where(:pagado => true)
  scope :por_fecha, lambda { |anio, mes| where("anio = ? and mes = ?", anio, mes) }
  scope :por_adherente_y_fecha, lambda { |adherente, anio, mes| where("adherente_id = ? and anio = ? and mes = ?", adherente, anio, mes) }
  scope :orden_fecha, order(:anio, :mes)

  def self.generarMes(anio,mes)
    resultado = true
    adherentes = Adherente.con_cuenta.activos
    adherentes.each do |adherente|
       if adherente.cuentas.por_fecha(anio, mes).count() == 0
         cuenta = adherente.cuentas.build(:anio => anio.to_i, :mes => mes.to_i, :importe => adherente.cotizacion)
         resultado = cuenta.save
       end
    end

    resultado
  end
end
