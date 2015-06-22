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
//= require turbolinks
//= require_tree .



// $( document ).ready(function() {
//     console.log( "ready!" );

// function playSomeSound(genre) {
// 	SC.get('/tracks', {
// 		genres: genre, 
// 		bpm: {
// 			from: 100
// 		}
// 	}, 
// 	//callback function.  picks random track from query results
// 	function(tracks)  {
// 		console.dir(tracks)
// 		var random = Math.floor(Math.random() * 10);
// 		// embeds soundcloud player
// 		SC.oEmbed(tracks[random].uri, { auto_play: true }, document.getElementById('target'));
// 	});
// }

// window.onload = function() {
// 	SC.initialize({
// 		client_id: 'ddac1035019e721df71b51a0e6d38a7f'
// 	});
// 	// set menuLinks = .genre
// 	var menuLinks = document.getElementsByClassName('genre');
// 	for (var i = 0; i < menuLinks.length; i++) {
// 		var menuLink = menuLinks[i];
// 		// plays playSomeSound
// 		menuLink.onclick = function(e) {
// 			e.preventDefault();
// 			playSomeSound(menuLink.innerHTML);
// 		};
// 	}
// };

//////
// /users/{id}/tracks

// });