function initMap() {
  const tokyo = { lat: 35.681167, lng: 139.767052 };
  const map = new google.maps.Map(document.getElementById('map'), {
    center: tokyo,
    zoom: 16
  });

  const infowindow = new google.maps.InfoWindow();
  const service = new google.maps.places.PlacesService(map);

  if (!navigator.geolocation) {
    infowindow.setPosition(map.getCenter());
    infowindow.setContent('現在地の取得に失敗しました');
    infowindow.open(map);
  }

  navigator.geolocation.getCurrentPosition(function (position) {
    const pos = {
      lat: position.coords.latitude,
      lng: position.coords.longitude
    };

    infowindow.setPosition(pos);
    infowindow.setContent('現在位置を取得しました');
    infowindow.open(map);
    map.setCenter(pos);

    service.nearbySearch({
      location: pos,
      radius: 500,
      type: ['cafe']
    }, callback);

    function callback(results, status) {
      if (status === google.maps.places.PlacesServiceStatus.OK) {
        for (var i = 0; i < results.length; i++) {
          createMarker(results[i]);
        }
      }
    }
  }, function () {
    infowindow.setPosition(map.getCenter());
    infowindow.setContent('位置情報が取得できませんでした');
    infowindow.open(map);
  });

  document.getElementById('search').addEventListener('click', function () {
    const inputKeyword = document.getElementById('keyword').value
    const geocoder = new google.maps.Geocoder();
    geocoder.geocode({ address: inputKeyword }, function (results, status) {
      if (status == 'OK') {
        map.setCenter(results[0].geometry.location);
        service.nearbySearch({
          location: results[0].geometry.location,
          radius: 500,
          type: ['cafe']
        }, callback);

        function callback(results, status) {
          if (status === google.maps.places.PlacesServiceStatus.OK) {
            for (var i = 0; i < results.length; i++) {
              createMarker(results[i]);
            }
          }
        }
      } else {
        alert('該当する結果はありませんでした:' + status)
      }
    })
  })

  function createMarker(place) {
    const marker = new google.maps.Marker({
      map: map,
      position: place.geometry.location
    });

    marker.addListener('click', function () {
      infowindow.setContent(place.name);
      infowindow.open(map, this);
      let address = document.getElementById('address')
      let value = document.getElementById('address').textContent = place.name;
      address.setAttribute('value', value);
    });
  }
}

window.initMap = initMap;
