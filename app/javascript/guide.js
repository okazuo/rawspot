document.addEventListener('DOMContentLoaded', function(){
  const guide_btn = document.getElementById('guide_btn');
  const grayback = document.getElementById('grayback');
  const guide_message = document.getElementById('guide_message');

  guide_btn.addEventListener('click', () => {
    grayback.style.display = 'block';
    guide_message.style.display = 'block';
  });
  grayback.addEventListener('click', () => {
    grayback.style.display = 'none';
    guide_message.style.display = 'none';
  });
})