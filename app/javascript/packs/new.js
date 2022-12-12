function initMap() {
  var target = document.getElementById('map');
  var tokyo = { lat: 35.681167, lng: 139.767052 };  //東京駅の緯度経度
  var map = new google.maps.Map(document.getElementById('map'), {
    center: tokyo,
    zoom: 16
  });

  //情報ウィンドウのインスタンスの生成（後でマーカーに紐付け）
  var infowindow = new google.maps.InfoWindow();

  //PlacesService のインスタンスの生成（引数に map を指定）
  var service = new google.maps.places.PlacesService(map);

  //種類（タイプ）やキーワードをもとに施設を検索（プレイス検索）するメソッド nearbySearch()
  service.nearbySearch({
    location: tokyo,  //検索するロケーション
    radius: 500,  //検索する半径（メートル）
    type: ['store', 'cafe']  //タイプで検索。文字列またはその配列で指定
    //キーワードで検索する場合は name:'レストラン' や ['レストラン','中華'] のように指定
  }, callback);  //コールバック関数（callback）は別途定義

  //コールバック関数には results, status が渡されるので、status により条件分岐
  function callback(results, status) {
    // status は以下のような定数で判定（OK の場合は results が配列で返ってきます）
    if (status === google.maps.places.PlacesServiceStatus.OK) {
      //results の数だけ for 文で繰り返し処理
      for (var i = 0; i < results.length; i++) {
        //createMarker() はマーカーを生成する関数（別途定義）
        createMarker(results[i]);
      }
    }
  }

  //マーカーを生成する関数（引数には検索結果の配列 results[i] が入ってきます）
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
    });
  }
}
window.initMap = initMap;
