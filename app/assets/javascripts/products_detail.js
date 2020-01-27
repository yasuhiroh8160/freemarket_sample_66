//商品詳細ページのjavascript

$(document).on('turbolinks:load', function(){
  
  let views = $(".small-view");
  $('.inactive:first').removeClass("inactive").addClass("active");
  
  $('.imagebox-left__imagebox-bottom img').hover(function(){
    $('.active').removeClass("active").addClass("inactive");
    let num = views.index(this);
    $('.inactive').eq(num).removeClass("inactive").addClass("active");
  });
});