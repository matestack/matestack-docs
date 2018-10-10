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
//= require activestorage
//= require material.min
//= require basemate-ui-core

//= require_tree .

var basemateUiCoreActionSuccess = function(url){
  setTimeout(function () {
    // document.querySelector('.mdl-spinner').style.display = "none";
    // document.querySelector('#page_content').style.opacity = 1;
    var noticebarContainer = document.querySelector('#notice_bar');
    var data = {message: 'done', timeout: 1500};
    noticebarContainer.MaterialSnackbar.showSnackbar(data)
  }, 500);
}

var basemateUiCoreActionError = function(url){
  setTimeout(function () {
    // document.querySelector('.mdl-spinner').style.display = "none";
    // document.querySelector('#page_content').style.opacity = 1;
    var alertbarContainer = document.querySelector('#alert_bar');
    var data = {message: 'error', timeout: 3000};
    alertbarContainer.MaterialSnackbar.showSnackbar(data)
  }, 500);
}
