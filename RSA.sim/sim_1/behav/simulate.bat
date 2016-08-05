@echo off
set xv_path=G:\\xilinx_vivado\\Vivado\\2016.2\\bin
call %xv_path%/xsim tb_main_behav -key {Behavioral:sim_1:Functional:tb_main} -tclbatch tb_main.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
