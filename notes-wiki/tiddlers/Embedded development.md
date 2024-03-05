## System View Description (SVD)
The CMSIS System View Description format(CMSIS-SVD) **formalizes the description of** the system contained in Arm Cortex-M processor-based microcontrollers, in particular, the **memory mapped registers of peripherals**. The detail contained in system view descriptions is comparable to the data in device reference manuals. The information ranges from high level functional descriptions of a peripheral all the way down to the definition and purpose of an individual bit field in a memory mapped register. *(Taken from [here](https://www.keil.com/pack/doc/CMSIS/SVD/html/index.html).)*

This can be used for automatic generation of code, e.g. [embedded rust](https://github.com/rust-embedded/svd2rust).

## Languages
* https://tinygo.org/
* https://github.com/rust-embedded
  * https://docs.rust-embedded.org/book/