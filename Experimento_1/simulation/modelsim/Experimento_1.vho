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

-- DATE "03/13/2023 15:53:49"

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

ENTITY 	Experimento_1 IS
    PORT (
	input_bin : IN std_logic_vector(3 DOWNTO 0);
	output_bcd : BUFFER std_logic_vector(7 DOWNTO 0);
	segments : BUFFER std_logic_vector(6 DOWNTO 0)
	);
END Experimento_1;

-- Design Ports Information
-- output_bcd[0]	=>  Location: PIN_V16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output_bcd[1]	=>  Location: PIN_W16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output_bcd[2]	=>  Location: PIN_V17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output_bcd[3]	=>  Location: PIN_V18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output_bcd[4]	=>  Location: PIN_W17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output_bcd[5]	=>  Location: PIN_W19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output_bcd[6]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output_bcd[7]	=>  Location: PIN_W20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[0]	=>  Location: PIN_AH28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[1]	=>  Location: PIN_AG28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[2]	=>  Location: PIN_AF28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[3]	=>  Location: PIN_AG27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[4]	=>  Location: PIN_AE28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[5]	=>  Location: PIN_AE27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[6]	=>  Location: PIN_AE26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_bin[0]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_bin[1]	=>  Location: PIN_AC12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_bin[3]	=>  Location: PIN_AF10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_bin[2]	=>  Location: PIN_AF9,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Experimento_1 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_input_bin : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_output_bcd : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_segments : std_logic_vector(6 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \input_bin[0]~input_o\ : std_logic;
SIGNAL \input_bin[3]~input_o\ : std_logic;
SIGNAL \input_bin[2]~input_o\ : std_logic;
SIGNAL \input_bin[1]~input_o\ : std_logic;
SIGNAL \output_bcd~0_combout\ : std_logic;
SIGNAL \output_bcd~1_combout\ : std_logic;
SIGNAL \output_bcd~2_combout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \WideOr6~0_combout\ : std_logic;
SIGNAL \WideOr5~0_combout\ : std_logic;
SIGNAL \WideOr4~0_combout\ : std_logic;
SIGNAL \WideOr3~0_combout\ : std_logic;
SIGNAL \WideOr2~0_combout\ : std_logic;
SIGNAL \WideOr1~0_combout\ : std_logic;
SIGNAL \WideOr0~0_combout\ : std_logic;
SIGNAL \ALT_INV_input_bin[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_input_bin[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_input_bin[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_input_bin[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_WideOr6~0_combout\ : std_logic;
SIGNAL \ALT_INV_WideOr5~0_combout\ : std_logic;
SIGNAL \ALT_INV_WideOr3~0_combout\ : std_logic;
SIGNAL \ALT_INV_WideOr0~0_combout\ : std_logic;

BEGIN

ww_input_bin <= input_bin;
output_bcd <= ww_output_bcd;
segments <= ww_segments;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_input_bin[2]~input_o\ <= NOT \input_bin[2]~input_o\;
\ALT_INV_input_bin[3]~input_o\ <= NOT \input_bin[3]~input_o\;
\ALT_INV_input_bin[1]~input_o\ <= NOT \input_bin[1]~input_o\;
\ALT_INV_input_bin[0]~input_o\ <= NOT \input_bin[0]~input_o\;
\ALT_INV_WideOr6~0_combout\ <= NOT \WideOr6~0_combout\;
\ALT_INV_WideOr5~0_combout\ <= NOT \WideOr5~0_combout\;
\ALT_INV_WideOr3~0_combout\ <= NOT \WideOr3~0_combout\;
\ALT_INV_WideOr0~0_combout\ <= NOT \WideOr0~0_combout\;

-- Location: IOOBUF_X52_Y0_N2
\output_bcd[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \input_bin[0]~input_o\,
	devoe => ww_devoe,
	o => ww_output_bcd(0));

-- Location: IOOBUF_X52_Y0_N19
\output_bcd[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \output_bcd~0_combout\,
	devoe => ww_devoe,
	o => ww_output_bcd(1));

-- Location: IOOBUF_X60_Y0_N2
\output_bcd[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \output_bcd~1_combout\,
	devoe => ww_devoe,
	o => ww_output_bcd(2));

-- Location: IOOBUF_X80_Y0_N2
\output_bcd[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \output_bcd~2_combout\,
	devoe => ww_devoe,
	o => ww_output_bcd(3));

-- Location: IOOBUF_X60_Y0_N19
\output_bcd[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \LessThan0~0_combout\,
	devoe => ww_devoe,
	o => ww_output_bcd(4));

-- Location: IOOBUF_X80_Y0_N19
\output_bcd[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_output_bcd(5));

-- Location: IOOBUF_X84_Y0_N2
\output_bcd[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_output_bcd(6));

-- Location: IOOBUF_X89_Y6_N5
\output_bcd[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_output_bcd(7));

-- Location: IOOBUF_X89_Y4_N96
\segments[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_WideOr6~0_combout\,
	devoe => ww_devoe,
	o => ww_segments(0));

-- Location: IOOBUF_X89_Y13_N39
\segments[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_WideOr5~0_combout\,
	devoe => ww_devoe,
	o => ww_segments(1));

-- Location: IOOBUF_X89_Y13_N56
\segments[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \WideOr4~0_combout\,
	devoe => ww_devoe,
	o => ww_segments(2));

-- Location: IOOBUF_X89_Y4_N79
\segments[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_WideOr3~0_combout\,
	devoe => ww_devoe,
	o => ww_segments(3));

-- Location: IOOBUF_X89_Y11_N96
\segments[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \WideOr2~0_combout\,
	devoe => ww_devoe,
	o => ww_segments(4));

-- Location: IOOBUF_X89_Y11_N79
\segments[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \WideOr1~0_combout\,
	devoe => ww_devoe,
	o => ww_segments(5));

-- Location: IOOBUF_X89_Y8_N39
\segments[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_WideOr0~0_combout\,
	devoe => ww_devoe,
	o => ww_segments(6));

-- Location: IOIBUF_X12_Y0_N18
\input_bin[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_bin(0),
	o => \input_bin[0]~input_o\);

-- Location: IOIBUF_X4_Y0_N52
\input_bin[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_bin(3),
	o => \input_bin[3]~input_o\);

-- Location: IOIBUF_X8_Y0_N35
\input_bin[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_bin(2),
	o => \input_bin[2]~input_o\);

-- Location: IOIBUF_X16_Y0_N1
\input_bin[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_bin(1),
	o => \input_bin[1]~input_o\);

-- Location: MLABCELL_X52_Y1_N30
\output_bcd~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \output_bcd~0_combout\ = ( \input_bin[2]~input_o\ & ( \input_bin[1]~input_o\ & ( !\input_bin[3]~input_o\ ) ) ) # ( !\input_bin[2]~input_o\ & ( \input_bin[1]~input_o\ & ( !\input_bin[3]~input_o\ ) ) ) # ( \input_bin[2]~input_o\ & ( !\input_bin[1]~input_o\ 
-- & ( \input_bin[3]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_input_bin[3]~input_o\,
	datae => \ALT_INV_input_bin[2]~input_o\,
	dataf => \ALT_INV_input_bin[1]~input_o\,
	combout => \output_bcd~0_combout\);

-- Location: MLABCELL_X52_Y1_N6
\output_bcd~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \output_bcd~1_combout\ = ( \input_bin[2]~input_o\ & ( \input_bin[1]~input_o\ ) ) # ( \input_bin[2]~input_o\ & ( !\input_bin[1]~input_o\ & ( !\input_bin[3]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_input_bin[3]~input_o\,
	datae => \ALT_INV_input_bin[2]~input_o\,
	dataf => \ALT_INV_input_bin[1]~input_o\,
	combout => \output_bcd~1_combout\);

-- Location: LABCELL_X83_Y4_N33
\output_bcd~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \output_bcd~2_combout\ = ( \input_bin[3]~input_o\ & ( !\input_bin[1]~input_o\ & ( !\input_bin[2]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input_bin[2]~input_o\,
	datae => \ALT_INV_input_bin[3]~input_o\,
	dataf => \ALT_INV_input_bin[1]~input_o\,
	combout => \output_bcd~2_combout\);

-- Location: MLABCELL_X52_Y1_N15
\LessThan0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = ( \input_bin[2]~input_o\ & ( \input_bin[1]~input_o\ & ( \input_bin[3]~input_o\ ) ) ) # ( !\input_bin[2]~input_o\ & ( \input_bin[1]~input_o\ & ( \input_bin[3]~input_o\ ) ) ) # ( \input_bin[2]~input_o\ & ( !\input_bin[1]~input_o\ & ( 
-- \input_bin[3]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input_bin[3]~input_o\,
	datae => \ALT_INV_input_bin[2]~input_o\,
	dataf => \ALT_INV_input_bin[1]~input_o\,
	combout => \LessThan0~0_combout\);

-- Location: LABCELL_X83_Y4_N39
\WideOr6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \WideOr6~0_combout\ = ( \input_bin[1]~input_o\ & ( (!\input_bin[2]~input_o\) # ((!\input_bin[0]~input_o\) # (\input_bin[3]~input_o\)) ) ) # ( !\input_bin[1]~input_o\ & ( (!\input_bin[2]~input_o\ & ((\input_bin[3]~input_o\))) # (\input_bin[2]~input_o\ & 
-- ((!\input_bin[3]~input_o\) # (\input_bin[0]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010110101111010101011010111111111010111111111111101011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input_bin[2]~input_o\,
	datac => \ALT_INV_input_bin[0]~input_o\,
	datad => \ALT_INV_input_bin[3]~input_o\,
	dataf => \ALT_INV_input_bin[1]~input_o\,
	combout => \WideOr6~0_combout\);

-- Location: LABCELL_X83_Y4_N36
\WideOr5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \WideOr5~0_combout\ = ( \input_bin[1]~input_o\ & ( ((\input_bin[2]~input_o\ & !\input_bin[0]~input_o\)) # (\input_bin[3]~input_o\) ) ) # ( !\input_bin[1]~input_o\ & ( (!\input_bin[0]~input_o\) # (!\input_bin[2]~input_o\ $ (!\input_bin[3]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101110111101110110111011110111001000100111111110100010011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input_bin[2]~input_o\,
	datab => \ALT_INV_input_bin[0]~input_o\,
	datad => \ALT_INV_input_bin[3]~input_o\,
	dataf => \ALT_INV_input_bin[1]~input_o\,
	combout => \WideOr5~0_combout\);

-- Location: LABCELL_X83_Y4_N9
\WideOr4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \WideOr4~0_combout\ = ( !\input_bin[3]~input_o\ & ( \input_bin[1]~input_o\ & ( \input_bin[0]~input_o\ ) ) ) # ( \input_bin[3]~input_o\ & ( !\input_bin[1]~input_o\ & ( (!\input_bin[2]~input_o\ & \input_bin[0]~input_o\) ) ) ) # ( !\input_bin[3]~input_o\ & ( 
-- !\input_bin[1]~input_o\ & ( (\input_bin[0]~input_o\) # (\input_bin[2]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101111101011111000010100000101000001111000011110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input_bin[2]~input_o\,
	datac => \ALT_INV_input_bin[0]~input_o\,
	datae => \ALT_INV_input_bin[3]~input_o\,
	dataf => \ALT_INV_input_bin[1]~input_o\,
	combout => \WideOr4~0_combout\);

-- Location: LABCELL_X83_Y4_N3
\WideOr3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \WideOr3~0_combout\ = ( \input_bin[3]~input_o\ & ( \input_bin[1]~input_o\ & ( !\input_bin[2]~input_o\ $ (!\input_bin[0]~input_o\) ) ) ) # ( !\input_bin[3]~input_o\ & ( \input_bin[1]~input_o\ & ( (!\input_bin[2]~input_o\) # (!\input_bin[0]~input_o\) ) ) ) 
-- # ( \input_bin[3]~input_o\ & ( !\input_bin[1]~input_o\ ) ) # ( !\input_bin[3]~input_o\ & ( !\input_bin[1]~input_o\ & ( !\input_bin[2]~input_o\ $ (\input_bin[0]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010010110100101111111111111111111111010111110100101101001011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input_bin[2]~input_o\,
	datac => \ALT_INV_input_bin[0]~input_o\,
	datae => \ALT_INV_input_bin[3]~input_o\,
	dataf => \ALT_INV_input_bin[1]~input_o\,
	combout => \WideOr3~0_combout\);

-- Location: LABCELL_X83_Y4_N12
\WideOr2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \WideOr2~0_combout\ = ( \input_bin[3]~input_o\ & ( \input_bin[1]~input_o\ & ( \input_bin[2]~input_o\ ) ) ) # ( !\input_bin[3]~input_o\ & ( \input_bin[1]~input_o\ & ( (!\input_bin[0]~input_o\ & !\input_bin[2]~input_o\) ) ) ) # ( \input_bin[3]~input_o\ & ( 
-- !\input_bin[1]~input_o\ & ( (!\input_bin[0]~input_o\ & \input_bin[2]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011000000110011000000110000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_input_bin[0]~input_o\,
	datac => \ALT_INV_input_bin[2]~input_o\,
	datae => \ALT_INV_input_bin[3]~input_o\,
	dataf => \ALT_INV_input_bin[1]~input_o\,
	combout => \WideOr2~0_combout\);

-- Location: LABCELL_X83_Y4_N51
\WideOr1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \WideOr1~0_combout\ = ( \input_bin[3]~input_o\ & ( \input_bin[1]~input_o\ & ( (\input_bin[0]~input_o\) # (\input_bin[2]~input_o\) ) ) ) # ( !\input_bin[3]~input_o\ & ( \input_bin[1]~input_o\ & ( (\input_bin[2]~input_o\ & !\input_bin[0]~input_o\) ) ) ) # ( 
-- \input_bin[3]~input_o\ & ( !\input_bin[1]~input_o\ & ( (\input_bin[2]~input_o\ & !\input_bin[0]~input_o\) ) ) ) # ( !\input_bin[3]~input_o\ & ( !\input_bin[1]~input_o\ & ( (\input_bin[2]~input_o\ & \input_bin[0]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101010100000101000001010000010100000101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input_bin[2]~input_o\,
	datac => \ALT_INV_input_bin[0]~input_o\,
	datae => \ALT_INV_input_bin[3]~input_o\,
	dataf => \ALT_INV_input_bin[1]~input_o\,
	combout => \WideOr1~0_combout\);

-- Location: LABCELL_X83_Y4_N24
\WideOr0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \WideOr0~0_combout\ = ( \input_bin[3]~input_o\ & ( \input_bin[1]~input_o\ & ( (!\input_bin[0]~input_o\) # (\input_bin[2]~input_o\) ) ) ) # ( !\input_bin[3]~input_o\ & ( \input_bin[1]~input_o\ ) ) # ( \input_bin[3]~input_o\ & ( !\input_bin[1]~input_o\ & ( 
-- (!\input_bin[0]~input_o\) # (!\input_bin[2]~input_o\) ) ) ) # ( !\input_bin[3]~input_o\ & ( !\input_bin[1]~input_o\ & ( !\input_bin[0]~input_o\ $ (\input_bin[2]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100001111000011111111001111110011111111111111111100111111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_input_bin[0]~input_o\,
	datac => \ALT_INV_input_bin[2]~input_o\,
	datae => \ALT_INV_input_bin[3]~input_o\,
	dataf => \ALT_INV_input_bin[1]~input_o\,
	combout => \WideOr0~0_combout\);

-- Location: LABCELL_X50_Y71_N0
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


