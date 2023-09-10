#!/bin/bash
chev=$(python3 -V)
check_version() {
        if [ -z "$chev" ]
        then
                echo "Not installed"
        else
                echo "${chev} is installed"
        fi
}

check_version
