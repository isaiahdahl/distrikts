//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require cable.js
//= require init_attachinary.js
//= require instafeed.min.js
//= require jquery.sticky.js

$(function() {
  if (window.location.search.match(/sign_in=true/)) {
    $(".btn-nav[data-target='#modalSignIn']").click()
  }
});

$(document).ready(function(){
  $("#sticker").sticky({topSpacing:0});
});