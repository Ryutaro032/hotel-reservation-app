document.addEventListener("turbolinks:load", function(){
    const dropdown_list = document.getElementById('dropdown_list');
    const btn  = document.getElementById('btn');
    btn.addEventListener('click', () => {
      if(dropdown_list.classList.contains('open')){
        dropdown_list.classList.remove('open');
      }else{
        dropdown_list.classList.add('open');
      }
    });
});
  
