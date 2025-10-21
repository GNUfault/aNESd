AS   = ./asm6f/asm6f
EMU  = ./fceux/src/fceux
ROM  = PLACEHOLDER.nes
SRC  = PLACEHOLDER.asm

all: download-as download-emu compile-as configure-emu compile-emu assemble

download-as:
	git clone --depth=1 https://github.com/freem/asm6f.git

download-emu:
	git clone --depth=1 https://github.com/TASEmulators/fceux

compile-as:
	make -C asm6f

configure-emu:
	cd fceux && \
	cmake -DCMAKE_CXX_FLAGS="-D__STDC_CONSTANT_MACROS" .
	cd ..

compile-emu:
	make -j$(nproc) -C fceux

assemble:
	$(AS) $(SRC) $(ROM)

run:
	$(EMU) $(ROM)

clean:
	rm $(ROM)
