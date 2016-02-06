#!/bin/sh

cat $1 | sed s/fill:black\;//g > icons.svg && mv tmp $1
