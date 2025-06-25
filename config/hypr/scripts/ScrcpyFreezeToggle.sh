#!/bin/bash

PID=$(pidof scrcpy)

if [ -z "$PID" ]; then
    exit
fi

# T - process stopped flag
STATUS=$(ps -o state= -p "$PID")
if [ "$STATUS" = "T" ]; then
    kill -SIGCONT "$PID"
    notify-send "scrcpy: Resumed"
else
    kill -SIGSTOP "$PID"
    notify-send "scrcpy: Frozen"
fi
