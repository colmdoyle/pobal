# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
input = document.getElementById('form-input')
options = {componentRestrictions:{country:'ie'}}
autocomplete = new google.maps.places.Autocomplete(input,options)
