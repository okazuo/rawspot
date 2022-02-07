document.addEventListener('DOMContentLoaded', function(){
  const animation_switch = document.getElementById('animation_switch');
  
  animation_switch.addEventListener('mouseover',function(){
    const logo =document.getElementById('animation')
    const marker =document.getElementById('animation_marker')
    const timeout_id = setTimeout(() => {
      logo.style.display='block'
      logo.style.opacity = '0.7';
      marker.style.display='block'
      marker.style.opacity = '0.7';
    }, 2000);
    
    animation_switch.addEventListener('mouseout',function(){
      clearTimeout(timeout_id)
      logo.style.display='none'
      marker.style.display='none'
    })
  })
})