/*******************************************************************************
 * Search
 */
/** Find any search forms on the page and return their input element */
var findSearchInput = () => {
  let forms = document.querySelectorAll("form.bd-search");
  if (!forms.length) {
    // no search form found
    return;
  } else {
    var form;
    if (forms.length == 1) {
      // there is exactly one search form (persistent or hidden)
      form = forms[0];
    } else {
      // must be at least one persistent form, use the first persistent one
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


/** Function to hide the search field */
var hideSearchField = () => {
 
  let input = findSearchInput();
  let searchPopupWrapper = document.querySelector(".search-button__wrapper");
  let hiddenInput = searchPopupWrapper.querySelector("input");
  
  if (input === hiddenInput) {
    searchPopupWrapper.classList.remove("show");
  }
  
  if (document.activeElement === input) {
    input.blur();
  }
};

/** Add an event listener for hideSearchField() for Escape*/
var addEventListenerForSearchKeyboard = () => {
  window.addEventListener(
    "keydown",
    (event) => {
      // Allow Escape key to hide the search field
      if (event.code == "Escape") {
        hideSearchField();
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
  // changeSearchShortcutKey();
  addEventListenerForSearchKeyboard();

  // // Add the search button trigger event callback
  // document.querySelectorAll(".search-button__button").forEach((btn) => {
  //   btn.onclick = toggleSearchField;
  // });

  // // Add the search button overlay event callback
  // let overlay = document.querySelector(".search-button__overlay");
  // if (overlay) {
  //   overlay.onclick = toggleSearchField;
  // }
};

// Custom code to manage closing the RtD search dialog properly
$(document).ready(function(){
  $(".search__cross").click(function(){
    hideSearchField();
  });
  $(".search__outer__wrapper.search__backdrop").click(function(){
    hideSearchField();
  });
  $(".search-button__overlay").click(function(){
    // Shouldn't be necessary since it's currently hidden by CSS, but just in
    // case
    console.log("Close by search-button__overlay");
    hideSearchField();
  });
});

$(setupSearchButtons);
