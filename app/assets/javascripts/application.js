//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require cable.js
//= require init_attachinary.js
//= require instafeed.min.js
//= require typing
//= require scrollreveal.js
//= require jquery.sticky.js

$(function() {
  if (window.location.search.match(/sign_in=true/)) {
    $(".btn-nav[data-target='#modalSignIn']").click()
  }

  $("#sticker").sticky({topSpacing:0});

  $(".card-filters-container select").on("change", function() {
    $(this).parents('form').submit();
  })
});

