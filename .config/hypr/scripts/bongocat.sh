#!/bin/bash

killall bongocat

sleep 5

bongocat --watch-config &
