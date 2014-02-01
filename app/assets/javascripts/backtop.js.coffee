$(document).ready ->
  offset = 150
  duration = 500
  $(window).scroll ->
    if $(this).scrollTop() > offset
      $(".glyphicon-chevron-up").fadeIn duration
    else
      $(".glyphicon-chevron-up").fadeOut duration

  $(".glyphicon-chevron-up").click (event) ->
    event.preventDefault()
    $("html, body").animate
      scrollTop: 0
    , duration
    false
