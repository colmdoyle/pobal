# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$('.btn-search').click (e) ->
  if $('#form-input').val() == ''
    e.preventDefault()
    $('#form-search-group').addClass 'has-error'
  return

$('#form-input').focus ->
  $('#form-search-group').removeClass 'has-error'
  return
