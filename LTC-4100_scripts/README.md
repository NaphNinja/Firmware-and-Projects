# ltc4100_Script

This is a set of simple bash script used to comunicate with LTC4100 chip.
This script is tested on Jetson TK1 with EasyTK1_IO.
You must connect LTC4100's I2C to GEN2 connector of EasyTK1_IO V2 and call script as root.


#Usage Example#

In Plutarco Robot I've edit ***/etc/rc.local*** file and I've added this line before ***exit 0*** command:

```
# Run ChargingVoltageCurrentSet script to send ( loop ) 16,8V 200mA charging value to Battery Charger
/home/max_xxv/git/ltc4100/ChargingVoltageCurrentSet.sh 16800 200 &

# Disable charging at startup
/home/max_xxv/git/ltc4100/ChargerModeSet.sh 1
```

**Note:** In rc.local script during test I prefer to disable Charger with *ChargerModeSet.sh 1* command, I use different battery type and I've already damaged a 4S battery with a *ChargingVoltageCurrentSet.sh 22500 200 &" configuration.


