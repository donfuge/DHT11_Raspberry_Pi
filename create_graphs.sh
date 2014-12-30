#!/bin/bash
source $(dirname $0)/LOG_CONFIG

HOUR=3600
DAY=$((24*$HOUR))
YEAR=$((365*$DAY))

COLOR="#CC0000"

# past hour
rrdtool graph $GRAPH_DIR/temperature_hourly.png  \
--width 800 --height 200 \
--start -$HOUR  --end -1 \
--vertical-label "Temperature" \
--title "Inside temperature (hourly)" \
DEF:temperature=$RRD_DB:temperature:AVERAGE \
LINE1:temperature$COLOR:"Temperature"
 
# past day
rrdtool graph $GRAPH_DIR/temperature_daily.png \
--width 800 --height 200 \
--start -$DAY  --end -1 \
--vertical-label "Temperature" \
--title "Inside temperature (daily)" \
DEF:temperature=$RRD_DB:temperature:AVERAGE \
LINE1:temperature$COLOR:"Temperature"

# past hour
rrdtool graph $GRAPH_DIR/humidity_hourly.png  \
--width 800 --height 200 \
--start -$HOUR  --end -1 \
--vertical-label "Humidity" \
--title "Inside humidity (hourly)" \
DEF:humidity=$RRD_DB:humidity:AVERAGE \
LINE1:humidity$COLOR:"Humidity"

# past day
rrdtool graph $GRAPH_DIR/humidity_daily.png \
--width 800 --height 200 \
--start -$DAY  --end -1 \
--vertical-label "Humidity" \
--title "Inside humidity (daily)" \
DEF:humidity=$RRD_DB:humidity:AVERAGE \
LINE1:humidity$COLOR:"Humidity"
