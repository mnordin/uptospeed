$("#events-show").live("pagecreate", function(){
    var map_element = $("div[data-role='map']", this);
    var lat = $(map_element).data("lat");
    var lng = $(map_element).data("lng");
    init_map(lat, lng, map_element);
});

function init_map(lat, lng, element){
    var latlng = new google.maps.LatLng(lat, lng);
    var myOptions = {
        zoom: 15,
        center: latlng,
        disableDefaultUI: true,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(element[0], myOptions);
    resize_map(map, latlng);
    var marker = new google.maps.Marker({
        position: latlng, 
        map: map
    });
};

function resize_map(map, latlng){
    google.maps.event.trigger(map, 'resize');
}