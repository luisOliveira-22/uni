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
-- Generated on "06/17/2021 23:58:16"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Mux
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Mux_vhd_vec_tst IS
END Mux_vhd_vec_tst;
ARCHITECTURE Mux_arch OF Mux_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL dataIn0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL dataIn1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL dataIn2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL dataIn3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL dataOut : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL sel0 : STD_LOGIC;
SIGNAL sel1 : STD_LOGIC;
COMPONENT Mux
	PORT (
	dataIn0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	dataIn1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	dataIn2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	dataIn3 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	dataOut : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	sel0 : IN STD_LOGIC;
	sel1 : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Mux
	PORT MAP (
-- list connections between master ports and signals
	dataIn0 => dataIn0,
	dataIn1 => dataIn1,
	dataIn2 => dataIn2,
	dataIn3 => dataIn3,
	dataOut => dataOut,
	sel0 => sel0,
	sel1 => sel1
	);
-- dataIn0[7]
t_prcs_dataIn0_7: PROCESS
BEGIN
	dataIn0(7) <= '0';
WAIT;
END PROCESS t_prcs_dataIn0_7;
-- dataIn0[6]
t_prcs_dataIn0_6: PROCESS
BEGIN
	dataIn0(6) <= '0';
WAIT;
END PROCESS t_prcs_dataIn0_6;
-- dataIn0[5]
t_prcs_dataIn0_5: PROCESS
BEGIN
	dataIn0(5) <= '0';
WAIT;
END PROCESS t_prcs_dataIn0_5;
-- dataIn0[4]
t_prcs_dataIn0_4: PROCESS
BEGIN
	dataIn0(4) <= '0';
WAIT;
END PROCESS t_prcs_dataIn0_4;
-- dataIn0[3]
t_prcs_dataIn0_3: PROCESS
BEGIN
	dataIn0(3) <= '0';
WAIT;
END PROCESS t_prcs_dataIn0_3;
-- dataIn0[2]
t_prcs_dataIn0_2: PROCESS
BEGIN
	dataIn0(2) <= '0';
WAIT;
END PROCESS t_prcs_dataIn0_2;
-- dataIn0[1]
t_prcs_dataIn0_1: PROCESS
BEGIN
	dataIn0(1) <= '0';
WAIT;
END PROCESS t_prcs_dataIn0_1;
-- dataIn0[0]
t_prcs_dataIn0_0: PROCESS
BEGIN
	dataIn0(0) <= '0';
WAIT;
END PROCESS t_prcs_dataIn0_0;
-- dataIn1[7]
t_prcs_dataIn1_7: PROCESS
BEGIN
	dataIn1(7) <= '1';
WAIT;
END PROCESS t_prcs_dataIn1_7;
-- dataIn1[6]
t_prcs_dataIn1_6: PROCESS
BEGIN
	dataIn1(6) <= '1';
WAIT;
END PROCESS t_prcs_dataIn1_6;
-- dataIn1[5]
t_prcs_dataIn1_5: PROCESS
BEGIN
	dataIn1(5) <= '1';
WAIT;
END PROCESS t_prcs_dataIn1_5;
-- dataIn1[4]
t_prcs_dataIn1_4: PROCESS
BEGIN
	dataIn1(4) <= '1';
WAIT;
END PROCESS t_prcs_dataIn1_4;
-- dataIn1[3]
t_prcs_dataIn1_3: PROCESS
BEGIN
	dataIn1(3) <= '0';
WAIT;
END PROCESS t_prcs_dataIn1_3;
-- dataIn1[2]
t_prcs_dataIn1_2: PROCESS
BEGIN
	dataIn1(2) <= '0';
WAIT;
END PROCESS t_prcs_dataIn1_2;
-- dataIn1[1]
t_prcs_dataIn1_1: PROCESS
BEGIN
	dataIn1(1) <= '0';
WAIT;
END PROCESS t_prcs_dataIn1_1;
-- dataIn1[0]
t_prcs_dataIn1_0: PROCESS
BEGIN
	dataIn1(0) <= '0';
WAIT;
END PROCESS t_prcs_dataIn1_0;
-- dataIn2[7]
t_prcs_dataIn2_7: PROCESS
BEGIN
	dataIn2(7) <= '0';
WAIT;
END PROCESS t_prcs_dataIn2_7;
-- dataIn2[6]
t_prcs_dataIn2_6: PROCESS
BEGIN
	dataIn2(6) <= '0';
WAIT;
END PROCESS t_prcs_dataIn2_6;
-- dataIn2[5]
t_prcs_dataIn2_5: PROCESS
BEGIN
	dataIn2(5) <= '0';
WAIT;
END PROCESS t_prcs_dataIn2_5;
-- dataIn2[4]
t_prcs_dataIn2_4: PROCESS
BEGIN
	dataIn2(4) <= '0';
WAIT;
END PROCESS t_prcs_dataIn2_4;
-- dataIn2[3]
t_prcs_dataIn2_3: PROCESS
BEGIN
	dataIn2(3) <= '1';
WAIT;
END PROCESS t_prcs_dataIn2_3;
-- dataIn2[2]
t_prcs_dataIn2_2: PROCESS
BEGIN
	dataIn2(2) <= '1';
WAIT;
END PROCESS t_prcs_dataIn2_2;
-- dataIn2[1]
t_prcs_dataIn2_1: PROCESS
BEGIN
	dataIn2(1) <= '1';
WAIT;
END PROCESS t_prcs_dataIn2_1;
-- dataIn2[0]
t_prcs_dataIn2_0: PROCESS
BEGIN
	dataIn2(0) <= '1';
WAIT;
END PROCESS t_prcs_dataIn2_0;
-- dataIn3[7]
t_prcs_dataIn3_7: PROCESS
BEGIN
	dataIn3(7) <= '1';
WAIT;
END PROCESS t_prcs_dataIn3_7;
-- dataIn3[6]
t_prcs_dataIn3_6: PROCESS
BEGIN
	dataIn3(6) <= '1';
WAIT;
END PROCESS t_prcs_dataIn3_6;
-- dataIn3[5]
t_prcs_dataIn3_5: PROCESS
BEGIN
	dataIn3(5) <= '1';
WAIT;
END PROCESS t_prcs_dataIn3_5;
-- dataIn3[4]
t_prcs_dataIn3_4: PROCESS
BEGIN
	dataIn3(4) <= '1';
WAIT;
END PROCESS t_prcs_dataIn3_4;
-- dataIn3[3]
t_prcs_dataIn3_3: PROCESS
BEGIN
	dataIn3(3) <= '1';
WAIT;
END PROCESS t_prcs_dataIn3_3;
-- dataIn3[2]
t_prcs_dataIn3_2: PROCESS
BEGIN
	dataIn3(2) <= '1';
WAIT;
END PROCESS t_prcs_dataIn3_2;
-- dataIn3[1]
t_prcs_dataIn3_1: PROCESS
BEGIN
	dataIn3(1) <= '1';
WAIT;
END PROCESS t_prcs_dataIn3_1;
-- dataIn3[0]
t_prcs_dataIn3_0: PROCESS
BEGIN
	dataIn3(0) <= '1';
WAIT;
END PROCESS t_prcs_dataIn3_0;

-- sel0
t_prcs_sel0: PROCESS
BEGIN
	sel0 <= '0';
	WAIT FOR 50000 ps;
	sel0 <= '1';
	WAIT FOR 100000 ps;
	sel0 <= '0';
	WAIT FOR 100000 ps;
	sel0 <= '1';
	WAIT FOR 120000 ps;
	sel0 <= '0';
	WAIT FOR 110000 ps;
	sel0 <= '1';
	WAIT FOR 70000 ps;
	sel0 <= '0';
	WAIT FOR 140000 ps;
	sel0 <= '1';
	WAIT FOR 290000 ps;
	sel0 <= '0';
WAIT;
END PROCESS t_prcs_sel0;

-- sel1
t_prcs_sel1: PROCESS
BEGIN
	sel1 <= '0';
	WAIT FOR 20000 ps;
	sel1 <= '1';
	WAIT FOR 50000 ps;
	sel1 <= '0';
	WAIT FOR 280000 ps;
	sel1 <= '1';
	WAIT FOR 40000 ps;
	sel1 <= '0';
	WAIT FOR 70000 ps;
	sel1 <= '1';
	WAIT FOR 110000 ps;
	sel1 <= '0';
	WAIT FOR 170000 ps;
	sel1 <= '1';
	WAIT FOR 160000 ps;
	sel1 <= '0';
WAIT;
END PROCESS t_prcs_sel1;
END Mux_arch;
