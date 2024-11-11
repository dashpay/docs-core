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
  var currentHash = window.location.hash; // This captures any anchor (e.g., #section1)  
  var newBaseURL = 'https://docs.dash.org';

    // Insert a breakpoint
    debugger;

  // Transform the path
  // Remove '/projects/core/' and replace 'en' with 'develop/docs/core'
  // Transform the path by replacing only the start of the path
  var replacements = [
    { pattern: /^\/projects\/core\/en\/core-docs-redirects\/docs\//, replacement: '/en/develop/docs/core/' },
    { pattern: /^\/projects\/core\/en\/core-docs-redirects\//, replacement: '/en/develop/docs/core/' },
    { pattern: /^\/projects\/core\/en\/develop\//, replacement: '/en/develop/docs/core/' },
    { pattern: /^\/projects\/core\/en\/latest\//, replacement: '/en/latest/docs/core/' }
  ];

  var transformedPath = currentPath; // Start with the original path

  for (var i = 0; i < replacements.length; i++) {
      if (replacements[i].pattern.test(currentPath)) {
          transformedPath = currentPath.replace(replacements[i].pattern, replacements[i].replacement);
          break; // Stop after the first match
      }
  }

  console.log(transformedPath);
  // Construct the new URL
  var newURL = newBaseURL + transformedPath + currentHash;
  console.log(newURL);

  // Redirect to the new URL
  window.location.replace(newURL);
});