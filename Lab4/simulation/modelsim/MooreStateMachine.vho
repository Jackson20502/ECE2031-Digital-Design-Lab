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

-- DATE "02/07/2022 23:12:06"

-- 
-- Device: Altera 5CSXFC6D6F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	MooreStateMachine IS
    PORT (
	r_en : OUT std_logic;
	clock : IN std_logic;
	cool : IN std_logic;
	xmas : IN std_logic;
	resetn : IN std_logic;
	g_en : OUT std_logic;
	b_en : OUT std_logic;
	Q : OUT std_logic_vector(1 DOWNTO 0)
	);
END MooreStateMachine;

-- Design Ports Information
-- r_en	=>  Location: PIN_AA30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- g_en	=>  Location: PIN_W25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- b_en	=>  Location: PIN_AE29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- Q[1]	=>  Location: PIN_AB27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- Q[0]	=>  Location: PIN_AC29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- xmas	=>  Location: PIN_AB30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- cool	=>  Location: PIN_AB28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- clock	=>  Location: PIN_Y27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- resetn	=>  Location: PIN_AA28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF MooreStateMachine IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_r_en : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_cool : std_logic;
SIGNAL ww_xmas : std_logic;
SIGNAL ww_resetn : std_logic;
SIGNAL ww_g_en : std_logic;
SIGNAL ww_b_en : std_logic;
SIGNAL ww_Q : std_logic_vector(1 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputCLKENA0_outclk\ : std_logic;
SIGNAL \inst7|10~0_combout\ : std_logic;
SIGNAL \resetn~input_o\ : std_logic;
SIGNAL \inst7|10~q\ : std_logic;
SIGNAL \cool~input_o\ : std_logic;
SIGNAL \xmas~input_o\ : std_logic;
SIGNAL \inst3~0_combout\ : std_logic;
SIGNAL \inst7|9~q\ : std_logic;
SIGNAL \inst5~combout\ : std_logic;
SIGNAL \ALT_INV_cool~input_o\ : std_logic;
SIGNAL \ALT_INV_xmas~input_o\ : std_logic;
SIGNAL \ALT_INV_inst5~combout\ : std_logic;
SIGNAL \inst7|ALT_INV_10~q\ : std_logic;
SIGNAL \inst7|ALT_INV_9~q\ : std_logic;

BEGIN

r_en <= ww_r_en;
ww_clock <= clock;
ww_cool <= cool;
ww_xmas <= xmas;
ww_resetn <= resetn;
g_en <= ww_g_en;
b_en <= ww_b_en;
Q <= ww_Q;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_cool~input_o\ <= NOT \cool~input_o\;
\ALT_INV_xmas~input_o\ <= NOT \xmas~input_o\;
\ALT_INV_inst5~combout\ <= NOT \inst5~combout\;
\inst7|ALT_INV_10~q\ <= NOT \inst7|10~q\;
\inst7|ALT_INV_9~q\ <= NOT \inst7|9~q\;

-- Location: IOOBUF_X89_Y21_N22
\r_en~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_inst5~combout\,
	devoe => ww_devoe,
	o => ww_r_en);

-- Location: IOOBUF_X89_Y20_N45
\g_en~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|10~q\,
	devoe => ww_devoe,
	o => ww_g_en);

-- Location: IOOBUF_X89_Y23_N39
\b_en~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|9~q\,
	devoe => ww_devoe,
	o => ww_b_en);

-- Location: IOOBUF_X89_Y23_N22
\Q[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|9~q\,
	devoe => ww_devoe,
	o => ww_Q(1));

-- Location: IOOBUF_X89_Y20_N96
\Q[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|10~q\,
	devoe => ww_devoe,
	o => ww_Q(0));

-- Location: IOIBUF_X89_Y25_N21
\clock~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

-- Location: CLKCTRL_G10
\clock~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clock~input_o\,
	outclk => \clock~inputCLKENA0_outclk\);

-- Location: LABCELL_X88_Y21_N36
\inst7|10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst7|10~0_combout\ = ( !\inst5~combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_inst5~combout\,
	combout => \inst7|10~0_combout\);

-- Location: IOIBUF_X89_Y21_N55
\resetn~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_resetn,
	o => \resetn~input_o\);

-- Location: FF_X88_Y21_N38
\inst7|10\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \inst7|10~0_combout\,
	clrn => \resetn~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|10~q\);

-- Location: IOIBUF_X89_Y21_N38
\cool~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_cool,
	o => \cool~input_o\);

-- Location: IOIBUF_X89_Y21_N4
\xmas~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_xmas,
	o => \xmas~input_o\);

-- Location: LABCELL_X88_Y21_N42
\inst3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3~0_combout\ = ( \inst7|9~q\ & ( \inst7|10~q\ & ( (!\xmas~input_o\) # (\cool~input_o\) ) ) ) # ( !\inst7|9~q\ & ( \inst7|10~q\ & ( (!\xmas~input_o\) # (\cool~input_o\) ) ) ) # ( \inst7|9~q\ & ( !\inst7|10~q\ & ( \cool~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010101010101010111110101111101011111010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_cool~input_o\,
	datac => \ALT_INV_xmas~input_o\,
	datae => \inst7|ALT_INV_9~q\,
	dataf => \inst7|ALT_INV_10~q\,
	combout => \inst3~0_combout\);

-- Location: FF_X88_Y21_N44
\inst7|9\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \inst3~0_combout\,
	clrn => \resetn~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|9~q\);

-- Location: LABCELL_X88_Y21_N51
inst5 : cyclonev_lcell_comb
-- Equation(s):
-- \inst5~combout\ = ( \inst7|10~q\ & ( \inst7|9~q\ ) ) # ( !\inst7|10~q\ & ( \inst7|9~q\ ) ) # ( \inst7|10~q\ & ( !\inst7|9~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \inst7|ALT_INV_10~q\,
	dataf => \inst7|ALT_INV_9~q\,
	combout => \inst5~combout\);

-- Location: LABCELL_X55_Y26_N3
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


