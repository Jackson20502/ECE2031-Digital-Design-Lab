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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "02/18/2022 12:45:36"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          StateMachineVHDL
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY StateMachineVHDL_vhd_vec_tst IS
END StateMachineVHDL_vhd_vec_tst;
ARCHITECTURE StateMachineVHDL_arch OF StateMachineVHDL_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL b_en : STD_LOGIC;
SIGNAL clk : STD_LOGIC;
SIGNAL cool : STD_LOGIC;
SIGNAL g_en : STD_LOGIC;
SIGNAL Q : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL r_en : STD_LOGIC;
SIGNAL resetn : STD_LOGIC;
SIGNAL xmas : STD_LOGIC;
COMPONENT StateMachineVHDL
	PORT (
	b_en : OUT STD_LOGIC;
	clk : IN STD_LOGIC;
	cool : IN STD_LOGIC;
	g_en : OUT STD_LOGIC;
	Q : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	r_en : OUT STD_LOGIC;
	resetn : IN STD_LOGIC;
	xmas : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : StateMachineVHDL
	PORT MAP (
-- list connections between master ports and signals
	b_en => b_en,
	clk => clk,
	cool => cool,
	g_en => g_en,
	Q => Q,
	r_en => r_en,
	resetn => resetn,
	xmas => xmas
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 25000 ps;
	clk <= '1';
	WAIT FOR 25000 ps;
	IF (NOW >= 1600000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;

-- resetn
t_prcs_resetn: PROCESS
BEGIN
	resetn <= '0';
	WAIT FOR 40000 ps;
	resetn <= '1';
WAIT;
END PROCESS t_prcs_resetn;

-- xmas
t_prcs_xmas: PROCESS
BEGIN
LOOP
	xmas <= '0';
	WAIT FOR 800000 ps;
	xmas <= '1';
	WAIT FOR 800000 ps;
	IF (NOW >= 1600000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_xmas;

-- cool
t_prcs_cool: PROCESS
BEGIN
	cool <= '0';
	WAIT FOR 340000 ps;
	cool <= '1';
	WAIT FOR 460000 ps;
	cool <= '0';
	WAIT FOR 400000 ps;
	cool <= '1';
WAIT;
END PROCESS t_prcs_cool;
END StateMachineVHDL_arch;
