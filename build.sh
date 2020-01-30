#!/bin/bash

docker build -t jhoppensteadt/cloudmonkey:latest -t jhoppensteadt/cloudmonkey:$(date +%F) .
