-- Copyright (C) 2022  Intel Corporation. All rights reserved.
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
-- VERSION "Version 22.1std.0 Build 915 10/25/2022 SC Lite Edition"

-- DATE "03/15/2023 09:19:12"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	add4 IS
    PORT (
	display_suma : OUT std_logic_vector(9 DOWNTO 0);
	a : IN std_logic_vector(3 DOWNTO 0);
	b : IN std_logic_vector(3 DOWNTO 0);
	ans : BUFFER std_logic_vector(4 DOWNTO 0);
	cin : IN std_logic
	);
END add4;

-- Design Ports Information
-- display_suma[0]	=>  Location: PIN_AE26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display_suma[1]	=>  Location: PIN_AE27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display_suma[2]	=>  Location: PIN_AE28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display_suma[3]	=>  Location: PIN_AG27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display_suma[4]	=>  Location: PIN_AF28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display_suma[5]	=>  Location: PIN_AG28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display_suma[6]	=>  Location: PIN_AH28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display_suma[7]	=>  Location: PIN_AJ29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display_suma[8]	=>  Location: PIN_AH29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display_suma[9]	=>  Location: PIN_AH30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ans[0]	=>  Location: PIN_AG12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ans[1]	=>  Location: PIN_AJ6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ans[2]	=>  Location: PIN_AG13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ans[3]	=>  Location: PIN_AJ7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ans[4]	=>  Location: PIN_AF29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[0]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[0]	=>  Location: PIN_AE11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cin	=>  Location: PIN_AD11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[1]	=>  Location: PIN_AC12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[1]	=>  Location: PIN_AC9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[2]	=>  Location: PIN_AF9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[2]	=>  Location: PIN_AD10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[3]	=>  Location: PIN_AF10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[3]	=>  Location: PIN_AE12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF add4 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_display_suma : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_a : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_b : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_ans : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_cin : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \b[2]~input_o\ : std_logic;
SIGNAL \a[2]~input_o\ : std_logic;
SIGNAL \a[0]~input_o\ : std_logic;
SIGNAL \b[0]~input_o\ : std_logic;
SIGNAL \b[1]~input_o\ : std_logic;
SIGNAL \cin~input_o\ : std_logic;
SIGNAL \a[1]~input_o\ : std_logic;
SIGNAL \b_adder1|cout~combout\ : std_logic;
SIGNAL \b_adder2|sum~0_combout\ : std_logic;
SIGNAL \b_adder1|sum~0_combout\ : std_logic;
SIGNAL \b_adder0|sum~0_combout\ : std_logic;
SIGNAL \b[3]~input_o\ : std_logic;
SIGNAL \a[3]~input_o\ : std_logic;
SIGNAL \b_adder3|sum~0_combout\ : std_logic;
SIGNAL \disp|Ram0~0_combout\ : std_logic;
SIGNAL \disp|Ram0~1_combout\ : std_logic;
SIGNAL \disp|Ram0~2_combout\ : std_logic;
SIGNAL \disp|Ram0~3_combout\ : std_logic;
SIGNAL \disp|Ram0~4_combout\ : std_logic;
SIGNAL \disp|Ram0~5_combout\ : std_logic;
SIGNAL \disp|Ram0~6_combout\ : std_logic;
SIGNAL \b_adder3|cout~0_combout\ : std_logic;
SIGNAL \disp|ALT_INV_Ram0~6_combout\ : std_logic;
SIGNAL \b_adder3|ALT_INV_cout~0_combout\ : std_logic;
SIGNAL \ALT_INV_a[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_b[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_cin~input_o\ : std_logic;
SIGNAL \ALT_INV_b[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_a[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_a[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_b[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_a[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_b[3]~input_o\ : std_logic;
SIGNAL \b_adder3|ALT_INV_sum~0_combout\ : std_logic;
SIGNAL \b_adder2|ALT_INV_sum~0_combout\ : std_logic;
SIGNAL \b_adder1|ALT_INV_cout~combout\ : std_logic;
SIGNAL \b_adder1|ALT_INV_sum~0_combout\ : std_logic;
SIGNAL \b_adder0|ALT_INV_sum~0_combout\ : std_logic;

BEGIN

display_suma <= ww_display_suma;
ww_a <= a;
ww_b <= b;
ans <= ww_ans;
ww_cin <= cin;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\disp|ALT_INV_Ram0~6_combout\ <= NOT \disp|Ram0~6_combout\;
\b_adder3|ALT_INV_cout~0_combout\ <= NOT \b_adder3|cout~0_combout\;
\ALT_INV_a[0]~input_o\ <= NOT \a[0]~input_o\;
\ALT_INV_b[0]~input_o\ <= NOT \b[0]~input_o\;
\ALT_INV_cin~input_o\ <= NOT \cin~input_o\;
\ALT_INV_b[1]~input_o\ <= NOT \b[1]~input_o\;
\ALT_INV_a[1]~input_o\ <= NOT \a[1]~input_o\;
\ALT_INV_a[2]~input_o\ <= NOT \a[2]~input_o\;
\ALT_INV_b[2]~input_o\ <= NOT \b[2]~input_o\;
\ALT_INV_a[3]~input_o\ <= NOT \a[3]~input_o\;
\ALT_INV_b[3]~input_o\ <= NOT \b[3]~input_o\;
\b_adder3|ALT_INV_sum~0_combout\ <= NOT \b_adder3|sum~0_combout\;
\b_adder2|ALT_INV_sum~0_combout\ <= NOT \b_adder2|sum~0_combout\;
\b_adder1|ALT_INV_cout~combout\ <= NOT \b_adder1|cout~combout\;
\b_adder1|ALT_INV_sum~0_combout\ <= NOT \b_adder1|sum~0_combout\;
\b_adder0|ALT_INV_sum~0_combout\ <= NOT \b_adder0|sum~0_combout\;

-- Location: IOOBUF_X89_Y8_N39
\display_suma[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \disp|Ram0~0_combout\,
	devoe => ww_devoe,
	o => ww_display_suma(0));

-- Location: IOOBUF_X89_Y11_N79
\display_suma[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \disp|Ram0~1_combout\,
	devoe => ww_devoe,
	o => ww_display_suma(1));

-- Location: IOOBUF_X89_Y11_N96
\display_suma[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \disp|Ram0~2_combout\,
	devoe => ww_devoe,
	o => ww_display_suma(2));

-- Location: IOOBUF_X89_Y4_N79
\display_suma[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \disp|Ram0~3_combout\,
	devoe => ww_devoe,
	o => ww_display_suma(3));

-- Location: IOOBUF_X89_Y13_N56
\display_suma[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \disp|Ram0~4_combout\,
	devoe => ww_devoe,
	o => ww_display_suma(4));

-- Location: IOOBUF_X89_Y13_N39
\display_suma[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \disp|Ram0~5_combout\,
	devoe => ww_devoe,
	o => ww_display_suma(5));

-- Location: IOOBUF_X89_Y4_N96
\display_suma[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \disp|ALT_INV_Ram0~6_combout\,
	devoe => ww_devoe,
	o => ww_display_suma(6));

-- Location: IOOBUF_X89_Y6_N39
\display_suma[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_display_suma(7));

-- Location: IOOBUF_X89_Y6_N56
\display_suma[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \b_adder3|ALT_INV_cout~0_combout\,
	devoe => ww_devoe,
	o => ww_display_suma(8));

-- Location: IOOBUF_X89_Y16_N39
\display_suma[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \b_adder3|ALT_INV_cout~0_combout\,
	devoe => ww_devoe,
	o => ww_display_suma(9));

-- Location: IOOBUF_X26_Y0_N42
\ans[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \b_adder0|sum~0_combout\,
	devoe => ww_devoe,
	o => ww_ans(0));

-- Location: IOOBUF_X26_Y0_N76
\ans[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \b_adder1|sum~0_combout\,
	devoe => ww_devoe,
	o => ww_ans(1));

-- Location: IOOBUF_X26_Y0_N59
\ans[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \b_adder2|sum~0_combout\,
	devoe => ww_devoe,
	o => ww_ans(2));

-- Location: IOOBUF_X26_Y0_N93
\ans[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \b_adder3|sum~0_combout\,
	devoe => ww_devoe,
	o => ww_ans(3));

-- Location: IOOBUF_X89_Y15_N39
\ans[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \b_adder3|cout~0_combout\,
	devoe => ww_devoe,
	o => ww_ans(4));

-- Location: IOIBUF_X4_Y0_N18
\b[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(2),
	o => \b[2]~input_o\);

-- Location: IOIBUF_X8_Y0_N35
\a[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(2),
	o => \a[2]~input_o\);

-- Location: IOIBUF_X12_Y0_N18
\a[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(0),
	o => \a[0]~input_o\);

-- Location: IOIBUF_X4_Y0_N35
\b[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(0),
	o => \b[0]~input_o\);

-- Location: IOIBUF_X4_Y0_N1
\b[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(1),
	o => \b[1]~input_o\);

-- Location: IOIBUF_X2_Y0_N41
\cin~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_cin,
	o => \cin~input_o\);

-- Location: IOIBUF_X16_Y0_N1
\a[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(1),
	o => \a[1]~input_o\);

-- Location: LABCELL_X27_Y2_N42
\b_adder1|cout\ : cyclonev_lcell_comb
-- Equation(s):
-- \b_adder1|cout~combout\ = ( \cin~input_o\ & ( \a[1]~input_o\ & ( ((\b[1]~input_o\) # (\b[0]~input_o\)) # (\a[0]~input_o\) ) ) ) # ( !\cin~input_o\ & ( \a[1]~input_o\ & ( ((\a[0]~input_o\ & \b[0]~input_o\)) # (\b[1]~input_o\) ) ) ) # ( \cin~input_o\ & ( 
-- !\a[1]~input_o\ & ( (\b[1]~input_o\ & ((\b[0]~input_o\) # (\a[0]~input_o\))) ) ) ) # ( !\cin~input_o\ & ( !\a[1]~input_o\ & ( (\a[0]~input_o\ & (\b[0]~input_o\ & \b[1]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000001110000011100011111000111110111111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_a[0]~input_o\,
	datab => \ALT_INV_b[0]~input_o\,
	datac => \ALT_INV_b[1]~input_o\,
	datae => \ALT_INV_cin~input_o\,
	dataf => \ALT_INV_a[1]~input_o\,
	combout => \b_adder1|cout~combout\);

-- Location: LABCELL_X27_Y2_N51
\b_adder2|sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \b_adder2|sum~0_combout\ = ( \b_adder1|cout~combout\ & ( !\b[2]~input_o\ $ (\a[2]~input_o\) ) ) # ( !\b_adder1|cout~combout\ & ( !\b[2]~input_o\ $ (!\a[2]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101001011010010110100101101010100101101001011010010110100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_b[2]~input_o\,
	datac => \ALT_INV_a[2]~input_o\,
	dataf => \b_adder1|ALT_INV_cout~combout\,
	combout => \b_adder2|sum~0_combout\);

-- Location: LABCELL_X27_Y2_N9
\b_adder1|sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \b_adder1|sum~0_combout\ = ( \cin~input_o\ & ( \a[1]~input_o\ & ( !\b[1]~input_o\ $ (((\a[0]~input_o\) # (\b[0]~input_o\))) ) ) ) # ( !\cin~input_o\ & ( \a[1]~input_o\ & ( !\b[1]~input_o\ $ (((\b[0]~input_o\ & \a[0]~input_o\))) ) ) ) # ( \cin~input_o\ & ( 
-- !\a[1]~input_o\ & ( !\b[1]~input_o\ $ (((!\b[0]~input_o\ & !\a[0]~input_o\))) ) ) ) # ( !\cin~input_o\ & ( !\a[1]~input_o\ & ( !\b[1]~input_o\ $ (((!\b[0]~input_o\) # (!\a[0]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101011010010110101010101010101010101001011010010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_b[1]~input_o\,
	datac => \ALT_INV_b[0]~input_o\,
	datad => \ALT_INV_a[0]~input_o\,
	datae => \ALT_INV_cin~input_o\,
	dataf => \ALT_INV_a[1]~input_o\,
	combout => \b_adder1|sum~0_combout\);

-- Location: LABCELL_X27_Y2_N0
\b_adder0|sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \b_adder0|sum~0_combout\ = ( \cin~input_o\ & ( \a[0]~input_o\ & ( \b[0]~input_o\ ) ) ) # ( !\cin~input_o\ & ( \a[0]~input_o\ & ( !\b[0]~input_o\ ) ) ) # ( \cin~input_o\ & ( !\a[0]~input_o\ & ( !\b[0]~input_o\ ) ) ) # ( !\cin~input_o\ & ( !\a[0]~input_o\ & 
-- ( \b[0]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011110011001100110011001100110011000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_b[0]~input_o\,
	datae => \ALT_INV_cin~input_o\,
	dataf => \ALT_INV_a[0]~input_o\,
	combout => \b_adder0|sum~0_combout\);

-- Location: IOIBUF_X2_Y0_N58
\b[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(3),
	o => \b[3]~input_o\);

-- Location: IOIBUF_X4_Y0_N52
\a[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(3),
	o => \a[3]~input_o\);

-- Location: LABCELL_X27_Y2_N24
\b_adder3|sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \b_adder3|sum~0_combout\ = ( \a[3]~input_o\ & ( \b_adder1|cout~combout\ & ( !\b[3]~input_o\ $ (((\a[2]~input_o\) # (\b[2]~input_o\))) ) ) ) # ( !\a[3]~input_o\ & ( \b_adder1|cout~combout\ & ( !\b[3]~input_o\ $ (((!\b[2]~input_o\ & !\a[2]~input_o\))) ) ) ) 
-- # ( \a[3]~input_o\ & ( !\b_adder1|cout~combout\ & ( !\b[3]~input_o\ $ (((\b[2]~input_o\ & \a[2]~input_o\))) ) ) ) # ( !\a[3]~input_o\ & ( !\b_adder1|cout~combout\ & ( !\b[3]~input_o\ $ (((!\b[2]~input_o\) # (!\a[2]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100111100110011001100001100111100110011001100001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_b[3]~input_o\,
	datac => \ALT_INV_b[2]~input_o\,
	datad => \ALT_INV_a[2]~input_o\,
	datae => \ALT_INV_a[3]~input_o\,
	dataf => \b_adder1|ALT_INV_cout~combout\,
	combout => \b_adder3|sum~0_combout\);

-- Location: LABCELL_X27_Y2_N30
\disp|Ram0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \disp|Ram0~0_combout\ = ( \b_adder3|sum~0_combout\ & ( (\b_adder0|sum~0_combout\ & (!\b_adder2|sum~0_combout\ $ (!\b_adder1|sum~0_combout\))) ) ) # ( !\b_adder3|sum~0_combout\ & ( (!\b_adder1|sum~0_combout\ & (!\b_adder2|sum~0_combout\ $ 
-- (!\b_adder0|sum~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100100001001000010010000100100000000110000001100000011000000110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \b_adder2|ALT_INV_sum~0_combout\,
	datab => \b_adder1|ALT_INV_sum~0_combout\,
	datac => \b_adder0|ALT_INV_sum~0_combout\,
	dataf => \b_adder3|ALT_INV_sum~0_combout\,
	combout => \disp|Ram0~0_combout\);

-- Location: LABCELL_X27_Y2_N33
\disp|Ram0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \disp|Ram0~1_combout\ = ( \b_adder3|sum~0_combout\ & ( (!\b_adder0|sum~0_combout\ & (\b_adder2|sum~0_combout\)) # (\b_adder0|sum~0_combout\ & ((\b_adder1|sum~0_combout\))) ) ) # ( !\b_adder3|sum~0_combout\ & ( (\b_adder2|sum~0_combout\ & 
-- (!\b_adder1|sum~0_combout\ $ (!\b_adder0|sum~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000101000100000100010100010001010101001100110101010100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \b_adder2|ALT_INV_sum~0_combout\,
	datab => \b_adder1|ALT_INV_sum~0_combout\,
	datad => \b_adder0|ALT_INV_sum~0_combout\,
	dataf => \b_adder3|ALT_INV_sum~0_combout\,
	combout => \disp|Ram0~1_combout\);

-- Location: LABCELL_X27_Y2_N39
\disp|Ram0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \disp|Ram0~2_combout\ = ( \b_adder3|sum~0_combout\ & ( (\b_adder2|sum~0_combout\ & ((!\b_adder0|sum~0_combout\) # (\b_adder1|sum~0_combout\))) ) ) # ( !\b_adder3|sum~0_combout\ & ( (!\b_adder2|sum~0_combout\ & (\b_adder1|sum~0_combout\ & 
-- !\b_adder0|sum~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000000000001000100000000001010101000100010101010100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \b_adder2|ALT_INV_sum~0_combout\,
	datab => \b_adder1|ALT_INV_sum~0_combout\,
	datad => \b_adder0|ALT_INV_sum~0_combout\,
	dataf => \b_adder3|ALT_INV_sum~0_combout\,
	combout => \disp|Ram0~2_combout\);

-- Location: LABCELL_X27_Y2_N36
\disp|Ram0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \disp|Ram0~3_combout\ = ( \b_adder3|sum~0_combout\ & ( (\b_adder1|sum~0_combout\ & (!\b_adder2|sum~0_combout\ $ (\b_adder0|sum~0_combout\))) ) ) # ( !\b_adder3|sum~0_combout\ & ( (!\b_adder2|sum~0_combout\ & (!\b_adder1|sum~0_combout\ & 
-- \b_adder0|sum~0_combout\)) # (\b_adder2|sum~0_combout\ & (!\b_adder1|sum~0_combout\ $ (\b_adder0|sum~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100100101001001010010010100100100100001001000010010000100100001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \b_adder2|ALT_INV_sum~0_combout\,
	datab => \b_adder1|ALT_INV_sum~0_combout\,
	datac => \b_adder0|ALT_INV_sum~0_combout\,
	dataf => \b_adder3|ALT_INV_sum~0_combout\,
	combout => \disp|Ram0~3_combout\);

-- Location: LABCELL_X27_Y2_N15
\disp|Ram0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \disp|Ram0~4_combout\ = ( \b_adder3|sum~0_combout\ & ( (!\b_adder2|sum~0_combout\ & (!\b_adder1|sum~0_combout\ & \b_adder0|sum~0_combout\)) ) ) # ( !\b_adder3|sum~0_combout\ & ( ((\b_adder2|sum~0_combout\ & !\b_adder1|sum~0_combout\)) # 
-- (\b_adder0|sum~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010011111111010001001111111100000000100010000000000010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \b_adder2|ALT_INV_sum~0_combout\,
	datab => \b_adder1|ALT_INV_sum~0_combout\,
	datad => \b_adder0|ALT_INV_sum~0_combout\,
	dataf => \b_adder3|ALT_INV_sum~0_combout\,
	combout => \disp|Ram0~4_combout\);

-- Location: LABCELL_X27_Y2_N18
\disp|Ram0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \disp|Ram0~5_combout\ = ( \b_adder0|sum~0_combout\ & ( !\b_adder3|sum~0_combout\ $ (((\b_adder2|sum~0_combout\ & !\b_adder1|sum~0_combout\))) ) ) # ( !\b_adder0|sum~0_combout\ & ( (!\b_adder2|sum~0_combout\ & (\b_adder1|sum~0_combout\ & 
-- !\b_adder3|sum~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000000100000101101001011010000100000001000001011010010110100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \b_adder2|ALT_INV_sum~0_combout\,
	datab => \b_adder1|ALT_INV_sum~0_combout\,
	datac => \b_adder3|ALT_INV_sum~0_combout\,
	datae => \b_adder0|ALT_INV_sum~0_combout\,
	combout => \disp|Ram0~5_combout\);

-- Location: LABCELL_X27_Y2_N12
\disp|Ram0~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \disp|Ram0~6_combout\ = ( \b_adder3|sum~0_combout\ & ( ((!\b_adder2|sum~0_combout\) # (\b_adder0|sum~0_combout\)) # (\b_adder1|sum~0_combout\) ) ) # ( !\b_adder3|sum~0_combout\ & ( (!\b_adder1|sum~0_combout\ & (\b_adder2|sum~0_combout\)) # 
-- (\b_adder1|sum~0_combout\ & ((!\b_adder2|sum~0_combout\) # (!\b_adder0|sum~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111100111100001111110011110011110011111111111111001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \b_adder1|ALT_INV_sum~0_combout\,
	datac => \b_adder2|ALT_INV_sum~0_combout\,
	datad => \b_adder0|ALT_INV_sum~0_combout\,
	dataf => \b_adder3|ALT_INV_sum~0_combout\,
	combout => \disp|Ram0~6_combout\);

-- Location: LABCELL_X27_Y2_N57
\b_adder3|cout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \b_adder3|cout~0_combout\ = ( \a[3]~input_o\ & ( \b_adder1|cout~combout\ & ( ((\b[3]~input_o\) # (\a[2]~input_o\)) # (\b[2]~input_o\) ) ) ) # ( !\a[3]~input_o\ & ( \b_adder1|cout~combout\ & ( (\b[3]~input_o\ & ((\a[2]~input_o\) # (\b[2]~input_o\))) ) ) ) 
-- # ( \a[3]~input_o\ & ( !\b_adder1|cout~combout\ & ( ((\b[2]~input_o\ & \a[2]~input_o\)) # (\b[3]~input_o\) ) ) ) # ( !\a[3]~input_o\ & ( !\b_adder1|cout~combout\ & ( (\b[2]~input_o\ & (\a[2]~input_o\ & \b[3]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000111110001111100000111000001110111111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_b[2]~input_o\,
	datab => \ALT_INV_a[2]~input_o\,
	datac => \ALT_INV_b[3]~input_o\,
	datae => \ALT_INV_a[3]~input_o\,
	dataf => \b_adder1|ALT_INV_cout~combout\,
	combout => \b_adder3|cout~0_combout\);

-- Location: LABCELL_X9_Y33_N3
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


