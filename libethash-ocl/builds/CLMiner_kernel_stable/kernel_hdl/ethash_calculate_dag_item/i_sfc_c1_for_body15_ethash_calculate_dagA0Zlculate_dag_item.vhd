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

-- VHDL created from i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item
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

entity i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item is
    port (
        in_c1_eni18_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni18_0_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni18_1_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni18_2_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni18_3_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni18_0_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni18_1_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni18_2_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni18_3_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni18_0_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni18_1_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni18_2_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni18_3_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni18_0_4 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni18_1_4 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni18_2_4 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni18_3_4 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni18_5 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni18_6 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni18_7 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni18_8 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni18_9 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni18_10 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni18_11 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni18_12 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni18_13 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni18_14 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni18_15 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni18_16 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni18_17 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni18_18 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni18_19 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni18_20 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni18_21 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit_2 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit_3 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit_4 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit_5 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit_6 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit_7 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit_8 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit_9 : out std_logic_vector(127 downto 0);  -- ufix128
        out_c1_exit_10 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit_11 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit_12 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit_13 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit_14 : out std_logic_vector(127 downto 0);  -- ufix128
        out_c1_exit_15 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit_16 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit_17 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit_18 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit_19 : out std_logic_vector(127 downto 0);  -- ufix128
        out_c1_exit_20 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        in_i_stall : in std_logic_vector(0 downto 0);  -- ufix1
        out_o_stall : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item;

architecture normal of i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333 is
        port (
            in_c1_eni18_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni18_0_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni18_0_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni18_0_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni18_0_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni18_1_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni18_1_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni18_1_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni18_1_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni18_2_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni18_2_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni18_2_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni18_2_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni18_3_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni18_3_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni18_3_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni18_3_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni18_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni18_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni18_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni18_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni18_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni18_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni18_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni18_12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni18_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni18_14 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni18_15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni18_16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni18_17 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni18_18 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni18_19 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni18_20 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni18_21 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exi20_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exi20_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exi20_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exi20_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exi20_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exi20_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exi20_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exi20_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exi20_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exi20_9 : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_c1_exi20_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exi20_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exi20_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exi20_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exi20_14 : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_c1_exi20_15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exi20_16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exi20_17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exi20_18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exi20_19 : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_c1_exi20_20 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item341 is
        port (
            in_data_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_9 : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_data_in_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_14 : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_data_in_15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_17 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_18 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_19 : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_data_in_20 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_input_accepted : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_9 : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_data_out_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_14 : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_data_out_15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_19 : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_data_out_20 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_stall_entry : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_9 : STD_LOGIC_VECTOR (127 downto 0);
    signal i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_14 : STD_LOGIC_VECTOR (127 downto 0);
    signal i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_19 : STD_LOGIC_VECTOR (127 downto 0);
    signal i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_20 : STD_LOGIC_VECTOR (1663 downto 0);
    signal i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_9 : STD_LOGIC_VECTOR (127 downto 0);
    signal i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_14 : STD_LOGIC_VECTOR (127 downto 0);
    signal i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_19 : STD_LOGIC_VECTOR (127 downto 0);
    signal i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_20 : STD_LOGIC_VECTOR (1663 downto 0);
    signal i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_stall_entry : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal input_accepted_and_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- not_stall_out(LOGICAL,7)
    not_stall_out_q <= not (i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_stall_entry);

    -- input_accepted_and(LOGICAL,6)
    input_accepted_and_q <= in_i_valid and not_stall_out_q;

    -- i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x(BLACKBOX,4)@200
    -- out out_c1_exi20_0@203
    -- out out_c1_exi20_1@203
    -- out out_c1_exi20_2@203
    -- out out_c1_exi20_3@203
    -- out out_c1_exi20_4@203
    -- out out_c1_exi20_5@203
    -- out out_c1_exi20_6@203
    -- out out_c1_exi20_7@203
    -- out out_c1_exi20_8@203
    -- out out_c1_exi20_9@203
    -- out out_c1_exi20_10@203
    -- out out_c1_exi20_11@203
    -- out out_c1_exi20_12@203
    -- out out_c1_exi20_13@203
    -- out out_c1_exi20_14@203
    -- out out_c1_exi20_15@203
    -- out out_c1_exi20_16@203
    -- out out_c1_exi20_17@203
    -- out out_c1_exi20_18@203
    -- out out_c1_exi20_19@203
    -- out out_c1_exi20_20@203
    -- out out_o_valid@203
    thei_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x : i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333
    PORT MAP (
        in_c1_eni18_0 => in_c1_eni18_0,
        in_c1_eni18_0_1 => in_c1_eni18_0_1,
        in_c1_eni18_0_2 => in_c1_eni18_0_2,
        in_c1_eni18_0_3 => in_c1_eni18_0_3,
        in_c1_eni18_0_4 => in_c1_eni18_0_4,
        in_c1_eni18_1_1 => in_c1_eni18_1_1,
        in_c1_eni18_1_2 => in_c1_eni18_1_2,
        in_c1_eni18_1_3 => in_c1_eni18_1_3,
        in_c1_eni18_1_4 => in_c1_eni18_1_4,
        in_c1_eni18_2_1 => in_c1_eni18_2_1,
        in_c1_eni18_2_2 => in_c1_eni18_2_2,
        in_c1_eni18_2_3 => in_c1_eni18_2_3,
        in_c1_eni18_2_4 => in_c1_eni18_2_4,
        in_c1_eni18_3_1 => in_c1_eni18_3_1,
        in_c1_eni18_3_2 => in_c1_eni18_3_2,
        in_c1_eni18_3_3 => in_c1_eni18_3_3,
        in_c1_eni18_3_4 => in_c1_eni18_3_4,
        in_c1_eni18_5 => in_c1_eni18_5,
        in_c1_eni18_6 => in_c1_eni18_6,
        in_c1_eni18_7 => in_c1_eni18_7,
        in_c1_eni18_8 => in_c1_eni18_8,
        in_c1_eni18_9 => in_c1_eni18_9,
        in_c1_eni18_10 => in_c1_eni18_10,
        in_c1_eni18_11 => in_c1_eni18_11,
        in_c1_eni18_12 => in_c1_eni18_12,
        in_c1_eni18_13 => in_c1_eni18_13,
        in_c1_eni18_14 => in_c1_eni18_14,
        in_c1_eni18_15 => in_c1_eni18_15,
        in_c1_eni18_16 => in_c1_eni18_16,
        in_c1_eni18_17 => in_c1_eni18_17,
        in_c1_eni18_18 => in_c1_eni18_18,
        in_c1_eni18_19 => in_c1_eni18_19,
        in_c1_eni18_20 => in_c1_eni18_20,
        in_c1_eni18_21 => in_c1_eni18_21,
        in_i_valid => input_accepted_and_q,
        out_c1_exi20_0 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_0,
        out_c1_exi20_1 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_1,
        out_c1_exi20_2 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_2,
        out_c1_exi20_3 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_3,
        out_c1_exi20_4 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_4,
        out_c1_exi20_5 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_5,
        out_c1_exi20_6 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_6,
        out_c1_exi20_7 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_7,
        out_c1_exi20_8 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_8,
        out_c1_exi20_9 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_9,
        out_c1_exi20_10 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_10,
        out_c1_exi20_11 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_11,
        out_c1_exi20_12 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_12,
        out_c1_exi20_13 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_13,
        out_c1_exi20_14 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_14,
        out_c1_exi20_15 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_15,
        out_c1_exi20_16 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_16,
        out_c1_exi20_17 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_17,
        out_c1_exi20_18 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_18,
        out_c1_exi20_19 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_19,
        out_c1_exi20_20 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_20,
        out_o_valid => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x(BLACKBOX,5)@20000000
    -- out out_data_out_0@20000003
    -- out out_data_out_1@20000003
    -- out out_data_out_2@20000003
    -- out out_data_out_3@20000003
    -- out out_data_out_4@20000003
    -- out out_data_out_5@20000003
    -- out out_data_out_6@20000003
    -- out out_data_out_7@20000003
    -- out out_data_out_8@20000003
    -- out out_data_out_9@20000003
    -- out out_data_out_10@20000003
    -- out out_data_out_11@20000003
    -- out out_data_out_12@20000003
    -- out out_data_out_13@20000003
    -- out out_data_out_14@20000003
    -- out out_data_out_15@20000003
    -- out out_data_out_16@20000003
    -- out out_data_out_17@20000003
    -- out out_data_out_18@20000003
    -- out out_data_out_19@20000003
    -- out out_data_out_20@20000003
    -- out out_valid_out@20000003
    thei_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x : i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item341
    PORT MAP (
        in_data_in_0 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_0,
        in_data_in_1 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_1,
        in_data_in_2 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_2,
        in_data_in_3 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_3,
        in_data_in_4 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_4,
        in_data_in_5 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_5,
        in_data_in_6 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_6,
        in_data_in_7 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_7,
        in_data_in_8 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_8,
        in_data_in_9 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_9,
        in_data_in_10 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_10,
        in_data_in_11 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_11,
        in_data_in_12 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_12,
        in_data_in_13 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_13,
        in_data_in_14 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_14,
        in_data_in_15 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_15,
        in_data_in_16 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_16,
        in_data_in_17 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_17,
        in_data_in_18 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_18,
        in_data_in_19 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_19,
        in_data_in_20 => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_c1_exi20_20,
        in_input_accepted => input_accepted_and_q,
        in_stall_in => in_i_stall,
        in_valid_in => i_sfc_logic_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item333_aunroll_vunroll_x_out_o_valid,
        out_data_out_0 => i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_0,
        out_data_out_1 => i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_1,
        out_data_out_2 => i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_2,
        out_data_out_3 => i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_3,
        out_data_out_4 => i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_4,
        out_data_out_5 => i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_5,
        out_data_out_6 => i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_6,
        out_data_out_7 => i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_7,
        out_data_out_8 => i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_8,
        out_data_out_9 => i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_9,
        out_data_out_10 => i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_10,
        out_data_out_11 => i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_11,
        out_data_out_12 => i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_12,
        out_data_out_13 => i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_13,
        out_data_out_14 => i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_14,
        out_data_out_15 => i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_15,
        out_data_out_16 => i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_16,
        out_data_out_17 => i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_17,
        out_data_out_18 => i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_18,
        out_data_out_19 => i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_19,
        out_data_out_20 => i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_20,
        out_stall_entry => i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_stall_entry,
        out_valid_out => i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_sync_out_aunroll_x(GPOUT,3)@206
    out_c1_exit_0 <= i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_0;
    out_c1_exit_1 <= i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_1;
    out_c1_exit_2 <= i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_2;
    out_c1_exit_3 <= i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_3;
    out_c1_exit_4 <= i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_4;
    out_c1_exit_5 <= i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_5;
    out_c1_exit_6 <= i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_6;
    out_c1_exit_7 <= i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_7;
    out_c1_exit_8 <= i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_8;
    out_c1_exit_9 <= i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_9;
    out_c1_exit_10 <= i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_10;
    out_c1_exit_11 <= i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_11;
    out_c1_exit_12 <= i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_12;
    out_c1_exit_13 <= i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_13;
    out_c1_exit_14 <= i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_14;
    out_c1_exit_15 <= i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_15;
    out_c1_exit_16 <= i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_16;
    out_c1_exit_17 <= i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_17;
    out_c1_exit_18 <= i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_18;
    out_c1_exit_19 <= i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_19;
    out_c1_exit_20 <= i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_data_out_20;
    out_o_valid <= i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_valid_out;

    -- sync_out(GPOUT,9)@20000000
    out_o_stall <= i_acl_sfc_exit_c1_for_body15_ethash_calculate_dag_item_c1_exit_ethash_calculate_dag_item_aunroll_x_out_stall_entry;

END normal;
