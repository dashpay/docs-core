# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'Dash Core'
copyright = '2023, Dash Core Group, Inc'
author = 'thephez'

# The version info for the project you're documenting, acts as replacement for
# |version| and |release|, also used in various other places throughout the
# built documents.
#
# The short X.Y version.
version = u'latest'
# The full version, including alpha/beta/rc tags.
release = u'latest'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
  'myst_parser',
  'sphinx.ext.autodoc',
  'sphinx_copybutton',
  'sphinx_design',
]

templates_path = ['_templates']
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store', 'README.md']

# The master toctree document.
master_doc = 'index'

# -- Myst parser configuration -----------------------------------------------
# Auto-generate header anchors for md headings
myst_heading_anchors = 5

# Enable colon_fence for better markdown compatibility
# https://myst.tools/docs/mystjs/syntax-overview#directives
myst_enable_extensions = ["colon_fence"]

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = "pydata_sphinx_theme"
html_static_path = ['_static']
html_logo = 'img/dash_logo.png'
html_css_files = [
    'css/footer.css',
    'css/pydata-overrides.css',
]

html_theme_options = {
    "external_links": [
        {"name": "User docs", "url": "https://docs.dash.org/"},
        {"name": "Platform docs", "url": "https://dashplatform.readme.io"},
        {"name": "Dash.org", "url": "https://www.dash.org"},
    ],
    "use_edit_page_button": True,
    "github_url": "https://github.com/dashpay/docs-core",
    "show_toc_level": 2,
    "show_nav_level": 1,
    "favicons": [
      {
         "rel": "icon",
         "sizes": "16x16",
         "href": "img/favicon-16x16.png",
      },
      {
         "rel": "icon",
         "sizes": "32x32",
         "href": "img/favicon-32x32.png",
      },
      {
         "rel": "icon",
         "sizes": "96x96",
         "href": "img/favicon-96x96.png",
      },
      {
         "rel": "icon",
         "sizes": "144x144",
         "href": "img/favicon-144x144.png",
      },
   ],
#    "navbar_start": ["navbar-logo", "languages"],
#    "navbar_center": ["languages", "navbar-nav", "languages"],
#    "navbar_end": ["navbar-icon-links", "version"],
#    "secondary_sidebar_items": ["languages", "page-toc", "edit-this-page", "sourcelink"],
#    "footer_items": ["languages", "copyright", "sphinx-version", "theme-version"],
#   "primary_sidebar_end": ["languages"],
}

html_context = {
    # "github_url": "https://github.com", # or your GitHub Enterprise site
    "github_user": "dashpay",
    "github_repo": "docs-core",
    "github_version": "main",
    "doc_path": "",
}
