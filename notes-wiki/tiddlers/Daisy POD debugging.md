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
### VS Code launch.json configuration
```json
{
  "configurations": [
    {
      "name": "(gdb) Launch",
      "type": "cppdbg",
      "request": "launch",
      "program": "${workspaceRoot}/build/SimpleOscillator.elf",
      "MIMode": "gdb",
      "cwd": "${workspaceRoot}/build/",
      "targetArchitecture": "arm",
      "miDebuggerPath": "gdb-multiarch",
      "miDebuggerServerAddress": "127.0.0.1:3333",
      "stopAtEntry": true
    },
  ],
  "version": "0.2.0"
}
```
More info [here](https://github.com/microsoft/vscode-docs/blob/main/docs/cpp/launch-json-reference.md) (fromMicrosoft).