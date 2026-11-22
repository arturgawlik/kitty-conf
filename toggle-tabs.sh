#!/bin/bash
f=/tmp/kitty-tab-bar-visible
visible=$(cat "$f" 2>/dev/null || echo true)

if [ "$visible" = true ]; then
  kitten @ load-config -o tab_bar_min_tabs=100 && echo false > "$f"
else
  kitten @ load-config -o tab_bar_min_tabs=2 && echo true > "$f"
fi
