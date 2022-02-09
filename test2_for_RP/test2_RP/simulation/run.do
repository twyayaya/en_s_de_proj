quietly set ACTELLIBNAME PolarFire
quietly set PROJECT_DIR "C:/Users/Kai/Desktop/test2_RP"

if {[file exists postsynth/_info]} {
   echo "INFO: Simulation library postsynth already exists"
} else {
   file delete -force postsynth 
   vlib postsynth
}
vmap postsynth postsynth
vmap PolarFire "C:/Microsemi/Libero_SoC_v12.5/Designer/lib/modelsimpro/precompiled/vlog/PolarFire"

vlog -sv -mfcu -work postsynth "${PROJECT_DIR}/hdl/comb.v" "${PROJECT_DIR}/synthesis/test2.v"
vlog "+incdir+${PROJECT_DIR}/stimulus" -sv -mfcu -work postsynth "${PROJECT_DIR}/hdl/comb.v" "${PROJECT_DIR}/stimulus/test2_tb.v"

vsim -L PolarFire -L postsynth  -t 1ps -pli C:/Microsemi/Libero_SoC_v12.5/Designer/lib/modelsimpro/pli/pf_crypto_win_me_pli.dll postsynth.test2_tb
add wave /test2_tb/*
run 2000ns
