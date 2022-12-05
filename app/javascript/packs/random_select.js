var btn = document.getElementById('js-btn');
var modal = document.getElementById('modal');
var closeBtn = document.getElementById('closeBtn');

btn.addEventListener('click', function () {
  modal.style.display = 'block';
});

///ボタンを押した時、モーダルを消したい時
closeBtn.addEventListener('click', function () {
  modal.style.display = 'none';
});

//ボタンじゃなくて黒い部分を押した時、にモーダルを消したいとき
//window.addEventListener('click', function (e) {
//  if (e.target == modal) {
//    modal.style.display = 'none';
//  }
//});
