from i3pystatus import Status
import os

# Setting LANG to en_US to avoid 
# showing dates in Japanese
os.environ['LANG'] = 'en_US'

status = Status(logfile='$HOME/var/logs/i3pystatus.log')

# Displays clock like this:
# Tue 30 Jul 11:59:46 PM KW31
#                          ^-- calendar week
status.register("clock",
    format="%b %e (%a)  %H:%M %p ",
    color="#fffff3",
    interval=1,
    on_rightclick="gsimplecal",
    on_leftclick="gsimplecal",
    )

# Shows the average load of the last minute and the last 5 minutes
# (the default value for format is used)
#status.register("load")

# Shows your CPU temperature, if you have a Intel CPU
status.register("temp",
    format=" {temp:.0f}°C",
    )

# Show CPU usage
status.register("cpu_usage",
    format="  {usage:03.0f}%",
    color="#fffff3",
    )
# Shows your CPU temperature, if you have a Intel CPU
#status.register("temp",
#    format=" {temp:.0f}°C",
#    color="#fffff3",
#    )

# The battery monitor has many formatting options, see README for details

# This would look like this, when discharging (or charging)
# ↓14.22W 56.15% [77.81%] 2h:41m
# And like this if full:
# =14.22W 100.0% [91.21%]
#
# This would also display a desktop notification (via D-Bus) if the percentage
# goes below 5 percent while discharging. The block will also color RED.
# If you don't have a desktop notification demon yet, take a look at dunst:
#   http://www.knopwob.org/dunst/
#status.register("battery",
#    battery_ident="BAT0",
#    format="{status} {percentage:.0f}%",
#    color="#fffff3",
#    alert=True,
#    alert_percentage=5,
#    status={
#        "DIS": "↓",
#        "CHR": "↑",
#        "FULL": "=",
#    },
#)
#
## This would look like this:
## Discharging 6h:51m
#status.register("battery",
#    format="{status} {remaining:%E%hh:%Mm}",
#    alert=True,
#    alert_percentage=5,
#    status={
#        "DIS":  "Discharging",
#        "CHR":  "Charging",
#        "FULL": "Bat full",
#    },)

# Displays whether a DHCP client is running
#status.register("runwatch",
#    name="DHCP",
#    path="/var/run/dhclient*.pid",)

# Shows the address and up/down state of eth0. If it is up the address is shown in
# green (the default value of color_up) and the CIDR-address is shown
# (i.e. 10.10.10.42/24).
# If it's down just the interface name (eth0) will be displayed in red
# (defaults of format_down and color_down)
#
# Note: the network module requires PyPI package netifaces
status.register("network",
    interface="eno1",
    on_leftclick="",
    color_up="#fffff3",
    color_down="#6e6e6e",
    format_up="  {v4cidr}",
    format_down="  Down",)

# Note: requires both netifaces and basiciw (for essid and quality)
#status.register("network",
#    interface="wlo1",
#    color_up="#fffff3",
#    color_down="#6e6e6e",
#    format_up="  {essid} ({quality:03.0f}%) {v4cidr}",
#    format_down="  Down",)

# Shows disk usage of /home
# Format:
# 42/128G
status.register("disk",
    path="/home",
    format="  {used} / {total}GB",
    )

# Shows disk usage of /
# Format:
# 42/128G
status.register("disk",
    path="/",
    format="  {used} / {total}GB",
    color="#fffff3",
#    hints={"separator": False, "seprator_block_width": 5},
    )

# Shows memory usage
status.register("mem",
    format="  {used_mem} / {total_mem}GB",
    color="#fffff3",
    warn_color="#e5e500",
    alert_color="#ff1919",
    divisor=1073741824,
    )

# Shows alsa default sink volume
#
# on_left_click="" disables bringing up volume control panel
status.register("alsa",
    format="  {volume}%",
    on_leftclick="",
    color_muted="#6e6e6e",
#    color_unmuted="#fffff3",
    format_muted="  Muted",)

# Shows mpd status
# Format:
# Cloud connected▶Reroute to Remain
#status.register("mpd",
#    format="{title}{status}{album}",
#    status={
#        "pause": "▷",
#        "play": "▶",
#        "stop": "◾",
#    },)

# Show cmus status
status.register("cmus",
    format="  {title}  / {artist}",
    format_not_running="  Not running", 
    color="#fffff3",
    color_not_running="#6e6e6e",
    )


status.run()
