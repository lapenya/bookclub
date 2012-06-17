findLocation = (location, marker) ->
  $("#map_canvas").gmap "search",
    location: location
  , (results, status) ->
    if status is "OK"
      $.each results[0].address_components, (i, v) ->
        if v.types[0] is "administrative_area_level_1" or v.types[0] is "administrative_area_level_2"
          $("#state" + marker.__gm_id).val v.long_name
        else $("#country" + marker.__gm_id).val v.long_name  if v.types[0] is "country"

      marker.setTitle results[0].formatted_address
      $("#address" + marker.__gm_id).val results[0].formatted_address
      openDialog marker

openDialog = (marker) ->
  $("#dialog").dialog
    modal: true
    title: "Edit and save point"
    buttons:
      Remove: ->
        $(this).dialog "close"
        marker.setMap null

      Save: ->
        $form = $(this).find('form')
        $.post($form.attr('action'), $form.serialize())
        $(this).dialog "close"

$("#map_canvas").gmap().bind "init", (event, map) ->
  # Load markers from DB
  $.getJSON $('#videos_url').data('url') + '.json', (data) ->
    $.each data, (i, marker) ->
      $("#map_canvas").gmap("addMarker",
        position: new google.maps.LatLng(marker.latitude, marker.longitude)
        bounds: true
      ).click ->
        $('#marker_content').load $('#videos_url').data('url') + '/' + marker.id + '.js'
        $("#map_canvas").gmap "openInfoWindow",
          content: $('#marker_content').html()
        , this

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

