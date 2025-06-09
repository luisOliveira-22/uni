-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "06/18/2021 17:35:24"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Bin7SegDecoder
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Bin7SegDecoder_vhd_vec_tst IS
END Bin7SegDecoder_vhd_vec_tst;
ARCHITECTURE Bin7SegDecoder_arch OF Bin7SegDecoder_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL binInput : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL decOut_n : STD_LOGIC_VECTOR(6 DOWNTO 0);
COMPONENT Bin7SegDecoder
	PORT (
	binInput : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	decOut_n : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Bin7SegDecoder
	PORT MAP (
-- list connections between master ports and signals
	binInput => binInput,
	decOut_n => decOut_n
	);
-- binInput[3]
t_prcs_binInput_3: PROCESS
BEGIN
	binInput(3) <= '0';
	WAIT FOR 270000 ps;
	binInput(3) <= '1';
	WAIT FOR 360000 ps;
	binInput(3) <= '0';
WAIT;
END PROCESS t_prcs_binInput_3;
-- binInput[2]
t_prcs_binInput_2: PROCESS
BEGIN
	binInput(2) <= '0';
	WAIT FOR 110000 ps;
	binInput(2) <= '1';
	WAIT FOR 160000 ps;
	binInput(2) <= '0';
	WAIT FOR 170000 ps;
	binInput(2) <= '1';
	WAIT FOR 190000 ps;
	binInput(2) <= '0';
WAIT;
END PROCESS t_prcs_binInput_2;
-- binInput[1]
t_prcs_binInput_1: PROCESS
BEGIN
	binInput(1) <= '0';
	WAIT FOR 40000 ps;
	binInput(1) <= '1';
	WAIT FOR 70000 ps;
	binInput(1) <= '0';
	WAIT FOR 80000 ps;
	binInput(1) <= '1';
	WAIT FOR 80000 ps;
	binInput(1) <= '0';
	WAIT FOR 90000 ps;
	binInput(1) <= '1';
	WAIT FOR 80000 ps;
	binInput(1) <= '0';
	WAIT FOR 90000 ps;
	binInput(1) <= '1';
	WAIT FOR 100000 ps;
	binInput(1) <= '0';
WAIT;
END PROCESS t_prcs_binInput_1;
-- binInput[0]
t_prcs_binInput_0: PROCESS
BEGIN
	binInput(0) <= '1';
	WAIT FOR 40000 ps;
	binInput(0) <= '0';
	WAIT FOR 40000 ps;
	binInput(0) <= '1';
	WAIT FOR 30000 ps;
	binInput(0) <= '0';
	WAIT FOR 40000 ps;
	binInput(0) <= '1';
	WAIT FOR 40000 ps;
	binInput(0) <= '0';
	WAIT FOR 40000 ps;
	binInput(0) <= '1';
	WAIT FOR 40000 ps;
	binInput(0) <= '0';
	WAIT FOR 50000 ps;
	binInput(0) <= '1';
	WAIT FOR 40000 ps;
	binInput(0) <= '0';
	WAIT FOR 40000 ps;
	binInput(0) <= '1';
	WAIT FOR 40000 ps;
	binInput(0) <= '0';
	WAIT FOR 40000 ps;
	binInput(0) <= '1';
	WAIT FOR 50000 ps;
	binInput(0) <= '0';
	WAIT FOR 40000 ps;
	binInput(0) <= '1';
	WAIT FOR 60000 ps;
	binInput(0) <= '0';
WAIT;
END PROCESS t_prcs_binInput_0;
END Bin7SegDecoder_arch;
