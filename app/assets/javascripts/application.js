// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$(document).ready(function () {

	$(".ball").hide().delay(4000).fadeIn(4500);
  $(".play_button_show").hide().delay(5500).fadeIn(4000);
  $("footer").hide().delay(3500).fadeIn(4000);
  $("#new-zip").hide().delay(3500).fadeIn(4000);
  $("#slogan").hide().fadeIn(4000);
  $("#now-playing").hide().fadeIn(4000);

});




