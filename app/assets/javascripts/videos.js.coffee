findLocation = (location, marker) ->
  $("#map_canvas").gmap "search",
    location: location
  , (results, status) ->
    if status is "OK"
      $.each results[0].address_components, (i, v) ->
        if v.types[0] is "administrative_area_level_1" or v.types[0] is "administrative_area_level_2"
          $("#video_state").val v.long_name
        else $("#video_country").val v.long_name  if v.types[0] is "country"

      marker.setTitle results[0].formatted_address
      $("#video_address").val results[0].formatted_address
    openDialog marker

openDialog = (marker) ->
  $("#dialog").dialog
    modal: true
    title: "Vídeo"
    buttons:
      Borrar: ->
        $(this).dialog "close"
        marker.setMap null

      Guardar: ->
        $form = $(this).find('form')
        if !$form.find('#video_name').val() || !$form.find('#video_name').val()
          alert('Introduce nombre y dirección de Youtube')
        else
          $.post($form.attr('action'), $form.serialize())
          $(this).dialog "close"

$("#map_canvas").gmap({'disableDefaultUI':true}).bind "init", (event, map) ->

  # Load markers from DB
  $.getJSON $('#videos_url').data('url') + '.json', (data) ->
    $.each data, (i, marker) ->
      $("#map_canvas").gmap("addMarker",
        position: new google.maps.LatLng(marker.latitude, marker.longitude)
        bounds: true
        #icon: window.location.origin + "/assets/inter.png"
      ).click ->
        content = $('#marker_content').html().replace('guid', marker.guid).replace('<!--', '').replace('-->', '')
        $("#map_canvas").gmap "openInfoWindow",
          content: content
        , this

    $('#map_canvas').gmap('set', 'MarkerClusterer', new MarkerClusterer($('#map_canvas').gmap('get', 'map'), $('#map_canvas').gmap('get', 'markers')))

  # Set market on click
  $(map).click (event) ->
    $("#map_canvas").gmap("addMarker",
      position: event.latLng
      draggable: true
      bounds: false
    , (map, marker) ->
      findLocation marker.getPosition(), marker
      $('#video_latitude').val(marker.getPosition().lat())
      $('#video_longitude').val(marker.getPosition().lng())
    ).dragend((event) ->
      findLocation event.latLng, this
    ).click ->
      openDialog this




