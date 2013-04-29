cd /home/cc/cs150/sp13/class/cs150-ar/finalproj/dram/
if { [ catch { xload xmp system.xmp } result ] } {
  exit 10
}
xset hdl verilog
run stubgen
exit 0
