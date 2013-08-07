def buscador(clase, query)
    texto = query.split(" ")
    consulta = ""
    columnas = clase.constantize.columns
    cantidad = 0

    columnas.each do |columna|
      texto.each do |palabra|
        consulta += " or " if !consulta.empty? and columna.type == :string
        consulta += "#{columna.name} like ?" if columna.type == :string
        cantidad += 1 if columna.type == :string

      end
    end
    i = 0
    texto.each do |palabra|
      texto[i] = "%#{palabra}%"
      i += 1
    end

    resultado = clase.constantize.where(consulta, *(texto * (cantidad / texto.size)))
    return resultado
end

def buscador_con_cuenta(clase, query)
    texto = query.split(" ")
    consulta = "cotizacion > 0 and ("
    columnas = clase.constantize.columns
    cantidad = 0

    columnas.each do |columna|
      texto.each do |palabra|
        consulta += " or " if !consulta.empty? and columna.type == :string
        consulta += "#{columna.name} like ?" if columna.type == :string
        cantidad += 1 if columna.type == :string

      end
    end
    consulta += ")"
    i = 0
    texto.each do |palabra|
      texto[i] = "%#{palabra}%"
      i += 1
    end

    resultado = clase.constantize.where(consulta, *(texto * (cantidad / texto.size)))
    return resultado
end
