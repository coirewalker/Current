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
  $("#soundcloud_widget").hide().fadeIn(4000);
  $("#new-zip").hide().delay(3500).fadeIn(4000);
  $("#slogan").hide().fadeIn(4000);
  $("#now-playing").hide().fadeIn(4000);

	$('#load_screen_div').bind('ajax:loading', function(){
	  $('#load_gif').show();
	});

	$('#load_screen_div').bind('ajax:complete', function(){
	  $('#load_gif').hide();
	  // add what you like here
	});


 // function scUrl(trackId) {
 //       return "http://w.soundcloud.com/player/?url=https://api.soundcloud.com/tracks/" + trackId.toString() + "&show_artwork=false&liking=false&sharing=false&auto_play=true"
 //      }
 //    function scTrackUrl(trackId) {
 //       return "https://api.soundcloud.com/tracks/" + trackId.toString()
 //      }
 //    var scTracks = [139587189, 48395995, 48395993, 48395998];
 //    var trackCount = 0;
 //    // $(document).ready(function() {
     
 //      var widget = SC.Widget(document.getElementById('soundcloud_widget'));
      
 //      widget.bind(SC.Widget.Events.FINISH, function() {
 //        console.log('Song Finished');
 //        widget.load(scTrackUrl(scTracks[trackCount]), {auto_play: true});
 //        // $('#soundcloud_widget').attr('src', scUrl(scTracks[trackCount]));
 //          if (trackCount <= (scTracks.length - 1))  {
 //            trackCount++;
 //            console.log("Track count is now: " + trackCount)
 //          } 
 //          else {
 //             trackCount = 0;
 //          }
 //          // widget.seekTo(0);
 //          // widget.play(); 
 //      });

 //     widget.bind(SC.Widget.Events.READY, function() {
 //       console.log('Ready...');
 //     });
     
 //     $('button').click(function(e) {
 //       e.preventDefault();
 //       widget.toggle();
 //     });

 //   // });

});












