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

  var audioCtx = new (window.AudioContext || window.webkitAudioContext)();
  var audioElement = document.getElementById('audioElement');
  var audioSrc = audioCtx.createMediaElementSource(audioElement);
  var analyser = audioCtx.createAnalyser();

  // Bind our analyser to the media element source.
  audioSrc.connect(analyser);
  audioSrc.connect(audioCtx.destination);

  //var frequencyData = new Uint8Array(analyser.frequencyBinCount);
  var frequencyData = new Uint8Array(200);

  var svgHeight = '150';
  var svgWidth = '2000';
  var barPadding = '4';

  function createSvg(parent, height, width) {
    return d3.select(parent).append('svg').attr('height', height).attr('width', width);
  }

  var svg = createSvg('body', svgHeight, svgWidth);

  // Create our initial D3 chart.
  svg.selectAll('rect')
     .data(frequencyData)
     .enter()
     .append('rect')
     .attr('x', function (d, i) {
        return i * (svgWidth / frequencyData.length);
     })
     .attr('width', svgWidth / frequencyData.length - barPadding);

  // Continuously loop and update chart with frequency data.
  function renderChart() {
     requestAnimationFrame(renderChart);

     // Copy frequency data to frequencyData array.
     analyser.getByteFrequencyData(frequencyData);

     // Update d3 chart with new data.
     svg.selectAll('rect')
        .data(frequencyData)
        .attr('y', function(d) {
           return svgHeight - d;
        })
        .attr('height', function(d) {
           return d;
        })
        .attr('fill', function(d) {
           return 'rgb(215, 44, 69)';
        });

  }

  // Run the loop
  renderChart();

});



// $( document ).ready(function() {
//     console.log( "ready!" );
// // =====================WEB AUDIO API EQUALIZER ========================

//   // Create a new instance of an audio object and adjust some of its properties
//   var audio = new Audio();
//   audio.src = 'Along-The-Coastline.mp3';
//   audio.controls = true;
//   audio.loop = true;
//   audio.autoplay = true;
//   // Establish all variables that your Analyser will use
//   var canvas, ctx, source, context, analyser, fbc_array, bars, bar_x, bar_width, bar_height;
//   // Initialize the MP3 player after the page loads all of its HTML into the window
//   window.addEventListener("load", initMp3Player, false);
//   function initMp3Player(){
//     document.getElementById('audio_box').appendChild(audio);
//     context = new AudioContext(); // AudioContext object instance
//     analyser = context.createAnalyser(); // AnalyserNode method
//     canvas = document.getElementById('analyser_render');
//     ctx = canvas.getContext('2d');
//     // Re-route audio playback into the processing graph of the AudioContext
//     source = context.createMediaElementSource(audio); 
//     source.connect(analyser);
//     analyser.connect(context.destination);
//     frameLooper();
//   }

//   // frameLooper() animates any style of graphics you wish to the audio frequency
//   // Looping at the default frame rate that the browser provides(approx. 60 FPS)
//   function frameLooper(){
//     window.requestAnimationFrame(frameLooper);
//     fbc_array = new Uint8Array(analyser.frequencyBinCount);
//     analyser.getByteFrequencyData(fbc_array);
//     ctx.clearRect(0, 0, canvas.width, canvas.height); // Clear the canvas
//     ctx.fillStyle = '#00CCFF'; // Color of the bars
//     bars = 100;
//     for (var i = 0; i < bars; i++) {
//       bar_x = i * 3;
//       bar_width = 2;
//       bar_height = -(fbc_array[i] / 2);
//       //  fillRect( x, y, width, height ) // Explanation of the parameters below
//       ctx.fillRect(bar_x, canvas.height, bar_width, bar_height);
//     }
//   };
// });


