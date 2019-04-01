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

-- VHDL created from i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo
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

entity i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo is
    port (
        in_data_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_2 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_3 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_4 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_5 : in std_logic_vector(5 downto 0);  -- ufix6
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
        in_data_in_18 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_19 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_20 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_21 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_22 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_23 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_24 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_25 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_26 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_27 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_28 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_29 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_30 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_31 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_32 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_33 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_34 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_35 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_36 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_37 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_38 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_39 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_40 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_41 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_42 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_43 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_44 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_45 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_46 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_47 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_48 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_49 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_50 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_51 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_52 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_2 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_3 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_4 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_5 : out std_logic_vector(5 downto 0);  -- ufix6
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
        out_data_out_18 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_19 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_20 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_21 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_22 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_23 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_24 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_25 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_26 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_27 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_28 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_29 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_30 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_31 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_32 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_33 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_34 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_35 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_36 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_37 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_38 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_39 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_40 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_41 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_42 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_43 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_44 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_45 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_46 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_47 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_48 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_49 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_50 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_51 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_52 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo;

architecture normal of i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search583_data_fifo is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component acl_data_fifo is
        generic (
            DEPTH : INTEGER;
            ALLOW_FULL_WRITE : INTEGER := 1;
            DATA_WIDTH : INTEGER := 2496;
            IMPL : STRING := "ram"
        );
        port (
            data_in : in std_logic_vector(2495 downto 0);
            stall_in : in std_logic;
            valid_in : in std_logic;
            data_out : out std_logic_vector(2495 downto 0);
            stall_out : out std_logic;
            valid_out : out std_logic;
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal dupName_0_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_c_i24_0gr_x_q : STD_LOGIC_VECTOR (23 downto 0);
    signal dupName_0_c_i7_0gr_x_q : STD_LOGIC_VECTOR (6 downto 0);
    signal dupName_0_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_0_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_1_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (5 downto 0);
    signal dupName_1_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (5 downto 0);
    signal dupName_1_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_1_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_1_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_2_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_2_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_2_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_2_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_2_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_3_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_3_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_4_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (5 downto 0);
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
    signal dupName_15_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_16_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_16_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_17_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_17_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_18_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_18_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_19_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_19_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_20_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_20_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_21_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_21_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_22_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_22_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_23_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_23_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_24_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_24_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_25_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_25_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_26_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_26_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_27_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_27_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_28_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_28_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_29_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_29_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_30_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_30_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_31_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_31_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_32_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_32_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_33_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_33_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_34_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_34_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_35_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_35_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_36_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_36_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_37_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_37_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_38_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_38_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_39_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_39_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_40_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_40_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_41_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_41_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_42_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_42_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_43_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_43_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_44_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_44_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_45_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_45_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_46_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_46_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_47_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_47_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_48_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_49_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_50_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_51_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal adapt_scalar_trunc_in : STD_LOGIC_VECTOR (0 downto 0);
    signal adapt_scalar_trunc_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c_i2_0gr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i48_0gr_q : STD_LOGIC_VECTOR (47 downto 0);
    signal dsdk_ip_adapt_bitjoin_q : STD_LOGIC_VECTOR (2495 downto 0);
    signal element_extension_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_in : STD_LOGIC_VECTOR (2495 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_stall_in_bitsignaltemp : std_logic;
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_valid_in_bitsignaltemp : std_logic;
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out : STD_LOGIC_VECTOR (2495 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_stall_out_bitsignaltemp : std_logic;
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_valid_out_bitsignaltemp : std_logic;
    signal ip_dsdk_adapt_bitselect_b : STD_LOGIC_VECTOR (0 downto 0);
    signal ip_dsdk_adapt_cast_b : STD_LOGIC_VECTOR (63 downto 0);

begin


    -- dupName_0_c_i7_0gr_x(CONSTANT,6)
    dupName_0_c_i7_0gr_x_q <= "0000000";

    -- dupName_2_element_extension_x(BITJOIN,16)
    dupName_2_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_52;

    -- c_i32_0gr(CONSTANT,116)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- dupName_0_c_i24_0gr_x(CONSTANT,5)
    dupName_0_c_i24_0gr_x_q <= "000000000000000000000000";

    -- c_i2_0gr(CONSTANT,115)
    c_i2_0gr_q <= "00";

    -- dupName_1_element_extension_x(BITJOIN,12)
    dupName_1_element_extension_x_q <= c_i2_0gr_q & in_data_in_5;

    -- c_i48_0gr(CONSTANT,117)
    c_i48_0gr_q <= "000000000000000000000000000000000000000000000000";

    -- dupName_0_element_extension_x(BITJOIN,7)
    dupName_0_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_1;

    -- element_extension(BITJOIN,120)
    element_extension_q <= dupName_0_c_i7_0gr_x_q & in_data_in_0;

    -- dsdk_ip_adapt_bitjoin(BITJOIN,119)
    dsdk_ip_adapt_bitjoin_q <= dupName_0_c_i24_0gr_x_q & dupName_2_element_extension_x_q & in_data_in_51 & in_data_in_50 & in_data_in_49 & in_data_in_48 & in_data_in_47 & in_data_in_46 & in_data_in_45 & in_data_in_44 & in_data_in_43 & in_data_in_42 & in_data_in_41 & in_data_in_40 & in_data_in_39 & in_data_in_38 & in_data_in_37 & in_data_in_36 & in_data_in_35 & in_data_in_34 & in_data_in_33 & in_data_in_32 & in_data_in_31 & in_data_in_30 & c_i32_0gr_q & in_data_in_29 & in_data_in_28 & in_data_in_27 & in_data_in_26 & in_data_in_25 & in_data_in_24 & in_data_in_23 & in_data_in_22 & in_data_in_21 & in_data_in_20 & in_data_in_19 & in_data_in_18 & in_data_in_17 & in_data_in_16 & in_data_in_15 & in_data_in_14 & in_data_in_13 & in_data_in_12 & in_data_in_11 & in_data_in_10 & in_data_in_9 & in_data_in_8 & in_data_in_7 & in_data_in_6 & dupName_0_c_i24_0gr_x_q & dupName_1_element_extension_x_q & in_data_in_4 & in_data_in_3 & in_data_in_2 & c_i48_0gr_q & dupName_0_element_extension_x_q & element_extension_q;

    -- i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584(EXTIFACE,121)
    i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_in <= dsdk_ip_adapt_bitjoin_q;
    i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_stall_in <= in_stall_in;
    i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_valid_in <= in_valid_in;
    i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_stall_in_bitsignaltemp <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_stall_in(0);
    i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_valid_in_bitsignaltemp <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_valid_in(0);
    i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_stall_out(0) <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_stall_out_bitsignaltemp;
    i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_valid_out(0) <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_valid_out_bitsignaltemp;
    thei_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584 : acl_data_fifo
    GENERIC MAP (
        DEPTH => 8,
        ALLOW_FULL_WRITE => 1,
        DATA_WIDTH => 2496,
        IMPL => "ram"
    )
    PORT MAP (
        data_in => dsdk_ip_adapt_bitjoin_q,
        stall_in => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_stall_in_bitsignaltemp,
        valid_in => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_valid_in_bitsignaltemp,
        data_out => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out,
        stall_out => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_stall_out_bitsignaltemp,
        valid_out => i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_valid_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- dupName_51_ip_dsdk_adapt_bitselect_x(BITSELECT,112)
    dupName_51_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(2464 downto 2464);

    -- dupName_2_adapt_scalar_trunc_x(ROUND,15)
    dupName_2_adapt_scalar_trunc_x_in <= dupName_51_ip_dsdk_adapt_bitselect_x_b;
    dupName_2_adapt_scalar_trunc_x_q <= dupName_2_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_50_ip_dsdk_adapt_bitselect_x(BITSELECT,111)
    dupName_50_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(2463 downto 2432);

    -- dupName_47_ip_dsdk_adapt_cast_x(BITSELECT,108)
    dupName_47_ip_dsdk_adapt_cast_x_b <= dupName_50_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_49_ip_dsdk_adapt_bitselect_x(BITSELECT,110)
    dupName_49_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(2431 downto 2368);

    -- dupName_46_ip_dsdk_adapt_cast_x(BITSELECT,106)
    dupName_46_ip_dsdk_adapt_cast_x_b <= dupName_49_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_48_ip_dsdk_adapt_bitselect_x(BITSELECT,109)
    dupName_48_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(2367 downto 2304);

    -- dupName_45_ip_dsdk_adapt_cast_x(BITSELECT,104)
    dupName_45_ip_dsdk_adapt_cast_x_b <= dupName_48_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_47_ip_dsdk_adapt_bitselect_x(BITSELECT,107)
    dupName_47_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(2303 downto 2240);

    -- dupName_44_ip_dsdk_adapt_cast_x(BITSELECT,102)
    dupName_44_ip_dsdk_adapt_cast_x_b <= dupName_47_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_46_ip_dsdk_adapt_bitselect_x(BITSELECT,105)
    dupName_46_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(2239 downto 2176);

    -- dupName_43_ip_dsdk_adapt_cast_x(BITSELECT,100)
    dupName_43_ip_dsdk_adapt_cast_x_b <= dupName_46_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_45_ip_dsdk_adapt_bitselect_x(BITSELECT,103)
    dupName_45_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(2175 downto 2112);

    -- dupName_42_ip_dsdk_adapt_cast_x(BITSELECT,98)
    dupName_42_ip_dsdk_adapt_cast_x_b <= dupName_45_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_44_ip_dsdk_adapt_bitselect_x(BITSELECT,101)
    dupName_44_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(2111 downto 2048);

    -- dupName_41_ip_dsdk_adapt_cast_x(BITSELECT,96)
    dupName_41_ip_dsdk_adapt_cast_x_b <= dupName_44_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_43_ip_dsdk_adapt_bitselect_x(BITSELECT,99)
    dupName_43_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(2047 downto 1984);

    -- dupName_40_ip_dsdk_adapt_cast_x(BITSELECT,94)
    dupName_40_ip_dsdk_adapt_cast_x_b <= dupName_43_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_42_ip_dsdk_adapt_bitselect_x(BITSELECT,97)
    dupName_42_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(1983 downto 1920);

    -- dupName_39_ip_dsdk_adapt_cast_x(BITSELECT,92)
    dupName_39_ip_dsdk_adapt_cast_x_b <= dupName_42_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_41_ip_dsdk_adapt_bitselect_x(BITSELECT,95)
    dupName_41_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(1919 downto 1856);

    -- dupName_38_ip_dsdk_adapt_cast_x(BITSELECT,90)
    dupName_38_ip_dsdk_adapt_cast_x_b <= dupName_41_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_40_ip_dsdk_adapt_bitselect_x(BITSELECT,93)
    dupName_40_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(1855 downto 1792);

    -- dupName_37_ip_dsdk_adapt_cast_x(BITSELECT,88)
    dupName_37_ip_dsdk_adapt_cast_x_b <= dupName_40_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_39_ip_dsdk_adapt_bitselect_x(BITSELECT,91)
    dupName_39_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(1791 downto 1728);

    -- dupName_36_ip_dsdk_adapt_cast_x(BITSELECT,86)
    dupName_36_ip_dsdk_adapt_cast_x_b <= dupName_39_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_38_ip_dsdk_adapt_bitselect_x(BITSELECT,89)
    dupName_38_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(1727 downto 1664);

    -- dupName_35_ip_dsdk_adapt_cast_x(BITSELECT,84)
    dupName_35_ip_dsdk_adapt_cast_x_b <= dupName_38_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_37_ip_dsdk_adapt_bitselect_x(BITSELECT,87)
    dupName_37_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(1663 downto 1600);

    -- dupName_34_ip_dsdk_adapt_cast_x(BITSELECT,82)
    dupName_34_ip_dsdk_adapt_cast_x_b <= dupName_37_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_36_ip_dsdk_adapt_bitselect_x(BITSELECT,85)
    dupName_36_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(1599 downto 1536);

    -- dupName_33_ip_dsdk_adapt_cast_x(BITSELECT,80)
    dupName_33_ip_dsdk_adapt_cast_x_b <= dupName_36_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_35_ip_dsdk_adapt_bitselect_x(BITSELECT,83)
    dupName_35_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(1535 downto 1472);

    -- dupName_32_ip_dsdk_adapt_cast_x(BITSELECT,78)
    dupName_32_ip_dsdk_adapt_cast_x_b <= dupName_35_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_34_ip_dsdk_adapt_bitselect_x(BITSELECT,81)
    dupName_34_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(1471 downto 1408);

    -- dupName_31_ip_dsdk_adapt_cast_x(BITSELECT,76)
    dupName_31_ip_dsdk_adapt_cast_x_b <= dupName_34_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_33_ip_dsdk_adapt_bitselect_x(BITSELECT,79)
    dupName_33_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(1407 downto 1344);

    -- dupName_30_ip_dsdk_adapt_cast_x(BITSELECT,74)
    dupName_30_ip_dsdk_adapt_cast_x_b <= dupName_33_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_32_ip_dsdk_adapt_bitselect_x(BITSELECT,77)
    dupName_32_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(1343 downto 1280);

    -- dupName_29_ip_dsdk_adapt_cast_x(BITSELECT,72)
    dupName_29_ip_dsdk_adapt_cast_x_b <= dupName_32_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_31_ip_dsdk_adapt_bitselect_x(BITSELECT,75)
    dupName_31_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(1279 downto 1216);

    -- dupName_28_ip_dsdk_adapt_cast_x(BITSELECT,70)
    dupName_28_ip_dsdk_adapt_cast_x_b <= dupName_31_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_30_ip_dsdk_adapt_bitselect_x(BITSELECT,73)
    dupName_30_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(1215 downto 1152);

    -- dupName_27_ip_dsdk_adapt_cast_x(BITSELECT,68)
    dupName_27_ip_dsdk_adapt_cast_x_b <= dupName_30_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_29_ip_dsdk_adapt_bitselect_x(BITSELECT,71)
    dupName_29_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(1151 downto 1088);

    -- dupName_26_ip_dsdk_adapt_cast_x(BITSELECT,66)
    dupName_26_ip_dsdk_adapt_cast_x_b <= dupName_29_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_28_ip_dsdk_adapt_bitselect_x(BITSELECT,69)
    dupName_28_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(1055 downto 1024);

    -- dupName_25_ip_dsdk_adapt_cast_x(BITSELECT,64)
    dupName_25_ip_dsdk_adapt_cast_x_b <= dupName_28_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_27_ip_dsdk_adapt_bitselect_x(BITSELECT,67)
    dupName_27_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(1023 downto 992);

    -- dupName_24_ip_dsdk_adapt_cast_x(BITSELECT,62)
    dupName_24_ip_dsdk_adapt_cast_x_b <= dupName_27_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_26_ip_dsdk_adapt_bitselect_x(BITSELECT,65)
    dupName_26_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(991 downto 960);

    -- dupName_23_ip_dsdk_adapt_cast_x(BITSELECT,60)
    dupName_23_ip_dsdk_adapt_cast_x_b <= dupName_26_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_25_ip_dsdk_adapt_bitselect_x(BITSELECT,63)
    dupName_25_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(959 downto 928);

    -- dupName_22_ip_dsdk_adapt_cast_x(BITSELECT,58)
    dupName_22_ip_dsdk_adapt_cast_x_b <= dupName_25_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_24_ip_dsdk_adapt_bitselect_x(BITSELECT,61)
    dupName_24_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(927 downto 896);

    -- dupName_21_ip_dsdk_adapt_cast_x(BITSELECT,56)
    dupName_21_ip_dsdk_adapt_cast_x_b <= dupName_24_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_23_ip_dsdk_adapt_bitselect_x(BITSELECT,59)
    dupName_23_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(895 downto 864);

    -- dupName_20_ip_dsdk_adapt_cast_x(BITSELECT,54)
    dupName_20_ip_dsdk_adapt_cast_x_b <= dupName_23_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_22_ip_dsdk_adapt_bitselect_x(BITSELECT,57)
    dupName_22_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(863 downto 832);

    -- dupName_19_ip_dsdk_adapt_cast_x(BITSELECT,52)
    dupName_19_ip_dsdk_adapt_cast_x_b <= dupName_22_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_21_ip_dsdk_adapt_bitselect_x(BITSELECT,55)
    dupName_21_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(831 downto 800);

    -- dupName_18_ip_dsdk_adapt_cast_x(BITSELECT,50)
    dupName_18_ip_dsdk_adapt_cast_x_b <= dupName_21_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_20_ip_dsdk_adapt_bitselect_x(BITSELECT,53)
    dupName_20_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(799 downto 768);

    -- dupName_17_ip_dsdk_adapt_cast_x(BITSELECT,48)
    dupName_17_ip_dsdk_adapt_cast_x_b <= dupName_20_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_19_ip_dsdk_adapt_bitselect_x(BITSELECT,51)
    dupName_19_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(767 downto 736);

    -- dupName_16_ip_dsdk_adapt_cast_x(BITSELECT,46)
    dupName_16_ip_dsdk_adapt_cast_x_b <= dupName_19_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_18_ip_dsdk_adapt_bitselect_x(BITSELECT,49)
    dupName_18_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(735 downto 704);

    -- dupName_15_ip_dsdk_adapt_cast_x(BITSELECT,44)
    dupName_15_ip_dsdk_adapt_cast_x_b <= dupName_18_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_17_ip_dsdk_adapt_bitselect_x(BITSELECT,47)
    dupName_17_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(703 downto 672);

    -- dupName_14_ip_dsdk_adapt_cast_x(BITSELECT,42)
    dupName_14_ip_dsdk_adapt_cast_x_b <= dupName_17_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_16_ip_dsdk_adapt_bitselect_x(BITSELECT,45)
    dupName_16_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(671 downto 640);

    -- dupName_13_ip_dsdk_adapt_cast_x(BITSELECT,40)
    dupName_13_ip_dsdk_adapt_cast_x_b <= dupName_16_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_15_ip_dsdk_adapt_bitselect_x(BITSELECT,43)
    dupName_15_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(639 downto 608);

    -- dupName_12_ip_dsdk_adapt_cast_x(BITSELECT,38)
    dupName_12_ip_dsdk_adapt_cast_x_b <= dupName_15_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_14_ip_dsdk_adapt_bitselect_x(BITSELECT,41)
    dupName_14_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(607 downto 576);

    -- dupName_11_ip_dsdk_adapt_cast_x(BITSELECT,36)
    dupName_11_ip_dsdk_adapt_cast_x_b <= dupName_14_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_13_ip_dsdk_adapt_bitselect_x(BITSELECT,39)
    dupName_13_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(575 downto 544);

    -- dupName_10_ip_dsdk_adapt_cast_x(BITSELECT,34)
    dupName_10_ip_dsdk_adapt_cast_x_b <= dupName_13_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_12_ip_dsdk_adapt_bitselect_x(BITSELECT,37)
    dupName_12_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(543 downto 512);

    -- dupName_9_ip_dsdk_adapt_cast_x(BITSELECT,32)
    dupName_9_ip_dsdk_adapt_cast_x_b <= dupName_12_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_11_ip_dsdk_adapt_bitselect_x(BITSELECT,35)
    dupName_11_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(511 downto 480);

    -- dupName_8_ip_dsdk_adapt_cast_x(BITSELECT,30)
    dupName_8_ip_dsdk_adapt_cast_x_b <= dupName_11_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_10_ip_dsdk_adapt_bitselect_x(BITSELECT,33)
    dupName_10_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(479 downto 448);

    -- dupName_7_ip_dsdk_adapt_cast_x(BITSELECT,28)
    dupName_7_ip_dsdk_adapt_cast_x_b <= dupName_10_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_9_ip_dsdk_adapt_bitselect_x(BITSELECT,31)
    dupName_9_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(447 downto 416);

    -- dupName_6_ip_dsdk_adapt_cast_x(BITSELECT,26)
    dupName_6_ip_dsdk_adapt_cast_x_b <= dupName_9_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_8_ip_dsdk_adapt_bitselect_x(BITSELECT,29)
    dupName_8_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(415 downto 384);

    -- dupName_5_ip_dsdk_adapt_cast_x(BITSELECT,24)
    dupName_5_ip_dsdk_adapt_cast_x_b <= dupName_8_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_7_ip_dsdk_adapt_bitselect_x(BITSELECT,27)
    dupName_7_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(383 downto 352);

    -- dupName_4_ip_dsdk_adapt_cast_x(BITSELECT,22)
    dupName_4_ip_dsdk_adapt_cast_x_b <= dupName_7_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_6_ip_dsdk_adapt_bitselect_x(BITSELECT,25)
    dupName_6_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(351 downto 320);

    -- dupName_3_ip_dsdk_adapt_cast_x(BITSELECT,20)
    dupName_3_ip_dsdk_adapt_cast_x_b <= dupName_6_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_5_ip_dsdk_adapt_bitselect_x(BITSELECT,23)
    dupName_5_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(319 downto 288);

    -- dupName_2_ip_dsdk_adapt_cast_x(BITSELECT,18)
    dupName_2_ip_dsdk_adapt_cast_x_b <= dupName_5_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_4_ip_dsdk_adapt_bitselect_x(BITSELECT,21)
    dupName_4_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(261 downto 256);

    -- dupName_1_adapt_scalar_trunc_x(ROUND,10)
    dupName_1_adapt_scalar_trunc_x_in <= dupName_4_ip_dsdk_adapt_bitselect_x_b;
    dupName_1_adapt_scalar_trunc_x_q <= dupName_1_adapt_scalar_trunc_x_in(5 downto 0);

    -- dupName_3_ip_dsdk_adapt_bitselect_x(BITSELECT,19)
    dupName_3_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(255 downto 192);

    -- dupName_1_ip_dsdk_adapt_cast_x(BITSELECT,14)
    dupName_1_ip_dsdk_adapt_cast_x_b <= dupName_3_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_2_ip_dsdk_adapt_bitselect_x(BITSELECT,17)
    dupName_2_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(191 downto 128);

    -- dupName_0_ip_dsdk_adapt_cast_x(BITSELECT,9)
    dupName_0_ip_dsdk_adapt_cast_x_b <= dupName_2_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_1_ip_dsdk_adapt_bitselect_x(BITSELECT,13)
    dupName_1_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(127 downto 64);

    -- ip_dsdk_adapt_cast(BITSELECT,123)
    ip_dsdk_adapt_cast_b <= dupName_1_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_0_ip_dsdk_adapt_bitselect_x(BITSELECT,8)
    dupName_0_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(8 downto 8);

    -- dupName_0_adapt_scalar_trunc_x(ROUND,4)
    dupName_0_adapt_scalar_trunc_x_in <= dupName_0_ip_dsdk_adapt_bitselect_x_b;
    dupName_0_adapt_scalar_trunc_x_q <= dupName_0_adapt_scalar_trunc_x_in(0 downto 0);

    -- ip_dsdk_adapt_bitselect(BITSELECT,122)
    ip_dsdk_adapt_bitselect_b <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_data_out(0 downto 0);

    -- adapt_scalar_trunc(ROUND,113)
    adapt_scalar_trunc_in <= ip_dsdk_adapt_bitselect_b;
    adapt_scalar_trunc_q <= adapt_scalar_trunc_in(0 downto 0);

    -- dupName_0_sync_out_aunroll_x(GPOUT,3)@20000003
    out_data_out_0 <= adapt_scalar_trunc_q;
    out_data_out_1 <= dupName_0_adapt_scalar_trunc_x_q;
    out_data_out_2 <= ip_dsdk_adapt_cast_b;
    out_data_out_3 <= dupName_0_ip_dsdk_adapt_cast_x_b;
    out_data_out_4 <= dupName_1_ip_dsdk_adapt_cast_x_b;
    out_data_out_5 <= dupName_1_adapt_scalar_trunc_x_q;
    out_data_out_6 <= dupName_2_ip_dsdk_adapt_cast_x_b;
    out_data_out_7 <= dupName_3_ip_dsdk_adapt_cast_x_b;
    out_data_out_8 <= dupName_4_ip_dsdk_adapt_cast_x_b;
    out_data_out_9 <= dupName_5_ip_dsdk_adapt_cast_x_b;
    out_data_out_10 <= dupName_6_ip_dsdk_adapt_cast_x_b;
    out_data_out_11 <= dupName_7_ip_dsdk_adapt_cast_x_b;
    out_data_out_12 <= dupName_8_ip_dsdk_adapt_cast_x_b;
    out_data_out_13 <= dupName_9_ip_dsdk_adapt_cast_x_b;
    out_data_out_14 <= dupName_10_ip_dsdk_adapt_cast_x_b;
    out_data_out_15 <= dupName_11_ip_dsdk_adapt_cast_x_b;
    out_data_out_16 <= dupName_12_ip_dsdk_adapt_cast_x_b;
    out_data_out_17 <= dupName_13_ip_dsdk_adapt_cast_x_b;
    out_data_out_18 <= dupName_14_ip_dsdk_adapt_cast_x_b;
    out_data_out_19 <= dupName_15_ip_dsdk_adapt_cast_x_b;
    out_data_out_20 <= dupName_16_ip_dsdk_adapt_cast_x_b;
    out_data_out_21 <= dupName_17_ip_dsdk_adapt_cast_x_b;
    out_data_out_22 <= dupName_18_ip_dsdk_adapt_cast_x_b;
    out_data_out_23 <= dupName_19_ip_dsdk_adapt_cast_x_b;
    out_data_out_24 <= dupName_20_ip_dsdk_adapt_cast_x_b;
    out_data_out_25 <= dupName_21_ip_dsdk_adapt_cast_x_b;
    out_data_out_26 <= dupName_22_ip_dsdk_adapt_cast_x_b;
    out_data_out_27 <= dupName_23_ip_dsdk_adapt_cast_x_b;
    out_data_out_28 <= dupName_24_ip_dsdk_adapt_cast_x_b;
    out_data_out_29 <= dupName_25_ip_dsdk_adapt_cast_x_b;
    out_data_out_30 <= dupName_26_ip_dsdk_adapt_cast_x_b;
    out_data_out_31 <= dupName_27_ip_dsdk_adapt_cast_x_b;
    out_data_out_32 <= dupName_28_ip_dsdk_adapt_cast_x_b;
    out_data_out_33 <= dupName_29_ip_dsdk_adapt_cast_x_b;
    out_data_out_34 <= dupName_30_ip_dsdk_adapt_cast_x_b;
    out_data_out_35 <= dupName_31_ip_dsdk_adapt_cast_x_b;
    out_data_out_36 <= dupName_32_ip_dsdk_adapt_cast_x_b;
    out_data_out_37 <= dupName_33_ip_dsdk_adapt_cast_x_b;
    out_data_out_38 <= dupName_34_ip_dsdk_adapt_cast_x_b;
    out_data_out_39 <= dupName_35_ip_dsdk_adapt_cast_x_b;
    out_data_out_40 <= dupName_36_ip_dsdk_adapt_cast_x_b;
    out_data_out_41 <= dupName_37_ip_dsdk_adapt_cast_x_b;
    out_data_out_42 <= dupName_38_ip_dsdk_adapt_cast_x_b;
    out_data_out_43 <= dupName_39_ip_dsdk_adapt_cast_x_b;
    out_data_out_44 <= dupName_40_ip_dsdk_adapt_cast_x_b;
    out_data_out_45 <= dupName_41_ip_dsdk_adapt_cast_x_b;
    out_data_out_46 <= dupName_42_ip_dsdk_adapt_cast_x_b;
    out_data_out_47 <= dupName_43_ip_dsdk_adapt_cast_x_b;
    out_data_out_48 <= dupName_44_ip_dsdk_adapt_cast_x_b;
    out_data_out_49 <= dupName_45_ip_dsdk_adapt_cast_x_b;
    out_data_out_50 <= dupName_46_ip_dsdk_adapt_cast_x_b;
    out_data_out_51 <= dupName_47_ip_dsdk_adapt_cast_x_b;
    out_data_out_52 <= dupName_2_adapt_scalar_trunc_x_q;
    out_valid_out <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_valid_out;

    -- sync_out(GPOUT,125)@20000000
    out_stall_out <= i_acl_sfc_exit_c0_for_cond_i_outer_ethash_search_c0_exit_ethash_search584_stall_out;

END normal;
