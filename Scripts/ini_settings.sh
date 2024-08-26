#!/bin/bash

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Copyright 2019 Alessandro "Locutus73" Miele

# You can download the latest version of this script from:
# https://github.com/MiSTer-devel/Scripts_MiSTer

# Version 1.2.6 - 2024-02-11 - Added osd_lock, osd_lock_time, and debug settings. Fixed naming convention being wrong for jamma_vid and jamma_pid.
# Version 1.2.5 - 2023-04-08 - Added vga_mode, ntsc_mode, and removed ypbpr (deprecated).
# Version 1.2.4 - 2022-12-21 - Added disable_autofire setting option
# Version 1.2.3 - 2022-08-19 - Add video_off timeout setting from Main_MiSTer
# Version 1.2.2 - 2022-07-18 - Added various missing .ini options from the last couple years like vrr_mode (and the refresh min max for that), hdmi_game_mode, wheel_force, one extra video_mode that uses pixel repetition, vga_sog (which has always been there but was left out of the template .ini).
# Version 1.2.1 - 2020-05-27 - Added support for osd_rotate, refresh_min, refresh_max, jammasd_vid, jammasd_pid, sniper_mode and browse_expand; added video_mode values 12 (1920x1440 60Hz) and 13 (2048x1536 60Hz); rearranged the options order.
# Version 1.2 - 2020-03-03 - Added support for menu_pal, osd_timeout, recents, reset_combo and controller_info; MiSTer_alt.ini is created when missing.
# Version 1.1.12 - 2019-09-07 - Added support for hdmi_limited=2 (16-255) for AG620x DACs; to be used with direct_video=1.
# Version 1.1.11 - 2019-08-20 - Added support for direct_video.
# Version 1.1.10 - 2019-06-12 - Font option value is saved without the leading slash, i.e. font=font/myfont.pf.
# Version 1.1.9 - 2019-06-10 - Testing Internet connectivity with github.com instead of google.com.
# Version 1.1.8 - 2019-05-31 - Added DIALOG_HEIGHT parameter.
# Version 1.1.7 - 2019-05-30 - The menu box uses all available space now.
# Version 1.1.6 - 2019-05-29 - Speed optimizations.
# Version 1.1.5 - 2019-05-29 - Added "Please wait..." screens; font value now is stored as font=/font/myfont.pf without the leading /media/fat.
# Version 1.1.4 - 2019-05-29 - The advanced editor starts with the Cancel button selected.
# Version 1.1.3 - 2019-05-29 - Improved textual descriptions of options.
# Version 1.1.2 - 2019-05-29 - Added support for fb_terminal, vscale_border, bootscreen, mouse_throttle, key_menu_as_rgui, keyrah_mode, rbf_hide_datecode, bootcore and bootcore_timeout.
# Version 1.1.1 - 2019-05-29 - Improved textual descriptions of options.
# Version 1.1 - 2019-05-29 - Added support for setting non existing or commented keys; the font selection page has a single row now.
# Version 1.0.10 - 2019-05-28 - Changed value selection page from a radiolist to a menu in order to improve usability; now the font value is displayed withouth path and extension.
# Version 1.0.9 - 2019-05-28 - Changed MiSTer.ini directory to /media/fat (previously it was /media/fat/config); now the script checks if ~/.dialogrc exists and creates .dialogrc in the current directory when needed (previously it used /media/fat/config/dialogrc); improved some texts.
# Version 1.0.8 - 2019-05-27 - Improved textual descriptions of options, many thanks to misteraddons.
# Version 1.0.7 - 2019-05-27 - Improved textual descriptions of options.
# Version 1.0.6 - 2019-05-27 - setupCURL (so Internet connectivity check) is called only when needed; improved textual descriptions of options.
# Version 1.0.5 - 2019-05-27 - Improved textual descriptions of options.
# Version 1.0.4 - 2019-05-27 - Improved ini value reading: only the first instance of a key is read, so specific core settings will be ignored.
# Version 1.0.4 - 2019-05-27 - Improved textual descriptions of options; removed hostname check, so users can use different hostnames than MiSTer; pressing ESC in submenus returns to the main menu instead of quitting the script.
# Version 1.0.3 - 2019-05-26 - Improved DEB packages downloading routine.
# Version 1.0.2 - 2019-05-26 - Added error checks during DEB packages downloading.
# Version 1.0.1 - 2019-05-26 - Added Windows(CrLf)<->Unix(Lf) character handling.
# Version 1.0 - 2019-05-26 - First commit



# ========= OPTIONS ==================

# ========= ADVANCED OPTIONS =========
MISTER_INI_FILE="/media/fat/MiSTer.ini"

ALLOW_INSECURE_SSL="true"

DIALOG_HEIGHT="31"

FONTS_DIRECTORY="/media/fat/font"
FONTS_EXTENSION="pf"

INI_KEYS="video_mode vscale_mode vsync_adjust vrr_mode hdmi_game_mode hdmi_audio_96k direct_video hdmi_limited dvi_mode vscale_border vga_scaler forced_scandoubler vga_sog vga_mode ntsc_mode composite_sync video_mode_ntsc video_mode_pal refresh_min refresh_max vrr_min_framerate vrr_max_framerate vrr_vesa_framerate menu_pal osd_rotate browse_expand rbf_hide_datecode fb_terminal fb_size osd_timeout video_off video_info controller_info recents font disable_autofire mouse_throttle wheel_force sniper_mode bootscreen reset_combo key_menu_as_rgui keyrah_mode jamma_vid jamma_pid bootcore bootcore_timeout osd_lock osd_lock_time debug"

KEY_video_mode=(
	"Video resolution and frequency"
	"0|1280x720 60Hz"
	"1|1024x768 60Hz"
	"2|720x480 60Hz"
	"3|720x576 50Hz"
	"4|1280x1024 60Hz"
	"5|800x600 60Hz"
	"6|640x480 60Hz"
	"7|1280x720 50Hz"
	"8|1920x1080 60Hz"
	"9|1920x1080 50Hz"
	"10|1366x768 60Hz"
	"11|1024x600 60Hz"
	"12|1920x1440 60Hz"
	"13|2048x1536 60Hz"
	"14|2560x1440 60Hz"
)

KEY_vscale_mode=(
	"Video scaling mode"
	"0|Scale to fit the screen height|Some possible shimmering during vertical scrolling, not optimal for scanlines"
	"1|Use integer scale only|No shimmering during vertical scrolling, optimal for scanlines"
	"2|Use 0.5 steps of scale|Some possible shimmering during vertical scrolling, good scanlines"
	"3|Use 0.25 steps of scale|Some possible shimmering during vertical scrolling, good scanlines"
	"4|Integer Resolution Scaling|Use core aspect ratio (good for 4k displays)"
	"5|Integer Resolution Scaling|Use display aspect ratio"
)

KEY_vsync_adjust=(
	"Video scaling sync frequency"
	"0|Match display frequency|Best display compatibility, some stuttering, 1-2 frames of lag"
	"1|Match core frequency|Some display incompatibilities, no stuttering, 1-2 frames of lag"
	"2|Low lag|Some display incompatibilities, no stuttering, virtually no lag"
)

KEY_vrr_mode=(
	"Variable Refresh Rate control"
	"0|Disable VRR"
	"1|Autodetect VRR from EDID"
	"2|Force Enable Freesync"
	"3|Force Enable Vesa HDMI Forum VRR"
)

KEY_hdmi_game_mode=(
	"HDMI Game Mode Enable game mode on HDMI output."
	"0|Disable|Default and most compatible"
	"1|Enable|Potentially less compatible but may improve optimization on some displays"
)

KEY_hdmi_audio_96k=(
	"Sets HDMI audio to 96KHz/16bit (48KHz/16bit otherwise)"
	"0|Off|48KHz/16bit HDMI audio output; compatible with most HDMI devices"
	"1|On|96KHz/16bit HDMI audio output; better quality but not compatible with all HDMI devices"
)

KEY_direct_video=(
	"Enables direct video out for using HDMI-VGA adapters in order to output zero lag non scaled analog RGB"
	"0|Off|No direct video out; used for regular HDMI use"
	"1|On|Video direct out; used for getting zero lag non scaled analog RGB out from HDMI-VGA adapters"
)

KEY_hdmi_limited=(
	"Sets HDMI RGB output to limited (16-235, full range otherwise)"
	"0|Off|Full RGB (0-255) HDMI output"
	"1|On|Limited RGB (16-235) HDMI output"
	"2|16-255|Special setting for AG620x DACs; to be used with direct_video=1"
)

KEY_dvi_mode=(
	"Sets DVI mode on HDMI output"
	"0|Off|Audio will be transmitted through HDMI"
	"1|On|Audio won't be transmitted through HDMI"
)

KEY_vscale_border=(
	"Adds a vertical border for TV sets cutting the upper/bottom part of the screen"
	"0|0" "1|1" "2|2" "3|3" "4|4" "5|5" "6|6" "7|7" "8|8" "9|9"
	"10|10" "11|11" "12|12" "13|13" "14|14" "15|15" "16|16" "17|17" "18|18" "19|19"
	"20|20" "21|21" "22|22" "23|23" "24|24" "25|25" "26|26" "27|27" "28|28" "29|29"
	"30|30" "31|31" "32|32" "33|33" "34|34" "35|35" "36|36" "37|37" "38|38" "39|39"
	"40|40" "41|41" "42|42" "43|43" "44|44" "45|45" "46|46" "47|47" "48|48" "49|49"
	"50|50" "51|51" "52|52" "53|53" "54|54" "55|55" "56|56" "57|57" "58|58" "59|59"
	"60|60" "61|61" "62|62" "63|63" "64|64" "65|65" "66|66" "67|67" "68|68" "69|69"
	"70|70" "71|71" "72|72" "73|73" "74|74" "75|75" "76|76" "77|77" "78|78" "79|79"
	"80|80" "81|81" "82|82" "83|83" "84|84" "85|85" "86|86" "87|87" "88|88" "89|89"
	"90|90" "91|91" "92|92" "93|93" "94|94" "95|95" "96|96" "97|97" "98|98" "99|99"
)

KEY_vga_scaler=(
	"Connects analog video output to the scaler output, changing the resolution"
	"0|Off|Analog video will output native core resolution"
	"1|On|Analog video output will output same resolution as HDMI port"
)

KEY_forced_scandoubler=(
	"Forces scandoubler (240p/15kHz to 480p/31kHz) on analog video output"
	"0|Off|15KHz analog video out for 15KHz cores, works on CRT TV sets, but may have problems with PC monitors"
	"1|On|30KHz analog video out for 15KHz cores (core dependent), good for VGA monitors not supporting 15KHz"
)

KEY_vga_sog=(
	"Automatic Sync on Green"
	"0|Off|Default for compatibility"
	"1|On|Requires Analog IO addon board v6.0 or newer!"
)

KEY_vga_mode=(
	"Sets VGA output to use RGB, YPbPr, S-Video, or CVBS signals."
	"rgb|RGBS/RGsB/RGBHV|For use with RGBS, RGsB, and RGBHV displays such as PVM/BVM, Computer CRTs and upscaler devices. For RGBS and RGsB you should enable composite_sync, but not RGBHV."
	"ypbpr|YPbPr/Component|For use with devices that allow YPbPr inputs via VGA to Component cable. Remember to disable composite_sync!"
	"svideo|S-Video/Composite|For use with an external Active YC encoder on displays that have S-Video/Composite inputs. Remember to enable composite_sync!"
	"cvbs|CVBS|For use only with some external RGB to PAL/NTSC encoders, such as SCART adapters. Don't use for Composite!"
)

KEY_ntsc_mode=(
	"Only for use with S-Video and CVBS vga_mode settings. Changes VGA output to NTSC, PAL-60 (pseudo-PAL), or PAL-M (Brazil)"
	"0|NTSC|Default - NTSC video standard. Will work on most displays."
	"1|PAL-60|PAL-60 for use with some few converters, VCR, and DVD devices in Europe."
	"2|PAL-M|Brazilian video standard for use with Brazilian CRT."
)

KEY_composite_sync=(
	"Sets composite sync on HSync signal of analog video output; used for display compatibility"
	"0|Off|Separate sync (RGBHV); used for VGA monitors"
	"1|On|Composite sync (RGBS); used for most other displays including RGB CRTs, PVMs, BVMS, and upscaler devices"
)

KEY_video_mode_ntsc=(
	"Video resolution and frequency for NTSC cores; if you use this, please set video_mode_pal too"
	"0|1280x720 60Hz"
	"1|1024x768 60Hz"
	"2|720x480 60Hz"
	"3|720x576 50Hz"
	"4|1280x1024 60Hz"
	"5|800x600 60Hz"
	"6|640x480 60Hz"
	"7|1280x720 50Hz"
	"8|1920x1080 60Hz"
	"9|1920x1080 50Hz"
	"10|1366x768 60Hz"
	"11|1024x600 60Hz"
)

KEY_video_mode_pal=(
	"Video resolution and frequency PAL cores; if you use this, please set video_mode_ntsc too"
	"0|1280x720 60Hz"
	"1|1024x768 60Hz"
	"2|720x480 60Hz"
	"3|720x576 50Hz"
	"4|1280x1024 60Hz"
	"5|800x600 60Hz"
	"6|640x480 60Hz"
	"7|1280x720 50Hz"
	"8|1920x1080 60Hz"
	"9|1920x1080 50Hz"
	"10|1366x768 60Hz"
	"11|1024x600 60Hz"
)

KEY_refresh_min=(
	"If your monitor doesn't support very low refresh rate (NTSC monitors may not support PAL) then you can set refresh_min, so vsync_adjust won't be applied for refreshes outside specified value. This parameters is valid only when vsync_adjust is non-zero."
	"0|Not set"
	"40|40" "40.1|40.1" "40.2|40.2" "40.3|40.3" "40.4|40.4" "40.5|40.5" "40.6|40.6" "40.7|40.7" "40.8|40.8" "40.9|40.9"
	"41|41" "41.1|41.1" "41.2|41.2" "41.3|41.3" "41.4|41.4" "41.5|41.5" "41.6|41.6" "41.7|41.7" "41.8|41.8" "41.9|41.9"
	"42|42" "42.1|42.1" "42.2|42.2" "42.3|42.3" "42.4|42.4" "42.5|42.5" "42.6|42.6" "42.7|42.7" "42.8|42.8" "42.9|42.9"
	"43|43" "43.1|43.1" "43.2|43.2" "43.3|43.3" "43.4|43.4" "43.5|43.5" "43.6|43.6" "43.7|43.7" "43.8|43.8" "43.9|43.9"
	"44|44" "44.1|44.1" "44.2|44.2" "44.3|44.3" "44.4|44.4" "44.5|44.5" "44.6|44.6" "44.7|44.7" "44.8|44.8" "44.9|44.9"
	"45|45" "45.1|45.1" "45.2|45.2" "45.3|45.3" "45.4|45.4" "45.5|45.5" "45.6|45.6" "45.7|45.7" "45.8|45.8" "45.9|45.9"
	"46|46" "46.1|46.1" "46.2|46.2" "46.3|46.3" "46.4|46.4" "46.5|46.5" "46.6|46.6" "46.7|46.7" "46.8|46.8" "46.9|46.9"
	"47|47" "47.1|47.1" "47.2|47.2" "47.3|47.3" "47.4|47.4" "47.5|47.5" "47.6|47.6" "47.7|47.7" "47.8|47.8" "47.9|47.9"
	"48|48" "48.1|48.1" "48.2|48.2" "48.3|48.3" "48.4|48.4" "48.5|48.5" "48.6|48.6" "48.7|48.7" "48.8|48.8" "48.9|48.9"
	"49|49" "49.1|49.1" "49.2|49.2" "49.3|49.3" "49.4|49.4" "49.5|49.5" "49.6|49.6" "49.7|49.7" "49.8|49.8" "49.9|49.9"
	"50|50" "50.1|50.1" "50.2|50.2" "50.3|50.3" "50.4|50.4" "50.5|50.5" "50.6|50.6" "50.7|50.7" "50.8|50.8" "50.9|50.9"
	"51|51" "51.1|51.1" "51.2|51.2" "51.3|51.3" "51.4|51.4" "51.5|51.5" "51.6|51.6" "51.7|51.7" "51.8|51.8" "51.9|51.9"
	"52|52" "52.1|52.1" "52.2|52.2" "52.3|52.3" "52.4|52.4" "52.5|52.5" "52.6|52.6" "52.7|52.7" "52.8|52.8" "52.9|52.9"
	"53|53" "53.1|53.1" "53.2|53.2" "53.3|53.3" "53.4|53.4" "53.5|53.5" "53.6|53.6" "53.7|53.7" "53.8|53.8" "53.9|53.9"
	"54|54" "54.1|54.1" "54.2|54.2" "54.3|54.3" "54.4|54.4" "54.5|54.5" "54.6|54.6" "54.7|54.7" "54.8|54.8" "54.9|54.9"
	"55|55" "55.1|55.1" "55.2|55.2" "55.3|55.3" "55.4|55.4" "55.5|55.5" "55.6|55.6" "55.7|55.7" "55.8|55.8" "55.9|55.9"
	"56|56" "56.1|56.1" "56.2|56.2" "56.3|56.3" "56.4|56.4" "56.5|56.5" "56.6|56.6" "56.7|56.7" "56.8|56.8" "56.9|56.9"
	"57|57" "57.1|57.1" "57.2|57.2" "57.3|57.3" "57.4|57.4" "57.5|57.5" "57.6|57.6" "57.7|57.7" "57.8|57.8" "57.9|57.9"
	"58|58" "58.1|58.1" "58.2|58.2" "58.3|58.3" "58.4|58.4" "58.5|58.5" "58.6|58.6" "58.7|58.7" "58.8|58.8" "58.9|58.9"
	"59|59" "59.1|59.1" "59.2|59.2" "59.3|59.3" "59.4|59.4" "59.5|59.5" "59.6|59.6" "59.7|59.7" "59.8|59.8" "59.9|59.9"
	"60|60"
)

KEY_refresh_max=(
	"If your monitor doesn't support very high refresh rate (PAL monitors may not support NTSC) then you can set refresh_max, so vsync_adjust won't be applied for refreshes outside specified value. This parameters is valid only when vsync_adjust is non-zero."
	"0|Not set"
	"50|50" "50.1|50.1" "50.2|50.2" "50.3|50.3" "50.4|50.4" "50.5|50.5" "50.6|50.6" "50.7|50.7" "50.8|50.8" "50.9|50.9"
	"51|51" "51.1|51.1" "51.2|51.2" "51.3|51.3" "51.4|51.4" "51.5|51.5" "51.6|51.6" "51.7|51.7" "51.8|51.8" "51.9|51.9"
	"52|52" "52.1|52.1" "52.2|52.2" "52.3|52.3" "52.4|52.4" "52.5|52.5" "52.6|52.6" "52.7|52.7" "52.8|52.8" "52.9|52.9"
	"53|53" "53.1|53.1" "53.2|53.2" "53.3|53.3" "53.4|53.4" "53.5|53.5" "53.6|53.6" "53.7|53.7" "53.8|53.8" "53.9|53.9"
	"54|54" "54.1|54.1" "54.2|54.2" "54.3|54.3" "54.4|54.4" "54.5|54.5" "54.6|54.6" "54.7|54.7" "54.8|54.8" "54.9|54.9"
	"55|55" "55.1|55.1" "55.2|55.2" "55.3|55.3" "55.4|55.4" "55.5|55.5" "55.6|55.6" "55.7|55.7" "55.8|55.8" "55.9|55.9"
	"56|56" "56.1|56.1" "56.2|56.2" "56.3|56.3" "56.4|56.4" "56.5|56.5" "56.6|56.6" "56.7|56.7" "56.8|56.8" "56.9|56.9"
	"57|57" "57.1|57.1" "57.2|57.2" "57.3|57.3" "57.4|57.4" "57.5|57.5" "57.6|57.6" "57.7|57.7" "57.8|57.8" "57.9|57.9"
	"58|58" "58.1|58.1" "58.2|58.2" "58.3|58.3" "58.4|58.4" "58.5|58.5" "58.6|58.6" "58.7|58.7" "58.8|58.8" "58.9|58.9"
	"59|59" "59.1|59.1" "59.2|59.2" "59.3|59.3" "59.4|59.4" "59.5|59.5" "59.6|59.6" "59.7|59.7" "59.8|59.8" "59.9|59.9"
	"60|60" "60.1|60.1" "60.2|60.2" "60.3|60.3" "60.4|60.4" "60.5|60.5" "60.6|60.6" "60.7|60.7" "60.8|60.8" "60.9|60.9"
	"61|61" "61.1|61.1" "61.2|61.2" "61.3|61.3" "61.4|61.4" "61.5|61.5" "61.6|61.6" "61.7|61.7" "61.8|61.8" "61.9|61.9"
	"62|62" "62.1|62.1" "62.2|62.2" "62.3|62.3" "62.4|62.4" "62.5|62.5" "62.6|62.6" "62.7|62.7" "62.8|62.8" "62.9|62.9"
	"63|63" "63.1|63.1" "63.2|63.2" "63.3|63.3" "63.4|63.4" "63.5|63.5" "63.6|63.6" "63.7|63.7" "63.8|63.8" "63.9|63.9"
	"64|64" "64.1|64.1" "64.2|64.2" "64.3|64.3" "64.4|64.4" "64.5|64.5" "64.6|64.6" "64.7|64.7" "64.8|64.8" "64.9|64.9"
	"65|65" "65.1|65.1" "65.2|65.2" "65.3|65.3" "65.4|65.4" "65.5|65.5" "65.6|65.6" "65.7|65.7" "65.8|65.8" "65.9|65.9"
	"66|66" "66.1|66.1" "66.2|66.2" "66.3|66.3" "66.4|66.4" "66.5|66.5" "66.6|66.6" "66.7|66.7" "66.8|66.8" "66.9|66.9"
	"67|67" "67.1|67.1" "67.2|67.2" "67.3|67.3" "67.4|67.4" "67.5|67.5" "67.6|67.6" "67.7|67.7" "67.8|67.8" "67.9|67.9"
	"68|68" "68.1|68.1" "68.2|68.2" "68.3|68.3" "68.4|68.4" "68.5|68.5" "68.6|68.6" "68.7|68.7" "68.8|68.8" "68.9|68.9"
	"69|69" "69.1|69.1" "69.2|69.2" "69.3|69.3" "69.4|69.4" "69.5|69.5" "69.6|69.6" "69.7|69.7" "69.8|69.8" "69.9|69.9"
	"70|70" "70.1|70.1" "70.2|70.2" "70.3|70.3" "70.4|70.4" "70.5|70.5" "70.6|70.6" "70.7|70.7" "70.8|70.8" "70.9|70.9"
	"71|71" "71.1|71.1" "71.2|71.2" "71.3|71.3" "71.4|71.4" "71.5|71.5" "71.6|71.6" "71.7|71.7" "71.8|71.8" "71.9|71.9"
	"72|72" "72.1|72.1" "72.2|72.2" "72.3|72.3" "72.4|72.4" "72.5|72.5" "72.6|72.6" "72.7|72.7" "72.8|72.8" "72.9|72.9"
	"73|73" "73.1|73.1" "73.2|73.2" "73.3|73.3" "73.4|73.4" "73.5|73.5" "73.6|73.6" "73.7|73.7" "73.8|73.8" "73.9|73.9"
	"74|74" "74.1|74.1" "74.2|74.2" "74.3|74.3" "74.4|74.4" "74.5|74.5" "74.6|74.6" "74.7|74.7" "74.8|74.8" "74.9|74.9"
	"75|75" "75.1|75.1" "75.2|75.2" "75.3|75.3" "75.4|75.4" "75.5|75.5" "75.6|75.6" "75.7|75.7" "75.8|75.8" "75.9|75.9"
	"76|76" "76.1|76.1" "76.2|76.2" "76.3|76.3" "76.4|76.4" "76.5|76.5" "76.6|76.6" "76.7|76.7" "76.8|76.8" "76.9|76.9"
	"77|77" "77.1|77.1" "77.2|77.2" "77.3|77.3" "77.4|77.4" "77.5|77.5" "77.6|77.6" "77.7|77.7" "77.8|77.8" "77.9|77.9"
	"78|78" "78.1|78.1" "78.2|78.2" "78.3|78.3" "78.4|78.4" "78.5|78.5" "78.6|78.6" "78.7|78.7" "78.8|78.8" "78.9|78.9"
	"79|79" "79.1|79.1" "79.2|79.2" "79.3|79.3" "79.4|79.4" "79.5|79.5" "79.6|79.6" "79.7|79.7" "79.8|79.8" "79.9|79.9"
	"80|80"
)

KEY_vrr_min_framerate=(
	"Use a specified minimum frame rate for variable refresh rate if you notice incompatibility."
	"0|Not set"
	"40|40" "40.1|40.1" "40.2|40.2" "40.3|40.3" "40.4|40.4" "40.5|40.5" "40.6|40.6" "40.7|40.7" "40.8|40.8" "40.9|40.9"
	"41|41" "41.1|41.1" "41.2|41.2" "41.3|41.3" "41.4|41.4" "41.5|41.5" "41.6|41.6" "41.7|41.7" "41.8|41.8" "41.9|41.9"
	"42|42" "42.1|42.1" "42.2|42.2" "42.3|42.3" "42.4|42.4" "42.5|42.5" "42.6|42.6" "42.7|42.7" "42.8|42.8" "42.9|42.9"
	"43|43" "43.1|43.1" "43.2|43.2" "43.3|43.3" "43.4|43.4" "43.5|43.5" "43.6|43.6" "43.7|43.7" "43.8|43.8" "43.9|43.9"
	"44|44" "44.1|44.1" "44.2|44.2" "44.3|44.3" "44.4|44.4" "44.5|44.5" "44.6|44.6" "44.7|44.7" "44.8|44.8" "44.9|44.9"
	"45|45" "45.1|45.1" "45.2|45.2" "45.3|45.3" "45.4|45.4" "45.5|45.5" "45.6|45.6" "45.7|45.7" "45.8|45.8" "45.9|45.9"
	"46|46" "46.1|46.1" "46.2|46.2" "46.3|46.3" "46.4|46.4" "46.5|46.5" "46.6|46.6" "46.7|46.7" "46.8|46.8" "46.9|46.9"
	"47|47" "47.1|47.1" "47.2|47.2" "47.3|47.3" "47.4|47.4" "47.5|47.5" "47.6|47.6" "47.7|47.7" "47.8|47.8" "47.9|47.9"
	"48|48" "48.1|48.1" "48.2|48.2" "48.3|48.3" "48.4|48.4" "48.5|48.5" "48.6|48.6" "48.7|48.7" "48.8|48.8" "48.9|48.9"
	"49|49" "49.1|49.1" "49.2|49.2" "49.3|49.3" "49.4|49.4" "49.5|49.5" "49.6|49.6" "49.7|49.7" "49.8|49.8" "49.9|49.9"
	"50|50" "50.1|50.1" "50.2|50.2" "50.3|50.3" "50.4|50.4" "50.5|50.5" "50.6|50.6" "50.7|50.7" "50.8|50.8" "50.9|50.9"
	"51|51" "51.1|51.1" "51.2|51.2" "51.3|51.3" "51.4|51.4" "51.5|51.5" "51.6|51.6" "51.7|51.7" "51.8|51.8" "51.9|51.9"
	"52|52" "52.1|52.1" "52.2|52.2" "52.3|52.3" "52.4|52.4" "52.5|52.5" "52.6|52.6" "52.7|52.7" "52.8|52.8" "52.9|52.9"
	"53|53" "53.1|53.1" "53.2|53.2" "53.3|53.3" "53.4|53.4" "53.5|53.5" "53.6|53.6" "53.7|53.7" "53.8|53.8" "53.9|53.9"
	"54|54" "54.1|54.1" "54.2|54.2" "54.3|54.3" "54.4|54.4" "54.5|54.5" "54.6|54.6" "54.7|54.7" "54.8|54.8" "54.9|54.9"
	"55|55" "55.1|55.1" "55.2|55.2" "55.3|55.3" "55.4|55.4" "55.5|55.5" "55.6|55.6" "55.7|55.7" "55.8|55.8" "55.9|55.9"
	"56|56" "56.1|56.1" "56.2|56.2" "56.3|56.3" "56.4|56.4" "56.5|56.5" "56.6|56.6" "56.7|56.7" "56.8|56.8" "56.9|56.9"
	"57|57" "57.1|57.1" "57.2|57.2" "57.3|57.3" "57.4|57.4" "57.5|57.5" "57.6|57.6" "57.7|57.7" "57.8|57.8" "57.9|57.9"
	"58|58" "58.1|58.1" "58.2|58.2" "58.3|58.3" "58.4|58.4" "58.5|58.5" "58.6|58.6" "58.7|58.7" "58.8|58.8" "58.9|58.9"
	"59|59" "59.1|59.1" "59.2|59.2" "59.3|59.3" "59.4|59.4" "59.5|59.5" "59.6|59.6" "59.7|59.7" "59.8|59.8" "59.9|59.9"
	"60|60"
)

KEY_vrr_max_framerate=(
	"Use a specified maximum frame rate for variable refresh rate if you notice incompatibility. 75Hz covers most cores."
	"0|Not set"
	"50|50" "50.1|50.1" "50.2|50.2" "50.3|50.3" "50.4|50.4" "50.5|50.5" "50.6|50.6" "50.7|50.7" "50.8|50.8" "50.9|50.9"
	"51|51" "51.1|51.1" "51.2|51.2" "51.3|51.3" "51.4|51.4" "51.5|51.5" "51.6|51.6" "51.7|51.7" "51.8|51.8" "51.9|51.9"
	"52|52" "52.1|52.1" "52.2|52.2" "52.3|52.3" "52.4|52.4" "52.5|52.5" "52.6|52.6" "52.7|52.7" "52.8|52.8" "52.9|52.9"
	"53|53" "53.1|53.1" "53.2|53.2" "53.3|53.3" "53.4|53.4" "53.5|53.5" "53.6|53.6" "53.7|53.7" "53.8|53.8" "53.9|53.9"
	"54|54" "54.1|54.1" "54.2|54.2" "54.3|54.3" "54.4|54.4" "54.5|54.5" "54.6|54.6" "54.7|54.7" "54.8|54.8" "54.9|54.9"
	"55|55" "55.1|55.1" "55.2|55.2" "55.3|55.3" "55.4|55.4" "55.5|55.5" "55.6|55.6" "55.7|55.7" "55.8|55.8" "55.9|55.9"
	"56|56" "56.1|56.1" "56.2|56.2" "56.3|56.3" "56.4|56.4" "56.5|56.5" "56.6|56.6" "56.7|56.7" "56.8|56.8" "56.9|56.9"
	"57|57" "57.1|57.1" "57.2|57.2" "57.3|57.3" "57.4|57.4" "57.5|57.5" "57.6|57.6" "57.7|57.7" "57.8|57.8" "57.9|57.9"
	"58|58" "58.1|58.1" "58.2|58.2" "58.3|58.3" "58.4|58.4" "58.5|58.5" "58.6|58.6" "58.7|58.7" "58.8|58.8" "58.9|58.9"
	"59|59" "59.1|59.1" "59.2|59.2" "59.3|59.3" "59.4|59.4" "59.5|59.5" "59.6|59.6" "59.7|59.7" "59.8|59.8" "59.9|59.9"
	"60|60" "60.1|60.1" "60.2|60.2" "60.3|60.3" "60.4|60.4" "60.5|60.5" "60.6|60.6" "60.7|60.7" "60.8|60.8" "60.9|60.9"
	"61|61" "61.1|61.1" "61.2|61.2" "61.3|61.3" "61.4|61.4" "61.5|61.5" "61.6|61.6" "61.7|61.7" "61.8|61.8" "61.9|61.9"
	"62|62" "62.1|62.1" "62.2|62.2" "62.3|62.3" "62.4|62.4" "62.5|62.5" "62.6|62.6" "62.7|62.7" "62.8|62.8" "62.9|62.9"
	"63|63" "63.1|63.1" "63.2|63.2" "63.3|63.3" "63.4|63.4" "63.5|63.5" "63.6|63.6" "63.7|63.7" "63.8|63.8" "63.9|63.9"
	"64|64" "64.1|64.1" "64.2|64.2" "64.3|64.3" "64.4|64.4" "64.5|64.5" "64.6|64.6" "64.7|64.7" "64.8|64.8" "64.9|64.9"
	"65|65" "65.1|65.1" "65.2|65.2" "65.3|65.3" "65.4|65.4" "65.5|65.5" "65.6|65.6" "65.7|65.7" "65.8|65.8" "65.9|65.9"
	"66|66" "66.1|66.1" "66.2|66.2" "66.3|66.3" "66.4|66.4" "66.5|66.5" "66.6|66.6" "66.7|66.7" "66.8|66.8" "66.9|66.9"
	"67|67" "67.1|67.1" "67.2|67.2" "67.3|67.3" "67.4|67.4" "67.5|67.5" "67.6|67.6" "67.7|67.7" "67.8|67.8" "67.9|67.9"
	"68|68" "68.1|68.1" "68.2|68.2" "68.3|68.3" "68.4|68.4" "68.5|68.5" "68.6|68.6" "68.7|68.7" "68.8|68.8" "68.9|68.9"
	"69|69" "69.1|69.1" "69.2|69.2" "69.3|69.3" "69.4|69.4" "69.5|69.5" "69.6|69.6" "69.7|69.7" "69.8|69.8" "69.9|69.9"
	"70|70" "70.1|70.1" "70.2|70.2" "70.3|70.3" "70.4|70.4" "70.5|70.5" "70.6|70.6" "70.7|70.7" "70.8|70.8" "70.9|70.9"
	"71|71" "71.1|71.1" "71.2|71.2" "71.3|71.3" "71.4|71.4" "71.5|71.5" "71.6|71.6" "71.7|71.7" "71.8|71.8" "71.9|71.9"
	"72|72" "72.1|72.1" "72.2|72.2" "72.3|72.3" "72.4|72.4" "72.5|72.5" "72.6|72.6" "72.7|72.7" "72.8|72.8" "72.9|72.9"
	"73|73" "73.1|73.1" "73.2|73.2" "73.3|73.3" "73.4|73.4" "73.5|73.5" "73.6|73.6" "73.7|73.7" "73.8|73.8" "73.9|73.9"
	"74|74" "74.1|74.1" "74.2|74.2" "74.3|74.3" "74.4|74.4" "74.5|74.5" "74.6|74.6" "74.7|74.7" "74.8|74.8" "74.9|74.9"
	"75|75" "75.1|75.1" "75.2|75.2" "75.3|75.3" "75.4|75.4" "75.5|75.5" "75.6|75.6" "75.7|75.7" "75.8|75.8" "75.9|75.9"
	"76|76" "76.1|76.1" "76.2|76.2" "76.3|76.3" "76.4|76.4" "76.5|76.5" "76.6|76.6" "76.7|76.7" "76.8|76.8" "76.9|76.9"
	"77|77" "77.1|77.1" "77.2|77.2" "77.3|77.3" "77.4|77.4" "77.5|77.5" "77.6|77.6" "77.7|77.7" "77.8|77.8" "77.9|77.9"
	"78|78" "78.1|78.1" "78.2|78.2" "78.3|78.3" "78.4|78.4" "78.5|78.5" "78.6|78.6" "78.7|78.7" "78.8|78.8" "78.9|78.9"
	"79|79" "79.1|79.1" "79.2|79.2" "79.3|79.3" "79.4|79.4" "79.5|79.5" "79.6|79.6" "79.7|79.7" "79.8|79.8" "79.9|79.9"
	"80|80"
)

KEY_vrr_vesa_framerate=(
	"Use a specified frame rate for Vesa HDMI Forum variable refresh rate if you notice incompatibility."
	"0|Not set"
	"40|40" "40.1|40.1" "40.2|40.2" "40.3|40.3" "40.4|40.4" "40.5|40.5" "40.6|40.6" "40.7|40.7" "40.8|40.8" "40.9|40.9"
	"41|41" "41.1|41.1" "41.2|41.2" "41.3|41.3" "41.4|41.4" "41.5|41.5" "41.6|41.6" "41.7|41.7" "41.8|41.8" "41.9|41.9"
	"42|42" "42.1|42.1" "42.2|42.2" "42.3|42.3" "42.4|42.4" "42.5|42.5" "42.6|42.6" "42.7|42.7" "42.8|42.8" "42.9|42.9"
	"43|43" "43.1|43.1" "43.2|43.2" "43.3|43.3" "43.4|43.4" "43.5|43.5" "43.6|43.6" "43.7|43.7" "43.8|43.8" "43.9|43.9"
	"44|44" "44.1|44.1" "44.2|44.2" "44.3|44.3" "44.4|44.4" "44.5|44.5" "44.6|44.6" "44.7|44.7" "44.8|44.8" "44.9|44.9"
	"45|45" "45.1|45.1" "45.2|45.2" "45.3|45.3" "45.4|45.4" "45.5|45.5" "45.6|45.6" "45.7|45.7" "45.8|45.8" "45.9|45.9"
	"46|46" "46.1|46.1" "46.2|46.2" "46.3|46.3" "46.4|46.4" "46.5|46.5" "46.6|46.6" "46.7|46.7" "46.8|46.8" "46.9|46.9"
	"47|47" "47.1|47.1" "47.2|47.2" "47.3|47.3" "47.4|47.4" "47.5|47.5" "47.6|47.6" "47.7|47.7" "47.8|47.8" "47.9|47.9"
	"48|48" "48.1|48.1" "48.2|48.2" "48.3|48.3" "48.4|48.4" "48.5|48.5" "48.6|48.6" "48.7|48.7" "48.8|48.8" "48.9|48.9"
	"49|49" "49.1|49.1" "49.2|49.2" "49.3|49.3" "49.4|49.4" "49.5|49.5" "49.6|49.6" "49.7|49.7" "49.8|49.8" "49.9|49.9"
	"50|50" "50.1|50.1" "50.2|50.2" "50.3|50.3" "50.4|50.4" "50.5|50.5" "50.6|50.6" "50.7|50.7" "50.8|50.8" "50.9|50.9"
	"51|51" "51.1|51.1" "51.2|51.2" "51.3|51.3" "51.4|51.4" "51.5|51.5" "51.6|51.6" "51.7|51.7" "51.8|51.8" "51.9|51.9"
	"52|52" "52.1|52.1" "52.2|52.2" "52.3|52.3" "52.4|52.4" "52.5|52.5" "52.6|52.6" "52.7|52.7" "52.8|52.8" "52.9|52.9"
	"53|53" "53.1|53.1" "53.2|53.2" "53.3|53.3" "53.4|53.4" "53.5|53.5" "53.6|53.6" "53.7|53.7" "53.8|53.8" "53.9|53.9"
	"54|54" "54.1|54.1" "54.2|54.2" "54.3|54.3" "54.4|54.4" "54.5|54.5" "54.6|54.6" "54.7|54.7" "54.8|54.8" "54.9|54.9"
	"55|55" "55.1|55.1" "55.2|55.2" "55.3|55.3" "55.4|55.4" "55.5|55.5" "55.6|55.6" "55.7|55.7" "55.8|55.8" "55.9|55.9"
	"56|56" "56.1|56.1" "56.2|56.2" "56.3|56.3" "56.4|56.4" "56.5|56.5" "56.6|56.6" "56.7|56.7" "56.8|56.8" "56.9|56.9"
	"57|57" "57.1|57.1" "57.2|57.2" "57.3|57.3" "57.4|57.4" "57.5|57.5" "57.6|57.6" "57.7|57.7" "57.8|57.8" "57.9|57.9"
	"58|58" "58.1|58.1" "58.2|58.2" "58.3|58.3" "58.4|58.4" "58.5|58.5" "58.6|58.6" "58.7|58.7" "58.8|58.8" "58.9|58.9"
	"59|59" "59.1|59.1" "59.2|59.2" "59.3|59.3" "59.4|59.4" "59.5|59.5" "59.6|59.6" "59.7|59.7" "59.8|59.8" "59.9|59.9"
	"60|60" "60.1|60.1" "60.2|60.2" "60.3|60.3" "60.4|60.4" "60.5|60.5" "60.6|60.6" "60.7|60.7" "60.8|60.8" "60.9|60.9"
	"61|61" "61.1|61.1" "61.2|61.2" "61.3|61.3" "61.4|61.4" "61.5|61.5" "61.6|61.6" "61.7|61.7" "61.8|61.8" "61.9|61.9"
	"62|62" "62.1|62.1" "62.2|62.2" "62.3|62.3" "62.4|62.4" "62.5|62.5" "62.6|62.6" "62.7|62.7" "62.8|62.8" "62.9|62.9"
	"63|63" "63.1|63.1" "63.2|63.2" "63.3|63.3" "63.4|63.4" "63.5|63.5" "63.6|63.6" "63.7|63.7" "63.8|63.8" "63.9|63.9"
	"64|64" "64.1|64.1" "64.2|64.2" "64.3|64.3" "64.4|64.4" "64.5|64.5" "64.6|64.6" "64.7|64.7" "64.8|64.8" "64.9|64.9"
	"65|65" "65.1|65.1" "65.2|65.2" "65.3|65.3" "65.4|65.4" "65.5|65.5" "65.6|65.6" "65.7|65.7" "65.8|65.8" "65.9|65.9"
	"66|66" "66.1|66.1" "66.2|66.2" "66.3|66.3" "66.4|66.4" "66.5|66.5" "66.6|66.6" "66.7|66.7" "66.8|66.8" "66.9|66.9"
	"67|67" "67.1|67.1" "67.2|67.2" "67.3|67.3" "67.4|67.4" "67.5|67.5" "67.6|67.6" "67.7|67.7" "67.8|67.8" "67.9|67.9"
	"68|68" "68.1|68.1" "68.2|68.2" "68.3|68.3" "68.4|68.4" "68.5|68.5" "68.6|68.6" "68.7|68.7" "68.8|68.8" "68.9|68.9"
	"69|69" "69.1|69.1" "69.2|69.2" "69.3|69.3" "69.4|69.4" "69.5|69.5" "69.6|69.6" "69.7|69.7" "69.8|69.8" "69.9|69.9"
	"70|70" "70.1|70.1" "70.2|70.2" "70.3|70.3" "70.4|70.4" "70.5|70.5" "70.6|70.6" "70.7|70.7" "70.8|70.8" "70.9|70.9"
	"71|71" "71.1|71.1" "71.2|71.2" "71.3|71.3" "71.4|71.4" "71.5|71.5" "71.6|71.6" "71.7|71.7" "71.8|71.8" "71.9|71.9"
	"72|72" "72.1|72.1" "72.2|72.2" "72.3|72.3" "72.4|72.4" "72.5|72.5" "72.6|72.6" "72.7|72.7" "72.8|72.8" "72.9|72.9"
	"73|73" "73.1|73.1" "73.2|73.2" "73.3|73.3" "73.4|73.4" "73.5|73.5" "73.6|73.6" "73.7|73.7" "73.8|73.8" "73.9|73.9"
	"74|74" "74.1|74.1" "74.2|74.2" "74.3|74.3" "74.4|74.4" "74.5|74.5" "74.6|74.6" "74.7|74.7" "74.8|74.8" "74.9|74.9"
	"75|75" "75.1|75.1" "75.2|75.2" "75.3|75.3" "75.4|75.4" "75.5|75.5" "75.6|75.6" "75.7|75.7" "75.8|75.8" "75.9|75.9"
	"76|76" "76.1|76.1" "76.2|76.2" "76.3|76.3" "76.4|76.4" "76.5|76.5" "76.6|76.6" "76.7|76.7" "76.8|76.8" "76.9|76.9"
	"77|77" "77.1|77.1" "77.2|77.2" "77.3|77.3" "77.4|77.4" "77.5|77.5" "77.6|77.6" "77.7|77.7" "77.8|77.8" "77.9|77.9"
	"78|78" "78.1|78.1" "78.2|78.2" "78.3|78.3" "78.4|78.4" "78.5|78.5" "78.6|78.6" "78.7|78.7" "78.8|78.8" "78.9|78.9"
	"79|79" "79.1|79.1" "79.2|79.2" "79.3|79.3" "79.4|79.4" "79.5|79.5" "79.6|79.6" "79.7|79.7" "79.8|79.8" "79.9|79.9"
	"80|80"
)

KEY_menu_pal=(
	"PAL mode for menu core"
	"0|Off|NTSC mode for menu core"
	"1|On|PAL mode for menu core"
)

KEY_osd_rotate=(
	"Display OSD menu rotated"
	"0|0°|No ratation"
	"1|+90°|Rotate right"
	"2|-90°|Rotate left"
)

KEY_browse_expand=(
	"Enables a second line for long file names in listing"
	"0|Off"
	"1|On"
)

KEY_rbf_hide_datecode=(
	"Hides datecodes/timestamps for rbf file names; press F2 for quick temporary toggle"
	"0|Off|Datecodes/timestamps visible"
	"1|On|Datecodes/timestamps not visible"
)

KEY_fb_terminal=(
	"Enables the framebuffer terminl (the one you are using now) for the Scripts menu"
	"0|Off"
	"1|On"
)

KEY_fb_size=(
	"Framebuffer resolution"
	"0|Automatic"
	"1|Full size"
	"2|1/2 of resolution"
	"4|1/4 of resolution"	
)

KEY_osd_timeout=(
	"Sets the number of seconds OSD will be displayed; 30 seconds if not set; the background picture will get darker 2*timeout"
	"0|Off"
	"5|5 seconds"
	"10|10 seconds"
	"20|20 seconds"
	"30|30 seconds"
	"60|1 minute"
	"120|2 minutes"
	"180|3 minutes"
	"240|4 minutes"
	"300|5 minutes"
	"600|10 minutes"
	"900|15 minutes"
	"1800|30 minutes"
	"2700|45 minutes"
	"3600|1 hour"
)

KEY_video_off=(
	"Turn screen black in the menu core after a certain amount of seconds of inactivity. Valid only if osd_timeout is not set to zero."
	"0|Off"
	"30|30 seconds"
	"60|1 minute"
	"120|2 minutes"
	"180|3 minutes"
	"240|4 minutes"
	"300|5 minutes"
	"600|10 minutes"
	"900|15 minutes"
	"1800|30 minutes"
	"2700|45 minutes"
	"3600|1 hour"
)

KEY_video_info=(
	"Sets the number of seconds video info will be displayed on startup/change"
	"0|Off"
	"1|1 second"
	"2|2 seconds"
	"3|3 seconds"
	"4|4 seconds"
	"5|5 seconds"
	"6|6 seconds"
	"7|7 seconds"
	"8|8 seconds"
	"9|9 seconds"
	"10|10 seconds"
)

KEY_controller_info=(
	"Sets the number of seconds controller info will be displayed on startup/change"
	"0|Off"
	"1|1 second"
	"2|2 seconds"
	"3|3 seconds"
	"4|4 seconds"
	"5|5 seconds"
	"6|6 seconds"
	"7|7 seconds"
	"8|8 seconds"
	"9|9 seconds"
	"10|10 seconds"
)

KEY_recents=(
	"Enables recent loaded/mounted file. WARNING: This option will enable write to SD card on every load/mount which may wear/corrupt the SD card"
	"0|Off"
	"1|On|WARNING: This option may wear/corrupt the SD card"
)

KEY_font=(
	"Custom font; put custom fonts in ${FONTS_DIRECTORY}"
)

KEY_disable_autofire=(
	"Disables autofire if for some reason you do not require it or if it's accidentally triggered."
	"0|Off"
	"1|On"
)

KEY_mouse_throttle=(
	"1-100 mouse speed divider; useful for very sensitive mice"
	"1|1" "2|2" "3|3" "4|4" "5|5" "6|6" "7|7" "8|8" "9|9"
	"10|10" "11|11" "12|12" "13|13" "14|14" "15|15" "16|16" "17|17" "18|18" "19|19"
	"20|20" "21|21" "22|22" "23|23" "24|24" "25|25" "26|26" "27|27" "28|28" "29|29"
	"30|30" "31|31" "32|32" "33|33" "34|34" "35|35" "36|36" "37|37" "38|38" "39|39"
	"40|40" "41|41" "42|42" "43|43" "44|44" "45|45" "46|46" "47|47" "48|48" "49|49"
	"50|50" "51|51" "52|52" "53|53" "54|54" "55|55" "56|56" "57|57" "58|58" "59|59"
	"60|60" "61|61" "62|62" "63|63" "64|64" "65|65" "66|66" "67|67" "68|68" "69|69"
	"70|70" "71|71" "72|72" "73|73" "74|74" "75|75" "76|76" "77|77" "78|78" "79|79"
	"80|80" "81|81" "82|82" "83|83" "84|84" "85|85" "86|86" "87|87" "88|88" "89|89"
	"90|90" "91|91" "92|92" "93|93" "94|94" "95|95" "96|96" "97|97" "98|98" "99|99"
	"100|100"
)

KEY_wheel_force=(
	"Wheel centering force 0-100. Default is 50."
	"0|0" "1|1" "2|2" "3|3" "4|4" "5|5" "6|6" "7|7" "8|8" "9|9"
	"10|10" "11|11" "12|12" "13|13" "14|14" "15|15" "16|16" "17|17" "18|18" "19|19"
	"20|20" "21|21" "22|22" "23|23" "24|24" "25|25" "26|26" "27|27" "28|28" "29|29"
	"30|30" "31|31" "32|32" "33|33" "34|34" "35|35" "36|36" "37|37" "38|38" "39|39"
	"40|40" "41|41" "42|42" "43|43" "44|44" "45|45" "46|46" "47|47" "48|48" "49|49"
	"50|50" "51|51" "52|52" "53|53" "54|54" "55|55" "56|56" "57|57" "58|58" "59|59"
	"60|60" "61|61" "62|62" "63|63" "64|64" "65|65" "66|66" "67|67" "68|68" "69|69"
	"70|70" "71|71" "72|72" "73|73" "74|74" "75|75" "76|76" "77|77" "78|78" "79|79"
	"80|80" "81|81" "82|82" "83|83" "84|84" "85|85" "86|86" "87|87" "88|88" "89|89"
	"90|90" "91|91" "92|92" "93|93" "94|94" "95|95" "96|96" "97|97" "98|98" "99|99"
	"100|100"
)

KEY_sniper_mode=(
	"Speeds in sniper/non-sniper modes of mouse emulation by joystick"
	"0|Faster movement in non-sniper mode, slower in sniper mode"
	"1|Movement speeds are swapped"
)

KEY_bootscreen=(
	"Enables boot screen of some cores like Minimig"
	"0|Off"
	"1|On"
)

KEY_reset_combo=(
	"USER button emulation using a keybaord. Usually it's the reset button."
	"0|lctrl+lalt+ralt (lctrl+lgui+rgui on keyrah)"
	"1|lctrl+lgui+rgui"
	"2|lctrl+lalt+del"
	"3|lctrl+lalt+ralt (lctrl+lalt+ralt on keyrah)"
)

KEY_key_menu_as_rgui=(
	"Enables the MENU key map to RGUI in Minimig (e.g. for Right Amiga)"
	"0|Off"
	"1|On"
)

KEY_keyrah_mode=(
	"VIDPID of Keyrah for special code translation"
	"0x18d80002|0x18d80002|Use this for original Keyrah"
	"0x23418037|0x23418037|Use this for Arduino Micro"
)

KEY_jamma_vid=(
	"JammaSD keys to joysticks translation for Player 1 and Player 2; you have to provide correct VID and PID of your input device"
	"0x04D8|0x04D8"
)

KEY_jamma_pid=(
	"JammaSD keys to joysticks translation for Player 1 and Player 2; you have to provide correct VID and PID of your input device"
	"0xF3AD|0xF3AD"
)

KEY_jamma2_vid=(
	"JammaSD keys to joysticks translation for Player 3 and Player 4; you have to provide correct VID and PID of your input device"
	"0x1111|0x1111"
)

KEY_jamma2_pid=(
	"JammaSD keys to joysticks translation for Player 3 and Player 4; you have to provide correct VID and PID of your input device"
	"0x2222|0x2222"
)

KEY_bootcore=(
	"Enables core autobooting"
	 "|Disabled"
	 "lastcore|lastcore|Autoboot the last loaded core (corename autosaved in CONFIG/lastcore.dat) first found on the SD/USB"
	 "lastexactcore|lastexactcore|Autoboot the last loaded exact core (corename_yyyymmdd.rbf autosaved in CONFIG/lastcore.dat) first found on the SD/USB"
)

KEY_bootcore_timeout=(
	"Sets the timeout before autoboot"
	"10|10 seconds" "11|11 seconds" "12|12 seconds" "13|13 seconds" "14|14 seconds"
	"15|15 seconds" "16|16 seconds" "17|17 seconds" "18|18 seconds" "19|19 seconds"
	"20|20 seconds" "21|21 seconds" "22|22 seconds" "23|23 seconds" "24|24 seconds"
	"25|25 seconds" "26|26 seconds" "27|27 seconds" "28|28 seconds" "29|29 seconds"
	"30|30 seconds"
)

KEY_osd_lock=(
	"Locks access to the OSD behind access code when a core is running"
	"|Disabled"
	"DUUUD|↓ ↑ ↑ ↑ ↓|↓ ↑ ↑ ↑ ↓ to unlock OSD"
	"UDLR|↑ ↓ ← →|↑ ↓ ← → to unlock OSD"
	"ABBA|A B B A|A B B A to unlock OSD"
	"UDUDLRLRBA|↑ ↑ ↓ ↓ ← → ← → B A|Konami Code (↑ ↑ ↓ ↓ ← → ← → B A) to unlock OSD"
)

KEY_osd_lock_time=(
	"Bypass OSD Lock if less than the x seconds have passed since it was last unlocked"
	"0|Manual lock from OSD"
	"3|3 seconds" "5|5 seconds" "10|10 seconds" "30|30 seconds"
)

KEY_debug=(
	"Serial console debug output"
	"0|Off|Disables serial console debug output"
	"1|On|Default - Enables serial console debug output"
)

# ========= CODE STARTS HERE =========

function checkTERMINAL {
#	if [ "$(uname -n)" != "MiSTer" ]
#	then
#		echo "This script must be run"
#		echo "on a MiSTer system."
#		exit 1
#	fi
	if [[ ! (-t 0 && -t 1 && -t 2) ]]
	then
		echo "This script must be run"
		echo "from an interactive terminal."
		echo "Please press F9 (F12 to exit)"
		echo "or use SSH."
		exit 2
	fi
}

function setupScriptINI {
	# get the name of the script, or of the parent script if called through a 'curl ... | bash -'
	ORIGINAL_SCRIPT_PATH="${0}"
	[[ "${ORIGINAL_SCRIPT_PATH}" == "bash" ]] && \
		ORIGINAL_SCRIPT_PATH="$(ps -o comm,pid | awk -v PPID=${PPID} '$2 == PPID {print $1}')"

	# ini file can contain user defined variables (as bash commands)
	# Load and execute the content of the ini file, if there is one
	INI_PATH="${ORIGINAL_SCRIPT_PATH%.*}.ini"
	if [[ -f "${INI_PATH}" ]] ; then
		TMP=$(mktemp)
		# preventively eliminate DOS-specific format and exit command  
		dos2unix < "${INI_PATH}" 2> /dev/null | grep -v "^exit" > ${TMP}
		source ${TMP}
		rm -f ${TMP}
	fi
}

function setupCURL
{
	[ ! -z "${CURL}" ] && return
	CURL_RETRY="--connect-timeout 15 --max-time 120 --retry 3 --retry-delay 5"
	# test network and https by pinging the most available website 
	SSL_SECURITY_OPTION=""
	curl ${CURL_RETRY} --silent https://github.com > /dev/null 2>&1
	case $? in
		0)
			;;
		60)
			if [[ "${ALLOW_INSECURE_SSL}" == "true" ]]
			then
				SSL_SECURITY_OPTION="--insecure"
			else
				echo "CA certificates need"
				echo "to be fixed for"
				echo "using SSL certificate"
				echo "verification."
				echo "Please fix them i.e."
				echo "using security_fixes.sh"
				exit 2
			fi
			;;
		*)
			echo "No Internet connection"
			exit 1
			;;
	esac
	CURL="curl ${CURL_RETRY} ${SSL_SECURITY_OPTION} --location"
	CURL_SILENT="${CURL} --silent --fail"
}

function installDEBS () {
	DEB_REPOSITORIES=( "${@}" )
	TEMP_PATH="/tmp"
	for DEB_REPOSITORY in "${DEB_REPOSITORIES[@]}"; do
		OLD_IFS="${IFS}"
		IFS="|"
		PARAMS=(${DEB_REPOSITORY})
		DEBS_URL="${PARAMS[0]}"
		DEB_PREFIX="${PARAMS[1]}"
		ARCHIVE_FILES="${PARAMS[2]}"
		STRIP_COMPONENTS="${PARAMS[3]}"
		DEST_DIR="${PARAMS[4]}"
		IFS="${OLD_IFS}"
		if [ ! -f "${DEST_DIR}/$(echo $ARCHIVE_FILES | sed 's/*//g')" ]
		then
			DEB_NAMES=$(${CURL_SILENT} "${DEBS_URL}" | grep -oE "\"${DEB_PREFIX}[a-zA-Z0-9%./_+-]*_(armhf|all)\.deb\"" | sed 's/\"//g')
			MAX_VERSION=""
			MAX_DEB_NAME=""
			for DEB_NAME in $DEB_NAMES; do
				CURRENT_VERSION=$(echo "${DEB_NAME}" | grep -o '_[a-zA-Z0-9%.+-]*_' | sed 's/_//g')
				if [[ "${CURRENT_VERSION}" > "${MAX_VERSION}" ]]
				then
					MAX_VERSION="${CURRENT_VERSION}"
					MAX_DEB_NAME="${DEB_NAME}"
				fi
			done
			[ "${MAX_DEB_NAME}" == "" ] && echo "Error searching for ${DEB_PREFIX} in ${DEBS_URL}" && exit 1
			echo "Downloading ${MAX_DEB_NAME}"
			${CURL} "${DEBS_URL}/${MAX_DEB_NAME}" -o "${TEMP_PATH}/${MAX_DEB_NAME}"
			[ ! -f "${TEMP_PATH}/${MAX_DEB_NAME}" ] && echo "Error: no ${TEMP_PATH}/${MAX_DEB_NAME} found." && exit 1
			echo "Extracting ${ARCHIVE_FILES}"
			ORIGINAL_DIR="$(pwd)"
			cd "${TEMP_PATH}"
			rm data.tar.xz > /dev/null 2>&1
			ar -x "${TEMP_PATH}/${MAX_DEB_NAME}" data.tar.xz
			cd "${ORIGINAL_DIR}"
			rm "${TEMP_PATH}/${MAX_DEB_NAME}"
			mkdir -p "${DEST_DIR}"
			[ ! -f "${TEMP_PATH}/data.tar.xz" ] && echo "Error: no ${TEMP_PATH}/data.tar.xz found." && exit 1
			tar -xJf "${TEMP_PATH}/data.tar.xz" --wildcards --no-anchored --strip-components="${STRIP_COMPONENTS}" -C "${DEST_DIR}" "${ARCHIVE_FILES}"
			rm "${TEMP_PATH}/data.tar.xz" > /dev/null 2>&1
		fi
	done
}

function setupDIALOG {
	if which dialog > /dev/null 2>&1
	then
		DIALOG="dialog"
	else
		if [ ! -f /media/fat/linux/dialog/dialog ]
		then
			setupCURL
			installDEBS "http://http.us.debian.org/debian/pool/main/d/dialog|dialog_1.3-2016|dialog|3|/media/fat/linux/dialog" "http://http.us.debian.org/debian/pool/main/n/ncurses|libncursesw5_6.0|libncursesw.so.5*|3|/media/fat/linux/dialog" "http://http.us.debian.org/debian/pool/main/n/ncurses|libtinfo5_6.0|libtinfo.so.5*|3|/media/fat/linux/dialog"
		fi
		DIALOG="/media/fat/linux/dialog/dialog"
		export LD_LIBRARY_PATH="/media/fat/linux/dialog"
	fi
	
	[ -f "/media/fat/config/dialogrc" ] && rm -f "/media/fat/config/dialogrc"
	if [ ! -f "~/.dialogrc" ]
	then
		export DIALOGRC="$(dirname ${ORIGINAL_SCRIPT_PATH})/.dialogrc"
		if [ ! -f "${DIALOGRC}" ]
		then
			${DIALOG} --create-rc "${DIALOGRC}"
			sed -i "s/use_colors = OFF/use_colors = ON/g" "${DIALOGRC}"
			sed -i "s/screen_color = (CYAN,BLUE,ON)/screen_color = (CYAN,BLACK,ON)/g" "${DIALOGRC}"
			sync
		fi
	fi
	
	export NCURSES_NO_UTF8_ACS=1
	
	: ${DIALOG_OK=0}
	: ${DIALOG_CANCEL=1}
	: ${DIALOG_HELP=2}
	: ${DIALOG_EXTRA=3}
	: ${DIALOG_ITEM_HELP=4}
	: ${DIALOG_ESC=255}

	: ${SIG_NONE=0}
	: ${SIG_HUP=1}
	: ${SIG_INT=2}
	: ${SIG_QUIT=3}
	: ${SIG_KILL=9}
	: ${SIG_TERM=15}
}

function setupDIALOGtempfile {
	DIALOG_TEMPFILE=`(DIALOG_TEMPFILE) 2>/dev/null` || DIALOG_TEMPFILE=/tmp/dialog_tempfile$$
	trap "rm -f $DIALOG_TEMPFILE" 0 $SIG_NONE $SIG_HUP $SIG_INT $SIG_QUIT $SIG_TERM
}

function readDIALOGtempfile {
	DIALOG_RETVAL=$?
	DIALOG_OUTPUT="$(cat ${DIALOG_TEMPFILE})"
}

function loadMiSTerINI {
	MISTER_EXAMPLE_INI_FILE="${MISTER_INI_FILE/MiSTer.ini/MiSTer_example.ini}"
	MISTER_ALT_INI_FILE="${MISTER_INI_FILE/MiSTer.ini/MiSTer_alt"*".ini}"
	
	if [ ! -f "${MISTER_INI_FILE}" ]
	then
		if [ -f "/media/fat/config/MiSTer.ini" ]
		then
			mv "/media/fat/config/MiSTer.ini" "${MISTER_INI_FILE}"
		elif [ -f "${MISTER_EXAMPLE_INI_FILE}" ]
		then
			cp "${MISTER_EXAMPLE_INI_FILE}" "${MISTER_INI_FILE}"
		else
			setupCURL
			echo "Downloading MiSTer.ini"
			${CURL} "https://github.com/MiSTer-devel/Main_MiSTer/blob/master/MiSTer.ini?raw=true" -o "${MISTER_INI_FILE}"
		fi
		
	fi
	MISTER_INI_ORIGINAL="$(cat "${MISTER_INI_FILE}" | dos2unix)"
	MISTER_INI="${MISTER_INI_ORIGINAL}"
	
	if [ ! -f "${MISTER_ALT_INI_FILE}" ]
	then
		if [ -f "${MISTER_EXAMPLE_INI_FILE}" ]
		then
			cp "${MISTER_EXAMPLE_INI_FILE}" "${MISTER_ALT_INI_FILE}"
		else
			#setupCURL
			#echo "Downloading MiSTer_alt.ini"
			#${CURL} "https://github.com/MiSTer-devel/Main_MiSTer/blob/master/MiSTer.ini?raw=true" -o "${MISTER_ALT_INI_FILE}"
			cp "${MISTER_INI_FILE}" "${MISTER_ALT_INI_FILE}"
		fi
	fi
}

function checkKEY () {
	INI_KEY="${1}"
	echo "${MISTER_INI}" | grep -qE "^\s*${INI_KEY}\s*="
	return ${?}
}

#declare -A valueCACHE

function getVALUE () {
	INI_KEY="${1}"
	#if [ -v "valueCACHE[${INI_KEY}]" ]
	#then
	#	#echo "CACHE HIT"
	#	INI_VALUE="${valueCACHE[${INI_KEY}]}"
	#else 
	#	#echo "CACHE MISS"
		INI_VALUE=$(echo "${MISTER_INI}" | grep -oE -m 1 "^\s*${INI_KEY}\s*=\s*[a-zA-Z0-9%().,/_-]+"|sed "s/^\s*${INI_KEY}\s*=\s*//")
	#	valueCACHE["${INI_KEY}"]="${INI_VALUE}"
	#fi	
	[ ${INI_KEY} == "font" ] && INI_VALUE="${INI_VALUE/*\//}" && INI_VALUE="${INI_VALUE%.*}"
}

function setVALUE () {
	INI_KEY="${1}"
	INI_VALUE="${2}"
	[ ${INI_KEY} == "font" ] && INI_VALUE="${FONTS_DIRECTORY/\/media\/fat\//}/${INI_VALUE/[* ]/}.${FONTS_EXTENSION}"
	#valueCACHE["${INI_KEY}"]="${INI_VALUE}"
	INI_VALUE=$(echo "${INI_VALUE}" | sed 's/\//\\\//g' | sed 's/\./\\\./g')
	checkKEY ${INI_KEY} || MISTER_INI=$(echo "${MISTER_INI}" | sed "1,/^\s*;\s*$INI_KEY\s*=\s*/{s/^\s*;\s*$INI_KEY\s*=\s*/$INI_KEY=/}")
	checkKEY ${INI_KEY} || MISTER_INI=$(echo "${MISTER_INI}" | sed '/\[MiSTer\]/a\'$INI_KEY'=')
	MISTER_INI=$(echo "${MISTER_INI}" | sed "1,/^\s*$INI_KEY\s*=\s*[a-zA-Z0-9%().,/_-]*/{s/^\s*$INI_KEY\s*=\s*[a-zA-Z0-9%().,/_-]*/$INI_KEY=$INI_VALUE/}")
}

function showMainMENU_GUI {
	showPleaseWAIT
	MENU_ITEMS=""
	for INI_KEY in ${INI_KEYS}; do
		# checkKEY ${INI_KEY} || continue
		getVALUE "${INI_KEY}"
		[ "${INI_VALUE}" = "" ] && INI_VALUE="Not set or commented"
		INI_KEY_HELP=""
		INI_VALUE_DESCRIPTION=""
		for INDEX in $(eval echo \${!KEY_${INI_KEY}[@]}); do
			KEY_VALUE_CONFIG="$(eval echo \${KEY_${INI_KEY}[${INDEX}]})"
			if [ "${INDEX}" == "0" ]
			then
				INI_KEY_HELP="${KEY_VALUE_CONFIG}"
			else
				INI_VALUE_RAW="${KEY_VALUE_CONFIG%%|*}"
				if [ "${INI_VALUE_RAW}" == "${INI_VALUE}" ]
				then
					INI_VALUE_DESCRIPTION="${KEY_VALUE_CONFIG#*|}" && INI_VALUE_DESCRIPTION="${INI_VALUE_DESCRIPTION%%|*}"
					break
				fi
			fi
		done
		[ "${INI_VALUE_DESCRIPTION}" == "" ] && INI_VALUE_DESCRIPTION="${INI_VALUE}"
		MENU_ITEMS="${MENU_ITEMS} \"${INI_KEY}\" \"${INI_VALUE_DESCRIPTION}\" \"${INI_KEY_HELP}\""
	done
	
	[ "${MISTER_INI}" == "${MISTER_INI_ORIGINAL}" ] && SAVE_BUTTON="" || SAVE_BUTTON="--extra-button --extra-label \"Save\""
	
	setupDIALOGtempfile
	eval ${DIALOG} --clear --item-help --ok-label \"Select\" \
		${SAVE_BUTTON} \
		--help-button --help-label \"Advanced...\" \
		--title \"MiSTer INI Settings\" \
		--menu \"Please choose an option you want to change.$'\n'Use arrow keys, tab, space, enter and esc.\" ${DIALOG_HEIGHT} 0 999 \
		${MENU_ITEMS} \
		2> ${DIALOG_TEMPFILE}
	readDIALOGtempfile
}

function showMainMENU_EDITOR {
	EDITOR_TEMPFILE=/tmp/editor_tempfile$$
	echo "${MISTER_INI}" > "${EDITOR_TEMPFILE}"
	setupDIALOGtempfile
	eval ${DIALOG} --clear --defaultno \
		--title \"MiSTer INI Settings\" \
		--editbox "${EDITOR_TEMPFILE}" ${DIALOG_HEIGHT} 0 \
		2> ${DIALOG_TEMPFILE}
	readDIALOGtempfile
	rm -f "${EDITOR_TEMPFILE}"
	unset EDITOR_TEMPFILE
}

function showOptionMENU {
	showPleaseWAIT
	INI_KEY=${DIALOG_OUTPUT}
	MENU_ITEMS=""
	ADDITIONAL_OPTIONS=""
	getVALUE "${INI_KEY}"
	case "${INI_KEY}" in
		"font")
			[ ! -d "${FONTS_DIRECTORY}" ] && return ${DIALOG_CANCEL}
			ADDITIONAL_OPTIONS="--no-items"
			INI_KEY_HELP="$(eval echo \${KEY_${INI_KEY}[0]})"
			for FONT in "${FONTS_DIRECTORY}"/*."${FONTS_EXTENSION}"
			do
				INI_VALUE_RAW="${FONT/*\//}" && INI_VALUE_RAW="${INI_VALUE_RAW%.*}"
				# INI_VALUE_DESCRIPTION="${FONT}"
				[ "${INI_VALUE_RAW}" == "${INI_VALUE}" ] && INI_VALUE_RAW="*${INI_VALUE_RAW}" || INI_VALUE_RAW=" ${INI_VALUE_RAW}"
				INI_VALUE_HELP=""
				MENU_ITEMS="${MENU_ITEMS} \"${INI_VALUE_RAW}\" \"${INI_VALUE_HELP}\""
			done
			;;
		*)
			for INDEX in $(eval echo \${!KEY_${INI_KEY}[@]}); do
				KEY_VALUE_CONFIG="$(eval echo \${KEY_${INI_KEY}[${INDEX}]})"
				if [ "${INDEX}" == "0" ]
				then
					INI_KEY_HELP="${KEY_VALUE_CONFIG}"
				else
					INI_VALUE_RAW="${KEY_VALUE_CONFIG%%|*}"
					INI_VALUE_DESCRIPTION="${KEY_VALUE_CONFIG#*|}" && INI_VALUE_DESCRIPTION="${INI_VALUE_DESCRIPTION%%|*}"
					[ "${INI_VALUE_RAW}" == "${INI_VALUE}" ] && INI_VALUE_COLOR="\Z1\Zu" || INI_VALUE_COLOR=""
					INI_VALUE_HELP="${KEY_VALUE_CONFIG##*|}" && [ "${INI_VALUE_HELP}" == "${INI_VALUE_DESCRIPTION}" ] && INI_VALUE_HELP=""
					MENU_ITEMS="${MENU_ITEMS} \"${INI_VALUE_RAW}\" \"${INI_VALUE_COLOR}${INI_VALUE_DESCRIPTION}\" \"${INI_VALUE_HELP}\""
				fi
			done
			;;
	esac
	
	setupDIALOGtempfile
	eval ${DIALOG} --clear --colors --item-help --ok-label \"Select\" \
		--title \"MiSTer INI Settings: ${INI_KEY}\" \
		${ADDITIONAL_OPTIONS} \
		--menu \"${INI_KEY_HELP}\" ${DIALOG_HEIGHT} 0 999 \
		${MENU_ITEMS} \
		2> ${DIALOG_TEMPFILE}
	readDIALOGtempfile
}

function showPleaseWAIT {
	${DIALOG} --title "MiSTer INI Settings" \
	--infobox "Please wait..." 0 0
}



checkTERMINAL
setupScriptINI
setupDIALOG

loadMiSTerINI

SHOW_GUI="true"

while true; do
	if [ "${SHOW_GUI}" == "true" ]
	then
		showMainMENU_GUI
		case ${DIALOG_RETVAL} in
			${DIALOG_OK})
				# OK=Select INI key to change
				INI_KEY=${DIALOG_OUTPUT}
				showOptionMENU
				case ${DIALOG_RETVAL} in
					${DIALOG_OK})
						INI_VALUE="${DIALOG_OUTPUT}"
						setVALUE "${INI_KEY}" "${INI_VALUE}"
						;;
					${DIALOG_CANCEL})
						;;
					${DIALOG_ESC})
						;;
				esac
				;;
			${DIALOG_CANCEL})
				break;;
			${DIALOG_HELP})
				# Help=Advanced... manual INI editor
				SHOW_GUI="false"
				;;
			${DIALOG_EXTRA})
				# Extra=Save
				cp "${MISTER_INI_FILE}" "${MISTER_INI_FILE}.bak"
				echo "${MISTER_INI}" | unix2dos > "${MISTER_INI_FILE}"
				sync
				${DIALOG} --clear --title "MiSTer INI Settings" --defaultno --yesno "Do you want to reboot in order to apply the changes?" 0 0 && echo "If you have video problems, please hold OSD menu button while rebooting in order to load alternative MiSTer_alt.ini configuration file." && sleep 3 && reboot now
				break;;
			${DIALOG_ESC})
				break;;
		esac
	else
		showMainMENU_EDITOR
		case ${DIALOG_RETVAL} in
			${DIALOG_OK})
				MISTER_INI="${DIALOG_OUTPUT}"
				SHOW_GUI="true"
				;;
			${DIALOG_CANCEL})
				SHOW_GUI="true"
				;;
			${DIALOG_ESC})
				SHOW_GUI="true"
				;;
		esac
	fi
done

clear

exit 0
