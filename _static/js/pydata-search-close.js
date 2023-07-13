/*******************************************************************************
 * Search
 */
/** Find any search forms on the page and return their input element */
var findSearchInput = () => {
  console.log("Finding search input");
  let forms = document.querySelectorAll("form.bd-search");
  if (!forms.length) {
    // no search form found
    console.log("No search form found")
    return;
  } else {
    var form;
    if (forms.length == 1) {
      // there is exactly one search form (persistent or hidden)
      console.log("Found 1 form")
      form = forms[0];
    } else {
      // must be at least one persistent form, use the first persistent one
      console.log("Found multiple forms")
      form = document.querySelector(
        "div:not(.search-button__search-container) > form.bd-search"
      );
    }
    return form.querySelector("input");
  }
};

/**
 * Activate the search field on the page.
 * - If there is a search field already visible it will be activated.
 * - If not, then a search field will pop up.
 */
var toggleSearchField = () => {
  console.log("Entering toggleSearchField");
  // Find the search input to highlight
  let input = findSearchInput();

  // if the input field is the hidden one (the one associated with the
  // search button) then toggle the button state (to show/hide the field)
  let searchPopupWrapper = document.querySelector(".search-button__wrapper");
  let hiddenInput = searchPopupWrapper.querySelector("input");
  if (input === hiddenInput) {
    searchPopupWrapper.classList.toggle("show");
  }
  // when toggling off the search field, remove its focus
  if (document.activeElement === input) {
    input.blur();
  } else {
    input.focus();
    input.select();
    input.scrollIntoView({ block: "center" });
  }
};

/** Add an event listener for toggleSearchField() for Ctrl/Cmd + K */
var addEventListenerForSearchKeyboard = () => {
  console.log("Adding event listeners");
  window.addEventListener(
    "keydown",
    (event) => {
      let input = findSearchInput();
      console.log("keydown " + event.code);
      // toggle on Ctrl+k or ⌘+k
      // if ((event.ctrlKey || event.metaKey) && event.code == "KeyK") {
      //   event.preventDefault();
      //   toggleSearchField();
      // }
      // also allow Escape key to hide (but not show) the dynamic search field
      console.log("Active element: " + document.activeElement);
      if (document.activeElement === input && event.code == "Escape") {
        console.log("Escape pressed");
        toggleSearchField();
      }
    },
    true
  );
};

/** Change the search hint to `meta key` if we are a Mac */
var changeSearchShortcutKey = () => {
  let forms = document.querySelectorAll("form.bd-search");
  var isMac = window.navigator.platform.toUpperCase().indexOf("MAC") >= 0;
  if (isMac) {
    forms.forEach(
      (f) => (f.querySelector("kbd.kbd-shortcut__modifier").innerText = "⌘")
    );
  }
};

/** Activate callbacks for search button popup */
var setupSearchButtons = () => {
  changeSearchShortcutKey();
  addEventListenerForSearchKeyboard();

  // Add the search button trigger event callback
  document.querySelectorAll(".search-button__button").forEach((btn) => {
    btn.onclick = toggleSearchField;
  });

  // Add the search button overlay event callback
  let overlay = document.querySelector(".search-button__overlay");
  if (overlay) {
    overlay.onclick = toggleSearchField;
  }
};

$(document).ready(function(){
  $(".search__cross").click(function(){
    // This is working
    console.log("Close by 'X'");
    toggleSearchField();
  });
  $(".search__outer__wrapper search__backdrop").click(function(){
    console.log("Close by search__outer");
    toggleSearchField();
  });
  $(".search-button__overlay").click(function(){
    // Currently hidden by CSS
    console.log("Close by search-button__overlay");
    toggleSearchField();
  });
});

$(setupSearchButtons);
