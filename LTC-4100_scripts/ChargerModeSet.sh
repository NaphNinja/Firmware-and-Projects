#!/bin/bash

#Device address map
ADD_LTC4100_READ=0x09
ADD_SMBUS_SYSTEM_HOST=0x10
ADD_SMART_BATTERY_CHARGER=0x12
ADD_SMART_BATTERY_SELECTOR=0x14
ADD_SMART_BATTERY=0x16

#ReadOnly LTC4100 Register
LTC4100_CHARGER_SPEC_INFO=0x11
LTC4100_CHARGER_STATUS=0x13

#WriteOnly LTC4100 Register
LTC4100_CHARGER_MODE=0x12
LTC4100_CHARGING_CURRENT=0x14
LTC4100_CHARGING_VOLTAGE=0x15
LTC4100_ALARM_WARNING=0x16

#Read/Write LTC4100 Register
LTC4100_LTCO=0x3C


if [ "$#" -ne 1 ]; then
  echo "Illegal number of parameters"
  echo "    "
	echo "You need to use ./ChargerModeSet.sh + COMMAND"
	echo "COMMAND = summ of bit value of ChargerStatus() register "
	echo "INHIBIT_CHARGE = 0x01 ( 1 ) "
	echo "ENABLE_POLLING = 0x02 ( 2 ) "
	echo "POR_RESET      = 0x04 ( 4 ) "
	echo "RESET_TO_ZERO  = 0x08 ( 8 ) "
	echo "other BIT is reserved "
  echo "    "
	echo "See pg 13 of http://cds.linear.com/docs/en/datasheet/4100fc.pdf "
  echo "    "
else
	#	http://cds.linear.com/docs/en/datasheet/4100fc.pdf
	i2cset -y 1 $ADD_LTC4100_READ $LTC4100_CHARGER_MODE $1 w
fi
