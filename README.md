# Firmware Development and Learning:

This project was made to hone my skills in firmware development using embedded C, python and kernel level mods. These are used to integrate various hardware into the subsystem interface such as buttons, I2C lines, batteries etc. The brunt of this project is to learn kernel programming and GPIO exports from kernel space to user space using automated methods and sysfs interfacing.

Most of the work done here was using Raspberry Pi, Arduino Demulenov and the Nvidia Jetson TX2 with a Connecttech Spacely carrier board (ASG0006)

- GPIO interfacing scripts to use with Nvidia Jetson specific PCB that was developed.
- IRQ button Event generator from GPIO pins.
- Sysfs GPIO exporter from Kernel to user space for GPIO work.
- LTC-4100 charge controller scripts
