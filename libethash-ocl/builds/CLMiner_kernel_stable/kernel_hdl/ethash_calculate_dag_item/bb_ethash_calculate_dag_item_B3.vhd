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

-- VHDL created from bb_ethash_calculate_dag_item_B3
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

entity bb_ethash_calculate_dag_item_B3 is
    port (
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
        out_fpgaindvars_iv_next : out std_logic_vector(8 downto 0);  -- ufix9
        out_inc43 : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_g_light_load_02193_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        out_memcoalesce_g_light_load_02193_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_memcoalesce_g_light_load_02193_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_memcoalesce_g_light_load_02193_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_g_light_load_02193_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_g_light_load_02193_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_g_light_load_02193_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        in_acl_hw_wg_id41_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_hw_wg_id41_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe11221_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe11221_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe114_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe114_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe21326_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe21326_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_dag_node_pm_1_0 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_dag_node_pm_1_1 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_fpgaindvars_iv_0 : in std_logic_vector(8 downto 0);  -- ufix9
        in_fpgaindvars_iv_1 : in std_logic_vector(8 downto 0);  -- ufix9
        in_g_dag : in std_logic_vector(63 downto 0);  -- ufix64
        in_g_light : in std_logic_vector(63 downto 0);  -- ufix64
        in_i11_0687_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i11_0687_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_memcoalesce_g_light_load_02193_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_memcoalesce_g_light_load_02193_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_g_light_load_02193_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_g_light_load_02193_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_scalarizer_01585_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01585_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01587_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01587_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01591_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01591_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01595_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01595_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11586_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11586_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11588_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11588_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11592_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11592_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11596_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11596_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_21589_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_21589_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_21593_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_21593_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_21597_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_21597_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_2_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_2_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_31590_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_31590_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_31594_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_31594_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_31598_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_31598_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_3_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_3_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_ethash_calculate_dag_item_B3;

architecture normal of bb_ethash_calculate_dag_item_B3 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component ethash_calculate_dag_item_B3_branch is
        port (
            in_c1_exit_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit_9 : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_c1_exit_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit_12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit_14 : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_c1_exit_15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit_16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit_17 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit_18 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit_19 : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_c1_exit_20 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_acl_hw_wg_id41 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe11221 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe114 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe21326 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe17 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe18 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe20 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_c1_exe3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_fpgaindvars_iv_next : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_inc43 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_calculate_dag_item7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_acl_hw_wg_id41 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe11221 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe114 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe21326 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe20 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_c1_exe3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_fpgaindvars_iv_next : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_inc43 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_calculate_dag_item_B3_stall_region is
        port (
            in_acl_hw_wg_id41 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe11221 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe114 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe21326 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dag_node_pm_1 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_fpgaindvars_iv : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_g_light : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i11_0687 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memcoalesce_g_light_load_02193_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_memcoalesce_g_light_load_02193_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_g_light_load_02193_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_g_light_load_02193_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_scalarizer_01585 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01587 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01591 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01595 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11586 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11588 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11592 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11596 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_21589 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_21593 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_21597 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_31590 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_31594 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_31598 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_acl_hw_wg_id41 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe11221 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe114 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe21326 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe20 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_c1_exe3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_fpgaindvars_iv_next : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_inc43 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_02193_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_02193_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_02193_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_02193_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_02193_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_02193_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_02193_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_calculate_dag_item7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component ethash_calculate_dag_item_B3_merge is
        port (
            in_acl_hw_wg_id41_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_hw_wg_id41_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe11221_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe11221_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe114_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe114_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe21326_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe21326_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dag_node_pm_1_0 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_dag_node_pm_1_1 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_fpgaindvars_iv_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_fpgaindvars_iv_1 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_i11_0687_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i11_0687_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01585_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01585_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01587_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01587_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01591_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01591_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01595_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01595_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11586_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11586_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11588_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11588_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11592_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11592_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11596_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11596_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_21589_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_21589_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_21593_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_21593_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_21597_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_21597_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_2_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_2_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_31590_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_31590_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_31594_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_31594_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_31598_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_31598_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_3_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_3_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_hw_wg_id41 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe11221 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe114 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe21326 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_dag_node_pm_1 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_fpgaindvars_iv : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_i11_0687 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01585 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01587 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01591 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01595 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11586 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11588 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11592 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11596 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_21589 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_21593 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_21597 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_31590 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_31594 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_31598 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_9 : STD_LOGIC_VECTOR (127 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_14 : STD_LOGIC_VECTOR (127 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_19 : STD_LOGIC_VECTOR (127 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_20 : STD_LOGIC_VECTOR (1663 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_acl_hw_wg_id41 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c0_exe11221 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c0_exe114 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c0_exe21326 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe10 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe11 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe12 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe13 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe15 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe16 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe17 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe18 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe20 : STD_LOGIC_VECTOR (1663 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe4 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe5 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe6 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe7 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe8 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_fpgaindvars_iv_next : STD_LOGIC_VECTOR (8 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_inc43 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B3_branch_aunroll_x_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_9 : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_14 : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_19 : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_20 : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_acl_hw_wg_id41 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c0_exe11221 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c0_exe114 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c0_exe21326 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe17 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe18 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe20 : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_fpgaindvars_iv_next : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_inc43 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_memcoalesce_g_light_load_02193_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_memcoalesce_g_light_load_02193_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_memcoalesce_g_light_load_02193_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_memcoalesce_g_light_load_02193_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_memcoalesce_g_light_load_02193_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_memcoalesce_g_light_load_02193_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_memcoalesce_g_light_load_02193_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_unnamed_ethash_calculate_dag_item7 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B3_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B3_merge_out_acl_hw_wg_id41 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_out_c0_exe11221 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B3_merge_out_c0_exe114 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_out_c0_exe21326 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B3_merge_out_dag_node_pm_1 : STD_LOGIC_VECTOR (1663 downto 0);
    signal ethash_calculate_dag_item_B3_merge_out_fpgaindvars_iv : STD_LOGIC_VECTOR (8 downto 0);
    signal ethash_calculate_dag_item_B3_merge_out_i11_0687 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_out_scalarizer_01585 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_out_scalarizer_01587 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_out_scalarizer_01591 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_out_scalarizer_01595 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_out_scalarizer_11586 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_out_scalarizer_11588 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_out_scalarizer_11592 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_out_scalarizer_11596 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_out_scalarizer_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_out_scalarizer_21589 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_out_scalarizer_21593 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_out_scalarizer_21597 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_out_scalarizer_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_out_scalarizer_31590 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_out_scalarizer_31594 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_out_scalarizer_31598 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B3_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B3_merge_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B3_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- ethash_calculate_dag_item_B3_merge(BLACKBOX,59)
    theethash_calculate_dag_item_B3_merge : ethash_calculate_dag_item_B3_merge
    PORT MAP (
        in_acl_hw_wg_id41_0 => in_acl_hw_wg_id41_0,
        in_acl_hw_wg_id41_1 => in_acl_hw_wg_id41_1,
        in_c0_exe11221_0 => in_c0_exe11221_0,
        in_c0_exe11221_1 => in_c0_exe11221_1,
        in_c0_exe114_0 => in_c0_exe114_0,
        in_c0_exe114_1 => in_c0_exe114_1,
        in_c0_exe21326_0 => in_c0_exe21326_0,
        in_c0_exe21326_1 => in_c0_exe21326_1,
        in_dag_node_pm_1_0 => in_dag_node_pm_1_0,
        in_dag_node_pm_1_1 => in_dag_node_pm_1_1,
        in_fpgaindvars_iv_0 => in_fpgaindvars_iv_0,
        in_fpgaindvars_iv_1 => in_fpgaindvars_iv_1,
        in_i11_0687_0 => in_i11_0687_0,
        in_i11_0687_1 => in_i11_0687_1,
        in_scalarizer_01585_0 => in_scalarizer_01585_0,
        in_scalarizer_01585_1 => in_scalarizer_01585_1,
        in_scalarizer_01587_0 => in_scalarizer_01587_0,
        in_scalarizer_01587_1 => in_scalarizer_01587_1,
        in_scalarizer_01591_0 => in_scalarizer_01591_0,
        in_scalarizer_01591_1 => in_scalarizer_01591_1,
        in_scalarizer_01595_0 => in_scalarizer_01595_0,
        in_scalarizer_01595_1 => in_scalarizer_01595_1,
        in_scalarizer_11586_0 => in_scalarizer_11586_0,
        in_scalarizer_11586_1 => in_scalarizer_11586_1,
        in_scalarizer_11588_0 => in_scalarizer_11588_0,
        in_scalarizer_11588_1 => in_scalarizer_11588_1,
        in_scalarizer_11592_0 => in_scalarizer_11592_0,
        in_scalarizer_11592_1 => in_scalarizer_11592_1,
        in_scalarizer_11596_0 => in_scalarizer_11596_0,
        in_scalarizer_11596_1 => in_scalarizer_11596_1,
        in_scalarizer_21589_0 => in_scalarizer_21589_0,
        in_scalarizer_21589_1 => in_scalarizer_21589_1,
        in_scalarizer_21593_0 => in_scalarizer_21593_0,
        in_scalarizer_21593_1 => in_scalarizer_21593_1,
        in_scalarizer_21597_0 => in_scalarizer_21597_0,
        in_scalarizer_21597_1 => in_scalarizer_21597_1,
        in_scalarizer_2_0 => in_scalarizer_2_0,
        in_scalarizer_2_1 => in_scalarizer_2_1,
        in_scalarizer_31590_0 => in_scalarizer_31590_0,
        in_scalarizer_31590_1 => in_scalarizer_31590_1,
        in_scalarizer_31594_0 => in_scalarizer_31594_0,
        in_scalarizer_31594_1 => in_scalarizer_31594_1,
        in_scalarizer_31598_0 => in_scalarizer_31598_0,
        in_scalarizer_31598_1 => in_scalarizer_31598_1,
        in_scalarizer_3_0 => in_scalarizer_3_0,
        in_scalarizer_3_1 => in_scalarizer_3_1,
        in_stall_in => bb_ethash_calculate_dag_item_B3_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        out_acl_hw_wg_id41 => ethash_calculate_dag_item_B3_merge_out_acl_hw_wg_id41,
        out_c0_exe11221 => ethash_calculate_dag_item_B3_merge_out_c0_exe11221,
        out_c0_exe114 => ethash_calculate_dag_item_B3_merge_out_c0_exe114,
        out_c0_exe21326 => ethash_calculate_dag_item_B3_merge_out_c0_exe21326,
        out_dag_node_pm_1 => ethash_calculate_dag_item_B3_merge_out_dag_node_pm_1,
        out_fpgaindvars_iv => ethash_calculate_dag_item_B3_merge_out_fpgaindvars_iv,
        out_i11_0687 => ethash_calculate_dag_item_B3_merge_out_i11_0687,
        out_scalarizer_01585 => ethash_calculate_dag_item_B3_merge_out_scalarizer_01585,
        out_scalarizer_01587 => ethash_calculate_dag_item_B3_merge_out_scalarizer_01587,
        out_scalarizer_01591 => ethash_calculate_dag_item_B3_merge_out_scalarizer_01591,
        out_scalarizer_01595 => ethash_calculate_dag_item_B3_merge_out_scalarizer_01595,
        out_scalarizer_11586 => ethash_calculate_dag_item_B3_merge_out_scalarizer_11586,
        out_scalarizer_11588 => ethash_calculate_dag_item_B3_merge_out_scalarizer_11588,
        out_scalarizer_11592 => ethash_calculate_dag_item_B3_merge_out_scalarizer_11592,
        out_scalarizer_11596 => ethash_calculate_dag_item_B3_merge_out_scalarizer_11596,
        out_scalarizer_2 => ethash_calculate_dag_item_B3_merge_out_scalarizer_2,
        out_scalarizer_21589 => ethash_calculate_dag_item_B3_merge_out_scalarizer_21589,
        out_scalarizer_21593 => ethash_calculate_dag_item_B3_merge_out_scalarizer_21593,
        out_scalarizer_21597 => ethash_calculate_dag_item_B3_merge_out_scalarizer_21597,
        out_scalarizer_3 => ethash_calculate_dag_item_B3_merge_out_scalarizer_3,
        out_scalarizer_31590 => ethash_calculate_dag_item_B3_merge_out_scalarizer_31590,
        out_scalarizer_31594 => ethash_calculate_dag_item_B3_merge_out_scalarizer_31594,
        out_scalarizer_31598 => ethash_calculate_dag_item_B3_merge_out_scalarizer_31598,
        out_stall_out_0 => ethash_calculate_dag_item_B3_merge_out_stall_out_0,
        out_stall_out_1 => ethash_calculate_dag_item_B3_merge_out_stall_out_1,
        out_valid_out => ethash_calculate_dag_item_B3_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_calculate_dag_item_B3_stall_region(BLACKBOX,58)
    thebb_ethash_calculate_dag_item_B3_stall_region : bb_ethash_calculate_dag_item_B3_stall_region
    PORT MAP (
        in_acl_hw_wg_id41 => ethash_calculate_dag_item_B3_merge_out_acl_hw_wg_id41,
        in_c0_exe11221 => ethash_calculate_dag_item_B3_merge_out_c0_exe11221,
        in_c0_exe114 => ethash_calculate_dag_item_B3_merge_out_c0_exe114,
        in_c0_exe21326 => ethash_calculate_dag_item_B3_merge_out_c0_exe21326,
        in_dag_node_pm_1 => ethash_calculate_dag_item_B3_merge_out_dag_node_pm_1,
        in_flush => in_flush,
        in_fpgaindvars_iv => ethash_calculate_dag_item_B3_merge_out_fpgaindvars_iv,
        in_g_light => in_g_light,
        in_i11_0687 => ethash_calculate_dag_item_B3_merge_out_i11_0687,
        in_memcoalesce_g_light_load_02193_avm_readdata => in_memcoalesce_g_light_load_02193_avm_readdata,
        in_memcoalesce_g_light_load_02193_avm_readdatavalid => in_memcoalesce_g_light_load_02193_avm_readdatavalid,
        in_memcoalesce_g_light_load_02193_avm_waitrequest => in_memcoalesce_g_light_load_02193_avm_waitrequest,
        in_memcoalesce_g_light_load_02193_avm_writeack => in_memcoalesce_g_light_load_02193_avm_writeack,
        in_scalarizer_01585 => ethash_calculate_dag_item_B3_merge_out_scalarizer_01585,
        in_scalarizer_01587 => ethash_calculate_dag_item_B3_merge_out_scalarizer_01587,
        in_scalarizer_01591 => ethash_calculate_dag_item_B3_merge_out_scalarizer_01591,
        in_scalarizer_01595 => ethash_calculate_dag_item_B3_merge_out_scalarizer_01595,
        in_scalarizer_11586 => ethash_calculate_dag_item_B3_merge_out_scalarizer_11586,
        in_scalarizer_11588 => ethash_calculate_dag_item_B3_merge_out_scalarizer_11588,
        in_scalarizer_11592 => ethash_calculate_dag_item_B3_merge_out_scalarizer_11592,
        in_scalarizer_11596 => ethash_calculate_dag_item_B3_merge_out_scalarizer_11596,
        in_scalarizer_2 => ethash_calculate_dag_item_B3_merge_out_scalarizer_2,
        in_scalarizer_21589 => ethash_calculate_dag_item_B3_merge_out_scalarizer_21589,
        in_scalarizer_21593 => ethash_calculate_dag_item_B3_merge_out_scalarizer_21593,
        in_scalarizer_21597 => ethash_calculate_dag_item_B3_merge_out_scalarizer_21597,
        in_scalarizer_3 => ethash_calculate_dag_item_B3_merge_out_scalarizer_3,
        in_scalarizer_31590 => ethash_calculate_dag_item_B3_merge_out_scalarizer_31590,
        in_scalarizer_31594 => ethash_calculate_dag_item_B3_merge_out_scalarizer_31594,
        in_scalarizer_31598 => ethash_calculate_dag_item_B3_merge_out_scalarizer_31598,
        in_stall_in => ethash_calculate_dag_item_B3_branch_aunroll_x_out_stall_out,
        in_valid_in => ethash_calculate_dag_item_B3_merge_out_valid_out,
        out_c1_exit_0 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_0,
        out_c1_exit_1 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_1,
        out_c1_exit_2 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_2,
        out_c1_exit_3 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_3,
        out_c1_exit_4 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_4,
        out_c1_exit_5 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_5,
        out_c1_exit_6 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_6,
        out_c1_exit_7 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_7,
        out_c1_exit_8 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_8,
        out_c1_exit_9 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_9,
        out_c1_exit_10 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_10,
        out_c1_exit_11 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_11,
        out_c1_exit_12 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_12,
        out_c1_exit_13 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_13,
        out_c1_exit_14 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_14,
        out_c1_exit_15 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_15,
        out_c1_exit_16 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_16,
        out_c1_exit_17 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_17,
        out_c1_exit_18 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_18,
        out_c1_exit_19 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_19,
        out_c1_exit_20 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_20,
        out_acl_hw_wg_id41 => bb_ethash_calculate_dag_item_B3_stall_region_out_acl_hw_wg_id41,
        out_c0_exe11221 => bb_ethash_calculate_dag_item_B3_stall_region_out_c0_exe11221,
        out_c0_exe114 => bb_ethash_calculate_dag_item_B3_stall_region_out_c0_exe114,
        out_c0_exe21326 => bb_ethash_calculate_dag_item_B3_stall_region_out_c0_exe21326,
        out_c1_exe1 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe1,
        out_c1_exe10 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe10,
        out_c1_exe11 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe11,
        out_c1_exe12 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe12,
        out_c1_exe13 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe13,
        out_c1_exe15 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe15,
        out_c1_exe16 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe16,
        out_c1_exe17 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe17,
        out_c1_exe18 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe18,
        out_c1_exe2 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe2,
        out_c1_exe20 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe20,
        out_c1_exe3 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe3,
        out_c1_exe4 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe4,
        out_c1_exe5 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe5,
        out_c1_exe6 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe6,
        out_c1_exe7 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe7,
        out_c1_exe8 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe8,
        out_fpgaindvars_iv_next => bb_ethash_calculate_dag_item_B3_stall_region_out_fpgaindvars_iv_next,
        out_inc43 => bb_ethash_calculate_dag_item_B3_stall_region_out_inc43,
        out_memcoalesce_g_light_load_02193_avm_address => bb_ethash_calculate_dag_item_B3_stall_region_out_memcoalesce_g_light_load_02193_avm_address,
        out_memcoalesce_g_light_load_02193_avm_burstcount => bb_ethash_calculate_dag_item_B3_stall_region_out_memcoalesce_g_light_load_02193_avm_burstcount,
        out_memcoalesce_g_light_load_02193_avm_byteenable => bb_ethash_calculate_dag_item_B3_stall_region_out_memcoalesce_g_light_load_02193_avm_byteenable,
        out_memcoalesce_g_light_load_02193_avm_enable => bb_ethash_calculate_dag_item_B3_stall_region_out_memcoalesce_g_light_load_02193_avm_enable,
        out_memcoalesce_g_light_load_02193_avm_read => bb_ethash_calculate_dag_item_B3_stall_region_out_memcoalesce_g_light_load_02193_avm_read,
        out_memcoalesce_g_light_load_02193_avm_write => bb_ethash_calculate_dag_item_B3_stall_region_out_memcoalesce_g_light_load_02193_avm_write,
        out_memcoalesce_g_light_load_02193_avm_writedata => bb_ethash_calculate_dag_item_B3_stall_region_out_memcoalesce_g_light_load_02193_avm_writedata,
        out_stall_out => bb_ethash_calculate_dag_item_B3_stall_region_out_stall_out,
        out_unnamed_ethash_calculate_dag_item7 => bb_ethash_calculate_dag_item_B3_stall_region_out_unnamed_ethash_calculate_dag_item7,
        out_valid_out => bb_ethash_calculate_dag_item_B3_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- ethash_calculate_dag_item_B3_branch_aunroll_x(BLACKBOX,2)
    theethash_calculate_dag_item_B3_branch_aunroll_x : ethash_calculate_dag_item_B3_branch
    PORT MAP (
        in_c1_exit_0 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_0,
        in_c1_exit_1 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_1,
        in_c1_exit_2 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_2,
        in_c1_exit_3 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_3,
        in_c1_exit_4 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_4,
        in_c1_exit_5 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_5,
        in_c1_exit_6 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_6,
        in_c1_exit_7 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_7,
        in_c1_exit_8 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_8,
        in_c1_exit_9 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_9,
        in_c1_exit_10 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_10,
        in_c1_exit_11 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_11,
        in_c1_exit_12 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_12,
        in_c1_exit_13 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_13,
        in_c1_exit_14 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_14,
        in_c1_exit_15 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_15,
        in_c1_exit_16 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_16,
        in_c1_exit_17 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_17,
        in_c1_exit_18 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_18,
        in_c1_exit_19 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_19,
        in_c1_exit_20 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exit_20,
        in_acl_hw_wg_id41 => bb_ethash_calculate_dag_item_B3_stall_region_out_acl_hw_wg_id41,
        in_c0_exe11221 => bb_ethash_calculate_dag_item_B3_stall_region_out_c0_exe11221,
        in_c0_exe114 => bb_ethash_calculate_dag_item_B3_stall_region_out_c0_exe114,
        in_c0_exe21326 => bb_ethash_calculate_dag_item_B3_stall_region_out_c0_exe21326,
        in_c1_exe1 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe1,
        in_c1_exe10 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe10,
        in_c1_exe11 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe11,
        in_c1_exe12 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe12,
        in_c1_exe13 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe13,
        in_c1_exe15 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe15,
        in_c1_exe16 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe16,
        in_c1_exe17 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe17,
        in_c1_exe18 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe18,
        in_c1_exe2 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe2,
        in_c1_exe20 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe20,
        in_c1_exe3 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe3,
        in_c1_exe4 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe4,
        in_c1_exe5 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe5,
        in_c1_exe6 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe6,
        in_c1_exe7 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe7,
        in_c1_exe8 => bb_ethash_calculate_dag_item_B3_stall_region_out_c1_exe8,
        in_fpgaindvars_iv_next => bb_ethash_calculate_dag_item_B3_stall_region_out_fpgaindvars_iv_next,
        in_inc43 => bb_ethash_calculate_dag_item_B3_stall_region_out_inc43,
        in_stall_in_0 => in_stall_in_0,
        in_stall_in_1 => in_stall_in_1,
        in_unnamed_ethash_calculate_dag_item7 => bb_ethash_calculate_dag_item_B3_stall_region_out_unnamed_ethash_calculate_dag_item7,
        in_valid_in => bb_ethash_calculate_dag_item_B3_stall_region_out_valid_out,
        out_c1_exit_0 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_0,
        out_c1_exit_1 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_1,
        out_c1_exit_2 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_2,
        out_c1_exit_3 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_3,
        out_c1_exit_4 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_4,
        out_c1_exit_5 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_5,
        out_c1_exit_6 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_6,
        out_c1_exit_7 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_7,
        out_c1_exit_8 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_8,
        out_c1_exit_9 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_9,
        out_c1_exit_10 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_10,
        out_c1_exit_11 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_11,
        out_c1_exit_12 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_12,
        out_c1_exit_13 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_13,
        out_c1_exit_14 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_14,
        out_c1_exit_15 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_15,
        out_c1_exit_16 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_16,
        out_c1_exit_17 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_17,
        out_c1_exit_18 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_18,
        out_c1_exit_19 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_19,
        out_c1_exit_20 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_20,
        out_acl_hw_wg_id41 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_acl_hw_wg_id41,
        out_c0_exe11221 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c0_exe11221,
        out_c0_exe114 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c0_exe114,
        out_c0_exe21326 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c0_exe21326,
        out_c1_exe1 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe1,
        out_c1_exe10 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe10,
        out_c1_exe11 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe11,
        out_c1_exe12 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe12,
        out_c1_exe13 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe13,
        out_c1_exe15 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe15,
        out_c1_exe16 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe16,
        out_c1_exe17 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe17,
        out_c1_exe18 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe18,
        out_c1_exe2 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe2,
        out_c1_exe20 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe20,
        out_c1_exe3 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe3,
        out_c1_exe4 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe4,
        out_c1_exe5 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe5,
        out_c1_exe6 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe6,
        out_c1_exe7 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe7,
        out_c1_exe8 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe8,
        out_fpgaindvars_iv_next => ethash_calculate_dag_item_B3_branch_aunroll_x_out_fpgaindvars_iv_next,
        out_inc43 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_inc43,
        out_stall_out => ethash_calculate_dag_item_B3_branch_aunroll_x_out_stall_out,
        out_valid_out_0 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_valid_out_0,
        out_valid_out_1 => ethash_calculate_dag_item_B3_branch_aunroll_x_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_c1_exit_0(GPOUT,3)
    out_c1_exit_0 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_0;

    -- out_c1_exit_1(GPOUT,4)
    out_c1_exit_1 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_1;

    -- out_c1_exit_2(GPOUT,5)
    out_c1_exit_2 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_2;

    -- out_c1_exit_3(GPOUT,6)
    out_c1_exit_3 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_3;

    -- out_c1_exit_4(GPOUT,7)
    out_c1_exit_4 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_4;

    -- out_c1_exit_5(GPOUT,8)
    out_c1_exit_5 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_5;

    -- out_c1_exit_6(GPOUT,9)
    out_c1_exit_6 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_6;

    -- out_c1_exit_7(GPOUT,10)
    out_c1_exit_7 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_7;

    -- out_c1_exit_8(GPOUT,11)
    out_c1_exit_8 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_8;

    -- out_c1_exit_9(GPOUT,12)
    out_c1_exit_9 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_9;

    -- out_c1_exit_10(GPOUT,13)
    out_c1_exit_10 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_10;

    -- out_c1_exit_11(GPOUT,14)
    out_c1_exit_11 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_11;

    -- out_c1_exit_12(GPOUT,15)
    out_c1_exit_12 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_12;

    -- out_c1_exit_13(GPOUT,16)
    out_c1_exit_13 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_13;

    -- out_c1_exit_14(GPOUT,17)
    out_c1_exit_14 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_14;

    -- out_c1_exit_15(GPOUT,18)
    out_c1_exit_15 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_15;

    -- out_c1_exit_16(GPOUT,19)
    out_c1_exit_16 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_16;

    -- out_c1_exit_17(GPOUT,20)
    out_c1_exit_17 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_17;

    -- out_c1_exit_18(GPOUT,21)
    out_c1_exit_18 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_18;

    -- out_c1_exit_19(GPOUT,22)
    out_c1_exit_19 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_19;

    -- out_c1_exit_20(GPOUT,23)
    out_c1_exit_20 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exit_20;

    -- out_acl_hw_wg_id41(GPOUT,24)
    out_acl_hw_wg_id41 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_acl_hw_wg_id41;

    -- out_c0_exe11221(GPOUT,25)
    out_c0_exe11221 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c0_exe11221;

    -- out_c0_exe114(GPOUT,26)
    out_c0_exe114 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c0_exe114;

    -- out_c0_exe21326(GPOUT,27)
    out_c0_exe21326 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c0_exe21326;

    -- out_c1_exe1(GPOUT,28)
    out_c1_exe1 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe1;

    -- out_c1_exe10(GPOUT,29)
    out_c1_exe10 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe10;

    -- out_c1_exe11(GPOUT,30)
    out_c1_exe11 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe11;

    -- out_c1_exe12(GPOUT,31)
    out_c1_exe12 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe12;

    -- out_c1_exe13(GPOUT,32)
    out_c1_exe13 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe13;

    -- out_c1_exe15(GPOUT,33)
    out_c1_exe15 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe15;

    -- out_c1_exe16(GPOUT,34)
    out_c1_exe16 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe16;

    -- out_c1_exe17(GPOUT,35)
    out_c1_exe17 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe17;

    -- out_c1_exe18(GPOUT,36)
    out_c1_exe18 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe18;

    -- out_c1_exe2(GPOUT,37)
    out_c1_exe2 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe2;

    -- out_c1_exe20(GPOUT,38)
    out_c1_exe20 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe20;

    -- out_c1_exe3(GPOUT,39)
    out_c1_exe3 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe3;

    -- out_c1_exe4(GPOUT,40)
    out_c1_exe4 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe4;

    -- out_c1_exe5(GPOUT,41)
    out_c1_exe5 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe5;

    -- out_c1_exe6(GPOUT,42)
    out_c1_exe6 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe6;

    -- out_c1_exe7(GPOUT,43)
    out_c1_exe7 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe7;

    -- out_c1_exe8(GPOUT,44)
    out_c1_exe8 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_c1_exe8;

    -- out_fpgaindvars_iv_next(GPOUT,45)
    out_fpgaindvars_iv_next <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_fpgaindvars_iv_next;

    -- out_inc43(GPOUT,46)
    out_inc43 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_inc43;

    -- out_memcoalesce_g_light_load_02193_avm_address(GPOUT,47)
    out_memcoalesce_g_light_load_02193_avm_address <= bb_ethash_calculate_dag_item_B3_stall_region_out_memcoalesce_g_light_load_02193_avm_address;

    -- out_memcoalesce_g_light_load_02193_avm_burstcount(GPOUT,48)
    out_memcoalesce_g_light_load_02193_avm_burstcount <= bb_ethash_calculate_dag_item_B3_stall_region_out_memcoalesce_g_light_load_02193_avm_burstcount;

    -- out_memcoalesce_g_light_load_02193_avm_byteenable(GPOUT,49)
    out_memcoalesce_g_light_load_02193_avm_byteenable <= bb_ethash_calculate_dag_item_B3_stall_region_out_memcoalesce_g_light_load_02193_avm_byteenable;

    -- out_memcoalesce_g_light_load_02193_avm_enable(GPOUT,50)
    out_memcoalesce_g_light_load_02193_avm_enable <= bb_ethash_calculate_dag_item_B3_stall_region_out_memcoalesce_g_light_load_02193_avm_enable;

    -- out_memcoalesce_g_light_load_02193_avm_read(GPOUT,51)
    out_memcoalesce_g_light_load_02193_avm_read <= bb_ethash_calculate_dag_item_B3_stall_region_out_memcoalesce_g_light_load_02193_avm_read;

    -- out_memcoalesce_g_light_load_02193_avm_write(GPOUT,52)
    out_memcoalesce_g_light_load_02193_avm_write <= bb_ethash_calculate_dag_item_B3_stall_region_out_memcoalesce_g_light_load_02193_avm_write;

    -- out_memcoalesce_g_light_load_02193_avm_writedata(GPOUT,53)
    out_memcoalesce_g_light_load_02193_avm_writedata <= bb_ethash_calculate_dag_item_B3_stall_region_out_memcoalesce_g_light_load_02193_avm_writedata;

    -- out_stall_out_0(GPOUT,54)
    out_stall_out_0 <= ethash_calculate_dag_item_B3_merge_out_stall_out_0;

    -- out_stall_out_1(GPOUT,55)
    out_stall_out_1 <= ethash_calculate_dag_item_B3_merge_out_stall_out_1;

    -- out_valid_out_0(GPOUT,56)
    out_valid_out_0 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_valid_out_0;

    -- out_valid_out_1(GPOUT,57)
    out_valid_out_1 <= ethash_calculate_dag_item_B3_branch_aunroll_x_out_valid_out_1;

END normal;
