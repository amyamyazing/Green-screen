proc pnsynth {} {
  cd /home/cc/cs150/sp13/class/cs150-ar/finalproj/dram
  if { [ catch { xload xmp system.xmp } result ] } {
    exit 10
  }
  if { [catch {run netlist} result] } {
    return -1
  }
  return $result
}
if { [catch {pnsynth} result] } {
  exit -1
}
exit $result
