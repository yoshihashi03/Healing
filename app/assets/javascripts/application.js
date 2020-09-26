// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage

//= require jquery
//= require bootstrap-sprockets
//= require_tree .


$(function() {
    $('.show-slider').slick({
        dots: true,
        fade: true,
        autoplay: true,
        autoplaySpeed: 5000,
    });
    $('.index-slider').slick({
        dots: true,
        fade: true,
    });

    $('#select_photo').change(function(e){
        var files = $('input[type="file"]').prop('files');
        if(files.length>3){
          alert('画像ファイルは3枚以内で投稿して下さい')
          $('input[type=file]').val('');

        }
    });

});





