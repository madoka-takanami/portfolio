const btn = document.getElementById('js-btn');
const modal = document.getElementById('modal');
const closeBtn = document.getElementById('closeBtn');

btn.addEventListener('click', function () {
  modal.style.display = 'block';
});

closeBtn.addEventListener('click', function () {
  modal.style.display = 'none';
  window.location.reload();
});
