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

-- VHDL created from bb_ethash_calculate_dag_item_B3_stall_region
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

entity bb_ethash_calculate_dag_item_B3_stall_region is
    port (
        out_acl_hw_wg_id41 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe11221 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe114 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe21326 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe10 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe11 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe12 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe13 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe15 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe16 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe17 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe18 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe2 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe20 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_c1_exe3 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe4 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe5 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe6 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe7 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe8 : out std_logic_vector(31 downto 0);  -- ufix32
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
        out_fpgaindvars_iv_next : out std_logic_vector(8 downto 0);  -- ufix9
        out_inc43 : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_ethash_calculate_dag_item7 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_g_light : in std_logic_vector(63 downto 0);  -- ufix64
        in_acl_hw_wg_id41 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe11221 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe114 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe21326 : in std_logic_vector(0 downto 0);  -- ufix1
        in_dag_node_pm_1 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_fpgaindvars_iv : in std_logic_vector(8 downto 0);  -- ufix9
        in_i11_0687 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01585 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01587 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01591 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01595 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11586 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11588 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11592 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11596 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_21589 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_21593 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_21597 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_31590 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_31594 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_31598 : in std_logic_vector(31 downto 0);  -- ufix32
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_g_light_load_02193_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_memcoalesce_g_light_load_02193_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_g_light_load_02193_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_g_light_load_02193_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_g_light_load_02193_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        out_memcoalesce_g_light_load_02193_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_g_light_load_02193_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_g_light_load_02193_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_g_light_load_02193_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_memcoalesce_g_light_load_02193_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_memcoalesce_g_light_load_02193_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_ethash_calculate_dag_item_B3_stall_region;

architecture normal of bb_ethash_calculate_dag_item_B3_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item331 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_g_light_load_02193_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_memcoalesce_g_light_load_02193_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_g_light_load_02193_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_g_light_load_02193_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata_0_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_readdata_0_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_readdata_0_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_readdata_0_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_readdata_1_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_readdata_1_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_readdata_1_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_readdata_1_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_readdata_2_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_readdata_2_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_readdata_2_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_readdata_2_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_readdata_3_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_readdata_3_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_readdata_3_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_readdata_3_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_02193_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_02193_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_02193_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_02193_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_02193_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_02193_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_02193_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item is
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
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit_9 : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_c1_exit_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit_14 : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_c1_exit_15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit_16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit_17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit_18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit_19 : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_c1_exit_20 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component ethash_calculate_dag_item_B3_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_data_in_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_14 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_17 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_18 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_19 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_20 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_21 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_22 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_data_out_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_19 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_20 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_21 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_22 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c0_for_body15_ethash_calculate_dag_item_c0_enter17_ethash_calculate_dag_item is
        port (
            in_c0_eni316_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni316_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni316_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni316_3 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_g_light : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit22_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit22_1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component acl_data_fifo is
        generic (
            DEPTH : INTEGER := 0;
            DATA_WIDTH : INTEGER := 32;
            STRICT_DEPTH : INTEGER := 0;
            ALLOW_FULL_WRITE : INTEGER := 0;
            IMPL : STRING := "ram"
        );
        port (
            clock : in std_logic;
            resetn : in std_logic;
            valid_in : in std_logic;
            stall_in : in std_logic;
            data_in : in std_logic_vector(DATA_WIDTH - 1 downto 0);
            valid_out : out std_logic;
            stall_out : out std_logic;
            data_out : out std_logic_vector(DATA_WIDTH - 1 downto 0);
            full : out std_logic;
            almost_full : out std_logic
        );
    end component;

























    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_0_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_0_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_0_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_0_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_1_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_1_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_1_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_1_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_2_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_2_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_2_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_2_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_3_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_3_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_3_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_3_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_memcoalesce_g_light_load_02193_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_memcoalesce_g_light_load_02193_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_memcoalesce_g_light_load_02193_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_memcoalesce_g_light_load_02193_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_memcoalesce_g_light_load_02193_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_memcoalesce_g_light_load_02193_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_memcoalesce_g_light_load_02193_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_9 : STD_LOGIC_VECTOR (127 downto 0);
    signal i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_14 : STD_LOGIC_VECTOR (127 downto 0);
    signal i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_19 : STD_LOGIC_VECTOR (127 downto 0);
    signal i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_20 : STD_LOGIC_VECTOR (1663 downto 0);
    signal i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bgTrunc_i_fpgaindvars_iv_next_ethash_calculate_dag_item_sel_x_b : STD_LOGIC_VECTOR (8 downto 0);
    signal bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (1663 downto 0);
    signal ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body15_ethash_calculate_dag_item_c0_enter17_ethash_calculate_dag_item_aunroll_x_out_c0_exit22_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_body15_ethash_calculate_dag_item_c0_enter17_ethash_calculate_dag_item_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body15_ethash_calculate_dag_item_c0_enter17_ethash_calculate_dag_item_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i9_1gr_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_fpgaindvars_iv_next_ethash_calculate_dag_item_a : STD_LOGIC_VECTOR (9 downto 0);
    signal i_fpgaindvars_iv_next_ethash_calculate_dag_item_b : STD_LOGIC_VECTOR (9 downto 0);
    signal i_fpgaindvars_iv_next_ethash_calculate_dag_item_o : STD_LOGIC_VECTOR (9 downto 0);
    signal i_fpgaindvars_iv_next_ethash_calculate_dag_item_q : STD_LOGIC_VECTOR (9 downto 0);
    signal i_inc43_ethash_calculate_dag_item_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc43_ethash_calculate_dag_item_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc43_ethash_calculate_dag_item_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc43_ethash_calculate_dag_item_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_unnamed_ethash_calculate_dag_item330_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond_ethash_calculate_dag_item_cmp_sign_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo_data_in : STD_LOGIC_VECTOR (8 downto 0);
    signal redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo_data_out : STD_LOGIC_VECTOR (8 downto 0);
    signal redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo_data_in : STD_LOGIC_VECTOR (1663 downto 0);
    signal redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo_data_out : STD_LOGIC_VECTOR (1663 downto 0);
    signal redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_q : STD_LOGIC_VECTOR (511 downto 0);
    signal bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_h : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_i : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_j : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_k : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_l : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_m : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_n : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_o : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_p : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_q : STD_LOGIC_VECTOR (2560 downto 0);
    signal bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_h : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_i : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_j : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_k : STD_LOGIC_VECTOR (127 downto 0);
    signal bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_l : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_m : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_n : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_o : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_p : STD_LOGIC_VECTOR (127 downto 0);
    signal bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_r : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_s : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_t : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_u : STD_LOGIC_VECTOR (127 downto 0);
    signal bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_v : STD_LOGIC_VECTOR (1663 downto 0);
    signal bubble_join_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (2282 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (8 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_c : STD_LOGIC_VECTOR (1663 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_h : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_i : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_j : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_k : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_l : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_m : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_n : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_o : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_p : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_r : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_s : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_t : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_u : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_v : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_w : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_x : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_sfc_c0_for_body15_ethash_calculate_dag_item_c0_enter17_ethash_calculate_dag_item_aunroll_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_body15_ethash_calculate_dag_item_c0_enter17_ethash_calculate_dag_item_aunroll_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (2282 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_f : STD_LOGIC_VECTOR (1663 downto 0);
    signal bubble_select_stall_entry_g : STD_LOGIC_VECTOR (8 downto 0);
    signal bubble_select_stall_entry_h : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_i : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_j : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_k : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_l : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_m : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_n : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_o : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_p : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_r : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_s : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_t : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_u : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_v : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_w : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_x : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo_q : STD_LOGIC_VECTOR (8 downto 0);
    signal bubble_select_redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo_b : STD_LOGIC_VECTOR (8 downto 0);
    signal bubble_join_redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal bubble_select_redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo_b : STD_LOGIC_VECTOR (1663 downto 0);
    signal bubble_join_redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg18 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg18 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed18 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg19 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg19 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed19 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg20 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg20 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed20 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg21 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg21 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed21 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg22 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg22 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed22 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg23 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg23 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed23 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or18 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or19 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or20 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or21 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or22 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V18 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V19 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V20 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V21 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V22 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V23 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body15_ethash_calculate_dag_item_c0_enter17_ethash_calculate_dag_item_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body15_ethash_calculate_dag_item_c0_enter17_ethash_calculate_dag_item_aunroll_x_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body15_ethash_calculate_dag_item_c0_enter17_ethash_calculate_dag_item_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body15_ethash_calculate_dag_item_c0_enter17_ethash_calculate_dag_item_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_and5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- SE_stall_entry(STALLENABLE,194)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,106)
    bubble_join_stall_entry_q <= in_scalarizer_31598 & in_scalarizer_31594 & in_scalarizer_31590 & in_scalarizer_3 & in_scalarizer_21597 & in_scalarizer_21593 & in_scalarizer_21589 & in_scalarizer_2 & in_scalarizer_11596 & in_scalarizer_11592 & in_scalarizer_11588 & in_scalarizer_11586 & in_scalarizer_01595 & in_scalarizer_01591 & in_scalarizer_01587 & in_scalarizer_01585 & in_i11_0687 & in_fpgaindvars_iv & in_dag_node_pm_1 & in_c0_exe21326 & in_c0_exe114 & in_c0_exe11221 & in_acl_hw_wg_id41;

    -- bubble_select_stall_entry(BITSELECT,107)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(31 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(32 downto 32));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(64 downto 33));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(65 downto 65));
    bubble_select_stall_entry_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1729 downto 66));
    bubble_select_stall_entry_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1738 downto 1730));
    bubble_select_stall_entry_h <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1770 downto 1739));
    bubble_select_stall_entry_i <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1802 downto 1771));
    bubble_select_stall_entry_j <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1834 downto 1803));
    bubble_select_stall_entry_k <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1866 downto 1835));
    bubble_select_stall_entry_l <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1898 downto 1867));
    bubble_select_stall_entry_m <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1930 downto 1899));
    bubble_select_stall_entry_n <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1962 downto 1931));
    bubble_select_stall_entry_o <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1994 downto 1963));
    bubble_select_stall_entry_p <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2026 downto 1995));
    bubble_select_stall_entry_q <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2058 downto 2027));
    bubble_select_stall_entry_r <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2090 downto 2059));
    bubble_select_stall_entry_s <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2122 downto 2091));
    bubble_select_stall_entry_t <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2154 downto 2123));
    bubble_select_stall_entry_u <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2186 downto 2155));
    bubble_select_stall_entry_v <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2218 downto 2187));
    bubble_select_stall_entry_w <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2250 downto 2219));
    bubble_select_stall_entry_x <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2282 downto 2251));

    -- ethash_calculate_dag_item_B3_merge_reg_aunroll_x(BLACKBOX,15)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_data_out_1@1
    -- out out_data_out_2@1
    -- out out_data_out_3@1
    -- out out_data_out_4@1
    -- out out_data_out_5@1
    -- out out_data_out_6@1
    -- out out_data_out_7@1
    -- out out_data_out_8@1
    -- out out_data_out_9@1
    -- out out_data_out_10@1
    -- out out_data_out_11@1
    -- out out_data_out_12@1
    -- out out_data_out_13@1
    -- out out_data_out_14@1
    -- out out_data_out_15@1
    -- out out_data_out_16@1
    -- out out_data_out_17@1
    -- out out_data_out_18@1
    -- out out_data_out_19@1
    -- out out_data_out_20@1
    -- out out_data_out_21@1
    -- out out_data_out_22@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    theethash_calculate_dag_item_B3_merge_reg_aunroll_x : ethash_calculate_dag_item_B3_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_g,
        in_data_in_1 => bubble_select_stall_entry_f,
        in_data_in_2 => bubble_select_stall_entry_i,
        in_data_in_3 => bubble_select_stall_entry_m,
        in_data_in_4 => bubble_select_stall_entry_q,
        in_data_in_5 => bubble_select_stall_entry_u,
        in_data_in_6 => bubble_select_stall_entry_j,
        in_data_in_7 => bubble_select_stall_entry_n,
        in_data_in_8 => bubble_select_stall_entry_r,
        in_data_in_9 => bubble_select_stall_entry_v,
        in_data_in_10 => bubble_select_stall_entry_k,
        in_data_in_11 => bubble_select_stall_entry_o,
        in_data_in_12 => bubble_select_stall_entry_s,
        in_data_in_13 => bubble_select_stall_entry_w,
        in_data_in_14 => bubble_select_stall_entry_l,
        in_data_in_15 => bubble_select_stall_entry_p,
        in_data_in_16 => bubble_select_stall_entry_t,
        in_data_in_17 => bubble_select_stall_entry_x,
        in_data_in_18 => bubble_select_stall_entry_h,
        in_data_in_19 => bubble_select_stall_entry_d,
        in_data_in_20 => bubble_select_stall_entry_c,
        in_data_in_21 => bubble_select_stall_entry_e,
        in_data_in_22 => bubble_select_stall_entry_b,
        in_stall_in => SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0,
        out_data_out_1 => ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1,
        out_data_out_2 => ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2,
        out_data_out_3 => ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3,
        out_data_out_4 => ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4,
        out_data_out_5 => ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5,
        out_data_out_6 => ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6,
        out_data_out_7 => ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7,
        out_data_out_8 => ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8,
        out_data_out_9 => ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9,
        out_data_out_10 => ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10,
        out_data_out_11 => ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11,
        out_data_out_12 => ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12,
        out_data_out_13 => ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13,
        out_data_out_14 => ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14,
        out_data_out_15 => ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15,
        out_data_out_16 => ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16,
        out_data_out_17 => ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17,
        out_data_out_18 => ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_18,
        out_data_out_19 => ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19,
        out_data_out_20 => ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20,
        out_data_out_21 => ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21,
        out_data_out_22 => ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22,
        out_stall_out => ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_ethash_calculate_dag_item_B3_merge_reg_aunroll_x(BITJOIN,100)
    bubble_join_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_q <= ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22 & ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21 & ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20 & ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19 & ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_18 & ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17 & ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16 & ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15 & ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14 & ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13 & ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12 & ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11 & ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10 & ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9 & ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8 & ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7 & ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6 & ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5 & ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4 & ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3 & ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2 & ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1 & ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x(BITSELECT,101)
    bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_q(8 downto 0));
    bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_q(1672 downto 9));
    bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_q(1704 downto 1673));
    bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_q(1736 downto 1705));
    bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_q(1768 downto 1737));
    bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_q(1800 downto 1769));
    bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_q(1832 downto 1801));
    bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_q(1864 downto 1833));
    bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_j <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_q(1896 downto 1865));
    bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_k <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_q(1928 downto 1897));
    bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_l <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_q(1960 downto 1929));
    bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_m <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_q(1992 downto 1961));
    bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_n <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_q(2024 downto 1993));
    bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_o <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_q(2056 downto 2025));
    bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_p <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_q(2088 downto 2057));
    bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_q <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_q(2120 downto 2089));
    bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_r <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_q(2152 downto 2121));
    bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_s <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_q(2184 downto 2153));
    bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_t <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_q(2216 downto 2185));
    bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_u <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_q(2248 downto 2217));
    bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_v <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_q(2249 downto 2249));
    bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_w <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_q(2250 downto 2250));
    bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_x <= STD_LOGIC_VECTOR(bubble_join_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_q(2282 downto 2251));

    -- SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x(STALLENABLE,188)
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg0 <= (others => '0');
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg1 <= (others => '0');
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg2 <= (others => '0');
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg3 <= (others => '0');
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg4 <= (others => '0');
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg5 <= (others => '0');
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg6 <= (others => '0');
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg7 <= (others => '0');
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg8 <= (others => '0');
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg9 <= (others => '0');
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg10 <= (others => '0');
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg11 <= (others => '0');
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg12 <= (others => '0');
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg13 <= (others => '0');
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg14 <= (others => '0');
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg15 <= (others => '0');
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg16 <= (others => '0');
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg17 <= (others => '0');
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg18 <= (others => '0');
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg19 <= (others => '0');
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg20 <= (others => '0');
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg21 <= (others => '0');
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg22 <= (others => '0');
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg23 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg0 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg1 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg1;
            -- Succesor 2
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg2 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg2;
            -- Succesor 3
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg3 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg3;
            -- Succesor 4
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg4 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg4;
            -- Succesor 5
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg5 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg5;
            -- Succesor 6
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg6 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg6;
            -- Succesor 7
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg7 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg7;
            -- Succesor 8
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg8 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg8;
            -- Succesor 9
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg9 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg9;
            -- Succesor 10
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg10 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg10;
            -- Succesor 11
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg11 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg11;
            -- Succesor 12
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg12 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg12;
            -- Succesor 13
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg13 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg13;
            -- Succesor 14
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg14 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg14;
            -- Succesor 15
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg15 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg15;
            -- Succesor 16
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg16 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg16;
            -- Succesor 17
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg17 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg17;
            -- Succesor 18
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg18 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg18;
            -- Succesor 19
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg19 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg19;
            -- Succesor 20
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg20 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg20;
            -- Succesor 21
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg21 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg21;
            -- Succesor 22
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg22 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg22;
            -- Succesor 23
            SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg23 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg23;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed0 <= (not (i_sfc_c0_for_body15_ethash_calculate_dag_item_c0_enter17_ethash_calculate_dag_item_aunroll_x_out_o_stall) and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg0;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed1 <= (not (redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo_stall_out) and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg1;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed2 <= (not (redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo_stall_out) and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg2;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed3 <= (not (redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo_stall_out) and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg3;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed4 <= (not (redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo_stall_out) and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg4;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed5 <= (not (redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo_stall_out) and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg5;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed6 <= (not (redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo_stall_out) and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg6;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed7 <= (not (redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo_stall_out) and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg7;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed8 <= (not (redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo_stall_out) and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg8;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed9 <= (not (redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo_stall_out) and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg9;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed10 <= (not (redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo_stall_out) and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg10;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed11 <= (not (redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo_stall_out) and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg11;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed12 <= (not (redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo_stall_out) and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg12;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed13 <= (not (redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo_stall_out) and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg13;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed14 <= (not (redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo_stall_out) and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg14;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed15 <= (not (redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo_stall_out) and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg15;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed16 <= (not (redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo_stall_out) and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg16;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed17 <= (not (redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo_stall_out) and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg17;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed18 <= (not (redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_stall_out) and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg18;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed19 <= (not (redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo_stall_out) and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg19;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed20 <= (not (redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo_stall_out) and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg20;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed21 <= (not (redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_stall_out) and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg21;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed22 <= (not (redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo_stall_out) and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg22;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed23 <= (not (redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_stall_out) and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg23;
    -- Consuming
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_StallValid <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_backStall and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg0 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed0;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg1 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed1;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg2 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed2;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg3 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed3;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg4 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed4;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg5 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed5;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg6 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed6;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg7 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed7;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg8 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed8;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg9 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed9;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg10 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed10;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg11 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed11;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg12 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed12;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg13 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed13;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg14 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed14;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg15 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed15;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg16 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed16;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg17 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed17;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg18 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed18;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg19 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed19;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg20 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed20;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg21 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed21;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg22 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed22;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_toReg23 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed23;
    -- Backward Stall generation
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or0 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed0;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or1 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed1 and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or0;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or2 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed2 and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or1;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or3 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed3 and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or2;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or4 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed4 and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or3;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or5 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed5 and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or4;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or6 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed6 and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or5;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or7 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed7 and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or6;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or8 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed8 and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or7;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or9 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed9 and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or8;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or10 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed10 and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or9;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or11 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed11 and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or10;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or12 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed12 and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or11;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or13 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed13 and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or12;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or14 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed14 and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or13;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or15 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed15 and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or14;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or16 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed16 and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or15;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or17 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed17 and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or16;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or18 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed18 and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or17;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or19 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed19 and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or18;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or20 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed20 and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or19;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or21 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed21 and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or20;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or22 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed22 and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or21;
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireStall <= not (SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_consumed23 and SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_or22);
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_backStall <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V0 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg0);
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V1 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg1);
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V2 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg2);
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V3 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg3);
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V4 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg4);
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V5 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg5);
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V6 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg6);
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V7 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg7);
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V8 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg8);
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V9 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg9);
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V10 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg10);
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V11 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg11);
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V12 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg12);
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V13 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg13);
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V14 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg14);
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V15 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg15);
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V16 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg16);
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V17 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg17);
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V18 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg18);
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V19 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg19);
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V20 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg20);
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V21 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg21);
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V22 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg22);
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V23 <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_fromReg23);
    -- Computing multiple Valid(s)
    SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_wireValid <= ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_valid_out;

    -- redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo(STALLFIFO,88)
    redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_valid_in <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V21;
    redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_stall_in <= SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_backStall;
    redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_data_in <= bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_w;
    redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_valid_in_bitsignaltemp <= redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_valid_in(0);
    redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_stall_in_bitsignaltemp <= redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_stall_in(0);
    redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_valid_out(0) <= redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_valid_out_bitsignaltemp;
    redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_stall_out(0) <= redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_stall_out_bitsignaltemp;
    theredist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 39,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_valid_in_bitsignaltemp,
        stall_in => redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_w,
        valid_out => redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_valid_out_bitsignaltemp,
        stall_out => redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_stall_out_bitsignaltemp,
        data_out => redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo(STALLENABLE,238)
    SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_fromReg0 <= (others => '0');
            SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_fromReg0 <= SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_toReg0;
            -- Succesor 1
            SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_fromReg1 <= SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_consumed0 <= (not (SE_out_i_sfc_c0_for_body15_ethash_calculate_dag_item_c0_enter17_ethash_calculate_dag_item_aunroll_x_backStall) and SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_wireValid) or SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_fromReg0;
    SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_consumed1 <= (not (redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo_stall_out) and SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_wireValid) or SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_fromReg1;
    -- Consuming
    SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_StallValid <= SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_backStall and SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_wireValid;
    SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_toReg0 <= SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_StallValid and SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_consumed0;
    SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_toReg1 <= SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_StallValid and SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_or0 <= SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_consumed0;
    SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_wireStall <= not (SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_consumed1 and SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_or0);
    SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_backStall <= SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_V0 <= SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_wireValid and not (SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_fromReg0);
    SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_V1 <= SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_wireValid and not (SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_wireValid <= redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_valid_out;

    -- i_sfc_c0_for_body15_ethash_calculate_dag_item_c0_enter17_ethash_calculate_dag_item_aunroll_x(BLACKBOX,16)@1
    -- in in_i_stall@20000000
    -- out out_c0_exit22_0@39
    -- out out_c0_exit22_1@39
    -- out out_o_stall@20000000
    -- out out_o_valid@39
    thei_sfc_c0_for_body15_ethash_calculate_dag_item_c0_enter17_ethash_calculate_dag_item_aunroll_x : i_sfc_c0_for_body15_ethash_calculate_dag_item_c0_enter17_ethash_calculate_dag_item
    PORT MAP (
        in_c0_eni316_0 => GND_q,
        in_c0_eni316_1 => bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_t,
        in_c0_eni316_2 => bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_u,
        in_c0_eni316_3 => bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_c,
        in_g_light => in_g_light,
        in_i_stall => SE_out_i_sfc_c0_for_body15_ethash_calculate_dag_item_c0_enter17_ethash_calculate_dag_item_aunroll_x_backStall,
        in_i_valid => SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V0,
        out_c0_exit22_1 => i_sfc_c0_for_body15_ethash_calculate_dag_item_c0_enter17_ethash_calculate_dag_item_aunroll_x_out_c0_exit22_1,
        out_o_stall => i_sfc_c0_for_body15_ethash_calculate_dag_item_c0_enter17_ethash_calculate_dag_item_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_for_body15_ethash_calculate_dag_item_c0_enter17_ethash_calculate_dag_item_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_sfc_c0_for_body15_ethash_calculate_dag_item_c0_enter17_ethash_calculate_dag_item_aunroll_x(STALLENABLE,190)
    -- Valid signal propagation
    SE_out_i_sfc_c0_for_body15_ethash_calculate_dag_item_c0_enter17_ethash_calculate_dag_item_aunroll_x_V0 <= SE_out_i_sfc_c0_for_body15_ethash_calculate_dag_item_c0_enter17_ethash_calculate_dag_item_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_sfc_c0_for_body15_ethash_calculate_dag_item_c0_enter17_ethash_calculate_dag_item_aunroll_x_backStall <= i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_stall or not (SE_out_i_sfc_c0_for_body15_ethash_calculate_dag_item_c0_enter17_ethash_calculate_dag_item_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_sfc_c0_for_body15_ethash_calculate_dag_item_c0_enter17_ethash_calculate_dag_item_aunroll_x_and0 <= i_sfc_c0_for_body15_ethash_calculate_dag_item_c0_enter17_ethash_calculate_dag_item_aunroll_x_out_o_valid;
    SE_out_i_sfc_c0_for_body15_ethash_calculate_dag_item_c0_enter17_ethash_calculate_dag_item_aunroll_x_wireValid <= SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_V0 and SE_out_i_sfc_c0_for_body15_ethash_calculate_dag_item_c0_enter17_ethash_calculate_dag_item_aunroll_x_and0;

    -- bubble_join_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo(BITJOIN,170)
    bubble_join_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_q <= redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_data_out;

    -- bubble_select_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo(BITSELECT,171)
    bubble_select_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_q(0 downto 0));

    -- bubble_join_i_sfc_c0_for_body15_ethash_calculate_dag_item_c0_enter17_ethash_calculate_dag_item_aunroll_x(BITJOIN,103)
    bubble_join_i_sfc_c0_for_body15_ethash_calculate_dag_item_c0_enter17_ethash_calculate_dag_item_aunroll_x_q <= i_sfc_c0_for_body15_ethash_calculate_dag_item_c0_enter17_ethash_calculate_dag_item_aunroll_x_out_c0_exit22_1;

    -- bubble_select_i_sfc_c0_for_body15_ethash_calculate_dag_item_c0_enter17_ethash_calculate_dag_item_aunroll_x(BITSELECT,104)
    bubble_select_i_sfc_c0_for_body15_ethash_calculate_dag_item_c0_enter17_ethash_calculate_dag_item_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body15_ethash_calculate_dag_item_c0_enter17_ethash_calculate_dag_item_aunroll_x_q(63 downto 0));

    -- i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x(BLACKBOX,3)@39
    -- in in_i_stall@20000000
    -- out out_o_readdata_0_0@200
    -- out out_o_readdata_0_1@200
    -- out out_o_readdata_0_2@200
    -- out out_o_readdata_0_3@200
    -- out out_o_readdata_1_0@200
    -- out out_o_readdata_1_1@200
    -- out out_o_readdata_1_2@200
    -- out out_o_readdata_1_3@200
    -- out out_o_readdata_2_0@200
    -- out out_o_readdata_2_1@200
    -- out out_o_readdata_2_2@200
    -- out out_o_readdata_2_3@200
    -- out out_o_readdata_3_0@200
    -- out out_o_readdata_3_1@200
    -- out out_o_readdata_3_2@200
    -- out out_o_readdata_3_3@200
    -- out out_memcoalesce_g_light_load_02193_avm_address@20000000
    -- out out_memcoalesce_g_light_load_02193_avm_burstcount@20000000
    -- out out_memcoalesce_g_light_load_02193_avm_byteenable@20000000
    -- out out_memcoalesce_g_light_load_02193_avm_enable@20000000
    -- out out_memcoalesce_g_light_load_02193_avm_read@20000000
    -- out out_memcoalesce_g_light_load_02193_avm_write@20000000
    -- out out_memcoalesce_g_light_load_02193_avm_writedata@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@200
    thei_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x : i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item331
    PORT MAP (
        in_flush => in_flush,
        in_i_address => bubble_select_i_sfc_c0_for_body15_ethash_calculate_dag_item_c0_enter17_ethash_calculate_dag_item_aunroll_x_b,
        in_i_predicate => bubble_select_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_b,
        in_i_stall => SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_backStall,
        in_i_valid => SE_out_i_sfc_c0_for_body15_ethash_calculate_dag_item_c0_enter17_ethash_calculate_dag_item_aunroll_x_V0,
        in_memcoalesce_g_light_load_02193_avm_readdata => in_memcoalesce_g_light_load_02193_avm_readdata,
        in_memcoalesce_g_light_load_02193_avm_readdatavalid => in_memcoalesce_g_light_load_02193_avm_readdatavalid,
        in_memcoalesce_g_light_load_02193_avm_waitrequest => in_memcoalesce_g_light_load_02193_avm_waitrequest,
        in_memcoalesce_g_light_load_02193_avm_writeack => in_memcoalesce_g_light_load_02193_avm_writeack,
        out_o_readdata_0_0 => i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_0_0,
        out_o_readdata_0_1 => i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_0_1,
        out_o_readdata_0_2 => i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_0_2,
        out_o_readdata_0_3 => i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_0_3,
        out_o_readdata_1_0 => i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_1_0,
        out_o_readdata_1_1 => i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_1_1,
        out_o_readdata_1_2 => i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_1_2,
        out_o_readdata_1_3 => i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_1_3,
        out_o_readdata_2_0 => i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_2_0,
        out_o_readdata_2_1 => i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_2_1,
        out_o_readdata_2_2 => i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_2_2,
        out_o_readdata_2_3 => i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_2_3,
        out_o_readdata_3_0 => i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_3_0,
        out_o_readdata_3_1 => i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_3_1,
        out_o_readdata_3_2 => i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_3_2,
        out_o_readdata_3_3 => i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_3_3,
        out_memcoalesce_g_light_load_02193_avm_address => i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_memcoalesce_g_light_load_02193_avm_address,
        out_memcoalesce_g_light_load_02193_avm_burstcount => i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_memcoalesce_g_light_load_02193_avm_burstcount,
        out_memcoalesce_g_light_load_02193_avm_byteenable => i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_memcoalesce_g_light_load_02193_avm_byteenable,
        out_memcoalesce_g_light_load_02193_avm_enable => i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_memcoalesce_g_light_load_02193_avm_enable,
        out_memcoalesce_g_light_load_02193_avm_read => i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_memcoalesce_g_light_load_02193_avm_read,
        out_memcoalesce_g_light_load_02193_avm_write => i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_memcoalesce_g_light_load_02193_avm_write,
        out_memcoalesce_g_light_load_02193_avm_writedata => i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_memcoalesce_g_light_load_02193_avm_writedata,
        out_o_stall => i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_stall,
        out_o_valid => i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo(STALLFIFO,69)
    redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo_valid_in <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V2;
    redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo_stall_in <= SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_backStall;
    redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo_data_in <= bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_c;
    redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo_valid_in_bitsignaltemp <= redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo_valid_in(0);
    redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo_stall_in_bitsignaltemp <= redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo_stall_in(0);
    redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo_valid_out(0) <= redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo_valid_out_bitsignaltemp;
    redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo_stall_out(0) <= redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo_stall_out_bitsignaltemp;
    theredist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 200,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1664,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo_valid_in_bitsignaltemp,
        stall_in => redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_c,
        valid_out => redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo_valid_out_bitsignaltemp,
        stall_out => redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo_stall_out_bitsignaltemp,
        data_out => redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo(STALLFIFO,70)
    redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo_valid_in <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V3;
    redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo_stall_in <= SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_backStall;
    redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo_data_in <= bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_d;
    redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo_valid_in_bitsignaltemp <= redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo_valid_in(0);
    redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo_stall_in_bitsignaltemp <= redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo_stall_in(0);
    redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo_valid_out(0) <= redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo_valid_out_bitsignaltemp;
    redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo_stall_out(0) <= redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo_stall_out_bitsignaltemp;
    theredist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 200,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo_valid_in_bitsignaltemp,
        stall_in => redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_d,
        valid_out => redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo_valid_out_bitsignaltemp,
        stall_out => redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo_stall_out_bitsignaltemp,
        data_out => redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo(STALLFIFO,71)
    redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo_valid_in <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V4;
    redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo_stall_in <= SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_backStall;
    redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo_data_in <= bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_e;
    redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo_valid_in_bitsignaltemp <= redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo_valid_in(0);
    redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo_stall_in_bitsignaltemp <= redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo_stall_in(0);
    redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo_valid_out(0) <= redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo_valid_out_bitsignaltemp;
    redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo_stall_out(0) <= redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo_stall_out_bitsignaltemp;
    theredist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 200,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo_valid_in_bitsignaltemp,
        stall_in => redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_e,
        valid_out => redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo_valid_out_bitsignaltemp,
        stall_out => redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo_stall_out_bitsignaltemp,
        data_out => redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo(STALLFIFO,72)
    redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo_valid_in <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V5;
    redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo_stall_in <= SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_backStall;
    redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo_data_in <= bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_f;
    redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo_valid_in_bitsignaltemp <= redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo_valid_in(0);
    redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo_stall_in_bitsignaltemp <= redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo_stall_in(0);
    redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo_valid_out(0) <= redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo_valid_out_bitsignaltemp;
    redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo_stall_out(0) <= redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo_stall_out_bitsignaltemp;
    theredist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 200,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo_valid_in_bitsignaltemp,
        stall_in => redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_f,
        valid_out => redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo_valid_out_bitsignaltemp,
        stall_out => redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo_stall_out_bitsignaltemp,
        data_out => redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo(STALLFIFO,73)
    redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo_valid_in <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V6;
    redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo_stall_in <= SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_backStall;
    redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo_data_in <= bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_g;
    redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo_valid_in_bitsignaltemp <= redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo_valid_in(0);
    redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo_stall_in_bitsignaltemp <= redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo_stall_in(0);
    redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo_valid_out(0) <= redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo_valid_out_bitsignaltemp;
    redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo_stall_out(0) <= redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo_stall_out_bitsignaltemp;
    theredist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 200,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo_valid_in_bitsignaltemp,
        stall_in => redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_g,
        valid_out => redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo_valid_out_bitsignaltemp,
        stall_out => redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo_stall_out_bitsignaltemp,
        data_out => redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo(STALLFIFO,74)
    redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo_valid_in <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V7;
    redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo_stall_in <= SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_backStall;
    redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo_data_in <= bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_h;
    redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo_valid_in_bitsignaltemp <= redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo_valid_in(0);
    redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo_stall_in_bitsignaltemp <= redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo_stall_in(0);
    redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo_valid_out(0) <= redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo_valid_out_bitsignaltemp;
    redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo_stall_out(0) <= redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo_stall_out_bitsignaltemp;
    theredist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 200,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo_valid_in_bitsignaltemp,
        stall_in => redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_h,
        valid_out => redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo_valid_out_bitsignaltemp,
        stall_out => redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo_stall_out_bitsignaltemp,
        data_out => redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo(STALLFIFO,75)
    redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo_valid_in <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V8;
    redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo_stall_in <= SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_backStall;
    redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo_data_in <= bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_i;
    redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo_valid_in_bitsignaltemp <= redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo_valid_in(0);
    redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo_stall_in_bitsignaltemp <= redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo_stall_in(0);
    redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo_valid_out(0) <= redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo_valid_out_bitsignaltemp;
    redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo_stall_out(0) <= redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo_stall_out_bitsignaltemp;
    theredist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 200,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo_valid_in_bitsignaltemp,
        stall_in => redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_i,
        valid_out => redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo_valid_out_bitsignaltemp,
        stall_out => redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo_stall_out_bitsignaltemp,
        data_out => redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo(STALLFIFO,76)
    redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo_valid_in <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V9;
    redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo_stall_in <= SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_backStall;
    redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo_data_in <= bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_j;
    redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo_valid_in_bitsignaltemp <= redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo_valid_in(0);
    redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo_stall_in_bitsignaltemp <= redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo_stall_in(0);
    redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo_valid_out(0) <= redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo_valid_out_bitsignaltemp;
    redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo_stall_out(0) <= redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo_stall_out_bitsignaltemp;
    theredist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 200,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo_valid_in_bitsignaltemp,
        stall_in => redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_j,
        valid_out => redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo_valid_out_bitsignaltemp,
        stall_out => redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo_stall_out_bitsignaltemp,
        data_out => redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo(STALLFIFO,77)
    redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo_valid_in <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V10;
    redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo_stall_in <= SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_backStall;
    redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo_data_in <= bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_k;
    redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo_valid_in_bitsignaltemp <= redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo_valid_in(0);
    redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo_stall_in_bitsignaltemp <= redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo_stall_in(0);
    redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo_valid_out(0) <= redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo_valid_out_bitsignaltemp;
    redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo_stall_out(0) <= redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo_stall_out_bitsignaltemp;
    theredist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 200,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo_valid_in_bitsignaltemp,
        stall_in => redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_k,
        valid_out => redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo_valid_out_bitsignaltemp,
        stall_out => redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo_stall_out_bitsignaltemp,
        data_out => redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo(STALLFIFO,78)
    redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo_valid_in <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V11;
    redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo_stall_in <= SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_backStall;
    redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo_data_in <= bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_l;
    redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo_valid_in_bitsignaltemp <= redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo_valid_in(0);
    redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo_stall_in_bitsignaltemp <= redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo_stall_in(0);
    redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo_valid_out(0) <= redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo_valid_out_bitsignaltemp;
    redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo_stall_out(0) <= redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo_stall_out_bitsignaltemp;
    theredist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 200,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo_valid_in_bitsignaltemp,
        stall_in => redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_l,
        valid_out => redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo_valid_out_bitsignaltemp,
        stall_out => redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo_stall_out_bitsignaltemp,
        data_out => redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo(STALLFIFO,79)
    redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo_valid_in <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V12;
    redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo_stall_in <= SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_backStall;
    redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo_data_in <= bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_m;
    redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo_valid_in_bitsignaltemp <= redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo_valid_in(0);
    redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo_stall_in_bitsignaltemp <= redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo_stall_in(0);
    redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo_valid_out(0) <= redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo_valid_out_bitsignaltemp;
    redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo_stall_out(0) <= redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo_stall_out_bitsignaltemp;
    theredist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 200,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo_valid_in_bitsignaltemp,
        stall_in => redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_m,
        valid_out => redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo_valid_out_bitsignaltemp,
        stall_out => redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo_stall_out_bitsignaltemp,
        data_out => redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo(STALLFIFO,80)
    redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo_valid_in <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V13;
    redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo_stall_in <= SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_backStall;
    redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo_data_in <= bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_n;
    redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo_valid_in_bitsignaltemp <= redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo_valid_in(0);
    redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo_stall_in_bitsignaltemp <= redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo_stall_in(0);
    redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo_valid_out(0) <= redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo_valid_out_bitsignaltemp;
    redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo_stall_out(0) <= redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo_stall_out_bitsignaltemp;
    theredist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 200,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo_valid_in_bitsignaltemp,
        stall_in => redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_n,
        valid_out => redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo_valid_out_bitsignaltemp,
        stall_out => redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo_stall_out_bitsignaltemp,
        data_out => redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo(STALLFIFO,81)
    redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo_valid_in <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V14;
    redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo_stall_in <= SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_backStall;
    redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo_data_in <= bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_o;
    redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo_valid_in_bitsignaltemp <= redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo_valid_in(0);
    redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo_stall_in_bitsignaltemp <= redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo_stall_in(0);
    redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo_valid_out(0) <= redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo_valid_out_bitsignaltemp;
    redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo_stall_out(0) <= redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo_stall_out_bitsignaltemp;
    theredist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 200,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo_valid_in_bitsignaltemp,
        stall_in => redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_o,
        valid_out => redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo_valid_out_bitsignaltemp,
        stall_out => redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo_stall_out_bitsignaltemp,
        data_out => redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo(STALLFIFO,82)
    redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo_valid_in <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V15;
    redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo_stall_in <= SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_backStall;
    redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo_data_in <= bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_p;
    redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo_valid_in_bitsignaltemp <= redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo_valid_in(0);
    redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo_stall_in_bitsignaltemp <= redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo_stall_in(0);
    redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo_valid_out(0) <= redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo_valid_out_bitsignaltemp;
    redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo_stall_out(0) <= redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo_stall_out_bitsignaltemp;
    theredist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 200,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo_valid_in_bitsignaltemp,
        stall_in => redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_p,
        valid_out => redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo_valid_out_bitsignaltemp,
        stall_out => redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo_stall_out_bitsignaltemp,
        data_out => redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo(STALLFIFO,83)
    redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo_valid_in <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V16;
    redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo_stall_in <= SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_backStall;
    redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo_data_in <= bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_q;
    redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo_valid_in_bitsignaltemp <= redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo_valid_in(0);
    redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo_stall_in_bitsignaltemp <= redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo_stall_in(0);
    redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo_valid_out(0) <= redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo_valid_out_bitsignaltemp;
    redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo_stall_out(0) <= redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo_stall_out_bitsignaltemp;
    theredist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 200,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo_valid_in_bitsignaltemp,
        stall_in => redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_q,
        valid_out => redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo_valid_out_bitsignaltemp,
        stall_out => redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo_stall_out_bitsignaltemp,
        data_out => redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo(STALLFIFO,84)
    redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo_valid_in <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V17;
    redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo_stall_in <= SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_backStall;
    redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo_data_in <= bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_r;
    redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo_valid_in_bitsignaltemp <= redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo_valid_in(0);
    redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo_stall_in_bitsignaltemp <= redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo_stall_in(0);
    redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo_valid_out(0) <= redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo_valid_out_bitsignaltemp;
    redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo_stall_out(0) <= redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo_stall_out_bitsignaltemp;
    theredist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 200,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo_valid_in_bitsignaltemp,
        stall_in => redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_r,
        valid_out => redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo_valid_out_bitsignaltemp,
        stall_out => redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo_stall_out_bitsignaltemp,
        data_out => redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo(STALLFIFO,85)
    redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_valid_in <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V18;
    redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_stall_in <= SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_backStall;
    redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_data_in <= bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_s;
    redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_valid_in_bitsignaltemp <= redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_valid_in(0);
    redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_stall_in_bitsignaltemp <= redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_stall_in(0);
    redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_valid_out(0) <= redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_valid_out_bitsignaltemp;
    redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_stall_out(0) <= redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_stall_out_bitsignaltemp;
    theredist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 200,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_valid_in_bitsignaltemp,
        stall_in => redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_s,
        valid_out => redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_valid_out_bitsignaltemp,
        stall_out => redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_stall_out_bitsignaltemp,
        data_out => redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo(STALLENABLE,232)
    -- Valid signal propagation
    SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_V0 <= SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_backStall <= i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_stall or not (SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and0 <= redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_valid_out;
    SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and1 <= redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo_valid_out and SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and0;
    SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and2 <= redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo_valid_out and SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and1;
    SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and3 <= redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo_valid_out and SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and2;
    SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and4 <= redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo_valid_out and SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and3;
    SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and5 <= redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo_valid_out and SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and4;
    SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and6 <= redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo_valid_out and SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and5;
    SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and7 <= redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo_valid_out and SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and6;
    SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and8 <= redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo_valid_out and SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and7;
    SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and9 <= redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo_valid_out and SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and8;
    SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and10 <= redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo_valid_out and SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and9;
    SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and11 <= redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo_valid_out and SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and10;
    SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and12 <= redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo_valid_out and SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and11;
    SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and13 <= redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo_valid_out and SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and12;
    SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and14 <= redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo_valid_out and SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and13;
    SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and15 <= redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo_valid_out and SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and14;
    SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and16 <= redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo_valid_out and SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and15;
    SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_wireValid <= i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_valid and SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_and16;

    -- bubble_join_redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo(BITJOIN,113)
    bubble_join_redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo_q <= redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo_data_out;

    -- bubble_select_redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo(BITSELECT,114)
    bubble_select_redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo_q(1663 downto 0));

    -- bubble_join_redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo(BITJOIN,125)
    bubble_join_redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo_q <= redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo_data_out;

    -- bubble_select_redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo(BITSELECT,126)
    bubble_select_redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo_q(31 downto 0));

    -- bubble_join_redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo(BITJOIN,122)
    bubble_join_redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo_q <= redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo_data_out;

    -- bubble_select_redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo(BITSELECT,123)
    bubble_select_redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo_q(31 downto 0));

    -- bubble_join_redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo(BITJOIN,119)
    bubble_join_redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo_q <= redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo_data_out;

    -- bubble_select_redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo(BITSELECT,120)
    bubble_select_redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo_q(31 downto 0));

    -- bubble_join_redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo(BITJOIN,116)
    bubble_join_redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo_q <= redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo_data_out;

    -- bubble_select_redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo(BITSELECT,117)
    bubble_select_redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo_q(31 downto 0));

    -- bubble_join_redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo(BITJOIN,137)
    bubble_join_redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo_q <= redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo_data_out;

    -- bubble_select_redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo(BITSELECT,138)
    bubble_select_redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo_q(31 downto 0));

    -- bubble_join_redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo(BITJOIN,134)
    bubble_join_redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo_q <= redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo_data_out;

    -- bubble_select_redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo(BITSELECT,135)
    bubble_select_redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo_q(31 downto 0));

    -- bubble_join_redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo(BITJOIN,131)
    bubble_join_redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo_q <= redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo_data_out;

    -- bubble_select_redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo(BITSELECT,132)
    bubble_select_redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo_q(31 downto 0));

    -- bubble_join_redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo(BITJOIN,128)
    bubble_join_redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo_q <= redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo_data_out;

    -- bubble_select_redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo(BITSELECT,129)
    bubble_select_redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo_q(31 downto 0));

    -- bubble_join_redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo(BITJOIN,149)
    bubble_join_redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo_q <= redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo_data_out;

    -- bubble_select_redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo(BITSELECT,150)
    bubble_select_redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo_q(31 downto 0));

    -- bubble_join_redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo(BITJOIN,146)
    bubble_join_redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo_q <= redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo_data_out;

    -- bubble_select_redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo(BITSELECT,147)
    bubble_select_redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo_q(31 downto 0));

    -- bubble_join_redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo(BITJOIN,143)
    bubble_join_redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo_q <= redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo_data_out;

    -- bubble_select_redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo(BITSELECT,144)
    bubble_select_redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo_q(31 downto 0));

    -- bubble_join_redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo(BITJOIN,140)
    bubble_join_redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo_q <= redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo_data_out;

    -- bubble_select_redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo(BITSELECT,141)
    bubble_select_redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo_q(31 downto 0));

    -- bubble_join_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo(BITJOIN,161)
    bubble_join_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_q <= redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_data_out;

    -- bubble_select_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo(BITSELECT,162)
    bubble_select_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_q(31 downto 0));

    -- bubble_join_redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo(BITJOIN,158)
    bubble_join_redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo_q <= redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo_data_out;

    -- bubble_select_redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo(BITSELECT,159)
    bubble_select_redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo_q(31 downto 0));

    -- bubble_join_redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo(BITJOIN,155)
    bubble_join_redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo_q <= redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo_data_out;

    -- bubble_select_redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo(BITSELECT,156)
    bubble_select_redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo_q(31 downto 0));

    -- bubble_join_redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo(BITJOIN,152)
    bubble_join_redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo_q <= redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo_data_out;

    -- bubble_select_redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo(BITSELECT,153)
    bubble_select_redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo_q(31 downto 0));

    -- bubble_join_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x(BITJOIN,93)
    bubble_join_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_q <= i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_3_3 & i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_3_2 & i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_3_1 & i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_3_0 & i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_2_3 & i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_2_2 & i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_2_1 & i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_2_0 & i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_1_3 & i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_1_2 & i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_1_1 & i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_1_0 & i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_0_3 & i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_0_2 & i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_0_1 & i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_readdata_0_0;

    -- bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x(BITSELECT,94)
    bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_q(31 downto 0));
    bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_q(63 downto 32));
    bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_q(95 downto 64));
    bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_q(127 downto 96));
    bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_q(159 downto 128));
    bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_q(191 downto 160));
    bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_q(223 downto 192));
    bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_q(255 downto 224));
    bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_j <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_q(287 downto 256));
    bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_k <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_q(319 downto 288));
    bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_l <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_q(351 downto 320));
    bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_m <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_q(383 downto 352));
    bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_n <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_q(415 downto 384));
    bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_o <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_q(447 downto 416));
    bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_p <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_q(479 downto 448));
    bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_q <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_q(511 downto 480));

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x(BLACKBOX,4)@200
    -- in in_i_stall@20000000
    -- out out_c1_exit_0@206
    -- out out_c1_exit_1@206
    -- out out_c1_exit_2@206
    -- out out_c1_exit_3@206
    -- out out_c1_exit_4@206
    -- out out_c1_exit_5@206
    -- out out_c1_exit_6@206
    -- out out_c1_exit_7@206
    -- out out_c1_exit_8@206
    -- out out_c1_exit_9@206
    -- out out_c1_exit_10@206
    -- out out_c1_exit_11@206
    -- out out_c1_exit_12@206
    -- out out_c1_exit_13@206
    -- out out_c1_exit_14@206
    -- out out_c1_exit_15@206
    -- out out_c1_exit_16@206
    -- out out_c1_exit_17@206
    -- out out_c1_exit_18@206
    -- out out_c1_exit_19@206
    -- out out_c1_exit_20@206
    -- out out_o_stall@20000000
    -- out out_o_valid@206
    thei_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x : i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item
    PORT MAP (
        in_c1_eni18_0 => GND_q,
        in_c1_eni18_0_1 => bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_b,
        in_c1_eni18_0_2 => bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_c,
        in_c1_eni18_0_3 => bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_d,
        in_c1_eni18_0_4 => bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_e,
        in_c1_eni18_1_1 => bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_f,
        in_c1_eni18_1_2 => bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_g,
        in_c1_eni18_1_3 => bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_h,
        in_c1_eni18_1_4 => bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_i,
        in_c1_eni18_2_1 => bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_j,
        in_c1_eni18_2_2 => bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_k,
        in_c1_eni18_2_3 => bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_l,
        in_c1_eni18_2_4 => bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_m,
        in_c1_eni18_3_1 => bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_n,
        in_c1_eni18_3_2 => bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_o,
        in_c1_eni18_3_3 => bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_p,
        in_c1_eni18_3_4 => bubble_select_i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_q,
        in_c1_eni18_5 => bubble_select_redist14_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_14_199_fifo_b,
        in_c1_eni18_6 => bubble_select_redist15_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_15_199_fifo_b,
        in_c1_eni18_7 => bubble_select_redist16_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_16_199_fifo_b,
        in_c1_eni18_8 => bubble_select_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_b,
        in_c1_eni18_9 => bubble_select_redist10_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_10_199_fifo_b,
        in_c1_eni18_10 => bubble_select_redist11_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_11_199_fifo_b,
        in_c1_eni18_11 => bubble_select_redist12_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_12_199_fifo_b,
        in_c1_eni18_12 => bubble_select_redist13_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_13_199_fifo_b,
        in_c1_eni18_13 => bubble_select_redist6_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_6_199_fifo_b,
        in_c1_eni18_14 => bubble_select_redist7_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_7_199_fifo_b,
        in_c1_eni18_15 => bubble_select_redist8_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_8_199_fifo_b,
        in_c1_eni18_16 => bubble_select_redist9_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_9_199_fifo_b,
        in_c1_eni18_17 => bubble_select_redist2_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_2_199_fifo_b,
        in_c1_eni18_18 => bubble_select_redist3_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_3_199_fifo_b,
        in_c1_eni18_19 => bubble_select_redist4_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_4_199_fifo_b,
        in_c1_eni18_20 => bubble_select_redist5_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_5_199_fifo_b,
        in_c1_eni18_21 => bubble_select_redist1_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_1_199_fifo_b,
        in_i_stall => SE_out_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_backStall,
        in_i_valid => SE_out_redist17_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_17_199_fifo_V0,
        out_c1_exit_0 => i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_0,
        out_c1_exit_1 => i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_1,
        out_c1_exit_2 => i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_2,
        out_c1_exit_3 => i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_3,
        out_c1_exit_4 => i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_4,
        out_c1_exit_5 => i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_5,
        out_c1_exit_6 => i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_6,
        out_c1_exit_7 => i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_7,
        out_c1_exit_8 => i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_8,
        out_c1_exit_9 => i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_9,
        out_c1_exit_10 => i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_10,
        out_c1_exit_11 => i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_11,
        out_c1_exit_12 => i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_12,
        out_c1_exit_13 => i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_13,
        out_c1_exit_14 => i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_14,
        out_c1_exit_15 => i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_15,
        out_c1_exit_16 => i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_16,
        out_c1_exit_17 => i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_17,
        out_c1_exit_18 => i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_18,
        out_c1_exit_19 => i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_19,
        out_c1_exit_20 => i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_20,
        out_o_stall => i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_stall,
        out_o_valid => i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo(STALLFIFO,68)
    redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo_valid_in <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V1;
    redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo_stall_in <= SE_out_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_backStall;
    redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo_data_in <= bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_b;
    redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo_valid_in_bitsignaltemp <= redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo_valid_in(0);
    redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo_stall_in_bitsignaltemp <= redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo_stall_in(0);
    redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo_valid_out(0) <= redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo_valid_out_bitsignaltemp;
    redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo_stall_out(0) <= redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo_stall_out_bitsignaltemp;
    theredist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 206,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 9,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo_valid_in_bitsignaltemp,
        stall_in => redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_b,
        valid_out => redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo_valid_out_bitsignaltemp,
        stall_out => redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo_stall_out_bitsignaltemp,
        data_out => redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo(STALLFIFO,86)
    redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo_valid_in <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V19;
    redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo_stall_in <= SE_out_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_backStall;
    redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo_data_in <= bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_u;
    redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo_valid_in_bitsignaltemp <= redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo_valid_in(0);
    redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo_stall_in_bitsignaltemp <= redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo_stall_in(0);
    redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo_valid_out(0) <= redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo_valid_out_bitsignaltemp;
    redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo_stall_out(0) <= redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo_stall_out_bitsignaltemp;
    theredist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 206,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo_valid_in_bitsignaltemp,
        stall_in => redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_u,
        valid_out => redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo_valid_out_bitsignaltemp,
        stall_out => redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo_stall_out_bitsignaltemp,
        data_out => redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo(STALLFIFO,87)
    redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo_valid_in <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V20;
    redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo_stall_in <= SE_out_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_backStall;
    redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo_data_in <= bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_v;
    redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo_valid_in_bitsignaltemp <= redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo_valid_in(0);
    redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo_stall_in_bitsignaltemp <= redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo_stall_in(0);
    redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo_valid_out(0) <= redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo_valid_out_bitsignaltemp;
    redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo_stall_out(0) <= redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo_stall_out_bitsignaltemp;
    theredist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 206,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo_valid_in_bitsignaltemp,
        stall_in => redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_v,
        valid_out => redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo_valid_out_bitsignaltemp,
        stall_out => redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo_stall_out_bitsignaltemp,
        data_out => redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo(STALLFIFO,89)
    redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo_valid_in <= SE_out_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_V1;
    redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo_stall_in <= SE_out_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_backStall;
    redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo_data_in <= bubble_select_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_b;
    redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo_valid_in_bitsignaltemp <= redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo_valid_in(0);
    redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo_stall_in_bitsignaltemp <= redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo_stall_in(0);
    redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo_valid_out(0) <= redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo_valid_out_bitsignaltemp;
    redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo_stall_out(0) <= redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo_stall_out_bitsignaltemp;
    theredist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 168,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo_valid_in_bitsignaltemp,
        stall_in => redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist20_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_38_fifo_b,
        valid_out => redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo_valid_out_bitsignaltemp,
        stall_out => redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo_stall_out_bitsignaltemp,
        data_out => redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo(STALLFIFO,90)
    redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo_valid_in <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V22;
    redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo_stall_in <= SE_out_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_backStall;
    redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo_data_in <= bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_x;
    redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo_valid_in_bitsignaltemp <= redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo_valid_in(0);
    redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo_stall_in_bitsignaltemp <= redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo_stall_in(0);
    redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo_valid_out(0) <= redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo_valid_out_bitsignaltemp;
    redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo_stall_out(0) <= redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo_stall_out_bitsignaltemp;
    theredist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 206,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo_valid_in_bitsignaltemp,
        stall_in => redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_x,
        valid_out => redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo_valid_out_bitsignaltemp,
        stall_out => redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo_stall_out_bitsignaltemp,
        data_out => redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- c_i32_1gr(CONSTANT,20)
    c_i32_1gr_q <= "00000000000000000000000000000001";

    -- i_inc43_ethash_calculate_dag_item(ADD,29)@1
    i_inc43_ethash_calculate_dag_item_a <= STD_LOGIC_VECTOR("0" & bubble_select_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_t);
    i_inc43_ethash_calculate_dag_item_b <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_inc43_ethash_calculate_dag_item_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc43_ethash_calculate_dag_item_a) + UNSIGNED(i_inc43_ethash_calculate_dag_item_b));
    i_inc43_ethash_calculate_dag_item_q <= i_inc43_ethash_calculate_dag_item_o(32 downto 0);

    -- bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x(BITSELECT,6)@1
    bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b <= i_inc43_ethash_calculate_dag_item_q(31 downto 0);

    -- redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo(STALLFIFO,91)
    redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_valid_in <= SE_out_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_V23;
    redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_stall_in <= SE_out_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_backStall;
    redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_data_in <= bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b;
    redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_valid_in_bitsignaltemp <= redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_valid_in(0);
    redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_stall_in_bitsignaltemp <= redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_stall_in(0);
    redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_valid_out(0) <= redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_valid_out_bitsignaltemp;
    redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_stall_out(0) <= redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_stall_out_bitsignaltemp;
    theredist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 206,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_valid_in_bitsignaltemp,
        stall_in => redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_stall_in_bitsignaltemp,
        data_in => bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b,
        valid_out => redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_valid_out_bitsignaltemp,
        stall_out => redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_stall_out_bitsignaltemp,
        data_out => redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo(STALLENABLE,244)
    -- Valid signal propagation
    SE_out_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_V0 <= SE_out_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_backStall <= in_stall_in or not (SE_out_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_and0 <= redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_valid_out;
    SE_out_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_and1 <= redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo_valid_out and SE_out_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_and0;
    SE_out_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_and2 <= redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo_valid_out and SE_out_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_and1;
    SE_out_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_and3 <= redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo_valid_out and SE_out_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_and2;
    SE_out_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_and4 <= redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo_valid_out and SE_out_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_and3;
    SE_out_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_and5 <= redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo_valid_out and SE_out_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_and4;
    SE_out_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_wireValid <= i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_valid and SE_out_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_and5;

    -- bubble_join_redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo(BITJOIN,110)
    bubble_join_redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo_q <= redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo_data_out;

    -- bubble_select_redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo(BITSELECT,111)
    bubble_select_redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo_q(8 downto 0));

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- i_exitcond_ethash_calculate_dag_item_cmp_sign(LOGICAL,42)@206
    i_exitcond_ethash_calculate_dag_item_cmp_sign_q <= STD_LOGIC_VECTOR(bubble_select_redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo_b(8 downto 8));

    -- i_unnamed_ethash_calculate_dag_item330(LOGICAL,30)@206
    i_unnamed_ethash_calculate_dag_item330_q <= bubble_select_redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo_b or i_exitcond_ethash_calculate_dag_item_cmp_sign_q;

    -- bubble_join_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo(BITJOIN,179)
    bubble_join_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_q <= redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_data_out;

    -- bubble_select_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo(BITSELECT,180)
    bubble_select_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_q(31 downto 0));

    -- c_i9_1gr(CONSTANT,22)
    c_i9_1gr_q <= "111111111";

    -- i_fpgaindvars_iv_next_ethash_calculate_dag_item(ADD,28)@206
    i_fpgaindvars_iv_next_ethash_calculate_dag_item_a <= STD_LOGIC_VECTOR("0" & bubble_select_redist0_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_0_205_fifo_b);
    i_fpgaindvars_iv_next_ethash_calculate_dag_item_b <= STD_LOGIC_VECTOR("0" & c_i9_1gr_q);
    i_fpgaindvars_iv_next_ethash_calculate_dag_item_o <= STD_LOGIC_VECTOR(UNSIGNED(i_fpgaindvars_iv_next_ethash_calculate_dag_item_a) + UNSIGNED(i_fpgaindvars_iv_next_ethash_calculate_dag_item_b));
    i_fpgaindvars_iv_next_ethash_calculate_dag_item_q <= i_fpgaindvars_iv_next_ethash_calculate_dag_item_o(9 downto 0);

    -- bgTrunc_i_fpgaindvars_iv_next_ethash_calculate_dag_item_sel_x(BITSELECT,5)@206
    bgTrunc_i_fpgaindvars_iv_next_ethash_calculate_dag_item_sel_x_b <= i_fpgaindvars_iv_next_ethash_calculate_dag_item_q(8 downto 0);

    -- bubble_join_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x(BITJOIN,96)
    bubble_join_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_q <= i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_20 & i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_19 & i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_18 & i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_17 & i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_16 & i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_15 & i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_14 & i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_13 & i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_12 & i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_11 & i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_10 & i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_9 & i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_8 & i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_7 & i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_6 & i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_5 & i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_4 & i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_3 & i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_2 & i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_1 & i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_out_c1_exit_0;

    -- bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x(BITSELECT,97)
    bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_q(0 downto 0));
    bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_q(32 downto 1));
    bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_q(64 downto 33));
    bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_q(96 downto 65));
    bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_q(128 downto 97));
    bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_q(160 downto 129));
    bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_q(192 downto 161));
    bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_q(224 downto 193));
    bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_j <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_q(256 downto 225));
    bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_k <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_q(384 downto 257));
    bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_l <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_q(416 downto 385));
    bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_m <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_q(448 downto 417));
    bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_n <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_q(480 downto 449));
    bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_o <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_q(512 downto 481));
    bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_p <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_q(640 downto 513));
    bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_q <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_q(672 downto 641));
    bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_r <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_q(704 downto 673));
    bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_s <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_q(736 downto 705));
    bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_t <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_q(768 downto 737));
    bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_u <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_q(896 downto 769));
    bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_v <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_q(2560 downto 897));

    -- bubble_join_redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo(BITJOIN,173)
    bubble_join_redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo_q <= redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo_data_out;

    -- bubble_select_redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo(BITSELECT,174)
    bubble_select_redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo_q(0 downto 0));

    -- bubble_join_redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo(BITJOIN,164)
    bubble_join_redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo_q <= redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo_data_out;

    -- bubble_select_redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo(BITSELECT,165)
    bubble_select_redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo_q(31 downto 0));

    -- bubble_join_redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo(BITJOIN,167)
    bubble_join_redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo_q <= redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo_data_out;

    -- bubble_select_redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo(BITSELECT,168)
    bubble_select_redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo_q(0 downto 0));

    -- bubble_join_redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo(BITJOIN,176)
    bubble_join_redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo_q <= redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo_data_out;

    -- bubble_select_redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo(BITSELECT,177)
    bubble_select_redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo_q(31 downto 0));

    -- dupName_0_sync_out_aunroll_x(GPOUT,2)@206
    out_acl_hw_wg_id41 <= bubble_select_redist22_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_22_205_fifo_b;
    out_c0_exe11221 <= bubble_select_redist19_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_20_205_fifo_b;
    out_c0_exe114 <= bubble_select_redist18_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_19_205_fifo_b;
    out_c0_exe21326 <= bubble_select_redist21_ethash_calculate_dag_item_B3_merge_reg_aunroll_x_out_data_out_21_205_fifo_b;
    out_c1_exe1 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_c;
    out_c1_exe10 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_l;
    out_c1_exe11 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_m;
    out_c1_exe12 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_n;
    out_c1_exe13 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_o;
    out_c1_exe15 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_q;
    out_c1_exe16 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_r;
    out_c1_exe17 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_s;
    out_c1_exe18 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_t;
    out_c1_exe2 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_d;
    out_c1_exe20 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_v;
    out_c1_exe3 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_e;
    out_c1_exe4 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_f;
    out_c1_exe5 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_g;
    out_c1_exe6 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_h;
    out_c1_exe7 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_i;
    out_c1_exe8 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_j;
    out_c1_exit_0 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_b;
    out_c1_exit_1 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_c;
    out_c1_exit_2 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_d;
    out_c1_exit_3 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_e;
    out_c1_exit_4 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_f;
    out_c1_exit_5 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_g;
    out_c1_exit_6 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_h;
    out_c1_exit_7 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_i;
    out_c1_exit_8 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_j;
    out_c1_exit_9 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_k;
    out_c1_exit_10 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_l;
    out_c1_exit_11 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_m;
    out_c1_exit_12 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_n;
    out_c1_exit_13 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_o;
    out_c1_exit_14 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_p;
    out_c1_exit_15 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_q;
    out_c1_exit_16 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_r;
    out_c1_exit_17 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_s;
    out_c1_exit_18 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_t;
    out_c1_exit_19 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_u;
    out_c1_exit_20 <= bubble_select_i_sfc_c1_for_body15_ethash_calculate_dag_item_c1_enter_ethash_calculate_dag_item_aunroll_vunroll_x_v;
    out_fpgaindvars_iv_next <= bgTrunc_i_fpgaindvars_iv_next_ethash_calculate_dag_item_sel_x_b;
    out_inc43 <= bubble_select_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_b;
    out_unnamed_ethash_calculate_dag_item7 <= i_unnamed_ethash_calculate_dag_item330_q;
    out_valid_out <= SE_out_redist23_bgTrunc_i_inc43_ethash_calculate_dag_item_sel_x_b_205_fifo_V0;

    -- ext_sig_sync_out(GPOUT,26)
    out_memcoalesce_g_light_load_02193_avm_address <= i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_memcoalesce_g_light_load_02193_avm_address;
    out_memcoalesce_g_light_load_02193_avm_enable <= i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_memcoalesce_g_light_load_02193_avm_enable;
    out_memcoalesce_g_light_load_02193_avm_read <= i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_memcoalesce_g_light_load_02193_avm_read;
    out_memcoalesce_g_light_load_02193_avm_write <= i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_memcoalesce_g_light_load_02193_avm_write;
    out_memcoalesce_g_light_load_02193_avm_writedata <= i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_memcoalesce_g_light_load_02193_avm_writedata;
    out_memcoalesce_g_light_load_02193_avm_byteenable <= i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_memcoalesce_g_light_load_02193_avm_byteenable;
    out_memcoalesce_g_light_load_02193_avm_burstcount <= i_load_memcoalesce_g_light_load_02193_ethash_calculate_dag_item_aunroll_vunroll_x_out_memcoalesce_g_light_load_02193_avm_burstcount;

    -- sync_out(GPOUT,39)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
