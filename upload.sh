#!/bin/bash

FILE="out/target/product/titan/cm-12-*-UNOFFICIAL-titan.zip"

ftp -inv "uploads.androidfilehost.com" <<EOF
user "luca020400" "$password"
put "$FILE"
EOF
