#!/bin/sh
id=$(kitten @ ls \
  | jq -r '.[].tabs[] | select(.is_focused | not) | "\(.id)\t\(.title)"' \
  | fzf --delimiter='\t' --with-nth=2.. --reverse --prompt='tab> ' \
  | cut -f1)
[ -n "$id" ] && kitten @ focus-tab --match  "id:$id"

