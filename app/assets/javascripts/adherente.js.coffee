$ ->
  localidad = $('#adherente_localidad_id').val()

  if $('#adherentes').length > 0
    if $('#adherente_localidad_id').length > 0

      $('#adherente_localidad_id').change (e) ->
        localidad = $(this).val()
        if localidad == '' or localidad == null
          localidad = 0

        url = "/comites/#{localidad}/dar_comites/"
        $.ajax
          url: url,
          success: (data) ->
            $('#adherente_comite_id').find('option').remove()
            $('#adherente_comite_id').append("""
              <option value=''>Ningun Comite</option>
            """
            )
            $.each( data.items, (i, item) ->
              $('#adherente_comite_id').append("""
                <option value='#{item.id}'>#{item.nombre}</option>
              """
              )
            )

   $(".autocompleta:not(.ui-autocomplete-input)").live("focus", (event) ->
     nombre = $(this).attr('id')
     campo = $(this).attr('name')
     padre = $(this).parent()
     $(this).autocomplete
       source: (request, response) ->
         calle_principal = $('#adherente_calle_principal_nombre').val()
         primera_lateral = $('#adherente_primera_lateral_nombre').val()
         segunda_lateral = $('#adherente_segunda_lateral_nombre').val()
         traer_datos(request, response, nombre, localidad, calle_principal, primera_lateral, segunda_lateral)
       minLength: 2
       autoFocus: true
       select: (event, ui) ->
         valor = ui.item.value
     )



traer_datos = (request, response, campo, localidad, calle_principal, primera_lateral, segunda_lateral) ->
  if localidad == '' or localidad == null
    localidad = 0

  url = "/calles/#{localidad}/por_localidad_y_nombre_filtrado"
  $.ajax
    async: false,
    url: url,
    data:
      term: request.term
      campo: campo
      calle_principal: calle_principal
      primera_lateral: primera_lateral
      segunda_lateral: segunda_lateral
    success: (data) ->
      response(data)
