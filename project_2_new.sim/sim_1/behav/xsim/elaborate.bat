@echo off
REM ****************************************************************************
REM Vivado (TM) v2018.2 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Sun Sep 29 18:15:48 +0300 2024
REM SW Build 2258646 on Thu Jun 14 20:03:12 MDT 2018
REM
REM Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
call xelab  -wto 14eaf648cb1343b0b10e5fa219744865 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot SUDCWORAM3SO_SN74LS697_testbench_v1_behav xil_defaultlib.SUDCWORAM3SO_SN74LS697_testbench_v1 -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
