-- Copyright (C) 2019  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 19.1.0 Build 670 09/22/2019 SJ Lite Edition"

-- DATE "01/19/2022 19:40:08"

-- 
-- Device: Altera 5CSXFC6D6F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	DogDaycare IS
    PORT (
	alarm : OUT std_logic;
	F2 : IN std_logic;
	B2 : IN std_logic;
	B1 : IN std_logic;
	F1 : IN std_logic;
	M : IN std_logic;
	warning : OUT std_logic
	);
END DogDaycare;

-- Design Ports Information
-- alarm	=>  Location: PIN_AA24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- warning	=>  Location: PIN_AC22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- F2	=>  Location: PIN_AC30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B2	=>  Location: PIN_Y27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B1	=>  Location: PIN_AB30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- M	=>  Location: PIN_W25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- F1	=>  Location: PIN_AB28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF DogDaycare IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_alarm : std_logic;
SIGNAL ww_F2 : std_logic;
SIGNAL ww_B2 : std_logic;
SIGNAL ww_B1 : std_logic;
SIGNAL ww_F1 : std_logic;
SIGNAL ww_M : std_logic;
SIGNAL ww_warning : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \F2~input_o\ : std_logic;
SIGNAL \F1~input_o\ : std_logic;
SIGNAL \M~input_o\ : std_logic;
SIGNAL \B2~input_o\ : std_logic;
SIGNAL \B1~input_o\ : std_logic;
SIGNAL \inst9~0_combout\ : std_logic;
SIGNAL \inst12~0_combout\ : std_logic;
SIGNAL \ALT_INV_F1~input_o\ : std_logic;
SIGNAL \ALT_INV_M~input_o\ : std_logic;
SIGNAL \ALT_INV_B1~input_o\ : std_logic;
SIGNAL \ALT_INV_B2~input_o\ : std_logic;
SIGNAL \ALT_INV_F2~input_o\ : std_logic;

BEGIN

alarm <= ww_alarm;
ww_F2 <= F2;
ww_B2 <= B2;
ww_B1 <= B1;
ww_F1 <= F1;
ww_M <= M;
warning <= ww_warning;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_F1~input_o\ <= NOT \F1~input_o\;
\ALT_INV_M~input_o\ <= NOT \M~input_o\;
\ALT_INV_B1~input_o\ <= NOT \B1~input_o\;
\ALT_INV_B2~input_o\ <= NOT \B2~input_o\;
\ALT_INV_F2~input_o\ <= NOT \F2~input_o\;

-- Location: IOOBUF_X89_Y11_N45
\alarm~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst9~0_combout\,
	devoe => ww_devoe,
	o => ww_alarm);

-- Location: IOOBUF_X86_Y0_N2
\warning~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst12~0_combout\,
	devoe => ww_devoe,
	o => ww_warning);

-- Location: IOIBUF_X89_Y25_N55
\F2~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_F2,
	o => \F2~input_o\);

-- Location: IOIBUF_X89_Y21_N38
\F1~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_F1,
	o => \F1~input_o\);

-- Location: IOIBUF_X89_Y20_N44
\M~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_M,
	o => \M~input_o\);

-- Location: IOIBUF_X89_Y25_N21
\B2~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B2,
	o => \B2~input_o\);

-- Location: IOIBUF_X89_Y21_N4
\B1~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B1,
	o => \B1~input_o\);

-- Location: LABCELL_X88_Y21_N0
\inst9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst9~0_combout\ = ( \B1~input_o\ & ( ((\F2~input_o\ & ((\B2~input_o\) # (\M~input_o\)))) # (\F1~input_o\) ) ) # ( !\B1~input_o\ & ( (\B2~input_o\ & (((\F1~input_o\ & \M~input_o\)) # (\F2~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010111001101110111011100000000010101110011011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_F2~input_o\,
	datab => \ALT_INV_F1~input_o\,
	datac => \ALT_INV_M~input_o\,
	datad => \ALT_INV_B2~input_o\,
	datae => \ALT_INV_B1~input_o\,
	combout => \inst9~0_combout\);

-- Location: LABCELL_X88_Y21_N9
\inst12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst12~0_combout\ = ( \B1~input_o\ & ( (!\M~input_o\ & (((\B2~input_o\ & \F1~input_o\)) # (\F2~input_o\))) ) ) # ( !\B1~input_o\ & ( (!\M~input_o\ & (\B2~input_o\ & \F1~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000000010000000101010101000000010000000100000001010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_M~input_o\,
	datab => \ALT_INV_B2~input_o\,
	datac => \ALT_INV_F1~input_o\,
	datad => \ALT_INV_F2~input_o\,
	datae => \ALT_INV_B1~input_o\,
	combout => \inst12~0_combout\);

-- Location: LABCELL_X43_Y24_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


