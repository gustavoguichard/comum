
$(function() {
  var $logo, $logoShadow, $mainHeader, logoX, logoY, moveShadow, setOpacity, shadowOffset;
  $mainHeader = $('#main_header');
  $mainHeader.append("<div id=\"logo-shadow\">");
  $logoShadow = $('#logo-shadow');
  $logo = $('#logo');
  logoX = parseInt($logo.offset().left);
  logoY = parseInt($logo.offset().top);
  shadowOffset = 1.06;
  $logoShadow.css({
    left: logoX,
    top: logoY
  });
  setOpacity = function(distance) {
    return 1.2 - distance / 800;
  };
  moveShadow = function(e) {
    var distance, distanceX, distanceY, mouseX, mouseY, shadowDistance, shadowPosLeft, shadowPosTop;
    console.log;
    mouseX = e.clientX;
    mouseY = e.clientY;
    distanceX = logoX - mouseX;
    distanceY = logoY - mouseY;
    distance = Math.sqrt(Math.pow(distanceX, 2) + Math.pow(distanceY, 2));
    shadowDistance = distance * shadowOffset;
    shadowPosLeft = (distanceX / distance * shadowDistance + mouseX) + "px";
    shadowPosTop = (distanceY / distance * shadowDistance + mouseY) + "px";
    return $logoShadow.css({
      left: shadowPosLeft,
      top: shadowPosTop,
      opacity: setOpacity(shadowDistance)
    });
  };
  return $mainHeader.on('mousemove', moveShadow);
});
