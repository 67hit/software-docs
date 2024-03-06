## [openocd](https://openocd.org/)
This is what gdb will connect to. [Here](https://openocd.org/doc-release/html/About.html#What-is-OpenOCD_003f) is some general info.

A small section of the `make` file
```make
CHIPSET ?= stm32h7x

OCD ?= openocd
OCD_DIR ?= /usr/local/share/openocd/scripts
PGM_DEVICE ?= interface/stlink.cfg
OCDFLAGS = -f $(PGM_DEVICE) -f target/$(CHIPSET).cfg

openocd:
	$(OCD) -s $(OCD_DIR) $(OCDFLAGS)
```

## gdb