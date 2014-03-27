// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready(function(){
  $('.list-item').hover(
    function(){
        $('.del-button', this).removeClass('del-button-hide');
    },
    function(){
        $('.del-button', this).addClass('del-button-hide');
    });

});

$(document).ready(function(){
  $('.list-name').hover(
    function(){
        $('.del-button', this).removeClass('del-button-hide');
    },
    function(){
        $('.del-button', this).addClass('del-button-hide');
    });

});