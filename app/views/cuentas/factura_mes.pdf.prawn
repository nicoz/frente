size = [200, 200]

#pdf.page_size = size

pdf.define_grid(:columns => 8, :rows => 12, :gutter => 0)

#pdf.grid.show_all
total = 0

@cuentas.each do |cuenta|
  pdf.start_new_page if total > 0
  total += 1

  pdf.grid([0,0], [0,5]).bounding_box do
    pdf.text "#{cuenta.adherente.apellidos}, #{cuenta.adherente.nombres}"
    localidad = "#{cuenta.adherente.localidad.nombre}"
    localidad += " - Comite: #{cuenta.adherente.comite.nombre}" unless cuenta.adherente.comite.nil?
    pdf.text localidad
    pdf.text "#{cuenta.adherente.direccion} - #{cuenta.adherente.telefono}"
    pdf.stroke_horizontal_rule
  end

  pdf.grid([0,6], [0,7]).bounding_box do
    fecha = Date.new(cuenta.anio, cuenta.mes, 1)
    pdf.text "#{I18n.localize(fecha, :format => :short).capitalize} #{fecha.strftime("%Y")}"
    pdf.text " "
    pdf.text " "
    pdf.stroke_horizontal_rule
  end

  pdf.grid([1,1], [1,10]).bounding_box do
    pdf.text "Importe a pagar: #{cuenta.importe}"

  end
end
