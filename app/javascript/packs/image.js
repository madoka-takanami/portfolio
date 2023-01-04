document.addEventListener('DOMContentLoaded', function () {
  document.getElementById('avatar-view').addEventListener(
    'change', (obj) => previewImage(obj)
  )
});

function previewImage(obj) {
  var fileReader = new FileReader();
  fileReader.onload = (function () {
    document.getElementById('preview').src = fileReader.result;
  });
  fileReader.readAsDataURL(obj.currentTarget.files[0]);
}
