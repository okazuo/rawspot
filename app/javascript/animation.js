document.addEventListener('DOMContentLoaded', function(){
  const animation_switch = document.getElementById('animation_switch');
  
  animation_switch.addEventListener('mouseover',function(){
    const logo =document.getElementById('gradation_animation')
    const marker =document.getElementById('gradation_animation_marker')
    const timeout_id = setTimeout(() => {
      logo.style.display='block'
      marker.style.display='block'
    }, 3000);
    
    animation_switch.addEventListener('mouseout',function(){
      clearTimeout(timeout_id)
      logo.style.display='none'
      marker.style.display='none'
    })
  })
})