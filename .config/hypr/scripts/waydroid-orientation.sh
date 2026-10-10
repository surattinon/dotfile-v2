#!/usr/bin/env bash
# Toggle Waydroid between portrait and landscape.
# Waydroid can't auto-rotate (fixed-resolution container), so this sets the Android
# resolution AND the matching Hyprland window/overlay geometry — kept EQUAL so the
# rendered content fills the window 1:1 — then restarts the session.
#
#   PORTRAIT : res == window 540x960  @ 690,60
#   LANDSCAPE: res == window 1280x720 @ 320,180
#
# Bound to SUPER+SHIFT+O. Use it while Waydroid is running.
export PATH=/usr/bin:/usr/local/bin:$PATH
WR="$HOME/.config/hypr/conf/windowrules.conf"
STATE="$HOME/.cache/waydroid-orientation"
mkdir -p "$(dirname "$STATE")"

if [ "$(cat "$STATE" 2>/dev/null)" = "landscape" ]; then
  new=portrait;  RW=540;  RH=960
  sed -i -e 's/\$phone_screen = 1280 720/$phone_screen = 540 960/' \
         -e 's/^  move = 320 180/  move = 690 60/' \
         -e 's/\(KeyMapper[^,]*\), size 1280 720/\1, size 540 960/' \
         -e 's/\(KeyMapper[^,]*\), move 320 180/\1, move 690 60/' "$WR"
else
  new=landscape; RW=1280; RH=720
  sed -i -e 's/\$phone_screen = 540 960/$phone_screen = 1280 720/' \
         -e 's/^  move = 690 60/  move = 320 180/' \
         -e 's/\(KeyMapper[^,]*\), size 540 960/\1, size 1280 720/' \
         -e 's/\(KeyMapper[^,]*\), move 690 60/\1, move 320 180/' "$WR"
fi

# Android resolution == window size (1:1, no scaling/letterbox from the compositor side)
waydroid prop set persist.waydroid.width  "$RW" 2>/dev/null
waydroid prop set persist.waydroid.height "$RH" 2>/dev/null
hyprctl reload >/dev/null 2>&1
waydroid session stop >/dev/null 2>&1
sleep 2
setsid waydroid session start >/dev/null 2>&1 &
disown

echo "$new" > "$STATE"
command -v notify-send >/dev/null && \
  notify-send -t 3000 "Waydroid" "Orientation → $new (${RW}×${RH})"
