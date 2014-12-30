#!/bin/bash
source $(dirname $0)/LOG_CONFIG

rrdtool create $RRD_DB --start N --step 60 \
DS:temperature:GAUGE:600:U:U \
RRA:AVERAGE:0.5:1:60 \
RRA:AVERAGE:0.5:10:144 \
DS:humidity:GAUGE:600:U:U \
RRA:AVERAGE:0.5:1:60 \
RRA:AVERAGE:0.5:10:144 \

