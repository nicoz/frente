$ ->
  if $('#cuentas').length > 0
    $('#anio').blur ->
      anio = $(this).val()
      if !validar_anio(anio)
        $(this).parent().addClass("field_with_errors error")
        $(this).parent().parent().find('label').parent().addClass("field_with_errors")
      else
        $(this).parent().removeClass("field_with_errors error")
        $(this).parent().parent().find('label').parent().removeClass("field_with_errors")
      habilitar()



    $('#mes').blur ->
      mes = $(this).val()
      if !validar_mes(mes)
        $(this).parent().addClass("field_with_errors error")
        $(this).parent().parent().find('label').parent().addClass("field_with_errors")
      else
        $(this).parent().removeClass("field_with_errors error")
        $(this).parent().parent().find('label').parent().removeClass("field_with_errors")
      habilitar()

validar_mes = (mes) ->
  #alert 'validando mes'
  correcto = true
  if (mes == null or mes == '' or parseInt(mes) == 0)
    correcto = false

  if ( parseInt(mes) <= 0 or parseInt(mes) > 12 )
    correcto = false

  correcto

validar_anio = (anio) ->
  #alert 'validando anio'
  correcto = true
  if (anio == null or parseInt(anio) <= 0 or anio == '')
    correcto = false

  if parseInt(anio) <= 0 or parseInt(anio) > 2500
    correcto = false

  correcto

habilitar = ->
  if $('.error').length > 0
    $('input[type="submit"]').attr "disabled", "disabled"
    false
  else
    $('input[type="submit"]').removeAttr "disabled"
    true
