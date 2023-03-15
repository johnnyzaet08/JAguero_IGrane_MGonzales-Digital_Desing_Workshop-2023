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

-- DATE "03/15/2023 11:29:34"

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
	display_suma : BUFFER std_logic_vector(13 DOWNTO 0);
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
-- display_suma[10]	=>  Location: PIN_AG30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display_suma[11]	=>  Location: PIN_AF29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display_suma[12]	=>  Location: PIN_AF30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display_suma[13]	=>  Location: PIN_AD27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ans[0]	=>  Location: PIN_AD12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ans[1]	=>  Location: PIN_Y16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ans[2]	=>  Location: PIN_W15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ans[3]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ans[4]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
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
SIGNAL ww_display_suma : std_logic_vector(13 DOWNTO 0);
SIGNAL ww_a : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_b : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_ans : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_cin : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \a[0]~input_o\ : std_logic;
SIGNAL \b[1]~input_o\ : std_logic;
SIGNAL \b[0]~input_o\ : std_logic;
SIGNAL \cin~input_o\ : std_logic;
SIGNAL \a[1]~input_o\ : std_logic;
SIGNAL \b_adder1|cout~combout\ : std_logic;
SIGNAL \b[2]~input_o\ : std_logic;
SIGNAL \a[2]~input_o\ : std_logic;
SIGNAL \b_adder2|sum~0_combout\ : std_logic;
SIGNAL \a[3]~input_o\ : std_logic;
SIGNAL \b[3]~input_o\ : std_logic;
SIGNAL \b_adder3|sum~0_combout\ : std_logic;
SIGNAL \b_adder1|sum~0_combout\ : std_logic;
SIGNAL \b_adder0|sum~0_combout\ : std_logic;
SIGNAL \disp|Ram0~0_combout\ : std_logic;
SIGNAL \disp|Ram0~1_combout\ : std_logic;
SIGNAL \disp|Ram0~2_combout\ : std_logic;
SIGNAL \disp|Ram0~3_combout\ : std_logic;
SIGNAL \disp|Ram0~4_combout\ : std_logic;
SIGNAL \disp|Ram0~5_combout\ : std_logic;
SIGNAL \disp|Ram0~6_combout\ : std_logic;
SIGNAL \b_adder3|cout~0_combout\ : std_logic;
SIGNAL \b_adder0|ALT_INV_sum~0_combout\ : std_logic;
SIGNAL \disp|ALT_INV_Ram0~6_combout\ : std_logic;
SIGNAL \b_adder1|ALT_INV_sum~0_combout\ : std_logic;
SIGNAL \b_adder1|ALT_INV_cout~combout\ : std_logic;
SIGNAL \b_adder2|ALT_INV_sum~0_combout\ : std_logic;
SIGNAL \b_adder3|ALT_INV_sum~0_combout\ : std_logic;
SIGNAL \ALT_INV_b[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_a[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_b[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_a[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_b[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_a[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_cin~input_o\ : std_logic;
SIGNAL \ALT_INV_b[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_a[0]~input_o\ : std_logic;
SIGNAL \b_adder3|ALT_INV_cout~0_combout\ : std_logic;

BEGIN

display_suma <= ww_display_suma;
ww_a <= a;
ww_b <= b;
ans <= ww_ans;
ww_cin <= cin;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\b_adder0|ALT_INV_sum~0_combout\ <= NOT \b_adder0|sum~0_combout\;
\disp|ALT_INV_Ram0~6_combout\ <= NOT \disp|Ram0~6_combout\;
\b_adder1|ALT_INV_sum~0_combout\ <= NOT \b_adder1|sum~0_combout\;
\b_adder1|ALT_INV_cout~combout\ <= NOT \b_adder1|cout~combout\;
\b_adder2|ALT_INV_sum~0_combout\ <= NOT \b_adder2|sum~0_combout\;
\b_adder3|ALT_INV_sum~0_combout\ <= NOT \b_adder3|sum~0_combout\;
\ALT_INV_b[3]~input_o\ <= NOT \b[3]~input_o\;
\ALT_INV_a[3]~input_o\ <= NOT \a[3]~input_o\;
\ALT_INV_b[2]~input_o\ <= NOT \b[2]~input_o\;
\ALT_INV_a[2]~input_o\ <= NOT \a[2]~input_o\;
\ALT_INV_b[1]~input_o\ <= NOT \b[1]~input_o\;
\ALT_INV_a[1]~input_o\ <= NOT \a[1]~input_o\;
\ALT_INV_cin~input_o\ <= NOT \cin~input_o\;
\ALT_INV_b[0]~input_o\ <= NOT \b[0]~input_o\;
\ALT_INV_a[0]~input_o\ <= NOT \a[0]~input_o\;
\b_adder3|ALT_INV_cout~0_combout\ <= NOT \b_adder3|cout~0_combout\;

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

-- Location: IOOBUF_X89_Y16_N56
\display_suma[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_display_suma(10));

-- Location: IOOBUF_X89_Y15_N39
\display_suma[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_display_suma(11));

-- Location: IOOBUF_X89_Y15_N56
\display_suma[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_display_suma(12));

-- Location: IOOBUF_X89_Y8_N56
\display_suma[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_display_suma(13));

-- Location: IOOBUF_X16_Y0_N19
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

-- Location: IOOBUF_X40_Y0_N19
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

-- Location: IOOBUF_X40_Y0_N2
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

-- Location: IOOBUF_X36_Y0_N19
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

-- Location: IOOBUF_X36_Y0_N2
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

-- Location: LABCELL_X7_Y1_N42
\b_adder1|cout\ : cyclonev_lcell_comb
-- Equation(s):
-- \b_adder1|cout~combout\ = ( \cin~input_o\ & ( \a[1]~input_o\ & ( ((\b[0]~input_o\) # (\b[1]~input_o\)) # (\a[0]~input_o\) ) ) ) # ( !\cin~input_o\ & ( \a[1]~input_o\ & ( ((\a[0]~input_o\ & \b[0]~input_o\)) # (\b[1]~input_o\) ) ) ) # ( \cin~input_o\ & ( 
-- !\a[1]~input_o\ & ( (\b[1]~input_o\ & ((\b[0]~input_o\) # (\a[0]~input_o\))) ) ) ) # ( !\cin~input_o\ & ( !\a[1]~input_o\ & ( (\a[0]~input_o\ & (\b[1]~input_o\ & \b[0]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000100110001001100110111001101110111111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_a[0]~input_o\,
	datab => \ALT_INV_b[1]~input_o\,
	datac => \ALT_INV_b[0]~input_o\,
	datae => \ALT_INV_cin~input_o\,
	dataf => \ALT_INV_a[1]~input_o\,
	combout => \b_adder1|cout~combout\);

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

-- Location: LABCELL_X7_Y1_N51
\b_adder2|sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \b_adder2|sum~0_combout\ = ( \b[2]~input_o\ & ( \a[2]~input_o\ & ( \b_adder1|cout~combout\ ) ) ) # ( !\b[2]~input_o\ & ( \a[2]~input_o\ & ( !\b_adder1|cout~combout\ ) ) ) # ( \b[2]~input_o\ & ( !\a[2]~input_o\ & ( !\b_adder1|cout~combout\ ) ) ) # ( 
-- !\b[2]~input_o\ & ( !\a[2]~input_o\ & ( \b_adder1|cout~combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111111100001111000011110000111100000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \b_adder1|ALT_INV_cout~combout\,
	datae => \ALT_INV_b[2]~input_o\,
	dataf => \ALT_INV_a[2]~input_o\,
	combout => \b_adder2|sum~0_combout\);

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

-- Location: LABCELL_X7_Y1_N24
\b_adder3|sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \b_adder3|sum~0_combout\ = ( \b[2]~input_o\ & ( \a[2]~input_o\ & ( !\a[3]~input_o\ $ (\b[3]~input_o\) ) ) ) # ( !\b[2]~input_o\ & ( \a[2]~input_o\ & ( !\a[3]~input_o\ $ (!\b[3]~input_o\ $ (\b_adder1|cout~combout\)) ) ) ) # ( \b[2]~input_o\ & ( 
-- !\a[2]~input_o\ & ( !\a[3]~input_o\ $ (!\b[3]~input_o\ $ (\b_adder1|cout~combout\)) ) ) ) # ( !\b[2]~input_o\ & ( !\a[2]~input_o\ & ( !\a[3]~input_o\ $ (!\b[3]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011110000111100001111001100001100111100110000111100001111000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_a[3]~input_o\,
	datac => \ALT_INV_b[3]~input_o\,
	datad => \b_adder1|ALT_INV_cout~combout\,
	datae => \ALT_INV_b[2]~input_o\,
	dataf => \ALT_INV_a[2]~input_o\,
	combout => \b_adder3|sum~0_combout\);

-- Location: LABCELL_X7_Y1_N39
\b_adder1|sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \b_adder1|sum~0_combout\ = ( \cin~input_o\ & ( \a[1]~input_o\ & ( !\b[1]~input_o\ $ (((\a[0]~input_o\) # (\b[0]~input_o\))) ) ) ) # ( !\cin~input_o\ & ( \a[1]~input_o\ & ( !\b[1]~input_o\ $ (((\b[0]~input_o\ & \a[0]~input_o\))) ) ) ) # ( \cin~input_o\ & ( 
-- !\a[1]~input_o\ & ( !\b[1]~input_o\ $ (((!\b[0]~input_o\ & !\a[0]~input_o\))) ) ) ) # ( !\cin~input_o\ & ( !\a[1]~input_o\ & ( !\b[1]~input_o\ $ (((!\b[0]~input_o\) # (!\a[0]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111101011010010110101111000011110000101001011010010100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_b[0]~input_o\,
	datac => \ALT_INV_b[1]~input_o\,
	datad => \ALT_INV_a[0]~input_o\,
	datae => \ALT_INV_cin~input_o\,
	dataf => \ALT_INV_a[1]~input_o\,
	combout => \b_adder1|sum~0_combout\);

-- Location: LABCELL_X7_Y1_N30
\b_adder0|sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \b_adder0|sum~0_combout\ = ( \cin~input_o\ & ( \a[0]~input_o\ & ( \b[0]~input_o\ ) ) ) # ( !\cin~input_o\ & ( \a[0]~input_o\ & ( !\b[0]~input_o\ ) ) ) # ( \cin~input_o\ & ( !\a[0]~input_o\ & ( !\b[0]~input_o\ ) ) ) # ( !\cin~input_o\ & ( !\a[0]~input_o\ & 
-- ( \b[0]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111111100001111000011110000111100000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_b[0]~input_o\,
	datae => \ALT_INV_cin~input_o\,
	dataf => \ALT_INV_a[0]~input_o\,
	combout => \b_adder0|sum~0_combout\);

-- Location: LABCELL_X85_Y8_N3
\disp|Ram0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \disp|Ram0~0_combout\ = ( \b_adder0|sum~0_combout\ & ( (!\b_adder2|sum~0_combout\ & (!\b_adder3|sum~0_combout\ $ (\b_adder1|sum~0_combout\))) # (\b_adder2|sum~0_combout\ & (\b_adder3|sum~0_combout\ & !\b_adder1|sum~0_combout\)) ) ) # ( 
-- !\b_adder0|sum~0_combout\ & ( (\b_adder2|sum~0_combout\ & (!\b_adder3|sum~0_combout\ & !\b_adder1|sum~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000000000000101001010000101001010000000000001010010100001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \b_adder2|ALT_INV_sum~0_combout\,
	datac => \b_adder3|ALT_INV_sum~0_combout\,
	datad => \b_adder1|ALT_INV_sum~0_combout\,
	datae => \b_adder0|ALT_INV_sum~0_combout\,
	combout => \disp|Ram0~0_combout\);

-- Location: LABCELL_X85_Y8_N36
\disp|Ram0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \disp|Ram0~1_combout\ = ( \b_adder0|sum~0_combout\ & ( (!\b_adder1|sum~0_combout\ & (!\b_adder3|sum~0_combout\ & \b_adder2|sum~0_combout\)) # (\b_adder1|sum~0_combout\ & (\b_adder3|sum~0_combout\)) ) ) # ( !\b_adder0|sum~0_combout\ & ( 
-- (\b_adder2|sum~0_combout\ & ((\b_adder3|sum~0_combout\) # (\b_adder1|sum~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011100000111000110010001100100000111000001110001100100011001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \b_adder1|ALT_INV_sum~0_combout\,
	datab => \b_adder3|ALT_INV_sum~0_combout\,
	datac => \b_adder2|ALT_INV_sum~0_combout\,
	datae => \b_adder0|ALT_INV_sum~0_combout\,
	combout => \disp|Ram0~1_combout\);

-- Location: LABCELL_X85_Y8_N12
\disp|Ram0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \disp|Ram0~2_combout\ = ( \b_adder0|sum~0_combout\ & ( (\b_adder1|sum~0_combout\ & (\b_adder3|sum~0_combout\ & \b_adder2|sum~0_combout\)) ) ) # ( !\b_adder0|sum~0_combout\ & ( (!\b_adder3|sum~0_combout\ & (\b_adder1|sum~0_combout\ & 
-- !\b_adder2|sum~0_combout\)) # (\b_adder3|sum~0_combout\ & ((\b_adder2|sum~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100001101000011000000010000000101000011010000110000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \b_adder1|ALT_INV_sum~0_combout\,
	datab => \b_adder3|ALT_INV_sum~0_combout\,
	datac => \b_adder2|ALT_INV_sum~0_combout\,
	datae => \b_adder0|ALT_INV_sum~0_combout\,
	combout => \disp|Ram0~2_combout\);

-- Location: LABCELL_X85_Y8_N21
\disp|Ram0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \disp|Ram0~3_combout\ = ( \b_adder0|sum~0_combout\ & ( (!\b_adder2|sum~0_combout\ & (!\b_adder3|sum~0_combout\ & !\b_adder1|sum~0_combout\)) # (\b_adder2|sum~0_combout\ & ((\b_adder1|sum~0_combout\))) ) ) # ( !\b_adder0|sum~0_combout\ & ( 
-- (!\b_adder2|sum~0_combout\ & (\b_adder3|sum~0_combout\ & \b_adder1|sum~0_combout\)) # (\b_adder2|sum~0_combout\ & (!\b_adder3|sum~0_combout\ & !\b_adder1|sum~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000000001010101000000101010101010000000010101010000001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \b_adder2|ALT_INV_sum~0_combout\,
	datac => \b_adder3|ALT_INV_sum~0_combout\,
	datad => \b_adder1|ALT_INV_sum~0_combout\,
	datae => \b_adder0|ALT_INV_sum~0_combout\,
	combout => \disp|Ram0~3_combout\);

-- Location: LABCELL_X85_Y8_N24
\disp|Ram0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \disp|Ram0~4_combout\ = ( \b_adder0|sum~0_combout\ & ( (!\b_adder3|sum~0_combout\) # ((!\b_adder1|sum~0_combout\ & !\b_adder2|sum~0_combout\)) ) ) # ( !\b_adder0|sum~0_combout\ & ( (!\b_adder1|sum~0_combout\ & (!\b_adder3|sum~0_combout\ & 
-- \b_adder2|sum~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000001000111011001110110000001000000010001110110011101100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \b_adder1|ALT_INV_sum~0_combout\,
	datab => \b_adder3|ALT_INV_sum~0_combout\,
	datac => \b_adder2|ALT_INV_sum~0_combout\,
	datae => \b_adder0|ALT_INV_sum~0_combout\,
	combout => \disp|Ram0~4_combout\);

-- Location: LABCELL_X85_Y8_N33
\disp|Ram0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \disp|Ram0~5_combout\ = ( \b_adder0|sum~0_combout\ & ( !\b_adder3|sum~0_combout\ $ (((\b_adder2|sum~0_combout\ & !\b_adder1|sum~0_combout\))) ) ) # ( !\b_adder0|sum~0_combout\ & ( (!\b_adder2|sum~0_combout\ & (!\b_adder3|sum~0_combout\ & 
-- \b_adder1|sum~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010100000101001011111000000000000101000001010010111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \b_adder2|ALT_INV_sum~0_combout\,
	datac => \b_adder3|ALT_INV_sum~0_combout\,
	datad => \b_adder1|ALT_INV_sum~0_combout\,
	datae => \b_adder0|ALT_INV_sum~0_combout\,
	combout => \disp|Ram0~5_combout\);

-- Location: LABCELL_X85_Y8_N6
\disp|Ram0~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \disp|Ram0~6_combout\ = ( \b_adder0|sum~0_combout\ & ( (!\b_adder1|sum~0_combout\ $ (!\b_adder2|sum~0_combout\)) # (\b_adder3|sum~0_combout\) ) ) # ( !\b_adder0|sum~0_combout\ & ( (!\b_adder3|sum~0_combout\ $ (!\b_adder2|sum~0_combout\)) # 
-- (\b_adder1|sum~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111110101111101011110110111101101111101011111010111101101111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \b_adder1|ALT_INV_sum~0_combout\,
	datab => \b_adder3|ALT_INV_sum~0_combout\,
	datac => \b_adder2|ALT_INV_sum~0_combout\,
	datae => \b_adder0|ALT_INV_sum~0_combout\,
	combout => \disp|Ram0~6_combout\);

-- Location: LABCELL_X7_Y1_N3
\b_adder3|cout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \b_adder3|cout~0_combout\ = ( \b[2]~input_o\ & ( \a[2]~input_o\ & ( (\a[3]~input_o\) # (\b[3]~input_o\) ) ) ) # ( !\b[2]~input_o\ & ( \a[2]~input_o\ & ( (!\b[3]~input_o\ & (\b_adder1|cout~combout\ & \a[3]~input_o\)) # (\b[3]~input_o\ & ((\a[3]~input_o\) # 
-- (\b_adder1|cout~combout\))) ) ) ) # ( \b[2]~input_o\ & ( !\a[2]~input_o\ & ( (!\b[3]~input_o\ & (\b_adder1|cout~combout\ & \a[3]~input_o\)) # (\b[3]~input_o\ & ((\a[3]~input_o\) # (\b_adder1|cout~combout\))) ) ) ) # ( !\b[2]~input_o\ & ( !\a[2]~input_o\ & 
-- ( (\b[3]~input_o\ & \a[3]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000101110001011100010111000101110101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_b[3]~input_o\,
	datab => \b_adder1|ALT_INV_cout~combout\,
	datac => \ALT_INV_a[3]~input_o\,
	datae => \ALT_INV_b[2]~input_o\,
	dataf => \ALT_INV_a[2]~input_o\,
	combout => \b_adder3|cout~0_combout\);

-- Location: LABCELL_X48_Y15_N0
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


