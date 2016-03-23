jQuery(function(){

  var cookie_val = document.cookie.replace(/(?:(?:^|.*;\s*)major\s*\=\s*([^;]*).*$)|^.*$/, "$1");
  $('select').val(cookie_val);

  $('select').change(function(){
    var major = $(this).val();
    document.cookie = "major=" + major;
    window.location.href = window.location.href.replace( /[\?#].*|$/, "?major=" + major );
  })
});
