#!/bin/bash
# UNIVERSAL GHOST RUNNER by [IlTuoNomeGithub]
# Fixes fullscreen freezes on Linux/Nvidia by keeping a tiny window active.
# Usage in Steam Launch Options: /path/to/ghost_runner.sh %command%

# 1. Launch the "Ghost" Window (Hidden in bottom-right corner)
# We use a unique title "." to identify it easily
gnome-terminal --geometry=1x1+1915+1050 --title="." --zoom=0.1 -- bash -c "echo 'Ghost Active'; sleep 36000" &
GHOST_PID=$!

# Wait a moment for the window to appear
sleep 1

# 2. Configure the Ghost Window
# Find window ID by title "." using wmctrl
WIN_ID=$(wmctrl -l | grep " \.$" | awk '{print $1}' | head -n 1)

if [ -n "$WIN_ID" ]; then
    # Force Always on Top (prevents game from killing the compositor rendering)
    wmctrl -i -r "$WIN_ID" -b add,above
    
    # Make it 100% Transparent (Invisible) using xprop
    # If xprop fails, the window will just be tiny but visible (fallback)
    xprop -id "$WIN_ID" -f _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY 0
fi

# 3. Run the actual Game Command
# "$@" takes the command passed by Steam (the game itself)
echo "🚀 Launching Game with Ghost Window..."
"$@"

# 4. Cleanup when Game closes
# The script waits here until the game exits. Then it kills the ghost.
echo "🛑 Game closed. Killing Ghost..."
kill $GHOST_PID 2>/dev/null
pkill -f "sleep 36000" 2>/dev/null
exit 0
