$ ->
  $mainHeader = $('#main_header')
  $mainHeader.append("<div id=\"logo-shadow\">")
  $logoShadow = $('#logo-shadow')
  $logo = $('#logo')
  logoX = parseInt($logo.offset().left)
  logoY = parseInt($logo.offset().top)
  shadowOffset = 1.02
  $logoShadow.css
    left: logoX
    top: logoY

  setOpacity = (distance)->
    (1.2 - distance /800)

  moveShadow = (e) ->
    console.log
    mouseX          = e.clientX
    mouseY          = e.clientY
    distanceX       = logoX - mouseX
    distanceY       = logoY - mouseY
    distance        = Math.sqrt(Math.pow(distanceX, 2) + Math.pow(distanceY, 2))
    shadowDistance  = distance * shadowOffset
    shadowPosLeft   = (distanceX / distance * shadowDistance + mouseX)
    shadowPosTop    = (distanceY / distance * shadowDistance + mouseY)
    $logoShadow.css
      left: shadowPosLeft + "px"
      top: shadowPosTop + "px"
      opacity: setOpacity(shadowDistance)

  $(document).on 'mousemove', moveShadow
  $(window).on 'resize', ->
    logoX = parseInt($logo.offset().left)
    logoY = parseInt($logo.offset().top)
