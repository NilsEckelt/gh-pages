#!/bin/sh

cat $1 | sed s/fill:black\;//g > tmp && mv tmp $1
