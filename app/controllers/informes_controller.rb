class InformesController < ApplicationController
  before_filter :authenticate_user!

  def index

  end

  def etareos
    desde = Date.current - 24.years
    hasta = Date.current - 18.years
    @r18_24 = Adherente.rango_etareo(desde, hasta).activos.count()

    desde = Date.current - 40.years
    hasta = Date.current - 25.years
    @r25_40 = Adherente.rango_etareo(desde, hasta).activos.count()

    desde = Date.current - 60.years
    hasta = Date.current - 41.years
    @r41_60 = Adherente.rango_etareo(desde, hasta).activos.count()

    desde = Date.current - 80.years
    hasta = Date.current - 61.years
    @r61_80 = Adherente.rango_etareo(desde, hasta).activos.count()

    desde = Date.current - 150.years
    hasta = Date.current - 81.years
    @r81  = Adherente.rango_etareo(desde, hasta).activos.count()

    @total = @r18_24 + @r25_40 + @r41_60 + @r61_80 + @r81

    @p18_24 = ((@r18_24.to_f / @total.to_f)* 100).round
    @p25_40 = ((@r25_40.to_f / @total.to_f)* 100).round
    @p41_60 = ((@r41_60.to_f / @total.to_f)* 100).round
    @p61_80 = ((@r61_80.to_f / @total.to_f)* 100).round
    @p81 = ((@r81.to_f / @total.to_f)* 100).round
  end

  def comites
    @comites = Array.new
    total = Adherente.activos.count()

    lista_comites = Comite.activos
    lista_comites.each do |comite|
      porcentaje = (Adherente.por_comite(comite.id).activos.count().to_f / total) * 100 
      linea = [comite.nombre, ("%0.1f" % porcentaje).to_f]
      @comites << linea
    end

  end

end
