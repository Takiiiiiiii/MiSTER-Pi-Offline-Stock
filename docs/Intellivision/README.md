
# Intv_MiSTer

Mattel Intellivision

This core needs copies of original ROMs in the Intellivision folder


**Either use boot0..3.rom files**

Name      | Original   | Content
----------|------------|--------------------
boot0.rom | exec.bin   | System ROM (8kB)
boot1.rom | grom.bin   | Character generator ROM (2kB)
boot2.rom | sp0256-012.bin | Intellivoice ROM (2kB)
boot3.rom | ecs.bin    | ECS extension ROM (24kB)


**Or merge all 4 ROMs into a single boot.rom file**
```
cp exec.bin boot.rom
cat grom.bin >>boot.rom
cat sp0256-012.bin >>boot.rom
cat ecs.bin >>boot.rom
```
