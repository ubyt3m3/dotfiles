#!/usr/bin/env bash

# Set the icon and a temporary location for the screen shot
ICON="$HOME/scripts/lock_red.png"
TMP_LOCK_IMAGE='/tmp/screen.png'

# Take a screenshot
scrot "$TMP_LOCK_IMAGE"

# Blur the screenshot by resizing and scaling back up
convert "$TMP_LOCK_IMAGE" -filter Gaussian -thumbnail 20% -sample 500% "$TMP_LOCK_IMAGE"

# Overlay the lock icon onto the screenshot
convert "$TMP_LOCK_IMAGE" "$ICON" -gravity center -composite "$TMP_LOCK_IMAGE"

# Lock the screen with the blurred screenshot
i3lock -i "$TMP_LOCK_IMAGE"
