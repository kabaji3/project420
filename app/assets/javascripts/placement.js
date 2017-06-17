$(document).on('turbolinks:load',function(){


  $(".sortable, .place-1").sortable({
    cancel: '.stop'
  });

  $(".sortable").sortable({
    connectWith: [".sortable", ".place-1"]
  });

  $(".place-1").sortable({
    connectWith: [".sortable"]
  });

  $(".place-1").sortable({
    connectWith: [".place-1"]
  });


  $(".sortable").disableSelection();
  $(".place-1").disableSelection();


  // $.cookie.defaults.path = "/";



  $(".sortable").sortable({
        update: function(event, ui) {
            var updateArray = $(".sortable").sortable("toArray").join(",");
            $.cookie("sortable", updateArray, {expires: 90});
        }
    });

    $(".place-1").sortable({
        update: function(event, ui) {
            var updateArray = $(".place-1").sortable("toArray").join(",");
            $.cookie("sortable1", updateArray, {expires: 90});
        }
    });

    if($.cookie("sortable")) {
        var cookieValue = $.cookie("sortable").split(",");
        $.each(cookieValue, function(index, value){
            $("#" + value).appendTo(".sortable");
        });
    }

    if($.cookie("sortable1")) {
        var cookieValue = $.cookie("sortable1").split(",");
        $.each(cookieValue, function(index, value){
            $("#" + value).appendTo(".place-1");
        });
    }
});