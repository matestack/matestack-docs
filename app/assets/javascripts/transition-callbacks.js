var matestackUiCoreTransitionStart = function(url){
  document.querySelector('#page_content').style.opacity = 0;
  setTimeout(function () {
    document.querySelector('.mdl-spinner').style.display = "inline-block";
  }, 300);
}

var matestackUiCoreTransitionSuccess = function(url){
  document.getElementsByClassName("mdl-layout__content")[0].scrollTop = 0
  setTimeout(function () {
    document.querySelector('.mdl-spinner').style.display = "none";
    document.querySelector('#page_content').style.opacity = 1;
    var noticebarContainer = document.querySelector('#notice_bar');
    var data = {message: 'loaded: ' + url, timeout: 1500};
    noticebarContainer.MaterialSnackbar.showSnackbar(data)
  }, 500);
}

var matestackUiCoreTransitionError = function(url){
  setTimeout(function () {
    document.querySelector('.mdl-spinner').style.display = "none";
    document.querySelector('#page_content').style.opacity = 1;
    var alertbarContainer = document.querySelector('#alert_bar');
    var data = {message: 'error loading: ' + url, timeout: 3000};
    alertbarContainer.MaterialSnackbar.showSnackbar(data)
  }, 500);
}
