#!/usr/bin/env bash

PIPE="$XDG_RUNTIME_DIR/godot.pipe"
FILE=$(printf %q "$1")
LINE="${2:-1}"   # default to 1 if empty
COL="${3:-1}"    # default to 1 if empty


if [ -z "$FILE" ]; then
    echo "Usage: $0 <file> [line] [col]"
    exit 1
fi

# Only generate cursor command if either line or col is NOT 1
CURSOR_CMD=""
if [ "$LINE" -ne 1 ] || [ "$COL" -ne 1 ]; then
    CURSOR_CMD=":call cursor($LINE, $COL)<CR>"
fi

# checks if nvim instance is running on pipe
if nvim --server "$PIPE" --remote-expr "1" >/dev/null 2>&1; then
    nvim --server "$PIPE" --remote-send "<C-\><C-n>:n $FILE<CR>$CURSOR_CMD"
else
    if [ -n "$CURSOR_CMD" ]; then
        kitty nvim --listen "$PIPE" "+call cursor($LINE, $COL)" "$FILE" &
    else
        kitty nvim --listen "$PIPE" "$FILE" &
    fi
fi
