
#!/usr/bin/env bash

PIPE="$XDG_RUNTIME_DIR/godot.pipe"
FILE="$1"
LINE="${2:-1}"   # Defaults to 1
COL="${3:-1}"    

if [ -z "$FILE" ]; then
    echo "Usage: $0 <file> [line] [col]"
    exit 1
fi

# checks if nvim istance is running on pipe
if nvim --server "$PIPE" --remote-expr "1" >/dev/null 2>&1; then
    # opens File and goes to line
    nvim --server "$PIPE" --remote-send "<Esc>:edit $(printf '%q' "$FILE")<CR>:call cursor($LINE, $COL)<CR>"
else
    # new instance and goes to line
    kitty nvim --listen "$PIPE" "+call cursor($LINE, $COL)" "$FILE" &
fi

