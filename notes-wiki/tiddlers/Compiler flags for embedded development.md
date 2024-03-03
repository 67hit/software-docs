## arm-none-eabi-gcc
See [gcc command options](https://gcc.gnu.org/onlinedocs/gcc/Invoking-GCC.html).

| switch                            |  meaning  |
|-----------------------------------|-----------|
| -mcpu=cortex-m4                   | CPU specification ([ARM specific](https://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html)) |
| -mthumb                           | Alternative: -marm ([ARM specific](https://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html))|
| -mfloat-abi=hard                  | Use hardware FPU. ([ARM specific](https://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html)) |
| -mfpu=fpv4-sp-d16                 | Specifies what floating-point hardware is available ([ARM specific](https://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html)) |
| -O3                               | [Optimization flag](https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html) |
| -ffunction-sections               | [Optimization flag](https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html) Also see [here](https://elinux.org/Function_sections) |
| -fdata-sections                   | [Optimization flag](https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html) Also see [here](https://elinux.org/Function_sections) |
| -fsingle-precision-constant       | Treat floating point constants as single precision.                 |
| -flto                             | Link time [optimization](https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html).  Needs to be specified for both compilation and linking. |
| -Wall                             | Long list of [warnings](https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html) combined into one. |
| -Wunused                          | implied by -Wall                                                    |
| -Wuninitialized                   | implied by -Wall                                                    |
| -Wconversion                      | implicit conversions that may alter the value                       |
| -Wshadow                          | local variable shadows another                                      |
| -Wfloat-equal                     | float values in equality comparison                                 |
| -D__FPU_USED=1                    | Same as #define __FPU_USED 1                                        |
| -DHSE_VALUE=8000000               | #define HSE_VALUE 8000000                                           |
| -DUSE_HAL_DRIVER                  | #define USE_HAL_DRIVER                                              |
| -DUSE_STM32F4_DISCO               | #define USE_STM32F4_DISCO                                           |
| -DSTM32F407xx                     | #define STM32F407xx                                                 |
| -I [include directories]          |                                                                     |
| -std=c11                          | [C dialect](https://gcc.gnu.org/onlinedocs/gcc/C-Dialect-Options.html) |
| -MMD                              | Output a rule for the dependencies of the main .c file ([Preprocessor](https://gcc.gnu.org/onlinedocs/gcc/Preprocessor-Options.html)) |
| -MP                               | Make generated dependencies phony targets, to work around some make issue. ([Preprocessor](https://gcc.gnu.org/onlinedocs/gcc/Preprocessor-Options.html))|
| -MF"$(@:%.o=%.d)"                 | File to write the dependencies.  (Derived from target name, see [here](make-configuration).)    |
| -MT"$@"                           | Change the name of the dependency [target](make-configuration), which would be the .c file by default |
| -c                                | Compile or assemble the source files, but do not link. ([Overall gcc options](https://gcc.gnu.org/onlinedocs/gcc/Overall-Options.html#Overall-Options))|
| -o "$@"                           | Name of output file. |
| "$<"                              | Input file (the first prerequisite) |

## linker flags
| switch                            |  meaning                           |
|-----------------------------------|------------------------------------|
| -lm                               | link with the math library         |
| -lz                               | link with zlib (compression)       |
| -lX                               | link with `libX` (general pattern) |