$(document).on('turbolinks:load', ()=> {
  $(function(){
    $(".menu").click( tabClicked );
    
    function tabClicked (e) {
      e.preventDefault();
      $(".select").removeClass("select");
      $(this).addClass("select");
      var id_name = $(this).attr("href");
      $(".mypage-top-notification").removeClass("current");
      $(id_name).addClass("current");
    }
  })
  
  $(function(){
    $(".tab").click( tabClicked );
    
    function tabClicked (e) {
      e.preventDefault();
      $(".active").removeClass("active");
      $(this).addClass("active");
      var id_name = $(this).attr("href");
      $(".not-found").removeClass("show");
      $(id_name).addClass("show");
    }
  })
});  



