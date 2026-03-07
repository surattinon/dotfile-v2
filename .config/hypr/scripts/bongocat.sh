#!/bin/bash

killall bongocat

sleep 1

bongocat --watch-config &
