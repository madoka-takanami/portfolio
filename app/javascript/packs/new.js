let map
let marker

function initMap() {
  geocoder = new google.maps.Geocoder()

  map = new google.maps.Map(document.getElementById('map'), {
    center: { lat: 40.7828, lng: -73.9653 },
    zoom: 12,
  });

  marker = new google.maps.Marker({
    position: { lat: 40.7828, lng: -73.9653 },
    map: map
  });


  document.getElementById('search').addEventListener('click', function () {

    const inputKeyword = document.getElementById('keyword').value
    const geocoder = new google.maps.Geocoder();

    geocoder.geocode({ address: inputKeyword }, function (results, status) {
      if (status == 'OK') {

        map.setCenter(results[0].geometry.location);
        marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
        });
      } else {
        alert('該当する結果はありませんでした:' + status)
      }
    })
  })
}


window.initMap = initMap;
