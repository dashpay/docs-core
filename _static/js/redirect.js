// document.addEventListener('DOMContentLoaded', function () {
//   // Assuming `window.location.pathname` gives the current relative URL path.
//   // Replace 'https://new-location.example.com' with your target base URL.
//   var currentPath = window.location.pathname;
//   var newBaseURL = 'https://docs.dash.org/en/develop/docs/core/';
//   var newURL = newBaseURL + currentPath;

//   window.location.replace(newURL);
// });

document.addEventListener('DOMContentLoaded', function () {
  // Get the current path and host
  var currentPath = window.location.pathname; // e.g., /projects/core/en/core-docs-redirects/
  var newBaseURL = 'https://docs.dash.org';

  // Transform the path
  // Remove '/projects/core/' and replace 'en' with 'develop/docs/core'
  var transformedPath = currentPath.replace('/projects/core/en/', '/en/develop/docs/core/');

  // Construct the new URL
  var newURL = newBaseURL + transformedPath;

  // Redirect to the new URL
  window.location.replace(newURL);
});