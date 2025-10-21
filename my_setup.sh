#!/bin/bash

myDep=("git", "curl", "build_essential","cmake","python3-dev")

sudo apt update && sudo apt upgrade
for item in ${myDep[@]}; do
	sudo apt update && sudo apt install $item

done
