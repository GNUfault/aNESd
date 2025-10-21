# aNESd

A 5 step NES rom dissasembler script

1. Install dependencies (e.g., `git`, GNU toolchain.)
2. Download aNESd
3. Make `roms` dir
4. Put rom in `roms`
5. Run aNESd

## Downloading and using aNESd
### Dependencies
You will need to install some dependencies:
- `git`
- GNU toolchain (e.g., `gcc`, `binutils`.)
- `bash` (you should already have this)
- And standard UNIX utilities (you have this)
### Cloning
Download aNESd:
```
git clone --depth=1 https://github.com/GNUfault/aNESd.git && cd aNESd
```
### Make `roms` folder
```
mkdir roms
```
### Adding rom(s)
You will just need to put the `.nes` file(s) in the newly made roms folder
### Running
```
./anesd.sh
```
### Disassembled rom(s)
The source code of the rom(s) now should be in `src`
