#!/bin/bash
# this will compile a static binary ready to be containerized
CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o multiprobe .
