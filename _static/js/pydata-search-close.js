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


$(document).ready(function(){
  $(".search__cross").click(function(){
      toggleSearchField();
  });
});