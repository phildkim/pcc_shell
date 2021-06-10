#!/bin/bash

if [ -f commands/$1.sh ]; then
    . commands/$1.sh
fi