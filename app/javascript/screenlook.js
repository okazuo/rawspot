document.addEventListener('DOMContentLoaded', function(){
  const spotForm = document.getElementById('new_spot');
  const wait_btn = document.getElementById('wait_btn')
  if (!spotForm) return null;
  
  wait_btn.addEventListener('click',function(){
    const element = document.createElement('div')
    element.style.height = '100%';
    element.style.position = 'fixed';
    element.style.left = '0px';
    element.style.top = '0px';
    element.style.width = '100%';
    element.style.zIndex = '999';
    element.style.opacity = '0.5';
    element.style.backgroundColor = 'black';
    const objBody = document.getElementsByTagName("body").item(0);
    objBody.appendChild(element);

    const logo =document.getElementById('animation')
    const marker =document.getElementById('animation_marker')
    const animessage =document.getElementById('animation_message')
    logo.style.display='block'
    logo.style.opacity = '1';
    marker.style.display='block'
    marker.style.opacity = '1';
    animessage.style.display='block'

  })
})
