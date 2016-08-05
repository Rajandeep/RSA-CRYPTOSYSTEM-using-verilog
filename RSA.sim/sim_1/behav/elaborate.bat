@echo off
set xv_path=G:\\xilinx_vivado\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto cfd6a0fdc80e41e2bc5f7cabcb165e64 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot tb_main_behav xil_defaultlib.tb_main xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
