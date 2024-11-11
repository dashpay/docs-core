document.addEventListener('DOMContentLoaded', function () {
  // Assuming `window.location.pathname` gives the current relative URL path.
  // Replace 'https://new-location.example.com' with your target base URL.
  var currentPath = window.location.pathname;
  var newBaseURL = 'https://docs.dash.org/en/develop/docs/core/';
  var newURL = newBaseURL + currentPath;

  window.location.replace(newURL);
});
