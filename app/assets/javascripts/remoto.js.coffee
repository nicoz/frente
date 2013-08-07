$ ->
  if $('.remoto').length > 0

    link = ''
    url = ''

    $('.remoto a').not('.directo').click (event) ->
      event.preventDefault
      link = $(this)
      url = link.attr('href')
      id = link.attr('data-id')

      $.ajax
        url: url,
        type: 'post',
        async: false,
        data:
          id: id
        success: ->
          location.reload()
          false

      false
