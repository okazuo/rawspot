document.addEventListener('DOMContentLoaded', function () {
  if (document.getElementById('spot_image')) {
    const ImageList = document.getElementById('image-list');

    // 画像を表示する関数を定義
    const createImageHTML = (blob) => {
      // 画像を表示するためのdiv,image_srcを生成
      const imageElement = document.createElement('div');
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      blobImage.classList.add('preview-size');
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement)
    };

    document.getElementById('spot_image').addEventListener('change', function (e) {
      const imageContent = document.querySelector('img');
      if (imageContent) {
        imageContent.remove();
      }
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  };
});