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


VALUE=$( i2cget -y 1 $ADD_LTC4100_READ $LTC4100_CHARGER_STATUS w )
echo $VALUE

# BIT 0 of ChargerStatus()
BIT=$((2**0))
((( $(($VALUE)) & $BIT) == $BIT)) && echo 'CHARGE_INHIBITED: True' || echo 'CHARGE_INHIBITED: False'

# BIT 4 of ChargerStatus()
BIT=$((2**4))
((( $(($VALUE)) & $BIT) == $BIT)) && echo 'LEVEL_BITL      : 1' || echo 'LEVEL_BITL       : 0'

# BIT 5 of ChargerStatus()
BIT=$((2**5))
((( $(($VALUE)) & $BIT ) == $BIT)) && echo 'LEVEL_BITH      : 1' || echo 'LEVEL_BITH      : 0'

# BIT 6 of ChargerStatus()
BIT=$((2**6))
((( $(($VALUE)) & $BIT) == $BIT)) && echo 'CURRENT_OR      : True' || echo 'CURRENT_OR      : False'

# BIT 7 of ChargerStatus()
BIT=$((2**7))
((( $(($VALUE)) & $BIT) == $BIT)) && echo 'VOLTAGE_OR      : True' || echo 'VOLTAGE_OR      : False'

# BIT 8 of ChargerStatus()
BIT=$((2**8))
((( $(($VALUE)) & $BIT) == $BIT)) && echo 'RES_OR          : True ( > 95Kohm )' || echo 'RES_OR          : False'

# BIT 9 of ChargerStatus()
BIT=$((2**9))
((( $(($VALUE)) & $BIT) == $BIT)) && echo 'RES_COLD        : True' || echo 'RES_COLD        : False'

# BIT 10 of ChargerStatus()
BIT=$((2**10))
((( $(($VALUE)) & $BIT) == $BIT)) && echo 'RES_HOT         : True ( < 3150 ohm )' || echo 'RES_HOT         : False'

# BIT 11 of ChargerStatus()
BIT=$((2**11))
((( $(($VALUE)) & $BIT) == $BIT)) && echo 'RES_UR         : True' || echo 'RES_UR          : False'

# BIT 12 of ChargerStatus()
BIT=$((2**12))
((( $(($VALUE)) & $BIT) == $BIT)) && echo 'ALARM_INHIBITED : True' || echo 'ALARM_INHIBITED : False'

# BIT 13 of ChargerStatus()
BIT=$((2**13))
((( $(($VALUE)) & $BIT) == $BIT)) && echo 'POWER_FAIL      : True ( DC Input not sufficient )' || echo 'POWER_FAIL      : False'

# BIT 14 of ChargerStatus()
BIT=$((2**14))
((( $(($VALUE)) & $BIT) == $BIT)) && echo 'BATTERY_PRESENT : True' || echo 'BATTERY_PRESENT : False'

# BIT 15 of ChargerStatus()
BIT=$((2**15))
((( $(($VALUE)) & $BIT) == $BIT)) && echo 'AC_PRESENT      : True' || echo 'AC_PRESENT      : False'

#  echo "HEX: "$VALUE
#  VALUEBIN=$(echo "obase=2; ibase=10; $(($VALUE))" | bc)
#  echo "BIN: "$VALUEBIN

