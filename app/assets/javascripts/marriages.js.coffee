# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ($) ->
  $('#menu a.parent').click (evt) ->
    evt.preventDefault()
    $(@).parent().find('.children').slideToggle()

  $('#menu a.load').click (evt) ->
    evt.preventDefault()
    $link = $(@)
    view_name = $link.data('url') || $link.text()
    $('#content').load("/marriages/load?view=#{view_name}")