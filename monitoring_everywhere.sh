#!/usr/bin/env bash

/home/sbeldjao/monitoring.sh > /dev/tty1
/home/sbeldjao/monitoring.sh | tee /dev/pts/*
