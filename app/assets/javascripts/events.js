
// Events map
var latlng;
$("#events-map").live("pageinit", function() {
    var lat = $("#map").data("lat");
    var lng = $("#map").data("lng");
    latlng = new google.maps.LatLng(lat, lng);
    $("#map").gmap({
        "zoom": 15,
        "center": latlng
    });
});
$("#events-map").live("pageshow", function() {
    $("#map").gmap('refresh');
    $("#map").gmap('addMarker', { 'position': latlng } );
    $("#map").gmap({"center": latlng});
});
