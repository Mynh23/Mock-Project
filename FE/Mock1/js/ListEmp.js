$(document).ready(function () {
    $('#search_btn').click(function () { 
      var key = $('#search').val().toLowerCase();
      $('#search_body tr').filter(function(){
        $(this).toggle($(this).text().toLowerCase().indexOf(key)>-1);
      });
    });
  });