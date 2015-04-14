var catUrl = "";

$(window).scroll(function() {
   if($(window).scrollTop() + $(window).height() == $(document).height()) {
      for(var i = 0; i < 3; i++) {
        catUrl = "http://thecatapi.com/api/images/get?format=src"+"&"+Math.random()*Math.random();
        $("#bottomDiv").append("<img src=\""+catUrl+"\"></img>");
        carUrl = "";
      }
   }
});
