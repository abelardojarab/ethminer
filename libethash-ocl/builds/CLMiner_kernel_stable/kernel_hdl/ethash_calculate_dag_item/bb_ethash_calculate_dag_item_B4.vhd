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

-- VHDL created from bb_ethash_calculate_dag_item_B4
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

entity bb_ethash_calculate_dag_item_B4 is
    port (
        in_c1_exit28_0_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit28_0_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_0_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_0_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_0_4 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_0_5 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_0_6 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_0_7 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_0_8 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_0_9 : in std_logic_vector(127 downto 0);  -- ufix128
        in_c1_exit28_0_10 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_0_11 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_0_12 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_0_13 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_0_14 : in std_logic_vector(127 downto 0);  -- ufix128
        in_c1_exit28_0_15 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_0_16 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_0_17 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_0_18 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_0_19 : in std_logic_vector(127 downto 0);  -- ufix128
        in_c1_exit28_0_20 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_acl_hw_wg_id40_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe11220_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe113_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe21325_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe1031_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe1132_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe129_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe1533_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe1634_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe2035_0 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_c1_exe230_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_g_dag : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_acl_01644 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_01646 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_01648 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_11645 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_11647 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_11649 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_hw_wg_id40 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe11220 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe113 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe21325 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe1031 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe1132 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe129 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe1533 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe1634 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe230 : out std_logic_vector(31 downto 0);  -- ufix32
        out_pms_cs1241_pms_vs_pms_vm_pms_d : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_ethash_calculate_dag_item_B4;

architecture normal of bb_ethash_calculate_dag_item_B4 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component ethash_calculate_dag_item_B4_merge is
        port (
            in_c1_exit28_0_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit28_0_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit28_0_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit28_0_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit28_0_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit28_0_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit28_0_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit28_0_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit28_0_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit28_0_9 : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_c1_exit28_0_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit28_0_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit28_0_12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit28_0_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit28_0_14 : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_c1_exit28_0_15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit28_0_16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit28_0_17 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit28_0_18 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit28_0_19 : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_c1_exit28_0_20 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_acl_hw_wg_id40_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe11220_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe113_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe21325_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe1031_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe1132_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe129_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe1533_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe1634_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe2035_0 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_c1_exe230_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit28_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit28_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit28_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit28_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit28_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit28_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit28_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit28_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit28_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit28_9 : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_c1_exit28_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit28_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit28_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit28_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit28_14 : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_c1_exit28_15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit28_16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit28_17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit28_18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit28_19 : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_c1_exit28_20 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_acl_hw_wg_id40 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe11220 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe113 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe21325 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe1031 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe1132 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe129 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe1533 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe1634 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe2035 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_c1_exe230 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_calculate_dag_item_B4_stall_region is
        port (
            in_c1_exit28_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit28_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit28_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit28_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit28_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit28_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit28_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit28_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit28_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit28_9 : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_c1_exit28_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit28_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit28_12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit28_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit28_14 : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_c1_exit28_15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit28_16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit28_17 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit28_18 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit28_19 : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_c1_exit28_20 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_acl_hw_wg_id40 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe11220 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe113 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe21325 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe1031 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe1132 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe129 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe1533 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe1634 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe2035 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_c1_exe230 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_01644 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_01646 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_01648 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_11645 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_11647 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_11649 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_hw_wg_id40 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe11220 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe113 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe21325 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe1031 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe1132 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe129 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe1533 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe1634 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe230 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pms_cs1241_pms_vs_pms_vm_pms_d : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component ethash_calculate_dag_item_B4_branch is
        port (
            in_acl_01644 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_01646 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_01648 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_11645 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_11647 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_11649 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_hw_wg_id40 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe11220 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe113 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe21325 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe1031 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe1132 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe129 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe1533 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe1634 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe230 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_pms_cs1241_pms_vs_pms_vm_pms_d : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_01644 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_01646 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_01648 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_11645 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_11647 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_11649 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_hw_wg_id40 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe11220 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe113 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe21325 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe1031 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe1132 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe129 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe1533 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe1634 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe230 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pms_cs1241_pms_vs_pms_vm_pms_d : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_9 : STD_LOGIC_VECTOR (127 downto 0);
    signal ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_14 : STD_LOGIC_VECTOR (127 downto 0);
    signal ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_19 : STD_LOGIC_VECTOR (127 downto 0);
    signal ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_20 : STD_LOGIC_VECTOR (1663 downto 0);
    signal ethash_calculate_dag_item_B4_merge_aunroll_x_out_acl_hw_wg_id40 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_merge_aunroll_x_out_c0_exe11220 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B4_merge_aunroll_x_out_c0_exe113 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_merge_aunroll_x_out_c0_exe21325 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exe1031 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exe1132 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exe129 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exe1533 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exe1634 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exe2035 : STD_LOGIC_VECTOR (1663 downto 0);
    signal ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exe230 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_merge_aunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B4_merge_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B4_stall_region_out_acl_01644 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_stall_region_out_acl_01646 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_stall_region_out_acl_01648 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_stall_region_out_acl_11645 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_stall_region_out_acl_11647 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_stall_region_out_acl_11649 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_stall_region_out_acl_hw_wg_id40 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_stall_region_out_c0_exe11220 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B4_stall_region_out_c0_exe113 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_stall_region_out_c0_exe21325 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B4_stall_region_out_c1_exe1031 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_stall_region_out_c1_exe1132 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_stall_region_out_c1_exe129 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_stall_region_out_c1_exe1533 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_stall_region_out_c1_exe1634 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_stall_region_out_c1_exe230 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_stall_region_out_pms_cs1241_pms_vs_pms_vm_pms_d : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B4_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B4_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B4_branch_out_acl_01644 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_branch_out_acl_01646 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_branch_out_acl_01648 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_branch_out_acl_11645 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_branch_out_acl_11647 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_branch_out_acl_11649 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_branch_out_acl_hw_wg_id40 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_branch_out_c0_exe11220 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B4_branch_out_c0_exe113 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_branch_out_c0_exe21325 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B4_branch_out_c1_exe1031 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_branch_out_c1_exe1132 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_branch_out_c1_exe129 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_branch_out_c1_exe1533 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_branch_out_c1_exe1634 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_branch_out_c1_exe230 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B4_branch_out_pms_cs1241_pms_vs_pms_vm_pms_d : STD_LOGIC_VECTOR (1663 downto 0);
    signal ethash_calculate_dag_item_B4_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B4_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- ethash_calculate_dag_item_B4_merge_aunroll_x(BLACKBOX,2)
    theethash_calculate_dag_item_B4_merge_aunroll_x : ethash_calculate_dag_item_B4_merge
    PORT MAP (
        in_c1_exit28_0_0 => in_c1_exit28_0_0,
        in_c1_exit28_0_1 => in_c1_exit28_0_1,
        in_c1_exit28_0_2 => in_c1_exit28_0_2,
        in_c1_exit28_0_3 => in_c1_exit28_0_3,
        in_c1_exit28_0_4 => in_c1_exit28_0_4,
        in_c1_exit28_0_5 => in_c1_exit28_0_5,
        in_c1_exit28_0_6 => in_c1_exit28_0_6,
        in_c1_exit28_0_7 => in_c1_exit28_0_7,
        in_c1_exit28_0_8 => in_c1_exit28_0_8,
        in_c1_exit28_0_9 => in_c1_exit28_0_9,
        in_c1_exit28_0_10 => in_c1_exit28_0_10,
        in_c1_exit28_0_11 => in_c1_exit28_0_11,
        in_c1_exit28_0_12 => in_c1_exit28_0_12,
        in_c1_exit28_0_13 => in_c1_exit28_0_13,
        in_c1_exit28_0_14 => in_c1_exit28_0_14,
        in_c1_exit28_0_15 => in_c1_exit28_0_15,
        in_c1_exit28_0_16 => in_c1_exit28_0_16,
        in_c1_exit28_0_17 => in_c1_exit28_0_17,
        in_c1_exit28_0_18 => in_c1_exit28_0_18,
        in_c1_exit28_0_19 => in_c1_exit28_0_19,
        in_c1_exit28_0_20 => in_c1_exit28_0_20,
        in_acl_hw_wg_id40_0 => in_acl_hw_wg_id40_0,
        in_c0_exe11220_0 => in_c0_exe11220_0,
        in_c0_exe113_0 => in_c0_exe113_0,
        in_c0_exe21325_0 => in_c0_exe21325_0,
        in_c1_exe1031_0 => in_c1_exe1031_0,
        in_c1_exe1132_0 => in_c1_exe1132_0,
        in_c1_exe129_0 => in_c1_exe129_0,
        in_c1_exe1533_0 => in_c1_exe1533_0,
        in_c1_exe1634_0 => in_c1_exe1634_0,
        in_c1_exe2035_0 => in_c1_exe2035_0,
        in_c1_exe230_0 => in_c1_exe230_0,
        in_stall_in => bb_ethash_calculate_dag_item_B4_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        out_c1_exit28_0 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_0,
        out_c1_exit28_1 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_1,
        out_c1_exit28_2 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_2,
        out_c1_exit28_3 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_3,
        out_c1_exit28_4 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_4,
        out_c1_exit28_5 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_5,
        out_c1_exit28_6 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_6,
        out_c1_exit28_7 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_7,
        out_c1_exit28_8 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_8,
        out_c1_exit28_9 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_9,
        out_c1_exit28_10 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_10,
        out_c1_exit28_11 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_11,
        out_c1_exit28_12 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_12,
        out_c1_exit28_13 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_13,
        out_c1_exit28_14 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_14,
        out_c1_exit28_15 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_15,
        out_c1_exit28_16 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_16,
        out_c1_exit28_17 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_17,
        out_c1_exit28_18 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_18,
        out_c1_exit28_19 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_19,
        out_c1_exit28_20 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_20,
        out_acl_hw_wg_id40 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_acl_hw_wg_id40,
        out_c0_exe11220 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c0_exe11220,
        out_c0_exe113 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c0_exe113,
        out_c0_exe21325 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c0_exe21325,
        out_c1_exe1031 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exe1031,
        out_c1_exe1132 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exe1132,
        out_c1_exe129 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exe129,
        out_c1_exe1533 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exe1533,
        out_c1_exe1634 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exe1634,
        out_c1_exe2035 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exe2035,
        out_c1_exe230 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exe230,
        out_stall_out_0 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_stall_out_0,
        out_valid_out => ethash_calculate_dag_item_B4_merge_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_calculate_dag_item_B4_stall_region(BLACKBOX,38)
    thebb_ethash_calculate_dag_item_B4_stall_region : bb_ethash_calculate_dag_item_B4_stall_region
    PORT MAP (
        in_c1_exit28_0 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_0,
        in_c1_exit28_1 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_1,
        in_c1_exit28_2 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_2,
        in_c1_exit28_3 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_3,
        in_c1_exit28_4 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_4,
        in_c1_exit28_5 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_5,
        in_c1_exit28_6 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_6,
        in_c1_exit28_7 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_7,
        in_c1_exit28_8 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_8,
        in_c1_exit28_9 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_9,
        in_c1_exit28_10 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_10,
        in_c1_exit28_11 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_11,
        in_c1_exit28_12 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_12,
        in_c1_exit28_13 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_13,
        in_c1_exit28_14 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_14,
        in_c1_exit28_15 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_15,
        in_c1_exit28_16 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_16,
        in_c1_exit28_17 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_17,
        in_c1_exit28_18 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_18,
        in_c1_exit28_19 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_19,
        in_c1_exit28_20 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exit28_20,
        in_acl_hw_wg_id40 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_acl_hw_wg_id40,
        in_c0_exe11220 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c0_exe11220,
        in_c0_exe113 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c0_exe113,
        in_c0_exe21325 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c0_exe21325,
        in_c1_exe1031 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exe1031,
        in_c1_exe1132 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exe1132,
        in_c1_exe129 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exe129,
        in_c1_exe1533 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exe1533,
        in_c1_exe1634 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exe1634,
        in_c1_exe2035 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exe2035,
        in_c1_exe230 => ethash_calculate_dag_item_B4_merge_aunroll_x_out_c1_exe230,
        in_stall_in => ethash_calculate_dag_item_B4_branch_out_stall_out,
        in_valid_in => ethash_calculate_dag_item_B4_merge_aunroll_x_out_valid_out,
        out_acl_01644 => bb_ethash_calculate_dag_item_B4_stall_region_out_acl_01644,
        out_acl_01646 => bb_ethash_calculate_dag_item_B4_stall_region_out_acl_01646,
        out_acl_01648 => bb_ethash_calculate_dag_item_B4_stall_region_out_acl_01648,
        out_acl_11645 => bb_ethash_calculate_dag_item_B4_stall_region_out_acl_11645,
        out_acl_11647 => bb_ethash_calculate_dag_item_B4_stall_region_out_acl_11647,
        out_acl_11649 => bb_ethash_calculate_dag_item_B4_stall_region_out_acl_11649,
        out_acl_hw_wg_id40 => bb_ethash_calculate_dag_item_B4_stall_region_out_acl_hw_wg_id40,
        out_c0_exe11220 => bb_ethash_calculate_dag_item_B4_stall_region_out_c0_exe11220,
        out_c0_exe113 => bb_ethash_calculate_dag_item_B4_stall_region_out_c0_exe113,
        out_c0_exe21325 => bb_ethash_calculate_dag_item_B4_stall_region_out_c0_exe21325,
        out_c1_exe1031 => bb_ethash_calculate_dag_item_B4_stall_region_out_c1_exe1031,
        out_c1_exe1132 => bb_ethash_calculate_dag_item_B4_stall_region_out_c1_exe1132,
        out_c1_exe129 => bb_ethash_calculate_dag_item_B4_stall_region_out_c1_exe129,
        out_c1_exe1533 => bb_ethash_calculate_dag_item_B4_stall_region_out_c1_exe1533,
        out_c1_exe1634 => bb_ethash_calculate_dag_item_B4_stall_region_out_c1_exe1634,
        out_c1_exe230 => bb_ethash_calculate_dag_item_B4_stall_region_out_c1_exe230,
        out_pms_cs1241_pms_vs_pms_vm_pms_d => bb_ethash_calculate_dag_item_B4_stall_region_out_pms_cs1241_pms_vs_pms_vm_pms_d,
        out_stall_out => bb_ethash_calculate_dag_item_B4_stall_region_out_stall_out,
        out_valid_out => bb_ethash_calculate_dag_item_B4_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- ethash_calculate_dag_item_B4_branch(BLACKBOX,39)
    theethash_calculate_dag_item_B4_branch : ethash_calculate_dag_item_B4_branch
    PORT MAP (
        in_acl_01644 => bb_ethash_calculate_dag_item_B4_stall_region_out_acl_01644,
        in_acl_01646 => bb_ethash_calculate_dag_item_B4_stall_region_out_acl_01646,
        in_acl_01648 => bb_ethash_calculate_dag_item_B4_stall_region_out_acl_01648,
        in_acl_11645 => bb_ethash_calculate_dag_item_B4_stall_region_out_acl_11645,
        in_acl_11647 => bb_ethash_calculate_dag_item_B4_stall_region_out_acl_11647,
        in_acl_11649 => bb_ethash_calculate_dag_item_B4_stall_region_out_acl_11649,
        in_acl_hw_wg_id40 => bb_ethash_calculate_dag_item_B4_stall_region_out_acl_hw_wg_id40,
        in_c0_exe11220 => bb_ethash_calculate_dag_item_B4_stall_region_out_c0_exe11220,
        in_c0_exe113 => bb_ethash_calculate_dag_item_B4_stall_region_out_c0_exe113,
        in_c0_exe21325 => bb_ethash_calculate_dag_item_B4_stall_region_out_c0_exe21325,
        in_c1_exe1031 => bb_ethash_calculate_dag_item_B4_stall_region_out_c1_exe1031,
        in_c1_exe1132 => bb_ethash_calculate_dag_item_B4_stall_region_out_c1_exe1132,
        in_c1_exe129 => bb_ethash_calculate_dag_item_B4_stall_region_out_c1_exe129,
        in_c1_exe1533 => bb_ethash_calculate_dag_item_B4_stall_region_out_c1_exe1533,
        in_c1_exe1634 => bb_ethash_calculate_dag_item_B4_stall_region_out_c1_exe1634,
        in_c1_exe230 => bb_ethash_calculate_dag_item_B4_stall_region_out_c1_exe230,
        in_pms_cs1241_pms_vs_pms_vm_pms_d => bb_ethash_calculate_dag_item_B4_stall_region_out_pms_cs1241_pms_vs_pms_vm_pms_d,
        in_stall_in_0 => in_stall_in_0,
        in_valid_in => bb_ethash_calculate_dag_item_B4_stall_region_out_valid_out,
        out_acl_01644 => ethash_calculate_dag_item_B4_branch_out_acl_01644,
        out_acl_01646 => ethash_calculate_dag_item_B4_branch_out_acl_01646,
        out_acl_01648 => ethash_calculate_dag_item_B4_branch_out_acl_01648,
        out_acl_11645 => ethash_calculate_dag_item_B4_branch_out_acl_11645,
        out_acl_11647 => ethash_calculate_dag_item_B4_branch_out_acl_11647,
        out_acl_11649 => ethash_calculate_dag_item_B4_branch_out_acl_11649,
        out_acl_hw_wg_id40 => ethash_calculate_dag_item_B4_branch_out_acl_hw_wg_id40,
        out_c0_exe11220 => ethash_calculate_dag_item_B4_branch_out_c0_exe11220,
        out_c0_exe113 => ethash_calculate_dag_item_B4_branch_out_c0_exe113,
        out_c0_exe21325 => ethash_calculate_dag_item_B4_branch_out_c0_exe21325,
        out_c1_exe1031 => ethash_calculate_dag_item_B4_branch_out_c1_exe1031,
        out_c1_exe1132 => ethash_calculate_dag_item_B4_branch_out_c1_exe1132,
        out_c1_exe129 => ethash_calculate_dag_item_B4_branch_out_c1_exe129,
        out_c1_exe1533 => ethash_calculate_dag_item_B4_branch_out_c1_exe1533,
        out_c1_exe1634 => ethash_calculate_dag_item_B4_branch_out_c1_exe1634,
        out_c1_exe230 => ethash_calculate_dag_item_B4_branch_out_c1_exe230,
        out_pms_cs1241_pms_vs_pms_vm_pms_d => ethash_calculate_dag_item_B4_branch_out_pms_cs1241_pms_vs_pms_vm_pms_d,
        out_stall_out => ethash_calculate_dag_item_B4_branch_out_stall_out,
        out_valid_out_0 => ethash_calculate_dag_item_B4_branch_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- out_acl_01644(GPOUT,40)
    out_acl_01644 <= ethash_calculate_dag_item_B4_branch_out_acl_01644;

    -- out_acl_01646(GPOUT,41)
    out_acl_01646 <= ethash_calculate_dag_item_B4_branch_out_acl_01646;

    -- out_acl_01648(GPOUT,42)
    out_acl_01648 <= ethash_calculate_dag_item_B4_branch_out_acl_01648;

    -- out_acl_11645(GPOUT,43)
    out_acl_11645 <= ethash_calculate_dag_item_B4_branch_out_acl_11645;

    -- out_acl_11647(GPOUT,44)
    out_acl_11647 <= ethash_calculate_dag_item_B4_branch_out_acl_11647;

    -- out_acl_11649(GPOUT,45)
    out_acl_11649 <= ethash_calculate_dag_item_B4_branch_out_acl_11649;

    -- out_acl_hw_wg_id40(GPOUT,46)
    out_acl_hw_wg_id40 <= ethash_calculate_dag_item_B4_branch_out_acl_hw_wg_id40;

    -- out_c0_exe11220(GPOUT,47)
    out_c0_exe11220 <= ethash_calculate_dag_item_B4_branch_out_c0_exe11220;

    -- out_c0_exe113(GPOUT,48)
    out_c0_exe113 <= ethash_calculate_dag_item_B4_branch_out_c0_exe113;

    -- out_c0_exe21325(GPOUT,49)
    out_c0_exe21325 <= ethash_calculate_dag_item_B4_branch_out_c0_exe21325;

    -- out_c1_exe1031(GPOUT,50)
    out_c1_exe1031 <= ethash_calculate_dag_item_B4_branch_out_c1_exe1031;

    -- out_c1_exe1132(GPOUT,51)
    out_c1_exe1132 <= ethash_calculate_dag_item_B4_branch_out_c1_exe1132;

    -- out_c1_exe129(GPOUT,52)
    out_c1_exe129 <= ethash_calculate_dag_item_B4_branch_out_c1_exe129;

    -- out_c1_exe1533(GPOUT,53)
    out_c1_exe1533 <= ethash_calculate_dag_item_B4_branch_out_c1_exe1533;

    -- out_c1_exe1634(GPOUT,54)
    out_c1_exe1634 <= ethash_calculate_dag_item_B4_branch_out_c1_exe1634;

    -- out_c1_exe230(GPOUT,55)
    out_c1_exe230 <= ethash_calculate_dag_item_B4_branch_out_c1_exe230;

    -- out_pms_cs1241_pms_vs_pms_vm_pms_d(GPOUT,56)
    out_pms_cs1241_pms_vs_pms_vm_pms_d <= ethash_calculate_dag_item_B4_branch_out_pms_cs1241_pms_vs_pms_vm_pms_d;

    -- out_stall_out_0(GPOUT,57)
    out_stall_out_0 <= ethash_calculate_dag_item_B4_merge_aunroll_x_out_stall_out_0;

    -- out_valid_out_0(GPOUT,58)
    out_valid_out_0 <= ethash_calculate_dag_item_B4_branch_out_valid_out_0;

END normal;
