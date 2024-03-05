## openocd
This is what gdb will connect to.

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