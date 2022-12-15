function initMap() {
  const map = new google.maps.Map(document.getElementById("map"), {
    zoom: 16,
    center: { lat: 35.681167, lng: 139.767052 },
  });

  const infowindow = new google.maps.InfoWindow();
  const geocoder = new google.maps.Geocoder();

  document.getElementById("latlng").addEventListener("click", () => {
    geocodeLatLng(geocoder, map, infowindow);
  });

  const add = document.getElementById('address').value
  //const lat = document.getElementById('latitude').value
  //const lon = document.getElementById('longitude').value

  function geocodeLatLng(geocoder, map, infowindow) {
    const input = document.getElementById("latlng").value;
    const latlngStr = input.split(",", 2);
    const latlng = {
      lat: parseFloat(latlngStr[0]),
      lng: parseFloat(latlngStr[1]),
    };

    geocoder
      .geocode({ location: latlng })
      .then((response) => {
        if (response.results[0]) {
          map.setZoom(11);

          const marker = new google.maps.Marker({
            position: latlng,
            map: map,
          });

          infowindow.setContent(response.results[0].formatted_address);
          infowindow.open(map, marker);
        } else {
          window.alert("No results found");
        }
      })
      .catch((e) => window.alert("Geocoder failed due to: " + e));
  }

  function createMarker(place) {
    //var placeLoc = place.geometry.location;
    var marker = new google.maps.Marker({
      map: map,
      position: place.geometry.location  //results[i].geometry.location
    });

    //マーカーにイベントリスナを設定
    marker.addListener('click', function () {
      infowindow.setContent(place.name);  //results[i].name
      infowindow.open(map, this);

      let address = document.getElementById('address')
      let value = address.textContent = place.name;
      address.setAttribute('value', value);
      document.getElementById('v').textContent = place.geometry.location
    });
  }

}

window.initMap = initMap;
