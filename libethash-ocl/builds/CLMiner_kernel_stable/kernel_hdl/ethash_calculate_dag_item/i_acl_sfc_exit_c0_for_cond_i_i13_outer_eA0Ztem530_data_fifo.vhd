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

-- VHDL created from i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethaA0Zag_item530_data_fifo
-- VHDL created on Mon Apr  1 13:52:58 2019


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

entity i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethaA0Zag_item530_data_fifo is
    port (
        in_data_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_1 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_data_in_2 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_3 : in std_logic_vector(1663 downto 0);  -- ufix1664
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
        in_data_in_30 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_31 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_32 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_33 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_34 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_35 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_36 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_37 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_38 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_39 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_40 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_41 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_42 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_43 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_44 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_45 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_46 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_47 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_48 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_49 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_50 : in std_logic_vector(31 downto 0);  -- ufix32
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_1 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_data_out_2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_3 : out std_logic_vector(1663 downto 0);  -- ufix1664
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
        out_data_out_30 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_31 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_32 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_33 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_34 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_35 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_36 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_37 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_38 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_39 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_40 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_41 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_42 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_43 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_44 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_45 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_46 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_47 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_48 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_49 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_50 : out std_logic_vector(31 downto 0);  -- ufix32
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethaA0Zag_item530_data_fifo;

architecture normal of i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethaA0Zag_item530_data_fifo is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component acl_data_fifo is
        generic (
            DEPTH : INTEGER;
            ALLOW_FULL_WRITE : INTEGER := 1;
            DATA_WIDTH : INTEGER := 4992;
            IMPL : STRING := "ram"
        );
        port (
            data_in : in std_logic_vector(4991 downto 0);
            stall_in : in std_logic;
            valid_in : in std_logic;
            data_out : out std_logic_vector(4991 downto 0);
            stall_out : out std_logic;
            valid_out : out std_logic;
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal dupName_0_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_c_i56_0gr_x_q : STD_LOGIC_VECTOR (55 downto 0);
    signal dupName_0_c_i7_0gr_x_q : STD_LOGIC_VECTOR (6 downto 0);
    signal dupName_0_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_0_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (1663 downto 0);
    signal dupName_0_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (1663 downto 0);
    signal dupName_1_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_1_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_2_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (1663 downto 0);
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
    signal dupName_26_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_27_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_27_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_28_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_28_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_29_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_29_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_30_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_30_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_31_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_31_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_32_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_32_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_33_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_33_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_34_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_34_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_35_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_35_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_36_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_36_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_37_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_37_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_38_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_38_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_39_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_39_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_40_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_40_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_41_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_41_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_42_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_42_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_43_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_43_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_44_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_44_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_45_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_45_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_46_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_46_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_47_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_47_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_48_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_49_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal adapt_scalar_trunc_in : STD_LOGIC_VECTOR (0 downto 0);
    signal adapt_scalar_trunc_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal dsdk_ip_adapt_bitjoin_q : STD_LOGIC_VECTOR (4991 downto 0);
    signal element_extension_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_in : STD_LOGIC_VECTOR (4991 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_stall_in_bitsignaltemp : std_logic;
    signal i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_valid_in_bitsignaltemp : std_logic;
    signal i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out : STD_LOGIC_VECTOR (4991 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_stall_out_bitsignaltemp : std_logic;
    signal i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_valid_out_bitsignaltemp : std_logic;
    signal ip_dsdk_adapt_bitselect_b : STD_LOGIC_VECTOR (0 downto 0);
    signal ip_dsdk_adapt_cast_b : STD_LOGIC_VECTOR (1663 downto 0);

begin


    -- c_i32_0gr(CONSTANT,107)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- dupName_0_c_i7_0gr_x(CONSTANT,6)
    dupName_0_c_i7_0gr_x_q <= "0000000";

    -- dupName_0_element_extension_x(BITJOIN,7)
    dupName_0_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_2;

    -- dupName_0_c_i56_0gr_x(CONSTANT,5)
    dupName_0_c_i56_0gr_x_q <= "00000000000000000000000000000000000000000000000000000000";

    -- element_extension(BITJOIN,111)
    element_extension_q <= dupName_0_c_i7_0gr_x_q & in_data_in_0;

    -- dsdk_ip_adapt_bitjoin(BITJOIN,110)
    dsdk_ip_adapt_bitjoin_q <= c_i32_0gr_q & in_data_in_50 & in_data_in_49 & in_data_in_48 & in_data_in_47 & in_data_in_46 & in_data_in_45 & in_data_in_44 & in_data_in_43 & in_data_in_42 & in_data_in_41 & in_data_in_40 & in_data_in_39 & in_data_in_38 & in_data_in_37 & in_data_in_36 & in_data_in_35 & in_data_in_34 & in_data_in_33 & in_data_in_32 & in_data_in_31 & in_data_in_30 & in_data_in_29 & in_data_in_28 & in_data_in_27 & in_data_in_26 & in_data_in_25 & in_data_in_24 & in_data_in_23 & in_data_in_22 & in_data_in_21 & in_data_in_20 & in_data_in_19 & in_data_in_18 & in_data_in_17 & in_data_in_16 & in_data_in_15 & in_data_in_14 & in_data_in_13 & in_data_in_12 & in_data_in_11 & in_data_in_10 & in_data_in_9 & in_data_in_8 & in_data_in_7 & in_data_in_6 & in_data_in_5 & in_data_in_4 & in_data_in_3 & dupName_0_c_i56_0gr_x_q & dupName_0_element_extension_x_q & in_data_in_1 & dupName_0_c_i56_0gr_x_q & element_extension_q;

    -- i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531(EXTIFACE,112)
    i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_in <= dsdk_ip_adapt_bitjoin_q;
    i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_stall_in <= in_stall_in;
    i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_valid_in <= in_valid_in;
    i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_stall_in_bitsignaltemp <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_stall_in(0);
    i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_valid_in_bitsignaltemp <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_valid_in(0);
    i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_stall_out(0) <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_stall_out_bitsignaltemp;
    i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_valid_out(0) <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_valid_out_bitsignaltemp;
    thei_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531 : acl_data_fifo
    GENERIC MAP (
        DEPTH => 8,
        ALLOW_FULL_WRITE => 1,
        DATA_WIDTH => 4992,
        IMPL => "ram"
    )
    PORT MAP (
        data_in => dsdk_ip_adapt_bitjoin_q,
        stall_in => i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_stall_in_bitsignaltemp,
        valid_in => i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_valid_in_bitsignaltemp,
        data_out => i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out,
        stall_out => i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_stall_out_bitsignaltemp,
        valid_out => i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_valid_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- dupName_49_ip_dsdk_adapt_bitselect_x(BITSELECT,105)
    dupName_49_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(4959 downto 4928);

    -- dupName_47_ip_dsdk_adapt_cast_x(BITSELECT,103)
    dupName_47_ip_dsdk_adapt_cast_x_b <= dupName_49_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_48_ip_dsdk_adapt_bitselect_x(BITSELECT,104)
    dupName_48_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(4927 downto 4896);

    -- dupName_46_ip_dsdk_adapt_cast_x(BITSELECT,101)
    dupName_46_ip_dsdk_adapt_cast_x_b <= dupName_48_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_47_ip_dsdk_adapt_bitselect_x(BITSELECT,102)
    dupName_47_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(4895 downto 4864);

    -- dupName_45_ip_dsdk_adapt_cast_x(BITSELECT,99)
    dupName_45_ip_dsdk_adapt_cast_x_b <= dupName_47_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_46_ip_dsdk_adapt_bitselect_x(BITSELECT,100)
    dupName_46_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(4863 downto 4832);

    -- dupName_44_ip_dsdk_adapt_cast_x(BITSELECT,97)
    dupName_44_ip_dsdk_adapt_cast_x_b <= dupName_46_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_45_ip_dsdk_adapt_bitselect_x(BITSELECT,98)
    dupName_45_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(4831 downto 4800);

    -- dupName_43_ip_dsdk_adapt_cast_x(BITSELECT,95)
    dupName_43_ip_dsdk_adapt_cast_x_b <= dupName_45_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_44_ip_dsdk_adapt_bitselect_x(BITSELECT,96)
    dupName_44_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(4799 downto 4768);

    -- dupName_42_ip_dsdk_adapt_cast_x(BITSELECT,93)
    dupName_42_ip_dsdk_adapt_cast_x_b <= dupName_44_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_43_ip_dsdk_adapt_bitselect_x(BITSELECT,94)
    dupName_43_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(4767 downto 4736);

    -- dupName_41_ip_dsdk_adapt_cast_x(BITSELECT,91)
    dupName_41_ip_dsdk_adapt_cast_x_b <= dupName_43_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_42_ip_dsdk_adapt_bitselect_x(BITSELECT,92)
    dupName_42_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(4735 downto 4704);

    -- dupName_40_ip_dsdk_adapt_cast_x(BITSELECT,89)
    dupName_40_ip_dsdk_adapt_cast_x_b <= dupName_42_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_41_ip_dsdk_adapt_bitselect_x(BITSELECT,90)
    dupName_41_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(4703 downto 4672);

    -- dupName_39_ip_dsdk_adapt_cast_x(BITSELECT,87)
    dupName_39_ip_dsdk_adapt_cast_x_b <= dupName_41_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_40_ip_dsdk_adapt_bitselect_x(BITSELECT,88)
    dupName_40_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(4671 downto 4640);

    -- dupName_38_ip_dsdk_adapt_cast_x(BITSELECT,85)
    dupName_38_ip_dsdk_adapt_cast_x_b <= dupName_40_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_39_ip_dsdk_adapt_bitselect_x(BITSELECT,86)
    dupName_39_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(4639 downto 4608);

    -- dupName_37_ip_dsdk_adapt_cast_x(BITSELECT,83)
    dupName_37_ip_dsdk_adapt_cast_x_b <= dupName_39_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_38_ip_dsdk_adapt_bitselect_x(BITSELECT,84)
    dupName_38_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(4607 downto 4576);

    -- dupName_36_ip_dsdk_adapt_cast_x(BITSELECT,81)
    dupName_36_ip_dsdk_adapt_cast_x_b <= dupName_38_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_37_ip_dsdk_adapt_bitselect_x(BITSELECT,82)
    dupName_37_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(4575 downto 4544);

    -- dupName_35_ip_dsdk_adapt_cast_x(BITSELECT,79)
    dupName_35_ip_dsdk_adapt_cast_x_b <= dupName_37_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_36_ip_dsdk_adapt_bitselect_x(BITSELECT,80)
    dupName_36_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(4543 downto 4512);

    -- dupName_34_ip_dsdk_adapt_cast_x(BITSELECT,77)
    dupName_34_ip_dsdk_adapt_cast_x_b <= dupName_36_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_35_ip_dsdk_adapt_bitselect_x(BITSELECT,78)
    dupName_35_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(4511 downto 4480);

    -- dupName_33_ip_dsdk_adapt_cast_x(BITSELECT,75)
    dupName_33_ip_dsdk_adapt_cast_x_b <= dupName_35_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_34_ip_dsdk_adapt_bitselect_x(BITSELECT,76)
    dupName_34_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(4479 downto 4448);

    -- dupName_32_ip_dsdk_adapt_cast_x(BITSELECT,73)
    dupName_32_ip_dsdk_adapt_cast_x_b <= dupName_34_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_33_ip_dsdk_adapt_bitselect_x(BITSELECT,74)
    dupName_33_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(4447 downto 4416);

    -- dupName_31_ip_dsdk_adapt_cast_x(BITSELECT,71)
    dupName_31_ip_dsdk_adapt_cast_x_b <= dupName_33_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_32_ip_dsdk_adapt_bitselect_x(BITSELECT,72)
    dupName_32_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(4415 downto 4384);

    -- dupName_30_ip_dsdk_adapt_cast_x(BITSELECT,69)
    dupName_30_ip_dsdk_adapt_cast_x_b <= dupName_32_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_31_ip_dsdk_adapt_bitselect_x(BITSELECT,70)
    dupName_31_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(4383 downto 4352);

    -- dupName_29_ip_dsdk_adapt_cast_x(BITSELECT,67)
    dupName_29_ip_dsdk_adapt_cast_x_b <= dupName_31_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_30_ip_dsdk_adapt_bitselect_x(BITSELECT,68)
    dupName_30_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(4351 downto 4320);

    -- dupName_28_ip_dsdk_adapt_cast_x(BITSELECT,65)
    dupName_28_ip_dsdk_adapt_cast_x_b <= dupName_30_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_29_ip_dsdk_adapt_bitselect_x(BITSELECT,66)
    dupName_29_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(4319 downto 4288);

    -- dupName_27_ip_dsdk_adapt_cast_x(BITSELECT,63)
    dupName_27_ip_dsdk_adapt_cast_x_b <= dupName_29_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_28_ip_dsdk_adapt_bitselect_x(BITSELECT,64)
    dupName_28_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(4287 downto 4256);

    -- dupName_26_ip_dsdk_adapt_cast_x(BITSELECT,61)
    dupName_26_ip_dsdk_adapt_cast_x_b <= dupName_28_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_27_ip_dsdk_adapt_bitselect_x(BITSELECT,62)
    dupName_27_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(4255 downto 4224);

    -- dupName_25_ip_dsdk_adapt_cast_x(BITSELECT,59)
    dupName_25_ip_dsdk_adapt_cast_x_b <= dupName_27_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_26_ip_dsdk_adapt_bitselect_x(BITSELECT,60)
    dupName_26_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(4223 downto 4192);

    -- dupName_24_ip_dsdk_adapt_cast_x(BITSELECT,57)
    dupName_24_ip_dsdk_adapt_cast_x_b <= dupName_26_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_25_ip_dsdk_adapt_bitselect_x(BITSELECT,58)
    dupName_25_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(4191 downto 4160);

    -- dupName_23_ip_dsdk_adapt_cast_x(BITSELECT,55)
    dupName_23_ip_dsdk_adapt_cast_x_b <= dupName_25_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_24_ip_dsdk_adapt_bitselect_x(BITSELECT,56)
    dupName_24_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(4159 downto 4128);

    -- dupName_22_ip_dsdk_adapt_cast_x(BITSELECT,53)
    dupName_22_ip_dsdk_adapt_cast_x_b <= dupName_24_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_23_ip_dsdk_adapt_bitselect_x(BITSELECT,54)
    dupName_23_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(4127 downto 4096);

    -- dupName_21_ip_dsdk_adapt_cast_x(BITSELECT,51)
    dupName_21_ip_dsdk_adapt_cast_x_b <= dupName_23_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_22_ip_dsdk_adapt_bitselect_x(BITSELECT,52)
    dupName_22_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(4095 downto 4064);

    -- dupName_20_ip_dsdk_adapt_cast_x(BITSELECT,49)
    dupName_20_ip_dsdk_adapt_cast_x_b <= dupName_22_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_21_ip_dsdk_adapt_bitselect_x(BITSELECT,50)
    dupName_21_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(4063 downto 4032);

    -- dupName_19_ip_dsdk_adapt_cast_x(BITSELECT,47)
    dupName_19_ip_dsdk_adapt_cast_x_b <= dupName_21_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_20_ip_dsdk_adapt_bitselect_x(BITSELECT,48)
    dupName_20_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(4031 downto 4000);

    -- dupName_18_ip_dsdk_adapt_cast_x(BITSELECT,45)
    dupName_18_ip_dsdk_adapt_cast_x_b <= dupName_20_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_19_ip_dsdk_adapt_bitselect_x(BITSELECT,46)
    dupName_19_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(3999 downto 3968);

    -- dupName_17_ip_dsdk_adapt_cast_x(BITSELECT,43)
    dupName_17_ip_dsdk_adapt_cast_x_b <= dupName_19_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_18_ip_dsdk_adapt_bitselect_x(BITSELECT,44)
    dupName_18_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(3967 downto 3936);

    -- dupName_16_ip_dsdk_adapt_cast_x(BITSELECT,41)
    dupName_16_ip_dsdk_adapt_cast_x_b <= dupName_18_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_17_ip_dsdk_adapt_bitselect_x(BITSELECT,42)
    dupName_17_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(3935 downto 3904);

    -- dupName_15_ip_dsdk_adapt_cast_x(BITSELECT,39)
    dupName_15_ip_dsdk_adapt_cast_x_b <= dupName_17_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_16_ip_dsdk_adapt_bitselect_x(BITSELECT,40)
    dupName_16_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(3903 downto 3872);

    -- dupName_14_ip_dsdk_adapt_cast_x(BITSELECT,37)
    dupName_14_ip_dsdk_adapt_cast_x_b <= dupName_16_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_15_ip_dsdk_adapt_bitselect_x(BITSELECT,38)
    dupName_15_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(3871 downto 3840);

    -- dupName_13_ip_dsdk_adapt_cast_x(BITSELECT,35)
    dupName_13_ip_dsdk_adapt_cast_x_b <= dupName_15_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_14_ip_dsdk_adapt_bitselect_x(BITSELECT,36)
    dupName_14_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(3839 downto 3808);

    -- dupName_12_ip_dsdk_adapt_cast_x(BITSELECT,33)
    dupName_12_ip_dsdk_adapt_cast_x_b <= dupName_14_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_13_ip_dsdk_adapt_bitselect_x(BITSELECT,34)
    dupName_13_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(3807 downto 3776);

    -- dupName_11_ip_dsdk_adapt_cast_x(BITSELECT,31)
    dupName_11_ip_dsdk_adapt_cast_x_b <= dupName_13_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_12_ip_dsdk_adapt_bitselect_x(BITSELECT,32)
    dupName_12_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(3775 downto 3744);

    -- dupName_10_ip_dsdk_adapt_cast_x(BITSELECT,29)
    dupName_10_ip_dsdk_adapt_cast_x_b <= dupName_12_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_11_ip_dsdk_adapt_bitselect_x(BITSELECT,30)
    dupName_11_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(3743 downto 3712);

    -- dupName_9_ip_dsdk_adapt_cast_x(BITSELECT,27)
    dupName_9_ip_dsdk_adapt_cast_x_b <= dupName_11_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_10_ip_dsdk_adapt_bitselect_x(BITSELECT,28)
    dupName_10_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(3711 downto 3680);

    -- dupName_8_ip_dsdk_adapt_cast_x(BITSELECT,25)
    dupName_8_ip_dsdk_adapt_cast_x_b <= dupName_10_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_9_ip_dsdk_adapt_bitselect_x(BITSELECT,26)
    dupName_9_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(3679 downto 3648);

    -- dupName_7_ip_dsdk_adapt_cast_x(BITSELECT,23)
    dupName_7_ip_dsdk_adapt_cast_x_b <= dupName_9_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_8_ip_dsdk_adapt_bitselect_x(BITSELECT,24)
    dupName_8_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(3647 downto 3616);

    -- dupName_6_ip_dsdk_adapt_cast_x(BITSELECT,21)
    dupName_6_ip_dsdk_adapt_cast_x_b <= dupName_8_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_7_ip_dsdk_adapt_bitselect_x(BITSELECT,22)
    dupName_7_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(3615 downto 3584);

    -- dupName_5_ip_dsdk_adapt_cast_x(BITSELECT,19)
    dupName_5_ip_dsdk_adapt_cast_x_b <= dupName_7_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_6_ip_dsdk_adapt_bitselect_x(BITSELECT,20)
    dupName_6_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(3583 downto 3552);

    -- dupName_4_ip_dsdk_adapt_cast_x(BITSELECT,17)
    dupName_4_ip_dsdk_adapt_cast_x_b <= dupName_6_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_5_ip_dsdk_adapt_bitselect_x(BITSELECT,18)
    dupName_5_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(3551 downto 3520);

    -- dupName_3_ip_dsdk_adapt_cast_x(BITSELECT,15)
    dupName_3_ip_dsdk_adapt_cast_x_b <= dupName_5_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_4_ip_dsdk_adapt_bitselect_x(BITSELECT,16)
    dupName_4_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(3519 downto 3488);

    -- dupName_2_ip_dsdk_adapt_cast_x(BITSELECT,13)
    dupName_2_ip_dsdk_adapt_cast_x_b <= dupName_4_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_3_ip_dsdk_adapt_bitselect_x(BITSELECT,14)
    dupName_3_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(3487 downto 3456);

    -- dupName_1_ip_dsdk_adapt_cast_x(BITSELECT,11)
    dupName_1_ip_dsdk_adapt_cast_x_b <= dupName_3_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_2_ip_dsdk_adapt_bitselect_x(BITSELECT,12)
    dupName_2_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(3455 downto 1792);

    -- dupName_0_ip_dsdk_adapt_cast_x(BITSELECT,9)
    dupName_0_ip_dsdk_adapt_cast_x_b <= dupName_2_ip_dsdk_adapt_bitselect_x_b(1663 downto 0);

    -- dupName_1_ip_dsdk_adapt_bitselect_x(BITSELECT,10)
    dupName_1_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(1728 downto 1728);

    -- dupName_0_adapt_scalar_trunc_x(ROUND,4)
    dupName_0_adapt_scalar_trunc_x_in <= dupName_1_ip_dsdk_adapt_bitselect_x_b;
    dupName_0_adapt_scalar_trunc_x_q <= dupName_0_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_0_ip_dsdk_adapt_bitselect_x(BITSELECT,8)
    dupName_0_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(1727 downto 64);

    -- ip_dsdk_adapt_cast(BITSELECT,114)
    ip_dsdk_adapt_cast_b <= dupName_0_ip_dsdk_adapt_bitselect_x_b(1663 downto 0);

    -- ip_dsdk_adapt_bitselect(BITSELECT,113)
    ip_dsdk_adapt_bitselect_b <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_data_out(0 downto 0);

    -- adapt_scalar_trunc(ROUND,106)
    adapt_scalar_trunc_in <= ip_dsdk_adapt_bitselect_b;
    adapt_scalar_trunc_q <= adapt_scalar_trunc_in(0 downto 0);

    -- dupName_0_sync_out_aunroll_x(GPOUT,3)@20000003
    out_data_out_0 <= adapt_scalar_trunc_q;
    out_data_out_1 <= ip_dsdk_adapt_cast_b;
    out_data_out_2 <= dupName_0_adapt_scalar_trunc_x_q;
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
    out_data_out_36 <= dupName_33_ip_dsdk_adapt_cast_x_b;
    out_data_out_37 <= dupName_34_ip_dsdk_adapt_cast_x_b;
    out_data_out_38 <= dupName_35_ip_dsdk_adapt_cast_x_b;
    out_data_out_39 <= dupName_36_ip_dsdk_adapt_cast_x_b;
    out_data_out_40 <= dupName_37_ip_dsdk_adapt_cast_x_b;
    out_data_out_41 <= dupName_38_ip_dsdk_adapt_cast_x_b;
    out_data_out_42 <= dupName_39_ip_dsdk_adapt_cast_x_b;
    out_data_out_43 <= dupName_40_ip_dsdk_adapt_cast_x_b;
    out_data_out_44 <= dupName_41_ip_dsdk_adapt_cast_x_b;
    out_data_out_45 <= dupName_42_ip_dsdk_adapt_cast_x_b;
    out_data_out_46 <= dupName_43_ip_dsdk_adapt_cast_x_b;
    out_data_out_47 <= dupName_44_ip_dsdk_adapt_cast_x_b;
    out_data_out_48 <= dupName_45_ip_dsdk_adapt_cast_x_b;
    out_data_out_49 <= dupName_46_ip_dsdk_adapt_cast_x_b;
    out_data_out_50 <= dupName_47_ip_dsdk_adapt_cast_x_b;
    out_valid_out <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_valid_out;

    -- sync_out(GPOUT,116)@20000000
    out_stall_out <= i_acl_sfc_exit_c0_for_cond_i_i13_outer_ethash_calculate_dag_item_c0_exit169_ethash_calculate_dag_item531_stall_out;

END normal;
