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
//= require foundation
//= require_tree .

$(function(){ $(document).foundation(); });

$(function() {
  var heart = $('.fa-heart.profile-icon')
  var barchart = $('.fa-bar-chart.profile-icon')
  var comments = $('.fa-comments-o.profile-icon')

  heart.addClass('animated fadeInDown');
  barchart.addClass('animated fadeInDown');
  comments.addClass('animated fadeInDown');

  setTimeout(function() {
    heart.removeClass('animated fadeInDown');
    barchart.removeClass('animated fadeInDown');
    comments.removeClass('animated fadeInDown');
  }, 2000)
});
