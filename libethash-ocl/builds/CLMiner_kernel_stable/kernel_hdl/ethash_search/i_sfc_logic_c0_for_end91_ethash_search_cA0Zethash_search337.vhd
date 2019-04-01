-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 17.1 (Release Build #240)
-- 
-- Legal Notice: Copyright 2017 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from i_sfc_logic_c0_for_end91_ethash_search_c0_enter35_ethash_search337
-- VHDL created on Mon Apr  1 13:53:05 2019


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

library twentynm;
use twentynm.twentynm_components.twentynm_fp_mac;

entity i_sfc_logic_c0_for_end91_ethash_search_c0_enter35_ethash_search337 is
    port (
        in_c0_eni434_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni434_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni434_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni434_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni434_4 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi140_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi140_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c0_for_end91_ethash_search_c0_enter35_ethash_search337;

architecture normal of i_sfc_logic_c0_for_end91_ethash_search_c0_enter35_ethash_search337 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bgTrunc_i_mul_i1_i_ethash_search_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_mul_i3_i_ethash_search_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_mul_i_i_ethash_search_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul_i1_i_ethash_search_extender_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul_i1_i_ethash_search_multconst_x_q : STD_LOGIC_VECTOR (6 downto 0);
    signal i_mul_i3_i_ethash_search_extender_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul_i_i_ethash_search_extender_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_xor_i2_i_ethash_search_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_xor_i4_i_ethash_search_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_xor_i_i680_ethash_search_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul_i1_i_ethash_search_bs1_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul_i1_i_ethash_search_bs1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul_i1_i_ethash_search_bs4_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul_i1_i_ethash_search_bs7_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul_i1_i_ethash_search_bs7_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul_i1_i_ethash_search_bjA8_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul_i1_i_ethash_search_bs11_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul_i1_i_ethash_search_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_mul_i1_i_ethash_search_align_14_q : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul_i1_i_ethash_search_align_14_qint : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul_i1_i_ethash_search_result_add_0_0_a : STD_LOGIC_VECTOR (59 downto 0);
    signal i_mul_i1_i_ethash_search_result_add_0_0_b : STD_LOGIC_VECTOR (59 downto 0);
    signal i_mul_i1_i_ethash_search_result_add_0_0_o : STD_LOGIC_VECTOR (59 downto 0);
    signal i_mul_i1_i_ethash_search_result_add_0_0_q : STD_LOGIC_VECTOR (58 downto 0);
    signal i_mul_i3_i_ethash_search_bs1_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul_i3_i_ethash_search_bs1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul_i3_i_ethash_search_bs4_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul_i3_i_ethash_search_bs7_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul_i3_i_ethash_search_bs7_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul_i3_i_ethash_search_bjA8_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul_i3_i_ethash_search_bs11_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul_i3_i_ethash_search_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_mul_i3_i_ethash_search_align_14_q : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul_i3_i_ethash_search_align_14_qint : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul_i3_i_ethash_search_result_add_0_0_a : STD_LOGIC_VECTOR (59 downto 0);
    signal i_mul_i3_i_ethash_search_result_add_0_0_b : STD_LOGIC_VECTOR (59 downto 0);
    signal i_mul_i3_i_ethash_search_result_add_0_0_o : STD_LOGIC_VECTOR (59 downto 0);
    signal i_mul_i3_i_ethash_search_result_add_0_0_q : STD_LOGIC_VECTOR (58 downto 0);
    signal i_mul_i_i_ethash_search_bs1_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul_i_i_ethash_search_bs1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul_i_i_ethash_search_bs4_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul_i_i_ethash_search_bs7_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul_i_i_ethash_search_bs7_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul_i_i_ethash_search_bjA8_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul_i_i_ethash_search_bs11_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul_i_i_ethash_search_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_mul_i_i_ethash_search_align_14_q : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul_i_i_ethash_search_align_14_qint : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul_i_i_ethash_search_result_add_0_0_a : STD_LOGIC_VECTOR (59 downto 0);
    signal i_mul_i_i_ethash_search_result_add_0_0_b : STD_LOGIC_VECTOR (59 downto 0);
    signal i_mul_i_i_ethash_search_result_add_0_0_o : STD_LOGIC_VECTOR (59 downto 0);
    signal i_mul_i_i_ethash_search_result_add_0_0_q : STD_LOGIC_VECTOR (58 downto 0);
    signal i_mul_i1_i_ethash_search_im10_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_mul_i1_i_ethash_search_im10_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_mul_i3_i_ethash_search_im10_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_mul_i3_i_ethash_search_im10_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_mul_i_i_ethash_search_im10_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_mul_i_i_ethash_search_im10_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_mul_i1_i_ethash_search_im0_cma_reset : std_logic;
    type i_mul_i1_i_ethash_search_im0_cma_a0type is array(NATURAL range <>) of UNSIGNED(17 downto 0);
    signal i_mul_i1_i_ethash_search_im0_cma_a0 : i_mul_i1_i_ethash_search_im0_cma_a0type(0 to 0);
    attribute preserve : boolean;
    attribute preserve of i_mul_i1_i_ethash_search_im0_cma_a0 : signal is true;
    attribute altera_attribute of i_mul_i1_i_ethash_search_im0_cma_a0 : signal is "-name allow_synch_ctrl_usage off";
    signal i_mul_i1_i_ethash_search_im0_cma_a1 : i_mul_i1_i_ethash_search_im0_cma_a0type(0 to 0);
    attribute preserve of i_mul_i1_i_ethash_search_im0_cma_a1 : signal is true;
    attribute altera_attribute of i_mul_i1_i_ethash_search_im0_cma_a1 : signal is "-name allow_synch_ctrl_usage off";
    type i_mul_i1_i_ethash_search_im0_cma_c0type is array(NATURAL range <>) of UNSIGNED(2 downto 0);
    signal i_mul_i1_i_ethash_search_im0_cma_c0 : i_mul_i1_i_ethash_search_im0_cma_c0type(0 to 0);
    attribute preserve of i_mul_i1_i_ethash_search_im0_cma_c0 : signal is true;
    attribute altera_attribute of i_mul_i1_i_ethash_search_im0_cma_c0 : signal is "-name allow_synch_ctrl_usage off";
    signal i_mul_i1_i_ethash_search_im0_cma_c1 : i_mul_i1_i_ethash_search_im0_cma_c0type(0 to 0);
    attribute preserve of i_mul_i1_i_ethash_search_im0_cma_c1 : signal is true;
    attribute altera_attribute of i_mul_i1_i_ethash_search_im0_cma_c1 : signal is "-name allow_synch_ctrl_usage off";
    signal i_mul_i1_i_ethash_search_im0_cma_r : i_mul_i1_i_ethash_search_im0_cma_a0type(0 to 0);
    type i_mul_i1_i_ethash_search_im0_cma_ptype is array(NATURAL range <>) of UNSIGNED(35 downto 0);
    signal i_mul_i1_i_ethash_search_im0_cma_p : i_mul_i1_i_ethash_search_im0_cma_ptype(0 to 0);
    signal i_mul_i1_i_ethash_search_im0_cma_u : i_mul_i1_i_ethash_search_im0_cma_ptype(0 to 0);
    signal i_mul_i1_i_ethash_search_im0_cma_w : i_mul_i1_i_ethash_search_im0_cma_ptype(0 to 0);
    signal i_mul_i1_i_ethash_search_im0_cma_x : i_mul_i1_i_ethash_search_im0_cma_ptype(0 to 0);
    signal i_mul_i1_i_ethash_search_im0_cma_y : i_mul_i1_i_ethash_search_im0_cma_ptype(0 to 0);
    signal i_mul_i1_i_ethash_search_im0_cma_k0 : i_mul_i1_i_ethash_search_im0_cma_a0type(0 to 7) := (
        0 => TO_UNSIGNED(403,18),
        others => (others => '0'));
    signal i_mul_i1_i_ethash_search_im0_cma_s : i_mul_i1_i_ethash_search_im0_cma_ptype(0 to 0);
    signal i_mul_i1_i_ethash_search_im0_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul_i1_i_ethash_search_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul_i1_i_ethash_search_im0_cma_ena0 : std_logic;
    signal i_mul_i1_i_ethash_search_im0_cma_ena1 : std_logic;
    signal i_mul_i1_i_ethash_search_im0_cma_ena2 : std_logic;
    signal i_mul_i3_i_ethash_search_im0_cma_reset : std_logic;
    signal i_mul_i3_i_ethash_search_im0_cma_a0 : i_mul_i1_i_ethash_search_im0_cma_a0type(0 to 0);
    attribute preserve of i_mul_i3_i_ethash_search_im0_cma_a0 : signal is true;
    attribute altera_attribute of i_mul_i3_i_ethash_search_im0_cma_a0 : signal is "-name allow_synch_ctrl_usage off";
    signal i_mul_i3_i_ethash_search_im0_cma_a1 : i_mul_i1_i_ethash_search_im0_cma_a0type(0 to 0);
    attribute preserve of i_mul_i3_i_ethash_search_im0_cma_a1 : signal is true;
    attribute altera_attribute of i_mul_i3_i_ethash_search_im0_cma_a1 : signal is "-name allow_synch_ctrl_usage off";
    signal i_mul_i3_i_ethash_search_im0_cma_c0 : i_mul_i1_i_ethash_search_im0_cma_c0type(0 to 0);
    attribute preserve of i_mul_i3_i_ethash_search_im0_cma_c0 : signal is true;
    attribute altera_attribute of i_mul_i3_i_ethash_search_im0_cma_c0 : signal is "-name allow_synch_ctrl_usage off";
    signal i_mul_i3_i_ethash_search_im0_cma_c1 : i_mul_i1_i_ethash_search_im0_cma_c0type(0 to 0);
    attribute preserve of i_mul_i3_i_ethash_search_im0_cma_c1 : signal is true;
    attribute altera_attribute of i_mul_i3_i_ethash_search_im0_cma_c1 : signal is "-name allow_synch_ctrl_usage off";
    signal i_mul_i3_i_ethash_search_im0_cma_r : i_mul_i1_i_ethash_search_im0_cma_a0type(0 to 0);
    signal i_mul_i3_i_ethash_search_im0_cma_p : i_mul_i1_i_ethash_search_im0_cma_ptype(0 to 0);
    signal i_mul_i3_i_ethash_search_im0_cma_u : i_mul_i1_i_ethash_search_im0_cma_ptype(0 to 0);
    signal i_mul_i3_i_ethash_search_im0_cma_w : i_mul_i1_i_ethash_search_im0_cma_ptype(0 to 0);
    signal i_mul_i3_i_ethash_search_im0_cma_x : i_mul_i1_i_ethash_search_im0_cma_ptype(0 to 0);
    signal i_mul_i3_i_ethash_search_im0_cma_y : i_mul_i1_i_ethash_search_im0_cma_ptype(0 to 0);
    signal i_mul_i3_i_ethash_search_im0_cma_k0 : i_mul_i1_i_ethash_search_im0_cma_a0type(0 to 7) := (
        0 => TO_UNSIGNED(403,18),
        others => (others => '0'));
    signal i_mul_i3_i_ethash_search_im0_cma_s : i_mul_i1_i_ethash_search_im0_cma_ptype(0 to 0);
    signal i_mul_i3_i_ethash_search_im0_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul_i3_i_ethash_search_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul_i3_i_ethash_search_im0_cma_ena0 : std_logic;
    signal i_mul_i3_i_ethash_search_im0_cma_ena1 : std_logic;
    signal i_mul_i3_i_ethash_search_im0_cma_ena2 : std_logic;
    signal i_mul_i_i_ethash_search_im0_cma_reset : std_logic;
    signal i_mul_i_i_ethash_search_im0_cma_a0 : i_mul_i1_i_ethash_search_im0_cma_a0type(0 to 0);
    attribute preserve of i_mul_i_i_ethash_search_im0_cma_a0 : signal is true;
    attribute altera_attribute of i_mul_i_i_ethash_search_im0_cma_a0 : signal is "-name allow_synch_ctrl_usage off";
    signal i_mul_i_i_ethash_search_im0_cma_a1 : i_mul_i1_i_ethash_search_im0_cma_a0type(0 to 0);
    attribute preserve of i_mul_i_i_ethash_search_im0_cma_a1 : signal is true;
    attribute altera_attribute of i_mul_i_i_ethash_search_im0_cma_a1 : signal is "-name allow_synch_ctrl_usage off";
    signal i_mul_i_i_ethash_search_im0_cma_c0 : i_mul_i1_i_ethash_search_im0_cma_c0type(0 to 0);
    attribute preserve of i_mul_i_i_ethash_search_im0_cma_c0 : signal is true;
    attribute altera_attribute of i_mul_i_i_ethash_search_im0_cma_c0 : signal is "-name allow_synch_ctrl_usage off";
    signal i_mul_i_i_ethash_search_im0_cma_c1 : i_mul_i1_i_ethash_search_im0_cma_c0type(0 to 0);
    attribute preserve of i_mul_i_i_ethash_search_im0_cma_c1 : signal is true;
    attribute altera_attribute of i_mul_i_i_ethash_search_im0_cma_c1 : signal is "-name allow_synch_ctrl_usage off";
    signal i_mul_i_i_ethash_search_im0_cma_r : i_mul_i1_i_ethash_search_im0_cma_a0type(0 to 0);
    signal i_mul_i_i_ethash_search_im0_cma_p : i_mul_i1_i_ethash_search_im0_cma_ptype(0 to 0);
    signal i_mul_i_i_ethash_search_im0_cma_u : i_mul_i1_i_ethash_search_im0_cma_ptype(0 to 0);
    signal i_mul_i_i_ethash_search_im0_cma_w : i_mul_i1_i_ethash_search_im0_cma_ptype(0 to 0);
    signal i_mul_i_i_ethash_search_im0_cma_x : i_mul_i1_i_ethash_search_im0_cma_ptype(0 to 0);
    signal i_mul_i_i_ethash_search_im0_cma_y : i_mul_i1_i_ethash_search_im0_cma_ptype(0 to 0);
    signal i_mul_i_i_ethash_search_im0_cma_k0 : i_mul_i1_i_ethash_search_im0_cma_a0type(0 to 7) := (
        0 => TO_UNSIGNED(403,18),
        others => (others => '0'));
    signal i_mul_i_i_ethash_search_im0_cma_s : i_mul_i1_i_ethash_search_im0_cma_ptype(0 to 0);
    signal i_mul_i_i_ethash_search_im0_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul_i_i_ethash_search_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul_i_i_ethash_search_im0_cma_ena0 : std_logic;
    signal i_mul_i_i_ethash_search_im0_cma_ena1 : std_logic;
    signal i_mul_i_i_ethash_search_im0_cma_ena2 : std_logic;
    signal i_mul_i1_i_ethash_search_ma3_cma_reset : std_logic;
    type i_mul_i1_i_ethash_search_ma3_cma_a0type is array(NATURAL range <>) of SIGNED(18 downto 0);
    signal i_mul_i1_i_ethash_search_ma3_cma_a0 : i_mul_i1_i_ethash_search_ma3_cma_a0type(0 to 1);
    attribute preserve of i_mul_i1_i_ethash_search_ma3_cma_a0 : signal is true;
    attribute altera_attribute of i_mul_i1_i_ethash_search_ma3_cma_a0 : signal is "-name allow_synch_ctrl_usage off";
    signal i_mul_i1_i_ethash_search_ma3_cma_a1 : i_mul_i1_i_ethash_search_ma3_cma_a0type(0 to 1);
    attribute preserve of i_mul_i1_i_ethash_search_ma3_cma_a1 : signal is true;
    attribute altera_attribute of i_mul_i1_i_ethash_search_ma3_cma_a1 : signal is "-name allow_synch_ctrl_usage off";
    type i_mul_i1_i_ethash_search_ma3_cma_c0type is array(NATURAL range <>) of UNSIGNED(13 downto 0);
    signal i_mul_i1_i_ethash_search_ma3_cma_c0 : i_mul_i1_i_ethash_search_ma3_cma_c0type(0 to 1);
    attribute preserve of i_mul_i1_i_ethash_search_ma3_cma_c0 : signal is true;
    attribute altera_attribute of i_mul_i1_i_ethash_search_ma3_cma_c0 : signal is "-name allow_synch_ctrl_usage off";
    signal i_mul_i1_i_ethash_search_ma3_cma_c1 : i_mul_i1_i_ethash_search_ma3_cma_c0type(0 to 1);
    attribute preserve of i_mul_i1_i_ethash_search_ma3_cma_c1 : signal is true;
    attribute altera_attribute of i_mul_i1_i_ethash_search_ma3_cma_c1 : signal is "-name allow_synch_ctrl_usage off";
    type i_mul_i1_i_ethash_search_ma3_cma_rtype is array(NATURAL range <>) of SIGNED(14 downto 0);
    signal i_mul_i1_i_ethash_search_ma3_cma_r : i_mul_i1_i_ethash_search_ma3_cma_rtype(0 to 1);
    type i_mul_i1_i_ethash_search_ma3_cma_ptype is array(NATURAL range <>) of SIGNED(33 downto 0);
    signal i_mul_i1_i_ethash_search_ma3_cma_p : i_mul_i1_i_ethash_search_ma3_cma_ptype(0 to 1);
    type i_mul_i1_i_ethash_search_ma3_cma_utype is array(NATURAL range <>) of SIGNED(34 downto 0);
    signal i_mul_i1_i_ethash_search_ma3_cma_u : i_mul_i1_i_ethash_search_ma3_cma_utype(0 to 1);
    signal i_mul_i1_i_ethash_search_ma3_cma_w : i_mul_i1_i_ethash_search_ma3_cma_utype(0 to 0);
    signal i_mul_i1_i_ethash_search_ma3_cma_x : i_mul_i1_i_ethash_search_ma3_cma_utype(0 to 0);
    signal i_mul_i1_i_ethash_search_ma3_cma_y : i_mul_i1_i_ethash_search_ma3_cma_utype(0 to 0);
    signal i_mul_i1_i_ethash_search_ma3_cma_s : i_mul_i1_i_ethash_search_ma3_cma_utype(0 to 0);
    signal i_mul_i1_i_ethash_search_ma3_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul_i1_i_ethash_search_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul_i1_i_ethash_search_ma3_cma_ena0 : std_logic;
    signal i_mul_i1_i_ethash_search_ma3_cma_ena1 : std_logic;
    signal i_mul_i1_i_ethash_search_ma3_cma_ena2 : std_logic;
    signal i_mul_i3_i_ethash_search_ma3_cma_reset : std_logic;
    signal i_mul_i3_i_ethash_search_ma3_cma_a0 : i_mul_i1_i_ethash_search_ma3_cma_a0type(0 to 1);
    attribute preserve of i_mul_i3_i_ethash_search_ma3_cma_a0 : signal is true;
    attribute altera_attribute of i_mul_i3_i_ethash_search_ma3_cma_a0 : signal is "-name allow_synch_ctrl_usage off";
    signal i_mul_i3_i_ethash_search_ma3_cma_a1 : i_mul_i1_i_ethash_search_ma3_cma_a0type(0 to 1);
    attribute preserve of i_mul_i3_i_ethash_search_ma3_cma_a1 : signal is true;
    attribute altera_attribute of i_mul_i3_i_ethash_search_ma3_cma_a1 : signal is "-name allow_synch_ctrl_usage off";
    signal i_mul_i3_i_ethash_search_ma3_cma_c0 : i_mul_i1_i_ethash_search_ma3_cma_c0type(0 to 1);
    attribute preserve of i_mul_i3_i_ethash_search_ma3_cma_c0 : signal is true;
    attribute altera_attribute of i_mul_i3_i_ethash_search_ma3_cma_c0 : signal is "-name allow_synch_ctrl_usage off";
    signal i_mul_i3_i_ethash_search_ma3_cma_c1 : i_mul_i1_i_ethash_search_ma3_cma_c0type(0 to 1);
    attribute preserve of i_mul_i3_i_ethash_search_ma3_cma_c1 : signal is true;
    attribute altera_attribute of i_mul_i3_i_ethash_search_ma3_cma_c1 : signal is "-name allow_synch_ctrl_usage off";
    signal i_mul_i3_i_ethash_search_ma3_cma_r : i_mul_i1_i_ethash_search_ma3_cma_rtype(0 to 1);
    signal i_mul_i3_i_ethash_search_ma3_cma_p : i_mul_i1_i_ethash_search_ma3_cma_ptype(0 to 1);
    signal i_mul_i3_i_ethash_search_ma3_cma_u : i_mul_i1_i_ethash_search_ma3_cma_utype(0 to 1);
    signal i_mul_i3_i_ethash_search_ma3_cma_w : i_mul_i1_i_ethash_search_ma3_cma_utype(0 to 0);
    signal i_mul_i3_i_ethash_search_ma3_cma_x : i_mul_i1_i_ethash_search_ma3_cma_utype(0 to 0);
    signal i_mul_i3_i_ethash_search_ma3_cma_y : i_mul_i1_i_ethash_search_ma3_cma_utype(0 to 0);
    signal i_mul_i3_i_ethash_search_ma3_cma_s : i_mul_i1_i_ethash_search_ma3_cma_utype(0 to 0);
    signal i_mul_i3_i_ethash_search_ma3_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul_i3_i_ethash_search_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul_i3_i_ethash_search_ma3_cma_ena0 : std_logic;
    signal i_mul_i3_i_ethash_search_ma3_cma_ena1 : std_logic;
    signal i_mul_i3_i_ethash_search_ma3_cma_ena2 : std_logic;
    signal i_mul_i_i_ethash_search_ma3_cma_reset : std_logic;
    signal i_mul_i_i_ethash_search_ma3_cma_a0 : i_mul_i1_i_ethash_search_ma3_cma_a0type(0 to 1);
    attribute preserve of i_mul_i_i_ethash_search_ma3_cma_a0 : signal is true;
    attribute altera_attribute of i_mul_i_i_ethash_search_ma3_cma_a0 : signal is "-name allow_synch_ctrl_usage off";
    signal i_mul_i_i_ethash_search_ma3_cma_a1 : i_mul_i1_i_ethash_search_ma3_cma_a0type(0 to 1);
    attribute preserve of i_mul_i_i_ethash_search_ma3_cma_a1 : signal is true;
    attribute altera_attribute of i_mul_i_i_ethash_search_ma3_cma_a1 : signal is "-name allow_synch_ctrl_usage off";
    signal i_mul_i_i_ethash_search_ma3_cma_c0 : i_mul_i1_i_ethash_search_ma3_cma_c0type(0 to 1);
    attribute preserve of i_mul_i_i_ethash_search_ma3_cma_c0 : signal is true;
    attribute altera_attribute of i_mul_i_i_ethash_search_ma3_cma_c0 : signal is "-name allow_synch_ctrl_usage off";
    signal i_mul_i_i_ethash_search_ma3_cma_c1 : i_mul_i1_i_ethash_search_ma3_cma_c0type(0 to 1);
    attribute preserve of i_mul_i_i_ethash_search_ma3_cma_c1 : signal is true;
    attribute altera_attribute of i_mul_i_i_ethash_search_ma3_cma_c1 : signal is "-name allow_synch_ctrl_usage off";
    signal i_mul_i_i_ethash_search_ma3_cma_r : i_mul_i1_i_ethash_search_ma3_cma_rtype(0 to 1);
    signal i_mul_i_i_ethash_search_ma3_cma_p : i_mul_i1_i_ethash_search_ma3_cma_ptype(0 to 1);
    signal i_mul_i_i_ethash_search_ma3_cma_u : i_mul_i1_i_ethash_search_ma3_cma_utype(0 to 1);
    signal i_mul_i_i_ethash_search_ma3_cma_w : i_mul_i1_i_ethash_search_ma3_cma_utype(0 to 0);
    signal i_mul_i_i_ethash_search_ma3_cma_x : i_mul_i1_i_ethash_search_ma3_cma_utype(0 to 0);
    signal i_mul_i_i_ethash_search_ma3_cma_y : i_mul_i1_i_ethash_search_ma3_cma_utype(0 to 0);
    signal i_mul_i_i_ethash_search_ma3_cma_s : i_mul_i1_i_ethash_search_ma3_cma_utype(0 to 0);
    signal i_mul_i_i_ethash_search_ma3_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul_i_i_ethash_search_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul_i_i_ethash_search_ma3_cma_ena0 : std_logic;
    signal i_mul_i_i_ethash_search_ma3_cma_ena1 : std_logic;
    signal i_mul_i_i_ethash_search_ma3_cma_ena2 : std_logic;
    signal i_mul_i1_i_ethash_search_bjB6_q_const_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul_i1_i_ethash_search_bs2_merged_bit_select_c_const_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist0_i_mul_i_i_ethash_search_bs11_b_3_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist1_i_mul_i3_i_ethash_search_bs11_b_3_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist2_i_mul_i1_i_ethash_search_bs11_b_3_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist6_sync_in_aunroll_x_in_i_valid_9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_sync_in_aunroll_x_in_c0_eni434_2_3_mem_reset0 : std_logic;
    signal redist3_sync_in_aunroll_x_in_c0_eni434_2_3_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_sync_in_aunroll_x_in_c0_eni434_2_3_mem_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_sync_in_aunroll_x_in_c0_eni434_2_3_mem_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_sync_in_aunroll_x_in_c0_eni434_2_3_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_sync_in_aunroll_x_in_c0_eni434_2_3_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_sync_in_aunroll_x_in_c0_eni434_2_3_rdcnt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_sync_in_aunroll_x_in_c0_eni434_2_3_rdcnt_i : UNSIGNED (0 downto 0);
    attribute preserve of redist3_sync_in_aunroll_x_in_c0_eni434_2_3_rdcnt_i : signal is true;
    signal redist3_sync_in_aunroll_x_in_c0_eni434_2_3_wraddr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_sync_in_aunroll_x_in_c0_eni434_2_3_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_sync_in_aunroll_x_in_c0_eni434_2_3_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_sync_in_aunroll_x_in_c0_eni434_2_3_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_sync_in_aunroll_x_in_c0_eni434_2_3_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only : boolean;
    attribute preserve_syn_only of redist3_sync_in_aunroll_x_in_c0_eni434_2_3_sticky_ena_q : signal is true;
    signal redist3_sync_in_aunroll_x_in_c0_eni434_2_3_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_sync_in_aunroll_x_in_c0_eni434_3_6_mem_reset0 : std_logic;
    signal redist4_sync_in_aunroll_x_in_c0_eni434_3_6_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_sync_in_aunroll_x_in_c0_eni434_3_6_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist4_sync_in_aunroll_x_in_c0_eni434_3_6_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist4_sync_in_aunroll_x_in_c0_eni434_3_6_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_sync_in_aunroll_x_in_c0_eni434_3_6_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_sync_in_aunroll_x_in_c0_eni434_3_6_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist4_sync_in_aunroll_x_in_c0_eni434_3_6_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist4_sync_in_aunroll_x_in_c0_eni434_3_6_rdcnt_i : signal is true;
    signal redist4_sync_in_aunroll_x_in_c0_eni434_3_6_rdcnt_eq : std_logic;
    attribute preserve of redist4_sync_in_aunroll_x_in_c0_eni434_3_6_rdcnt_eq : signal is true;
    signal redist4_sync_in_aunroll_x_in_c0_eni434_3_6_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist4_sync_in_aunroll_x_in_c0_eni434_3_6_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist4_sync_in_aunroll_x_in_c0_eni434_3_6_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_sync_in_aunroll_x_in_c0_eni434_3_6_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_sync_in_aunroll_x_in_c0_eni434_3_6_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_sync_in_aunroll_x_in_c0_eni434_3_6_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_sync_in_aunroll_x_in_c0_eni434_3_6_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist4_sync_in_aunroll_x_in_c0_eni434_3_6_sticky_ena_q : signal is true;
    signal redist4_sync_in_aunroll_x_in_c0_eni434_3_6_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_sync_in_aunroll_x_in_c0_eni434_4_9_mem_reset0 : std_logic;
    signal redist5_sync_in_aunroll_x_in_c0_eni434_4_9_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_sync_in_aunroll_x_in_c0_eni434_4_9_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist5_sync_in_aunroll_x_in_c0_eni434_4_9_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist5_sync_in_aunroll_x_in_c0_eni434_4_9_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_sync_in_aunroll_x_in_c0_eni434_4_9_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_sync_in_aunroll_x_in_c0_eni434_4_9_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist5_sync_in_aunroll_x_in_c0_eni434_4_9_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist5_sync_in_aunroll_x_in_c0_eni434_4_9_rdcnt_i : signal is true;
    signal redist5_sync_in_aunroll_x_in_c0_eni434_4_9_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist5_sync_in_aunroll_x_in_c0_eni434_4_9_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist5_sync_in_aunroll_x_in_c0_eni434_4_9_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist5_sync_in_aunroll_x_in_c0_eni434_4_9_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_sync_in_aunroll_x_in_c0_eni434_4_9_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_sync_in_aunroll_x_in_c0_eni434_4_9_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_sync_in_aunroll_x_in_c0_eni434_4_9_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_sync_in_aunroll_x_in_c0_eni434_4_9_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist5_sync_in_aunroll_x_in_c0_eni434_4_9_sticky_ena_q : signal is true;
    signal redist5_sync_in_aunroll_x_in_c0_eni434_4_9_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist6_sync_in_aunroll_x_in_i_valid_9(DELAY,280)
    redist6_sync_in_aunroll_x_in_i_valid_9 : dspba_delay
    GENERIC MAP ( width => 1, depth => 9, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist6_sync_in_aunroll_x_in_i_valid_9_q, clk => clock, aclr => resetn );

    -- redist5_sync_in_aunroll_x_in_c0_eni434_4_9_notEnable(LOGICAL,305)
    redist5_sync_in_aunroll_x_in_c0_eni434_4_9_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist5_sync_in_aunroll_x_in_c0_eni434_4_9_nor(LOGICAL,306)
    redist5_sync_in_aunroll_x_in_c0_eni434_4_9_nor_q <= not (redist5_sync_in_aunroll_x_in_c0_eni434_4_9_notEnable_q or redist5_sync_in_aunroll_x_in_c0_eni434_4_9_sticky_ena_q);

    -- redist5_sync_in_aunroll_x_in_c0_eni434_4_9_mem_last(CONSTANT,302)
    redist5_sync_in_aunroll_x_in_c0_eni434_4_9_mem_last_q <= "0110";

    -- redist5_sync_in_aunroll_x_in_c0_eni434_4_9_cmp(LOGICAL,303)
    redist5_sync_in_aunroll_x_in_c0_eni434_4_9_cmp_b <= STD_LOGIC_VECTOR("0" & redist5_sync_in_aunroll_x_in_c0_eni434_4_9_rdcnt_q);
    redist5_sync_in_aunroll_x_in_c0_eni434_4_9_cmp_q <= "1" WHEN redist5_sync_in_aunroll_x_in_c0_eni434_4_9_mem_last_q = redist5_sync_in_aunroll_x_in_c0_eni434_4_9_cmp_b ELSE "0";

    -- redist5_sync_in_aunroll_x_in_c0_eni434_4_9_cmpReg(REG,304)
    redist5_sync_in_aunroll_x_in_c0_eni434_4_9_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_sync_in_aunroll_x_in_c0_eni434_4_9_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist5_sync_in_aunroll_x_in_c0_eni434_4_9_cmpReg_q <= STD_LOGIC_VECTOR(redist5_sync_in_aunroll_x_in_c0_eni434_4_9_cmp_q);
        END IF;
    END PROCESS;

    -- redist5_sync_in_aunroll_x_in_c0_eni434_4_9_sticky_ena(REG,307)
    redist5_sync_in_aunroll_x_in_c0_eni434_4_9_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_sync_in_aunroll_x_in_c0_eni434_4_9_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist5_sync_in_aunroll_x_in_c0_eni434_4_9_nor_q = "1") THEN
                redist5_sync_in_aunroll_x_in_c0_eni434_4_9_sticky_ena_q <= STD_LOGIC_VECTOR(redist5_sync_in_aunroll_x_in_c0_eni434_4_9_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_sync_in_aunroll_x_in_c0_eni434_4_9_enaAnd(LOGICAL,308)
    redist5_sync_in_aunroll_x_in_c0_eni434_4_9_enaAnd_q <= redist5_sync_in_aunroll_x_in_c0_eni434_4_9_sticky_ena_q and VCC_q;

    -- redist5_sync_in_aunroll_x_in_c0_eni434_4_9_rdcnt(COUNTER,300)
    -- low=0, high=7, step=1, init=0
    redist5_sync_in_aunroll_x_in_c0_eni434_4_9_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_sync_in_aunroll_x_in_c0_eni434_4_9_rdcnt_i <= TO_UNSIGNED(0, 3);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist5_sync_in_aunroll_x_in_c0_eni434_4_9_rdcnt_i <= redist5_sync_in_aunroll_x_in_c0_eni434_4_9_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist5_sync_in_aunroll_x_in_c0_eni434_4_9_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist5_sync_in_aunroll_x_in_c0_eni434_4_9_rdcnt_i, 3)));

    -- redist5_sync_in_aunroll_x_in_c0_eni434_4_9_wraddr(REG,301)
    redist5_sync_in_aunroll_x_in_c0_eni434_4_9_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_sync_in_aunroll_x_in_c0_eni434_4_9_wraddr_q <= "111";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist5_sync_in_aunroll_x_in_c0_eni434_4_9_wraddr_q <= STD_LOGIC_VECTOR(redist5_sync_in_aunroll_x_in_c0_eni434_4_9_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist5_sync_in_aunroll_x_in_c0_eni434_4_9_mem(DUALMEM,299)
    redist5_sync_in_aunroll_x_in_c0_eni434_4_9_mem_ia <= STD_LOGIC_VECTOR(in_c0_eni434_4);
    redist5_sync_in_aunroll_x_in_c0_eni434_4_9_mem_aa <= redist5_sync_in_aunroll_x_in_c0_eni434_4_9_wraddr_q;
    redist5_sync_in_aunroll_x_in_c0_eni434_4_9_mem_ab <= redist5_sync_in_aunroll_x_in_c0_eni434_4_9_rdcnt_q;
    redist5_sync_in_aunroll_x_in_c0_eni434_4_9_mem_reset0 <= not (resetn);
    redist5_sync_in_aunroll_x_in_c0_eni434_4_9_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 3,
        numwords_a => 8,
        width_b => 32,
        widthad_b => 3,
        numwords_b => 8,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Arria 10"
    )
    PORT MAP (
        clocken1 => redist5_sync_in_aunroll_x_in_c0_eni434_4_9_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist5_sync_in_aunroll_x_in_c0_eni434_4_9_mem_reset0,
        clock1 => clock,
        address_a => redist5_sync_in_aunroll_x_in_c0_eni434_4_9_mem_aa,
        data_a => redist5_sync_in_aunroll_x_in_c0_eni434_4_9_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist5_sync_in_aunroll_x_in_c0_eni434_4_9_mem_ab,
        q_b => redist5_sync_in_aunroll_x_in_c0_eni434_4_9_mem_iq
    );
    redist5_sync_in_aunroll_x_in_c0_eni434_4_9_mem_q <= redist5_sync_in_aunroll_x_in_c0_eni434_4_9_mem_iq(31 downto 0);

    -- i_mul_i1_i_ethash_search_multconst_x(CONSTANT,9)
    i_mul_i1_i_ethash_search_multconst_x_q <= "0000000";

    -- redist4_sync_in_aunroll_x_in_c0_eni434_3_6_notEnable(LOGICAL,295)
    redist4_sync_in_aunroll_x_in_c0_eni434_3_6_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist4_sync_in_aunroll_x_in_c0_eni434_3_6_nor(LOGICAL,296)
    redist4_sync_in_aunroll_x_in_c0_eni434_3_6_nor_q <= not (redist4_sync_in_aunroll_x_in_c0_eni434_3_6_notEnable_q or redist4_sync_in_aunroll_x_in_c0_eni434_3_6_sticky_ena_q);

    -- redist4_sync_in_aunroll_x_in_c0_eni434_3_6_mem_last(CONSTANT,292)
    redist4_sync_in_aunroll_x_in_c0_eni434_3_6_mem_last_q <= "011";

    -- redist4_sync_in_aunroll_x_in_c0_eni434_3_6_cmp(LOGICAL,293)
    redist4_sync_in_aunroll_x_in_c0_eni434_3_6_cmp_q <= "1" WHEN redist4_sync_in_aunroll_x_in_c0_eni434_3_6_mem_last_q = redist4_sync_in_aunroll_x_in_c0_eni434_3_6_rdcnt_q ELSE "0";

    -- redist4_sync_in_aunroll_x_in_c0_eni434_3_6_cmpReg(REG,294)
    redist4_sync_in_aunroll_x_in_c0_eni434_3_6_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_sync_in_aunroll_x_in_c0_eni434_3_6_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist4_sync_in_aunroll_x_in_c0_eni434_3_6_cmpReg_q <= STD_LOGIC_VECTOR(redist4_sync_in_aunroll_x_in_c0_eni434_3_6_cmp_q);
        END IF;
    END PROCESS;

    -- redist4_sync_in_aunroll_x_in_c0_eni434_3_6_sticky_ena(REG,297)
    redist4_sync_in_aunroll_x_in_c0_eni434_3_6_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_sync_in_aunroll_x_in_c0_eni434_3_6_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist4_sync_in_aunroll_x_in_c0_eni434_3_6_nor_q = "1") THEN
                redist4_sync_in_aunroll_x_in_c0_eni434_3_6_sticky_ena_q <= STD_LOGIC_VECTOR(redist4_sync_in_aunroll_x_in_c0_eni434_3_6_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_sync_in_aunroll_x_in_c0_eni434_3_6_enaAnd(LOGICAL,298)
    redist4_sync_in_aunroll_x_in_c0_eni434_3_6_enaAnd_q <= redist4_sync_in_aunroll_x_in_c0_eni434_3_6_sticky_ena_q and VCC_q;

    -- redist4_sync_in_aunroll_x_in_c0_eni434_3_6_rdcnt(COUNTER,290)
    -- low=0, high=4, step=1, init=0
    redist4_sync_in_aunroll_x_in_c0_eni434_3_6_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_sync_in_aunroll_x_in_c0_eni434_3_6_rdcnt_i <= TO_UNSIGNED(0, 3);
            redist4_sync_in_aunroll_x_in_c0_eni434_3_6_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist4_sync_in_aunroll_x_in_c0_eni434_3_6_rdcnt_i = TO_UNSIGNED(3, 3)) THEN
                redist4_sync_in_aunroll_x_in_c0_eni434_3_6_rdcnt_eq <= '1';
            ELSE
                redist4_sync_in_aunroll_x_in_c0_eni434_3_6_rdcnt_eq <= '0';
            END IF;
            IF (redist4_sync_in_aunroll_x_in_c0_eni434_3_6_rdcnt_eq = '1') THEN
                redist4_sync_in_aunroll_x_in_c0_eni434_3_6_rdcnt_i <= redist4_sync_in_aunroll_x_in_c0_eni434_3_6_rdcnt_i + 4;
            ELSE
                redist4_sync_in_aunroll_x_in_c0_eni434_3_6_rdcnt_i <= redist4_sync_in_aunroll_x_in_c0_eni434_3_6_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist4_sync_in_aunroll_x_in_c0_eni434_3_6_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist4_sync_in_aunroll_x_in_c0_eni434_3_6_rdcnt_i, 3)));

    -- redist4_sync_in_aunroll_x_in_c0_eni434_3_6_wraddr(REG,291)
    redist4_sync_in_aunroll_x_in_c0_eni434_3_6_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_sync_in_aunroll_x_in_c0_eni434_3_6_wraddr_q <= "100";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist4_sync_in_aunroll_x_in_c0_eni434_3_6_wraddr_q <= STD_LOGIC_VECTOR(redist4_sync_in_aunroll_x_in_c0_eni434_3_6_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist4_sync_in_aunroll_x_in_c0_eni434_3_6_mem(DUALMEM,289)
    redist4_sync_in_aunroll_x_in_c0_eni434_3_6_mem_ia <= STD_LOGIC_VECTOR(in_c0_eni434_3);
    redist4_sync_in_aunroll_x_in_c0_eni434_3_6_mem_aa <= redist4_sync_in_aunroll_x_in_c0_eni434_3_6_wraddr_q;
    redist4_sync_in_aunroll_x_in_c0_eni434_3_6_mem_ab <= redist4_sync_in_aunroll_x_in_c0_eni434_3_6_rdcnt_q;
    redist4_sync_in_aunroll_x_in_c0_eni434_3_6_mem_reset0 <= not (resetn);
    redist4_sync_in_aunroll_x_in_c0_eni434_3_6_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 3,
        numwords_a => 5,
        width_b => 32,
        widthad_b => 3,
        numwords_b => 5,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Arria 10"
    )
    PORT MAP (
        clocken1 => redist4_sync_in_aunroll_x_in_c0_eni434_3_6_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist4_sync_in_aunroll_x_in_c0_eni434_3_6_mem_reset0,
        clock1 => clock,
        address_a => redist4_sync_in_aunroll_x_in_c0_eni434_3_6_mem_aa,
        data_a => redist4_sync_in_aunroll_x_in_c0_eni434_3_6_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist4_sync_in_aunroll_x_in_c0_eni434_3_6_mem_ab,
        q_b => redist4_sync_in_aunroll_x_in_c0_eni434_3_6_mem_iq
    );
    redist4_sync_in_aunroll_x_in_c0_eni434_3_6_mem_q <= redist4_sync_in_aunroll_x_in_c0_eni434_3_6_mem_iq(31 downto 0);

    -- redist3_sync_in_aunroll_x_in_c0_eni434_2_3_notEnable(LOGICAL,285)
    redist3_sync_in_aunroll_x_in_c0_eni434_2_3_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist3_sync_in_aunroll_x_in_c0_eni434_2_3_nor(LOGICAL,286)
    redist3_sync_in_aunroll_x_in_c0_eni434_2_3_nor_q <= not (redist3_sync_in_aunroll_x_in_c0_eni434_2_3_notEnable_q or redist3_sync_in_aunroll_x_in_c0_eni434_2_3_sticky_ena_q);

    -- redist3_sync_in_aunroll_x_in_c0_eni434_2_3_cmpReg(REG,284)
    redist3_sync_in_aunroll_x_in_c0_eni434_2_3_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_sync_in_aunroll_x_in_c0_eni434_2_3_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist3_sync_in_aunroll_x_in_c0_eni434_2_3_cmpReg_q <= STD_LOGIC_VECTOR(VCC_q);
        END IF;
    END PROCESS;

    -- redist3_sync_in_aunroll_x_in_c0_eni434_2_3_sticky_ena(REG,287)
    redist3_sync_in_aunroll_x_in_c0_eni434_2_3_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_sync_in_aunroll_x_in_c0_eni434_2_3_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist3_sync_in_aunroll_x_in_c0_eni434_2_3_nor_q = "1") THEN
                redist3_sync_in_aunroll_x_in_c0_eni434_2_3_sticky_ena_q <= STD_LOGIC_VECTOR(redist3_sync_in_aunroll_x_in_c0_eni434_2_3_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_sync_in_aunroll_x_in_c0_eni434_2_3_enaAnd(LOGICAL,288)
    redist3_sync_in_aunroll_x_in_c0_eni434_2_3_enaAnd_q <= redist3_sync_in_aunroll_x_in_c0_eni434_2_3_sticky_ena_q and VCC_q;

    -- redist3_sync_in_aunroll_x_in_c0_eni434_2_3_rdcnt(COUNTER,282)
    -- low=0, high=1, step=1, init=0
    redist3_sync_in_aunroll_x_in_c0_eni434_2_3_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_sync_in_aunroll_x_in_c0_eni434_2_3_rdcnt_i <= TO_UNSIGNED(0, 1);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist3_sync_in_aunroll_x_in_c0_eni434_2_3_rdcnt_i <= redist3_sync_in_aunroll_x_in_c0_eni434_2_3_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist3_sync_in_aunroll_x_in_c0_eni434_2_3_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist3_sync_in_aunroll_x_in_c0_eni434_2_3_rdcnt_i, 1)));

    -- redist3_sync_in_aunroll_x_in_c0_eni434_2_3_wraddr(REG,283)
    redist3_sync_in_aunroll_x_in_c0_eni434_2_3_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_sync_in_aunroll_x_in_c0_eni434_2_3_wraddr_q <= "1";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist3_sync_in_aunroll_x_in_c0_eni434_2_3_wraddr_q <= STD_LOGIC_VECTOR(redist3_sync_in_aunroll_x_in_c0_eni434_2_3_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist3_sync_in_aunroll_x_in_c0_eni434_2_3_mem(DUALMEM,281)
    redist3_sync_in_aunroll_x_in_c0_eni434_2_3_mem_ia <= STD_LOGIC_VECTOR(in_c0_eni434_2);
    redist3_sync_in_aunroll_x_in_c0_eni434_2_3_mem_aa <= redist3_sync_in_aunroll_x_in_c0_eni434_2_3_wraddr_q;
    redist3_sync_in_aunroll_x_in_c0_eni434_2_3_mem_ab <= redist3_sync_in_aunroll_x_in_c0_eni434_2_3_rdcnt_q;
    redist3_sync_in_aunroll_x_in_c0_eni434_2_3_mem_reset0 <= not (resetn);
    redist3_sync_in_aunroll_x_in_c0_eni434_2_3_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 32,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Arria 10"
    )
    PORT MAP (
        clocken1 => redist3_sync_in_aunroll_x_in_c0_eni434_2_3_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist3_sync_in_aunroll_x_in_c0_eni434_2_3_mem_reset0,
        clock1 => clock,
        address_a => redist3_sync_in_aunroll_x_in_c0_eni434_2_3_mem_aa,
        data_a => redist3_sync_in_aunroll_x_in_c0_eni434_2_3_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist3_sync_in_aunroll_x_in_c0_eni434_2_3_mem_ab,
        q_b => redist3_sync_in_aunroll_x_in_c0_eni434_2_3_mem_iq
    );
    redist3_sync_in_aunroll_x_in_c0_eni434_2_3_mem_q <= redist3_sync_in_aunroll_x_in_c0_eni434_2_3_mem_iq(31 downto 0);

    -- i_mul_i_i_ethash_search_bs4(BITSELECT,68)@0
    i_mul_i_i_ethash_search_bs4_b <= STD_LOGIC_VECTOR(in_c0_eni434_1(31 downto 18));

    -- i_mul_i_i_ethash_search_bs7(BITSELECT,71)@0
    i_mul_i_i_ethash_search_bs7_in <= STD_LOGIC_VECTOR(in_c0_eni434_1(17 downto 0));
    i_mul_i_i_ethash_search_bs7_b <= STD_LOGIC_VECTOR(i_mul_i_i_ethash_search_bs7_in(17 downto 0));

    -- i_mul_i_i_ethash_search_bjA8(BITJOIN,72)@0
    i_mul_i_i_ethash_search_bjA8_q <= GND_q & i_mul_i_i_ethash_search_bs7_b;

    -- i_mul_i_i_ethash_search_ma3_cma(CHAINMULTADD,269)@0 + 3
    i_mul_i_i_ethash_search_ma3_cma_reset <= not (resetn);
    i_mul_i_i_ethash_search_ma3_cma_ena0 <= '1';
    i_mul_i_i_ethash_search_ma3_cma_ena1 <= i_mul_i_i_ethash_search_ma3_cma_ena0;
    i_mul_i_i_ethash_search_ma3_cma_ena2 <= i_mul_i_i_ethash_search_ma3_cma_ena0;
    i_mul_i_i_ethash_search_ma3_cma_r(0) <= SIGNED(RESIZE(i_mul_i_i_ethash_search_ma3_cma_c1(0),15));
    i_mul_i_i_ethash_search_ma3_cma_r(1) <= SIGNED(RESIZE(i_mul_i_i_ethash_search_ma3_cma_c1(1),15));
    i_mul_i_i_ethash_search_ma3_cma_p(0) <= i_mul_i_i_ethash_search_ma3_cma_a1(0) * i_mul_i_i_ethash_search_ma3_cma_r(0);
    i_mul_i_i_ethash_search_ma3_cma_p(1) <= i_mul_i_i_ethash_search_ma3_cma_a1(1) * i_mul_i_i_ethash_search_ma3_cma_r(1);
    i_mul_i_i_ethash_search_ma3_cma_u(0) <= RESIZE(i_mul_i_i_ethash_search_ma3_cma_p(0),35);
    i_mul_i_i_ethash_search_ma3_cma_u(1) <= RESIZE(i_mul_i_i_ethash_search_ma3_cma_p(1),35);
    i_mul_i_i_ethash_search_ma3_cma_w(0) <= i_mul_i_i_ethash_search_ma3_cma_u(0) + i_mul_i_i_ethash_search_ma3_cma_u(1);
    i_mul_i_i_ethash_search_ma3_cma_x(0) <= i_mul_i_i_ethash_search_ma3_cma_w(0);
    i_mul_i_i_ethash_search_ma3_cma_y(0) <= i_mul_i_i_ethash_search_ma3_cma_x(0);
    i_mul_i_i_ethash_search_ma3_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_i_i_ethash_search_ma3_cma_a0 <= (others => (others => '0'));
            i_mul_i_i_ethash_search_ma3_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul_i_i_ethash_search_ma3_cma_ena0 = '1') THEN
                i_mul_i_i_ethash_search_ma3_cma_a0(0) <= RESIZE(SIGNED(i_mul_i_i_ethash_search_bjA8_q),19);
                i_mul_i_i_ethash_search_ma3_cma_a0(1) <= RESIZE(SIGNED(i_mul_i1_i_ethash_search_bjB6_q_const_q),19);
                i_mul_i_i_ethash_search_ma3_cma_c0(0) <= RESIZE(UNSIGNED(i_mul_i1_i_ethash_search_bs2_merged_bit_select_c_const_q),14);
                i_mul_i_i_ethash_search_ma3_cma_c0(1) <= RESIZE(UNSIGNED(i_mul_i_i_ethash_search_bs4_b),14);
            END IF;
        END IF;
    END PROCESS;
    i_mul_i_i_ethash_search_ma3_cma_chainmultadd_pipe: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_i_i_ethash_search_ma3_cma_a1 <= (others => (others => '0'));
            i_mul_i_i_ethash_search_ma3_cma_c1 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul_i_i_ethash_search_ma3_cma_ena2 = '1') THEN
                i_mul_i_i_ethash_search_ma3_cma_a1 <= i_mul_i_i_ethash_search_ma3_cma_a0;
                i_mul_i_i_ethash_search_ma3_cma_c1 <= i_mul_i_i_ethash_search_ma3_cma_c0;
            END IF;
        END IF;
    END PROCESS;
    i_mul_i_i_ethash_search_ma3_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_i_i_ethash_search_ma3_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul_i_i_ethash_search_ma3_cma_ena1 = '1') THEN
                i_mul_i_i_ethash_search_ma3_cma_s(0) <= i_mul_i_i_ethash_search_ma3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul_i_i_ethash_search_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul_i_i_ethash_search_ma3_cma_s(0)(33 downto 0)), xout => i_mul_i_i_ethash_search_ma3_cma_qq, clk => clock, aclr => resetn );
    i_mul_i_i_ethash_search_ma3_cma_q <= STD_LOGIC_VECTOR(i_mul_i_i_ethash_search_ma3_cma_qq(33 downto 0));

    -- i_mul_i_i_ethash_search_align_14(BITSHIFT,78)@3
    i_mul_i_i_ethash_search_align_14_qint <= i_mul_i_i_ethash_search_ma3_cma_q & "000000000000000000";
    i_mul_i_i_ethash_search_align_14_q <= i_mul_i_i_ethash_search_align_14_qint(51 downto 0);

    -- i_mul_i_i_ethash_search_bs11(BITSELECT,75)@0
    i_mul_i_i_ethash_search_bs11_b <= in_c0_eni434_1(31 downto 18);

    -- redist0_i_mul_i_i_ethash_search_bs11_b_3(DELAY,274)
    redist0_i_mul_i_i_ethash_search_bs11_b_3 : dspba_delay
    GENERIC MAP ( width => 14, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul_i_i_ethash_search_bs11_b, xout => redist0_i_mul_i_i_ethash_search_bs11_b_3_q, clk => clock, aclr => resetn );

    -- i_mul_i_i_ethash_search_im10_shift0(BITSHIFT,140)@3
    i_mul_i_i_ethash_search_im10_shift0_qint <= redist0_i_mul_i_i_ethash_search_bs11_b_3_q & "000000";
    i_mul_i_i_ethash_search_im10_shift0_q <= i_mul_i_i_ethash_search_im10_shift0_qint(19 downto 0);

    -- i_mul_i_i_ethash_search_bs1(BITSELECT,65)@0
    i_mul_i_i_ethash_search_bs1_in <= in_c0_eni434_1(17 downto 0);
    i_mul_i_i_ethash_search_bs1_b <= i_mul_i_i_ethash_search_bs1_in(17 downto 0);

    -- i_mul_i_i_ethash_search_im0_cma(CHAINMULTADD,266)@0 + 3
    i_mul_i_i_ethash_search_im0_cma_reset <= not (resetn);
    i_mul_i_i_ethash_search_im0_cma_ena0 <= '1';
    i_mul_i_i_ethash_search_im0_cma_ena1 <= i_mul_i_i_ethash_search_im0_cma_ena0;
    i_mul_i_i_ethash_search_im0_cma_ena2 <= i_mul_i_i_ethash_search_im0_cma_ena0;
    -- altera synthesis_off
    i_mul_i_i_ethash_search_im0_cma_k0 <= (
        0 => TO_UNSIGNED(403,18),
        others => (others => '0'));
    -- altera synthesis_on
    i_mul_i_i_ethash_search_im0_cma_r(0) <= i_mul_i_i_ethash_search_im0_cma_k0(TO_INTEGER(i_mul_i_i_ethash_search_im0_cma_c1(0)));
    i_mul_i_i_ethash_search_im0_cma_p(0) <= i_mul_i_i_ethash_search_im0_cma_a1(0) * i_mul_i_i_ethash_search_im0_cma_r(0);
    i_mul_i_i_ethash_search_im0_cma_u(0) <= RESIZE(i_mul_i_i_ethash_search_im0_cma_p(0),36);
    i_mul_i_i_ethash_search_im0_cma_w(0) <= i_mul_i_i_ethash_search_im0_cma_u(0);
    i_mul_i_i_ethash_search_im0_cma_x(0) <= i_mul_i_i_ethash_search_im0_cma_w(0);
    i_mul_i_i_ethash_search_im0_cma_y(0) <= i_mul_i_i_ethash_search_im0_cma_x(0);
    i_mul_i_i_ethash_search_im0_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_i_i_ethash_search_im0_cma_a0 <= (others => (others => '0'));
            i_mul_i_i_ethash_search_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul_i_i_ethash_search_im0_cma_ena0 = '1') THEN
                i_mul_i_i_ethash_search_im0_cma_a0(0) <= RESIZE(UNSIGNED(i_mul_i_i_ethash_search_bs1_b),18);
                i_mul_i_i_ethash_search_im0_cma_c0(0) <= RESIZE(UNSIGNED(GND_q),3);
            END IF;
        END IF;
    END PROCESS;
    i_mul_i_i_ethash_search_im0_cma_chainmultadd_pipe: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_i_i_ethash_search_im0_cma_a1 <= (others => (others => '0'));
            i_mul_i_i_ethash_search_im0_cma_c1 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul_i_i_ethash_search_im0_cma_ena2 = '1') THEN
                i_mul_i_i_ethash_search_im0_cma_a1 <= i_mul_i_i_ethash_search_im0_cma_a0;
                i_mul_i_i_ethash_search_im0_cma_c1 <= i_mul_i_i_ethash_search_im0_cma_c0;
            END IF;
        END IF;
    END PROCESS;
    i_mul_i_i_ethash_search_im0_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_i_i_ethash_search_im0_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul_i_i_ethash_search_im0_cma_ena1 = '1') THEN
                i_mul_i_i_ethash_search_im0_cma_s(0) <= i_mul_i_i_ethash_search_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul_i_i_ethash_search_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul_i_i_ethash_search_im0_cma_s(0)(35 downto 0)), xout => i_mul_i_i_ethash_search_im0_cma_qq, clk => clock, aclr => resetn );
    i_mul_i_i_ethash_search_im0_cma_q <= STD_LOGIC_VECTOR(i_mul_i_i_ethash_search_im0_cma_qq(35 downto 0));

    -- i_mul_i_i_ethash_search_join_13(BITJOIN,77)@3
    i_mul_i_i_ethash_search_join_13_q <= STD_LOGIC_VECTOR("0" & i_mul_i_i_ethash_search_im10_shift0_q) & i_mul_i_i_ethash_search_im0_cma_q;

    -- i_mul_i_i_ethash_search_result_add_0_0(ADD,80)@3
    i_mul_i_i_ethash_search_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & i_mul_i_i_ethash_search_join_13_q));
    i_mul_i_i_ethash_search_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((59 downto 52 => i_mul_i_i_ethash_search_align_14_q(51)) & i_mul_i_i_ethash_search_align_14_q));
    i_mul_i_i_ethash_search_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(i_mul_i_i_ethash_search_result_add_0_0_a) + SIGNED(i_mul_i_i_ethash_search_result_add_0_0_b));
    i_mul_i_i_ethash_search_result_add_0_0_q <= i_mul_i_i_ethash_search_result_add_0_0_o(58 downto 0);

    -- i_mul_i_i_ethash_search_extender_x(BITJOIN,12)@3
    i_mul_i_i_ethash_search_extender_x_q <= i_mul_i1_i_ethash_search_multconst_x_q & i_mul_i_i_ethash_search_result_add_0_0_q(56 downto 0);

    -- bgTrunc_i_mul_i_i_ethash_search_sel_x(BITSELECT,4)@3
    bgTrunc_i_mul_i_i_ethash_search_sel_x_b <= i_mul_i_i_ethash_search_extender_x_q(31 downto 0);

    -- i_xor_i_i680_ethash_search(LOGICAL,26)@3
    i_xor_i_i680_ethash_search_q <= bgTrunc_i_mul_i_i_ethash_search_sel_x_b xor redist3_sync_in_aunroll_x_in_c0_eni434_2_3_mem_q;

    -- i_mul_i3_i_ethash_search_bs4(BITSELECT,51)@3
    i_mul_i3_i_ethash_search_bs4_b <= STD_LOGIC_VECTOR(i_xor_i_i680_ethash_search_q(31 downto 18));

    -- i_mul_i3_i_ethash_search_bs7(BITSELECT,54)@3
    i_mul_i3_i_ethash_search_bs7_in <= STD_LOGIC_VECTOR(i_xor_i_i680_ethash_search_q(17 downto 0));
    i_mul_i3_i_ethash_search_bs7_b <= STD_LOGIC_VECTOR(i_mul_i3_i_ethash_search_bs7_in(17 downto 0));

    -- i_mul_i3_i_ethash_search_bjA8(BITJOIN,55)@3
    i_mul_i3_i_ethash_search_bjA8_q <= GND_q & i_mul_i3_i_ethash_search_bs7_b;

    -- i_mul_i3_i_ethash_search_ma3_cma(CHAINMULTADD,268)@3 + 3
    i_mul_i3_i_ethash_search_ma3_cma_reset <= not (resetn);
    i_mul_i3_i_ethash_search_ma3_cma_ena0 <= '1';
    i_mul_i3_i_ethash_search_ma3_cma_ena1 <= i_mul_i3_i_ethash_search_ma3_cma_ena0;
    i_mul_i3_i_ethash_search_ma3_cma_ena2 <= i_mul_i3_i_ethash_search_ma3_cma_ena0;
    i_mul_i3_i_ethash_search_ma3_cma_r(0) <= SIGNED(RESIZE(i_mul_i3_i_ethash_search_ma3_cma_c1(0),15));
    i_mul_i3_i_ethash_search_ma3_cma_r(1) <= SIGNED(RESIZE(i_mul_i3_i_ethash_search_ma3_cma_c1(1),15));
    i_mul_i3_i_ethash_search_ma3_cma_p(0) <= i_mul_i3_i_ethash_search_ma3_cma_a1(0) * i_mul_i3_i_ethash_search_ma3_cma_r(0);
    i_mul_i3_i_ethash_search_ma3_cma_p(1) <= i_mul_i3_i_ethash_search_ma3_cma_a1(1) * i_mul_i3_i_ethash_search_ma3_cma_r(1);
    i_mul_i3_i_ethash_search_ma3_cma_u(0) <= RESIZE(i_mul_i3_i_ethash_search_ma3_cma_p(0),35);
    i_mul_i3_i_ethash_search_ma3_cma_u(1) <= RESIZE(i_mul_i3_i_ethash_search_ma3_cma_p(1),35);
    i_mul_i3_i_ethash_search_ma3_cma_w(0) <= i_mul_i3_i_ethash_search_ma3_cma_u(0) + i_mul_i3_i_ethash_search_ma3_cma_u(1);
    i_mul_i3_i_ethash_search_ma3_cma_x(0) <= i_mul_i3_i_ethash_search_ma3_cma_w(0);
    i_mul_i3_i_ethash_search_ma3_cma_y(0) <= i_mul_i3_i_ethash_search_ma3_cma_x(0);
    i_mul_i3_i_ethash_search_ma3_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_i3_i_ethash_search_ma3_cma_a0 <= (others => (others => '0'));
            i_mul_i3_i_ethash_search_ma3_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul_i3_i_ethash_search_ma3_cma_ena0 = '1') THEN
                i_mul_i3_i_ethash_search_ma3_cma_a0(0) <= RESIZE(SIGNED(i_mul_i3_i_ethash_search_bjA8_q),19);
                i_mul_i3_i_ethash_search_ma3_cma_a0(1) <= RESIZE(SIGNED(i_mul_i1_i_ethash_search_bjB6_q_const_q),19);
                i_mul_i3_i_ethash_search_ma3_cma_c0(0) <= RESIZE(UNSIGNED(i_mul_i1_i_ethash_search_bs2_merged_bit_select_c_const_q),14);
                i_mul_i3_i_ethash_search_ma3_cma_c0(1) <= RESIZE(UNSIGNED(i_mul_i3_i_ethash_search_bs4_b),14);
            END IF;
        END IF;
    END PROCESS;
    i_mul_i3_i_ethash_search_ma3_cma_chainmultadd_pipe: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_i3_i_ethash_search_ma3_cma_a1 <= (others => (others => '0'));
            i_mul_i3_i_ethash_search_ma3_cma_c1 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul_i3_i_ethash_search_ma3_cma_ena2 = '1') THEN
                i_mul_i3_i_ethash_search_ma3_cma_a1 <= i_mul_i3_i_ethash_search_ma3_cma_a0;
                i_mul_i3_i_ethash_search_ma3_cma_c1 <= i_mul_i3_i_ethash_search_ma3_cma_c0;
            END IF;
        END IF;
    END PROCESS;
    i_mul_i3_i_ethash_search_ma3_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_i3_i_ethash_search_ma3_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul_i3_i_ethash_search_ma3_cma_ena1 = '1') THEN
                i_mul_i3_i_ethash_search_ma3_cma_s(0) <= i_mul_i3_i_ethash_search_ma3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul_i3_i_ethash_search_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul_i3_i_ethash_search_ma3_cma_s(0)(33 downto 0)), xout => i_mul_i3_i_ethash_search_ma3_cma_qq, clk => clock, aclr => resetn );
    i_mul_i3_i_ethash_search_ma3_cma_q <= STD_LOGIC_VECTOR(i_mul_i3_i_ethash_search_ma3_cma_qq(33 downto 0));

    -- i_mul_i3_i_ethash_search_align_14(BITSHIFT,61)@6
    i_mul_i3_i_ethash_search_align_14_qint <= i_mul_i3_i_ethash_search_ma3_cma_q & "000000000000000000";
    i_mul_i3_i_ethash_search_align_14_q <= i_mul_i3_i_ethash_search_align_14_qint(51 downto 0);

    -- i_mul_i3_i_ethash_search_bs11(BITSELECT,58)@3
    i_mul_i3_i_ethash_search_bs11_b <= i_xor_i_i680_ethash_search_q(31 downto 18);

    -- redist1_i_mul_i3_i_ethash_search_bs11_b_3(DELAY,275)
    redist1_i_mul_i3_i_ethash_search_bs11_b_3 : dspba_delay
    GENERIC MAP ( width => 14, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul_i3_i_ethash_search_bs11_b, xout => redist1_i_mul_i3_i_ethash_search_bs11_b_3_q, clk => clock, aclr => resetn );

    -- i_mul_i3_i_ethash_search_im10_shift0(BITSHIFT,120)@6
    i_mul_i3_i_ethash_search_im10_shift0_qint <= redist1_i_mul_i3_i_ethash_search_bs11_b_3_q & "000000";
    i_mul_i3_i_ethash_search_im10_shift0_q <= i_mul_i3_i_ethash_search_im10_shift0_qint(19 downto 0);

    -- i_mul_i3_i_ethash_search_bs1(BITSELECT,48)@3
    i_mul_i3_i_ethash_search_bs1_in <= i_xor_i_i680_ethash_search_q(17 downto 0);
    i_mul_i3_i_ethash_search_bs1_b <= i_mul_i3_i_ethash_search_bs1_in(17 downto 0);

    -- i_mul_i3_i_ethash_search_im0_cma(CHAINMULTADD,265)@3 + 3
    i_mul_i3_i_ethash_search_im0_cma_reset <= not (resetn);
    i_mul_i3_i_ethash_search_im0_cma_ena0 <= '1';
    i_mul_i3_i_ethash_search_im0_cma_ena1 <= i_mul_i3_i_ethash_search_im0_cma_ena0;
    i_mul_i3_i_ethash_search_im0_cma_ena2 <= i_mul_i3_i_ethash_search_im0_cma_ena0;
    -- altera synthesis_off
    i_mul_i3_i_ethash_search_im0_cma_k0 <= (
        0 => TO_UNSIGNED(403,18),
        others => (others => '0'));
    -- altera synthesis_on
    i_mul_i3_i_ethash_search_im0_cma_r(0) <= i_mul_i3_i_ethash_search_im0_cma_k0(TO_INTEGER(i_mul_i3_i_ethash_search_im0_cma_c1(0)));
    i_mul_i3_i_ethash_search_im0_cma_p(0) <= i_mul_i3_i_ethash_search_im0_cma_a1(0) * i_mul_i3_i_ethash_search_im0_cma_r(0);
    i_mul_i3_i_ethash_search_im0_cma_u(0) <= RESIZE(i_mul_i3_i_ethash_search_im0_cma_p(0),36);
    i_mul_i3_i_ethash_search_im0_cma_w(0) <= i_mul_i3_i_ethash_search_im0_cma_u(0);
    i_mul_i3_i_ethash_search_im0_cma_x(0) <= i_mul_i3_i_ethash_search_im0_cma_w(0);
    i_mul_i3_i_ethash_search_im0_cma_y(0) <= i_mul_i3_i_ethash_search_im0_cma_x(0);
    i_mul_i3_i_ethash_search_im0_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_i3_i_ethash_search_im0_cma_a0 <= (others => (others => '0'));
            i_mul_i3_i_ethash_search_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul_i3_i_ethash_search_im0_cma_ena0 = '1') THEN
                i_mul_i3_i_ethash_search_im0_cma_a0(0) <= RESIZE(UNSIGNED(i_mul_i3_i_ethash_search_bs1_b),18);
                i_mul_i3_i_ethash_search_im0_cma_c0(0) <= RESIZE(UNSIGNED(GND_q),3);
            END IF;
        END IF;
    END PROCESS;
    i_mul_i3_i_ethash_search_im0_cma_chainmultadd_pipe: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_i3_i_ethash_search_im0_cma_a1 <= (others => (others => '0'));
            i_mul_i3_i_ethash_search_im0_cma_c1 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul_i3_i_ethash_search_im0_cma_ena2 = '1') THEN
                i_mul_i3_i_ethash_search_im0_cma_a1 <= i_mul_i3_i_ethash_search_im0_cma_a0;
                i_mul_i3_i_ethash_search_im0_cma_c1 <= i_mul_i3_i_ethash_search_im0_cma_c0;
            END IF;
        END IF;
    END PROCESS;
    i_mul_i3_i_ethash_search_im0_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_i3_i_ethash_search_im0_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul_i3_i_ethash_search_im0_cma_ena1 = '1') THEN
                i_mul_i3_i_ethash_search_im0_cma_s(0) <= i_mul_i3_i_ethash_search_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul_i3_i_ethash_search_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul_i3_i_ethash_search_im0_cma_s(0)(35 downto 0)), xout => i_mul_i3_i_ethash_search_im0_cma_qq, clk => clock, aclr => resetn );
    i_mul_i3_i_ethash_search_im0_cma_q <= STD_LOGIC_VECTOR(i_mul_i3_i_ethash_search_im0_cma_qq(35 downto 0));

    -- i_mul_i3_i_ethash_search_join_13(BITJOIN,60)@6
    i_mul_i3_i_ethash_search_join_13_q <= STD_LOGIC_VECTOR("0" & i_mul_i3_i_ethash_search_im10_shift0_q) & i_mul_i3_i_ethash_search_im0_cma_q;

    -- i_mul_i3_i_ethash_search_result_add_0_0(ADD,63)@6
    i_mul_i3_i_ethash_search_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & i_mul_i3_i_ethash_search_join_13_q));
    i_mul_i3_i_ethash_search_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((59 downto 52 => i_mul_i3_i_ethash_search_align_14_q(51)) & i_mul_i3_i_ethash_search_align_14_q));
    i_mul_i3_i_ethash_search_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(i_mul_i3_i_ethash_search_result_add_0_0_a) + SIGNED(i_mul_i3_i_ethash_search_result_add_0_0_b));
    i_mul_i3_i_ethash_search_result_add_0_0_q <= i_mul_i3_i_ethash_search_result_add_0_0_o(58 downto 0);

    -- i_mul_i3_i_ethash_search_extender_x(BITJOIN,10)@6
    i_mul_i3_i_ethash_search_extender_x_q <= i_mul_i1_i_ethash_search_multconst_x_q & i_mul_i3_i_ethash_search_result_add_0_0_q(56 downto 0);

    -- bgTrunc_i_mul_i3_i_ethash_search_sel_x(BITSELECT,3)@6
    bgTrunc_i_mul_i3_i_ethash_search_sel_x_b <= i_mul_i3_i_ethash_search_extender_x_q(31 downto 0);

    -- i_xor_i4_i_ethash_search(LOGICAL,25)@6
    i_xor_i4_i_ethash_search_q <= bgTrunc_i_mul_i3_i_ethash_search_sel_x_b xor redist4_sync_in_aunroll_x_in_c0_eni434_3_6_mem_q;

    -- i_mul_i1_i_ethash_search_bs4(BITSELECT,34)@6
    i_mul_i1_i_ethash_search_bs4_b <= STD_LOGIC_VECTOR(i_xor_i4_i_ethash_search_q(31 downto 18));

    -- i_mul_i1_i_ethash_search_bjB6_q_const(CONSTANT,272)
    i_mul_i1_i_ethash_search_bjB6_q_const_q <= "0000000000110010011";

    -- i_mul_i1_i_ethash_search_bs2_merged_bit_select_c_const(CONSTANT,273)
    i_mul_i1_i_ethash_search_bs2_merged_bit_select_c_const_q <= "1000000";

    -- i_mul_i1_i_ethash_search_bs7(BITSELECT,37)@6
    i_mul_i1_i_ethash_search_bs7_in <= STD_LOGIC_VECTOR(i_xor_i4_i_ethash_search_q(17 downto 0));
    i_mul_i1_i_ethash_search_bs7_b <= STD_LOGIC_VECTOR(i_mul_i1_i_ethash_search_bs7_in(17 downto 0));

    -- i_mul_i1_i_ethash_search_bjA8(BITJOIN,38)@6
    i_mul_i1_i_ethash_search_bjA8_q <= GND_q & i_mul_i1_i_ethash_search_bs7_b;

    -- i_mul_i1_i_ethash_search_ma3_cma(CHAINMULTADD,267)@6 + 3
    i_mul_i1_i_ethash_search_ma3_cma_reset <= not (resetn);
    i_mul_i1_i_ethash_search_ma3_cma_ena0 <= '1';
    i_mul_i1_i_ethash_search_ma3_cma_ena1 <= i_mul_i1_i_ethash_search_ma3_cma_ena0;
    i_mul_i1_i_ethash_search_ma3_cma_ena2 <= i_mul_i1_i_ethash_search_ma3_cma_ena0;
    i_mul_i1_i_ethash_search_ma3_cma_r(0) <= SIGNED(RESIZE(i_mul_i1_i_ethash_search_ma3_cma_c1(0),15));
    i_mul_i1_i_ethash_search_ma3_cma_r(1) <= SIGNED(RESIZE(i_mul_i1_i_ethash_search_ma3_cma_c1(1),15));
    i_mul_i1_i_ethash_search_ma3_cma_p(0) <= i_mul_i1_i_ethash_search_ma3_cma_a1(0) * i_mul_i1_i_ethash_search_ma3_cma_r(0);
    i_mul_i1_i_ethash_search_ma3_cma_p(1) <= i_mul_i1_i_ethash_search_ma3_cma_a1(1) * i_mul_i1_i_ethash_search_ma3_cma_r(1);
    i_mul_i1_i_ethash_search_ma3_cma_u(0) <= RESIZE(i_mul_i1_i_ethash_search_ma3_cma_p(0),35);
    i_mul_i1_i_ethash_search_ma3_cma_u(1) <= RESIZE(i_mul_i1_i_ethash_search_ma3_cma_p(1),35);
    i_mul_i1_i_ethash_search_ma3_cma_w(0) <= i_mul_i1_i_ethash_search_ma3_cma_u(0) + i_mul_i1_i_ethash_search_ma3_cma_u(1);
    i_mul_i1_i_ethash_search_ma3_cma_x(0) <= i_mul_i1_i_ethash_search_ma3_cma_w(0);
    i_mul_i1_i_ethash_search_ma3_cma_y(0) <= i_mul_i1_i_ethash_search_ma3_cma_x(0);
    i_mul_i1_i_ethash_search_ma3_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_i1_i_ethash_search_ma3_cma_a0 <= (others => (others => '0'));
            i_mul_i1_i_ethash_search_ma3_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul_i1_i_ethash_search_ma3_cma_ena0 = '1') THEN
                i_mul_i1_i_ethash_search_ma3_cma_a0(0) <= RESIZE(SIGNED(i_mul_i1_i_ethash_search_bjA8_q),19);
                i_mul_i1_i_ethash_search_ma3_cma_a0(1) <= RESIZE(SIGNED(i_mul_i1_i_ethash_search_bjB6_q_const_q),19);
                i_mul_i1_i_ethash_search_ma3_cma_c0(0) <= RESIZE(UNSIGNED(i_mul_i1_i_ethash_search_bs2_merged_bit_select_c_const_q),14);
                i_mul_i1_i_ethash_search_ma3_cma_c0(1) <= RESIZE(UNSIGNED(i_mul_i1_i_ethash_search_bs4_b),14);
            END IF;
        END IF;
    END PROCESS;
    i_mul_i1_i_ethash_search_ma3_cma_chainmultadd_pipe: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_i1_i_ethash_search_ma3_cma_a1 <= (others => (others => '0'));
            i_mul_i1_i_ethash_search_ma3_cma_c1 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul_i1_i_ethash_search_ma3_cma_ena2 = '1') THEN
                i_mul_i1_i_ethash_search_ma3_cma_a1 <= i_mul_i1_i_ethash_search_ma3_cma_a0;
                i_mul_i1_i_ethash_search_ma3_cma_c1 <= i_mul_i1_i_ethash_search_ma3_cma_c0;
            END IF;
        END IF;
    END PROCESS;
    i_mul_i1_i_ethash_search_ma3_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_i1_i_ethash_search_ma3_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul_i1_i_ethash_search_ma3_cma_ena1 = '1') THEN
                i_mul_i1_i_ethash_search_ma3_cma_s(0) <= i_mul_i1_i_ethash_search_ma3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul_i1_i_ethash_search_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul_i1_i_ethash_search_ma3_cma_s(0)(33 downto 0)), xout => i_mul_i1_i_ethash_search_ma3_cma_qq, clk => clock, aclr => resetn );
    i_mul_i1_i_ethash_search_ma3_cma_q <= STD_LOGIC_VECTOR(i_mul_i1_i_ethash_search_ma3_cma_qq(33 downto 0));

    -- i_mul_i1_i_ethash_search_align_14(BITSHIFT,44)@9
    i_mul_i1_i_ethash_search_align_14_qint <= i_mul_i1_i_ethash_search_ma3_cma_q & "000000000000000000";
    i_mul_i1_i_ethash_search_align_14_q <= i_mul_i1_i_ethash_search_align_14_qint(51 downto 0);

    -- i_mul_i1_i_ethash_search_bs11(BITSELECT,41)@6
    i_mul_i1_i_ethash_search_bs11_b <= i_xor_i4_i_ethash_search_q(31 downto 18);

    -- redist2_i_mul_i1_i_ethash_search_bs11_b_3(DELAY,276)
    redist2_i_mul_i1_i_ethash_search_bs11_b_3 : dspba_delay
    GENERIC MAP ( width => 14, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul_i1_i_ethash_search_bs11_b, xout => redist2_i_mul_i1_i_ethash_search_bs11_b_3_q, clk => clock, aclr => resetn );

    -- i_mul_i1_i_ethash_search_im10_shift0(BITSHIFT,100)@9
    i_mul_i1_i_ethash_search_im10_shift0_qint <= redist2_i_mul_i1_i_ethash_search_bs11_b_3_q & "000000";
    i_mul_i1_i_ethash_search_im10_shift0_q <= i_mul_i1_i_ethash_search_im10_shift0_qint(19 downto 0);

    -- i_mul_i1_i_ethash_search_bs1(BITSELECT,31)@6
    i_mul_i1_i_ethash_search_bs1_in <= i_xor_i4_i_ethash_search_q(17 downto 0);
    i_mul_i1_i_ethash_search_bs1_b <= i_mul_i1_i_ethash_search_bs1_in(17 downto 0);

    -- i_mul_i1_i_ethash_search_im0_cma(CHAINMULTADD,264)@6 + 3
    i_mul_i1_i_ethash_search_im0_cma_reset <= not (resetn);
    i_mul_i1_i_ethash_search_im0_cma_ena0 <= '1';
    i_mul_i1_i_ethash_search_im0_cma_ena1 <= i_mul_i1_i_ethash_search_im0_cma_ena0;
    i_mul_i1_i_ethash_search_im0_cma_ena2 <= i_mul_i1_i_ethash_search_im0_cma_ena0;
    -- altera synthesis_off
    i_mul_i1_i_ethash_search_im0_cma_k0 <= (
        0 => TO_UNSIGNED(403,18),
        others => (others => '0'));
    -- altera synthesis_on
    i_mul_i1_i_ethash_search_im0_cma_r(0) <= i_mul_i1_i_ethash_search_im0_cma_k0(TO_INTEGER(i_mul_i1_i_ethash_search_im0_cma_c1(0)));
    i_mul_i1_i_ethash_search_im0_cma_p(0) <= i_mul_i1_i_ethash_search_im0_cma_a1(0) * i_mul_i1_i_ethash_search_im0_cma_r(0);
    i_mul_i1_i_ethash_search_im0_cma_u(0) <= RESIZE(i_mul_i1_i_ethash_search_im0_cma_p(0),36);
    i_mul_i1_i_ethash_search_im0_cma_w(0) <= i_mul_i1_i_ethash_search_im0_cma_u(0);
    i_mul_i1_i_ethash_search_im0_cma_x(0) <= i_mul_i1_i_ethash_search_im0_cma_w(0);
    i_mul_i1_i_ethash_search_im0_cma_y(0) <= i_mul_i1_i_ethash_search_im0_cma_x(0);
    i_mul_i1_i_ethash_search_im0_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_i1_i_ethash_search_im0_cma_a0 <= (others => (others => '0'));
            i_mul_i1_i_ethash_search_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul_i1_i_ethash_search_im0_cma_ena0 = '1') THEN
                i_mul_i1_i_ethash_search_im0_cma_a0(0) <= RESIZE(UNSIGNED(i_mul_i1_i_ethash_search_bs1_b),18);
                i_mul_i1_i_ethash_search_im0_cma_c0(0) <= RESIZE(UNSIGNED(GND_q),3);
            END IF;
        END IF;
    END PROCESS;
    i_mul_i1_i_ethash_search_im0_cma_chainmultadd_pipe: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_i1_i_ethash_search_im0_cma_a1 <= (others => (others => '0'));
            i_mul_i1_i_ethash_search_im0_cma_c1 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul_i1_i_ethash_search_im0_cma_ena2 = '1') THEN
                i_mul_i1_i_ethash_search_im0_cma_a1 <= i_mul_i1_i_ethash_search_im0_cma_a0;
                i_mul_i1_i_ethash_search_im0_cma_c1 <= i_mul_i1_i_ethash_search_im0_cma_c0;
            END IF;
        END IF;
    END PROCESS;
    i_mul_i1_i_ethash_search_im0_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_i1_i_ethash_search_im0_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul_i1_i_ethash_search_im0_cma_ena1 = '1') THEN
                i_mul_i1_i_ethash_search_im0_cma_s(0) <= i_mul_i1_i_ethash_search_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul_i1_i_ethash_search_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul_i1_i_ethash_search_im0_cma_s(0)(35 downto 0)), xout => i_mul_i1_i_ethash_search_im0_cma_qq, clk => clock, aclr => resetn );
    i_mul_i1_i_ethash_search_im0_cma_q <= STD_LOGIC_VECTOR(i_mul_i1_i_ethash_search_im0_cma_qq(35 downto 0));

    -- i_mul_i1_i_ethash_search_join_13(BITJOIN,43)@9
    i_mul_i1_i_ethash_search_join_13_q <= STD_LOGIC_VECTOR("0" & i_mul_i1_i_ethash_search_im10_shift0_q) & i_mul_i1_i_ethash_search_im0_cma_q;

    -- i_mul_i1_i_ethash_search_result_add_0_0(ADD,46)@9
    i_mul_i1_i_ethash_search_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & i_mul_i1_i_ethash_search_join_13_q));
    i_mul_i1_i_ethash_search_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((59 downto 52 => i_mul_i1_i_ethash_search_align_14_q(51)) & i_mul_i1_i_ethash_search_align_14_q));
    i_mul_i1_i_ethash_search_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(i_mul_i1_i_ethash_search_result_add_0_0_a) + SIGNED(i_mul_i1_i_ethash_search_result_add_0_0_b));
    i_mul_i1_i_ethash_search_result_add_0_0_q <= i_mul_i1_i_ethash_search_result_add_0_0_o(58 downto 0);

    -- i_mul_i1_i_ethash_search_extender_x(BITJOIN,8)@9
    i_mul_i1_i_ethash_search_extender_x_q <= i_mul_i1_i_ethash_search_multconst_x_q & i_mul_i1_i_ethash_search_result_add_0_0_q(56 downto 0);

    -- bgTrunc_i_mul_i1_i_ethash_search_sel_x(BITSELECT,2)@9
    bgTrunc_i_mul_i1_i_ethash_search_sel_x_b <= i_mul_i1_i_ethash_search_extender_x_q(31 downto 0);

    -- i_xor_i2_i_ethash_search(LOGICAL,24)@9
    i_xor_i2_i_ethash_search_q <= bgTrunc_i_mul_i1_i_ethash_search_sel_x_b xor redist5_sync_in_aunroll_x_in_c0_eni434_4_9_mem_q;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,15)@9
    out_c0_exi140_0 <= GND_q;
    out_c0_exi140_1 <= i_xor_i2_i_ethash_search_q;
    out_o_valid <= redist6_sync_in_aunroll_x_in_i_valid_9_q;

END normal;
