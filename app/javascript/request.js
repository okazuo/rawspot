document.addEventListener('DOMContentLoaded', function(){
  const request_btn = document.getElementById('request_btn');
  const grayback = document.getElementById('grayback');
  const guide_message = document.getElementById('request_message');

  request_btn.addEventListener('click', () => {
    grayback.style.display = 'block';
    guide_message.style.display = 'block';
  });
  grayback.addEventListener('click', () => {
    grayback.style.display = 'none';
    guide_message.style.display = 'none';
  });
})