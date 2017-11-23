//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require cable.js
//= require init_attachinary.js

$(function() {
  if (window.location.search.match(/sign_in=true/)) {
    $(".btn-nav[data-target='#modalSignIn']").click()
  }
});