#!/bin/sh
USER=root
HOME="/app"
whoami
exec /usr/bin/code -w --user-data-dir="/app"