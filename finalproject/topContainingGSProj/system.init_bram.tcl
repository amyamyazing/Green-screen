cd /home/cc/cs150/sp13/class/cs150-at/finalproject
if { [ catch { xload xmp system.xmp } result ] } {
  exit 10
}

if { [catch {run init_bram} result] } {
  exit -1
}

exit 0
