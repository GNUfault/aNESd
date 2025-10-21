#!/bin/bash
set -e
echo "Welcome to aNESd!"
if [ ! -d "tmp/nes-disasm6/.git" ]; then
mkdir -p tmp/nes-disasm6
git clone --depth=1 https://github.com/mcgrew/nes-disasm6.git tmp/nes-disasm6
fi
for rom in roms/*.nes; do
name=$(basename "$rom" .nes)
echo -n "Disassembling $name.nes... "
mkdir -p "src/$name"
mkdir -p "tmp/$name"
cd "tmp/$name"
../../tmp/nes-disasm6/disasm.py "../../$rom" > /dev/null 2>&1
sed -i '/^[[:space:]]*\.\(include\|incbin\)/d' "$name.asm"
for f in bank*.asm; do
cat "$f"
echo -e "\n"
done >> "$name.asm"
echo ".incbin chr_rom.bin" | tee -a "$name.asm" > /dev/null 2>&1
mv "$name.asm" "../../src/$name/"
mv "chr_rom.bin" "../../src/$name/"
cp ../../data/Makefile "../../src/$name/"
sed -i "s/PLACEHOLDER/${name}/g" "../../src/$name/Makefile"
cd ../..
echo "Done!"
done
