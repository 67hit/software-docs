## Toolchain

### To compile
Install:
```sh
$ apt install git gcc libusb-1.0-0 libusb-1.0-0-dev libc-dev gcc-arm-none-eabi gdb-multiarch openocd
```
*Note:* `gdb-multiarch` and `openodc` are for debugging.

### To load
To build the loader (`stlink`) this will be needed:
```
$ apt install cmake
```

Download and build the loader:
```sh
$ mkdir stlink
$ cd stlink
$ wget https://github.com/stlink-org/stlink/archive/refs/tags/v1.7.0.tar.gz
$ txvf v1.7.0.tar.gz
$ cd stlink-1.7.0
$ make
```

#### Additional loader setup
To allow a user in the group "users" to operate `st-info` and `st-flash`:

   1. List vendor/product id of USB device<br/>
      `$ lsusb -v | grep idVendor`<br/>
      `$ lsusb -v | grep idProduct`

   2. Create the file /etc/udev/rules.d/20-myrule.rule with the line:<br/>
      `SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="374b", GROUP="users", MODE="0666"`,<br/>
      where the appropriate vendor and product id is obtained from the lsusb info above

   3. `# adduser <username> users`<br/>
      in case the user is not yet in that group

   4. Reboot or use `udevadm` to reload the new device rules


