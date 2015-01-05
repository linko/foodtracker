# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  if $('#activity_date').length > 0
    $('#activity_date').datepicker dateFormat: 'yy-mm-dd'
    $('.icon-plus').click ->
      $('.descriptions').append $('.template').html()

    $('.icon-trash').live 'click', ->
      $(this).closest('.control-group').remove()
