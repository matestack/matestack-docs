var basemateUiCoreActionSuccess = function(response){
  setTimeout(function () {
    var noticebarContainer = document.querySelector('#notice_bar');
    var data = {message: JSON.stringify(response.data.message), timeout: 3000};
    noticebarContainer.MaterialSnackbar.showSnackbar(data)
  }, 500);
}

var basemateUiCoreActionError = function(error){
  setTimeout(function () {
    var alertbarContainer = document.querySelector('#alert_bar');
    var data = {message: JSON.stringify(error.response.data.message), timeout: 3000};
    alertbarContainer.MaterialSnackbar.showSnackbar(data)
  }, 500);
}
