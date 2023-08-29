console.log('hoge')
document.addEventListener("turbolinks:load", function(){
    const test = document.getElementById('test');
    const btn = document.getElementById('btn');
    btn.addEventListener('click', () => {
      if(test.classList.contains('test2')){//　containsメソッドで、test2クラスが既に付与されているか判定 
        test.classList.remove('test2');
      }else{
        test.classList.add('test2');
      }
    });
});
  
