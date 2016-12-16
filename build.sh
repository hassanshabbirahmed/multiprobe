#!/bin/bash
# this will compile a static binary ready to be containerized
GO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o multiprobe .
