#!/usr/bin/env bash

set -e
[ -n "$LUC_DEBUG" ] && set -x

setDisplayedColors()
{
    if command -v tput > /dev/null 2>&1; then
        ncolors=$(tput colors)
    fi

    if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
        RED="$(tput setaf 1)"
        GREEN="$(tput setaf 2)"
        YELLOW="$(tput setaf 3)"
        BLUE="$(tput setaf 4)"
        BOLD="$(tput bold)"
        NORMAL="$(tput sgr0)"
    else
        RED=""
        GREEN=""
        YELLOW=""
        BLUE=""
        BOLD=""
        NORMAL=""
    fi
}

main()
{
    setDisplayedColors
}

# Run script
RUNNING=$(basename $0)
[ "$RUNNING" = "setup_uninstall.sh" ] && main
