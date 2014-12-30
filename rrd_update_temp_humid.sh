#!/bin/bash
source $(dirname $0)/LOG_CONFIG

TEMP=$($GET_TEMP)
HUMID=$($GET_HUMID)
rrdtool update $RRD_DB N:$TEMP:$HUMID