#!/bin/sh
printf '\033c\033]0;%s\a' Buglike
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Buglike.x86_64" "$@"
