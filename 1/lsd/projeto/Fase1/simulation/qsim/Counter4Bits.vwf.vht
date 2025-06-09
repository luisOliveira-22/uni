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
-- Generated on "06/18/2021 02:04:04"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Counter4Bits
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Counter4Bits_vhd_vec_tst IS
END Counter4Bits_vhd_vec_tst;
ARCHITECTURE Counter4Bits_arch OF Counter4Bits_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL enable1 : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL termCnt : STD_LOGIC;
SIGNAL valOut : STD_LOGIC_VECTOR(3 DOWNTO 0);
COMPONENT Counter4Bits
	PORT (
	clk : IN STD_LOGIC;
	enable1 : IN STD_LOGIC;
	reset : IN STD_LOGIC;
	termCnt : OUT STD_LOGIC;
	valOut : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Counter4Bits
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	enable1 => enable1,
	reset => reset,
	termCnt => termCnt,
	valOut => valOut
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
	FOR i IN 1 TO 16
	LOOP
		clk <= '0';
		WAIT FOR 30000 ps;
		clk <= '1';
		WAIT FOR 30000 ps;
	END LOOP;
	clk <= '0';
	WAIT FOR 30000 ps;
	clk <= '1';
WAIT;
END PROCESS t_prcs_clk;

-- enable1
t_prcs_enable1: PROCESS
BEGIN
	enable1 <= '1';
WAIT;
END PROCESS t_prcs_enable1;

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '0';
WAIT;
END PROCESS t_prcs_reset;
END Counter4Bits_arch;
