$ ->
  $("#period").change ->
    location.href = "/reports?period=" + $("#period").val()
