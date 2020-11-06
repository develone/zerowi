#!/bin/bash
rm -f *.o *.a paultest1/WifiTest1/*.a
arm-none-eabi-gcc -O2 -mabi=aapcs -marm -march=armv6 -mfpu=vfp -mfloat-abi=hard -Iwhd -D__DYNAMIC_REENT__ -c srce/zscan.c
arm-none-eabi-gcc -O2 -mabi=aapcs -marm -march=armv6 -mfpu=vfp -mfloat-abi=hard -Iwhd -D__DYNAMIC_REENT__ -c srce/zw_gpio.c
arm-none-eabi-gcc -O2 -mabi=aapcs -marm -march=armv6 -mfpu=vfp -mfloat-abi=hard -Iwhd -D__DYNAMIC_REENT__ -c srce/zw_ioctl.c
arm-none-eabi-gcc -O2 -mabi=aapcs -marm -march=armv6 -mfpu=vfp -mfloat-abi=hard -Iwhd -D__DYNAMIC_REENT__ -c srce/zw_gpio.c
arm-none-eabi-gcc -O2 -mabi=aapcs -marm -march=armv6 -mfpu=vfp -mfloat-abi=hard -Iwhd -D__DYNAMIC_REENT__ -c srce/zw_sdio.c
arm-none-eabi-gcc -O2 -mabi=aapcs -marm -march=armv6 -mfpu=vfp -mfloat-abi=hard -Iwhd -D__DYNAMIC_REENT__ -c srce/zjoin.c
arm-none-eabi-ar rcs libwifiscan.a zscan.o zw_gpio.o zw_ioctl.o zw_sdio.o 
arm-none-eabi-ar rcs libwifijoin.a zjoin.o zw_gpio.o zw_ioctl.o zw_sdio.o
cp libwifiscan.a paultest1/WifiTest1/
cp libwifijoin.a paultest1/WifiTest1/
