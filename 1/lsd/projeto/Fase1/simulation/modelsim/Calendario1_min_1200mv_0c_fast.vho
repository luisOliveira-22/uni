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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 17.1.0 Build 590 10/25/2017 SJ Lite Edition"

-- DATE "06/19/2021 00:23:47"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_P28,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	MeuCalendario IS
    PORT (
	SW : IN std_logic_vector(0 DOWNTO 0);
	CLOCK_50 : IN std_logic;
	KEY : IN std_logic_vector(2 DOWNTO 0);
	HEX0 : OUT std_logic_vector(6 DOWNTO 0);
	HEX1 : OUT std_logic_vector(6 DOWNTO 0);
	HEX2 : OUT std_logic_vector(6 DOWNTO 0);
	HEX3 : OUT std_logic_vector(6 DOWNTO 0);
	HEX4 : OUT std_logic_vector(6 DOWNTO 0);
	HEX5 : OUT std_logic_vector(6 DOWNTO 0);
	HEX6 : OUT std_logic_vector(6 DOWNTO 0);
	HEX7 : OUT std_logic_vector(6 DOWNTO 0);
	LEDG : OUT std_logic_vector(8 DOWNTO 0);
	LEDR : OUT std_logic_vector(17 DOWNTO 0)
	);
END MeuCalendario;

-- Design Ports Information
-- KEY[0]	=>  Location: PIN_M23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[1]	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[2]	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[0]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[1]	=>  Location: PIN_F22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[2]	=>  Location: PIN_E17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[3]	=>  Location: PIN_L26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[4]	=>  Location: PIN_L25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[5]	=>  Location: PIN_J22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[6]	=>  Location: PIN_H22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[0]	=>  Location: PIN_M24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[1]	=>  Location: PIN_Y22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[2]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[3]	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[4]	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[5]	=>  Location: PIN_U23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[6]	=>  Location: PIN_U24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[0]	=>  Location: PIN_AA25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[1]	=>  Location: PIN_AA26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[2]	=>  Location: PIN_Y25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[3]	=>  Location: PIN_W26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[4]	=>  Location: PIN_Y26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[5]	=>  Location: PIN_W27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[6]	=>  Location: PIN_W28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[0]	=>  Location: PIN_V21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[1]	=>  Location: PIN_U21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[2]	=>  Location: PIN_AB20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[3]	=>  Location: PIN_AA21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[4]	=>  Location: PIN_AD24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[5]	=>  Location: PIN_AF23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[6]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[0]	=>  Location: PIN_AB19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[1]	=>  Location: PIN_AA19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[2]	=>  Location: PIN_AG21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[3]	=>  Location: PIN_AH21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[4]	=>  Location: PIN_AE19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[5]	=>  Location: PIN_AF19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[6]	=>  Location: PIN_AE18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[0]	=>  Location: PIN_AD18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[1]	=>  Location: PIN_AC18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[2]	=>  Location: PIN_AB18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[3]	=>  Location: PIN_AH19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[4]	=>  Location: PIN_AG19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[5]	=>  Location: PIN_AF18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[6]	=>  Location: PIN_AH18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[0]	=>  Location: PIN_AA17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[1]	=>  Location: PIN_AB16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[2]	=>  Location: PIN_AA16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[3]	=>  Location: PIN_AB17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[4]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[5]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[6]	=>  Location: PIN_AC17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX7[0]	=>  Location: PIN_AD17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX7[1]	=>  Location: PIN_AE17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX7[2]	=>  Location: PIN_AG17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX7[3]	=>  Location: PIN_AH17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX7[4]	=>  Location: PIN_AF17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX7[5]	=>  Location: PIN_AG18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX7[6]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[0]	=>  Location: PIN_E21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[1]	=>  Location: PIN_E22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[2]	=>  Location: PIN_E25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[3]	=>  Location: PIN_E24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[4]	=>  Location: PIN_H21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[5]	=>  Location: PIN_G20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[6]	=>  Location: PIN_G22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[7]	=>  Location: PIN_G21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[8]	=>  Location: PIN_F17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[0]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[1]	=>  Location: PIN_F19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[2]	=>  Location: PIN_E19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[3]	=>  Location: PIN_F21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[4]	=>  Location: PIN_F18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[5]	=>  Location: PIN_E18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[6]	=>  Location: PIN_J19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[7]	=>  Location: PIN_H19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[8]	=>  Location: PIN_J17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[9]	=>  Location: PIN_G17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[10]	=>  Location: PIN_J15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[11]	=>  Location: PIN_H16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[12]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[13]	=>  Location: PIN_H17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[14]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[15]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[16]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[17]	=>  Location: PIN_H15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF MeuCalendario IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_SW : std_logic_vector(0 DOWNTO 0);
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_KEY : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_HEX0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX2 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX3 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX4 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX5 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX6 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX7 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_LEDG : std_logic_vector(8 DOWNTO 0);
SIGNAL ww_LEDR : std_logic_vector(17 DOWNTO 0);
SIGNAL \CLOCK_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \KEY[1]~input_o\ : std_logic;
SIGNAL \KEY[2]~input_o\ : std_logic;
SIGNAL \HEX0[0]~output_o\ : std_logic;
SIGNAL \HEX0[1]~output_o\ : std_logic;
SIGNAL \HEX0[2]~output_o\ : std_logic;
SIGNAL \HEX0[3]~output_o\ : std_logic;
SIGNAL \HEX0[4]~output_o\ : std_logic;
SIGNAL \HEX0[5]~output_o\ : std_logic;
SIGNAL \HEX0[6]~output_o\ : std_logic;
SIGNAL \HEX1[0]~output_o\ : std_logic;
SIGNAL \HEX1[1]~output_o\ : std_logic;
SIGNAL \HEX1[2]~output_o\ : std_logic;
SIGNAL \HEX1[3]~output_o\ : std_logic;
SIGNAL \HEX1[4]~output_o\ : std_logic;
SIGNAL \HEX1[5]~output_o\ : std_logic;
SIGNAL \HEX1[6]~output_o\ : std_logic;
SIGNAL \HEX2[0]~output_o\ : std_logic;
SIGNAL \HEX2[1]~output_o\ : std_logic;
SIGNAL \HEX2[2]~output_o\ : std_logic;
SIGNAL \HEX2[3]~output_o\ : std_logic;
SIGNAL \HEX2[4]~output_o\ : std_logic;
SIGNAL \HEX2[5]~output_o\ : std_logic;
SIGNAL \HEX2[6]~output_o\ : std_logic;
SIGNAL \HEX3[0]~output_o\ : std_logic;
SIGNAL \HEX3[1]~output_o\ : std_logic;
SIGNAL \HEX3[2]~output_o\ : std_logic;
SIGNAL \HEX3[3]~output_o\ : std_logic;
SIGNAL \HEX3[4]~output_o\ : std_logic;
SIGNAL \HEX3[5]~output_o\ : std_logic;
SIGNAL \HEX3[6]~output_o\ : std_logic;
SIGNAL \HEX4[0]~output_o\ : std_logic;
SIGNAL \HEX4[1]~output_o\ : std_logic;
SIGNAL \HEX4[2]~output_o\ : std_logic;
SIGNAL \HEX4[3]~output_o\ : std_logic;
SIGNAL \HEX4[4]~output_o\ : std_logic;
SIGNAL \HEX4[5]~output_o\ : std_logic;
SIGNAL \HEX4[6]~output_o\ : std_logic;
SIGNAL \HEX5[0]~output_o\ : std_logic;
SIGNAL \HEX5[1]~output_o\ : std_logic;
SIGNAL \HEX5[2]~output_o\ : std_logic;
SIGNAL \HEX5[3]~output_o\ : std_logic;
SIGNAL \HEX5[4]~output_o\ : std_logic;
SIGNAL \HEX5[5]~output_o\ : std_logic;
SIGNAL \HEX5[6]~output_o\ : std_logic;
SIGNAL \HEX6[0]~output_o\ : std_logic;
SIGNAL \HEX6[1]~output_o\ : std_logic;
SIGNAL \HEX6[2]~output_o\ : std_logic;
SIGNAL \HEX6[3]~output_o\ : std_logic;
SIGNAL \HEX6[4]~output_o\ : std_logic;
SIGNAL \HEX6[5]~output_o\ : std_logic;
SIGNAL \HEX6[6]~output_o\ : std_logic;
SIGNAL \HEX7[0]~output_o\ : std_logic;
SIGNAL \HEX7[1]~output_o\ : std_logic;
SIGNAL \HEX7[2]~output_o\ : std_logic;
SIGNAL \HEX7[3]~output_o\ : std_logic;
SIGNAL \HEX7[4]~output_o\ : std_logic;
SIGNAL \HEX7[5]~output_o\ : std_logic;
SIGNAL \HEX7[6]~output_o\ : std_logic;
SIGNAL \LEDG[0]~output_o\ : std_logic;
SIGNAL \LEDG[1]~output_o\ : std_logic;
SIGNAL \LEDG[2]~output_o\ : std_logic;
SIGNAL \LEDG[3]~output_o\ : std_logic;
SIGNAL \LEDG[4]~output_o\ : std_logic;
SIGNAL \LEDG[5]~output_o\ : std_logic;
SIGNAL \LEDG[6]~output_o\ : std_logic;
SIGNAL \LEDG[7]~output_o\ : std_logic;
SIGNAL \LEDG[8]~output_o\ : std_logic;
SIGNAL \LEDR[0]~output_o\ : std_logic;
SIGNAL \LEDR[1]~output_o\ : std_logic;
SIGNAL \LEDR[2]~output_o\ : std_logic;
SIGNAL \LEDR[3]~output_o\ : std_logic;
SIGNAL \LEDR[4]~output_o\ : std_logic;
SIGNAL \LEDR[5]~output_o\ : std_logic;
SIGNAL \LEDR[6]~output_o\ : std_logic;
SIGNAL \LEDR[7]~output_o\ : std_logic;
SIGNAL \LEDR[8]~output_o\ : std_logic;
SIGNAL \LEDR[9]~output_o\ : std_logic;
SIGNAL \LEDR[10]~output_o\ : std_logic;
SIGNAL \LEDR[11]~output_o\ : std_logic;
SIGNAL \LEDR[12]~output_o\ : std_logic;
SIGNAL \LEDR[13]~output_o\ : std_logic;
SIGNAL \LEDR[14]~output_o\ : std_logic;
SIGNAL \LEDR[15]~output_o\ : std_logic;
SIGNAL \LEDR[16]~output_o\ : std_logic;
SIGNAL \LEDR[17]~output_o\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \DispCntrl|Present_state.idle~0_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[0]~31_combout\ : std_logic;
SIGNAL \RegPulseGenerator|LessThan1~0_combout\ : std_logic;
SIGNAL \RegPulseGenerator|LessThan1~1_combout\ : std_logic;
SIGNAL \RegPulseGenerator|LessThan1~2_combout\ : std_logic;
SIGNAL \RegPulseGenerator|Equal1~5_combout\ : std_logic;
SIGNAL \RegPulseGenerator|LessThan1~3_combout\ : std_logic;
SIGNAL \RegPulseGenerator|count_proc2~0_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[0]~32\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[1]~33_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[1]~34\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[2]~35_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[2]~36\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[3]~37_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[3]~38\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[4]~39_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[4]~40\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[5]~41_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[5]~42\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[6]~43_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[6]~44\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[7]~45_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[7]~46\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[8]~47_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[8]~48\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[9]~49_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[9]~50\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[10]~51_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[10]~52\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[11]~53_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[11]~54\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[12]~55_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[12]~56\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[13]~57_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[13]~58\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[14]~59_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[14]~60\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[15]~61_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[15]~62\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[16]~63_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[16]~64\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[17]~65_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[17]~66\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[18]~67_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[18]~68\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[19]~69_combout\ : std_logic;
SIGNAL \RegPulseGenerator|Equal1~0_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[19]~70\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[20]~71_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[20]~72\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[21]~73_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[21]~74\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[22]~75_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[22]~76\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[23]~77_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[23]~78\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[24]~79_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[24]~80\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[25]~81_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[25]~82\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[26]~83_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[26]~84\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[27]~85_combout\ : std_logic;
SIGNAL \RegPulseGenerator|Equal1~2_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[27]~86\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[28]~87_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[28]~88\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[29]~89_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[29]~90\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter2[30]~91_combout\ : std_logic;
SIGNAL \RegPulseGenerator|Equal1~3_combout\ : std_logic;
SIGNAL \RegPulseGenerator|Equal1~1_combout\ : std_logic;
SIGNAL \RegPulseGenerator|Equal1~4_combout\ : std_logic;
SIGNAL \RegPulseGenerator|Equal1~8_combout\ : std_logic;
SIGNAL \RegPulseGenerator|Equal1~7_combout\ : std_logic;
SIGNAL \RegPulseGenerator|Equal1~6_combout\ : std_logic;
SIGNAL \RegPulseGenerator|Equal1~9_combout\ : std_logic;
SIGNAL \DispCntrl|Present_state~21_combout\ : std_logic;
SIGNAL \DispCntrl|Present_state.idle~q\ : std_logic;
SIGNAL \DispCntrl|Present_state~25_combout\ : std_logic;
SIGNAL \DispCntrl|Present_state.s3~q\ : std_logic;
SIGNAL \DispCntrl|Present_state~20_combout\ : std_logic;
SIGNAL \DispCntrl|Present_state.s4~q\ : std_logic;
SIGNAL \DispCntrl|Present_state~27_combout\ : std_logic;
SIGNAL \DispCntrl|Present_state.s5~q\ : std_logic;
SIGNAL \DispCntrl|Present_state~24_combout\ : std_logic;
SIGNAL \DispCntrl|Present_state.s6~q\ : std_logic;
SIGNAL \DispCntrl|Present_state~26_combout\ : std_logic;
SIGNAL \DispCntrl|Present_state.s7~q\ : std_logic;
SIGNAL \DispCntrl|Present_state~22_combout\ : std_logic;
SIGNAL \DispCntrl|Present_state.s8~q\ : std_logic;
SIGNAL \DispCntrl|Nstate.s1~combout\ : std_logic;
SIGNAL \DispCntrl|Present_state.s1~q\ : std_logic;
SIGNAL \DispCntrl|Present_state~23_combout\ : std_logic;
SIGNAL \DispCntrl|Present_state.s2~q\ : std_logic;
SIGNAL \DispCntrl|WideOr2~0_combout\ : std_logic;
SIGNAL \CounterDosAnos2|s_value~4_combout\ : std_logic;
SIGNAL \CounterDosAnos1|s_value~4_combout\ : std_logic;
SIGNAL \DiasDoMes|s_value[31]~feeder_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[0]~31_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[6]~44\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[7]~45_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[7]~46\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[8]~47_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[8]~48\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[9]~49_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[9]~50\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[10]~51_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[10]~52\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[11]~53_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[11]~54\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[12]~55_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[12]~56\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[13]~57_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[13]~58\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[14]~59_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[14]~60\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[15]~61_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[15]~62\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[16]~63_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[16]~64\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[17]~65_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[17]~66\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[18]~67_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[18]~68\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[19]~69_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[19]~70\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[20]~71_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[20]~72\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[21]~73_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[21]~74\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[22]~75_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[22]~76\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[23]~77_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[23]~78\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[24]~79_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[24]~80\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[25]~81_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[25]~82\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[26]~83_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[26]~84\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[27]~85_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[27]~86\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[28]~87_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[28]~88\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[29]~89_combout\ : std_logic;
SIGNAL \RegPulseGenerator|Equal0~1_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[29]~90\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[30]~91_combout\ : std_logic;
SIGNAL \RegPulseGenerator|count_proc~5_combout\ : std_logic;
SIGNAL \RegPulseGenerator|count_proc~6_combout\ : std_logic;
SIGNAL \RegPulseGenerator|count_proc~1_combout\ : std_logic;
SIGNAL \RegPulseGenerator|count_proc~2_combout\ : std_logic;
SIGNAL \RegPulseGenerator|count_proc~0_combout\ : std_logic;
SIGNAL \RegPulseGenerator|Equal0~0_combout\ : std_logic;
SIGNAL \RegPulseGenerator|count_proc~3_combout\ : std_logic;
SIGNAL \RegPulseGenerator|count_proc~4_combout\ : std_logic;
SIGNAL \RegPulseGenerator|count_proc~7_combout\ : std_logic;
SIGNAL \RegPulseGenerator|count_proc~8_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[0]~32\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[1]~33_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[1]~34\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[2]~35_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[2]~36\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[3]~37_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[3]~38\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[4]~39_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[4]~40\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[5]~41_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[5]~42\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter[6]~43_combout\ : std_logic;
SIGNAL \RegPulseGenerator|Equal0~4_combout\ : std_logic;
SIGNAL \RegPulseGenerator|Equal0~6_combout\ : std_logic;
SIGNAL \RegPulseGenerator|Equal0~5_combout\ : std_logic;
SIGNAL \RegPulseGenerator|Equal0~3_combout\ : std_logic;
SIGNAL \RegPulseGenerator|Equal0~7_combout\ : std_logic;
SIGNAL \RegPulseGenerator|Equal0~8_combout\ : std_logic;
SIGNAL \RegPulseGenerator|Equal0~2_combout\ : std_logic;
SIGNAL \RegPulseGenerator|Equal0~9_combout\ : std_logic;
SIGNAL \CounterDosMeses|s_value~0_combout\ : std_logic;
SIGNAL \CounterDosMeses|Add0~0_combout\ : std_logic;
SIGNAL \CounterDosMeses|s_value~8_combout\ : std_logic;
SIGNAL \CounterDosMeses|Add0~1\ : std_logic;
SIGNAL \CounterDosMeses|Add0~2_combout\ : std_logic;
SIGNAL \CounterDosMeses|Add0~9\ : std_logic;
SIGNAL \CounterDosMeses|Add0~10_combout\ : std_logic;
SIGNAL \CounterDosMeses|s_value~9_combout\ : std_logic;
SIGNAL \CounterDosMeses|s_value[5]~4_combout\ : std_logic;
SIGNAL \CounterDosMeses|s_value[5]~1_combout\ : std_logic;
SIGNAL \CounterDosMeses|s_value[5]~2_combout\ : std_logic;
SIGNAL \CounterDosMeses|s_value~3_combout\ : std_logic;
SIGNAL \CounterDosMeses|Add0~3\ : std_logic;
SIGNAL \CounterDosMeses|Add0~4_combout\ : std_logic;
SIGNAL \CounterDosMeses|s_value~7_combout\ : std_logic;
SIGNAL \CounterDosMeses|Add0~5\ : std_logic;
SIGNAL \CounterDosMeses|Add0~6_combout\ : std_logic;
SIGNAL \CounterDosMeses|s_value~6_combout\ : std_logic;
SIGNAL \CounterDosMeses|Add0~7\ : std_logic;
SIGNAL \CounterDosMeses|Add0~8_combout\ : std_logic;
SIGNAL \CounterDosMeses|s_value~5_combout\ : std_logic;
SIGNAL \DiasDoMes|s_value[1]~feeder_combout\ : std_logic;
SIGNAL \DiasDoMes|process_0~0_combout\ : std_logic;
SIGNAL \DiasDoMes|process_0~1_combout\ : std_logic;
SIGNAL \DiasDoMes|valOut~0_combout\ : std_logic;
SIGNAL \DiasDoMes|valOut~1_combout\ : std_logic;
SIGNAL \CounterDosDias|Add0~0_combout\ : std_logic;
SIGNAL \CounterDosDias|s_value~5_combout\ : std_logic;
SIGNAL \CounterDosDias|s_value~6_combout\ : std_logic;
SIGNAL \CounterDosDias|Add0~1\ : std_logic;
SIGNAL \CounterDosDias|Add0~2_combout\ : std_logic;
SIGNAL \CounterDosDias|s_value~0_combout\ : std_logic;
SIGNAL \CounterDosDias|s_value[1]~1_combout\ : std_logic;
SIGNAL \CounterDosDias|Equal0~1_combout\ : std_logic;
SIGNAL \CounterDosDias|Add0~3\ : std_logic;
SIGNAL \CounterDosDias|Add0~4_combout\ : std_logic;
SIGNAL \CounterDosDias|s_value~4_combout\ : std_logic;
SIGNAL \CounterDosDias|Add0~5\ : std_logic;
SIGNAL \CounterDosDias|Add0~7\ : std_logic;
SIGNAL \CounterDosDias|Add0~8_combout\ : std_logic;
SIGNAL \CounterDosDias|s_value~2_combout\ : std_logic;
SIGNAL \CounterDosDias|Add0~9\ : std_logic;
SIGNAL \CounterDosDias|Add0~10_combout\ : std_logic;
SIGNAL \CounterDosDias|s_value~7_combout\ : std_logic;
SIGNAL \CounterDosDias|Equal0~0_combout\ : std_logic;
SIGNAL \CounterDosDias|Add0~6_combout\ : std_logic;
SIGNAL \CounterDosDias|s_value~3_combout\ : std_logic;
SIGNAL \CounterDosDias|termCnt~1_combout\ : std_logic;
SIGNAL \CounterDosDias|termCnt~0_combout\ : std_logic;
SIGNAL \CounterDosDias|termCnt~2_combout\ : std_logic;
SIGNAL \CounterDosDias|termCnt~q\ : std_logic;
SIGNAL \CounterDosMeses|termCnt~0_combout\ : std_logic;
SIGNAL \CounterDosMeses|termCnt~1_combout\ : std_logic;
SIGNAL \CounterDosMeses|termCnt~q\ : std_logic;
SIGNAL \CounterDosAnos1|s_value[3]~1_combout\ : std_logic;
SIGNAL \CounterDosAnos1|s_value~0_combout\ : std_logic;
SIGNAL \CounterDosAnos1|Add0~1_combout\ : std_logic;
SIGNAL \CounterDosAnos1|s_value~3_combout\ : std_logic;
SIGNAL \CounterDosAnos1|Add0~0_combout\ : std_logic;
SIGNAL \CounterDosAnos1|s_value~2_combout\ : std_logic;
SIGNAL \CounterDosAnos1|termCnt~0_combout\ : std_logic;
SIGNAL \CounterDosAnos1|termCnt~1_combout\ : std_logic;
SIGNAL \CounterDosAnos1|termCnt~q\ : std_logic;
SIGNAL \CounterDosAnos2|s_value[3]~1_combout\ : std_logic;
SIGNAL \CounterDosAnos2|Add0~0_combout\ : std_logic;
SIGNAL \CounterDosAnos2|s_value~2_combout\ : std_logic;
SIGNAL \CounterDosAnos2|termCnt~0_combout\ : std_logic;
SIGNAL \CounterDosAnos2|s_value~0_combout\ : std_logic;
SIGNAL \CounterDosAnos2|Add0~1_combout\ : std_logic;
SIGNAL \CounterDosAnos2|s_value~3_combout\ : std_logic;
SIGNAL \CounterDosAnos3|s_value~5_combout\ : std_logic;
SIGNAL \CounterDosAnos2|termCnt~1_combout\ : std_logic;
SIGNAL \CounterDosAnos2|termCnt~q\ : std_logic;
SIGNAL \CounterDosAnos3|s_value[3]~1_combout\ : std_logic;
SIGNAL \CounterDosAnos3|s_value[3]~2_combout\ : std_logic;
SIGNAL \CounterDosAnos3|Add0~0_combout\ : std_logic;
SIGNAL \CounterDosAnos3|s_value~3_combout\ : std_logic;
SIGNAL \CounterDosAnos3|termCnt~0_combout\ : std_logic;
SIGNAL \CounterDosAnos3|s_value~0_combout\ : std_logic;
SIGNAL \CounterDosAnos3|Add0~1_combout\ : std_logic;
SIGNAL \CounterDosAnos3|s_value~4_combout\ : std_logic;
SIGNAL \DispCntrl|WideOr1~0_combout\ : std_logic;
SIGNAL \Mux|Mux1~0_combout\ : std_logic;
SIGNAL \CounterDosAnos4|s_value~5_combout\ : std_logic;
SIGNAL \CounterDosAnos3|termCnt~1_combout\ : std_logic;
SIGNAL \CounterDosAnos3|termCnt~q\ : std_logic;
SIGNAL \CounterDosAnos4|s_value[0]~2_combout\ : std_logic;
SIGNAL \CounterDosAnos4|s_value~1_combout\ : std_logic;
SIGNAL \CounterDosAnos4|Add0~0_combout\ : std_logic;
SIGNAL \CounterDosAnos4|s_value~3_combout\ : std_logic;
SIGNAL \CounterDosAnos4|s_value[0]~0_combout\ : std_logic;
SIGNAL \CounterDosAnos4|Add0~1_combout\ : std_logic;
SIGNAL \CounterDosAnos4|s_value~4_combout\ : std_logic;
SIGNAL \Mux|Mux1~1_combout\ : std_logic;
SIGNAL \DispCntrl|WideOr0~0_combout\ : std_logic;
SIGNAL \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[16]~7_combout\ : std_logic;
SIGNAL \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[16]~6_combout\ : std_logic;
SIGNAL \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ : std_logic;
SIGNAL \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[15]~1_combout\ : std_logic;
SIGNAL \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[18]~2_combout\ : std_logic;
SIGNAL \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[18]~3_combout\ : std_logic;
SIGNAL \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[17]~4_combout\ : std_logic;
SIGNAL \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[17]~5_combout\ : std_logic;
SIGNAL \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ : std_logic;
SIGNAL \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[22]~9_combout\ : std_logic;
SIGNAL \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[16]~6_combout\ : std_logic;
SIGNAL \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[16]~7_combout\ : std_logic;
SIGNAL \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[15]~1_combout\ : std_logic;
SIGNAL \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ : std_logic;
SIGNAL \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[18]~2_combout\ : std_logic;
SIGNAL \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[18]~3_combout\ : std_logic;
SIGNAL \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[17]~4_combout\ : std_logic;
SIGNAL \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[17]~5_combout\ : std_logic;
SIGNAL \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ : std_logic;
SIGNAL \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[22]~9_combout\ : std_logic;
SIGNAL \Mux|Mux1~2_combout\ : std_logic;
SIGNAL \Mux|Mux1~3_combout\ : std_logic;
SIGNAL \Mux|Mux2~0_combout\ : std_logic;
SIGNAL \Mux|Mux2~1_combout\ : std_logic;
SIGNAL \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \Mux|Mux2~4_combout\ : std_logic;
SIGNAL \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mux|Mux2~3_combout\ : std_logic;
SIGNAL \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mux|Mux2~2_combout\ : std_logic;
SIGNAL \Mux|Mux2~5_combout\ : std_logic;
SIGNAL \Mux|Mux2~6_combout\ : std_logic;
SIGNAL \Mux|Mux0~0_combout\ : std_logic;
SIGNAL \Mux|Mux0~1_combout\ : std_logic;
SIGNAL \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[23]~8_combout\ : std_logic;
SIGNAL \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[23]~8_combout\ : std_logic;
SIGNAL \Mux|Mux0~2_combout\ : std_logic;
SIGNAL \dispAnos0|dataOut~0_combout\ : std_logic;
SIGNAL \Mux|Mux3~0_combout\ : std_logic;
SIGNAL \Mux|Mux3~1_combout\ : std_logic;
SIGNAL \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \MesesBCD|Div0|auto_generated|divider|divider|StageOut[18]~1_combout\ : std_logic;
SIGNAL \MesesBCD|Div0|auto_generated|divider|divider|StageOut[18]~0_combout\ : std_logic;
SIGNAL \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \MesesBCD|Div0|auto_generated|divider|divider|StageOut[17]~3_combout\ : std_logic;
SIGNAL \MesesBCD|Div0|auto_generated|divider|divider|StageOut[17]~2_combout\ : std_logic;
SIGNAL \MesesBCD|Div0|auto_generated|divider|divider|StageOut[16]~4_combout\ : std_logic;
SIGNAL \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \MesesBCD|Div0|auto_generated|divider|divider|StageOut[16]~5_combout\ : std_logic;
SIGNAL \MesesBCD|Div0|auto_generated|divider|divider|StageOut[15]~7_combout\ : std_logic;
SIGNAL \MesesBCD|Div0|auto_generated|divider|divider|StageOut[15]~6_combout\ : std_logic;
SIGNAL \MesesBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1_cout\ : std_logic;
SIGNAL \MesesBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3_cout\ : std_logic;
SIGNAL \MesesBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5_cout\ : std_logic;
SIGNAL \MesesBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ : std_logic;
SIGNAL \MesesBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \DiasBCD|Div0|auto_generated|divider|divider|StageOut[18]~0_combout\ : std_logic;
SIGNAL \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \DiasBCD|Div0|auto_generated|divider|divider|StageOut[18]~1_combout\ : std_logic;
SIGNAL \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \DiasBCD|Div0|auto_generated|divider|divider|StageOut[17]~3_combout\ : std_logic;
SIGNAL \DiasBCD|Div0|auto_generated|divider|divider|StageOut[17]~2_combout\ : std_logic;
SIGNAL \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \DiasBCD|Div0|auto_generated|divider|divider|StageOut[16]~5_combout\ : std_logic;
SIGNAL \DiasBCD|Div0|auto_generated|divider|divider|StageOut[16]~4_combout\ : std_logic;
SIGNAL \DiasBCD|Div0|auto_generated|divider|divider|StageOut[15]~6_combout\ : std_logic;
SIGNAL \DiasBCD|Div0|auto_generated|divider|divider|StageOut[15]~7_combout\ : std_logic;
SIGNAL \DiasBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1_cout\ : std_logic;
SIGNAL \DiasBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3_cout\ : std_logic;
SIGNAL \DiasBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5_cout\ : std_logic;
SIGNAL \DiasBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ : std_logic;
SIGNAL \DiasBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \Mux|Mux3~2_combout\ : std_logic;
SIGNAL \Mux|Mux3~3_combout\ : std_logic;
SIGNAL \Mux|Mux3~4_combout\ : std_logic;
SIGNAL \dispAnos0|dataOut~1_combout\ : std_logic;
SIGNAL \dispAnos0|dataOut[0]~feeder_combout\ : std_logic;
SIGNAL \dispAnos0|dataOut[4]~2_combout\ : std_logic;
SIGNAL \Mux|Mux0~3_combout\ : std_logic;
SIGNAL \Bin7SegDecoder|decOut_n[1]~0_combout\ : std_logic;
SIGNAL \dispAnos0|dataOut~3_combout\ : std_logic;
SIGNAL \dispAnos0|dataOut[1]~feeder_combout\ : std_logic;
SIGNAL \dispAnos0|dataOut~4_combout\ : std_logic;
SIGNAL \dispAnos0|dataOut~5_combout\ : std_logic;
SIGNAL \dispAnos0|dataOut~6_combout\ : std_logic;
SIGNAL \Bin7SegDecoder|decOut_n[3]~1_combout\ : std_logic;
SIGNAL \dispAnos0|dataOut~7_combout\ : std_logic;
SIGNAL \dispAnos0|dataOut[3]~feeder_combout\ : std_logic;
SIGNAL \dispAnos0|dataOut~8_combout\ : std_logic;
SIGNAL \dispAnos0|dataOut~9_combout\ : std_logic;
SIGNAL \dispAnos0|dataOut~10_combout\ : std_logic;
SIGNAL \dispAnos0|dataOut~11_combout\ : std_logic;
SIGNAL \dispAnos0|dataOut~12_combout\ : std_logic;
SIGNAL \dispAnos0|dataOut[4]~feeder_combout\ : std_logic;
SIGNAL \dispAnos0|dataOut~13_combout\ : std_logic;
SIGNAL \dispAnos0|dataOut[5]~feeder_combout\ : std_logic;
SIGNAL \dispAnos0|dataOut~14_combout\ : std_logic;
SIGNAL \dispAnos0|dataOut~15_combout\ : std_logic;
SIGNAL \dispAnos1|dataOut[0]~feeder_combout\ : std_logic;
SIGNAL \dispAnos1|dataOut[1]~0_combout\ : std_logic;
SIGNAL \dispAnos1|dataOut[1]~feeder_combout\ : std_logic;
SIGNAL \dispAnos1|dataOut[2]~feeder_combout\ : std_logic;
SIGNAL \dispAnos1|dataOut[3]~feeder_combout\ : std_logic;
SIGNAL \dispAnos1|dataOut[4]~feeder_combout\ : std_logic;
SIGNAL \dispAnos1|dataOut[5]~feeder_combout\ : std_logic;
SIGNAL \dispAnos1|dataOut[6]~feeder_combout\ : std_logic;
SIGNAL \dispAnos2|dataOut[0]~feeder_combout\ : std_logic;
SIGNAL \dispAnos2|dataOut[4]~0_combout\ : std_logic;
SIGNAL \dispAnos3|dataOut[0]~feeder_combout\ : std_logic;
SIGNAL \dispAnos3|dataOut[4]~0_combout\ : std_logic;
SIGNAL \dispAnos3|dataOut[1]~feeder_combout\ : std_logic;
SIGNAL \dispAnos3|dataOut[6]~feeder_combout\ : std_logic;
SIGNAL \dispMes0|dataOut[0]~feeder_combout\ : std_logic;
SIGNAL \dispMes0|dataOut[5]~0_combout\ : std_logic;
SIGNAL \dispMes0|dataOut[2]~feeder_combout\ : std_logic;
SIGNAL \dispMes0|dataOut[3]~feeder_combout\ : std_logic;
SIGNAL \dispMes0|dataOut[5]~feeder_combout\ : std_logic;
SIGNAL \dispMes0|dataOut[6]~feeder_combout\ : std_logic;
SIGNAL \dispMes1|dataOut[0]~feeder_combout\ : std_logic;
SIGNAL \dispMes1|dataOut[0]~0_combout\ : std_logic;
SIGNAL \dispDias0|dataOut[0]~feeder_combout\ : std_logic;
SIGNAL \dispDias0|dataOut[4]~0_combout\ : std_logic;
SIGNAL \dispDias1|dataOut[0]~0_combout\ : std_logic;
SIGNAL \RegPulseGenerator|s_counter\ : std_logic_vector(30 DOWNTO 0);
SIGNAL \RegPulseGenerator|s_counter2\ : std_logic_vector(30 DOWNTO 0);
SIGNAL \DiasDoMes|s_value\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \dispDias0|dataOut\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \dispMes1|dataOut\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \dispMes0|dataOut\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \CounterDosAnos3|s_value\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \dispAnos3|dataOut\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \dispAnos2|dataOut\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \dispAnos1|dataOut\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \dispAnos0|dataOut\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \dispDias1|dataOut\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \CounterDosAnos2|s_value\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CounterDosAnos1|s_value\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CounterDosAnos4|s_value\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CounterDosDias|s_value\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \CounterDosMeses|s_value\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \DiasDoMes|valOut\ : std_logic_vector(4 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_SW <= SW;
ww_CLOCK_50 <= CLOCK_50;
ww_KEY <= KEY;
HEX0 <= ww_HEX0;
HEX1 <= ww_HEX1;
HEX2 <= ww_HEX2;
HEX3 <= ww_HEX3;
HEX4 <= ww_HEX4;
HEX5 <= ww_HEX5;
HEX6 <= ww_HEX6;
HEX7 <= ww_HEX7;
LEDG <= ww_LEDG;
LEDR <= ww_LEDR;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLOCK_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_50~input_o\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X69_Y73_N23
\HEX0[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispAnos0|dataOut\(0),
	devoe => ww_devoe,
	o => \HEX0[0]~output_o\);

-- Location: IOOBUF_X107_Y73_N23
\HEX0[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispAnos0|dataOut\(1),
	devoe => ww_devoe,
	o => \HEX0[1]~output_o\);

-- Location: IOOBUF_X67_Y73_N23
\HEX0[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispAnos0|dataOut\(2),
	devoe => ww_devoe,
	o => \HEX0[2]~output_o\);

-- Location: IOOBUF_X115_Y50_N2
\HEX0[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispAnos0|dataOut\(3),
	devoe => ww_devoe,
	o => \HEX0[3]~output_o\);

-- Location: IOOBUF_X115_Y54_N16
\HEX0[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispAnos0|dataOut\(4),
	devoe => ww_devoe,
	o => \HEX0[4]~output_o\);

-- Location: IOOBUF_X115_Y67_N16
\HEX0[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispAnos0|dataOut\(5),
	devoe => ww_devoe,
	o => \HEX0[5]~output_o\);

-- Location: IOOBUF_X115_Y69_N2
\HEX0[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispAnos0|dataOut\(6),
	devoe => ww_devoe,
	o => \HEX0[6]~output_o\);

-- Location: IOOBUF_X115_Y41_N2
\HEX1[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispAnos1|dataOut\(0),
	devoe => ww_devoe,
	o => \HEX1[0]~output_o\);

-- Location: IOOBUF_X115_Y30_N9
\HEX1[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispAnos1|dataOut\(1),
	devoe => ww_devoe,
	o => \HEX1[1]~output_o\);

-- Location: IOOBUF_X115_Y25_N23
\HEX1[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispAnos1|dataOut\(2),
	devoe => ww_devoe,
	o => \HEX1[2]~output_o\);

-- Location: IOOBUF_X115_Y30_N2
\HEX1[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispAnos1|dataOut\(3),
	devoe => ww_devoe,
	o => \HEX1[3]~output_o\);

-- Location: IOOBUF_X115_Y20_N9
\HEX1[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispAnos1|dataOut\(4),
	devoe => ww_devoe,
	o => \HEX1[4]~output_o\);

-- Location: IOOBUF_X115_Y22_N2
\HEX1[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispAnos1|dataOut\(5),
	devoe => ww_devoe,
	o => \HEX1[5]~output_o\);

-- Location: IOOBUF_X115_Y28_N9
\HEX1[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispAnos1|dataOut\(6),
	devoe => ww_devoe,
	o => \HEX1[6]~output_o\);

-- Location: IOOBUF_X115_Y17_N9
\HEX2[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispAnos2|dataOut\(0),
	devoe => ww_devoe,
	o => \HEX2[0]~output_o\);

-- Location: IOOBUF_X115_Y16_N2
\HEX2[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispAnos2|dataOut\(1),
	devoe => ww_devoe,
	o => \HEX2[1]~output_o\);

-- Location: IOOBUF_X115_Y19_N9
\HEX2[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispAnos2|dataOut\(2),
	devoe => ww_devoe,
	o => \HEX2[2]~output_o\);

-- Location: IOOBUF_X115_Y19_N2
\HEX2[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispAnos2|dataOut\(3),
	devoe => ww_devoe,
	o => \HEX2[3]~output_o\);

-- Location: IOOBUF_X115_Y18_N2
\HEX2[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispAnos2|dataOut\(4),
	devoe => ww_devoe,
	o => \HEX2[4]~output_o\);

-- Location: IOOBUF_X115_Y20_N2
\HEX2[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispAnos2|dataOut\(5),
	devoe => ww_devoe,
	o => \HEX2[5]~output_o\);

-- Location: IOOBUF_X115_Y21_N16
\HEX2[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispAnos2|dataOut\(6),
	devoe => ww_devoe,
	o => \HEX2[6]~output_o\);

-- Location: IOOBUF_X115_Y25_N16
\HEX3[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispAnos3|dataOut\(0),
	devoe => ww_devoe,
	o => \HEX3[0]~output_o\);

-- Location: IOOBUF_X115_Y29_N2
\HEX3[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispAnos3|dataOut\(1),
	devoe => ww_devoe,
	o => \HEX3[1]~output_o\);

-- Location: IOOBUF_X100_Y0_N2
\HEX3[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispAnos3|dataOut\(2),
	devoe => ww_devoe,
	o => \HEX3[2]~output_o\);

-- Location: IOOBUF_X111_Y0_N2
\HEX3[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispAnos3|dataOut\(3),
	devoe => ww_devoe,
	o => \HEX3[3]~output_o\);

-- Location: IOOBUF_X105_Y0_N23
\HEX3[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispAnos3|dataOut\(4),
	devoe => ww_devoe,
	o => \HEX3[4]~output_o\);

-- Location: IOOBUF_X105_Y0_N9
\HEX3[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispAnos3|dataOut\(5),
	devoe => ww_devoe,
	o => \HEX3[5]~output_o\);

-- Location: IOOBUF_X105_Y0_N2
\HEX3[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispAnos3|dataOut\(6),
	devoe => ww_devoe,
	o => \HEX3[6]~output_o\);

-- Location: IOOBUF_X98_Y0_N23
\HEX4[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispMes0|dataOut\(0),
	devoe => ww_devoe,
	o => \HEX4[0]~output_o\);

-- Location: IOOBUF_X107_Y0_N9
\HEX4[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispMes0|dataOut\(1),
	devoe => ww_devoe,
	o => \HEX4[1]~output_o\);

-- Location: IOOBUF_X74_Y0_N9
\HEX4[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispMes0|dataOut\(2),
	devoe => ww_devoe,
	o => \HEX4[2]~output_o\);

-- Location: IOOBUF_X74_Y0_N2
\HEX4[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispMes0|dataOut\(3),
	devoe => ww_devoe,
	o => \HEX4[3]~output_o\);

-- Location: IOOBUF_X83_Y0_N23
\HEX4[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispMes0|dataOut\(4),
	devoe => ww_devoe,
	o => \HEX4[4]~output_o\);

-- Location: IOOBUF_X83_Y0_N16
\HEX4[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispMes0|dataOut\(5),
	devoe => ww_devoe,
	o => \HEX4[5]~output_o\);

-- Location: IOOBUF_X79_Y0_N23
\HEX4[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispMes0|dataOut\(6),
	devoe => ww_devoe,
	o => \HEX4[6]~output_o\);

-- Location: IOOBUF_X85_Y0_N9
\HEX5[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispMes1|dataOut\(0),
	devoe => ww_devoe,
	o => \HEX5[0]~output_o\);

-- Location: IOOBUF_X87_Y0_N16
\HEX5[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispMes1|dataOut\(1),
	devoe => ww_devoe,
	o => \HEX5[1]~output_o\);

-- Location: IOOBUF_X98_Y0_N16
\HEX5[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispMes1|dataOut\(2),
	devoe => ww_devoe,
	o => \HEX5[2]~output_o\);

-- Location: IOOBUF_X72_Y0_N2
\HEX5[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispMes1|dataOut\(3),
	devoe => ww_devoe,
	o => \HEX5[3]~output_o\);

-- Location: IOOBUF_X72_Y0_N9
\HEX5[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispMes1|dataOut\(4),
	devoe => ww_devoe,
	o => \HEX5[4]~output_o\);

-- Location: IOOBUF_X79_Y0_N16
\HEX5[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispMes1|dataOut\(5),
	devoe => ww_devoe,
	o => \HEX5[5]~output_o\);

-- Location: IOOBUF_X69_Y0_N2
\HEX5[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispMes1|dataOut\(6),
	devoe => ww_devoe,
	o => \HEX5[6]~output_o\);

-- Location: IOOBUF_X89_Y0_N23
\HEX6[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispDias0|dataOut\(0),
	devoe => ww_devoe,
	o => \HEX6[0]~output_o\);

-- Location: IOOBUF_X65_Y0_N2
\HEX6[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispDias0|dataOut\(1),
	devoe => ww_devoe,
	o => \HEX6[1]~output_o\);

-- Location: IOOBUF_X65_Y0_N9
\HEX6[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispDias0|dataOut\(2),
	devoe => ww_devoe,
	o => \HEX6[2]~output_o\);

-- Location: IOOBUF_X89_Y0_N16
\HEX6[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispDias0|dataOut\(3),
	devoe => ww_devoe,
	o => \HEX6[3]~output_o\);

-- Location: IOOBUF_X67_Y0_N16
\HEX6[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispDias0|dataOut\(4),
	devoe => ww_devoe,
	o => \HEX6[4]~output_o\);

-- Location: IOOBUF_X67_Y0_N23
\HEX6[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispDias0|dataOut\(5),
	devoe => ww_devoe,
	o => \HEX6[5]~output_o\);

-- Location: IOOBUF_X74_Y0_N23
\HEX6[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispDias0|dataOut\(6),
	devoe => ww_devoe,
	o => \HEX6[6]~output_o\);

-- Location: IOOBUF_X74_Y0_N16
\HEX7[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispDias1|dataOut\(0),
	devoe => ww_devoe,
	o => \HEX7[0]~output_o\);

-- Location: IOOBUF_X67_Y0_N9
\HEX7[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispDias1|dataOut\(1),
	devoe => ww_devoe,
	o => \HEX7[1]~output_o\);

-- Location: IOOBUF_X62_Y0_N23
\HEX7[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispDias1|dataOut\(2),
	devoe => ww_devoe,
	o => \HEX7[2]~output_o\);

-- Location: IOOBUF_X62_Y0_N16
\HEX7[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispDias1|dataOut\(3),
	devoe => ww_devoe,
	o => \HEX7[3]~output_o\);

-- Location: IOOBUF_X67_Y0_N2
\HEX7[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispDias1|dataOut\(4),
	devoe => ww_devoe,
	o => \HEX7[4]~output_o\);

-- Location: IOOBUF_X69_Y0_N9
\HEX7[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispDias1|dataOut\(5),
	devoe => ww_devoe,
	o => \HEX7[5]~output_o\);

-- Location: IOOBUF_X54_Y0_N23
\HEX7[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispDias1|dataOut\(6),
	devoe => ww_devoe,
	o => \HEX7[6]~output_o\);

-- Location: IOOBUF_X107_Y73_N9
\LEDG[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDG[0]~output_o\);

-- Location: IOOBUF_X111_Y73_N9
\LEDG[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDG[1]~output_o\);

-- Location: IOOBUF_X83_Y73_N2
\LEDG[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDG[2]~output_o\);

-- Location: IOOBUF_X85_Y73_N23
\LEDG[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDG[3]~output_o\);

-- Location: IOOBUF_X72_Y73_N16
\LEDG[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDG[4]~output_o\);

-- Location: IOOBUF_X74_Y73_N16
\LEDG[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDG[5]~output_o\);

-- Location: IOOBUF_X72_Y73_N23
\LEDG[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDG[6]~output_o\);

-- Location: IOOBUF_X74_Y73_N23
\LEDG[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDG[7]~output_o\);

-- Location: IOOBUF_X67_Y73_N16
\LEDG[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDG[8]~output_o\);

-- Location: IOOBUF_X69_Y73_N16
\LEDR[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[0]~output_o\);

-- Location: IOOBUF_X94_Y73_N2
\LEDR[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[1]~output_o\);

-- Location: IOOBUF_X94_Y73_N9
\LEDR[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[2]~output_o\);

-- Location: IOOBUF_X107_Y73_N16
\LEDR[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[3]~output_o\);

-- Location: IOOBUF_X87_Y73_N16
\LEDR[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[4]~output_o\);

-- Location: IOOBUF_X87_Y73_N9
\LEDR[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[5]~output_o\);

-- Location: IOOBUF_X72_Y73_N9
\LEDR[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[6]~output_o\);

-- Location: IOOBUF_X72_Y73_N2
\LEDR[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[7]~output_o\);

-- Location: IOOBUF_X69_Y73_N2
\LEDR[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[8]~output_o\);

-- Location: IOOBUF_X83_Y73_N23
\LEDR[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[9]~output_o\);

-- Location: IOOBUF_X60_Y73_N23
\LEDR[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[10]~output_o\);

-- Location: IOOBUF_X65_Y73_N23
\LEDR[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[11]~output_o\);

-- Location: IOOBUF_X65_Y73_N16
\LEDR[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[12]~output_o\);

-- Location: IOOBUF_X67_Y73_N9
\LEDR[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[13]~output_o\);

-- Location: IOOBUF_X58_Y73_N2
\LEDR[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[14]~output_o\);

-- Location: IOOBUF_X65_Y73_N9
\LEDR[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[15]~output_o\);

-- Location: IOOBUF_X67_Y73_N2
\LEDR[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[16]~output_o\);

-- Location: IOOBUF_X60_Y73_N16
\LEDR[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[17]~output_o\);

-- Location: IOIBUF_X0_Y36_N15
\CLOCK_50~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

-- Location: CLKCTRL_G4
\CLOCK_50~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK_50~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLOCK_50~inputclkctrl_outclk\);

-- Location: IOIBUF_X115_Y17_N1
\SW[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

-- Location: LCCOMB_X107_Y17_N30
\DispCntrl|Present_state.idle~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \DispCntrl|Present_state.idle~0_combout\ = !\SW[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SW[0]~input_o\,
	combout => \DispCntrl|Present_state.idle~0_combout\);

-- Location: LCCOMB_X106_Y23_N2
\RegPulseGenerator|s_counter2[0]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter2[0]~31_combout\ = \RegPulseGenerator|s_counter2\(0) $ (VCC)
-- \RegPulseGenerator|s_counter2[0]~32\ = CARRY(\RegPulseGenerator|s_counter2\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter2\(0),
	datad => VCC,
	combout => \RegPulseGenerator|s_counter2[0]~31_combout\,
	cout => \RegPulseGenerator|s_counter2[0]~32\);

-- Location: LCCOMB_X107_Y22_N28
\RegPulseGenerator|LessThan1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|LessThan1~0_combout\ = (((!\RegPulseGenerator|s_counter2\(0)) # (!\RegPulseGenerator|s_counter2\(3))) # (!\RegPulseGenerator|s_counter2\(1))) # (!\RegPulseGenerator|s_counter2\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter2\(2),
	datab => \RegPulseGenerator|s_counter2\(1),
	datac => \RegPulseGenerator|s_counter2\(3),
	datad => \RegPulseGenerator|s_counter2\(0),
	combout => \RegPulseGenerator|LessThan1~0_combout\);

-- Location: LCCOMB_X107_Y22_N2
\RegPulseGenerator|LessThan1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|LessThan1~1_combout\ = ((!\RegPulseGenerator|s_counter2\(5) & (!\RegPulseGenerator|s_counter2\(4) & \RegPulseGenerator|LessThan1~0_combout\))) # (!\RegPulseGenerator|s_counter2\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter2\(6),
	datab => \RegPulseGenerator|s_counter2\(5),
	datac => \RegPulseGenerator|s_counter2\(4),
	datad => \RegPulseGenerator|LessThan1~0_combout\,
	combout => \RegPulseGenerator|LessThan1~1_combout\);

-- Location: LCCOMB_X107_Y22_N20
\RegPulseGenerator|LessThan1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|LessThan1~2_combout\ = (((!\RegPulseGenerator|s_counter2\(7) & \RegPulseGenerator|LessThan1~1_combout\)) # (!\RegPulseGenerator|s_counter2\(8))) # (!\RegPulseGenerator|s_counter2\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter2\(7),
	datab => \RegPulseGenerator|s_counter2\(9),
	datac => \RegPulseGenerator|s_counter2\(8),
	datad => \RegPulseGenerator|LessThan1~1_combout\,
	combout => \RegPulseGenerator|LessThan1~2_combout\);

-- Location: LCCOMB_X106_Y23_N0
\RegPulseGenerator|Equal1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|Equal1~5_combout\ = (!\RegPulseGenerator|s_counter2\(10) & (!\RegPulseGenerator|s_counter2\(13) & (!\RegPulseGenerator|s_counter2\(12) & !\RegPulseGenerator|s_counter2\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter2\(10),
	datab => \RegPulseGenerator|s_counter2\(13),
	datac => \RegPulseGenerator|s_counter2\(12),
	datad => \RegPulseGenerator|s_counter2\(11),
	combout => \RegPulseGenerator|Equal1~5_combout\);

-- Location: LCCOMB_X107_Y22_N22
\RegPulseGenerator|LessThan1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|LessThan1~3_combout\ = (((\RegPulseGenerator|LessThan1~2_combout\ & \RegPulseGenerator|Equal1~5_combout\)) # (!\RegPulseGenerator|s_counter2\(14))) # (!\RegPulseGenerator|s_counter2\(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter2\(15),
	datab => \RegPulseGenerator|LessThan1~2_combout\,
	datac => \RegPulseGenerator|Equal1~5_combout\,
	datad => \RegPulseGenerator|s_counter2\(14),
	combout => \RegPulseGenerator|LessThan1~3_combout\);

-- Location: LCCOMB_X107_Y22_N0
\RegPulseGenerator|count_proc2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|count_proc2~0_combout\ = ((\SW[0]~input_o\) # (!\RegPulseGenerator|LessThan1~3_combout\)) # (!\RegPulseGenerator|Equal1~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|Equal1~4_combout\,
	datac => \RegPulseGenerator|LessThan1~3_combout\,
	datad => \SW[0]~input_o\,
	combout => \RegPulseGenerator|count_proc2~0_combout\);

-- Location: FF_X106_Y23_N3
\RegPulseGenerator|s_counter2[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter2[0]~31_combout\,
	sclr => \RegPulseGenerator|count_proc2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter2\(0));

-- Location: LCCOMB_X106_Y23_N4
\RegPulseGenerator|s_counter2[1]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter2[1]~33_combout\ = (\RegPulseGenerator|s_counter2\(1) & (!\RegPulseGenerator|s_counter2[0]~32\)) # (!\RegPulseGenerator|s_counter2\(1) & ((\RegPulseGenerator|s_counter2[0]~32\) # (GND)))
-- \RegPulseGenerator|s_counter2[1]~34\ = CARRY((!\RegPulseGenerator|s_counter2[0]~32\) # (!\RegPulseGenerator|s_counter2\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter2\(1),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter2[0]~32\,
	combout => \RegPulseGenerator|s_counter2[1]~33_combout\,
	cout => \RegPulseGenerator|s_counter2[1]~34\);

-- Location: FF_X106_Y23_N5
\RegPulseGenerator|s_counter2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter2[1]~33_combout\,
	sclr => \RegPulseGenerator|count_proc2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter2\(1));

-- Location: LCCOMB_X106_Y23_N6
\RegPulseGenerator|s_counter2[2]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter2[2]~35_combout\ = (\RegPulseGenerator|s_counter2\(2) & (\RegPulseGenerator|s_counter2[1]~34\ $ (GND))) # (!\RegPulseGenerator|s_counter2\(2) & (!\RegPulseGenerator|s_counter2[1]~34\ & VCC))
-- \RegPulseGenerator|s_counter2[2]~36\ = CARRY((\RegPulseGenerator|s_counter2\(2) & !\RegPulseGenerator|s_counter2[1]~34\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter2\(2),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter2[1]~34\,
	combout => \RegPulseGenerator|s_counter2[2]~35_combout\,
	cout => \RegPulseGenerator|s_counter2[2]~36\);

-- Location: FF_X106_Y23_N7
\RegPulseGenerator|s_counter2[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter2[2]~35_combout\,
	sclr => \RegPulseGenerator|count_proc2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter2\(2));

-- Location: LCCOMB_X106_Y23_N8
\RegPulseGenerator|s_counter2[3]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter2[3]~37_combout\ = (\RegPulseGenerator|s_counter2\(3) & (!\RegPulseGenerator|s_counter2[2]~36\)) # (!\RegPulseGenerator|s_counter2\(3) & ((\RegPulseGenerator|s_counter2[2]~36\) # (GND)))
-- \RegPulseGenerator|s_counter2[3]~38\ = CARRY((!\RegPulseGenerator|s_counter2[2]~36\) # (!\RegPulseGenerator|s_counter2\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter2\(3),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter2[2]~36\,
	combout => \RegPulseGenerator|s_counter2[3]~37_combout\,
	cout => \RegPulseGenerator|s_counter2[3]~38\);

-- Location: FF_X106_Y23_N9
\RegPulseGenerator|s_counter2[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter2[3]~37_combout\,
	sclr => \RegPulseGenerator|count_proc2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter2\(3));

-- Location: LCCOMB_X106_Y23_N10
\RegPulseGenerator|s_counter2[4]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter2[4]~39_combout\ = (\RegPulseGenerator|s_counter2\(4) & (\RegPulseGenerator|s_counter2[3]~38\ $ (GND))) # (!\RegPulseGenerator|s_counter2\(4) & (!\RegPulseGenerator|s_counter2[3]~38\ & VCC))
-- \RegPulseGenerator|s_counter2[4]~40\ = CARRY((\RegPulseGenerator|s_counter2\(4) & !\RegPulseGenerator|s_counter2[3]~38\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter2\(4),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter2[3]~38\,
	combout => \RegPulseGenerator|s_counter2[4]~39_combout\,
	cout => \RegPulseGenerator|s_counter2[4]~40\);

-- Location: FF_X106_Y23_N11
\RegPulseGenerator|s_counter2[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter2[4]~39_combout\,
	sclr => \RegPulseGenerator|count_proc2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter2\(4));

-- Location: LCCOMB_X106_Y23_N12
\RegPulseGenerator|s_counter2[5]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter2[5]~41_combout\ = (\RegPulseGenerator|s_counter2\(5) & (!\RegPulseGenerator|s_counter2[4]~40\)) # (!\RegPulseGenerator|s_counter2\(5) & ((\RegPulseGenerator|s_counter2[4]~40\) # (GND)))
-- \RegPulseGenerator|s_counter2[5]~42\ = CARRY((!\RegPulseGenerator|s_counter2[4]~40\) # (!\RegPulseGenerator|s_counter2\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter2\(5),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter2[4]~40\,
	combout => \RegPulseGenerator|s_counter2[5]~41_combout\,
	cout => \RegPulseGenerator|s_counter2[5]~42\);

-- Location: FF_X106_Y23_N13
\RegPulseGenerator|s_counter2[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter2[5]~41_combout\,
	sclr => \RegPulseGenerator|count_proc2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter2\(5));

-- Location: LCCOMB_X106_Y23_N14
\RegPulseGenerator|s_counter2[6]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter2[6]~43_combout\ = (\RegPulseGenerator|s_counter2\(6) & (\RegPulseGenerator|s_counter2[5]~42\ $ (GND))) # (!\RegPulseGenerator|s_counter2\(6) & (!\RegPulseGenerator|s_counter2[5]~42\ & VCC))
-- \RegPulseGenerator|s_counter2[6]~44\ = CARRY((\RegPulseGenerator|s_counter2\(6) & !\RegPulseGenerator|s_counter2[5]~42\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter2\(6),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter2[5]~42\,
	combout => \RegPulseGenerator|s_counter2[6]~43_combout\,
	cout => \RegPulseGenerator|s_counter2[6]~44\);

-- Location: FF_X106_Y23_N15
\RegPulseGenerator|s_counter2[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter2[6]~43_combout\,
	sclr => \RegPulseGenerator|count_proc2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter2\(6));

-- Location: LCCOMB_X106_Y23_N16
\RegPulseGenerator|s_counter2[7]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter2[7]~45_combout\ = (\RegPulseGenerator|s_counter2\(7) & (!\RegPulseGenerator|s_counter2[6]~44\)) # (!\RegPulseGenerator|s_counter2\(7) & ((\RegPulseGenerator|s_counter2[6]~44\) # (GND)))
-- \RegPulseGenerator|s_counter2[7]~46\ = CARRY((!\RegPulseGenerator|s_counter2[6]~44\) # (!\RegPulseGenerator|s_counter2\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter2\(7),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter2[6]~44\,
	combout => \RegPulseGenerator|s_counter2[7]~45_combout\,
	cout => \RegPulseGenerator|s_counter2[7]~46\);

-- Location: FF_X106_Y23_N17
\RegPulseGenerator|s_counter2[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter2[7]~45_combout\,
	sclr => \RegPulseGenerator|count_proc2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter2\(7));

-- Location: LCCOMB_X106_Y23_N18
\RegPulseGenerator|s_counter2[8]~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter2[8]~47_combout\ = (\RegPulseGenerator|s_counter2\(8) & (\RegPulseGenerator|s_counter2[7]~46\ $ (GND))) # (!\RegPulseGenerator|s_counter2\(8) & (!\RegPulseGenerator|s_counter2[7]~46\ & VCC))
-- \RegPulseGenerator|s_counter2[8]~48\ = CARRY((\RegPulseGenerator|s_counter2\(8) & !\RegPulseGenerator|s_counter2[7]~46\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter2\(8),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter2[7]~46\,
	combout => \RegPulseGenerator|s_counter2[8]~47_combout\,
	cout => \RegPulseGenerator|s_counter2[8]~48\);

-- Location: FF_X106_Y23_N19
\RegPulseGenerator|s_counter2[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter2[8]~47_combout\,
	sclr => \RegPulseGenerator|count_proc2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter2\(8));

-- Location: LCCOMB_X106_Y23_N20
\RegPulseGenerator|s_counter2[9]~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter2[9]~49_combout\ = (\RegPulseGenerator|s_counter2\(9) & (!\RegPulseGenerator|s_counter2[8]~48\)) # (!\RegPulseGenerator|s_counter2\(9) & ((\RegPulseGenerator|s_counter2[8]~48\) # (GND)))
-- \RegPulseGenerator|s_counter2[9]~50\ = CARRY((!\RegPulseGenerator|s_counter2[8]~48\) # (!\RegPulseGenerator|s_counter2\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter2\(9),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter2[8]~48\,
	combout => \RegPulseGenerator|s_counter2[9]~49_combout\,
	cout => \RegPulseGenerator|s_counter2[9]~50\);

-- Location: FF_X106_Y23_N21
\RegPulseGenerator|s_counter2[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter2[9]~49_combout\,
	sclr => \RegPulseGenerator|count_proc2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter2\(9));

-- Location: LCCOMB_X106_Y23_N22
\RegPulseGenerator|s_counter2[10]~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter2[10]~51_combout\ = (\RegPulseGenerator|s_counter2\(10) & (\RegPulseGenerator|s_counter2[9]~50\ $ (GND))) # (!\RegPulseGenerator|s_counter2\(10) & (!\RegPulseGenerator|s_counter2[9]~50\ & VCC))
-- \RegPulseGenerator|s_counter2[10]~52\ = CARRY((\RegPulseGenerator|s_counter2\(10) & !\RegPulseGenerator|s_counter2[9]~50\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter2\(10),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter2[9]~50\,
	combout => \RegPulseGenerator|s_counter2[10]~51_combout\,
	cout => \RegPulseGenerator|s_counter2[10]~52\);

-- Location: FF_X106_Y23_N23
\RegPulseGenerator|s_counter2[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter2[10]~51_combout\,
	sclr => \RegPulseGenerator|count_proc2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter2\(10));

-- Location: LCCOMB_X106_Y23_N24
\RegPulseGenerator|s_counter2[11]~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter2[11]~53_combout\ = (\RegPulseGenerator|s_counter2\(11) & (!\RegPulseGenerator|s_counter2[10]~52\)) # (!\RegPulseGenerator|s_counter2\(11) & ((\RegPulseGenerator|s_counter2[10]~52\) # (GND)))
-- \RegPulseGenerator|s_counter2[11]~54\ = CARRY((!\RegPulseGenerator|s_counter2[10]~52\) # (!\RegPulseGenerator|s_counter2\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter2\(11),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter2[10]~52\,
	combout => \RegPulseGenerator|s_counter2[11]~53_combout\,
	cout => \RegPulseGenerator|s_counter2[11]~54\);

-- Location: FF_X106_Y23_N25
\RegPulseGenerator|s_counter2[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter2[11]~53_combout\,
	sclr => \RegPulseGenerator|count_proc2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter2\(11));

-- Location: LCCOMB_X106_Y23_N26
\RegPulseGenerator|s_counter2[12]~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter2[12]~55_combout\ = (\RegPulseGenerator|s_counter2\(12) & (\RegPulseGenerator|s_counter2[11]~54\ $ (GND))) # (!\RegPulseGenerator|s_counter2\(12) & (!\RegPulseGenerator|s_counter2[11]~54\ & VCC))
-- \RegPulseGenerator|s_counter2[12]~56\ = CARRY((\RegPulseGenerator|s_counter2\(12) & !\RegPulseGenerator|s_counter2[11]~54\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter2\(12),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter2[11]~54\,
	combout => \RegPulseGenerator|s_counter2[12]~55_combout\,
	cout => \RegPulseGenerator|s_counter2[12]~56\);

-- Location: FF_X106_Y23_N27
\RegPulseGenerator|s_counter2[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter2[12]~55_combout\,
	sclr => \RegPulseGenerator|count_proc2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter2\(12));

-- Location: LCCOMB_X106_Y23_N28
\RegPulseGenerator|s_counter2[13]~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter2[13]~57_combout\ = (\RegPulseGenerator|s_counter2\(13) & (!\RegPulseGenerator|s_counter2[12]~56\)) # (!\RegPulseGenerator|s_counter2\(13) & ((\RegPulseGenerator|s_counter2[12]~56\) # (GND)))
-- \RegPulseGenerator|s_counter2[13]~58\ = CARRY((!\RegPulseGenerator|s_counter2[12]~56\) # (!\RegPulseGenerator|s_counter2\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter2\(13),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter2[12]~56\,
	combout => \RegPulseGenerator|s_counter2[13]~57_combout\,
	cout => \RegPulseGenerator|s_counter2[13]~58\);

-- Location: FF_X106_Y23_N29
\RegPulseGenerator|s_counter2[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter2[13]~57_combout\,
	sclr => \RegPulseGenerator|count_proc2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter2\(13));

-- Location: LCCOMB_X106_Y23_N30
\RegPulseGenerator|s_counter2[14]~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter2[14]~59_combout\ = (\RegPulseGenerator|s_counter2\(14) & (\RegPulseGenerator|s_counter2[13]~58\ $ (GND))) # (!\RegPulseGenerator|s_counter2\(14) & (!\RegPulseGenerator|s_counter2[13]~58\ & VCC))
-- \RegPulseGenerator|s_counter2[14]~60\ = CARRY((\RegPulseGenerator|s_counter2\(14) & !\RegPulseGenerator|s_counter2[13]~58\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter2\(14),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter2[13]~58\,
	combout => \RegPulseGenerator|s_counter2[14]~59_combout\,
	cout => \RegPulseGenerator|s_counter2[14]~60\);

-- Location: FF_X106_Y23_N31
\RegPulseGenerator|s_counter2[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter2[14]~59_combout\,
	sclr => \RegPulseGenerator|count_proc2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter2\(14));

-- Location: LCCOMB_X106_Y22_N0
\RegPulseGenerator|s_counter2[15]~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter2[15]~61_combout\ = (\RegPulseGenerator|s_counter2\(15) & (!\RegPulseGenerator|s_counter2[14]~60\)) # (!\RegPulseGenerator|s_counter2\(15) & ((\RegPulseGenerator|s_counter2[14]~60\) # (GND)))
-- \RegPulseGenerator|s_counter2[15]~62\ = CARRY((!\RegPulseGenerator|s_counter2[14]~60\) # (!\RegPulseGenerator|s_counter2\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter2\(15),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter2[14]~60\,
	combout => \RegPulseGenerator|s_counter2[15]~61_combout\,
	cout => \RegPulseGenerator|s_counter2[15]~62\);

-- Location: FF_X106_Y22_N1
\RegPulseGenerator|s_counter2[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter2[15]~61_combout\,
	sclr => \RegPulseGenerator|count_proc2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter2\(15));

-- Location: LCCOMB_X106_Y22_N2
\RegPulseGenerator|s_counter2[16]~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter2[16]~63_combout\ = (\RegPulseGenerator|s_counter2\(16) & (\RegPulseGenerator|s_counter2[15]~62\ $ (GND))) # (!\RegPulseGenerator|s_counter2\(16) & (!\RegPulseGenerator|s_counter2[15]~62\ & VCC))
-- \RegPulseGenerator|s_counter2[16]~64\ = CARRY((\RegPulseGenerator|s_counter2\(16) & !\RegPulseGenerator|s_counter2[15]~62\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter2\(16),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter2[15]~62\,
	combout => \RegPulseGenerator|s_counter2[16]~63_combout\,
	cout => \RegPulseGenerator|s_counter2[16]~64\);

-- Location: FF_X106_Y22_N3
\RegPulseGenerator|s_counter2[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter2[16]~63_combout\,
	sclr => \RegPulseGenerator|count_proc2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter2\(16));

-- Location: LCCOMB_X106_Y22_N4
\RegPulseGenerator|s_counter2[17]~65\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter2[17]~65_combout\ = (\RegPulseGenerator|s_counter2\(17) & (!\RegPulseGenerator|s_counter2[16]~64\)) # (!\RegPulseGenerator|s_counter2\(17) & ((\RegPulseGenerator|s_counter2[16]~64\) # (GND)))
-- \RegPulseGenerator|s_counter2[17]~66\ = CARRY((!\RegPulseGenerator|s_counter2[16]~64\) # (!\RegPulseGenerator|s_counter2\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter2\(17),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter2[16]~64\,
	combout => \RegPulseGenerator|s_counter2[17]~65_combout\,
	cout => \RegPulseGenerator|s_counter2[17]~66\);

-- Location: FF_X106_Y22_N5
\RegPulseGenerator|s_counter2[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter2[17]~65_combout\,
	sclr => \RegPulseGenerator|count_proc2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter2\(17));

-- Location: LCCOMB_X106_Y22_N6
\RegPulseGenerator|s_counter2[18]~67\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter2[18]~67_combout\ = (\RegPulseGenerator|s_counter2\(18) & (\RegPulseGenerator|s_counter2[17]~66\ $ (GND))) # (!\RegPulseGenerator|s_counter2\(18) & (!\RegPulseGenerator|s_counter2[17]~66\ & VCC))
-- \RegPulseGenerator|s_counter2[18]~68\ = CARRY((\RegPulseGenerator|s_counter2\(18) & !\RegPulseGenerator|s_counter2[17]~66\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter2\(18),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter2[17]~66\,
	combout => \RegPulseGenerator|s_counter2[18]~67_combout\,
	cout => \RegPulseGenerator|s_counter2[18]~68\);

-- Location: FF_X106_Y22_N7
\RegPulseGenerator|s_counter2[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter2[18]~67_combout\,
	sclr => \RegPulseGenerator|count_proc2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter2\(18));

-- Location: LCCOMB_X106_Y22_N8
\RegPulseGenerator|s_counter2[19]~69\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter2[19]~69_combout\ = (\RegPulseGenerator|s_counter2\(19) & (!\RegPulseGenerator|s_counter2[18]~68\)) # (!\RegPulseGenerator|s_counter2\(19) & ((\RegPulseGenerator|s_counter2[18]~68\) # (GND)))
-- \RegPulseGenerator|s_counter2[19]~70\ = CARRY((!\RegPulseGenerator|s_counter2[18]~68\) # (!\RegPulseGenerator|s_counter2\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter2\(19),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter2[18]~68\,
	combout => \RegPulseGenerator|s_counter2[19]~69_combout\,
	cout => \RegPulseGenerator|s_counter2[19]~70\);

-- Location: FF_X106_Y22_N9
\RegPulseGenerator|s_counter2[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter2[19]~69_combout\,
	sclr => \RegPulseGenerator|count_proc2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter2\(19));

-- Location: LCCOMB_X107_Y22_N12
\RegPulseGenerator|Equal1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|Equal1~0_combout\ = (!\RegPulseGenerator|s_counter2\(19) & (!\RegPulseGenerator|s_counter2\(18) & (!\RegPulseGenerator|s_counter2\(17) & !\RegPulseGenerator|s_counter2\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter2\(19),
	datab => \RegPulseGenerator|s_counter2\(18),
	datac => \RegPulseGenerator|s_counter2\(17),
	datad => \RegPulseGenerator|s_counter2\(16),
	combout => \RegPulseGenerator|Equal1~0_combout\);

-- Location: LCCOMB_X106_Y22_N10
\RegPulseGenerator|s_counter2[20]~71\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter2[20]~71_combout\ = (\RegPulseGenerator|s_counter2\(20) & (\RegPulseGenerator|s_counter2[19]~70\ $ (GND))) # (!\RegPulseGenerator|s_counter2\(20) & (!\RegPulseGenerator|s_counter2[19]~70\ & VCC))
-- \RegPulseGenerator|s_counter2[20]~72\ = CARRY((\RegPulseGenerator|s_counter2\(20) & !\RegPulseGenerator|s_counter2[19]~70\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter2\(20),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter2[19]~70\,
	combout => \RegPulseGenerator|s_counter2[20]~71_combout\,
	cout => \RegPulseGenerator|s_counter2[20]~72\);

-- Location: FF_X106_Y22_N11
\RegPulseGenerator|s_counter2[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter2[20]~71_combout\,
	sclr => \RegPulseGenerator|count_proc2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter2\(20));

-- Location: LCCOMB_X106_Y22_N12
\RegPulseGenerator|s_counter2[21]~73\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter2[21]~73_combout\ = (\RegPulseGenerator|s_counter2\(21) & (!\RegPulseGenerator|s_counter2[20]~72\)) # (!\RegPulseGenerator|s_counter2\(21) & ((\RegPulseGenerator|s_counter2[20]~72\) # (GND)))
-- \RegPulseGenerator|s_counter2[21]~74\ = CARRY((!\RegPulseGenerator|s_counter2[20]~72\) # (!\RegPulseGenerator|s_counter2\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter2\(21),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter2[20]~72\,
	combout => \RegPulseGenerator|s_counter2[21]~73_combout\,
	cout => \RegPulseGenerator|s_counter2[21]~74\);

-- Location: FF_X106_Y22_N13
\RegPulseGenerator|s_counter2[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter2[21]~73_combout\,
	sclr => \RegPulseGenerator|count_proc2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter2\(21));

-- Location: LCCOMB_X106_Y22_N14
\RegPulseGenerator|s_counter2[22]~75\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter2[22]~75_combout\ = (\RegPulseGenerator|s_counter2\(22) & (\RegPulseGenerator|s_counter2[21]~74\ $ (GND))) # (!\RegPulseGenerator|s_counter2\(22) & (!\RegPulseGenerator|s_counter2[21]~74\ & VCC))
-- \RegPulseGenerator|s_counter2[22]~76\ = CARRY((\RegPulseGenerator|s_counter2\(22) & !\RegPulseGenerator|s_counter2[21]~74\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter2\(22),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter2[21]~74\,
	combout => \RegPulseGenerator|s_counter2[22]~75_combout\,
	cout => \RegPulseGenerator|s_counter2[22]~76\);

-- Location: FF_X106_Y22_N15
\RegPulseGenerator|s_counter2[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter2[22]~75_combout\,
	sclr => \RegPulseGenerator|count_proc2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter2\(22));

-- Location: LCCOMB_X106_Y22_N16
\RegPulseGenerator|s_counter2[23]~77\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter2[23]~77_combout\ = (\RegPulseGenerator|s_counter2\(23) & (!\RegPulseGenerator|s_counter2[22]~76\)) # (!\RegPulseGenerator|s_counter2\(23) & ((\RegPulseGenerator|s_counter2[22]~76\) # (GND)))
-- \RegPulseGenerator|s_counter2[23]~78\ = CARRY((!\RegPulseGenerator|s_counter2[22]~76\) # (!\RegPulseGenerator|s_counter2\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter2\(23),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter2[22]~76\,
	combout => \RegPulseGenerator|s_counter2[23]~77_combout\,
	cout => \RegPulseGenerator|s_counter2[23]~78\);

-- Location: FF_X106_Y22_N17
\RegPulseGenerator|s_counter2[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter2[23]~77_combout\,
	sclr => \RegPulseGenerator|count_proc2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter2\(23));

-- Location: LCCOMB_X106_Y22_N18
\RegPulseGenerator|s_counter2[24]~79\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter2[24]~79_combout\ = (\RegPulseGenerator|s_counter2\(24) & (\RegPulseGenerator|s_counter2[23]~78\ $ (GND))) # (!\RegPulseGenerator|s_counter2\(24) & (!\RegPulseGenerator|s_counter2[23]~78\ & VCC))
-- \RegPulseGenerator|s_counter2[24]~80\ = CARRY((\RegPulseGenerator|s_counter2\(24) & !\RegPulseGenerator|s_counter2[23]~78\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter2\(24),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter2[23]~78\,
	combout => \RegPulseGenerator|s_counter2[24]~79_combout\,
	cout => \RegPulseGenerator|s_counter2[24]~80\);

-- Location: FF_X106_Y22_N19
\RegPulseGenerator|s_counter2[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter2[24]~79_combout\,
	sclr => \RegPulseGenerator|count_proc2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter2\(24));

-- Location: LCCOMB_X106_Y22_N20
\RegPulseGenerator|s_counter2[25]~81\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter2[25]~81_combout\ = (\RegPulseGenerator|s_counter2\(25) & (!\RegPulseGenerator|s_counter2[24]~80\)) # (!\RegPulseGenerator|s_counter2\(25) & ((\RegPulseGenerator|s_counter2[24]~80\) # (GND)))
-- \RegPulseGenerator|s_counter2[25]~82\ = CARRY((!\RegPulseGenerator|s_counter2[24]~80\) # (!\RegPulseGenerator|s_counter2\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter2\(25),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter2[24]~80\,
	combout => \RegPulseGenerator|s_counter2[25]~81_combout\,
	cout => \RegPulseGenerator|s_counter2[25]~82\);

-- Location: FF_X106_Y22_N21
\RegPulseGenerator|s_counter2[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter2[25]~81_combout\,
	sclr => \RegPulseGenerator|count_proc2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter2\(25));

-- Location: LCCOMB_X106_Y22_N22
\RegPulseGenerator|s_counter2[26]~83\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter2[26]~83_combout\ = (\RegPulseGenerator|s_counter2\(26) & (\RegPulseGenerator|s_counter2[25]~82\ $ (GND))) # (!\RegPulseGenerator|s_counter2\(26) & (!\RegPulseGenerator|s_counter2[25]~82\ & VCC))
-- \RegPulseGenerator|s_counter2[26]~84\ = CARRY((\RegPulseGenerator|s_counter2\(26) & !\RegPulseGenerator|s_counter2[25]~82\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter2\(26),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter2[25]~82\,
	combout => \RegPulseGenerator|s_counter2[26]~83_combout\,
	cout => \RegPulseGenerator|s_counter2[26]~84\);

-- Location: FF_X106_Y22_N23
\RegPulseGenerator|s_counter2[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter2[26]~83_combout\,
	sclr => \RegPulseGenerator|count_proc2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter2\(26));

-- Location: LCCOMB_X106_Y22_N24
\RegPulseGenerator|s_counter2[27]~85\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter2[27]~85_combout\ = (\RegPulseGenerator|s_counter2\(27) & (!\RegPulseGenerator|s_counter2[26]~84\)) # (!\RegPulseGenerator|s_counter2\(27) & ((\RegPulseGenerator|s_counter2[26]~84\) # (GND)))
-- \RegPulseGenerator|s_counter2[27]~86\ = CARRY((!\RegPulseGenerator|s_counter2[26]~84\) # (!\RegPulseGenerator|s_counter2\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter2\(27),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter2[26]~84\,
	combout => \RegPulseGenerator|s_counter2[27]~85_combout\,
	cout => \RegPulseGenerator|s_counter2[27]~86\);

-- Location: FF_X106_Y22_N25
\RegPulseGenerator|s_counter2[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter2[27]~85_combout\,
	sclr => \RegPulseGenerator|count_proc2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter2\(27));

-- Location: LCCOMB_X107_Y22_N16
\RegPulseGenerator|Equal1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|Equal1~2_combout\ = (!\RegPulseGenerator|s_counter2\(25) & (!\RegPulseGenerator|s_counter2\(26) & (!\RegPulseGenerator|s_counter2\(24) & !\RegPulseGenerator|s_counter2\(27))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter2\(25),
	datab => \RegPulseGenerator|s_counter2\(26),
	datac => \RegPulseGenerator|s_counter2\(24),
	datad => \RegPulseGenerator|s_counter2\(27),
	combout => \RegPulseGenerator|Equal1~2_combout\);

-- Location: LCCOMB_X106_Y22_N26
\RegPulseGenerator|s_counter2[28]~87\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter2[28]~87_combout\ = (\RegPulseGenerator|s_counter2\(28) & (\RegPulseGenerator|s_counter2[27]~86\ $ (GND))) # (!\RegPulseGenerator|s_counter2\(28) & (!\RegPulseGenerator|s_counter2[27]~86\ & VCC))
-- \RegPulseGenerator|s_counter2[28]~88\ = CARRY((\RegPulseGenerator|s_counter2\(28) & !\RegPulseGenerator|s_counter2[27]~86\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter2\(28),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter2[27]~86\,
	combout => \RegPulseGenerator|s_counter2[28]~87_combout\,
	cout => \RegPulseGenerator|s_counter2[28]~88\);

-- Location: FF_X106_Y22_N27
\RegPulseGenerator|s_counter2[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter2[28]~87_combout\,
	sclr => \RegPulseGenerator|count_proc2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter2\(28));

-- Location: LCCOMB_X106_Y22_N28
\RegPulseGenerator|s_counter2[29]~89\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter2[29]~89_combout\ = (\RegPulseGenerator|s_counter2\(29) & (!\RegPulseGenerator|s_counter2[28]~88\)) # (!\RegPulseGenerator|s_counter2\(29) & ((\RegPulseGenerator|s_counter2[28]~88\) # (GND)))
-- \RegPulseGenerator|s_counter2[29]~90\ = CARRY((!\RegPulseGenerator|s_counter2[28]~88\) # (!\RegPulseGenerator|s_counter2\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter2\(29),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter2[28]~88\,
	combout => \RegPulseGenerator|s_counter2[29]~89_combout\,
	cout => \RegPulseGenerator|s_counter2[29]~90\);

-- Location: FF_X106_Y22_N29
\RegPulseGenerator|s_counter2[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter2[29]~89_combout\,
	sclr => \RegPulseGenerator|count_proc2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter2\(29));

-- Location: LCCOMB_X106_Y22_N30
\RegPulseGenerator|s_counter2[30]~91\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter2[30]~91_combout\ = \RegPulseGenerator|s_counter2\(30) $ (!\RegPulseGenerator|s_counter2[29]~90\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter2\(30),
	cin => \RegPulseGenerator|s_counter2[29]~90\,
	combout => \RegPulseGenerator|s_counter2[30]~91_combout\);

-- Location: FF_X106_Y22_N31
\RegPulseGenerator|s_counter2[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter2[30]~91_combout\,
	sclr => \RegPulseGenerator|count_proc2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter2\(30));

-- Location: LCCOMB_X107_Y22_N14
\RegPulseGenerator|Equal1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|Equal1~3_combout\ = (!\RegPulseGenerator|s_counter2\(29) & (!\RegPulseGenerator|s_counter2\(30) & !\RegPulseGenerator|s_counter2\(28)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter2\(29),
	datac => \RegPulseGenerator|s_counter2\(30),
	datad => \RegPulseGenerator|s_counter2\(28),
	combout => \RegPulseGenerator|Equal1~3_combout\);

-- Location: LCCOMB_X107_Y22_N18
\RegPulseGenerator|Equal1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|Equal1~1_combout\ = (!\RegPulseGenerator|s_counter2\(21) & (!\RegPulseGenerator|s_counter2\(22) & (!\RegPulseGenerator|s_counter2\(23) & !\RegPulseGenerator|s_counter2\(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter2\(21),
	datab => \RegPulseGenerator|s_counter2\(22),
	datac => \RegPulseGenerator|s_counter2\(23),
	datad => \RegPulseGenerator|s_counter2\(20),
	combout => \RegPulseGenerator|Equal1~1_combout\);

-- Location: LCCOMB_X107_Y22_N8
\RegPulseGenerator|Equal1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|Equal1~4_combout\ = (\RegPulseGenerator|Equal1~0_combout\ & (\RegPulseGenerator|Equal1~2_combout\ & (\RegPulseGenerator|Equal1~3_combout\ & \RegPulseGenerator|Equal1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|Equal1~0_combout\,
	datab => \RegPulseGenerator|Equal1~2_combout\,
	datac => \RegPulseGenerator|Equal1~3_combout\,
	datad => \RegPulseGenerator|Equal1~1_combout\,
	combout => \RegPulseGenerator|Equal1~4_combout\);

-- Location: LCCOMB_X107_Y22_N10
\RegPulseGenerator|Equal1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|Equal1~8_combout\ = (!\RegPulseGenerator|s_counter2\(15) & (!\RegPulseGenerator|s_counter2\(9) & (!\RegPulseGenerator|s_counter2\(8) & !\RegPulseGenerator|s_counter2\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter2\(15),
	datab => \RegPulseGenerator|s_counter2\(9),
	datac => \RegPulseGenerator|s_counter2\(8),
	datad => \RegPulseGenerator|s_counter2\(14),
	combout => \RegPulseGenerator|Equal1~8_combout\);

-- Location: LCCOMB_X107_Y22_N24
\RegPulseGenerator|Equal1~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|Equal1~7_combout\ = (!\RegPulseGenerator|s_counter2\(2) & (!\RegPulseGenerator|s_counter2\(6) & (!\RegPulseGenerator|s_counter2\(3) & !\RegPulseGenerator|s_counter2\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter2\(2),
	datab => \RegPulseGenerator|s_counter2\(6),
	datac => \RegPulseGenerator|s_counter2\(3),
	datad => \RegPulseGenerator|s_counter2\(7),
	combout => \RegPulseGenerator|Equal1~7_combout\);

-- Location: LCCOMB_X107_Y22_N6
\RegPulseGenerator|Equal1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|Equal1~6_combout\ = (!\RegPulseGenerator|s_counter2\(1) & (!\RegPulseGenerator|s_counter2\(5) & (!\RegPulseGenerator|s_counter2\(4) & !\RegPulseGenerator|s_counter2\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter2\(1),
	datab => \RegPulseGenerator|s_counter2\(5),
	datac => \RegPulseGenerator|s_counter2\(4),
	datad => \RegPulseGenerator|s_counter2\(0),
	combout => \RegPulseGenerator|Equal1~6_combout\);

-- Location: LCCOMB_X107_Y22_N4
\RegPulseGenerator|Equal1~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|Equal1~9_combout\ = (\RegPulseGenerator|Equal1~8_combout\ & (\RegPulseGenerator|Equal1~7_combout\ & (\RegPulseGenerator|Equal1~5_combout\ & \RegPulseGenerator|Equal1~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|Equal1~8_combout\,
	datab => \RegPulseGenerator|Equal1~7_combout\,
	datac => \RegPulseGenerator|Equal1~5_combout\,
	datad => \RegPulseGenerator|Equal1~6_combout\,
	combout => \RegPulseGenerator|Equal1~9_combout\);

-- Location: LCCOMB_X107_Y22_N30
\DispCntrl|Present_state~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \DispCntrl|Present_state~21_combout\ = (\SW[0]~input_o\) # ((\RegPulseGenerator|Equal1~4_combout\ & \RegPulseGenerator|Equal1~9_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|Equal1~4_combout\,
	datac => \RegPulseGenerator|Equal1~9_combout\,
	datad => \SW[0]~input_o\,
	combout => \DispCntrl|Present_state~21_combout\);

-- Location: FF_X107_Y17_N31
\DispCntrl|Present_state.idle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \DispCntrl|Present_state.idle~0_combout\,
	ena => \DispCntrl|Present_state~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DispCntrl|Present_state.idle~q\);

-- Location: LCCOMB_X107_Y17_N24
\DispCntrl|Present_state~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \DispCntrl|Present_state~25_combout\ = (\DispCntrl|Present_state.s2~q\ & !\SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DispCntrl|Present_state.s2~q\,
	datad => \SW[0]~input_o\,
	combout => \DispCntrl|Present_state~25_combout\);

-- Location: FF_X107_Y17_N25
\DispCntrl|Present_state.s3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \DispCntrl|Present_state~25_combout\,
	ena => \DispCntrl|Present_state~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DispCntrl|Present_state.s3~q\);

-- Location: LCCOMB_X107_Y17_N10
\DispCntrl|Present_state~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \DispCntrl|Present_state~20_combout\ = (\DispCntrl|Present_state.s3~q\ & !\SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \DispCntrl|Present_state.s3~q\,
	datad => \SW[0]~input_o\,
	combout => \DispCntrl|Present_state~20_combout\);

-- Location: FF_X107_Y17_N11
\DispCntrl|Present_state.s4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \DispCntrl|Present_state~20_combout\,
	ena => \DispCntrl|Present_state~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DispCntrl|Present_state.s4~q\);

-- Location: LCCOMB_X107_Y17_N6
\DispCntrl|Present_state~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \DispCntrl|Present_state~27_combout\ = (\DispCntrl|Present_state.s4~q\ & !\SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DispCntrl|Present_state.s4~q\,
	datad => \SW[0]~input_o\,
	combout => \DispCntrl|Present_state~27_combout\);

-- Location: FF_X107_Y17_N7
\DispCntrl|Present_state.s5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \DispCntrl|Present_state~27_combout\,
	ena => \DispCntrl|Present_state~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DispCntrl|Present_state.s5~q\);

-- Location: LCCOMB_X107_Y17_N0
\DispCntrl|Present_state~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \DispCntrl|Present_state~24_combout\ = (\DispCntrl|Present_state.s5~q\ & !\SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DispCntrl|Present_state.s5~q\,
	datad => \SW[0]~input_o\,
	combout => \DispCntrl|Present_state~24_combout\);

-- Location: FF_X107_Y17_N1
\DispCntrl|Present_state.s6\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \DispCntrl|Present_state~24_combout\,
	ena => \DispCntrl|Present_state~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DispCntrl|Present_state.s6~q\);

-- Location: LCCOMB_X107_Y17_N14
\DispCntrl|Present_state~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \DispCntrl|Present_state~26_combout\ = (\DispCntrl|Present_state.s6~q\ & !\SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \DispCntrl|Present_state.s6~q\,
	datad => \SW[0]~input_o\,
	combout => \DispCntrl|Present_state~26_combout\);

-- Location: FF_X107_Y17_N15
\DispCntrl|Present_state.s7\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \DispCntrl|Present_state~26_combout\,
	ena => \DispCntrl|Present_state~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DispCntrl|Present_state.s7~q\);

-- Location: LCCOMB_X107_Y17_N8
\DispCntrl|Present_state~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \DispCntrl|Present_state~22_combout\ = (\DispCntrl|Present_state.s7~q\ & !\SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DispCntrl|Present_state.s7~q\,
	datad => \SW[0]~input_o\,
	combout => \DispCntrl|Present_state~22_combout\);

-- Location: FF_X107_Y17_N9
\DispCntrl|Present_state.s8\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \DispCntrl|Present_state~22_combout\,
	ena => \DispCntrl|Present_state~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DispCntrl|Present_state.s8~q\);

-- Location: LCCOMB_X107_Y17_N16
\DispCntrl|Nstate.s1\ : cycloneive_lcell_comb
-- Equation(s):
-- \DispCntrl|Nstate.s1~combout\ = (\DispCntrl|Present_state.s8~q\) # (!\DispCntrl|Present_state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DispCntrl|Present_state.idle~q\,
	datac => \DispCntrl|Present_state.s8~q\,
	combout => \DispCntrl|Nstate.s1~combout\);

-- Location: FF_X107_Y17_N17
\DispCntrl|Present_state.s1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \DispCntrl|Nstate.s1~combout\,
	sclr => \SW[0]~input_o\,
	ena => \DispCntrl|Present_state~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DispCntrl|Present_state.s1~q\);

-- Location: LCCOMB_X107_Y17_N22
\DispCntrl|Present_state~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \DispCntrl|Present_state~23_combout\ = (\DispCntrl|Present_state.s1~q\ & !\SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \DispCntrl|Present_state.s1~q\,
	datad => \SW[0]~input_o\,
	combout => \DispCntrl|Present_state~23_combout\);

-- Location: FF_X107_Y17_N23
\DispCntrl|Present_state.s2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \DispCntrl|Present_state~23_combout\,
	ena => \DispCntrl|Present_state~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DispCntrl|Present_state.s2~q\);

-- Location: LCCOMB_X107_Y17_N18
\DispCntrl|WideOr2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \DispCntrl|WideOr2~0_combout\ = (\DispCntrl|Present_state.s2~q\) # ((\DispCntrl|Present_state.s6~q\) # ((\DispCntrl|Present_state.s8~q\) # (\DispCntrl|Present_state.s4~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DispCntrl|Present_state.s2~q\,
	datab => \DispCntrl|Present_state.s6~q\,
	datac => \DispCntrl|Present_state.s8~q\,
	datad => \DispCntrl|Present_state.s4~q\,
	combout => \DispCntrl|WideOr2~0_combout\);

-- Location: LCCOMB_X111_Y17_N28
\CounterDosAnos2|s_value~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosAnos2|s_value~4_combout\ = (!\SW[0]~input_o\ & !\CounterDosAnos2|s_value\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datac => \CounterDosAnos2|s_value\(0),
	combout => \CounterDosAnos2|s_value~4_combout\);

-- Location: LCCOMB_X109_Y17_N16
\CounterDosAnos1|s_value~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosAnos1|s_value~4_combout\ = (!\SW[0]~input_o\ & !\CounterDosAnos1|s_value\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datac => \CounterDosAnos1|s_value\(0),
	combout => \CounterDosAnos1|s_value~4_combout\);

-- Location: LCCOMB_X105_Y14_N20
\DiasDoMes|s_value[31]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasDoMes|s_value[31]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \DiasDoMes|s_value[31]~feeder_combout\);

-- Location: FF_X105_Y14_N21
\DiasDoMes|s_value[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \DiasDoMes|s_value[31]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DiasDoMes|s_value\(31));

-- Location: LCCOMB_X109_Y19_N2
\RegPulseGenerator|s_counter[0]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter[0]~31_combout\ = \RegPulseGenerator|s_counter\(0) $ (VCC)
-- \RegPulseGenerator|s_counter[0]~32\ = CARRY(\RegPulseGenerator|s_counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter\(0),
	datad => VCC,
	combout => \RegPulseGenerator|s_counter[0]~31_combout\,
	cout => \RegPulseGenerator|s_counter[0]~32\);

-- Location: LCCOMB_X109_Y19_N14
\RegPulseGenerator|s_counter[6]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter[6]~43_combout\ = (\RegPulseGenerator|s_counter\(6) & (\RegPulseGenerator|s_counter[5]~42\ $ (GND))) # (!\RegPulseGenerator|s_counter\(6) & (!\RegPulseGenerator|s_counter[5]~42\ & VCC))
-- \RegPulseGenerator|s_counter[6]~44\ = CARRY((\RegPulseGenerator|s_counter\(6) & !\RegPulseGenerator|s_counter[5]~42\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter\(6),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter[5]~42\,
	combout => \RegPulseGenerator|s_counter[6]~43_combout\,
	cout => \RegPulseGenerator|s_counter[6]~44\);

-- Location: LCCOMB_X109_Y19_N16
\RegPulseGenerator|s_counter[7]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter[7]~45_combout\ = (\RegPulseGenerator|s_counter\(7) & (!\RegPulseGenerator|s_counter[6]~44\)) # (!\RegPulseGenerator|s_counter\(7) & ((\RegPulseGenerator|s_counter[6]~44\) # (GND)))
-- \RegPulseGenerator|s_counter[7]~46\ = CARRY((!\RegPulseGenerator|s_counter[6]~44\) # (!\RegPulseGenerator|s_counter\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter\(7),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter[6]~44\,
	combout => \RegPulseGenerator|s_counter[7]~45_combout\,
	cout => \RegPulseGenerator|s_counter[7]~46\);

-- Location: FF_X109_Y19_N17
\RegPulseGenerator|s_counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter[7]~45_combout\,
	sclr => \RegPulseGenerator|count_proc~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter\(7));

-- Location: LCCOMB_X109_Y19_N18
\RegPulseGenerator|s_counter[8]~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter[8]~47_combout\ = (\RegPulseGenerator|s_counter\(8) & (\RegPulseGenerator|s_counter[7]~46\ $ (GND))) # (!\RegPulseGenerator|s_counter\(8) & (!\RegPulseGenerator|s_counter[7]~46\ & VCC))
-- \RegPulseGenerator|s_counter[8]~48\ = CARRY((\RegPulseGenerator|s_counter\(8) & !\RegPulseGenerator|s_counter[7]~46\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter\(8),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter[7]~46\,
	combout => \RegPulseGenerator|s_counter[8]~47_combout\,
	cout => \RegPulseGenerator|s_counter[8]~48\);

-- Location: FF_X109_Y19_N19
\RegPulseGenerator|s_counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter[8]~47_combout\,
	sclr => \RegPulseGenerator|count_proc~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter\(8));

-- Location: LCCOMB_X109_Y19_N20
\RegPulseGenerator|s_counter[9]~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter[9]~49_combout\ = (\RegPulseGenerator|s_counter\(9) & (!\RegPulseGenerator|s_counter[8]~48\)) # (!\RegPulseGenerator|s_counter\(9) & ((\RegPulseGenerator|s_counter[8]~48\) # (GND)))
-- \RegPulseGenerator|s_counter[9]~50\ = CARRY((!\RegPulseGenerator|s_counter[8]~48\) # (!\RegPulseGenerator|s_counter\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter\(9),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter[8]~48\,
	combout => \RegPulseGenerator|s_counter[9]~49_combout\,
	cout => \RegPulseGenerator|s_counter[9]~50\);

-- Location: FF_X109_Y19_N21
\RegPulseGenerator|s_counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter[9]~49_combout\,
	sclr => \RegPulseGenerator|count_proc~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter\(9));

-- Location: LCCOMB_X109_Y19_N22
\RegPulseGenerator|s_counter[10]~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter[10]~51_combout\ = (\RegPulseGenerator|s_counter\(10) & (\RegPulseGenerator|s_counter[9]~50\ $ (GND))) # (!\RegPulseGenerator|s_counter\(10) & (!\RegPulseGenerator|s_counter[9]~50\ & VCC))
-- \RegPulseGenerator|s_counter[10]~52\ = CARRY((\RegPulseGenerator|s_counter\(10) & !\RegPulseGenerator|s_counter[9]~50\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter\(10),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter[9]~50\,
	combout => \RegPulseGenerator|s_counter[10]~51_combout\,
	cout => \RegPulseGenerator|s_counter[10]~52\);

-- Location: FF_X109_Y19_N23
\RegPulseGenerator|s_counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter[10]~51_combout\,
	sclr => \RegPulseGenerator|count_proc~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter\(10));

-- Location: LCCOMB_X109_Y19_N24
\RegPulseGenerator|s_counter[11]~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter[11]~53_combout\ = (\RegPulseGenerator|s_counter\(11) & (!\RegPulseGenerator|s_counter[10]~52\)) # (!\RegPulseGenerator|s_counter\(11) & ((\RegPulseGenerator|s_counter[10]~52\) # (GND)))
-- \RegPulseGenerator|s_counter[11]~54\ = CARRY((!\RegPulseGenerator|s_counter[10]~52\) # (!\RegPulseGenerator|s_counter\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter\(11),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter[10]~52\,
	combout => \RegPulseGenerator|s_counter[11]~53_combout\,
	cout => \RegPulseGenerator|s_counter[11]~54\);

-- Location: FF_X109_Y19_N25
\RegPulseGenerator|s_counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter[11]~53_combout\,
	sclr => \RegPulseGenerator|count_proc~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter\(11));

-- Location: LCCOMB_X109_Y19_N26
\RegPulseGenerator|s_counter[12]~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter[12]~55_combout\ = (\RegPulseGenerator|s_counter\(12) & (\RegPulseGenerator|s_counter[11]~54\ $ (GND))) # (!\RegPulseGenerator|s_counter\(12) & (!\RegPulseGenerator|s_counter[11]~54\ & VCC))
-- \RegPulseGenerator|s_counter[12]~56\ = CARRY((\RegPulseGenerator|s_counter\(12) & !\RegPulseGenerator|s_counter[11]~54\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter\(12),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter[11]~54\,
	combout => \RegPulseGenerator|s_counter[12]~55_combout\,
	cout => \RegPulseGenerator|s_counter[12]~56\);

-- Location: FF_X109_Y19_N27
\RegPulseGenerator|s_counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter[12]~55_combout\,
	sclr => \RegPulseGenerator|count_proc~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter\(12));

-- Location: LCCOMB_X109_Y19_N28
\RegPulseGenerator|s_counter[13]~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter[13]~57_combout\ = (\RegPulseGenerator|s_counter\(13) & (!\RegPulseGenerator|s_counter[12]~56\)) # (!\RegPulseGenerator|s_counter\(13) & ((\RegPulseGenerator|s_counter[12]~56\) # (GND)))
-- \RegPulseGenerator|s_counter[13]~58\ = CARRY((!\RegPulseGenerator|s_counter[12]~56\) # (!\RegPulseGenerator|s_counter\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter\(13),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter[12]~56\,
	combout => \RegPulseGenerator|s_counter[13]~57_combout\,
	cout => \RegPulseGenerator|s_counter[13]~58\);

-- Location: FF_X109_Y19_N29
\RegPulseGenerator|s_counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter[13]~57_combout\,
	sclr => \RegPulseGenerator|count_proc~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter\(13));

-- Location: LCCOMB_X109_Y19_N30
\RegPulseGenerator|s_counter[14]~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter[14]~59_combout\ = (\RegPulseGenerator|s_counter\(14) & (\RegPulseGenerator|s_counter[13]~58\ $ (GND))) # (!\RegPulseGenerator|s_counter\(14) & (!\RegPulseGenerator|s_counter[13]~58\ & VCC))
-- \RegPulseGenerator|s_counter[14]~60\ = CARRY((\RegPulseGenerator|s_counter\(14) & !\RegPulseGenerator|s_counter[13]~58\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter\(14),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter[13]~58\,
	combout => \RegPulseGenerator|s_counter[14]~59_combout\,
	cout => \RegPulseGenerator|s_counter[14]~60\);

-- Location: FF_X109_Y19_N31
\RegPulseGenerator|s_counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter[14]~59_combout\,
	sclr => \RegPulseGenerator|count_proc~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter\(14));

-- Location: LCCOMB_X109_Y18_N0
\RegPulseGenerator|s_counter[15]~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter[15]~61_combout\ = (\RegPulseGenerator|s_counter\(15) & (!\RegPulseGenerator|s_counter[14]~60\)) # (!\RegPulseGenerator|s_counter\(15) & ((\RegPulseGenerator|s_counter[14]~60\) # (GND)))
-- \RegPulseGenerator|s_counter[15]~62\ = CARRY((!\RegPulseGenerator|s_counter[14]~60\) # (!\RegPulseGenerator|s_counter\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter\(15),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter[14]~60\,
	combout => \RegPulseGenerator|s_counter[15]~61_combout\,
	cout => \RegPulseGenerator|s_counter[15]~62\);

-- Location: FF_X109_Y18_N1
\RegPulseGenerator|s_counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter[15]~61_combout\,
	sclr => \RegPulseGenerator|count_proc~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter\(15));

-- Location: LCCOMB_X109_Y18_N2
\RegPulseGenerator|s_counter[16]~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter[16]~63_combout\ = (\RegPulseGenerator|s_counter\(16) & (\RegPulseGenerator|s_counter[15]~62\ $ (GND))) # (!\RegPulseGenerator|s_counter\(16) & (!\RegPulseGenerator|s_counter[15]~62\ & VCC))
-- \RegPulseGenerator|s_counter[16]~64\ = CARRY((\RegPulseGenerator|s_counter\(16) & !\RegPulseGenerator|s_counter[15]~62\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter\(16),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter[15]~62\,
	combout => \RegPulseGenerator|s_counter[16]~63_combout\,
	cout => \RegPulseGenerator|s_counter[16]~64\);

-- Location: FF_X109_Y18_N3
\RegPulseGenerator|s_counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter[16]~63_combout\,
	sclr => \RegPulseGenerator|count_proc~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter\(16));

-- Location: LCCOMB_X109_Y18_N4
\RegPulseGenerator|s_counter[17]~65\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter[17]~65_combout\ = (\RegPulseGenerator|s_counter\(17) & (!\RegPulseGenerator|s_counter[16]~64\)) # (!\RegPulseGenerator|s_counter\(17) & ((\RegPulseGenerator|s_counter[16]~64\) # (GND)))
-- \RegPulseGenerator|s_counter[17]~66\ = CARRY((!\RegPulseGenerator|s_counter[16]~64\) # (!\RegPulseGenerator|s_counter\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter\(17),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter[16]~64\,
	combout => \RegPulseGenerator|s_counter[17]~65_combout\,
	cout => \RegPulseGenerator|s_counter[17]~66\);

-- Location: FF_X109_Y18_N5
\RegPulseGenerator|s_counter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter[17]~65_combout\,
	sclr => \RegPulseGenerator|count_proc~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter\(17));

-- Location: LCCOMB_X109_Y18_N6
\RegPulseGenerator|s_counter[18]~67\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter[18]~67_combout\ = (\RegPulseGenerator|s_counter\(18) & (\RegPulseGenerator|s_counter[17]~66\ $ (GND))) # (!\RegPulseGenerator|s_counter\(18) & (!\RegPulseGenerator|s_counter[17]~66\ & VCC))
-- \RegPulseGenerator|s_counter[18]~68\ = CARRY((\RegPulseGenerator|s_counter\(18) & !\RegPulseGenerator|s_counter[17]~66\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter\(18),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter[17]~66\,
	combout => \RegPulseGenerator|s_counter[18]~67_combout\,
	cout => \RegPulseGenerator|s_counter[18]~68\);

-- Location: FF_X109_Y18_N7
\RegPulseGenerator|s_counter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter[18]~67_combout\,
	sclr => \RegPulseGenerator|count_proc~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter\(18));

-- Location: LCCOMB_X109_Y18_N8
\RegPulseGenerator|s_counter[19]~69\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter[19]~69_combout\ = (\RegPulseGenerator|s_counter\(19) & (!\RegPulseGenerator|s_counter[18]~68\)) # (!\RegPulseGenerator|s_counter\(19) & ((\RegPulseGenerator|s_counter[18]~68\) # (GND)))
-- \RegPulseGenerator|s_counter[19]~70\ = CARRY((!\RegPulseGenerator|s_counter[18]~68\) # (!\RegPulseGenerator|s_counter\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter\(19),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter[18]~68\,
	combout => \RegPulseGenerator|s_counter[19]~69_combout\,
	cout => \RegPulseGenerator|s_counter[19]~70\);

-- Location: FF_X109_Y18_N9
\RegPulseGenerator|s_counter[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter[19]~69_combout\,
	sclr => \RegPulseGenerator|count_proc~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter\(19));

-- Location: LCCOMB_X109_Y18_N10
\RegPulseGenerator|s_counter[20]~71\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter[20]~71_combout\ = (\RegPulseGenerator|s_counter\(20) & (\RegPulseGenerator|s_counter[19]~70\ $ (GND))) # (!\RegPulseGenerator|s_counter\(20) & (!\RegPulseGenerator|s_counter[19]~70\ & VCC))
-- \RegPulseGenerator|s_counter[20]~72\ = CARRY((\RegPulseGenerator|s_counter\(20) & !\RegPulseGenerator|s_counter[19]~70\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter\(20),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter[19]~70\,
	combout => \RegPulseGenerator|s_counter[20]~71_combout\,
	cout => \RegPulseGenerator|s_counter[20]~72\);

-- Location: FF_X109_Y18_N11
\RegPulseGenerator|s_counter[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter[20]~71_combout\,
	sclr => \RegPulseGenerator|count_proc~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter\(20));

-- Location: LCCOMB_X109_Y18_N12
\RegPulseGenerator|s_counter[21]~73\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter[21]~73_combout\ = (\RegPulseGenerator|s_counter\(21) & (!\RegPulseGenerator|s_counter[20]~72\)) # (!\RegPulseGenerator|s_counter\(21) & ((\RegPulseGenerator|s_counter[20]~72\) # (GND)))
-- \RegPulseGenerator|s_counter[21]~74\ = CARRY((!\RegPulseGenerator|s_counter[20]~72\) # (!\RegPulseGenerator|s_counter\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter\(21),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter[20]~72\,
	combout => \RegPulseGenerator|s_counter[21]~73_combout\,
	cout => \RegPulseGenerator|s_counter[21]~74\);

-- Location: FF_X109_Y18_N13
\RegPulseGenerator|s_counter[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter[21]~73_combout\,
	sclr => \RegPulseGenerator|count_proc~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter\(21));

-- Location: LCCOMB_X109_Y18_N14
\RegPulseGenerator|s_counter[22]~75\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter[22]~75_combout\ = (\RegPulseGenerator|s_counter\(22) & (\RegPulseGenerator|s_counter[21]~74\ $ (GND))) # (!\RegPulseGenerator|s_counter\(22) & (!\RegPulseGenerator|s_counter[21]~74\ & VCC))
-- \RegPulseGenerator|s_counter[22]~76\ = CARRY((\RegPulseGenerator|s_counter\(22) & !\RegPulseGenerator|s_counter[21]~74\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter\(22),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter[21]~74\,
	combout => \RegPulseGenerator|s_counter[22]~75_combout\,
	cout => \RegPulseGenerator|s_counter[22]~76\);

-- Location: FF_X109_Y18_N15
\RegPulseGenerator|s_counter[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter[22]~75_combout\,
	sclr => \RegPulseGenerator|count_proc~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter\(22));

-- Location: LCCOMB_X109_Y18_N16
\RegPulseGenerator|s_counter[23]~77\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter[23]~77_combout\ = (\RegPulseGenerator|s_counter\(23) & (!\RegPulseGenerator|s_counter[22]~76\)) # (!\RegPulseGenerator|s_counter\(23) & ((\RegPulseGenerator|s_counter[22]~76\) # (GND)))
-- \RegPulseGenerator|s_counter[23]~78\ = CARRY((!\RegPulseGenerator|s_counter[22]~76\) # (!\RegPulseGenerator|s_counter\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter\(23),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter[22]~76\,
	combout => \RegPulseGenerator|s_counter[23]~77_combout\,
	cout => \RegPulseGenerator|s_counter[23]~78\);

-- Location: FF_X109_Y18_N17
\RegPulseGenerator|s_counter[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter[23]~77_combout\,
	sclr => \RegPulseGenerator|count_proc~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter\(23));

-- Location: LCCOMB_X109_Y18_N18
\RegPulseGenerator|s_counter[24]~79\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter[24]~79_combout\ = (\RegPulseGenerator|s_counter\(24) & (\RegPulseGenerator|s_counter[23]~78\ $ (GND))) # (!\RegPulseGenerator|s_counter\(24) & (!\RegPulseGenerator|s_counter[23]~78\ & VCC))
-- \RegPulseGenerator|s_counter[24]~80\ = CARRY((\RegPulseGenerator|s_counter\(24) & !\RegPulseGenerator|s_counter[23]~78\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter\(24),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter[23]~78\,
	combout => \RegPulseGenerator|s_counter[24]~79_combout\,
	cout => \RegPulseGenerator|s_counter[24]~80\);

-- Location: FF_X109_Y18_N19
\RegPulseGenerator|s_counter[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter[24]~79_combout\,
	sclr => \RegPulseGenerator|count_proc~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter\(24));

-- Location: LCCOMB_X109_Y18_N20
\RegPulseGenerator|s_counter[25]~81\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter[25]~81_combout\ = (\RegPulseGenerator|s_counter\(25) & (!\RegPulseGenerator|s_counter[24]~80\)) # (!\RegPulseGenerator|s_counter\(25) & ((\RegPulseGenerator|s_counter[24]~80\) # (GND)))
-- \RegPulseGenerator|s_counter[25]~82\ = CARRY((!\RegPulseGenerator|s_counter[24]~80\) # (!\RegPulseGenerator|s_counter\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter\(25),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter[24]~80\,
	combout => \RegPulseGenerator|s_counter[25]~81_combout\,
	cout => \RegPulseGenerator|s_counter[25]~82\);

-- Location: FF_X109_Y18_N21
\RegPulseGenerator|s_counter[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter[25]~81_combout\,
	sclr => \RegPulseGenerator|count_proc~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter\(25));

-- Location: LCCOMB_X109_Y18_N22
\RegPulseGenerator|s_counter[26]~83\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter[26]~83_combout\ = (\RegPulseGenerator|s_counter\(26) & (\RegPulseGenerator|s_counter[25]~82\ $ (GND))) # (!\RegPulseGenerator|s_counter\(26) & (!\RegPulseGenerator|s_counter[25]~82\ & VCC))
-- \RegPulseGenerator|s_counter[26]~84\ = CARRY((\RegPulseGenerator|s_counter\(26) & !\RegPulseGenerator|s_counter[25]~82\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter\(26),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter[25]~82\,
	combout => \RegPulseGenerator|s_counter[26]~83_combout\,
	cout => \RegPulseGenerator|s_counter[26]~84\);

-- Location: FF_X109_Y18_N23
\RegPulseGenerator|s_counter[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter[26]~83_combout\,
	sclr => \RegPulseGenerator|count_proc~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter\(26));

-- Location: LCCOMB_X109_Y18_N24
\RegPulseGenerator|s_counter[27]~85\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter[27]~85_combout\ = (\RegPulseGenerator|s_counter\(27) & (!\RegPulseGenerator|s_counter[26]~84\)) # (!\RegPulseGenerator|s_counter\(27) & ((\RegPulseGenerator|s_counter[26]~84\) # (GND)))
-- \RegPulseGenerator|s_counter[27]~86\ = CARRY((!\RegPulseGenerator|s_counter[26]~84\) # (!\RegPulseGenerator|s_counter\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter\(27),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter[26]~84\,
	combout => \RegPulseGenerator|s_counter[27]~85_combout\,
	cout => \RegPulseGenerator|s_counter[27]~86\);

-- Location: FF_X109_Y18_N25
\RegPulseGenerator|s_counter[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter[27]~85_combout\,
	sclr => \RegPulseGenerator|count_proc~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter\(27));

-- Location: LCCOMB_X109_Y18_N26
\RegPulseGenerator|s_counter[28]~87\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter[28]~87_combout\ = (\RegPulseGenerator|s_counter\(28) & (\RegPulseGenerator|s_counter[27]~86\ $ (GND))) # (!\RegPulseGenerator|s_counter\(28) & (!\RegPulseGenerator|s_counter[27]~86\ & VCC))
-- \RegPulseGenerator|s_counter[28]~88\ = CARRY((\RegPulseGenerator|s_counter\(28) & !\RegPulseGenerator|s_counter[27]~86\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter\(28),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter[27]~86\,
	combout => \RegPulseGenerator|s_counter[28]~87_combout\,
	cout => \RegPulseGenerator|s_counter[28]~88\);

-- Location: FF_X109_Y18_N27
\RegPulseGenerator|s_counter[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter[28]~87_combout\,
	sclr => \RegPulseGenerator|count_proc~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter\(28));

-- Location: LCCOMB_X109_Y18_N28
\RegPulseGenerator|s_counter[29]~89\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter[29]~89_combout\ = (\RegPulseGenerator|s_counter\(29) & (!\RegPulseGenerator|s_counter[28]~88\)) # (!\RegPulseGenerator|s_counter\(29) & ((\RegPulseGenerator|s_counter[28]~88\) # (GND)))
-- \RegPulseGenerator|s_counter[29]~90\ = CARRY((!\RegPulseGenerator|s_counter[28]~88\) # (!\RegPulseGenerator|s_counter\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter\(29),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter[28]~88\,
	combout => \RegPulseGenerator|s_counter[29]~89_combout\,
	cout => \RegPulseGenerator|s_counter[29]~90\);

-- Location: FF_X109_Y18_N29
\RegPulseGenerator|s_counter[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter[29]~89_combout\,
	sclr => \RegPulseGenerator|count_proc~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter\(29));

-- Location: LCCOMB_X110_Y18_N20
\RegPulseGenerator|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|Equal0~1_combout\ = (!\RegPulseGenerator|s_counter\(29) & (!\RegPulseGenerator|s_counter\(27) & (!\RegPulseGenerator|s_counter\(28) & !\RegPulseGenerator|s_counter\(26))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter\(29),
	datab => \RegPulseGenerator|s_counter\(27),
	datac => \RegPulseGenerator|s_counter\(28),
	datad => \RegPulseGenerator|s_counter\(26),
	combout => \RegPulseGenerator|Equal0~1_combout\);

-- Location: LCCOMB_X109_Y18_N30
\RegPulseGenerator|s_counter[30]~91\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter[30]~91_combout\ = \RegPulseGenerator|s_counter\(30) $ (!\RegPulseGenerator|s_counter[29]~90\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter\(30),
	cin => \RegPulseGenerator|s_counter[29]~90\,
	combout => \RegPulseGenerator|s_counter[30]~91_combout\);

-- Location: FF_X109_Y18_N31
\RegPulseGenerator|s_counter[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter[30]~91_combout\,
	sclr => \RegPulseGenerator|count_proc~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter\(30));

-- Location: LCCOMB_X110_Y18_N28
\RegPulseGenerator|count_proc~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|count_proc~5_combout\ = (\RegPulseGenerator|s_counter\(21) & (\RegPulseGenerator|s_counter\(22) & (\RegPulseGenerator|s_counter\(20) & \RegPulseGenerator|s_counter\(19))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter\(21),
	datab => \RegPulseGenerator|s_counter\(22),
	datac => \RegPulseGenerator|s_counter\(20),
	datad => \RegPulseGenerator|s_counter\(19),
	combout => \RegPulseGenerator|count_proc~5_combout\);

-- Location: LCCOMB_X110_Y18_N22
\RegPulseGenerator|count_proc~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|count_proc~6_combout\ = (\RegPulseGenerator|s_counter\(23) & \RegPulseGenerator|count_proc~5_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \RegPulseGenerator|s_counter\(23),
	datad => \RegPulseGenerator|count_proc~5_combout\,
	combout => \RegPulseGenerator|count_proc~6_combout\);

-- Location: LCCOMB_X110_Y19_N14
\RegPulseGenerator|count_proc~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|count_proc~1_combout\ = (\RegPulseGenerator|s_counter\(3) & (\RegPulseGenerator|s_counter\(2) & (\RegPulseGenerator|s_counter\(1) & \RegPulseGenerator|s_counter\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter\(3),
	datab => \RegPulseGenerator|s_counter\(2),
	datac => \RegPulseGenerator|s_counter\(1),
	datad => \RegPulseGenerator|s_counter\(0),
	combout => \RegPulseGenerator|count_proc~1_combout\);

-- Location: LCCOMB_X110_Y18_N10
\RegPulseGenerator|count_proc~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|count_proc~2_combout\ = (\RegPulseGenerator|s_counter\(6) & (\RegPulseGenerator|s_counter\(5) & (\RegPulseGenerator|s_counter\(4) & \RegPulseGenerator|count_proc~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter\(6),
	datab => \RegPulseGenerator|s_counter\(5),
	datac => \RegPulseGenerator|s_counter\(4),
	datad => \RegPulseGenerator|count_proc~1_combout\,
	combout => \RegPulseGenerator|count_proc~2_combout\);

-- Location: LCCOMB_X110_Y18_N16
\RegPulseGenerator|count_proc~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|count_proc~0_combout\ = (\RegPulseGenerator|s_counter\(14) & (\RegPulseGenerator|s_counter\(13) & (\RegPulseGenerator|s_counter\(15) & \RegPulseGenerator|s_counter\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter\(14),
	datab => \RegPulseGenerator|s_counter\(13),
	datac => \RegPulseGenerator|s_counter\(15),
	datad => \RegPulseGenerator|s_counter\(12),
	combout => \RegPulseGenerator|count_proc~0_combout\);

-- Location: LCCOMB_X109_Y19_N0
\RegPulseGenerator|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|Equal0~0_combout\ = (!\RegPulseGenerator|s_counter\(9) & (!\RegPulseGenerator|s_counter\(8) & (!\RegPulseGenerator|s_counter\(10) & !\RegPulseGenerator|s_counter\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter\(9),
	datab => \RegPulseGenerator|s_counter\(8),
	datac => \RegPulseGenerator|s_counter\(10),
	datad => \RegPulseGenerator|s_counter\(7),
	combout => \RegPulseGenerator|Equal0~0_combout\);

-- Location: LCCOMB_X110_Y18_N0
\RegPulseGenerator|count_proc~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|count_proc~3_combout\ = (\RegPulseGenerator|count_proc~0_combout\ & ((\RegPulseGenerator|count_proc~2_combout\) # ((\RegPulseGenerator|s_counter\(11)) # (!\RegPulseGenerator|Equal0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|count_proc~2_combout\,
	datab => \RegPulseGenerator|count_proc~0_combout\,
	datac => \RegPulseGenerator|s_counter\(11),
	datad => \RegPulseGenerator|Equal0~0_combout\,
	combout => \RegPulseGenerator|count_proc~3_combout\);

-- Location: LCCOMB_X110_Y18_N14
\RegPulseGenerator|count_proc~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|count_proc~4_combout\ = (\RegPulseGenerator|s_counter\(18)) # ((\RegPulseGenerator|s_counter\(17) & ((\RegPulseGenerator|s_counter\(16)) # (\RegPulseGenerator|count_proc~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter\(16),
	datab => \RegPulseGenerator|s_counter\(18),
	datac => \RegPulseGenerator|s_counter\(17),
	datad => \RegPulseGenerator|count_proc~3_combout\,
	combout => \RegPulseGenerator|count_proc~4_combout\);

-- Location: LCCOMB_X110_Y18_N24
\RegPulseGenerator|count_proc~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|count_proc~7_combout\ = (\RegPulseGenerator|s_counter\(25) & ((\RegPulseGenerator|s_counter\(24)) # ((\RegPulseGenerator|count_proc~6_combout\ & \RegPulseGenerator|count_proc~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|count_proc~6_combout\,
	datab => \RegPulseGenerator|s_counter\(24),
	datac => \RegPulseGenerator|count_proc~4_combout\,
	datad => \RegPulseGenerator|s_counter\(25),
	combout => \RegPulseGenerator|count_proc~7_combout\);

-- Location: LCCOMB_X110_Y18_N2
\RegPulseGenerator|count_proc~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|count_proc~8_combout\ = ((\RegPulseGenerator|s_counter\(30)) # ((\SW[0]~input_o\) # (\RegPulseGenerator|count_proc~7_combout\))) # (!\RegPulseGenerator|Equal0~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|Equal0~1_combout\,
	datab => \RegPulseGenerator|s_counter\(30),
	datac => \SW[0]~input_o\,
	datad => \RegPulseGenerator|count_proc~7_combout\,
	combout => \RegPulseGenerator|count_proc~8_combout\);

-- Location: FF_X109_Y19_N3
\RegPulseGenerator|s_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter[0]~31_combout\,
	sclr => \RegPulseGenerator|count_proc~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter\(0));

-- Location: LCCOMB_X109_Y19_N4
\RegPulseGenerator|s_counter[1]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter[1]~33_combout\ = (\RegPulseGenerator|s_counter\(1) & (!\RegPulseGenerator|s_counter[0]~32\)) # (!\RegPulseGenerator|s_counter\(1) & ((\RegPulseGenerator|s_counter[0]~32\) # (GND)))
-- \RegPulseGenerator|s_counter[1]~34\ = CARRY((!\RegPulseGenerator|s_counter[0]~32\) # (!\RegPulseGenerator|s_counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter\(1),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter[0]~32\,
	combout => \RegPulseGenerator|s_counter[1]~33_combout\,
	cout => \RegPulseGenerator|s_counter[1]~34\);

-- Location: FF_X109_Y19_N5
\RegPulseGenerator|s_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter[1]~33_combout\,
	sclr => \RegPulseGenerator|count_proc~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter\(1));

-- Location: LCCOMB_X109_Y19_N6
\RegPulseGenerator|s_counter[2]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter[2]~35_combout\ = (\RegPulseGenerator|s_counter\(2) & (\RegPulseGenerator|s_counter[1]~34\ $ (GND))) # (!\RegPulseGenerator|s_counter\(2) & (!\RegPulseGenerator|s_counter[1]~34\ & VCC))
-- \RegPulseGenerator|s_counter[2]~36\ = CARRY((\RegPulseGenerator|s_counter\(2) & !\RegPulseGenerator|s_counter[1]~34\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter\(2),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter[1]~34\,
	combout => \RegPulseGenerator|s_counter[2]~35_combout\,
	cout => \RegPulseGenerator|s_counter[2]~36\);

-- Location: FF_X109_Y19_N7
\RegPulseGenerator|s_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter[2]~35_combout\,
	sclr => \RegPulseGenerator|count_proc~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter\(2));

-- Location: LCCOMB_X109_Y19_N8
\RegPulseGenerator|s_counter[3]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter[3]~37_combout\ = (\RegPulseGenerator|s_counter\(3) & (!\RegPulseGenerator|s_counter[2]~36\)) # (!\RegPulseGenerator|s_counter\(3) & ((\RegPulseGenerator|s_counter[2]~36\) # (GND)))
-- \RegPulseGenerator|s_counter[3]~38\ = CARRY((!\RegPulseGenerator|s_counter[2]~36\) # (!\RegPulseGenerator|s_counter\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegPulseGenerator|s_counter\(3),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter[2]~36\,
	combout => \RegPulseGenerator|s_counter[3]~37_combout\,
	cout => \RegPulseGenerator|s_counter[3]~38\);

-- Location: FF_X109_Y19_N9
\RegPulseGenerator|s_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter[3]~37_combout\,
	sclr => \RegPulseGenerator|count_proc~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter\(3));

-- Location: LCCOMB_X109_Y19_N10
\RegPulseGenerator|s_counter[4]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter[4]~39_combout\ = (\RegPulseGenerator|s_counter\(4) & (\RegPulseGenerator|s_counter[3]~38\ $ (GND))) # (!\RegPulseGenerator|s_counter\(4) & (!\RegPulseGenerator|s_counter[3]~38\ & VCC))
-- \RegPulseGenerator|s_counter[4]~40\ = CARRY((\RegPulseGenerator|s_counter\(4) & !\RegPulseGenerator|s_counter[3]~38\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter\(4),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter[3]~38\,
	combout => \RegPulseGenerator|s_counter[4]~39_combout\,
	cout => \RegPulseGenerator|s_counter[4]~40\);

-- Location: FF_X109_Y19_N11
\RegPulseGenerator|s_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter[4]~39_combout\,
	sclr => \RegPulseGenerator|count_proc~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter\(4));

-- Location: LCCOMB_X109_Y19_N12
\RegPulseGenerator|s_counter[5]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|s_counter[5]~41_combout\ = (\RegPulseGenerator|s_counter\(5) & (!\RegPulseGenerator|s_counter[4]~40\)) # (!\RegPulseGenerator|s_counter\(5) & ((\RegPulseGenerator|s_counter[4]~40\) # (GND)))
-- \RegPulseGenerator|s_counter[5]~42\ = CARRY((!\RegPulseGenerator|s_counter[4]~40\) # (!\RegPulseGenerator|s_counter\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter\(5),
	datad => VCC,
	cin => \RegPulseGenerator|s_counter[4]~40\,
	combout => \RegPulseGenerator|s_counter[5]~41_combout\,
	cout => \RegPulseGenerator|s_counter[5]~42\);

-- Location: FF_X109_Y19_N13
\RegPulseGenerator|s_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter[5]~41_combout\,
	sclr => \RegPulseGenerator|count_proc~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter\(5));

-- Location: FF_X109_Y19_N15
\RegPulseGenerator|s_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \RegPulseGenerator|s_counter[6]~43_combout\,
	sclr => \RegPulseGenerator|count_proc~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegPulseGenerator|s_counter\(6));

-- Location: LCCOMB_X110_Y18_N12
\RegPulseGenerator|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|Equal0~4_combout\ = (\RegPulseGenerator|s_counter\(6)) # ((\RegPulseGenerator|s_counter\(5)) # ((\RegPulseGenerator|s_counter\(4)) # (\RegPulseGenerator|s_counter\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter\(6),
	datab => \RegPulseGenerator|s_counter\(5),
	datac => \RegPulseGenerator|s_counter\(4),
	datad => \RegPulseGenerator|s_counter\(12),
	combout => \RegPulseGenerator|Equal0~4_combout\);

-- Location: LCCOMB_X110_Y18_N4
\RegPulseGenerator|Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|Equal0~6_combout\ = (\RegPulseGenerator|s_counter\(20)) # ((\RegPulseGenerator|s_counter\(18)) # ((\RegPulseGenerator|s_counter\(17)) # (\RegPulseGenerator|s_counter\(19))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter\(20),
	datab => \RegPulseGenerator|s_counter\(18),
	datac => \RegPulseGenerator|s_counter\(17),
	datad => \RegPulseGenerator|s_counter\(19),
	combout => \RegPulseGenerator|Equal0~6_combout\);

-- Location: LCCOMB_X110_Y18_N30
\RegPulseGenerator|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|Equal0~5_combout\ = (\RegPulseGenerator|s_counter\(15)) # ((\RegPulseGenerator|s_counter\(14)) # ((\RegPulseGenerator|s_counter\(13)) # (\RegPulseGenerator|s_counter\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter\(15),
	datab => \RegPulseGenerator|s_counter\(14),
	datac => \RegPulseGenerator|s_counter\(13),
	datad => \RegPulseGenerator|s_counter\(16),
	combout => \RegPulseGenerator|Equal0~5_combout\);

-- Location: LCCOMB_X110_Y19_N8
\RegPulseGenerator|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|Equal0~3_combout\ = (\RegPulseGenerator|s_counter\(3)) # ((\RegPulseGenerator|s_counter\(2)) # ((\RegPulseGenerator|s_counter\(1)) # (\RegPulseGenerator|s_counter\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter\(3),
	datab => \RegPulseGenerator|s_counter\(2),
	datac => \RegPulseGenerator|s_counter\(1),
	datad => \RegPulseGenerator|s_counter\(0),
	combout => \RegPulseGenerator|Equal0~3_combout\);

-- Location: LCCOMB_X110_Y18_N26
\RegPulseGenerator|Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|Equal0~7_combout\ = (\RegPulseGenerator|Equal0~4_combout\) # ((\RegPulseGenerator|Equal0~6_combout\) # ((\RegPulseGenerator|Equal0~5_combout\) # (\RegPulseGenerator|Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|Equal0~4_combout\,
	datab => \RegPulseGenerator|Equal0~6_combout\,
	datac => \RegPulseGenerator|Equal0~5_combout\,
	datad => \RegPulseGenerator|Equal0~3_combout\,
	combout => \RegPulseGenerator|Equal0~7_combout\);

-- Location: LCCOMB_X110_Y18_N8
\RegPulseGenerator|Equal0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|Equal0~8_combout\ = (\RegPulseGenerator|s_counter\(22)) # ((\RegPulseGenerator|s_counter\(24)) # ((\RegPulseGenerator|s_counter\(23)) # (\RegPulseGenerator|s_counter\(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|s_counter\(22),
	datab => \RegPulseGenerator|s_counter\(24),
	datac => \RegPulseGenerator|s_counter\(23),
	datad => \RegPulseGenerator|s_counter\(21),
	combout => \RegPulseGenerator|Equal0~8_combout\);

-- Location: LCCOMB_X110_Y18_N18
\RegPulseGenerator|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|Equal0~2_combout\ = (((\RegPulseGenerator|s_counter\(11)) # (\RegPulseGenerator|s_counter\(30))) # (!\RegPulseGenerator|Equal0~0_combout\)) # (!\RegPulseGenerator|Equal0~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|Equal0~1_combout\,
	datab => \RegPulseGenerator|Equal0~0_combout\,
	datac => \RegPulseGenerator|s_counter\(11),
	datad => \RegPulseGenerator|s_counter\(30),
	combout => \RegPulseGenerator|Equal0~2_combout\);

-- Location: LCCOMB_X110_Y18_N6
\RegPulseGenerator|Equal0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegPulseGenerator|Equal0~9_combout\ = (\RegPulseGenerator|Equal0~7_combout\) # ((\RegPulseGenerator|s_counter\(25)) # ((\RegPulseGenerator|Equal0~8_combout\) # (\RegPulseGenerator|Equal0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegPulseGenerator|Equal0~7_combout\,
	datab => \RegPulseGenerator|s_counter\(25),
	datac => \RegPulseGenerator|Equal0~8_combout\,
	datad => \RegPulseGenerator|Equal0~2_combout\,
	combout => \RegPulseGenerator|Equal0~9_combout\);

-- Location: LCCOMB_X111_Y17_N20
\CounterDosMeses|s_value~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosMeses|s_value~0_combout\ = (\CounterDosDias|termCnt~q\ & !\RegPulseGenerator|Equal0~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CounterDosDias|termCnt~q\,
	datad => \RegPulseGenerator|Equal0~9_combout\,
	combout => \CounterDosMeses|s_value~0_combout\);

-- Location: LCCOMB_X105_Y14_N0
\CounterDosMeses|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosMeses|Add0~0_combout\ = \CounterDosMeses|s_value\(0) $ (GND)
-- \CounterDosMeses|Add0~1\ = CARRY(!\CounterDosMeses|s_value\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CounterDosMeses|s_value\(0),
	datad => VCC,
	combout => \CounterDosMeses|Add0~0_combout\,
	cout => \CounterDosMeses|Add0~1\);

-- Location: LCCOMB_X105_Y14_N24
\CounterDosMeses|s_value~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosMeses|s_value~8_combout\ = (!\SW[0]~input_o\ & ((\CounterDosMeses|s_value~0_combout\ & (!\CounterDosMeses|Add0~0_combout\)) # (!\CounterDosMeses|s_value~0_combout\ & ((\CounterDosMeses|s_value\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosMeses|s_value~0_combout\,
	datab => \CounterDosMeses|Add0~0_combout\,
	datac => \CounterDosMeses|s_value\(0),
	datad => \SW[0]~input_o\,
	combout => \CounterDosMeses|s_value~8_combout\);

-- Location: FF_X105_Y14_N25
\CounterDosMeses|s_value[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \CounterDosMeses|s_value~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CounterDosMeses|s_value\(0));

-- Location: LCCOMB_X105_Y14_N2
\CounterDosMeses|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosMeses|Add0~2_combout\ = (\CounterDosMeses|s_value\(1) & (!\CounterDosMeses|Add0~1\)) # (!\CounterDosMeses|s_value\(1) & ((\CounterDosMeses|Add0~1\) # (GND)))
-- \CounterDosMeses|Add0~3\ = CARRY((!\CounterDosMeses|Add0~1\) # (!\CounterDosMeses|s_value\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosMeses|s_value\(1),
	datad => VCC,
	cin => \CounterDosMeses|Add0~1\,
	combout => \CounterDosMeses|Add0~2_combout\,
	cout => \CounterDosMeses|Add0~3\);

-- Location: LCCOMB_X105_Y14_N8
\CounterDosMeses|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosMeses|Add0~8_combout\ = (\CounterDosMeses|s_value\(4) & (\CounterDosMeses|Add0~7\ $ (GND))) # (!\CounterDosMeses|s_value\(4) & (!\CounterDosMeses|Add0~7\ & VCC))
-- \CounterDosMeses|Add0~9\ = CARRY((\CounterDosMeses|s_value\(4) & !\CounterDosMeses|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosMeses|s_value\(4),
	datad => VCC,
	cin => \CounterDosMeses|Add0~7\,
	combout => \CounterDosMeses|Add0~8_combout\,
	cout => \CounterDosMeses|Add0~9\);

-- Location: LCCOMB_X105_Y14_N10
\CounterDosMeses|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosMeses|Add0~10_combout\ = \CounterDosMeses|Add0~9\ $ (\CounterDosMeses|s_value\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \CounterDosMeses|s_value\(5),
	cin => \CounterDosMeses|Add0~9\,
	combout => \CounterDosMeses|Add0~10_combout\);

-- Location: LCCOMB_X105_Y14_N28
\CounterDosMeses|s_value~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosMeses|s_value~9_combout\ = (\CounterDosMeses|Add0~10_combout\ & \CounterDosMeses|s_value[5]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosMeses|Add0~10_combout\,
	datad => \CounterDosMeses|s_value[5]~2_combout\,
	combout => \CounterDosMeses|s_value~9_combout\);

-- Location: LCCOMB_X110_Y14_N0
\CounterDosMeses|s_value[5]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosMeses|s_value[5]~4_combout\ = (\SW[0]~input_o\) # ((\CounterDosDias|termCnt~q\ & !\RegPulseGenerator|Equal0~9_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datac => \CounterDosDias|termCnt~q\,
	datad => \RegPulseGenerator|Equal0~9_combout\,
	combout => \CounterDosMeses|s_value[5]~4_combout\);

-- Location: FF_X105_Y14_N29
\CounterDosMeses|s_value[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \CounterDosMeses|s_value~9_combout\,
	ena => \CounterDosMeses|s_value[5]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CounterDosMeses|s_value\(5));

-- Location: LCCOMB_X105_Y14_N22
\CounterDosMeses|s_value[5]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosMeses|s_value[5]~1_combout\ = (\CounterDosMeses|s_value\(4)) # ((\CounterDosMeses|s_value\(5)) # ((!\CounterDosMeses|s_value\(0)) # (!\CounterDosMeses|s_value\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosMeses|s_value\(4),
	datab => \CounterDosMeses|s_value\(5),
	datac => \CounterDosMeses|s_value\(3),
	datad => \CounterDosMeses|s_value\(0),
	combout => \CounterDosMeses|s_value[5]~1_combout\);

-- Location: LCCOMB_X105_Y14_N12
\CounterDosMeses|s_value[5]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosMeses|s_value[5]~2_combout\ = (!\SW[0]~input_o\ & ((\CounterDosMeses|s_value[5]~1_combout\) # ((\CounterDosMeses|s_value\(1)) # (!\CounterDosMeses|s_value\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosMeses|s_value[5]~1_combout\,
	datab => \SW[0]~input_o\,
	datac => \CounterDosMeses|s_value\(1),
	datad => \CounterDosMeses|s_value\(2),
	combout => \CounterDosMeses|s_value[5]~2_combout\);

-- Location: LCCOMB_X106_Y14_N22
\CounterDosMeses|s_value~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosMeses|s_value~3_combout\ = (\CounterDosMeses|Add0~2_combout\ & \CounterDosMeses|s_value[5]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosMeses|Add0~2_combout\,
	datad => \CounterDosMeses|s_value[5]~2_combout\,
	combout => \CounterDosMeses|s_value~3_combout\);

-- Location: FF_X106_Y14_N23
\CounterDosMeses|s_value[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \CounterDosMeses|s_value~3_combout\,
	ena => \CounterDosMeses|s_value[5]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CounterDosMeses|s_value\(1));

-- Location: LCCOMB_X105_Y14_N4
\CounterDosMeses|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosMeses|Add0~4_combout\ = (\CounterDosMeses|s_value\(2) & (\CounterDosMeses|Add0~3\ $ (GND))) # (!\CounterDosMeses|s_value\(2) & (!\CounterDosMeses|Add0~3\ & VCC))
-- \CounterDosMeses|Add0~5\ = CARRY((\CounterDosMeses|s_value\(2) & !\CounterDosMeses|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CounterDosMeses|s_value\(2),
	datad => VCC,
	cin => \CounterDosMeses|Add0~3\,
	combout => \CounterDosMeses|Add0~4_combout\,
	cout => \CounterDosMeses|Add0~5\);

-- Location: LCCOMB_X105_Y14_N16
\CounterDosMeses|s_value~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosMeses|s_value~7_combout\ = (\CounterDosMeses|Add0~4_combout\ & \CounterDosMeses|s_value[5]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CounterDosMeses|Add0~4_combout\,
	datad => \CounterDosMeses|s_value[5]~2_combout\,
	combout => \CounterDosMeses|s_value~7_combout\);

-- Location: FF_X106_Y14_N7
\CounterDosMeses|s_value[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \CounterDosMeses|s_value~7_combout\,
	sload => VCC,
	ena => \CounterDosMeses|s_value[5]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CounterDosMeses|s_value\(2));

-- Location: LCCOMB_X105_Y14_N6
\CounterDosMeses|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosMeses|Add0~6_combout\ = (\CounterDosMeses|s_value\(3) & (!\CounterDosMeses|Add0~5\)) # (!\CounterDosMeses|s_value\(3) & ((\CounterDosMeses|Add0~5\) # (GND)))
-- \CounterDosMeses|Add0~7\ = CARRY((!\CounterDosMeses|Add0~5\) # (!\CounterDosMeses|s_value\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosMeses|s_value\(3),
	datad => VCC,
	cin => \CounterDosMeses|Add0~5\,
	combout => \CounterDosMeses|Add0~6_combout\,
	cout => \CounterDosMeses|Add0~7\);

-- Location: LCCOMB_X106_Y14_N20
\CounterDosMeses|s_value~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosMeses|s_value~6_combout\ = (\CounterDosMeses|Add0~6_combout\ & \CounterDosMeses|s_value[5]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CounterDosMeses|Add0~6_combout\,
	datad => \CounterDosMeses|s_value[5]~2_combout\,
	combout => \CounterDosMeses|s_value~6_combout\);

-- Location: FF_X106_Y14_N21
\CounterDosMeses|s_value[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \CounterDosMeses|s_value~6_combout\,
	ena => \CounterDosMeses|s_value[5]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CounterDosMeses|s_value\(3));

-- Location: LCCOMB_X105_Y14_N26
\CounterDosMeses|s_value~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosMeses|s_value~5_combout\ = (\CounterDosMeses|Add0~8_combout\ & \CounterDosMeses|s_value[5]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CounterDosMeses|Add0~8_combout\,
	datad => \CounterDosMeses|s_value[5]~2_combout\,
	combout => \CounterDosMeses|s_value~5_combout\);

-- Location: FF_X106_Y14_N5
\CounterDosMeses|s_value[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \CounterDosMeses|s_value~5_combout\,
	sload => VCC,
	ena => \CounterDosMeses|s_value[5]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CounterDosMeses|s_value\(4));

-- Location: FF_X106_Y14_N19
\DiasDoMes|s_value[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \CounterDosMeses|s_value\(4),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DiasDoMes|s_value\(4));

-- Location: FF_X105_Y15_N23
\DiasDoMes|s_value[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \CounterDosMeses|s_value\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DiasDoMes|s_value\(0));

-- Location: LCCOMB_X105_Y15_N0
\DiasDoMes|s_value[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasDoMes|s_value[1]~feeder_combout\ = \CounterDosMeses|s_value\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CounterDosMeses|s_value\(1),
	combout => \DiasDoMes|s_value[1]~feeder_combout\);

-- Location: FF_X105_Y15_N1
\DiasDoMes|s_value[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \DiasDoMes|s_value[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DiasDoMes|s_value\(1));

-- Location: FF_X105_Y15_N3
\DiasDoMes|s_value[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \CounterDosMeses|s_value\(3),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DiasDoMes|s_value\(3));

-- Location: FF_X105_Y15_N21
\DiasDoMes|s_value[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \CounterDosMeses|s_value\(2),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DiasDoMes|s_value\(2));

-- Location: LCCOMB_X105_Y15_N2
\DiasDoMes|process_0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasDoMes|process_0~0_combout\ = (\DiasDoMes|s_value\(0) & (\DiasDoMes|s_value\(3) & ((!\DiasDoMes|s_value\(2)) # (!\DiasDoMes|s_value\(1))))) # (!\DiasDoMes|s_value\(0) & (((!\DiasDoMes|s_value\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010010110100101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DiasDoMes|s_value\(0),
	datab => \DiasDoMes|s_value\(1),
	datac => \DiasDoMes|s_value\(3),
	datad => \DiasDoMes|s_value\(2),
	combout => \DiasDoMes|process_0~0_combout\);

-- Location: LCCOMB_X106_Y14_N8
\DiasDoMes|process_0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasDoMes|process_0~1_combout\ = (\DiasDoMes|s_value\(31) & (!\DiasDoMes|s_value\(4) & \DiasDoMes|process_0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \DiasDoMes|s_value\(31),
	datac => \DiasDoMes|s_value\(4),
	datad => \DiasDoMes|process_0~0_combout\,
	combout => \DiasDoMes|process_0~1_combout\);

-- Location: FF_X106_Y14_N9
\DiasDoMes|valOut[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \DiasDoMes|process_0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DiasDoMes|valOut\(0));

-- Location: LCCOMB_X105_Y15_N22
\DiasDoMes|valOut~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasDoMes|valOut~0_combout\ = (\DiasDoMes|s_value\(3) & (((!\DiasDoMes|s_value\(1) & \DiasDoMes|s_value\(0))) # (!\DiasDoMes|s_value\(2)))) # (!\DiasDoMes|s_value\(3) & (((\DiasDoMes|s_value\(2)) # (!\DiasDoMes|s_value\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DiasDoMes|s_value\(3),
	datab => \DiasDoMes|s_value\(1),
	datac => \DiasDoMes|s_value\(0),
	datad => \DiasDoMes|s_value\(2),
	combout => \DiasDoMes|valOut~0_combout\);

-- Location: LCCOMB_X106_Y14_N2
\DiasDoMes|valOut~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasDoMes|valOut~1_combout\ = (!\DiasDoMes|s_value\(4) & (\DiasDoMes|s_value\(31) & \DiasDoMes|valOut~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DiasDoMes|s_value\(4),
	datab => \DiasDoMes|s_value\(31),
	datac => \DiasDoMes|valOut~0_combout\,
	combout => \DiasDoMes|valOut~1_combout\);

-- Location: FF_X106_Y14_N3
\DiasDoMes|valOut[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \DiasDoMes|valOut~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DiasDoMes|valOut\(1));

-- Location: LCCOMB_X112_Y15_N12
\CounterDosDias|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosDias|Add0~0_combout\ = \CounterDosDias|s_value\(0) $ (GND)
-- \CounterDosDias|Add0~1\ = CARRY(!\CounterDosDias|s_value\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosDias|s_value\(0),
	datad => VCC,
	combout => \CounterDosDias|Add0~0_combout\,
	cout => \CounterDosDias|Add0~1\);

-- Location: LCCOMB_X111_Y15_N28
\CounterDosDias|s_value~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosDias|s_value~5_combout\ = (\CounterDosDias|Add0~0_combout\) # ((\CounterDosDias|Equal0~1_combout\ & \CounterDosDias|Equal0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosDias|Equal0~1_combout\,
	datab => \CounterDosDias|Add0~0_combout\,
	datad => \CounterDosDias|Equal0~0_combout\,
	combout => \CounterDosDias|s_value~5_combout\);

-- Location: LCCOMB_X110_Y15_N4
\CounterDosDias|s_value~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosDias|s_value~6_combout\ = (!\SW[0]~input_o\ & ((\RegPulseGenerator|Equal0~9_combout\ & ((\CounterDosDias|s_value\(0)))) # (!\RegPulseGenerator|Equal0~9_combout\ & (!\CounterDosDias|s_value~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \CounterDosDias|s_value~5_combout\,
	datac => \CounterDosDias|s_value\(0),
	datad => \RegPulseGenerator|Equal0~9_combout\,
	combout => \CounterDosDias|s_value~6_combout\);

-- Location: FF_X110_Y15_N5
\CounterDosDias|s_value[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \CounterDosDias|s_value~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CounterDosDias|s_value\(0));

-- Location: LCCOMB_X112_Y15_N14
\CounterDosDias|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosDias|Add0~2_combout\ = (\CounterDosDias|s_value\(1) & (!\CounterDosDias|Add0~1\)) # (!\CounterDosDias|s_value\(1) & ((\CounterDosDias|Add0~1\) # (GND)))
-- \CounterDosDias|Add0~3\ = CARRY((!\CounterDosDias|Add0~1\) # (!\CounterDosDias|s_value\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CounterDosDias|s_value\(1),
	datad => VCC,
	cin => \CounterDosDias|Add0~1\,
	combout => \CounterDosDias|Add0~2_combout\,
	cout => \CounterDosDias|Add0~3\);

-- Location: LCCOMB_X110_Y15_N28
\CounterDosDias|s_value~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosDias|s_value~0_combout\ = (\CounterDosDias|Add0~2_combout\ & (!\SW[0]~input_o\ & ((!\CounterDosDias|Equal0~0_combout\) # (!\CounterDosDias|Equal0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosDias|Equal0~1_combout\,
	datab => \CounterDosDias|Add0~2_combout\,
	datac => \SW[0]~input_o\,
	datad => \CounterDosDias|Equal0~0_combout\,
	combout => \CounterDosDias|s_value~0_combout\);

-- Location: LCCOMB_X110_Y15_N0
\CounterDosDias|s_value[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosDias|s_value[1]~1_combout\ = (\SW[0]~input_o\) # (!\RegPulseGenerator|Equal0~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \SW[0]~input_o\,
	datad => \RegPulseGenerator|Equal0~9_combout\,
	combout => \CounterDosDias|s_value[1]~1_combout\);

-- Location: FF_X110_Y15_N29
\CounterDosDias|s_value[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \CounterDosDias|s_value~0_combout\,
	ena => \CounterDosDias|s_value[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CounterDosDias|s_value\(1));

-- Location: LCCOMB_X110_Y15_N26
\CounterDosDias|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosDias|Equal0~1_combout\ = (\DiasDoMes|valOut\(0) & (!\CounterDosDias|s_value\(0) & (\DiasDoMes|valOut\(1) $ (!\CounterDosDias|s_value\(1))))) # (!\DiasDoMes|valOut\(0) & (\CounterDosDias|s_value\(0) & (\DiasDoMes|valOut\(1) $ 
-- (!\CounterDosDias|s_value\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DiasDoMes|valOut\(0),
	datab => \DiasDoMes|valOut\(1),
	datac => \CounterDosDias|s_value\(0),
	datad => \CounterDosDias|s_value\(1),
	combout => \CounterDosDias|Equal0~1_combout\);

-- Location: LCCOMB_X112_Y15_N16
\CounterDosDias|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosDias|Add0~4_combout\ = (\CounterDosDias|s_value\(2) & (\CounterDosDias|Add0~3\ $ (GND))) # (!\CounterDosDias|s_value\(2) & (!\CounterDosDias|Add0~3\ & VCC))
-- \CounterDosDias|Add0~5\ = CARRY((\CounterDosDias|s_value\(2) & !\CounterDosDias|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosDias|s_value\(2),
	datad => VCC,
	cin => \CounterDosDias|Add0~3\,
	combout => \CounterDosDias|Add0~4_combout\,
	cout => \CounterDosDias|Add0~5\);

-- Location: LCCOMB_X111_Y15_N14
\CounterDosDias|s_value~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosDias|s_value~4_combout\ = (!\SW[0]~input_o\ & (\CounterDosDias|Add0~4_combout\ & ((!\CounterDosDias|Equal0~1_combout\) # (!\CounterDosDias|Equal0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \CounterDosDias|Equal0~0_combout\,
	datac => \CounterDosDias|Equal0~1_combout\,
	datad => \CounterDosDias|Add0~4_combout\,
	combout => \CounterDosDias|s_value~4_combout\);

-- Location: FF_X111_Y15_N15
\CounterDosDias|s_value[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \CounterDosDias|s_value~4_combout\,
	ena => \CounterDosDias|s_value[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CounterDosDias|s_value\(2));

-- Location: LCCOMB_X112_Y15_N18
\CounterDosDias|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosDias|Add0~6_combout\ = (\CounterDosDias|s_value\(3) & (!\CounterDosDias|Add0~5\)) # (!\CounterDosDias|s_value\(3) & ((\CounterDosDias|Add0~5\) # (GND)))
-- \CounterDosDias|Add0~7\ = CARRY((!\CounterDosDias|Add0~5\) # (!\CounterDosDias|s_value\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosDias|s_value\(3),
	datad => VCC,
	cin => \CounterDosDias|Add0~5\,
	combout => \CounterDosDias|Add0~6_combout\,
	cout => \CounterDosDias|Add0~7\);

-- Location: LCCOMB_X112_Y15_N20
\CounterDosDias|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosDias|Add0~8_combout\ = (\CounterDosDias|s_value\(4) & (\CounterDosDias|Add0~7\ $ (GND))) # (!\CounterDosDias|s_value\(4) & (!\CounterDosDias|Add0~7\ & VCC))
-- \CounterDosDias|Add0~9\ = CARRY((\CounterDosDias|s_value\(4) & !\CounterDosDias|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CounterDosDias|s_value\(4),
	datad => VCC,
	cin => \CounterDosDias|Add0~7\,
	combout => \CounterDosDias|Add0~8_combout\,
	cout => \CounterDosDias|Add0~9\);

-- Location: LCCOMB_X111_Y15_N30
\CounterDosDias|s_value~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosDias|s_value~2_combout\ = (!\SW[0]~input_o\ & (\CounterDosDias|Add0~8_combout\ & ((!\CounterDosDias|Equal0~0_combout\) # (!\CounterDosDias|Equal0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \CounterDosDias|Add0~8_combout\,
	datac => \CounterDosDias|Equal0~1_combout\,
	datad => \CounterDosDias|Equal0~0_combout\,
	combout => \CounterDosDias|s_value~2_combout\);

-- Location: FF_X111_Y15_N31
\CounterDosDias|s_value[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \CounterDosDias|s_value~2_combout\,
	ena => \CounterDosDias|s_value[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CounterDosDias|s_value\(4));

-- Location: LCCOMB_X112_Y15_N22
\CounterDosDias|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosDias|Add0~10_combout\ = \CounterDosDias|Add0~9\ $ (\CounterDosDias|s_value\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \CounterDosDias|s_value\(5),
	cin => \CounterDosDias|Add0~9\,
	combout => \CounterDosDias|Add0~10_combout\);

-- Location: LCCOMB_X111_Y15_N18
\CounterDosDias|s_value~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosDias|s_value~7_combout\ = (!\SW[0]~input_o\ & (\CounterDosDias|Add0~10_combout\ & ((!\CounterDosDias|Equal0~1_combout\) # (!\CounterDosDias|Equal0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \CounterDosDias|Equal0~0_combout\,
	datac => \CounterDosDias|Equal0~1_combout\,
	datad => \CounterDosDias|Add0~10_combout\,
	combout => \CounterDosDias|s_value~7_combout\);

-- Location: FF_X111_Y15_N19
\CounterDosDias|s_value[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \CounterDosDias|s_value~7_combout\,
	ena => \CounterDosDias|s_value[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CounterDosDias|s_value\(5));

-- Location: LCCOMB_X111_Y15_N24
\CounterDosDias|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosDias|Equal0~0_combout\ = (\CounterDosDias|s_value\(2) & (\CounterDosDias|s_value\(4) & (\CounterDosDias|s_value\(3) & !\CounterDosDias|s_value\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosDias|s_value\(2),
	datab => \CounterDosDias|s_value\(4),
	datac => \CounterDosDias|s_value\(3),
	datad => \CounterDosDias|s_value\(5),
	combout => \CounterDosDias|Equal0~0_combout\);

-- Location: LCCOMB_X111_Y15_N16
\CounterDosDias|s_value~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosDias|s_value~3_combout\ = (!\SW[0]~input_o\ & (\CounterDosDias|Add0~6_combout\ & ((!\CounterDosDias|Equal0~1_combout\) # (!\CounterDosDias|Equal0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \CounterDosDias|Equal0~0_combout\,
	datac => \CounterDosDias|Equal0~1_combout\,
	datad => \CounterDosDias|Add0~6_combout\,
	combout => \CounterDosDias|s_value~3_combout\);

-- Location: FF_X111_Y15_N17
\CounterDosDias|s_value[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \CounterDosDias|s_value~3_combout\,
	ena => \CounterDosDias|s_value[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CounterDosDias|s_value\(3));

-- Location: LCCOMB_X111_Y15_N26
\CounterDosDias|termCnt~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosDias|termCnt~1_combout\ = (\CounterDosDias|s_value\(3) & (\CounterDosDias|s_value\(4) & (!\CounterDosDias|s_value\(5) & !\SW[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosDias|s_value\(3),
	datab => \CounterDosDias|s_value\(4),
	datac => \CounterDosDias|s_value\(5),
	datad => \SW[0]~input_o\,
	combout => \CounterDosDias|termCnt~1_combout\);

-- Location: LCCOMB_X110_Y15_N10
\CounterDosDias|termCnt~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosDias|termCnt~0_combout\ = (\DiasDoMes|valOut\(0) & (\CounterDosDias|s_value\(2) & (\DiasDoMes|valOut\(1) $ (!\CounterDosDias|s_value\(1))))) # (!\DiasDoMes|valOut\(0) & ((\DiasDoMes|valOut\(1) & (\CounterDosDias|s_value\(2) & 
-- !\CounterDosDias|s_value\(1))) # (!\DiasDoMes|valOut\(1) & (!\CounterDosDias|s_value\(2) & \CounterDosDias|s_value\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000101100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DiasDoMes|valOut\(0),
	datab => \DiasDoMes|valOut\(1),
	datac => \CounterDosDias|s_value\(2),
	datad => \CounterDosDias|s_value\(1),
	combout => \CounterDosDias|termCnt~0_combout\);

-- Location: LCCOMB_X110_Y15_N30
\CounterDosDias|termCnt~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosDias|termCnt~2_combout\ = (\CounterDosDias|termCnt~1_combout\ & (\CounterDosDias|termCnt~0_combout\ & (\DiasDoMes|valOut\(0) $ (!\CounterDosDias|s_value\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DiasDoMes|valOut\(0),
	datab => \CounterDosDias|termCnt~1_combout\,
	datac => \CounterDosDias|s_value\(0),
	datad => \CounterDosDias|termCnt~0_combout\,
	combout => \CounterDosDias|termCnt~2_combout\);

-- Location: FF_X110_Y15_N31
\CounterDosDias|termCnt\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \CounterDosDias|termCnt~2_combout\,
	ena => \CounterDosDias|s_value[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CounterDosDias|termCnt~q\);

-- Location: LCCOMB_X105_Y14_N30
\CounterDosMeses|termCnt~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosMeses|termCnt~0_combout\ = (!\CounterDosMeses|s_value\(4) & (!\CounterDosMeses|s_value\(5) & (\CounterDosMeses|s_value\(3) & !\CounterDosMeses|s_value\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosMeses|s_value\(4),
	datab => \CounterDosMeses|s_value\(5),
	datac => \CounterDosMeses|s_value\(3),
	datad => \CounterDosMeses|s_value\(0),
	combout => \CounterDosMeses|termCnt~0_combout\);

-- Location: LCCOMB_X105_Y14_N18
\CounterDosMeses|termCnt~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosMeses|termCnt~1_combout\ = (\CounterDosMeses|termCnt~0_combout\ & (\CounterDosMeses|s_value[5]~2_combout\ & (\CounterDosMeses|s_value\(1) & !\CounterDosMeses|s_value\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosMeses|termCnt~0_combout\,
	datab => \CounterDosMeses|s_value[5]~2_combout\,
	datac => \CounterDosMeses|s_value\(1),
	datad => \CounterDosMeses|s_value\(2),
	combout => \CounterDosMeses|termCnt~1_combout\);

-- Location: FF_X105_Y14_N19
\CounterDosMeses|termCnt\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \CounterDosMeses|termCnt~1_combout\,
	ena => \CounterDosMeses|s_value[5]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CounterDosMeses|termCnt~q\);

-- Location: LCCOMB_X111_Y17_N4
\CounterDosAnos1|s_value[3]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosAnos1|s_value[3]~1_combout\ = (\SW[0]~input_o\) # ((\CounterDosDias|termCnt~q\ & (\CounterDosMeses|termCnt~q\ & !\RegPulseGenerator|Equal0~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \CounterDosDias|termCnt~q\,
	datac => \CounterDosMeses|termCnt~q\,
	datad => \RegPulseGenerator|Equal0~9_combout\,
	combout => \CounterDosAnos1|s_value[3]~1_combout\);

-- Location: FF_X109_Y17_N17
\CounterDosAnos1|s_value[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \CounterDosAnos1|s_value~4_combout\,
	ena => \CounterDosAnos1|s_value[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CounterDosAnos1|s_value\(0));

-- Location: LCCOMB_X110_Y17_N20
\CounterDosAnos1|s_value~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosAnos1|s_value~0_combout\ = (!\SW[0]~input_o\ & ((\CounterDosAnos1|s_value\(0) & (!\CounterDosAnos1|termCnt~0_combout\ & !\CounterDosAnos1|s_value\(1))) # (!\CounterDosAnos1|s_value\(0) & ((\CounterDosAnos1|s_value\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosAnos1|s_value\(0),
	datab => \CounterDosAnos1|termCnt~0_combout\,
	datac => \CounterDosAnos1|s_value\(1),
	datad => \SW[0]~input_o\,
	combout => \CounterDosAnos1|s_value~0_combout\);

-- Location: FF_X110_Y17_N21
\CounterDosAnos1|s_value[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \CounterDosAnos1|s_value~0_combout\,
	ena => \CounterDosAnos1|s_value[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CounterDosAnos1|s_value\(1));

-- Location: LCCOMB_X109_Y17_N18
\CounterDosAnos1|Add0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosAnos1|Add0~1_combout\ = \CounterDosAnos1|s_value\(2) $ (((\CounterDosAnos1|s_value\(1) & \CounterDosAnos1|s_value\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosAnos1|s_value\(1),
	datab => \CounterDosAnos1|s_value\(2),
	datad => \CounterDosAnos1|s_value\(0),
	combout => \CounterDosAnos1|Add0~1_combout\);

-- Location: LCCOMB_X109_Y17_N14
\CounterDosAnos1|s_value~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosAnos1|s_value~3_combout\ = (\CounterDosAnos1|Add0~1_combout\ & (!\SW[0]~input_o\ & ((!\CounterDosAnos1|s_value\(0)) # (!\CounterDosAnos1|termCnt~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosAnos1|termCnt~0_combout\,
	datab => \CounterDosAnos1|Add0~1_combout\,
	datac => \SW[0]~input_o\,
	datad => \CounterDosAnos1|s_value\(0),
	combout => \CounterDosAnos1|s_value~3_combout\);

-- Location: FF_X109_Y17_N15
\CounterDosAnos1|s_value[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \CounterDosAnos1|s_value~3_combout\,
	ena => \CounterDosAnos1|s_value[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CounterDosAnos1|s_value\(2));

-- Location: LCCOMB_X109_Y17_N12
\CounterDosAnos1|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosAnos1|Add0~0_combout\ = \CounterDosAnos1|s_value\(3) $ (((\CounterDosAnos1|s_value\(2) & (\CounterDosAnos1|s_value\(0) & \CounterDosAnos1|s_value\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosAnos1|s_value\(2),
	datab => \CounterDosAnos1|s_value\(0),
	datac => \CounterDosAnos1|s_value\(1),
	datad => \CounterDosAnos1|s_value\(3),
	combout => \CounterDosAnos1|Add0~0_combout\);

-- Location: LCCOMB_X109_Y17_N24
\CounterDosAnos1|s_value~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosAnos1|s_value~2_combout\ = (!\SW[0]~input_o\ & (\CounterDosAnos1|Add0~0_combout\ & ((!\CounterDosAnos1|s_value\(0)) # (!\CounterDosAnos1|termCnt~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosAnos1|termCnt~0_combout\,
	datab => \CounterDosAnos1|s_value\(0),
	datac => \SW[0]~input_o\,
	datad => \CounterDosAnos1|Add0~0_combout\,
	combout => \CounterDosAnos1|s_value~2_combout\);

-- Location: FF_X109_Y17_N25
\CounterDosAnos1|s_value[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \CounterDosAnos1|s_value~2_combout\,
	ena => \CounterDosAnos1|s_value[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CounterDosAnos1|s_value\(3));

-- Location: LCCOMB_X109_Y17_N6
\CounterDosAnos1|termCnt~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosAnos1|termCnt~0_combout\ = (!\CounterDosAnos1|s_value\(1) & (!\CounterDosAnos1|s_value\(2) & \CounterDosAnos1|s_value\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosAnos1|s_value\(1),
	datab => \CounterDosAnos1|s_value\(2),
	datad => \CounterDosAnos1|s_value\(3),
	combout => \CounterDosAnos1|termCnt~0_combout\);

-- Location: LCCOMB_X110_Y17_N14
\CounterDosAnos1|termCnt~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosAnos1|termCnt~1_combout\ = (!\CounterDosAnos1|s_value\(0) & (\CounterDosAnos1|termCnt~0_combout\ & !\SW[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosAnos1|s_value\(0),
	datab => \CounterDosAnos1|termCnt~0_combout\,
	datad => \SW[0]~input_o\,
	combout => \CounterDosAnos1|termCnt~1_combout\);

-- Location: FF_X110_Y17_N15
\CounterDosAnos1|termCnt\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \CounterDosAnos1|termCnt~1_combout\,
	ena => \CounterDosAnos1|s_value[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CounterDosAnos1|termCnt~q\);

-- Location: LCCOMB_X111_Y17_N10
\CounterDosAnos2|s_value[3]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosAnos2|s_value[3]~1_combout\ = (\SW[0]~input_o\) # ((\CounterDosAnos1|termCnt~q\ & (\CounterDosMeses|termCnt~q\ & \CounterDosMeses|s_value~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosAnos1|termCnt~q\,
	datab => \CounterDosMeses|termCnt~q\,
	datac => \SW[0]~input_o\,
	datad => \CounterDosMeses|s_value~0_combout\,
	combout => \CounterDosAnos2|s_value[3]~1_combout\);

-- Location: FF_X111_Y17_N29
\CounterDosAnos2|s_value[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \CounterDosAnos2|s_value~4_combout\,
	ena => \CounterDosAnos2|s_value[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CounterDosAnos2|s_value\(0));

-- Location: LCCOMB_X110_Y17_N12
\CounterDosAnos2|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosAnos2|Add0~0_combout\ = \CounterDosAnos2|s_value\(3) $ (((\CounterDosAnos2|s_value\(2) & (\CounterDosAnos2|s_value\(1) & \CounterDosAnos2|s_value\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosAnos2|s_value\(3),
	datab => \CounterDosAnos2|s_value\(2),
	datac => \CounterDosAnos2|s_value\(1),
	datad => \CounterDosAnos2|s_value\(0),
	combout => \CounterDosAnos2|Add0~0_combout\);

-- Location: LCCOMB_X110_Y17_N6
\CounterDosAnos2|s_value~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosAnos2|s_value~2_combout\ = (\CounterDosAnos2|Add0~0_combout\ & (!\SW[0]~input_o\ & ((!\CounterDosAnos2|termCnt~0_combout\) # (!\CounterDosAnos2|s_value\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosAnos2|Add0~0_combout\,
	datab => \CounterDosAnos2|s_value\(0),
	datac => \CounterDosAnos2|termCnt~0_combout\,
	datad => \SW[0]~input_o\,
	combout => \CounterDosAnos2|s_value~2_combout\);

-- Location: FF_X110_Y17_N7
\CounterDosAnos2|s_value[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \CounterDosAnos2|s_value~2_combout\,
	ena => \CounterDosAnos2|s_value[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CounterDosAnos2|s_value\(3));

-- Location: LCCOMB_X110_Y17_N8
\CounterDosAnos2|termCnt~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosAnos2|termCnt~0_combout\ = (\CounterDosAnos2|s_value\(3) & (!\CounterDosAnos2|s_value\(1) & !\CounterDosAnos2|s_value\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosAnos2|s_value\(3),
	datac => \CounterDosAnos2|s_value\(1),
	datad => \CounterDosAnos2|s_value\(2),
	combout => \CounterDosAnos2|termCnt~0_combout\);

-- Location: LCCOMB_X111_Y17_N0
\CounterDosAnos2|s_value~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosAnos2|s_value~0_combout\ = (!\SW[0]~input_o\ & ((\CounterDosAnos2|s_value\(0) & (!\CounterDosAnos2|s_value\(1) & !\CounterDosAnos2|termCnt~0_combout\)) # (!\CounterDosAnos2|s_value\(0) & (\CounterDosAnos2|s_value\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \CounterDosAnos2|s_value\(0),
	datac => \CounterDosAnos2|s_value\(1),
	datad => \CounterDosAnos2|termCnt~0_combout\,
	combout => \CounterDosAnos2|s_value~0_combout\);

-- Location: FF_X111_Y17_N1
\CounterDosAnos2|s_value[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \CounterDosAnos2|s_value~0_combout\,
	ena => \CounterDosAnos2|s_value[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CounterDosAnos2|s_value\(1));

-- Location: LCCOMB_X110_Y17_N10
\CounterDosAnos2|Add0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosAnos2|Add0~1_combout\ = \CounterDosAnos2|s_value\(2) $ (((\CounterDosAnos2|s_value\(1) & \CounterDosAnos2|s_value\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CounterDosAnos2|s_value\(2),
	datac => \CounterDosAnos2|s_value\(1),
	datad => \CounterDosAnos2|s_value\(0),
	combout => \CounterDosAnos2|Add0~1_combout\);

-- Location: LCCOMB_X110_Y17_N16
\CounterDosAnos2|s_value~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosAnos2|s_value~3_combout\ = (\CounterDosAnos2|Add0~1_combout\ & (!\SW[0]~input_o\ & ((!\CounterDosAnos2|termCnt~0_combout\) # (!\CounterDosAnos2|s_value\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosAnos2|Add0~1_combout\,
	datab => \CounterDosAnos2|s_value\(0),
	datac => \CounterDosAnos2|termCnt~0_combout\,
	datad => \SW[0]~input_o\,
	combout => \CounterDosAnos2|s_value~3_combout\);

-- Location: FF_X110_Y17_N17
\CounterDosAnos2|s_value[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \CounterDosAnos2|s_value~3_combout\,
	ena => \CounterDosAnos2|s_value[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CounterDosAnos2|s_value\(2));

-- Location: LCCOMB_X111_Y17_N6
\CounterDosAnos3|s_value~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosAnos3|s_value~5_combout\ = (!\SW[0]~input_o\ & !\CounterDosAnos3|s_value\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datac => \CounterDosAnos3|s_value\(0),
	combout => \CounterDosAnos3|s_value~5_combout\);

-- Location: LCCOMB_X111_Y17_N26
\CounterDosAnos2|termCnt~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosAnos2|termCnt~1_combout\ = (!\SW[0]~input_o\ & (!\CounterDosAnos2|s_value\(0) & \CounterDosAnos2|termCnt~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datac => \CounterDosAnos2|s_value\(0),
	datad => \CounterDosAnos2|termCnt~0_combout\,
	combout => \CounterDosAnos2|termCnt~1_combout\);

-- Location: FF_X111_Y17_N27
\CounterDosAnos2|termCnt\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \CounterDosAnos2|termCnt~1_combout\,
	ena => \CounterDosAnos2|s_value[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CounterDosAnos2|termCnt~q\);

-- Location: LCCOMB_X111_Y17_N12
\CounterDosAnos3|s_value[3]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosAnos3|s_value[3]~1_combout\ = (\CounterDosAnos1|termCnt~q\ & (\CounterDosMeses|termCnt~q\ & (\CounterDosAnos2|termCnt~q\ & \CounterDosMeses|s_value~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosAnos1|termCnt~q\,
	datab => \CounterDosMeses|termCnt~q\,
	datac => \CounterDosAnos2|termCnt~q\,
	datad => \CounterDosMeses|s_value~0_combout\,
	combout => \CounterDosAnos3|s_value[3]~1_combout\);

-- Location: LCCOMB_X111_Y17_N2
\CounterDosAnos3|s_value[3]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosAnos3|s_value[3]~2_combout\ = (\SW[0]~input_o\) # (\CounterDosAnos3|s_value[3]~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \SW[0]~input_o\,
	datad => \CounterDosAnos3|s_value[3]~1_combout\,
	combout => \CounterDosAnos3|s_value[3]~2_combout\);

-- Location: FF_X111_Y17_N7
\CounterDosAnos3|s_value[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \CounterDosAnos3|s_value~5_combout\,
	ena => \CounterDosAnos3|s_value[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CounterDosAnos3|s_value\(0));

-- Location: LCCOMB_X111_Y17_N16
\CounterDosAnos3|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosAnos3|Add0~0_combout\ = \CounterDosAnos3|s_value\(3) $ (((\CounterDosAnos3|s_value\(0) & (\CounterDosAnos3|s_value\(1) & \CounterDosAnos3|s_value\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosAnos3|s_value\(0),
	datab => \CounterDosAnos3|s_value\(1),
	datac => \CounterDosAnos3|s_value\(2),
	datad => \CounterDosAnos3|s_value\(3),
	combout => \CounterDosAnos3|Add0~0_combout\);

-- Location: LCCOMB_X111_Y17_N24
\CounterDosAnos3|s_value~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosAnos3|s_value~3_combout\ = (!\SW[0]~input_o\ & (\CounterDosAnos3|Add0~0_combout\ & ((!\CounterDosAnos3|termCnt~0_combout\) # (!\CounterDosAnos3|s_value\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosAnos3|s_value\(0),
	datab => \CounterDosAnos3|termCnt~0_combout\,
	datac => \SW[0]~input_o\,
	datad => \CounterDosAnos3|Add0~0_combout\,
	combout => \CounterDosAnos3|s_value~3_combout\);

-- Location: FF_X111_Y17_N25
\CounterDosAnos3|s_value[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \CounterDosAnos3|s_value~3_combout\,
	ena => \CounterDosAnos3|s_value[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CounterDosAnos3|s_value\(3));

-- Location: LCCOMB_X111_Y17_N8
\CounterDosAnos3|termCnt~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosAnos3|termCnt~0_combout\ = (!\CounterDosAnos3|s_value\(1) & (!\CounterDosAnos3|s_value\(2) & \CounterDosAnos3|s_value\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CounterDosAnos3|s_value\(1),
	datac => \CounterDosAnos3|s_value\(2),
	datad => \CounterDosAnos3|s_value\(3),
	combout => \CounterDosAnos3|termCnt~0_combout\);

-- Location: LCCOMB_X111_Y17_N18
\CounterDosAnos3|s_value~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosAnos3|s_value~0_combout\ = (!\SW[0]~input_o\ & ((\CounterDosAnos3|s_value\(1) & ((!\CounterDosAnos3|s_value\(0)))) # (!\CounterDosAnos3|s_value\(1) & (!\CounterDosAnos3|termCnt~0_combout\ & \CounterDosAnos3|s_value\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \CounterDosAnos3|termCnt~0_combout\,
	datac => \CounterDosAnos3|s_value\(1),
	datad => \CounterDosAnos3|s_value\(0),
	combout => \CounterDosAnos3|s_value~0_combout\);

-- Location: FF_X111_Y17_N19
\CounterDosAnos3|s_value[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \CounterDosAnos3|s_value~0_combout\,
	ena => \CounterDosAnos3|s_value[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CounterDosAnos3|s_value\(1));

-- Location: LCCOMB_X111_Y17_N30
\CounterDosAnos3|Add0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosAnos3|Add0~1_combout\ = \CounterDosAnos3|s_value\(2) $ (((\CounterDosAnos3|s_value\(1) & \CounterDosAnos3|s_value\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CounterDosAnos3|s_value\(1),
	datac => \CounterDosAnos3|s_value\(2),
	datad => \CounterDosAnos3|s_value\(0),
	combout => \CounterDosAnos3|Add0~1_combout\);

-- Location: LCCOMB_X111_Y17_N22
\CounterDosAnos3|s_value~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosAnos3|s_value~4_combout\ = (\CounterDosAnos3|Add0~1_combout\ & (!\SW[0]~input_o\ & ((!\CounterDosAnos3|s_value\(0)) # (!\CounterDosAnos3|termCnt~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosAnos3|Add0~1_combout\,
	datab => \CounterDosAnos3|termCnt~0_combout\,
	datac => \SW[0]~input_o\,
	datad => \CounterDosAnos3|s_value\(0),
	combout => \CounterDosAnos3|s_value~4_combout\);

-- Location: FF_X111_Y17_N23
\CounterDosAnos3|s_value[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \CounterDosAnos3|s_value~4_combout\,
	ena => \CounterDosAnos3|s_value[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CounterDosAnos3|s_value\(2));

-- Location: LCCOMB_X107_Y17_N20
\DispCntrl|WideOr1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \DispCntrl|WideOr1~0_combout\ = (\DispCntrl|Present_state.s4~q\) # ((\DispCntrl|Present_state.s8~q\) # ((\DispCntrl|Present_state.s7~q\) # (\DispCntrl|Present_state.s3~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DispCntrl|Present_state.s4~q\,
	datab => \DispCntrl|Present_state.s8~q\,
	datac => \DispCntrl|Present_state.s7~q\,
	datad => \DispCntrl|Present_state.s3~q\,
	combout => \DispCntrl|WideOr1~0_combout\);

-- Location: LCCOMB_X110_Y17_N22
\Mux|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|Mux1~0_combout\ = (\DispCntrl|WideOr1~0_combout\ & (((\CounterDosAnos3|s_value\(2)) # (\DispCntrl|WideOr2~0_combout\)))) # (!\DispCntrl|WideOr1~0_combout\ & (\CounterDosAnos1|s_value\(2) & ((!\DispCntrl|WideOr2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosAnos1|s_value\(2),
	datab => \CounterDosAnos3|s_value\(2),
	datac => \DispCntrl|WideOr1~0_combout\,
	datad => \DispCntrl|WideOr2~0_combout\,
	combout => \Mux|Mux1~0_combout\);

-- Location: LCCOMB_X112_Y17_N10
\CounterDosAnos4|s_value~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosAnos4|s_value~5_combout\ = (!\SW[0]~input_o\ & !\CounterDosAnos4|s_value\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datac => \CounterDosAnos4|s_value\(0),
	combout => \CounterDosAnos4|s_value~5_combout\);

-- Location: LCCOMB_X111_Y17_N14
\CounterDosAnos3|termCnt~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosAnos3|termCnt~1_combout\ = (!\CounterDosAnos3|s_value\(0) & (\CounterDosAnos3|termCnt~0_combout\ & !\SW[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosAnos3|s_value\(0),
	datab => \CounterDosAnos3|termCnt~0_combout\,
	datac => \SW[0]~input_o\,
	combout => \CounterDosAnos3|termCnt~1_combout\);

-- Location: FF_X111_Y17_N15
\CounterDosAnos3|termCnt\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \CounterDosAnos3|termCnt~1_combout\,
	ena => \CounterDosAnos3|s_value[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CounterDosAnos3|termCnt~q\);

-- Location: LCCOMB_X112_Y17_N2
\CounterDosAnos4|s_value[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosAnos4|s_value[0]~2_combout\ = (\SW[0]~input_o\) # ((\CounterDosAnos3|termCnt~q\ & \CounterDosAnos3|s_value[3]~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosAnos3|termCnt~q\,
	datac => \SW[0]~input_o\,
	datad => \CounterDosAnos3|s_value[3]~1_combout\,
	combout => \CounterDosAnos4|s_value[0]~2_combout\);

-- Location: FF_X112_Y17_N11
\CounterDosAnos4|s_value[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \CounterDosAnos4|s_value~5_combout\,
	ena => \CounterDosAnos4|s_value[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CounterDosAnos4|s_value\(0));

-- Location: LCCOMB_X112_Y17_N28
\CounterDosAnos4|s_value~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosAnos4|s_value~1_combout\ = (!\SW[0]~input_o\ & (\CounterDosAnos4|s_value[0]~0_combout\ & (\CounterDosAnos4|s_value\(0) $ (\CounterDosAnos4|s_value\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \CounterDosAnos4|s_value\(0),
	datac => \CounterDosAnos4|s_value\(1),
	datad => \CounterDosAnos4|s_value[0]~0_combout\,
	combout => \CounterDosAnos4|s_value~1_combout\);

-- Location: FF_X112_Y17_N29
\CounterDosAnos4|s_value[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \CounterDosAnos4|s_value~1_combout\,
	ena => \CounterDosAnos4|s_value[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CounterDosAnos4|s_value\(1));

-- Location: LCCOMB_X112_Y17_N4
\CounterDosAnos4|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosAnos4|Add0~0_combout\ = \CounterDosAnos4|s_value\(3) $ (((\CounterDosAnos4|s_value\(0) & (\CounterDosAnos4|s_value\(2) & \CounterDosAnos4|s_value\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosAnos4|s_value\(0),
	datab => \CounterDosAnos4|s_value\(2),
	datac => \CounterDosAnos4|s_value\(3),
	datad => \CounterDosAnos4|s_value\(1),
	combout => \CounterDosAnos4|Add0~0_combout\);

-- Location: LCCOMB_X112_Y17_N30
\CounterDosAnos4|s_value~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosAnos4|s_value~3_combout\ = (\CounterDosAnos4|s_value[0]~0_combout\ & (\CounterDosAnos4|Add0~0_combout\ & !\SW[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosAnos4|s_value[0]~0_combout\,
	datab => \CounterDosAnos4|Add0~0_combout\,
	datac => \SW[0]~input_o\,
	combout => \CounterDosAnos4|s_value~3_combout\);

-- Location: FF_X112_Y17_N31
\CounterDosAnos4|s_value[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \CounterDosAnos4|s_value~3_combout\,
	ena => \CounterDosAnos4|s_value[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CounterDosAnos4|s_value\(3));

-- Location: LCCOMB_X112_Y17_N12
\CounterDosAnos4|s_value[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosAnos4|s_value[0]~0_combout\ = ((\CounterDosAnos4|s_value\(2)) # ((\CounterDosAnos4|s_value\(1)) # (!\CounterDosAnos4|s_value\(3)))) # (!\CounterDosAnos4|s_value\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosAnos4|s_value\(0),
	datab => \CounterDosAnos4|s_value\(2),
	datac => \CounterDosAnos4|s_value\(3),
	datad => \CounterDosAnos4|s_value\(1),
	combout => \CounterDosAnos4|s_value[0]~0_combout\);

-- Location: LCCOMB_X112_Y17_N18
\CounterDosAnos4|Add0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosAnos4|Add0~1_combout\ = \CounterDosAnos4|s_value\(2) $ (((\CounterDosAnos4|s_value\(0) & \CounterDosAnos4|s_value\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosAnos4|s_value\(0),
	datab => \CounterDosAnos4|s_value\(2),
	datad => \CounterDosAnos4|s_value\(1),
	combout => \CounterDosAnos4|Add0~1_combout\);

-- Location: LCCOMB_X112_Y17_N20
\CounterDosAnos4|s_value~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \CounterDosAnos4|s_value~4_combout\ = (\CounterDosAnos4|s_value[0]~0_combout\ & (!\SW[0]~input_o\ & \CounterDosAnos4|Add0~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosAnos4|s_value[0]~0_combout\,
	datac => \SW[0]~input_o\,
	datad => \CounterDosAnos4|Add0~1_combout\,
	combout => \CounterDosAnos4|s_value~4_combout\);

-- Location: FF_X112_Y17_N21
\CounterDosAnos4|s_value[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \CounterDosAnos4|s_value~4_combout\,
	ena => \CounterDosAnos4|s_value[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CounterDosAnos4|s_value\(2));

-- Location: LCCOMB_X110_Y17_N28
\Mux|Mux1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|Mux1~1_combout\ = (\DispCntrl|WideOr2~0_combout\ & ((\Mux|Mux1~0_combout\ & ((\CounterDosAnos4|s_value\(2)))) # (!\Mux|Mux1~0_combout\ & (\CounterDosAnos2|s_value\(2))))) # (!\DispCntrl|WideOr2~0_combout\ & (((\Mux|Mux1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DispCntrl|WideOr2~0_combout\,
	datab => \CounterDosAnos2|s_value\(2),
	datac => \Mux|Mux1~0_combout\,
	datad => \CounterDosAnos4|s_value\(2),
	combout => \Mux|Mux1~1_combout\);

-- Location: LCCOMB_X107_Y17_N28
\DispCntrl|WideOr0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \DispCntrl|WideOr0~0_combout\ = (\DispCntrl|Present_state.s5~q\) # ((\DispCntrl|Present_state.s7~q\) # ((\DispCntrl|Present_state.s8~q\) # (\DispCntrl|Present_state.s6~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DispCntrl|Present_state.s5~q\,
	datab => \DispCntrl|Present_state.s7~q\,
	datac => \DispCntrl|Present_state.s8~q\,
	datad => \DispCntrl|Present_state.s6~q\,
	combout => \DispCntrl|WideOr0~0_combout\);

-- Location: LCCOMB_X106_Y14_N12
\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = \CounterDosMeses|s_value\(2) $ (VCC)
-- \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY(\CounterDosMeses|s_value\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosMeses|s_value\(2),
	datad => VCC,
	combout => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X106_Y14_N14
\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (\CounterDosMeses|s_value\(3) & (\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)) # (!\CounterDosMeses|s_value\(3) & 
-- (!\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))
-- \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!\CounterDosMeses|s_value\(3) & !\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CounterDosMeses|s_value\(3),
	datad => VCC,
	cin => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X106_Y14_N16
\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (\CounterDosMeses|s_value\(4) & (\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ $ (GND))) # (!\CounterDosMeses|s_value\(4) & 
-- (!\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & VCC))
-- \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((\CounterDosMeses|s_value\(4) & !\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CounterDosMeses|s_value\(4),
	datad => VCC,
	cin => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X106_Y14_N18
\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

-- Location: LCCOMB_X106_Y14_N4
\MesesBCD|Mod0|auto_generated|divider|divider|StageOut[16]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[16]~7_combout\ = (\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ & !\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datad => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[16]~7_combout\);

-- Location: LCCOMB_X106_Y14_N0
\MesesBCD|Mod0|auto_generated|divider|divider|StageOut[16]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[16]~6_combout\ = (\CounterDosMeses|s_value\(2) & \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosMeses|s_value\(2),
	datad => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[16]~6_combout\);

-- Location: LCCOMB_X106_Y14_N24
\MesesBCD|Mod0|auto_generated|divider|divider|StageOut[15]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ = (\CounterDosMeses|s_value\(1) & \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CounterDosMeses|s_value\(1),
	datad => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\);

-- Location: LCCOMB_X106_Y14_N28
\MesesBCD|Mod0|auto_generated|divider|divider|StageOut[15]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[15]~1_combout\ = (\CounterDosMeses|s_value\(1) & !\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CounterDosMeses|s_value\(1),
	datad => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[15]~1_combout\);

-- Location: LCCOMB_X106_Y15_N10
\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = (((\MesesBCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\) # (\MesesBCD|Mod0|auto_generated|divider|divider|StageOut[15]~1_combout\)))
-- \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY((\MesesBCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\) # (\MesesBCD|Mod0|auto_generated|divider|divider|StageOut[15]~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\,
	datab => \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[15]~1_combout\,
	datad => VCC,
	combout => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

-- Location: LCCOMB_X106_Y15_N12
\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ = (\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (((\MesesBCD|Mod0|auto_generated|divider|divider|StageOut[16]~7_combout\) # 
-- (\MesesBCD|Mod0|auto_generated|divider|divider|StageOut[16]~6_combout\)))) # (!\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (!\MesesBCD|Mod0|auto_generated|divider|divider|StageOut[16]~7_combout\ & 
-- (!\MesesBCD|Mod0|auto_generated|divider|divider|StageOut[16]~6_combout\)))
-- \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ = CARRY((!\MesesBCD|Mod0|auto_generated|divider|divider|StageOut[16]~7_combout\ & (!\MesesBCD|Mod0|auto_generated|divider|divider|StageOut[16]~6_combout\ & 
-- !\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[16]~7_combout\,
	datab => \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[16]~6_combout\,
	datad => VCC,
	cin => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\,
	combout => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	cout => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\);

-- Location: LCCOMB_X106_Y14_N26
\MesesBCD|Mod0|auto_generated|divider|divider|StageOut[18]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[18]~2_combout\ = (\CounterDosMeses|s_value\(4) & \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CounterDosMeses|s_value\(4),
	datad => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[18]~2_combout\);

-- Location: LCCOMB_X106_Y14_N30
\MesesBCD|Mod0|auto_generated|divider|divider|StageOut[18]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[18]~3_combout\ = (!\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	combout => \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[18]~3_combout\);

-- Location: LCCOMB_X106_Y14_N6
\MesesBCD|Mod0|auto_generated|divider|divider|StageOut[17]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[17]~4_combout\ = (\CounterDosMeses|s_value\(3) & \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CounterDosMeses|s_value\(3),
	datad => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[17]~4_combout\);

-- Location: LCCOMB_X106_Y14_N10
\MesesBCD|Mod0|auto_generated|divider|divider|StageOut[17]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[17]~5_combout\ = (\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ & !\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datad => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[17]~5_combout\);

-- Location: LCCOMB_X106_Y15_N14
\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ = (\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & (((\MesesBCD|Mod0|auto_generated|divider|divider|StageOut[17]~4_combout\) # 
-- (\MesesBCD|Mod0|auto_generated|divider|divider|StageOut[17]~5_combout\)))) # (!\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((((\MesesBCD|Mod0|auto_generated|divider|divider|StageOut[17]~4_combout\) # 
-- (\MesesBCD|Mod0|auto_generated|divider|divider|StageOut[17]~5_combout\)))))
-- \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ = CARRY((!\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((\MesesBCD|Mod0|auto_generated|divider|divider|StageOut[17]~4_combout\) # 
-- (\MesesBCD|Mod0|auto_generated|divider|divider|StageOut[17]~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[17]~4_combout\,
	datab => \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[17]~5_combout\,
	datad => VCC,
	cin => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\,
	combout => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	cout => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\);

-- Location: LCCOMB_X106_Y15_N16
\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ = CARRY((!\MesesBCD|Mod0|auto_generated|divider|divider|StageOut[18]~2_combout\ & (!\MesesBCD|Mod0|auto_generated|divider|divider|StageOut[18]~3_combout\ & 
-- !\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[18]~2_combout\,
	datab => \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[18]~3_combout\,
	datad => VCC,
	cin => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\,
	cout => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\);

-- Location: LCCOMB_X106_Y15_N18
\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\,
	combout => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

-- Location: LCCOMB_X106_Y15_N8
\MesesBCD|Mod0|auto_generated|divider|divider|StageOut[22]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[22]~9_combout\ = (\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (((\MesesBCD|Mod0|auto_generated|divider|divider|StageOut[16]~6_combout\) # 
-- (\MesesBCD|Mod0|auto_generated|divider|divider|StageOut[16]~7_combout\)))) # (!\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	datab => \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[16]~6_combout\,
	datac => \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[16]~7_combout\,
	datad => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[22]~9_combout\);

-- Location: LCCOMB_X111_Y15_N6
\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = \CounterDosDias|s_value\(2) $ (VCC)
-- \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY(\CounterDosDias|s_value\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CounterDosDias|s_value\(2),
	datad => VCC,
	combout => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X111_Y15_N8
\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (\CounterDosDias|s_value\(3) & (\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)) # (!\CounterDosDias|s_value\(3) & 
-- (!\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))
-- \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!\CounterDosDias|s_value\(3) & !\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CounterDosDias|s_value\(3),
	datad => VCC,
	cin => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X111_Y15_N10
\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (\CounterDosDias|s_value\(4) & (\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ $ (GND))) # (!\CounterDosDias|s_value\(4) & 
-- (!\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & VCC))
-- \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((\CounterDosDias|s_value\(4) & !\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosDias|s_value\(4),
	datad => VCC,
	cin => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X111_Y15_N12
\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

-- Location: LCCOMB_X111_Y15_N20
\DiasBCD|Mod0|auto_generated|divider|divider|StageOut[16]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[16]~6_combout\ = (\CounterDosDias|s_value\(2) & \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CounterDosDias|s_value\(2),
	datad => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[16]~6_combout\);

-- Location: LCCOMB_X111_Y15_N0
\DiasBCD|Mod0|auto_generated|divider|divider|StageOut[16]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[16]~7_combout\ = (\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ & !\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datad => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[16]~7_combout\);

-- Location: LCCOMB_X110_Y15_N12
\DiasBCD|Mod0|auto_generated|divider|divider|StageOut[15]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[15]~1_combout\ = (!\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \CounterDosDias|s_value\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \CounterDosDias|s_value\(1),
	combout => \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[15]~1_combout\);

-- Location: LCCOMB_X110_Y15_N14
\DiasBCD|Mod0|auto_generated|divider|divider|StageOut[15]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ = (\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \CounterDosDias|s_value\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \CounterDosDias|s_value\(1),
	combout => \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\);

-- Location: LCCOMB_X110_Y15_N16
\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = (((\DiasBCD|Mod0|auto_generated|divider|divider|StageOut[15]~1_combout\) # (\DiasBCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\)))
-- \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY((\DiasBCD|Mod0|auto_generated|divider|divider|StageOut[15]~1_combout\) # (\DiasBCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[15]~1_combout\,
	datab => \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\,
	datad => VCC,
	combout => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

-- Location: LCCOMB_X110_Y15_N18
\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ = (\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (((\DiasBCD|Mod0|auto_generated|divider|divider|StageOut[16]~6_combout\) # 
-- (\DiasBCD|Mod0|auto_generated|divider|divider|StageOut[16]~7_combout\)))) # (!\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (!\DiasBCD|Mod0|auto_generated|divider|divider|StageOut[16]~6_combout\ & 
-- (!\DiasBCD|Mod0|auto_generated|divider|divider|StageOut[16]~7_combout\)))
-- \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ = CARRY((!\DiasBCD|Mod0|auto_generated|divider|divider|StageOut[16]~6_combout\ & (!\DiasBCD|Mod0|auto_generated|divider|divider|StageOut[16]~7_combout\ & 
-- !\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[16]~6_combout\,
	datab => \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[16]~7_combout\,
	datad => VCC,
	cin => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\,
	combout => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	cout => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\);

-- Location: LCCOMB_X111_Y15_N2
\DiasBCD|Mod0|auto_generated|divider|divider|StageOut[18]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[18]~2_combout\ = (\CounterDosDias|s_value\(4) & \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosDias|s_value\(4),
	datad => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[18]~2_combout\);

-- Location: LCCOMB_X110_Y15_N2
\DiasBCD|Mod0|auto_generated|divider|divider|StageOut[18]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[18]~3_combout\ = (!\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	combout => \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[18]~3_combout\);

-- Location: LCCOMB_X111_Y15_N4
\DiasBCD|Mod0|auto_generated|divider|divider|StageOut[17]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[17]~4_combout\ = (\CounterDosDias|s_value\(3) & \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CounterDosDias|s_value\(3),
	datad => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[17]~4_combout\);

-- Location: LCCOMB_X111_Y15_N22
\DiasBCD|Mod0|auto_generated|divider|divider|StageOut[17]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[17]~5_combout\ = (\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ & !\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datad => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[17]~5_combout\);

-- Location: LCCOMB_X110_Y15_N20
\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ = (\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & (((\DiasBCD|Mod0|auto_generated|divider|divider|StageOut[17]~4_combout\) # 
-- (\DiasBCD|Mod0|auto_generated|divider|divider|StageOut[17]~5_combout\)))) # (!\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((((\DiasBCD|Mod0|auto_generated|divider|divider|StageOut[17]~4_combout\) # 
-- (\DiasBCD|Mod0|auto_generated|divider|divider|StageOut[17]~5_combout\)))))
-- \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ = CARRY((!\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((\DiasBCD|Mod0|auto_generated|divider|divider|StageOut[17]~4_combout\) # 
-- (\DiasBCD|Mod0|auto_generated|divider|divider|StageOut[17]~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[17]~4_combout\,
	datab => \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[17]~5_combout\,
	datad => VCC,
	cin => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\,
	combout => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	cout => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\);

-- Location: LCCOMB_X110_Y15_N22
\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ = CARRY((!\DiasBCD|Mod0|auto_generated|divider|divider|StageOut[18]~2_combout\ & (!\DiasBCD|Mod0|auto_generated|divider|divider|StageOut[18]~3_combout\ & 
-- !\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[18]~2_combout\,
	datab => \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[18]~3_combout\,
	datad => VCC,
	cin => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\,
	cout => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\);

-- Location: LCCOMB_X110_Y15_N24
\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\,
	combout => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

-- Location: LCCOMB_X110_Y15_N6
\DiasBCD|Mod0|auto_generated|divider|divider|StageOut[22]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[22]~9_combout\ = (\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\DiasBCD|Mod0|auto_generated|divider|divider|StageOut[16]~6_combout\) # 
-- ((\DiasBCD|Mod0|auto_generated|divider|divider|StageOut[16]~7_combout\)))) # (!\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (((\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[16]~6_combout\,
	datab => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	datac => \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[16]~7_combout\,
	datad => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[22]~9_combout\);

-- Location: LCCOMB_X106_Y15_N2
\Mux|Mux1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|Mux1~2_combout\ = (!\DispCntrl|WideOr2~0_combout\ & ((\DispCntrl|WideOr1~0_combout\ & (\MesesBCD|Mod0|auto_generated|divider|divider|StageOut[22]~9_combout\)) # (!\DispCntrl|WideOr1~0_combout\ & 
-- ((\DiasBCD|Mod0|auto_generated|divider|divider|StageOut[22]~9_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DispCntrl|WideOr2~0_combout\,
	datab => \DispCntrl|WideOr1~0_combout\,
	datac => \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[22]~9_combout\,
	datad => \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[22]~9_combout\,
	combout => \Mux|Mux1~2_combout\);

-- Location: LCCOMB_X106_Y15_N30
\Mux|Mux1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|Mux1~3_combout\ = (\DispCntrl|WideOr0~0_combout\ & (\Mux|Mux1~1_combout\)) # (!\DispCntrl|WideOr0~0_combout\ & ((\Mux|Mux1~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|Mux1~1_combout\,
	datab => \DispCntrl|WideOr0~0_combout\,
	datad => \Mux|Mux1~2_combout\,
	combout => \Mux|Mux1~3_combout\);

-- Location: LCCOMB_X110_Y17_N2
\Mux|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|Mux2~0_combout\ = (\DispCntrl|WideOr2~0_combout\ & (((\DispCntrl|WideOr1~0_combout\)))) # (!\DispCntrl|WideOr2~0_combout\ & ((\DispCntrl|WideOr1~0_combout\ & ((!\CounterDosAnos3|s_value\(1)))) # (!\DispCntrl|WideOr1~0_combout\ & 
-- (!\CounterDosAnos1|s_value\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000111110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DispCntrl|WideOr2~0_combout\,
	datab => \CounterDosAnos1|s_value\(1),
	datac => \DispCntrl|WideOr1~0_combout\,
	datad => \CounterDosAnos3|s_value\(1),
	combout => \Mux|Mux2~0_combout\);

-- Location: LCCOMB_X110_Y17_N24
\Mux|Mux2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|Mux2~1_combout\ = (\DispCntrl|WideOr2~0_combout\ & ((\Mux|Mux2~0_combout\ & ((!\CounterDosAnos4|s_value\(1)))) # (!\Mux|Mux2~0_combout\ & (!\CounterDosAnos2|s_value\(1))))) # (!\DispCntrl|WideOr2~0_combout\ & (((\Mux|Mux2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DispCntrl|WideOr2~0_combout\,
	datab => \CounterDosAnos2|s_value\(1),
	datac => \CounterDosAnos4|s_value\(1),
	datad => \Mux|Mux2~0_combout\,
	combout => \Mux|Mux2~1_combout\);

-- Location: LCCOMB_X105_Y15_N14
\MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = \CounterDosMeses|s_value\(2) $ (VCC)
-- \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY(\CounterDosMeses|s_value\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosMeses|s_value\(2),
	datad => VCC,
	combout => \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X105_Y15_N16
\MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (\CounterDosMeses|s_value\(3) & (\MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)) # (!\CounterDosMeses|s_value\(3) & 
-- (!\MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))
-- \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!\CounterDosMeses|s_value\(3) & !\MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosMeses|s_value\(3),
	datad => VCC,
	cin => \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X105_Y15_N18
\MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (\CounterDosMeses|s_value\(4) & (\MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ $ (GND))) # (!\CounterDosMeses|s_value\(4) & 
-- (!\MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & VCC))
-- \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((\CounterDosMeses|s_value\(4) & !\MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CounterDosMeses|s_value\(4),
	datad => VCC,
	cin => \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X105_Y15_N20
\MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

-- Location: LCCOMB_X112_Y15_N24
\DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = \CounterDosDias|s_value\(2) $ (VCC)
-- \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY(\CounterDosDias|s_value\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosDias|s_value\(2),
	datad => VCC,
	combout => \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X112_Y15_N26
\DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (\CounterDosDias|s_value\(3) & (\DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)) # (!\CounterDosDias|s_value\(3) & 
-- (!\DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))
-- \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!\CounterDosDias|s_value\(3) & !\DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosDias|s_value\(3),
	datad => VCC,
	cin => \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X112_Y15_N28
\DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (\CounterDosDias|s_value\(4) & (\DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ $ (GND))) # (!\CounterDosDias|s_value\(4) & 
-- (!\DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & VCC))
-- \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((\CounterDosDias|s_value\(4) & !\DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CounterDosDias|s_value\(4),
	datad => VCC,
	cin => \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X112_Y15_N30
\DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

-- Location: LCCOMB_X105_Y15_N30
\Mux|Mux2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|Mux2~4_combout\ = (\DispCntrl|WideOr1~0_combout\ & ((\MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\) # ((!\DispCntrl|WideOr2~0_combout\)))) # (!\DispCntrl|WideOr1~0_combout\ & (((\DispCntrl|WideOr2~0_combout\ & 
-- \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DispCntrl|WideOr1~0_combout\,
	datab => \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \DispCntrl|WideOr2~0_combout\,
	datad => \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mux|Mux2~4_combout\);

-- Location: LCCOMB_X106_Y15_N4
\Mux|Mux2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|Mux2~3_combout\ = (\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((!\CounterDosMeses|s_value\(1)))) # (!\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & 
-- (!\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	datab => \CounterDosMeses|s_value\(1),
	datad => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mux|Mux2~3_combout\);

-- Location: LCCOMB_X110_Y15_N8
\Mux|Mux2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|Mux2~2_combout\ = (\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((!\CounterDosDias|s_value\(1)))) # (!\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & 
-- (!\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	datac => \CounterDosDias|s_value\(1),
	datad => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mux|Mux2~2_combout\);

-- Location: LCCOMB_X106_Y15_N20
\Mux|Mux2~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|Mux2~5_combout\ = (\DispCntrl|WideOr2~0_combout\ & (\Mux|Mux2~4_combout\)) # (!\DispCntrl|WideOr2~0_combout\ & ((\Mux|Mux2~4_combout\ & (\Mux|Mux2~3_combout\)) # (!\Mux|Mux2~4_combout\ & ((\Mux|Mux2~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DispCntrl|WideOr2~0_combout\,
	datab => \Mux|Mux2~4_combout\,
	datac => \Mux|Mux2~3_combout\,
	datad => \Mux|Mux2~2_combout\,
	combout => \Mux|Mux2~5_combout\);

-- Location: LCCOMB_X106_Y15_N22
\Mux|Mux2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|Mux2~6_combout\ = (\DispCntrl|WideOr0~0_combout\ & (\Mux|Mux2~1_combout\)) # (!\DispCntrl|WideOr0~0_combout\ & ((\Mux|Mux2~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|Mux2~1_combout\,
	datab => \DispCntrl|WideOr0~0_combout\,
	datad => \Mux|Mux2~5_combout\,
	combout => \Mux|Mux2~6_combout\);

-- Location: LCCOMB_X110_Y17_N4
\Mux|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|Mux0~0_combout\ = (\DispCntrl|WideOr2~0_combout\ & (((\DispCntrl|WideOr1~0_combout\)))) # (!\DispCntrl|WideOr2~0_combout\ & ((\DispCntrl|WideOr1~0_combout\ & ((!\CounterDosAnos3|s_value\(3)))) # (!\DispCntrl|WideOr1~0_combout\ & 
-- (!\CounterDosAnos1|s_value\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000111110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DispCntrl|WideOr2~0_combout\,
	datab => \CounterDosAnos1|s_value\(3),
	datac => \DispCntrl|WideOr1~0_combout\,
	datad => \CounterDosAnos3|s_value\(3),
	combout => \Mux|Mux0~0_combout\);

-- Location: LCCOMB_X110_Y17_N18
\Mux|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|Mux0~1_combout\ = (\DispCntrl|WideOr2~0_combout\ & ((\Mux|Mux0~0_combout\ & (!\CounterDosAnos4|s_value\(3))) # (!\Mux|Mux0~0_combout\ & ((!\CounterDosAnos2|s_value\(3)))))) # (!\DispCntrl|WideOr2~0_combout\ & (\Mux|Mux0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110001101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DispCntrl|WideOr2~0_combout\,
	datab => \Mux|Mux0~0_combout\,
	datac => \CounterDosAnos4|s_value\(3),
	datad => \CounterDosAnos2|s_value\(3),
	combout => \Mux|Mux0~1_combout\);

-- Location: LCCOMB_X106_Y15_N26
\MesesBCD|Mod0|auto_generated|divider|divider|StageOut[23]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[23]~8_combout\ = (\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\MesesBCD|Mod0|auto_generated|divider|divider|StageOut[17]~4_combout\) # 
-- ((\MesesBCD|Mod0|auto_generated|divider|divider|StageOut[17]~5_combout\)))) # (!\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (((\MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[17]~4_combout\,
	datab => \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[17]~5_combout\,
	datac => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	datad => \MesesBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[23]~8_combout\);

-- Location: LCCOMB_X106_Y15_N0
\DiasBCD|Mod0|auto_generated|divider|divider|StageOut[23]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[23]~8_combout\ = (\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\DiasBCD|Mod0|auto_generated|divider|divider|StageOut[17]~5_combout\) # 
-- ((\DiasBCD|Mod0|auto_generated|divider|divider|StageOut[17]~4_combout\)))) # (!\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (((\DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[17]~5_combout\,
	datab => \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[17]~4_combout\,
	datac => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \DiasBCD|Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	combout => \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[23]~8_combout\);

-- Location: LCCOMB_X106_Y15_N24
\Mux|Mux0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|Mux0~2_combout\ = (\DispCntrl|WideOr2~0_combout\) # ((\DispCntrl|WideOr1~0_combout\ & (!\MesesBCD|Mod0|auto_generated|divider|divider|StageOut[23]~8_combout\)) # (!\DispCntrl|WideOr1~0_combout\ & 
-- ((!\DiasBCD|Mod0|auto_generated|divider|divider|StageOut[23]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DispCntrl|WideOr2~0_combout\,
	datab => \DispCntrl|WideOr1~0_combout\,
	datac => \MesesBCD|Mod0|auto_generated|divider|divider|StageOut[23]~8_combout\,
	datad => \DiasBCD|Mod0|auto_generated|divider|divider|StageOut[23]~8_combout\,
	combout => \Mux|Mux0~2_combout\);

-- Location: LCCOMB_X106_Y15_N6
\dispAnos0|dataOut~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispAnos0|dataOut~0_combout\ = (!\SW[0]~input_o\ & ((\DispCntrl|WideOr0~0_combout\ & (\Mux|Mux0~1_combout\)) # (!\DispCntrl|WideOr0~0_combout\ & ((\Mux|Mux0~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|Mux0~1_combout\,
	datab => \SW[0]~input_o\,
	datac => \DispCntrl|WideOr0~0_combout\,
	datad => \Mux|Mux0~2_combout\,
	combout => \dispAnos0|dataOut~0_combout\);

-- Location: LCCOMB_X110_Y17_N30
\Mux|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|Mux3~0_combout\ = (\DispCntrl|WideOr2~0_combout\ & (((\DispCntrl|WideOr1~0_combout\)))) # (!\DispCntrl|WideOr2~0_combout\ & ((\DispCntrl|WideOr1~0_combout\ & ((\CounterDosAnos3|s_value\(0)))) # (!\DispCntrl|WideOr1~0_combout\ & 
-- (\CounterDosAnos1|s_value\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosAnos1|s_value\(0),
	datab => \DispCntrl|WideOr2~0_combout\,
	datac => \DispCntrl|WideOr1~0_combout\,
	datad => \CounterDosAnos3|s_value\(0),
	combout => \Mux|Mux3~0_combout\);

-- Location: LCCOMB_X110_Y17_N0
\Mux|Mux3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|Mux3~1_combout\ = (\DispCntrl|WideOr2~0_combout\ & ((\Mux|Mux3~0_combout\ & ((\CounterDosAnos4|s_value\(0)))) # (!\Mux|Mux3~0_combout\ & (\CounterDosAnos2|s_value\(0))))) # (!\DispCntrl|WideOr2~0_combout\ & (((\Mux|Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DispCntrl|WideOr2~0_combout\,
	datab => \CounterDosAnos2|s_value\(0),
	datac => \Mux|Mux3~0_combout\,
	datad => \CounterDosAnos4|s_value\(0),
	combout => \Mux|Mux3~1_combout\);

-- Location: LCCOMB_X105_Y15_N6
\MesesBCD|Div0|auto_generated|divider|divider|StageOut[18]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \MesesBCD|Div0|auto_generated|divider|divider|StageOut[18]~1_combout\ = (\MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ & !\MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	datad => \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \MesesBCD|Div0|auto_generated|divider|divider|StageOut[18]~1_combout\);

-- Location: LCCOMB_X105_Y15_N24
\MesesBCD|Div0|auto_generated|divider|divider|StageOut[18]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \MesesBCD|Div0|auto_generated|divider|divider|StageOut[18]~0_combout\ = (\CounterDosMeses|s_value\(4) & \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CounterDosMeses|s_value\(4),
	datad => \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \MesesBCD|Div0|auto_generated|divider|divider|StageOut[18]~0_combout\);

-- Location: LCCOMB_X105_Y15_N12
\MesesBCD|Div0|auto_generated|divider|divider|StageOut[17]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \MesesBCD|Div0|auto_generated|divider|divider|StageOut[17]~3_combout\ = (\MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ & !\MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datad => \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \MesesBCD|Div0|auto_generated|divider|divider|StageOut[17]~3_combout\);

-- Location: LCCOMB_X105_Y15_N26
\MesesBCD|Div0|auto_generated|divider|divider|StageOut[17]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \MesesBCD|Div0|auto_generated|divider|divider|StageOut[17]~2_combout\ = (\CounterDosMeses|s_value\(3) & \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosMeses|s_value\(3),
	datad => \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \MesesBCD|Div0|auto_generated|divider|divider|StageOut[17]~2_combout\);

-- Location: LCCOMB_X105_Y15_N28
\MesesBCD|Div0|auto_generated|divider|divider|StageOut[16]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \MesesBCD|Div0|auto_generated|divider|divider|StageOut[16]~4_combout\ = (\CounterDosMeses|s_value\(2) & \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosMeses|s_value\(2),
	datad => \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \MesesBCD|Div0|auto_generated|divider|divider|StageOut[16]~4_combout\);

-- Location: LCCOMB_X105_Y15_N10
\MesesBCD|Div0|auto_generated|divider|divider|StageOut[16]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \MesesBCD|Div0|auto_generated|divider|divider|StageOut[16]~5_combout\ = (\MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ & !\MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datad => \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \MesesBCD|Div0|auto_generated|divider|divider|StageOut[16]~5_combout\);

-- Location: LCCOMB_X105_Y15_N8
\MesesBCD|Div0|auto_generated|divider|divider|StageOut[15]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \MesesBCD|Div0|auto_generated|divider|divider|StageOut[15]~7_combout\ = (\CounterDosMeses|s_value\(1) & !\MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CounterDosMeses|s_value\(1),
	datad => \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \MesesBCD|Div0|auto_generated|divider|divider|StageOut[15]~7_combout\);

-- Location: LCCOMB_X105_Y15_N4
\MesesBCD|Div0|auto_generated|divider|divider|StageOut[15]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \MesesBCD|Div0|auto_generated|divider|divider|StageOut[15]~6_combout\ = (\CounterDosMeses|s_value\(1) & \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CounterDosMeses|s_value\(1),
	datad => \MesesBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \MesesBCD|Div0|auto_generated|divider|divider|StageOut[15]~6_combout\);

-- Location: LCCOMB_X109_Y15_N14
\MesesBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \MesesBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1_cout\ = CARRY((\MesesBCD|Div0|auto_generated|divider|divider|StageOut[15]~7_combout\) # (\MesesBCD|Div0|auto_generated|divider|divider|StageOut[15]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MesesBCD|Div0|auto_generated|divider|divider|StageOut[15]~7_combout\,
	datab => \MesesBCD|Div0|auto_generated|divider|divider|StageOut[15]~6_combout\,
	datad => VCC,
	cout => \MesesBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1_cout\);

-- Location: LCCOMB_X109_Y15_N16
\MesesBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \MesesBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3_cout\ = CARRY((!\MesesBCD|Div0|auto_generated|divider|divider|StageOut[16]~4_combout\ & (!\MesesBCD|Div0|auto_generated|divider|divider|StageOut[16]~5_combout\ & 
-- !\MesesBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \MesesBCD|Div0|auto_generated|divider|divider|StageOut[16]~4_combout\,
	datab => \MesesBCD|Div0|auto_generated|divider|divider|StageOut[16]~5_combout\,
	datad => VCC,
	cin => \MesesBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1_cout\,
	cout => \MesesBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3_cout\);

-- Location: LCCOMB_X109_Y15_N18
\MesesBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \MesesBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5_cout\ = CARRY((!\MesesBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3_cout\ & ((\MesesBCD|Div0|auto_generated|divider|divider|StageOut[17]~3_combout\) # 
-- (\MesesBCD|Div0|auto_generated|divider|divider|StageOut[17]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \MesesBCD|Div0|auto_generated|divider|divider|StageOut[17]~3_combout\,
	datab => \MesesBCD|Div0|auto_generated|divider|divider|StageOut[17]~2_combout\,
	datad => VCC,
	cin => \MesesBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3_cout\,
	cout => \MesesBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5_cout\);

-- Location: LCCOMB_X109_Y15_N20
\MesesBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \MesesBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ = CARRY((!\MesesBCD|Div0|auto_generated|divider|divider|StageOut[18]~1_combout\ & (!\MesesBCD|Div0|auto_generated|divider|divider|StageOut[18]~0_combout\ & 
-- !\MesesBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \MesesBCD|Div0|auto_generated|divider|divider|StageOut[18]~1_combout\,
	datab => \MesesBCD|Div0|auto_generated|divider|divider|StageOut[18]~0_combout\,
	datad => VCC,
	cin => \MesesBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5_cout\,
	cout => \MesesBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\);

-- Location: LCCOMB_X109_Y15_N22
\MesesBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \MesesBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \MesesBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \MesesBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\,
	combout => \MesesBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

-- Location: LCCOMB_X112_Y15_N8
\DiasBCD|Div0|auto_generated|divider|divider|StageOut[18]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasBCD|Div0|auto_generated|divider|divider|StageOut[18]~0_combout\ = (\DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \CounterDosDias|s_value\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \CounterDosDias|s_value\(4),
	combout => \DiasBCD|Div0|auto_generated|divider|divider|StageOut[18]~0_combout\);

-- Location: LCCOMB_X112_Y15_N6
\DiasBCD|Div0|auto_generated|divider|divider|StageOut[18]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasBCD|Div0|auto_generated|divider|divider|StageOut[18]~1_combout\ = (!\DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	combout => \DiasBCD|Div0|auto_generated|divider|divider|StageOut[18]~1_combout\);

-- Location: LCCOMB_X112_Y15_N2
\DiasBCD|Div0|auto_generated|divider|divider|StageOut[17]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasBCD|Div0|auto_generated|divider|divider|StageOut[17]~3_combout\ = (!\DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	combout => \DiasBCD|Div0|auto_generated|divider|divider|StageOut[17]~3_combout\);

-- Location: LCCOMB_X112_Y15_N4
\DiasBCD|Div0|auto_generated|divider|divider|StageOut[17]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasBCD|Div0|auto_generated|divider|divider|StageOut[17]~2_combout\ = (\CounterDosDias|s_value\(3) & \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosDias|s_value\(3),
	datac => \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \DiasBCD|Div0|auto_generated|divider|divider|StageOut[17]~2_combout\);

-- Location: LCCOMB_X112_Y15_N10
\DiasBCD|Div0|auto_generated|divider|divider|StageOut[16]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasBCD|Div0|auto_generated|divider|divider|StageOut[16]~5_combout\ = (!\DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	combout => \DiasBCD|Div0|auto_generated|divider|divider|StageOut[16]~5_combout\);

-- Location: LCCOMB_X112_Y15_N0
\DiasBCD|Div0|auto_generated|divider|divider|StageOut[16]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasBCD|Div0|auto_generated|divider|divider|StageOut[16]~4_combout\ = (\DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \CounterDosDias|s_value\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \CounterDosDias|s_value\(2),
	combout => \DiasBCD|Div0|auto_generated|divider|divider|StageOut[16]~4_combout\);

-- Location: LCCOMB_X109_Y15_N30
\DiasBCD|Div0|auto_generated|divider|divider|StageOut[15]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasBCD|Div0|auto_generated|divider|divider|StageOut[15]~6_combout\ = (\CounterDosDias|s_value\(1) & \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CounterDosDias|s_value\(1),
	datad => \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \DiasBCD|Div0|auto_generated|divider|divider|StageOut[15]~6_combout\);

-- Location: LCCOMB_X109_Y15_N0
\DiasBCD|Div0|auto_generated|divider|divider|StageOut[15]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasBCD|Div0|auto_generated|divider|divider|StageOut[15]~7_combout\ = (\CounterDosDias|s_value\(1) & !\DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CounterDosDias|s_value\(1),
	datad => \DiasBCD|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \DiasBCD|Div0|auto_generated|divider|divider|StageOut[15]~7_combout\);

-- Location: LCCOMB_X109_Y15_N4
\DiasBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1_cout\ = CARRY((\DiasBCD|Div0|auto_generated|divider|divider|StageOut[15]~6_combout\) # (\DiasBCD|Div0|auto_generated|divider|divider|StageOut[15]~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DiasBCD|Div0|auto_generated|divider|divider|StageOut[15]~6_combout\,
	datab => \DiasBCD|Div0|auto_generated|divider|divider|StageOut[15]~7_combout\,
	datad => VCC,
	cout => \DiasBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1_cout\);

-- Location: LCCOMB_X109_Y15_N6
\DiasBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3_cout\ = CARRY((!\DiasBCD|Div0|auto_generated|divider|divider|StageOut[16]~5_combout\ & (!\DiasBCD|Div0|auto_generated|divider|divider|StageOut[16]~4_combout\ & 
-- !\DiasBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \DiasBCD|Div0|auto_generated|divider|divider|StageOut[16]~5_combout\,
	datab => \DiasBCD|Div0|auto_generated|divider|divider|StageOut[16]~4_combout\,
	datad => VCC,
	cin => \DiasBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1_cout\,
	cout => \DiasBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3_cout\);

-- Location: LCCOMB_X109_Y15_N8
\DiasBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5_cout\ = CARRY((!\DiasBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3_cout\ & ((\DiasBCD|Div0|auto_generated|divider|divider|StageOut[17]~3_combout\) # 
-- (\DiasBCD|Div0|auto_generated|divider|divider|StageOut[17]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \DiasBCD|Div0|auto_generated|divider|divider|StageOut[17]~3_combout\,
	datab => \DiasBCD|Div0|auto_generated|divider|divider|StageOut[17]~2_combout\,
	datad => VCC,
	cin => \DiasBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3_cout\,
	cout => \DiasBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5_cout\);

-- Location: LCCOMB_X109_Y15_N10
\DiasBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ = CARRY((!\DiasBCD|Div0|auto_generated|divider|divider|StageOut[18]~0_combout\ & (!\DiasBCD|Div0|auto_generated|divider|divider|StageOut[18]~1_combout\ & 
-- !\DiasBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \DiasBCD|Div0|auto_generated|divider|divider|StageOut[18]~0_combout\,
	datab => \DiasBCD|Div0|auto_generated|divider|divider|StageOut[18]~1_combout\,
	datad => VCC,
	cin => \DiasBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5_cout\,
	cout => \DiasBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\);

-- Location: LCCOMB_X109_Y15_N12
\DiasBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \DiasBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \DiasBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \DiasBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\,
	combout => \DiasBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

-- Location: LCCOMB_X109_Y15_N2
\Mux|Mux3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|Mux3~2_combout\ = (\DispCntrl|WideOr2~0_combout\ & (((\DispCntrl|WideOr1~0_combout\) # (!\DiasBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)))) # (!\DispCntrl|WideOr2~0_combout\ & (!\CounterDosDias|s_value\(0) & 
-- (!\DispCntrl|WideOr1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000111001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CounterDosDias|s_value\(0),
	datab => \DispCntrl|WideOr2~0_combout\,
	datac => \DispCntrl|WideOr1~0_combout\,
	datad => \DiasBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mux|Mux3~2_combout\);

-- Location: LCCOMB_X109_Y15_N28
\Mux|Mux3~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|Mux3~3_combout\ = (\DispCntrl|WideOr1~0_combout\ & ((\Mux|Mux3~2_combout\ & ((!\MesesBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\))) # (!\Mux|Mux3~2_combout\ & (!\CounterDosMeses|s_value\(0))))) # 
-- (!\DispCntrl|WideOr1~0_combout\ & (((\Mux|Mux3~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DispCntrl|WideOr1~0_combout\,
	datab => \CounterDosMeses|s_value\(0),
	datac => \MesesBCD|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \Mux|Mux3~2_combout\,
	combout => \Mux|Mux3~3_combout\);

-- Location: LCCOMB_X109_Y15_N26
\Mux|Mux3~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|Mux3~4_combout\ = (\DispCntrl|WideOr0~0_combout\ & (\Mux|Mux3~1_combout\)) # (!\DispCntrl|WideOr0~0_combout\ & ((\Mux|Mux3~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DispCntrl|WideOr0~0_combout\,
	datac => \Mux|Mux3~1_combout\,
	datad => \Mux|Mux3~3_combout\,
	combout => \Mux|Mux3~4_combout\);

-- Location: LCCOMB_X107_Y16_N26
\dispAnos0|dataOut~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispAnos0|dataOut~1_combout\ = (\Mux|Mux2~6_combout\ & (\dispAnos0|dataOut~0_combout\ & (\Mux|Mux1~3_combout\ $ (\Mux|Mux3~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|Mux1~3_combout\,
	datab => \Mux|Mux2~6_combout\,
	datac => \dispAnos0|dataOut~0_combout\,
	datad => \Mux|Mux3~4_combout\,
	combout => \dispAnos0|dataOut~1_combout\);

-- Location: LCCOMB_X107_Y16_N24
\dispAnos0|dataOut[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispAnos0|dataOut[0]~feeder_combout\ = \dispAnos0|dataOut~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dispAnos0|dataOut~1_combout\,
	combout => \dispAnos0|dataOut[0]~feeder_combout\);

-- Location: LCCOMB_X107_Y17_N26
\dispAnos0|dataOut[4]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispAnos0|dataOut[4]~2_combout\ = (\DispCntrl|Present_state.s5~q\) # (\SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DispCntrl|Present_state.s5~q\,
	datad => \SW[0]~input_o\,
	combout => \dispAnos0|dataOut[4]~2_combout\);

-- Location: FF_X107_Y16_N25
\dispAnos0|dataOut[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \dispAnos0|dataOut[0]~feeder_combout\,
	ena => \dispAnos0|dataOut[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispAnos0|dataOut\(0));

-- Location: LCCOMB_X107_Y15_N22
\Mux|Mux0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|Mux0~3_combout\ = (\DispCntrl|WideOr0~0_combout\ & (\Mux|Mux0~1_combout\)) # (!\DispCntrl|WideOr0~0_combout\ & ((\Mux|Mux0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DispCntrl|WideOr0~0_combout\,
	datab => \Mux|Mux0~1_combout\,
	datad => \Mux|Mux0~2_combout\,
	combout => \Mux|Mux0~3_combout\);

-- Location: LCCOMB_X108_Y15_N0
\Bin7SegDecoder|decOut_n[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Bin7SegDecoder|decOut_n[1]~0_combout\ = (\Mux|Mux1~3_combout\ & (\Mux|Mux0~3_combout\ & (\Mux|Mux2~6_combout\ $ (!\Mux|Mux3~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|Mux2~6_combout\,
	datab => \Mux|Mux1~3_combout\,
	datac => \Mux|Mux3~4_combout\,
	datad => \Mux|Mux0~3_combout\,
	combout => \Bin7SegDecoder|decOut_n[1]~0_combout\);

-- Location: LCCOMB_X108_Y15_N16
\dispAnos0|dataOut~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispAnos0|dataOut~3_combout\ = (!\SW[0]~input_o\ & \Bin7SegDecoder|decOut_n[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SW[0]~input_o\,
	datad => \Bin7SegDecoder|decOut_n[1]~0_combout\,
	combout => \dispAnos0|dataOut~3_combout\);

-- Location: LCCOMB_X107_Y15_N24
\dispAnos0|dataOut[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispAnos0|dataOut[1]~feeder_combout\ = \dispAnos0|dataOut~3_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \dispAnos0|dataOut~3_combout\,
	combout => \dispAnos0|dataOut[1]~feeder_combout\);

-- Location: FF_X107_Y15_N25
\dispAnos0|dataOut[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \dispAnos0|dataOut[1]~feeder_combout\,
	ena => \dispAnos0|dataOut[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispAnos0|dataOut\(1));

-- Location: LCCOMB_X107_Y15_N26
\dispAnos0|dataOut~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispAnos0|dataOut~4_combout\ = (\Mux|Mux0~3_combout\ & (!\Mux|Mux1~3_combout\ & !\Mux|Mux2~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|Mux0~3_combout\,
	datab => \Mux|Mux1~3_combout\,
	datad => \Mux|Mux2~6_combout\,
	combout => \dispAnos0|dataOut~4_combout\);

-- Location: LCCOMB_X107_Y15_N16
\dispAnos0|dataOut~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispAnos0|dataOut~5_combout\ = (!\SW[0]~input_o\ & (\dispAnos0|dataOut~4_combout\ & !\Mux|Mux3~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datac => \dispAnos0|dataOut~4_combout\,
	datad => \Mux|Mux3~4_combout\,
	combout => \dispAnos0|dataOut~5_combout\);

-- Location: FF_X107_Y15_N27
\dispAnos0|dataOut[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \dispAnos0|dataOut~5_combout\,
	sload => VCC,
	ena => \dispAnos0|dataOut[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispAnos0|dataOut\(2));

-- Location: LCCOMB_X107_Y15_N2
\dispAnos0|dataOut~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispAnos0|dataOut~6_combout\ = (\Mux|Mux0~3_combout\ & ((\Mux|Mux2~6_combout\ & (\Mux|Mux1~3_combout\ & !\Mux|Mux3~4_combout\)) # (!\Mux|Mux2~6_combout\ & (!\Mux|Mux1~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000010010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|Mux2~6_combout\,
	datab => \Mux|Mux1~3_combout\,
	datac => \Mux|Mux0~3_combout\,
	datad => \Mux|Mux3~4_combout\,
	combout => \dispAnos0|dataOut~6_combout\);

-- Location: LCCOMB_X107_Y15_N28
\Bin7SegDecoder|decOut_n[3]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Bin7SegDecoder|decOut_n[3]~1_combout\ = (\Mux|Mux0~3_combout\ & ((\Mux|Mux2~6_combout\ & (\Mux|Mux1~3_combout\ $ (\Mux|Mux3~4_combout\))) # (!\Mux|Mux2~6_combout\ & ((\Mux|Mux3~4_combout\) # (!\Mux|Mux1~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000010010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|Mux2~6_combout\,
	datab => \Mux|Mux1~3_combout\,
	datac => \Mux|Mux0~3_combout\,
	datad => \Mux|Mux3~4_combout\,
	combout => \Bin7SegDecoder|decOut_n[3]~1_combout\);

-- Location: LCCOMB_X107_Y15_N14
\dispAnos0|dataOut~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispAnos0|dataOut~7_combout\ = (!\SW[0]~input_o\ & (\Bin7SegDecoder|decOut_n[3]~1_combout\ & ((!\dispAnos0|dataOut~4_combout\) # (!\dispAnos0|dataOut~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \dispAnos0|dataOut~6_combout\,
	datac => \dispAnos0|dataOut~4_combout\,
	datad => \Bin7SegDecoder|decOut_n[3]~1_combout\,
	combout => \dispAnos0|dataOut~7_combout\);

-- Location: LCCOMB_X107_Y15_N12
\dispAnos0|dataOut[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispAnos0|dataOut[3]~feeder_combout\ = \dispAnos0|dataOut~7_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dispAnos0|dataOut~7_combout\,
	combout => \dispAnos0|dataOut[3]~feeder_combout\);

-- Location: FF_X107_Y15_N13
\dispAnos0|dataOut[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \dispAnos0|dataOut[3]~feeder_combout\,
	ena => \dispAnos0|dataOut[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispAnos0|dataOut\(3));

-- Location: LCCOMB_X110_Y17_N26
\dispAnos0|dataOut~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispAnos0|dataOut~8_combout\ = (!\Mux|Mux1~1_combout\ & \Mux|Mux2~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux|Mux1~1_combout\,
	datad => \Mux|Mux2~1_combout\,
	combout => \dispAnos0|dataOut~8_combout\);

-- Location: LCCOMB_X107_Y15_N4
\dispAnos0|dataOut~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispAnos0|dataOut~9_combout\ = (\DispCntrl|WideOr0~0_combout\ & (\dispAnos0|dataOut~8_combout\)) # (!\DispCntrl|WideOr0~0_combout\ & (((!\Mux|Mux1~2_combout\ & \Mux|Mux2~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DispCntrl|WideOr0~0_combout\,
	datab => \dispAnos0|dataOut~8_combout\,
	datac => \Mux|Mux1~2_combout\,
	datad => \Mux|Mux2~5_combout\,
	combout => \dispAnos0|dataOut~9_combout\);

-- Location: LCCOMB_X108_Y15_N22
\dispAnos0|dataOut~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispAnos0|dataOut~10_combout\ = (!\SW[0]~input_o\ & (!\Mux|Mux0~3_combout\ & (\dispAnos0|dataOut~9_combout\ & \Mux|Mux3~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \Mux|Mux0~3_combout\,
	datac => \dispAnos0|dataOut~9_combout\,
	datad => \Mux|Mux3~4_combout\,
	combout => \dispAnos0|dataOut~10_combout\);

-- Location: LCCOMB_X108_Y15_N28
\dispAnos0|dataOut~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispAnos0|dataOut~11_combout\ = (\Mux|Mux3~4_combout\ & (((\Mux|Mux0~3_combout\)))) # (!\Mux|Mux3~4_combout\ & (\Mux|Mux2~6_combout\ & (\dispAnos0|dataOut~9_combout\ $ (\Mux|Mux0~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|Mux2~6_combout\,
	datab => \Mux|Mux3~4_combout\,
	datac => \dispAnos0|dataOut~9_combout\,
	datad => \Mux|Mux0~3_combout\,
	combout => \dispAnos0|dataOut~11_combout\);

-- Location: LCCOMB_X108_Y15_N10
\dispAnos0|dataOut~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispAnos0|dataOut~12_combout\ = (\dispAnos0|dataOut~10_combout\) # ((\dispAnos0|dataOut~0_combout\ & \dispAnos0|dataOut~11_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dispAnos0|dataOut~0_combout\,
	datac => \dispAnos0|dataOut~10_combout\,
	datad => \dispAnos0|dataOut~11_combout\,
	combout => \dispAnos0|dataOut~12_combout\);

-- Location: LCCOMB_X107_Y15_N30
\dispAnos0|dataOut[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispAnos0|dataOut[4]~feeder_combout\ = \dispAnos0|dataOut~12_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \dispAnos0|dataOut~12_combout\,
	combout => \dispAnos0|dataOut[4]~feeder_combout\);

-- Location: FF_X107_Y15_N31
\dispAnos0|dataOut[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \dispAnos0|dataOut[4]~feeder_combout\,
	ena => \dispAnos0|dataOut[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispAnos0|dataOut\(4));

-- Location: LCCOMB_X107_Y15_N8
\dispAnos0|dataOut~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispAnos0|dataOut~13_combout\ = (!\SW[0]~input_o\ & (\Bin7SegDecoder|decOut_n[3]~1_combout\ & ((\dispAnos0|dataOut~4_combout\) # (!\dispAnos0|dataOut~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \dispAnos0|dataOut~6_combout\,
	datac => \dispAnos0|dataOut~4_combout\,
	datad => \Bin7SegDecoder|decOut_n[3]~1_combout\,
	combout => \dispAnos0|dataOut~13_combout\);

-- Location: LCCOMB_X107_Y15_N20
\dispAnos0|dataOut[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispAnos0|dataOut[5]~feeder_combout\ = \dispAnos0|dataOut~13_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dispAnos0|dataOut~13_combout\,
	combout => \dispAnos0|dataOut[5]~feeder_combout\);

-- Location: FF_X107_Y15_N21
\dispAnos0|dataOut[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \dispAnos0|dataOut[5]~feeder_combout\,
	ena => \dispAnos0|dataOut[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispAnos0|dataOut\(5));

-- Location: LCCOMB_X107_Y15_N6
\dispAnos0|dataOut~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispAnos0|dataOut~14_combout\ = (\Mux|Mux3~4_combout\ & (\Mux|Mux2~6_combout\ $ (\Mux|Mux1~3_combout\ $ (\dispAnos0|dataOut~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|Mux2~6_combout\,
	datab => \Mux|Mux1~3_combout\,
	datac => \Mux|Mux3~4_combout\,
	datad => \dispAnos0|dataOut~9_combout\,
	combout => \dispAnos0|dataOut~14_combout\);

-- Location: LCCOMB_X107_Y15_N10
\dispAnos0|dataOut~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispAnos0|dataOut~15_combout\ = (!\SW[0]~input_o\ & (\dispAnos0|dataOut~9_combout\ $ (((\dispAnos0|dataOut~14_combout\) # (!\Mux|Mux0~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000101000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \dispAnos0|dataOut~9_combout\,
	datac => \Mux|Mux0~3_combout\,
	datad => \dispAnos0|dataOut~14_combout\,
	combout => \dispAnos0|dataOut~15_combout\);

-- Location: FF_X107_Y15_N23
\dispAnos0|dataOut[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \dispAnos0|dataOut~15_combout\,
	sload => VCC,
	ena => \dispAnos0|dataOut[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispAnos0|dataOut\(6));

-- Location: LCCOMB_X109_Y16_N8
\dispAnos1|dataOut[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispAnos1|dataOut[0]~feeder_combout\ = \dispAnos0|dataOut~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \dispAnos0|dataOut~1_combout\,
	combout => \dispAnos1|dataOut[0]~feeder_combout\);

-- Location: LCCOMB_X108_Y17_N16
\dispAnos1|dataOut[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispAnos1|dataOut[1]~0_combout\ = (\DispCntrl|Present_state.s6~q\) # (\SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DispCntrl|Present_state.s6~q\,
	datad => \SW[0]~input_o\,
	combout => \dispAnos1|dataOut[1]~0_combout\);

-- Location: FF_X109_Y16_N9
\dispAnos1|dataOut[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \dispAnos1|dataOut[0]~feeder_combout\,
	ena => \dispAnos1|dataOut[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispAnos1|dataOut\(0));

-- Location: LCCOMB_X108_Y15_N24
\dispAnos1|dataOut[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispAnos1|dataOut[1]~feeder_combout\ = \dispAnos0|dataOut~3_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \dispAnos0|dataOut~3_combout\,
	combout => \dispAnos1|dataOut[1]~feeder_combout\);

-- Location: FF_X108_Y15_N25
\dispAnos1|dataOut[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \dispAnos1|dataOut[1]~feeder_combout\,
	ena => \dispAnos1|dataOut[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispAnos1|dataOut\(1));

-- Location: LCCOMB_X108_Y15_N18
\dispAnos1|dataOut[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispAnos1|dataOut[2]~feeder_combout\ = \dispAnos0|dataOut~5_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dispAnos0|dataOut~5_combout\,
	combout => \dispAnos1|dataOut[2]~feeder_combout\);

-- Location: FF_X108_Y15_N19
\dispAnos1|dataOut[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \dispAnos1|dataOut[2]~feeder_combout\,
	ena => \dispAnos1|dataOut[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispAnos1|dataOut\(2));

-- Location: LCCOMB_X108_Y15_N12
\dispAnos1|dataOut[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispAnos1|dataOut[3]~feeder_combout\ = \dispAnos0|dataOut~7_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \dispAnos0|dataOut~7_combout\,
	combout => \dispAnos1|dataOut[3]~feeder_combout\);

-- Location: FF_X108_Y15_N13
\dispAnos1|dataOut[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \dispAnos1|dataOut[3]~feeder_combout\,
	ena => \dispAnos1|dataOut[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispAnos1|dataOut\(3));

-- Location: LCCOMB_X108_Y15_N14
\dispAnos1|dataOut[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispAnos1|dataOut[4]~feeder_combout\ = \dispAnos0|dataOut~12_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \dispAnos0|dataOut~12_combout\,
	combout => \dispAnos1|dataOut[4]~feeder_combout\);

-- Location: FF_X108_Y15_N15
\dispAnos1|dataOut[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \dispAnos1|dataOut[4]~feeder_combout\,
	ena => \dispAnos1|dataOut[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispAnos1|dataOut\(4));

-- Location: LCCOMB_X108_Y15_N20
\dispAnos1|dataOut[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispAnos1|dataOut[5]~feeder_combout\ = \dispAnos0|dataOut~13_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dispAnos0|dataOut~13_combout\,
	combout => \dispAnos1|dataOut[5]~feeder_combout\);

-- Location: FF_X108_Y15_N21
\dispAnos1|dataOut[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \dispAnos1|dataOut[5]~feeder_combout\,
	ena => \dispAnos1|dataOut[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispAnos1|dataOut\(5));

-- Location: LCCOMB_X108_Y15_N30
\dispAnos1|dataOut[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispAnos1|dataOut[6]~feeder_combout\ = \dispAnos0|dataOut~15_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \dispAnos0|dataOut~15_combout\,
	combout => \dispAnos1|dataOut[6]~feeder_combout\);

-- Location: FF_X108_Y15_N31
\dispAnos1|dataOut[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \dispAnos1|dataOut[6]~feeder_combout\,
	ena => \dispAnos1|dataOut[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispAnos1|dataOut\(6));

-- Location: LCCOMB_X109_Y16_N6
\dispAnos2|dataOut[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispAnos2|dataOut[0]~feeder_combout\ = \dispAnos0|dataOut~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \dispAnos0|dataOut~1_combout\,
	combout => \dispAnos2|dataOut[0]~feeder_combout\);

-- Location: LCCOMB_X108_Y17_N6
\dispAnos2|dataOut[4]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispAnos2|dataOut[4]~0_combout\ = (\DispCntrl|Present_state.s7~q\) # (\SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DispCntrl|Present_state.s7~q\,
	datad => \SW[0]~input_o\,
	combout => \dispAnos2|dataOut[4]~0_combout\);

-- Location: FF_X109_Y16_N7
\dispAnos2|dataOut[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \dispAnos2|dataOut[0]~feeder_combout\,
	ena => \dispAnos2|dataOut[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispAnos2|dataOut\(0));

-- Location: FF_X111_Y15_N21
\dispAnos2|dataOut[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \dispAnos0|dataOut~3_combout\,
	sload => VCC,
	ena => \dispAnos2|dataOut[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispAnos2|dataOut\(1));

-- Location: FF_X111_Y15_N13
\dispAnos2|dataOut[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \dispAnos0|dataOut~5_combout\,
	sload => VCC,
	ena => \dispAnos2|dataOut[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispAnos2|dataOut\(2));

-- Location: FF_X111_Y15_N11
\dispAnos2|dataOut[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \dispAnos0|dataOut~7_combout\,
	sload => VCC,
	ena => \dispAnos2|dataOut[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispAnos2|dataOut\(3));

-- Location: FF_X111_Y15_N3
\dispAnos2|dataOut[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \dispAnos0|dataOut~12_combout\,
	sload => VCC,
	ena => \dispAnos2|dataOut[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispAnos2|dataOut\(4));

-- Location: FF_X111_Y15_N29
\dispAnos2|dataOut[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \dispAnos0|dataOut~13_combout\,
	sload => VCC,
	ena => \dispAnos2|dataOut[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispAnos2|dataOut\(5));

-- Location: FF_X111_Y15_N9
\dispAnos2|dataOut[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \dispAnos0|dataOut~15_combout\,
	sload => VCC,
	ena => \dispAnos2|dataOut[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispAnos2|dataOut\(6));

-- Location: LCCOMB_X108_Y16_N0
\dispAnos3|dataOut[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispAnos3|dataOut[0]~feeder_combout\ = \dispAnos0|dataOut~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \dispAnos0|dataOut~1_combout\,
	combout => \dispAnos3|dataOut[0]~feeder_combout\);

-- Location: LCCOMB_X107_Y17_N12
\dispAnos3|dataOut[4]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispAnos3|dataOut[4]~0_combout\ = (\DispCntrl|Present_state.s8~q\) # (\SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DispCntrl|Present_state.s8~q\,
	datad => \SW[0]~input_o\,
	combout => \dispAnos3|dataOut[4]~0_combout\);

-- Location: FF_X108_Y16_N1
\dispAnos3|dataOut[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \dispAnos3|dataOut[0]~feeder_combout\,
	ena => \dispAnos3|dataOut[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispAnos3|dataOut\(0));

-- Location: LCCOMB_X103_Y15_N0
\dispAnos3|dataOut[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispAnos3|dataOut[1]~feeder_combout\ = \dispAnos0|dataOut~3_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \dispAnos0|dataOut~3_combout\,
	combout => \dispAnos3|dataOut[1]~feeder_combout\);

-- Location: FF_X103_Y15_N1
\dispAnos3|dataOut[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \dispAnos3|dataOut[1]~feeder_combout\,
	ena => \dispAnos3|dataOut[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispAnos3|dataOut\(1));

-- Location: FF_X106_Y15_N15
\dispAnos3|dataOut[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \dispAnos0|dataOut~5_combout\,
	sload => VCC,
	ena => \dispAnos3|dataOut[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispAnos3|dataOut\(2));

-- Location: FF_X106_Y15_N17
\dispAnos3|dataOut[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \dispAnos0|dataOut~7_combout\,
	sload => VCC,
	ena => \dispAnos3|dataOut[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispAnos3|dataOut\(3));

-- Location: FF_X106_Y15_N19
\dispAnos3|dataOut[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \dispAnos0|dataOut~12_combout\,
	sload => VCC,
	ena => \dispAnos3|dataOut[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispAnos3|dataOut\(4));

-- Location: FF_X106_Y15_N11
\dispAnos3|dataOut[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \dispAnos0|dataOut~13_combout\,
	sload => VCC,
	ena => \dispAnos3|dataOut[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispAnos3|dataOut\(5));

-- Location: LCCOMB_X106_Y15_N28
\dispAnos3|dataOut[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispAnos3|dataOut[6]~feeder_combout\ = \dispAnos0|dataOut~15_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \dispAnos0|dataOut~15_combout\,
	combout => \dispAnos3|dataOut[6]~feeder_combout\);

-- Location: FF_X106_Y15_N29
\dispAnos3|dataOut[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \dispAnos3|dataOut[6]~feeder_combout\,
	ena => \dispAnos3|dataOut[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispAnos3|dataOut\(6));

-- Location: LCCOMB_X106_Y16_N12
\dispMes0|dataOut[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispMes0|dataOut[0]~feeder_combout\ = \dispAnos0|dataOut~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \dispAnos0|dataOut~1_combout\,
	combout => \dispMes0|dataOut[0]~feeder_combout\);

-- Location: LCCOMB_X108_Y17_N12
\dispMes0|dataOut[5]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispMes0|dataOut[5]~0_combout\ = (\SW[0]~input_o\) # (\DispCntrl|Present_state.s3~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SW[0]~input_o\,
	datad => \DispCntrl|Present_state.s3~q\,
	combout => \dispMes0|dataOut[5]~0_combout\);

-- Location: FF_X106_Y16_N13
\dispMes0|dataOut[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \dispMes0|dataOut[0]~feeder_combout\,
	ena => \dispMes0|dataOut[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispMes0|dataOut\(0));

-- Location: FF_X109_Y15_N7
\dispMes0|dataOut[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \dispAnos0|dataOut~3_combout\,
	sload => VCC,
	ena => \dispMes0|dataOut[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispMes0|dataOut\(1));

-- Location: LCCOMB_X103_Y15_N6
\dispMes0|dataOut[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispMes0|dataOut[2]~feeder_combout\ = \dispAnos0|dataOut~5_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \dispAnos0|dataOut~5_combout\,
	combout => \dispMes0|dataOut[2]~feeder_combout\);

-- Location: FF_X103_Y15_N7
\dispMes0|dataOut[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \dispMes0|dataOut[2]~feeder_combout\,
	ena => \dispMes0|dataOut[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispMes0|dataOut\(2));

-- Location: LCCOMB_X103_Y15_N4
\dispMes0|dataOut[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispMes0|dataOut[3]~feeder_combout\ = \dispAnos0|dataOut~7_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \dispAnos0|dataOut~7_combout\,
	combout => \dispMes0|dataOut[3]~feeder_combout\);

-- Location: FF_X103_Y15_N5
\dispMes0|dataOut[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \dispMes0|dataOut[3]~feeder_combout\,
	ena => \dispMes0|dataOut[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispMes0|dataOut\(3));

-- Location: FF_X109_Y15_N13
\dispMes0|dataOut[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \dispAnos0|dataOut~12_combout\,
	sload => VCC,
	ena => \dispMes0|dataOut[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispMes0|dataOut\(4));

-- Location: LCCOMB_X109_Y15_N24
\dispMes0|dataOut[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispMes0|dataOut[5]~feeder_combout\ = \dispAnos0|dataOut~13_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \dispAnos0|dataOut~13_combout\,
	combout => \dispMes0|dataOut[5]~feeder_combout\);

-- Location: FF_X109_Y15_N25
\dispMes0|dataOut[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \dispMes0|dataOut[5]~feeder_combout\,
	ena => \dispMes0|dataOut[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispMes0|dataOut\(5));

-- Location: LCCOMB_X103_Y15_N30
\dispMes0|dataOut[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispMes0|dataOut[6]~feeder_combout\ = \dispAnos0|dataOut~15_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \dispAnos0|dataOut~15_combout\,
	combout => \dispMes0|dataOut[6]~feeder_combout\);

-- Location: FF_X103_Y15_N31
\dispMes0|dataOut[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \dispMes0|dataOut[6]~feeder_combout\,
	ena => \dispMes0|dataOut[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispMes0|dataOut\(6));

-- Location: LCCOMB_X106_Y16_N6
\dispMes1|dataOut[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispMes1|dataOut[0]~feeder_combout\ = \dispAnos0|dataOut~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \dispAnos0|dataOut~1_combout\,
	combout => \dispMes1|dataOut[0]~feeder_combout\);

-- Location: LCCOMB_X107_Y17_N2
\dispMes1|dataOut[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispMes1|dataOut[0]~0_combout\ = (\DispCntrl|Present_state.s4~q\) # (\SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DispCntrl|Present_state.s4~q\,
	datad => \SW[0]~input_o\,
	combout => \dispMes1|dataOut[0]~0_combout\);

-- Location: FF_X106_Y16_N7
\dispMes1|dataOut[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \dispMes1|dataOut[0]~feeder_combout\,
	ena => \dispMes1|dataOut[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispMes1|dataOut\(0));

-- Location: FF_X105_Y15_N15
\dispMes1|dataOut[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \dispAnos0|dataOut~3_combout\,
	sload => VCC,
	ena => \dispMes1|dataOut[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispMes1|dataOut\(1));

-- Location: FF_X105_Y15_N5
\dispMes1|dataOut[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \dispAnos0|dataOut~5_combout\,
	sload => VCC,
	ena => \dispMes1|dataOut[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispMes1|dataOut\(2));

-- Location: FF_X105_Y15_N27
\dispMes1|dataOut[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \dispAnos0|dataOut~7_combout\,
	sload => VCC,
	ena => \dispMes1|dataOut[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispMes1|dataOut\(3));

-- Location: FF_X105_Y15_N17
\dispMes1|dataOut[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \dispAnos0|dataOut~12_combout\,
	sload => VCC,
	ena => \dispMes1|dataOut[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispMes1|dataOut\(4));

-- Location: FF_X105_Y15_N13
\dispMes1|dataOut[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \dispAnos0|dataOut~13_combout\,
	sload => VCC,
	ena => \dispMes1|dataOut[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispMes1|dataOut\(5));

-- Location: FF_X105_Y15_N19
\dispMes1|dataOut[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \dispAnos0|dataOut~15_combout\,
	sload => VCC,
	ena => \dispMes1|dataOut[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispMes1|dataOut\(6));

-- Location: LCCOMB_X108_Y16_N2
\dispDias0|dataOut[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispDias0|dataOut[0]~feeder_combout\ = \dispAnos0|dataOut~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \dispAnos0|dataOut~1_combout\,
	combout => \dispDias0|dataOut[0]~feeder_combout\);

-- Location: LCCOMB_X108_Y17_N2
\dispDias0|dataOut[4]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispDias0|dataOut[4]~0_combout\ = (\DispCntrl|Present_state.s1~q\) # (\SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DispCntrl|Present_state.s1~q\,
	datad => \SW[0]~input_o\,
	combout => \dispDias0|dataOut[4]~0_combout\);

-- Location: FF_X108_Y16_N3
\dispDias0|dataOut[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \dispDias0|dataOut[0]~feeder_combout\,
	ena => \dispDias0|dataOut[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispDias0|dataOut\(0));

-- Location: FF_X109_Y15_N31
\dispDias0|dataOut[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \dispAnos0|dataOut~3_combout\,
	sload => VCC,
	ena => \dispDias0|dataOut[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispDias0|dataOut\(1));

-- Location: FF_X106_Y15_N23
\dispDias0|dataOut[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \dispAnos0|dataOut~5_combout\,
	sload => VCC,
	ena => \dispDias0|dataOut[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispDias0|dataOut\(2));

-- Location: FF_X106_Y15_N5
\dispDias0|dataOut[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \dispAnos0|dataOut~7_combout\,
	sload => VCC,
	ena => \dispDias0|dataOut[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispDias0|dataOut\(3));

-- Location: FF_X109_Y15_N17
\dispDias0|dataOut[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \dispAnos0|dataOut~12_combout\,
	sload => VCC,
	ena => \dispDias0|dataOut[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispDias0|dataOut\(4));

-- Location: FF_X106_Y15_N31
\dispDias0|dataOut[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \dispAnos0|dataOut~13_combout\,
	sload => VCC,
	ena => \dispDias0|dataOut[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispDias0|dataOut\(5));

-- Location: FF_X106_Y15_N13
\dispDias0|dataOut[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \dispAnos0|dataOut~15_combout\,
	sload => VCC,
	ena => \dispDias0|dataOut[4]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispDias0|dataOut\(6));

-- Location: LCCOMB_X107_Y17_N4
\dispDias1|dataOut[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispDias1|dataOut[0]~0_combout\ = (\DispCntrl|Present_state.s2~q\) # (\SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DispCntrl|Present_state.s2~q\,
	datad => \SW[0]~input_o\,
	combout => \dispDias1|dataOut[0]~0_combout\);

-- Location: FF_X107_Y16_N27
\dispDias1|dataOut[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \dispAnos0|dataOut~1_combout\,
	ena => \dispDias1|dataOut[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispDias1|dataOut\(0));

-- Location: FF_X108_Y15_N17
\dispDias1|dataOut[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \dispAnos0|dataOut~3_combout\,
	ena => \dispDias1|dataOut[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispDias1|dataOut\(1));

-- Location: FF_X107_Y15_N17
\dispDias1|dataOut[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \dispAnos0|dataOut~5_combout\,
	ena => \dispDias1|dataOut[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispDias1|dataOut\(2));

-- Location: FF_X107_Y15_N15
\dispDias1|dataOut[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \dispAnos0|dataOut~7_combout\,
	ena => \dispDias1|dataOut[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispDias1|dataOut\(3));

-- Location: FF_X108_Y15_N11
\dispDias1|dataOut[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \dispAnos0|dataOut~12_combout\,
	ena => \dispDias1|dataOut[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispDias1|dataOut\(4));

-- Location: FF_X107_Y15_N9
\dispDias1|dataOut[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \dispAnos0|dataOut~13_combout\,
	ena => \dispDias1|dataOut[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispDias1|dataOut\(5));

-- Location: FF_X107_Y15_N11
\dispDias1|dataOut[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \dispAnos0|dataOut~15_combout\,
	ena => \dispDias1|dataOut[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dispDias1|dataOut\(6));

-- Location: IOIBUF_X115_Y40_N8
\KEY[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

-- Location: IOIBUF_X115_Y53_N15
\KEY[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(1),
	o => \KEY[1]~input_o\);

-- Location: IOIBUF_X115_Y42_N15
\KEY[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(2),
	o => \KEY[2]~input_o\);

ww_HEX0(0) <= \HEX0[0]~output_o\;

ww_HEX0(1) <= \HEX0[1]~output_o\;

ww_HEX0(2) <= \HEX0[2]~output_o\;

ww_HEX0(3) <= \HEX0[3]~output_o\;

ww_HEX0(4) <= \HEX0[4]~output_o\;

ww_HEX0(5) <= \HEX0[5]~output_o\;

ww_HEX0(6) <= \HEX0[6]~output_o\;

ww_HEX1(0) <= \HEX1[0]~output_o\;

ww_HEX1(1) <= \HEX1[1]~output_o\;

ww_HEX1(2) <= \HEX1[2]~output_o\;

ww_HEX1(3) <= \HEX1[3]~output_o\;

ww_HEX1(4) <= \HEX1[4]~output_o\;

ww_HEX1(5) <= \HEX1[5]~output_o\;

ww_HEX1(6) <= \HEX1[6]~output_o\;

ww_HEX2(0) <= \HEX2[0]~output_o\;

ww_HEX2(1) <= \HEX2[1]~output_o\;

ww_HEX2(2) <= \HEX2[2]~output_o\;

ww_HEX2(3) <= \HEX2[3]~output_o\;

ww_HEX2(4) <= \HEX2[4]~output_o\;

ww_HEX2(5) <= \HEX2[5]~output_o\;

ww_HEX2(6) <= \HEX2[6]~output_o\;

ww_HEX3(0) <= \HEX3[0]~output_o\;

ww_HEX3(1) <= \HEX3[1]~output_o\;

ww_HEX3(2) <= \HEX3[2]~output_o\;

ww_HEX3(3) <= \HEX3[3]~output_o\;

ww_HEX3(4) <= \HEX3[4]~output_o\;

ww_HEX3(5) <= \HEX3[5]~output_o\;

ww_HEX3(6) <= \HEX3[6]~output_o\;

ww_HEX4(0) <= \HEX4[0]~output_o\;

ww_HEX4(1) <= \HEX4[1]~output_o\;

ww_HEX4(2) <= \HEX4[2]~output_o\;

ww_HEX4(3) <= \HEX4[3]~output_o\;

ww_HEX4(4) <= \HEX4[4]~output_o\;

ww_HEX4(5) <= \HEX4[5]~output_o\;

ww_HEX4(6) <= \HEX4[6]~output_o\;

ww_HEX5(0) <= \HEX5[0]~output_o\;

ww_HEX5(1) <= \HEX5[1]~output_o\;

ww_HEX5(2) <= \HEX5[2]~output_o\;

ww_HEX5(3) <= \HEX5[3]~output_o\;

ww_HEX5(4) <= \HEX5[4]~output_o\;

ww_HEX5(5) <= \HEX5[5]~output_o\;

ww_HEX5(6) <= \HEX5[6]~output_o\;

ww_HEX6(0) <= \HEX6[0]~output_o\;

ww_HEX6(1) <= \HEX6[1]~output_o\;

ww_HEX6(2) <= \HEX6[2]~output_o\;

ww_HEX6(3) <= \HEX6[3]~output_o\;

ww_HEX6(4) <= \HEX6[4]~output_o\;

ww_HEX6(5) <= \HEX6[5]~output_o\;

ww_HEX6(6) <= \HEX6[6]~output_o\;

ww_HEX7(0) <= \HEX7[0]~output_o\;

ww_HEX7(1) <= \HEX7[1]~output_o\;

ww_HEX7(2) <= \HEX7[2]~output_o\;

ww_HEX7(3) <= \HEX7[3]~output_o\;

ww_HEX7(4) <= \HEX7[4]~output_o\;

ww_HEX7(5) <= \HEX7[5]~output_o\;

ww_HEX7(6) <= \HEX7[6]~output_o\;

ww_LEDG(0) <= \LEDG[0]~output_o\;

ww_LEDG(1) <= \LEDG[1]~output_o\;

ww_LEDG(2) <= \LEDG[2]~output_o\;

ww_LEDG(3) <= \LEDG[3]~output_o\;

ww_LEDG(4) <= \LEDG[4]~output_o\;

ww_LEDG(5) <= \LEDG[5]~output_o\;

ww_LEDG(6) <= \LEDG[6]~output_o\;

ww_LEDG(7) <= \LEDG[7]~output_o\;

ww_LEDG(8) <= \LEDG[8]~output_o\;

ww_LEDR(0) <= \LEDR[0]~output_o\;

ww_LEDR(1) <= \LEDR[1]~output_o\;

ww_LEDR(2) <= \LEDR[2]~output_o\;

ww_LEDR(3) <= \LEDR[3]~output_o\;

ww_LEDR(4) <= \LEDR[4]~output_o\;

ww_LEDR(5) <= \LEDR[5]~output_o\;

ww_LEDR(6) <= \LEDR[6]~output_o\;

ww_LEDR(7) <= \LEDR[7]~output_o\;

ww_LEDR(8) <= \LEDR[8]~output_o\;

ww_LEDR(9) <= \LEDR[9]~output_o\;

ww_LEDR(10) <= \LEDR[10]~output_o\;

ww_LEDR(11) <= \LEDR[11]~output_o\;

ww_LEDR(12) <= \LEDR[12]~output_o\;

ww_LEDR(13) <= \LEDR[13]~output_o\;

ww_LEDR(14) <= \LEDR[14]~output_o\;

ww_LEDR(15) <= \LEDR[15]~output_o\;

ww_LEDR(16) <= \LEDR[16]~output_o\;

ww_LEDR(17) <= \LEDR[17]~output_o\;
END structure;


