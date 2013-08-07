class FacturaMes

  def initialize
    size = [600,200]
    @pdf = Prawn::Document.new(:page_size => size)
  end

  def prepararDocMeses(cuentas)
    @pdf.define_grid(:columns => 8, :rows => 3, :gutter => 0)

    #@pdf.grid.show_all
    total = 0

    cuentas.each do |cuenta|
      @pdf.start_new_page if total > 0
      total += 1

      @pdf.grid([0,0], [0,5]).bounding_box do
        @pdf.text "#{cuenta.adherente.apellidos}, #{cuenta.adherente.nombres}"
        localidad = "#{cuenta.adherente.localidad.nombre}"
        localidad += " - Comite: #{cuenta.adherente.comite.nombre}" unless cuenta.adherente.comite.nil?
        @pdf.text localidad
        @pdf.text "#{cuenta.adherente.direccion} - #{cuenta.adherente.telefono}"
        @pdf.stroke_horizontal_rule
      end

      @pdf.grid([0,6], [0,7]).bounding_box do
        fecha = Date.new(cuenta.anio, cuenta.mes, 1)
        @pdf.text "#{I18n.localize(fecha, :format => :short).capitalize} #{fecha.strftime("%Y")}"
        @pdf.text " "
        @pdf.text " "
        @pdf.stroke_horizontal_rule
      end

      @pdf.grid([1,1], [1,10]).bounding_box do
        @pdf.move_down 10
        @pdf.text "Importe a pagar: #{cuenta.importe}"
      end
    end
  end

  def prepararDocMes(cuenta)
    @pdf.define_grid(:columns => 8, :rows => 3, :gutter => 0)

    @pdf.grid([0,0], [0,5]).bounding_box do
      @pdf.text "#{cuenta.adherente.apellidos}, #{cuenta.adherente.nombres}"
      localidad = "#{cuenta.adherente.localidad.nombre}"
      localidad += " - Comite: #{cuenta.adherente.comite.nombre}" unless cuenta.adherente.comite.nil?
      @pdf.text localidad
      @pdf.text "#{cuenta.adherente.direccion} - #{cuenta.adherente.telefono}"
      @pdf.stroke_horizontal_rule
    end

    @pdf.grid([0,6], [0,7]).bounding_box do
      fecha = Date.new(cuenta.anio, cuenta.mes, 1)
      @pdf.text "#{I18n.localize(fecha, :format => :short).capitalize} #{fecha.strftime("%Y")}"
      @pdf.text " "
      @pdf.text " "
      @pdf.stroke_horizontal_rule
    end

    @pdf.grid([1,1], [1,10]).bounding_box do
      @pdf.move_down 10
      mensaje = "Importe a pagar: #{cuenta.importe}" if !cuenta.pagado
      mensaje = "El adherente pago: #{cuenta.importe}" if cuenta.pagado
      @pdf.text mensaje
    end
  end

  def render
    @pdf.render
  end
end
