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
-- Generated on "06/18/2021 00:34:11"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          RegPulseGenerator
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY RegPulseGenerator_vhd_vec_tst IS
END RegPulseGenerator_vhd_vec_tst;
ARCHITECTURE RegPulseGenerator_arch OF RegPulseGenerator_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL DispClk : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL TimeClk : STD_LOGIC;
COMPONENT RegPulseGenerator
	PORT (
	clk : IN STD_LOGIC;
	DispClk : OUT STD_LOGIC;
	reset : IN STD_LOGIC;
	TimeClk : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : RegPulseGenerator
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	DispClk => DispClk,
	reset => reset,
	TimeClk => TimeClk
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
	FOR i IN 1 TO 12
	LOOP
		clk <= '0';
		WAIT FOR 40000 ps;
		clk <= '1';
		WAIT FOR 40000 ps;
	END LOOP;
	clk <= '0';
WAIT;
END PROCESS t_prcs_clk;

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '0';
	WAIT FOR 230000 ps;
	reset <= '1';
	WAIT FOR 130000 ps;
	reset <= '0';
WAIT;
END PROCESS t_prcs_reset;
END RegPulseGenerator_arch;
