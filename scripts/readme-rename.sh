#!/bin/bash

RENAME_ARGS="-d"

find . -iname "*.md" -type f -name 'core-api-ref-*' -print0 | xargs -0 rename $RENAME_ARGS 's/core-api-ref-//' 
find . -iname "*.md" -type f -name 'dash-core-*' -print0 | xargs -0 rename $RENAME_ARGS 's/dash-core-//' 
find . -iname "*.md" -type f -name 'core-examples-*' -print0 | xargs -0 rename $RENAME_ARGS 's/core-examples-//' 
find . -iname "*.md" -type f -name 'core-guide-*' -print0 | xargs -0 rename $RENAME_ARGS 's/core-guide-//' 
find . -iname "*.md" -type f -name 'core-ref-*' -print0 | xargs -0 rename $RENAME_ARGS 's/core-ref-//' 
find . -iname "*.md" -type f -name 'core-additional-resources-*' -print0 | xargs -0 rename $RENAME_ARGS 's/core-additional-resources-//'
