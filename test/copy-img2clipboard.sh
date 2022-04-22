#!/usr/bin/env bash

on_mac(){
  osascript \
    -e 'on run args' \
    -e 'set the clipboard to POSIX file (first item of args)' \
    -e end \
    "$@"
}

case "$(uname)" in
  Darwin) on_mac "$1" ;;
  *) echo "Test can only run on macos for now"; exit 1;;
esac
