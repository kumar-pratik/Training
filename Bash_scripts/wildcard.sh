#!/bin/sh
mkdir /tmp/a
mkdir /tmp/b
touch /tmp/a/a1.txt
touch /tmp/a/a2.txt
touch /tmp/a/a3.html
touch /tmp/a/a4.html
cp /tmp/a/*.txt /tmp/b/
