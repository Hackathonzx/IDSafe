#!/bin/bash

while true; do
  find . -name '._*' -type f -delete &>/dev/null
done
