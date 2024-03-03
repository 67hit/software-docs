## Implicit variables and string replacement
* `$(:=)` performs a [string replacement](https://www.gnu.org/software/make/manual/html_node/Text-Functions.html).
* `$@` is [the name of the the target](https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html) (i.e. the file being generated).
* `$(@:%.o=%.d)` is the name of the file, with the .o extension changed to .d

## File lists
```make
SRC := $(wildcard ../source/*.c ../header/*.h)
```
### File names only without the directory
```make
FILES := $(notdir $(SRC))
```
### File names without the extension
```make
NOEXT := $(basename $(FILES))
```
