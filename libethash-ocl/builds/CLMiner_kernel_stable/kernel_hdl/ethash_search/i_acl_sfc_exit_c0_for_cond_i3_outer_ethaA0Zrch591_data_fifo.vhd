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

-- VHDL created from i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search591_data_fifo
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

entity i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search591_data_fifo is
    port (
        in_data_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_1 : in std_logic_vector(5 downto 0);  -- ufix6
        in_data_in_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_4 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_5 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_6 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_7 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_8 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_9 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_10 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_11 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_12 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_13 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_14 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_15 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_16 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_17 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_18 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_19 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_20 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_21 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_22 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_23 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_24 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_25 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_26 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_27 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_28 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_29 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_30 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_31 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_32 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_33 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_34 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_35 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_36 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_1 : out std_logic_vector(5 downto 0);  -- ufix6
        out_data_out_2 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_3 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_4 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_5 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_6 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_7 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_8 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_9 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_10 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_11 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_12 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_13 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_14 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_15 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_16 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_17 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_18 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_19 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_20 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_21 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_22 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_23 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_24 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_25 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_26 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_27 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_28 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_29 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_30 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_31 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_32 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_33 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_34 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_35 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_36 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search591_data_fifo;

architecture normal of i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search591_data_fifo is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component acl_data_fifo is
        generic (
            DEPTH : INTEGER;
            ALLOW_FULL_WRITE : INTEGER := 1;
            DATA_WIDTH : INTEGER := 1728;
            IMPL : STRING := "ram"
        );
        port (
            data_in : in std_logic_vector(1727 downto 0);
            stall_in : in std_logic;
            valid_in : in std_logic;
            data_out : out std_logic_vector(1727 downto 0);
            stall_out : out std_logic;
            valid_out : out std_logic;
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal dupName_0_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (5 downto 0);
    signal dupName_0_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (5 downto 0);
    signal dupName_0_c_i7_0gr_x_q : STD_LOGIC_VECTOR (6 downto 0);
    signal dupName_0_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_0_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (5 downto 0);
    signal dupName_0_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_1_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_1_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_1_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_1_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_1_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_2_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_2_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_3_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_3_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_4_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_4_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_5_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_5_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_6_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_6_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_7_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_7_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_8_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_8_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_9_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_9_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_10_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_10_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_11_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_11_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_12_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_12_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_13_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_13_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_14_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_14_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_15_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_15_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_16_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_16_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_17_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_17_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_18_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_18_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_19_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_19_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_20_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_20_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_21_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_21_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_22_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_22_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_23_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_23_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_24_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_24_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_25_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_25_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_26_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_26_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_27_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_27_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_28_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_28_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_29_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_29_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_30_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_30_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_31_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_31_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_32_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_32_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_33_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_34_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_35_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal adapt_scalar_trunc_in : STD_LOGIC_VECTOR (0 downto 0);
    signal adapt_scalar_trunc_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c_i16_0gr_q : STD_LOGIC_VECTOR (15 downto 0);
    signal c_i24_0gr_q : STD_LOGIC_VECTOR (23 downto 0);
    signal c_i2_0gr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal dsdk_ip_adapt_bitjoin_q : STD_LOGIC_VECTOR (1727 downto 0);
    signal element_extension_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_in : STD_LOGIC_VECTOR (1727 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_stall_in_bitsignaltemp : std_logic;
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_valid_in_bitsignaltemp : std_logic;
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out : STD_LOGIC_VECTOR (1727 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_stall_out_bitsignaltemp : std_logic;
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_valid_out_bitsignaltemp : std_logic;
    signal ip_dsdk_adapt_bitselect_b : STD_LOGIC_VECTOR (0 downto 0);
    signal ip_dsdk_adapt_cast_b : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- c_i24_0gr(CONSTANT,80)
    c_i24_0gr_q <= "000000000000000000000000";

    -- dupName_0_c_i7_0gr_x(CONSTANT,5)
    dupName_0_c_i7_0gr_x_q <= "0000000";

    -- dupName_1_element_extension_x(BITJOIN,10)
    dupName_1_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_36;

    -- c_i32_0gr(CONSTANT,82)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- c_i16_0gr(CONSTANT,79)
    c_i16_0gr_q <= "0000000000000000";

    -- c_i2_0gr(CONSTANT,81)
    c_i2_0gr_q <= "00";

    -- dupName_0_element_extension_x(BITJOIN,6)
    dupName_0_element_extension_x_q <= c_i2_0gr_q & in_data_in_1;

    -- element_extension(BITJOIN,85)
    element_extension_q <= dupName_0_c_i7_0gr_x_q & in_data_in_0;

    -- dsdk_ip_adapt_bitjoin(BITJOIN,84)
    dsdk_ip_adapt_bitjoin_q <= c_i24_0gr_q & dupName_1_element_extension_x_q & in_data_in_35 & in_data_in_34 & in_data_in_33 & in_data_in_32 & in_data_in_31 & in_data_in_30 & in_data_in_29 & in_data_in_28 & in_data_in_27 & in_data_in_26 & in_data_in_25 & in_data_in_24 & in_data_in_23 & in_data_in_22 & in_data_in_21 & in_data_in_20 & in_data_in_19 & in_data_in_18 & c_i32_0gr_q & in_data_in_17 & in_data_in_16 & in_data_in_15 & in_data_in_14 & in_data_in_13 & in_data_in_12 & in_data_in_11 & in_data_in_10 & in_data_in_9 & in_data_in_8 & in_data_in_7 & in_data_in_6 & in_data_in_5 & in_data_in_4 & in_data_in_3 & in_data_in_2 & c_i16_0gr_q & dupName_0_element_extension_x_q & element_extension_q;

    -- i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592(EXTIFACE,86)
    i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_in <= dsdk_ip_adapt_bitjoin_q;
    i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_stall_in <= in_stall_in;
    i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_valid_in <= in_valid_in;
    i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_stall_in_bitsignaltemp <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_stall_in(0);
    i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_valid_in_bitsignaltemp <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_valid_in(0);
    i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_stall_out(0) <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_stall_out_bitsignaltemp;
    i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_valid_out(0) <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_valid_out_bitsignaltemp;
    thei_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592 : acl_data_fifo
    GENERIC MAP (
        DEPTH => 8,
        ALLOW_FULL_WRITE => 1,
        DATA_WIDTH => 1728,
        IMPL => "ram"
    )
    PORT MAP (
        data_in => dsdk_ip_adapt_bitjoin_q,
        stall_in => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_stall_in_bitsignaltemp,
        valid_in => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_valid_in_bitsignaltemp,
        data_out => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out,
        stall_out => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_stall_out_bitsignaltemp,
        valid_out => i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_valid_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- dupName_35_ip_dsdk_adapt_bitselect_x(BITSELECT,77)
    dupName_35_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(1696 downto 1696);

    -- dupName_1_adapt_scalar_trunc_x(ROUND,9)
    dupName_1_adapt_scalar_trunc_x_in <= dupName_35_ip_dsdk_adapt_bitselect_x_b;
    dupName_1_adapt_scalar_trunc_x_q <= dupName_1_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_34_ip_dsdk_adapt_bitselect_x(BITSELECT,76)
    dupName_34_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(1695 downto 1664);

    -- dupName_32_ip_dsdk_adapt_cast_x(BITSELECT,74)
    dupName_32_ip_dsdk_adapt_cast_x_b <= dupName_34_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_33_ip_dsdk_adapt_bitselect_x(BITSELECT,75)
    dupName_33_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(1663 downto 1600);

    -- dupName_31_ip_dsdk_adapt_cast_x(BITSELECT,72)
    dupName_31_ip_dsdk_adapt_cast_x_b <= dupName_33_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_32_ip_dsdk_adapt_bitselect_x(BITSELECT,73)
    dupName_32_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(1599 downto 1536);

    -- dupName_30_ip_dsdk_adapt_cast_x(BITSELECT,70)
    dupName_30_ip_dsdk_adapt_cast_x_b <= dupName_32_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_31_ip_dsdk_adapt_bitselect_x(BITSELECT,71)
    dupName_31_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(1535 downto 1472);

    -- dupName_29_ip_dsdk_adapt_cast_x(BITSELECT,68)
    dupName_29_ip_dsdk_adapt_cast_x_b <= dupName_31_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_30_ip_dsdk_adapt_bitselect_x(BITSELECT,69)
    dupName_30_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(1471 downto 1408);

    -- dupName_28_ip_dsdk_adapt_cast_x(BITSELECT,66)
    dupName_28_ip_dsdk_adapt_cast_x_b <= dupName_30_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_29_ip_dsdk_adapt_bitselect_x(BITSELECT,67)
    dupName_29_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(1407 downto 1344);

    -- dupName_27_ip_dsdk_adapt_cast_x(BITSELECT,64)
    dupName_27_ip_dsdk_adapt_cast_x_b <= dupName_29_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_28_ip_dsdk_adapt_bitselect_x(BITSELECT,65)
    dupName_28_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(1343 downto 1280);

    -- dupName_26_ip_dsdk_adapt_cast_x(BITSELECT,62)
    dupName_26_ip_dsdk_adapt_cast_x_b <= dupName_28_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_27_ip_dsdk_adapt_bitselect_x(BITSELECT,63)
    dupName_27_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(1279 downto 1216);

    -- dupName_25_ip_dsdk_adapt_cast_x(BITSELECT,60)
    dupName_25_ip_dsdk_adapt_cast_x_b <= dupName_27_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_26_ip_dsdk_adapt_bitselect_x(BITSELECT,61)
    dupName_26_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(1215 downto 1152);

    -- dupName_24_ip_dsdk_adapt_cast_x(BITSELECT,58)
    dupName_24_ip_dsdk_adapt_cast_x_b <= dupName_26_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_25_ip_dsdk_adapt_bitselect_x(BITSELECT,59)
    dupName_25_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(1151 downto 1088);

    -- dupName_23_ip_dsdk_adapt_cast_x(BITSELECT,56)
    dupName_23_ip_dsdk_adapt_cast_x_b <= dupName_25_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_24_ip_dsdk_adapt_bitselect_x(BITSELECT,57)
    dupName_24_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(1087 downto 1024);

    -- dupName_22_ip_dsdk_adapt_cast_x(BITSELECT,54)
    dupName_22_ip_dsdk_adapt_cast_x_b <= dupName_24_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_23_ip_dsdk_adapt_bitselect_x(BITSELECT,55)
    dupName_23_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(1023 downto 960);

    -- dupName_21_ip_dsdk_adapt_cast_x(BITSELECT,52)
    dupName_21_ip_dsdk_adapt_cast_x_b <= dupName_23_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_22_ip_dsdk_adapt_bitselect_x(BITSELECT,53)
    dupName_22_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(959 downto 896);

    -- dupName_20_ip_dsdk_adapt_cast_x(BITSELECT,50)
    dupName_20_ip_dsdk_adapt_cast_x_b <= dupName_22_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_21_ip_dsdk_adapt_bitselect_x(BITSELECT,51)
    dupName_21_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(895 downto 832);

    -- dupName_19_ip_dsdk_adapt_cast_x(BITSELECT,48)
    dupName_19_ip_dsdk_adapt_cast_x_b <= dupName_21_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_20_ip_dsdk_adapt_bitselect_x(BITSELECT,49)
    dupName_20_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(831 downto 768);

    -- dupName_18_ip_dsdk_adapt_cast_x(BITSELECT,46)
    dupName_18_ip_dsdk_adapt_cast_x_b <= dupName_20_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_19_ip_dsdk_adapt_bitselect_x(BITSELECT,47)
    dupName_19_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(767 downto 704);

    -- dupName_17_ip_dsdk_adapt_cast_x(BITSELECT,44)
    dupName_17_ip_dsdk_adapt_cast_x_b <= dupName_19_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_18_ip_dsdk_adapt_bitselect_x(BITSELECT,45)
    dupName_18_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(703 downto 640);

    -- dupName_16_ip_dsdk_adapt_cast_x(BITSELECT,42)
    dupName_16_ip_dsdk_adapt_cast_x_b <= dupName_18_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_17_ip_dsdk_adapt_bitselect_x(BITSELECT,43)
    dupName_17_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(639 downto 576);

    -- dupName_15_ip_dsdk_adapt_cast_x(BITSELECT,40)
    dupName_15_ip_dsdk_adapt_cast_x_b <= dupName_17_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_16_ip_dsdk_adapt_bitselect_x(BITSELECT,41)
    dupName_16_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(543 downto 512);

    -- dupName_14_ip_dsdk_adapt_cast_x(BITSELECT,38)
    dupName_14_ip_dsdk_adapt_cast_x_b <= dupName_16_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_15_ip_dsdk_adapt_bitselect_x(BITSELECT,39)
    dupName_15_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(511 downto 480);

    -- dupName_13_ip_dsdk_adapt_cast_x(BITSELECT,36)
    dupName_13_ip_dsdk_adapt_cast_x_b <= dupName_15_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_14_ip_dsdk_adapt_bitselect_x(BITSELECT,37)
    dupName_14_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(479 downto 448);

    -- dupName_12_ip_dsdk_adapt_cast_x(BITSELECT,34)
    dupName_12_ip_dsdk_adapt_cast_x_b <= dupName_14_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_13_ip_dsdk_adapt_bitselect_x(BITSELECT,35)
    dupName_13_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(447 downto 416);

    -- dupName_11_ip_dsdk_adapt_cast_x(BITSELECT,32)
    dupName_11_ip_dsdk_adapt_cast_x_b <= dupName_13_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_12_ip_dsdk_adapt_bitselect_x(BITSELECT,33)
    dupName_12_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(415 downto 384);

    -- dupName_10_ip_dsdk_adapt_cast_x(BITSELECT,30)
    dupName_10_ip_dsdk_adapt_cast_x_b <= dupName_12_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_11_ip_dsdk_adapt_bitselect_x(BITSELECT,31)
    dupName_11_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(383 downto 352);

    -- dupName_9_ip_dsdk_adapt_cast_x(BITSELECT,28)
    dupName_9_ip_dsdk_adapt_cast_x_b <= dupName_11_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_10_ip_dsdk_adapt_bitselect_x(BITSELECT,29)
    dupName_10_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(351 downto 320);

    -- dupName_8_ip_dsdk_adapt_cast_x(BITSELECT,26)
    dupName_8_ip_dsdk_adapt_cast_x_b <= dupName_10_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_9_ip_dsdk_adapt_bitselect_x(BITSELECT,27)
    dupName_9_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(319 downto 288);

    -- dupName_7_ip_dsdk_adapt_cast_x(BITSELECT,24)
    dupName_7_ip_dsdk_adapt_cast_x_b <= dupName_9_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_8_ip_dsdk_adapt_bitselect_x(BITSELECT,25)
    dupName_8_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(287 downto 256);

    -- dupName_6_ip_dsdk_adapt_cast_x(BITSELECT,22)
    dupName_6_ip_dsdk_adapt_cast_x_b <= dupName_8_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_7_ip_dsdk_adapt_bitselect_x(BITSELECT,23)
    dupName_7_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(255 downto 224);

    -- dupName_5_ip_dsdk_adapt_cast_x(BITSELECT,20)
    dupName_5_ip_dsdk_adapt_cast_x_b <= dupName_7_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_6_ip_dsdk_adapt_bitselect_x(BITSELECT,21)
    dupName_6_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(223 downto 192);

    -- dupName_4_ip_dsdk_adapt_cast_x(BITSELECT,18)
    dupName_4_ip_dsdk_adapt_cast_x_b <= dupName_6_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_5_ip_dsdk_adapt_bitselect_x(BITSELECT,19)
    dupName_5_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(191 downto 160);

    -- dupName_3_ip_dsdk_adapt_cast_x(BITSELECT,16)
    dupName_3_ip_dsdk_adapt_cast_x_b <= dupName_5_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_4_ip_dsdk_adapt_bitselect_x(BITSELECT,17)
    dupName_4_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(159 downto 128);

    -- dupName_2_ip_dsdk_adapt_cast_x(BITSELECT,14)
    dupName_2_ip_dsdk_adapt_cast_x_b <= dupName_4_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_3_ip_dsdk_adapt_bitselect_x(BITSELECT,15)
    dupName_3_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(127 downto 96);

    -- dupName_1_ip_dsdk_adapt_cast_x(BITSELECT,12)
    dupName_1_ip_dsdk_adapt_cast_x_b <= dupName_3_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_2_ip_dsdk_adapt_bitselect_x(BITSELECT,13)
    dupName_2_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(95 downto 64);

    -- dupName_0_ip_dsdk_adapt_cast_x(BITSELECT,8)
    dupName_0_ip_dsdk_adapt_cast_x_b <= dupName_2_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_1_ip_dsdk_adapt_bitselect_x(BITSELECT,11)
    dupName_1_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(63 downto 32);

    -- ip_dsdk_adapt_cast(BITSELECT,88)
    ip_dsdk_adapt_cast_b <= dupName_1_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_0_ip_dsdk_adapt_bitselect_x(BITSELECT,7)
    dupName_0_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(13 downto 8);

    -- dupName_0_adapt_scalar_trunc_x(ROUND,4)
    dupName_0_adapt_scalar_trunc_x_in <= dupName_0_ip_dsdk_adapt_bitselect_x_b;
    dupName_0_adapt_scalar_trunc_x_q <= dupName_0_adapt_scalar_trunc_x_in(5 downto 0);

    -- ip_dsdk_adapt_bitselect(BITSELECT,87)
    ip_dsdk_adapt_bitselect_b <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_data_out(0 downto 0);

    -- adapt_scalar_trunc(ROUND,78)
    adapt_scalar_trunc_in <= ip_dsdk_adapt_bitselect_b;
    adapt_scalar_trunc_q <= adapt_scalar_trunc_in(0 downto 0);

    -- dupName_0_sync_out_aunroll_x(GPOUT,3)@20000003
    out_data_out_0 <= adapt_scalar_trunc_q;
    out_data_out_1 <= dupName_0_adapt_scalar_trunc_x_q;
    out_data_out_2 <= ip_dsdk_adapt_cast_b;
    out_data_out_3 <= dupName_0_ip_dsdk_adapt_cast_x_b;
    out_data_out_4 <= dupName_1_ip_dsdk_adapt_cast_x_b;
    out_data_out_5 <= dupName_2_ip_dsdk_adapt_cast_x_b;
    out_data_out_6 <= dupName_3_ip_dsdk_adapt_cast_x_b;
    out_data_out_7 <= dupName_4_ip_dsdk_adapt_cast_x_b;
    out_data_out_8 <= dupName_5_ip_dsdk_adapt_cast_x_b;
    out_data_out_9 <= dupName_6_ip_dsdk_adapt_cast_x_b;
    out_data_out_10 <= dupName_7_ip_dsdk_adapt_cast_x_b;
    out_data_out_11 <= dupName_8_ip_dsdk_adapt_cast_x_b;
    out_data_out_12 <= dupName_9_ip_dsdk_adapt_cast_x_b;
    out_data_out_13 <= dupName_10_ip_dsdk_adapt_cast_x_b;
    out_data_out_14 <= dupName_11_ip_dsdk_adapt_cast_x_b;
    out_data_out_15 <= dupName_12_ip_dsdk_adapt_cast_x_b;
    out_data_out_16 <= dupName_13_ip_dsdk_adapt_cast_x_b;
    out_data_out_17 <= dupName_14_ip_dsdk_adapt_cast_x_b;
    out_data_out_18 <= dupName_15_ip_dsdk_adapt_cast_x_b;
    out_data_out_19 <= dupName_16_ip_dsdk_adapt_cast_x_b;
    out_data_out_20 <= dupName_17_ip_dsdk_adapt_cast_x_b;
    out_data_out_21 <= dupName_18_ip_dsdk_adapt_cast_x_b;
    out_data_out_22 <= dupName_19_ip_dsdk_adapt_cast_x_b;
    out_data_out_23 <= dupName_20_ip_dsdk_adapt_cast_x_b;
    out_data_out_24 <= dupName_21_ip_dsdk_adapt_cast_x_b;
    out_data_out_25 <= dupName_22_ip_dsdk_adapt_cast_x_b;
    out_data_out_26 <= dupName_23_ip_dsdk_adapt_cast_x_b;
    out_data_out_27 <= dupName_24_ip_dsdk_adapt_cast_x_b;
    out_data_out_28 <= dupName_25_ip_dsdk_adapt_cast_x_b;
    out_data_out_29 <= dupName_26_ip_dsdk_adapt_cast_x_b;
    out_data_out_30 <= dupName_27_ip_dsdk_adapt_cast_x_b;
    out_data_out_31 <= dupName_28_ip_dsdk_adapt_cast_x_b;
    out_data_out_32 <= dupName_29_ip_dsdk_adapt_cast_x_b;
    out_data_out_33 <= dupName_30_ip_dsdk_adapt_cast_x_b;
    out_data_out_34 <= dupName_31_ip_dsdk_adapt_cast_x_b;
    out_data_out_35 <= dupName_32_ip_dsdk_adapt_cast_x_b;
    out_data_out_36 <= dupName_1_adapt_scalar_trunc_x_q;
    out_valid_out <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_valid_out;

    -- sync_out(GPOUT,90)@20000000
    out_stall_out <= i_acl_sfc_exit_c0_for_cond_i3_outer_ethash_search_c0_exit152_ethash_search592_stall_out;

END normal;
