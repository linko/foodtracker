$ ->
  if $('#period').length > 0
    $('#period').change ->
      location.href = '/reports?period=' + $('#period').val()
