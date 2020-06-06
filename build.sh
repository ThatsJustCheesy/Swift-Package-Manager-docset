#!/bin/bash -v
set -eo pipefail

if ! hash dashing
then
	read -p 'dashing command not found; install it with brew? [y/N]' ans
	case $ans in
		[Yy]* ) brew install dashing; break;;
		* ) echo 'Build aborted.'; exit 1;;
	esac
fi

cd "$(dirname "$0")"
dashing build swiftpm

# Experimental Dash-native ToC support: (1/2) comment out this line.
# This line disables the Dash-native ToC in favor of the swift.org HTML sidebar.
plutil -remove DashDocSetFamily swiftpm.docset/Contents/Info.plist

# Experimental Dash-native ToC support: (2/2) uncomment these lines.
# For some reason the main content is still offset to the right on the rendered page.
# I would recommend sticking with the swift.org HTML sidebar instead (not uncommenting these lines).
# cat <<CSS >> swiftpm.docset/Contents/Resources/Documents/package-manager/_static/stylesheets/application.css
# /* Dash docset: disable in-page navigation */
# nav[role="navigation"] {
# 	display: none !important
# }
# main {
# 	margin-left: 0 !important
# }
# footer[role="contentinfo"] {
# 	margin-left: 0 !important
# }
# CSS
