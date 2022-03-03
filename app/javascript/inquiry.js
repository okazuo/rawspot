document.addEventListener('DOMContentLoaded', function(){
  const inquiry_btn = document.getElementById('inquiry_btn');
  const grayback = document.getElementById('grayback');
  const guide_message = document.getElementById('inquiry_message');

  inquiry_btn.addEventListener('click', () => {
    grayback.style.display = 'block';
    guide_message.style.display = 'block';
  });
  grayback.addEventListener('click', () => {
    grayback.style.display = 'none';
    guide_message.style.display = 'none';
  });
})