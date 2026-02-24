#!/bin/bash
sleep 1
killall -9 walker
killall -9 elephant
sleep 2
walker --gapplication-service &
elephant &
