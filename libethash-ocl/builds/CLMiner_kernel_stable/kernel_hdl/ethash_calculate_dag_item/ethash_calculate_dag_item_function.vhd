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

-- VHDL created from ethash_calculate_dag_item_function
-- VHDL created on Mon Apr  1 13:52:59 2019


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

entity ethash_calculate_dag_item_function is
    port (
        in_arg_acl_hw_wg_id : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_g_dag : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_g_light : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_global_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_isolate : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_start : in std_logic_vector(31 downto 0);  -- ufix32
        in_memcoalesce_g_light_load_02193_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_memcoalesce_g_light_load_02193_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_g_light_load_02193_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_g_light_load_02193_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_g_light_load_0_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_memcoalesce_g_light_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_g_light_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_g_light_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_start : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_calculate_dag_item15_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_unnamed_ethash_calculate_dag_item15_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_calculate_dag_item15_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_calculate_dag_item15_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_acl_hw_wg_id38 : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_g_light_load_02193_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        out_memcoalesce_g_light_load_02193_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_memcoalesce_g_light_load_02193_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_memcoalesce_g_light_load_02193_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_g_light_load_02193_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_g_light_load_02193_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_g_light_load_02193_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_memcoalesce_g_light_load_0_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        out_memcoalesce_g_light_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_memcoalesce_g_light_load_0_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_memcoalesce_g_light_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_g_light_load_0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_g_light_load_0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_g_light_load_0_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_o_active_unnamed_ethash_calculate_dag_item15 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_calculate_dag_item15_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        out_unnamed_ethash_calculate_dag_item15_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_ethash_calculate_dag_item15_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_ethash_calculate_dag_item15_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_calculate_dag_item15_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_calculate_dag_item15_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_calculate_dag_item15_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end ethash_calculate_dag_item_function;

architecture normal of ethash_calculate_dag_item_function is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_ethash_calculate_dag_item_B1 is
        port (
            in_acl_hw_wg_id43_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_hw_wg_id43_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe116_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe116_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_dag_node_pm_0_0 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_dag_node_pm_0_1 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_g_dag : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_g_light : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_isolate : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_r_0_i_i_ph_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_r_0_i_i_ph_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01389_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01389_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01391_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01391_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01393_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01393_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01395_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01395_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01397_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01397_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01399_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01399_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01401_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01401_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01403_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01403_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01405_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01405_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01407_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01407_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01409_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01409_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01411_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01411_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01413_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01413_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01415_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01415_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01417_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01417_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01419_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01419_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01421_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01421_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01423_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01423_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01425_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01425_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01427_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01427_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01429_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01429_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11390_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11390_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11392_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11392_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11394_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11394_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11396_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11396_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11398_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11398_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11400_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11400_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11402_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11402_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11404_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11404_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11406_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11406_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11408_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11408_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11410_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11410_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11412_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11412_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11414_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11414_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11416_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11416_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11418_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11418_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11420_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11420_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11422_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11422_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11424_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11424_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11426_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11426_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11428_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11428_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11430_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11430_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit11_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit11_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit11_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit11_3 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_c0_exit11_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit11_5 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_c0_exit11_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_19 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_20 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_21 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_22 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_23 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_25 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_26 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_27 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_28 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_29 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_30 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_31 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_32 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_33 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_34 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_35 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_36 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_37 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_38 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_39 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_40 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_41 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_42 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_43 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_44 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_45 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_46 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_47 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_48 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_49 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_50 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_hw_wg_id43 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe112 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe116 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe19 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe20 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe21 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe213 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe22 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe23 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe25 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe26 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe27 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe28 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe29 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe30 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe31 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe32 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe33 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe34 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe35 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe36 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe37 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe38 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe39 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe40 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe41 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe42 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe43 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe44 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe45 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe46 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe47 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe48 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe49 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe5 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_c0_exe50 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_dag_node_pm_0 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_calculate_dag_item_B1_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_14 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_17 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_18 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_19 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_20 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_21 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_22 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_23 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_24 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_25 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_26 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_27 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_28 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_29 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_30 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_31 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_32 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_33 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_34 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_35 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_36 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_37 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_38 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_39 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_40 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_41 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_42 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_43 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_44 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_45 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_46 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_47 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_19 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_20 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_21 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_22 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_23 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_25 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_26 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_27 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_28 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_29 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_30 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_31 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_32 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_33 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_34 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_35 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_36 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_37 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_38 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_39 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_40 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_41 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_42 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_43 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_44 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_45 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_46 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_47 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_calculate_dag_item_B1_sr_1 is
        port (
            in_i_data_0 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_14 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_17 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_18 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_19 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_20 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_21 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_22 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_23 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_24 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_25 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_26 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_27 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_28 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_29 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_30 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_31 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_32 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_33 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_34 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_35 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_36 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_37 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_38 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_39 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_40 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_41 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_42 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_43 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_44 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_45 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_46 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_47 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_19 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_20 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_21 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_22 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_23 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_25 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_26 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_27 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_28 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_29 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_30 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_31 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_32 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_33 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_34 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_35 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_36 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_37 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_38 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_39 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_40 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_41 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_42 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_43 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_44 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_45 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_46 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_47 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_calculate_dag_item_B2 is
        port (
            in_c0_exit1118_0_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit1118_0_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit1118_0_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit1118_0_3 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_c0_exit1118_0_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit1118_0_5 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_c0_exit1118_0_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_14 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_17 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_18 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_19 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_20 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_21 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_22 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_23 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_24 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_25 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_26 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_27 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_28 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_29 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_30 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_31 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_32 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_33 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_34 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_35 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_36 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_37 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_38 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_39 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_40 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_41 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_42 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_43 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_44 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_45 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_46 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_47 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_48 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_49 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_50 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_hw_wg_id42_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe11222_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe115_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe21327_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dag_node_pm_017_0 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_g_dag : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_g_light : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_hw_wg_id42 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe11222 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe115 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe21327 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_dag_node_pm_017 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_pre693_pml_t_bitcast_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre693_pml_t_bitcast_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre693_pml_t_bitcast_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre693_pml_t_bitcast_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre694_pml_t_bitcast_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre694_pml_t_bitcast_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre694_pml_t_bitcast_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre694_pml_t_bitcast_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre695_pml_t_bitcast_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre695_pml_t_bitcast_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre695_pml_t_bitcast_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre695_pml_t_bitcast_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre_pml_t_bitcast_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre_pml_t_bitcast_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre_pml_t_bitcast_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre_pml_t_bitcast_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_calculate_dag_item_B2_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_7 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_i_data_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_14 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_17 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_18 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_19 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_20 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_21 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_22 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_23 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_24 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_25 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_26 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_27 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_28 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_29 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_30 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_31 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_32 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_33 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_34 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_35 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_36 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_37 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_38 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_39 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_40 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_41 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_42 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_43 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_44 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_45 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_46 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_47 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_48 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_49 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_50 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_51 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_52 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_53 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_54 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_55 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_7 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_o_data_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_19 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_20 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_21 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_22 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_23 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_25 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_26 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_27 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_28 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_29 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_30 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_31 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_32 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_33 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_34 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_35 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_36 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_37 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_38 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_39 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_40 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_41 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_42 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_43 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_44 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_45 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_46 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_47 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_48 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_49 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_50 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_51 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_52 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_53 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_54 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_55 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_calculate_dag_item_B3 is
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
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_fpgaindvars_iv_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_fpgaindvars_iv_1 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_g_dag : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_g_light : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i11_0687_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i11_0687_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memcoalesce_g_light_load_02193_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_memcoalesce_g_light_load_02193_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_g_light_load_02193_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_g_light_load_02193_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_calculate_dag_item_B3_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_14 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_17 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_18 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_19 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_20 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_21 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_22 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_19 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_20 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_21 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_22 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_calculate_dag_item_B3_sr_1 is
        port (
            in_i_data_0 : in std_logic_vector(8 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_14 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_17 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_18 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_19 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_20 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_21 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_22 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(8 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_19 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_20 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_21 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_22 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_calculate_dag_item_B4 is
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
            in_g_dag : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_calculate_dag_item_B4_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_12 : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_i_data_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_14 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_17 : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_i_data_18 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_19 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_20 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_21 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_22 : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_i_data_23 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_i_data_24 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_25 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_26 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_27 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_28 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_29 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_30 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_i_data_31 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_12 : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_o_data_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_17 : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_o_data_18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_19 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_20 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_21 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_22 : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_o_data_23 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_o_data_24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_25 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_26 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_27 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_28 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_29 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_30 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_o_data_31 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_calculate_dag_item_B5 is
        port (
            in_acl_hw_wg_id39_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_hw_wg_id39_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe111_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe111_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe11219_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe11219_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe21324_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe21324_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dag_node_pm_2_0 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_dag_node_pm_2_1 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_g_dag : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_r_0_i_i11_ph_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_r_0_i_i11_ph_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01650_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01650_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01652_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01652_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01654_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01654_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01656_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01656_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01658_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01658_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01660_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01660_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01662_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01662_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01664_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01664_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01666_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01666_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01668_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01668_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01670_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01670_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01672_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01672_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01674_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01674_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01676_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01676_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01678_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01678_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01680_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01680_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01682_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01682_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01684_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01684_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01686_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01686_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01688_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01688_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01690_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01690_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01692_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01692_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01694_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01694_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11651_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11651_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11653_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11653_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11655_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11655_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11657_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11657_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11659_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11659_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11661_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11661_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11663_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11663_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11665_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11665_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11667_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11667_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11669_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11669_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11671_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11671_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11673_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11673_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11675_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11675_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11677_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11677_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11679_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11679_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11681_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11681_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11683_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11683_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11685_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11685_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11687_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11687_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11689_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11689_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11691_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11691_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11693_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11693_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11695_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11695_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit169_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit169_1 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_c0_exit169_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit169_3 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_c0_exit169_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_19 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_20 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_21 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_22 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_23 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_25 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_26 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_27 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_28 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_29 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_30 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_31 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_32 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_33 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_34 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_35 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_36 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_37 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_38 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_39 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_40 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_41 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_42 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_43 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_44 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_45 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_46 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_47 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_48 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_49 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit169_50 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_hw_wg_id39 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe10179 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe111 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe11180 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe11219 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe12181 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe13182 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe14183 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe15184 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe16185 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe17186 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe18187 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe19188 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe20189 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe21190 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe21324 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe22191 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe23192 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe24193 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe25194 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe26195 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe27196 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe28197 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe29198 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe30199 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe31200 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe3172 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_c0_exe32201 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe33202 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe34203 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe35204 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe36205 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe37206 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe38207 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe39208 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe40209 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe41210 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe4173 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe42211 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe43212 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe44213 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe45214 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe46215 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe47216 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe48217 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe49218 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe50219 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe5174 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe6175 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe7176 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe8177 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe9178 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_dag_node_pm_2 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_calculate_dag_item_B5_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_14 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_17 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_18 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_19 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_20 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_21 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_22 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_23 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_24 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_25 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_26 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_27 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_28 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_29 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_30 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_31 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_32 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_33 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_34 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_35 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_36 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_37 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_38 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_39 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_40 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_41 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_42 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_43 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_44 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_45 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_46 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_47 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_48 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_49 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_50 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_51 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_19 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_20 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_21 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_22 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_23 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_25 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_26 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_27 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_28 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_29 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_30 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_31 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_32 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_33 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_34 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_35 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_36 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_37 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_38 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_39 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_40 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_41 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_42 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_43 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_44 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_45 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_46 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_47 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_48 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_49 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_50 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_51 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_calculate_dag_item_B5_sr_1 is
        port (
            in_i_data_0 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_14 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_17 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_18 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_19 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_20 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_21 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_22 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_23 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_24 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_25 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_26 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_27 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_28 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_29 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_30 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_31 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_32 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_33 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_34 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_35 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_36 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_37 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_38 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_39 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_40 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_41 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_42 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_43 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_44 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_45 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_46 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_47 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_48 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_49 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_50 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_51 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_19 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_20 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_21 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_22 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_23 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_25 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_26 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_27 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_28 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_29 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_30 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_31 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_32 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_33 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_34 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_35 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_36 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_37 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_38 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_39 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_40 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_41 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_42 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_43 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_44 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_45 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_46 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_47 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_48 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_49 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_50 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_51 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_calculate_dag_item_B6 is
        port (
            in_c0_exit16937_0_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit16937_0_1 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_c0_exit16937_0_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit16937_0_3 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_c0_exit16937_0_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_14 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_17 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_18 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_19 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_20 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_21 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_22 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_23 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_24 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_25 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_26 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_27 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_28 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_29 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_30 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_31 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_32 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_33 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_34 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_35 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_36 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_37 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_38 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_39 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_40 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_41 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_42 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_43 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_44 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_45 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_46 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_47 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_48 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_49 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_50 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_hw_wg_id38_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe110_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe21323_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dag_node_pm_236_0 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_g_dag : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_calculate_dag_item15_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_unnamed_ethash_calculate_dag_item15_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_calculate_dag_item15_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_calculate_dag_item15_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_hw_wg_id38 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_lsu_unnamed_ethash_calculate_dag_item15_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_calculate_dag_item15_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_unnamed_ethash_calculate_dag_item15_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_ethash_calculate_dag_item15_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_unnamed_ethash_calculate_dag_item15_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_calculate_dag_item15_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_calculate_dag_item15_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_calculate_dag_item15_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_calculate_dag_item_B6_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_i_data_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_14 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_17 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_18 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_19 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_20 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_21 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_22 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_23 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_24 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_25 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_26 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_27 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_28 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_29 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_30 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_31 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_32 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_33 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_34 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_35 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_36 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_37 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_38 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_39 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_40 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_41 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_42 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_43 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_44 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_45 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_46 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_47 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_48 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_49 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_50 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_51 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_52 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_53 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_54 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_o_data_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_19 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_20 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_21 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_22 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_23 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_25 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_26 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_27 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_28 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_29 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_30 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_31 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_32 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_33 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_34 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_35 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_36 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_37 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_38 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_39 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_40 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_41 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_42 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_43 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_44 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_45 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_46 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_47 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_48 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_49 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_50 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_51 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_52 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_53 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_54 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_calculate_dag_item_B0 is
        port (
            in_acl_hw_wg_id_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_g_dag : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_g_light : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_global_id_0_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_isolate : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memcoalesce_g_light_load_0_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_memcoalesce_g_light_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_g_light_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_g_light_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_start : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_01361 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_01370 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_01379 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_01385 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_01387 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_11362 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_11371 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_11380 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_11386 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_11388 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_hw_wg_id : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_0_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_0_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_0_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_reduction_ethash_calculate_dag_item_4_compressed : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component loop_limiter_ethash_calculate_dag_item0 is
        port (
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component loop_limiter_ethash_calculate_dag_item1 is
        port (
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component loop_limiter_ethash_calculate_dag_item2 is
        port (
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_3 : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_5 : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_19 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_20 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_21 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_22 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_23 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_24 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_25 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_26 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_27 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_28 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_29 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_30 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_31 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_32 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_33 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_34 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_35 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_36 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_37 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_38 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_39 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_40 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_41 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_42 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_43 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_44 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_45 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_46 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_47 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_48 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_49 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_50 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_acl_hw_wg_id43 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe112 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe116 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe14 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe17 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe18 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe19 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe20 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe21 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe213 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe22 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe23 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe24 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe25 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe26 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe27 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe28 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe29 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe30 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe31 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe32 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe33 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe34 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe35 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe36 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe37 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe38 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe39 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe40 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe41 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe42 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe43 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe44 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe45 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe46 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe47 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe48 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe49 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe5 : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe50 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_dag_node_pm_0 : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B1_aunroll_x_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_19 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_20 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_21 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_22 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_23 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_24 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_25 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_26 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_27 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_28 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_29 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_30 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_31 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_32 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_33 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_34 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_35 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_36 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_37 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_38 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_39 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_40 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_41 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_42 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_43 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_44 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_45 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_46 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_47 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_19 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_20 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_21 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_22 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_23 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_24 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_25 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_26 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_27 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_28 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_29 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_30 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_31 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_32 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_33 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_34 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_35 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_36 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_37 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_38 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_39 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_40 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_41 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_42 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_43 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_44 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_45 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_46 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_47 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B2_aunroll_x_out_acl_hw_wg_id42 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_aunroll_x_out_c0_exe11222 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B2_aunroll_x_out_c0_exe115 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_aunroll_x_out_c0_exe21327 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B2_aunroll_x_out_dag_node_pm_017 : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre693_pml_t_bitcast_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre693_pml_t_bitcast_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre693_pml_t_bitcast_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre693_pml_t_bitcast_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre694_pml_t_bitcast_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre694_pml_t_bitcast_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre694_pml_t_bitcast_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre694_pml_t_bitcast_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre695_pml_t_bitcast_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre695_pml_t_bitcast_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre695_pml_t_bitcast_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre695_pml_t_bitcast_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre_pml_t_bitcast_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre_pml_t_bitcast_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre_pml_t_bitcast_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre_pml_t_bitcast_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_aunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B2_aunroll_x_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_19 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_20 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_21 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_22 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_23 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_24 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_25 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_26 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_27 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_28 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_29 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_30 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_31 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_32 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_33 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_34 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_35 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_36 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_37 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_38 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_39 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_40 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_41 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_42 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_43 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_44 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_45 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_46 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_47 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_48 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_49 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_50 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_51 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_52 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_53 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_54 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_55 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_9 : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_14 : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_19 : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_20 : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_acl_hw_wg_id41 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c0_exe11221 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c0_exe114 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c0_exe21326 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe17 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe18 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe20 : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_fpgaindvars_iv_next : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_inc43 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_memcoalesce_g_light_load_02193_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_memcoalesce_g_light_load_02193_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_memcoalesce_g_light_load_02193_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_memcoalesce_g_light_load_02193_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_memcoalesce_g_light_load_02193_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_memcoalesce_g_light_load_02193_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_memcoalesce_g_light_load_02193_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B3_aunroll_x_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_19 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_20 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_21 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_22 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (8 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_19 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_20 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_21 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_22 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B4_aunroll_x_out_acl_01644 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_aunroll_x_out_acl_01646 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_aunroll_x_out_acl_01648 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_aunroll_x_out_acl_11645 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_aunroll_x_out_acl_11647 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_aunroll_x_out_acl_11649 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_aunroll_x_out_acl_hw_wg_id40 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_aunroll_x_out_c0_exe11220 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B4_aunroll_x_out_c0_exe113 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_aunroll_x_out_c0_exe21325 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B4_aunroll_x_out_c1_exe1031 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_aunroll_x_out_c1_exe1132 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_aunroll_x_out_c1_exe129 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_aunroll_x_out_c1_exe1533 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_aunroll_x_out_c1_exe1634 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_aunroll_x_out_c1_exe230 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_aunroll_x_out_pms_cs1241_pms_vs_pms_vm_pms_d : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B4_aunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B4_aunroll_x_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_12 : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_17 : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_19 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_20 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_21 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_22 : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_23 : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_24 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_25 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_26 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_27 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_28 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_29 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_30 : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_31 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_1 : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_3 : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_19 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_20 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_21 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_22 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_23 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_24 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_25 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_26 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_27 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_28 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_29 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_30 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_31 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_32 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_33 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_34 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_35 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_36 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_37 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_38 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_39 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_40 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_41 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_42 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_43 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_44 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_45 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_46 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_47 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_48 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_49 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_50 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_acl_hw_wg_id39 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe10179 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe111 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe11180 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe11219 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe12181 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe13182 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe14183 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe15184 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe16185 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe17186 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe18187 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe19188 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe20189 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe21190 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe21324 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe22191 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe23192 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe24193 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe25194 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe26195 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe27196 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe28197 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe29198 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe30199 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe31200 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe3172 : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe32201 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe33202 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe34203 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe35204 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe36205 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe37206 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe38207 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe39208 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe40209 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe41210 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe4173 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe42211 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe43212 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe44213 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe45214 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe46215 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe47216 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe48217 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe49218 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe50219 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe5174 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe6175 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe7176 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe8177 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe9178 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_dag_node_pm_2 : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B5_aunroll_x_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_19 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_20 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_21 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_22 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_23 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_24 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_25 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_26 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_27 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_28 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_29 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_30 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_31 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_32 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_33 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_34 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_35 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_36 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_37 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_38 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_39 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_40 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_41 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_42 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_43 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_44 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_45 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_46 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_47 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_48 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_49 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_50 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_51 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_19 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_20 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_21 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_22 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_23 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_24 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_25 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_26 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_27 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_28 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_29 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_30 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_31 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_32 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_33 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_34 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_35 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_36 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_37 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_38 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_39 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_40 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_41 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_42 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_43 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_44 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_45 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_46 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_47 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_48 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_49 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_50 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_51 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B6_aunroll_x_out_acl_hw_wg_id38 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_aunroll_x_out_lsu_unnamed_ethash_calculate_dag_item15_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B6_aunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B6_aunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal bb_ethash_calculate_dag_item_B6_aunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_ethash_calculate_dag_item_B6_aunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_calculate_dag_item_B6_aunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B6_aunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B6_aunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B6_aunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal bb_ethash_calculate_dag_item_B6_aunroll_x_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_19 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_20 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_21 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_22 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_23 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_24 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_25 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_26 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_27 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_28 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_29 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_30 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_31 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_32 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_33 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_34 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_35 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_36 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_37 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_38 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_39 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_40 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_41 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_42 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_43 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_44 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_45 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_46 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_47 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_48 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_49 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_50 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_51 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_52 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_53 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_54 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_c_i32_0gr_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_c_i32_1gr_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_c_i32_2147483648_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B0_out_acl_01361 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B0_out_acl_01370 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B0_out_acl_01379 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B0_out_acl_01385 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B0_out_acl_01387 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B0_out_acl_11362 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B0_out_acl_11371 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B0_out_acl_11380 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B0_out_acl_11386 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B0_out_acl_11388 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B0_out_acl_hw_wg_id : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B0_out_c0_exe1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B0_out_memcoalesce_g_light_load_0_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal bb_ethash_calculate_dag_item_B0_out_memcoalesce_g_light_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_ethash_calculate_dag_item_B0_out_memcoalesce_g_light_load_0_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_calculate_dag_item_B0_out_memcoalesce_g_light_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B0_out_memcoalesce_g_light_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B0_out_memcoalesce_g_light_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B0_out_memcoalesce_g_light_load_0_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal bb_ethash_calculate_dag_item_B0_out_reduction_ethash_calculate_dag_item_4_compressed : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B0_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B0_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal c_i9_254_q : STD_LOGIC_VECTOR (8 downto 0);
    signal loop_limiter_ethash_calculate_dag_item0_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_ethash_calculate_dag_item0_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_ethash_calculate_dag_item1_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_ethash_calculate_dag_item1_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_ethash_calculate_dag_item2_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_ethash_calculate_dag_item2_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- loop_limiter_ethash_calculate_dag_item2(BLACKBOX,119)
    theloop_limiter_ethash_calculate_dag_item2 : loop_limiter_ethash_calculate_dag_item2
    PORT MAP (
        in_i_stall => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_stall,
        in_i_stall_exit => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_stall,
        in_i_valid => bb_ethash_calculate_dag_item_B4_aunroll_x_out_valid_out_0,
        in_i_valid_exit => bb_ethash_calculate_dag_item_B5_aunroll_x_out_valid_out_0,
        out_o_stall => loop_limiter_ethash_calculate_dag_item2_out_o_stall,
        out_o_valid => loop_limiter_ethash_calculate_dag_item2_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_c_i32_2147483648_x(CONSTANT,19)
    dupName_0_c_i32_2147483648_x_q <= "10000000000000000000000000000000";

    -- dupName_0_c_i32_1gr_x(CONSTANT,18)
    dupName_0_c_i32_1gr_x_q <= "00000000000000000000000000000001";

    -- dupName_0_c_i32_0gr_x(CONSTANT,17)
    dupName_0_c_i32_0gr_x_q <= "00000000000000000000000000000000";

    -- loop_limiter_ethash_calculate_dag_item1(BLACKBOX,118)
    theloop_limiter_ethash_calculate_dag_item1 : loop_limiter_ethash_calculate_dag_item1
    PORT MAP (
        in_i_stall => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_stall,
        in_i_stall_exit => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_stall,
        in_i_valid => bb_ethash_calculate_dag_item_B2_aunroll_x_out_valid_out_0,
        in_i_valid_exit => bb_ethash_calculate_dag_item_B3_aunroll_x_out_valid_out_0,
        out_o_stall => loop_limiter_ethash_calculate_dag_item1_out_o_stall,
        out_o_valid => loop_limiter_ethash_calculate_dag_item1_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- loop_limiter_ethash_calculate_dag_item0(BLACKBOX,117)
    theloop_limiter_ethash_calculate_dag_item0 : loop_limiter_ethash_calculate_dag_item0
    PORT MAP (
        in_i_stall => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_stall,
        in_i_stall_exit => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_stall,
        in_i_valid => bb_ethash_calculate_dag_item_B0_out_valid_out_0,
        in_i_valid_exit => bb_ethash_calculate_dag_item_B1_aunroll_x_out_valid_out_0,
        out_o_stall => loop_limiter_ethash_calculate_dag_item0_out_o_stall,
        out_o_valid => loop_limiter_ethash_calculate_dag_item0_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_calculate_dag_item_B0(BLACKBOX,85)
    thebb_ethash_calculate_dag_item_B0 : bb_ethash_calculate_dag_item_B0
    PORT MAP (
        in_acl_hw_wg_id_0 => in_arg_acl_hw_wg_id,
        in_flush => in_start,
        in_g_dag => in_arg_g_dag,
        in_g_light => in_arg_g_light,
        in_global_id_0_0 => in_arg_global_id_0,
        in_isolate => in_arg_isolate,
        in_memcoalesce_g_light_load_0_avm_readdata => in_memcoalesce_g_light_load_0_avm_readdata,
        in_memcoalesce_g_light_load_0_avm_readdatavalid => in_memcoalesce_g_light_load_0_avm_readdatavalid,
        in_memcoalesce_g_light_load_0_avm_waitrequest => in_memcoalesce_g_light_load_0_avm_waitrequest,
        in_memcoalesce_g_light_load_0_avm_writeack => in_memcoalesce_g_light_load_0_avm_writeack,
        in_stall_in_0 => loop_limiter_ethash_calculate_dag_item0_out_o_stall,
        in_start => in_arg_start,
        in_valid_in_0 => in_valid_in,
        out_acl_01361 => bb_ethash_calculate_dag_item_B0_out_acl_01361,
        out_acl_01370 => bb_ethash_calculate_dag_item_B0_out_acl_01370,
        out_acl_01379 => bb_ethash_calculate_dag_item_B0_out_acl_01379,
        out_acl_01385 => bb_ethash_calculate_dag_item_B0_out_acl_01385,
        out_acl_01387 => bb_ethash_calculate_dag_item_B0_out_acl_01387,
        out_acl_11362 => bb_ethash_calculate_dag_item_B0_out_acl_11362,
        out_acl_11371 => bb_ethash_calculate_dag_item_B0_out_acl_11371,
        out_acl_11380 => bb_ethash_calculate_dag_item_B0_out_acl_11380,
        out_acl_11386 => bb_ethash_calculate_dag_item_B0_out_acl_11386,
        out_acl_11388 => bb_ethash_calculate_dag_item_B0_out_acl_11388,
        out_acl_hw_wg_id => bb_ethash_calculate_dag_item_B0_out_acl_hw_wg_id,
        out_c0_exe1 => bb_ethash_calculate_dag_item_B0_out_c0_exe1,
        out_memcoalesce_g_light_load_0_avm_address => bb_ethash_calculate_dag_item_B0_out_memcoalesce_g_light_load_0_avm_address,
        out_memcoalesce_g_light_load_0_avm_burstcount => bb_ethash_calculate_dag_item_B0_out_memcoalesce_g_light_load_0_avm_burstcount,
        out_memcoalesce_g_light_load_0_avm_byteenable => bb_ethash_calculate_dag_item_B0_out_memcoalesce_g_light_load_0_avm_byteenable,
        out_memcoalesce_g_light_load_0_avm_enable => bb_ethash_calculate_dag_item_B0_out_memcoalesce_g_light_load_0_avm_enable,
        out_memcoalesce_g_light_load_0_avm_read => bb_ethash_calculate_dag_item_B0_out_memcoalesce_g_light_load_0_avm_read,
        out_memcoalesce_g_light_load_0_avm_write => bb_ethash_calculate_dag_item_B0_out_memcoalesce_g_light_load_0_avm_write,
        out_memcoalesce_g_light_load_0_avm_writedata => bb_ethash_calculate_dag_item_B0_out_memcoalesce_g_light_load_0_avm_writedata,
        out_reduction_ethash_calculate_dag_item_4_compressed => bb_ethash_calculate_dag_item_B0_out_reduction_ethash_calculate_dag_item_4_compressed,
        out_stall_out_0 => bb_ethash_calculate_dag_item_B0_out_stall_out_0,
        out_valid_out_0 => bb_ethash_calculate_dag_item_B0_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x(BLACKBOX,4)
    thebb_ethash_calculate_dag_item_B1_sr_1_aunroll_x : bb_ethash_calculate_dag_item_B1_sr_1
    PORT MAP (
        in_i_data_0 => bb_ethash_calculate_dag_item_B0_out_reduction_ethash_calculate_dag_item_4_compressed,
        in_i_data_1 => dupName_0_c_i32_0gr_x_q,
        in_i_data_2 => dupName_0_c_i32_0gr_x_q,
        in_i_data_3 => dupName_0_c_i32_0gr_x_q,
        in_i_data_4 => dupName_0_c_i32_0gr_x_q,
        in_i_data_5 => dupName_0_c_i32_0gr_x_q,
        in_i_data_6 => dupName_0_c_i32_0gr_x_q,
        in_i_data_7 => dupName_0_c_i32_0gr_x_q,
        in_i_data_8 => dupName_0_c_i32_0gr_x_q,
        in_i_data_9 => bb_ethash_calculate_dag_item_B0_out_acl_01361,
        in_i_data_10 => bb_ethash_calculate_dag_item_B0_out_acl_11362,
        in_i_data_11 => dupName_0_c_i32_0gr_x_q,
        in_i_data_12 => dupName_0_c_i32_0gr_x_q,
        in_i_data_13 => dupName_0_c_i32_0gr_x_q,
        in_i_data_14 => dupName_0_c_i32_0gr_x_q,
        in_i_data_15 => dupName_0_c_i32_0gr_x_q,
        in_i_data_16 => dupName_0_c_i32_0gr_x_q,
        in_i_data_17 => bb_ethash_calculate_dag_item_B0_out_acl_01387,
        in_i_data_18 => bb_ethash_calculate_dag_item_B0_out_acl_11388,
        in_i_data_19 => dupName_0_c_i32_0gr_x_q,
        in_i_data_20 => dupName_0_c_i32_0gr_x_q,
        in_i_data_21 => dupName_0_c_i32_0gr_x_q,
        in_i_data_22 => dupName_0_c_i32_0gr_x_q,
        in_i_data_23 => dupName_0_c_i32_0gr_x_q,
        in_i_data_24 => dupName_0_c_i32_0gr_x_q,
        in_i_data_25 => bb_ethash_calculate_dag_item_B0_out_acl_01385,
        in_i_data_26 => bb_ethash_calculate_dag_item_B0_out_acl_11386,
        in_i_data_27 => dupName_0_c_i32_0gr_x_q,
        in_i_data_28 => dupName_0_c_i32_0gr_x_q,
        in_i_data_29 => dupName_0_c_i32_0gr_x_q,
        in_i_data_30 => dupName_0_c_i32_0gr_x_q,
        in_i_data_31 => dupName_0_c_i32_0gr_x_q,
        in_i_data_32 => dupName_0_c_i32_0gr_x_q,
        in_i_data_33 => bb_ethash_calculate_dag_item_B0_out_acl_01370,
        in_i_data_34 => bb_ethash_calculate_dag_item_B0_out_acl_11371,
        in_i_data_35 => dupName_0_c_i32_0gr_x_q,
        in_i_data_36 => dupName_0_c_i32_0gr_x_q,
        in_i_data_37 => dupName_0_c_i32_0gr_x_q,
        in_i_data_38 => dupName_0_c_i32_0gr_x_q,
        in_i_data_39 => dupName_0_c_i32_0gr_x_q,
        in_i_data_40 => dupName_0_c_i32_0gr_x_q,
        in_i_data_41 => bb_ethash_calculate_dag_item_B0_out_acl_01379,
        in_i_data_42 => bb_ethash_calculate_dag_item_B0_out_acl_11380,
        in_i_data_43 => dupName_0_c_i32_1gr_x_q,
        in_i_data_44 => dupName_0_c_i32_2147483648_x_q,
        in_i_data_45 => dupName_0_c_i32_0gr_x_q,
        in_i_data_46 => bb_ethash_calculate_dag_item_B0_out_c0_exe1,
        in_i_data_47 => bb_ethash_calculate_dag_item_B0_out_acl_hw_wg_id,
        in_i_stall => bb_ethash_calculate_dag_item_B1_aunroll_x_out_stall_out_1,
        in_i_valid => loop_limiter_ethash_calculate_dag_item0_out_o_valid,
        out_o_data_0 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_9,
        out_o_data_10 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_10,
        out_o_data_11 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_11,
        out_o_data_12 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_12,
        out_o_data_13 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_13,
        out_o_data_14 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_14,
        out_o_data_15 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_15,
        out_o_data_16 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_16,
        out_o_data_17 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_17,
        out_o_data_18 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_18,
        out_o_data_19 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_19,
        out_o_data_20 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_20,
        out_o_data_21 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_21,
        out_o_data_22 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_22,
        out_o_data_23 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_23,
        out_o_data_24 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_24,
        out_o_data_25 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_25,
        out_o_data_26 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_26,
        out_o_data_27 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_27,
        out_o_data_28 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_28,
        out_o_data_29 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_29,
        out_o_data_30 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_30,
        out_o_data_31 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_31,
        out_o_data_32 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_32,
        out_o_data_33 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_33,
        out_o_data_34 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_34,
        out_o_data_35 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_35,
        out_o_data_36 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_36,
        out_o_data_37 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_37,
        out_o_data_38 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_38,
        out_o_data_39 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_39,
        out_o_data_40 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_40,
        out_o_data_41 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_41,
        out_o_data_42 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_42,
        out_o_data_43 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_43,
        out_o_data_44 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_44,
        out_o_data_45 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_45,
        out_o_data_46 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_46,
        out_o_data_47 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_47,
        out_o_stall => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_stall,
        out_o_valid => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x(BLACKBOX,3)
    thebb_ethash_calculate_dag_item_B1_sr_0_aunroll_x : bb_ethash_calculate_dag_item_B1_sr_0
    PORT MAP (
        in_i_data_0 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe5,
        in_i_data_1 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe6,
        in_i_data_2 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe7,
        in_i_data_3 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe8,
        in_i_data_4 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe9,
        in_i_data_5 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe10,
        in_i_data_6 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe11,
        in_i_data_7 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe12,
        in_i_data_8 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe13,
        in_i_data_9 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe14,
        in_i_data_10 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe15,
        in_i_data_11 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe16,
        in_i_data_12 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe17,
        in_i_data_13 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe18,
        in_i_data_14 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe19,
        in_i_data_15 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe20,
        in_i_data_16 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe21,
        in_i_data_17 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe22,
        in_i_data_18 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe23,
        in_i_data_19 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe24,
        in_i_data_20 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe25,
        in_i_data_21 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe26,
        in_i_data_22 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe27,
        in_i_data_23 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe28,
        in_i_data_24 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe29,
        in_i_data_25 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe30,
        in_i_data_26 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe31,
        in_i_data_27 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe32,
        in_i_data_28 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe33,
        in_i_data_29 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe34,
        in_i_data_30 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe35,
        in_i_data_31 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe36,
        in_i_data_32 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe37,
        in_i_data_33 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe38,
        in_i_data_34 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe39,
        in_i_data_35 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe40,
        in_i_data_36 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe41,
        in_i_data_37 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe42,
        in_i_data_38 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe43,
        in_i_data_39 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe44,
        in_i_data_40 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe45,
        in_i_data_41 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe46,
        in_i_data_42 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe47,
        in_i_data_43 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe48,
        in_i_data_44 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe49,
        in_i_data_45 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe50,
        in_i_data_46 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe116,
        in_i_data_47 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_acl_hw_wg_id43,
        in_i_stall => bb_ethash_calculate_dag_item_B1_aunroll_x_out_stall_out_0,
        in_i_valid => bb_ethash_calculate_dag_item_B1_aunroll_x_out_valid_out_1,
        out_o_data_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_9,
        out_o_data_10 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_10,
        out_o_data_11 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_11,
        out_o_data_12 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_12,
        out_o_data_13 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_13,
        out_o_data_14 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_14,
        out_o_data_15 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_15,
        out_o_data_16 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_16,
        out_o_data_17 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_17,
        out_o_data_18 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_18,
        out_o_data_19 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_19,
        out_o_data_20 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_20,
        out_o_data_21 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_21,
        out_o_data_22 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_22,
        out_o_data_23 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_23,
        out_o_data_24 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_24,
        out_o_data_25 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_25,
        out_o_data_26 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_26,
        out_o_data_27 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_27,
        out_o_data_28 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_28,
        out_o_data_29 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_29,
        out_o_data_30 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_30,
        out_o_data_31 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_31,
        out_o_data_32 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_32,
        out_o_data_33 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_33,
        out_o_data_34 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_34,
        out_o_data_35 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_35,
        out_o_data_36 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_36,
        out_o_data_37 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_37,
        out_o_data_38 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_38,
        out_o_data_39 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_39,
        out_o_data_40 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_40,
        out_o_data_41 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_41,
        out_o_data_42 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_42,
        out_o_data_43 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_43,
        out_o_data_44 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_44,
        out_o_data_45 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_45,
        out_o_data_46 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_46,
        out_o_data_47 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_47,
        out_o_stall => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_calculate_dag_item_B1_aunroll_x(BLACKBOX,2)
    thebb_ethash_calculate_dag_item_B1_aunroll_x : bb_ethash_calculate_dag_item_B1
    PORT MAP (
        in_acl_hw_wg_id43_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_47,
        in_acl_hw_wg_id43_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_47,
        in_c0_exe116_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_46,
        in_c0_exe116_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_46,
        in_dag_node_pm_0_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_0,
        in_dag_node_pm_0_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_0,
        in_g_dag => in_arg_g_dag,
        in_g_light => in_arg_g_light,
        in_isolate => in_arg_isolate,
        in_r_0_i_i_ph_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_45,
        in_r_0_i_i_ph_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_45,
        in_scalarizer_01389_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_3,
        in_scalarizer_01389_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_3,
        in_scalarizer_01391_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_5,
        in_scalarizer_01391_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_5,
        in_scalarizer_01393_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_7,
        in_scalarizer_01393_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_7,
        in_scalarizer_01395_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_9,
        in_scalarizer_01395_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_9,
        in_scalarizer_01397_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_11,
        in_scalarizer_01397_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_11,
        in_scalarizer_01399_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_13,
        in_scalarizer_01399_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_13,
        in_scalarizer_01401_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_15,
        in_scalarizer_01401_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_15,
        in_scalarizer_01403_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_17,
        in_scalarizer_01403_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_17,
        in_scalarizer_01405_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_19,
        in_scalarizer_01405_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_19,
        in_scalarizer_01407_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_21,
        in_scalarizer_01407_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_21,
        in_scalarizer_01409_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_23,
        in_scalarizer_01409_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_23,
        in_scalarizer_01411_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_25,
        in_scalarizer_01411_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_25,
        in_scalarizer_01413_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_27,
        in_scalarizer_01413_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_27,
        in_scalarizer_01415_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_29,
        in_scalarizer_01415_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_29,
        in_scalarizer_01417_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_31,
        in_scalarizer_01417_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_31,
        in_scalarizer_01419_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_33,
        in_scalarizer_01419_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_33,
        in_scalarizer_01421_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_35,
        in_scalarizer_01421_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_35,
        in_scalarizer_01423_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_37,
        in_scalarizer_01423_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_37,
        in_scalarizer_01425_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_39,
        in_scalarizer_01425_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_39,
        in_scalarizer_01427_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_41,
        in_scalarizer_01427_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_41,
        in_scalarizer_01429_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_43,
        in_scalarizer_01429_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_43,
        in_scalarizer_0_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_1,
        in_scalarizer_0_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_1,
        in_scalarizer_11390_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_4,
        in_scalarizer_11390_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_4,
        in_scalarizer_11392_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_6,
        in_scalarizer_11392_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_6,
        in_scalarizer_11394_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_8,
        in_scalarizer_11394_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_8,
        in_scalarizer_11396_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_10,
        in_scalarizer_11396_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_10,
        in_scalarizer_11398_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_12,
        in_scalarizer_11398_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_12,
        in_scalarizer_11400_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_14,
        in_scalarizer_11400_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_14,
        in_scalarizer_11402_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_16,
        in_scalarizer_11402_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_16,
        in_scalarizer_11404_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_18,
        in_scalarizer_11404_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_18,
        in_scalarizer_11406_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_20,
        in_scalarizer_11406_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_20,
        in_scalarizer_11408_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_22,
        in_scalarizer_11408_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_22,
        in_scalarizer_11410_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_24,
        in_scalarizer_11410_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_24,
        in_scalarizer_11412_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_26,
        in_scalarizer_11412_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_26,
        in_scalarizer_11414_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_28,
        in_scalarizer_11414_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_28,
        in_scalarizer_11416_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_30,
        in_scalarizer_11416_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_30,
        in_scalarizer_11418_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_32,
        in_scalarizer_11418_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_32,
        in_scalarizer_11420_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_34,
        in_scalarizer_11420_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_34,
        in_scalarizer_11422_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_36,
        in_scalarizer_11422_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_36,
        in_scalarizer_11424_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_38,
        in_scalarizer_11424_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_38,
        in_scalarizer_11426_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_40,
        in_scalarizer_11426_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_40,
        in_scalarizer_11428_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_42,
        in_scalarizer_11428_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_42,
        in_scalarizer_11430_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_44,
        in_scalarizer_11430_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_44,
        in_scalarizer_1_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_data_2,
        in_scalarizer_1_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_data_2,
        in_stall_in_0 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_stall,
        in_stall_in_1 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_stall,
        in_valid_in_0 => bb_ethash_calculate_dag_item_B1_sr_0_aunroll_x_out_o_valid,
        in_valid_in_1 => bb_ethash_calculate_dag_item_B1_sr_1_aunroll_x_out_o_valid,
        out_c0_exit11_0 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_0,
        out_c0_exit11_1 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_1,
        out_c0_exit11_2 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_2,
        out_c0_exit11_3 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_3,
        out_c0_exit11_4 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_4,
        out_c0_exit11_5 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_5,
        out_c0_exit11_6 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_6,
        out_c0_exit11_7 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_7,
        out_c0_exit11_8 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_8,
        out_c0_exit11_9 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_9,
        out_c0_exit11_10 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_10,
        out_c0_exit11_11 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_11,
        out_c0_exit11_12 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_12,
        out_c0_exit11_13 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_13,
        out_c0_exit11_14 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_14,
        out_c0_exit11_15 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_15,
        out_c0_exit11_16 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_16,
        out_c0_exit11_17 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_17,
        out_c0_exit11_18 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_18,
        out_c0_exit11_19 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_19,
        out_c0_exit11_20 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_20,
        out_c0_exit11_21 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_21,
        out_c0_exit11_22 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_22,
        out_c0_exit11_23 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_23,
        out_c0_exit11_24 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_24,
        out_c0_exit11_25 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_25,
        out_c0_exit11_26 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_26,
        out_c0_exit11_27 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_27,
        out_c0_exit11_28 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_28,
        out_c0_exit11_29 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_29,
        out_c0_exit11_30 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_30,
        out_c0_exit11_31 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_31,
        out_c0_exit11_32 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_32,
        out_c0_exit11_33 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_33,
        out_c0_exit11_34 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_34,
        out_c0_exit11_35 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_35,
        out_c0_exit11_36 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_36,
        out_c0_exit11_37 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_37,
        out_c0_exit11_38 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_38,
        out_c0_exit11_39 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_39,
        out_c0_exit11_40 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_40,
        out_c0_exit11_41 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_41,
        out_c0_exit11_42 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_42,
        out_c0_exit11_43 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_43,
        out_c0_exit11_44 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_44,
        out_c0_exit11_45 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_45,
        out_c0_exit11_46 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_46,
        out_c0_exit11_47 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_47,
        out_c0_exit11_48 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_48,
        out_c0_exit11_49 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_49,
        out_c0_exit11_50 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_50,
        out_acl_hw_wg_id43 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_acl_hw_wg_id43,
        out_c0_exe10 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe10,
        out_c0_exe11 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe11,
        out_c0_exe112 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe112,
        out_c0_exe116 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe116,
        out_c0_exe12 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe12,
        out_c0_exe13 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe13,
        out_c0_exe14 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe14,
        out_c0_exe15 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe15,
        out_c0_exe16 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe16,
        out_c0_exe17 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe17,
        out_c0_exe18 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe18,
        out_c0_exe19 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe19,
        out_c0_exe20 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe20,
        out_c0_exe21 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe21,
        out_c0_exe213 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe213,
        out_c0_exe22 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe22,
        out_c0_exe23 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe23,
        out_c0_exe24 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe24,
        out_c0_exe25 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe25,
        out_c0_exe26 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe26,
        out_c0_exe27 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe27,
        out_c0_exe28 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe28,
        out_c0_exe29 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe29,
        out_c0_exe30 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe30,
        out_c0_exe31 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe31,
        out_c0_exe32 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe32,
        out_c0_exe33 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe33,
        out_c0_exe34 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe34,
        out_c0_exe35 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe35,
        out_c0_exe36 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe36,
        out_c0_exe37 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe37,
        out_c0_exe38 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe38,
        out_c0_exe39 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe39,
        out_c0_exe40 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe40,
        out_c0_exe41 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe41,
        out_c0_exe42 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe42,
        out_c0_exe43 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe43,
        out_c0_exe44 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe44,
        out_c0_exe45 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe45,
        out_c0_exe46 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe46,
        out_c0_exe47 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe47,
        out_c0_exe48 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe48,
        out_c0_exe49 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe49,
        out_c0_exe5 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe5,
        out_c0_exe50 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe50,
        out_c0_exe6 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe6,
        out_c0_exe7 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe7,
        out_c0_exe8 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe8,
        out_c0_exe9 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe9,
        out_dag_node_pm_0 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_dag_node_pm_0,
        out_stall_out_0 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_stall_out_0,
        out_stall_out_1 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_stall_out_1,
        out_valid_out_0 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_valid_out_0,
        out_valid_out_1 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x(BLACKBOX,6)
    thebb_ethash_calculate_dag_item_B2_sr_0_aunroll_x : bb_ethash_calculate_dag_item_B2_sr_0
    PORT MAP (
        in_i_data_0 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe116,
        in_i_data_1 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_dag_node_pm_0,
        in_i_data_2 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_0,
        in_i_data_3 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_1,
        in_i_data_4 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_2,
        in_i_data_5 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_3,
        in_i_data_6 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_4,
        in_i_data_7 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_5,
        in_i_data_8 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_6,
        in_i_data_9 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_7,
        in_i_data_10 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_8,
        in_i_data_11 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_9,
        in_i_data_12 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_10,
        in_i_data_13 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_11,
        in_i_data_14 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_12,
        in_i_data_15 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_13,
        in_i_data_16 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_14,
        in_i_data_17 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_15,
        in_i_data_18 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_16,
        in_i_data_19 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_17,
        in_i_data_20 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_18,
        in_i_data_21 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_19,
        in_i_data_22 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_20,
        in_i_data_23 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_21,
        in_i_data_24 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_22,
        in_i_data_25 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_23,
        in_i_data_26 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_24,
        in_i_data_27 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_25,
        in_i_data_28 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_26,
        in_i_data_29 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_27,
        in_i_data_30 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_28,
        in_i_data_31 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_29,
        in_i_data_32 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_30,
        in_i_data_33 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_31,
        in_i_data_34 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_32,
        in_i_data_35 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_33,
        in_i_data_36 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_34,
        in_i_data_37 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_35,
        in_i_data_38 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_36,
        in_i_data_39 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_37,
        in_i_data_40 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_38,
        in_i_data_41 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_39,
        in_i_data_42 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_40,
        in_i_data_43 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_41,
        in_i_data_44 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_42,
        in_i_data_45 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_43,
        in_i_data_46 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_44,
        in_i_data_47 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_45,
        in_i_data_48 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_46,
        in_i_data_49 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_47,
        in_i_data_50 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_48,
        in_i_data_51 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_49,
        in_i_data_52 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exit11_50,
        in_i_data_53 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe112,
        in_i_data_54 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_c0_exe213,
        in_i_data_55 => bb_ethash_calculate_dag_item_B1_aunroll_x_out_acl_hw_wg_id43,
        in_i_stall => bb_ethash_calculate_dag_item_B2_aunroll_x_out_stall_out_0,
        in_i_valid => bb_ethash_calculate_dag_item_B1_aunroll_x_out_valid_out_0,
        out_o_data_0 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_9,
        out_o_data_10 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_10,
        out_o_data_11 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_11,
        out_o_data_12 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_12,
        out_o_data_13 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_13,
        out_o_data_14 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_14,
        out_o_data_15 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_15,
        out_o_data_16 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_16,
        out_o_data_17 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_17,
        out_o_data_18 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_18,
        out_o_data_19 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_19,
        out_o_data_20 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_20,
        out_o_data_21 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_21,
        out_o_data_22 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_22,
        out_o_data_23 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_23,
        out_o_data_24 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_24,
        out_o_data_25 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_25,
        out_o_data_26 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_26,
        out_o_data_27 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_27,
        out_o_data_28 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_28,
        out_o_data_29 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_29,
        out_o_data_30 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_30,
        out_o_data_31 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_31,
        out_o_data_32 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_32,
        out_o_data_33 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_33,
        out_o_data_34 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_34,
        out_o_data_35 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_35,
        out_o_data_36 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_36,
        out_o_data_37 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_37,
        out_o_data_38 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_38,
        out_o_data_39 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_39,
        out_o_data_40 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_40,
        out_o_data_41 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_41,
        out_o_data_42 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_42,
        out_o_data_43 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_43,
        out_o_data_44 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_44,
        out_o_data_45 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_45,
        out_o_data_46 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_46,
        out_o_data_47 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_47,
        out_o_data_48 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_48,
        out_o_data_49 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_49,
        out_o_data_50 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_50,
        out_o_data_51 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_51,
        out_o_data_52 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_52,
        out_o_data_53 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_53,
        out_o_data_54 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_54,
        out_o_data_55 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_55,
        out_o_stall => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_calculate_dag_item_B2_aunroll_x(BLACKBOX,5)
    thebb_ethash_calculate_dag_item_B2_aunroll_x : bb_ethash_calculate_dag_item_B2
    PORT MAP (
        in_c0_exit1118_0_0 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_2,
        in_c0_exit1118_0_1 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_3,
        in_c0_exit1118_0_2 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_4,
        in_c0_exit1118_0_3 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_5,
        in_c0_exit1118_0_4 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_6,
        in_c0_exit1118_0_5 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_7,
        in_c0_exit1118_0_6 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_8,
        in_c0_exit1118_0_7 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_9,
        in_c0_exit1118_0_8 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_10,
        in_c0_exit1118_0_9 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_11,
        in_c0_exit1118_0_10 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_12,
        in_c0_exit1118_0_11 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_13,
        in_c0_exit1118_0_12 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_14,
        in_c0_exit1118_0_13 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_15,
        in_c0_exit1118_0_14 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_16,
        in_c0_exit1118_0_15 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_17,
        in_c0_exit1118_0_16 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_18,
        in_c0_exit1118_0_17 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_19,
        in_c0_exit1118_0_18 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_20,
        in_c0_exit1118_0_19 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_21,
        in_c0_exit1118_0_20 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_22,
        in_c0_exit1118_0_21 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_23,
        in_c0_exit1118_0_22 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_24,
        in_c0_exit1118_0_23 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_25,
        in_c0_exit1118_0_24 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_26,
        in_c0_exit1118_0_25 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_27,
        in_c0_exit1118_0_26 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_28,
        in_c0_exit1118_0_27 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_29,
        in_c0_exit1118_0_28 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_30,
        in_c0_exit1118_0_29 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_31,
        in_c0_exit1118_0_30 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_32,
        in_c0_exit1118_0_31 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_33,
        in_c0_exit1118_0_32 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_34,
        in_c0_exit1118_0_33 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_35,
        in_c0_exit1118_0_34 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_36,
        in_c0_exit1118_0_35 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_37,
        in_c0_exit1118_0_36 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_38,
        in_c0_exit1118_0_37 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_39,
        in_c0_exit1118_0_38 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_40,
        in_c0_exit1118_0_39 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_41,
        in_c0_exit1118_0_40 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_42,
        in_c0_exit1118_0_41 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_43,
        in_c0_exit1118_0_42 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_44,
        in_c0_exit1118_0_43 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_45,
        in_c0_exit1118_0_44 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_46,
        in_c0_exit1118_0_45 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_47,
        in_c0_exit1118_0_46 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_48,
        in_c0_exit1118_0_47 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_49,
        in_c0_exit1118_0_48 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_50,
        in_c0_exit1118_0_49 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_51,
        in_c0_exit1118_0_50 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_52,
        in_acl_hw_wg_id42_0 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_55,
        in_c0_exe11222_0 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_53,
        in_c0_exe115_0 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_0,
        in_c0_exe21327_0 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_54,
        in_dag_node_pm_017_0 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_data_1,
        in_g_dag => in_arg_g_dag,
        in_g_light => in_arg_g_light,
        in_stall_in_0 => loop_limiter_ethash_calculate_dag_item1_out_o_stall,
        in_valid_in_0 => bb_ethash_calculate_dag_item_B2_sr_0_aunroll_x_out_o_valid,
        out_acl_hw_wg_id42 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_acl_hw_wg_id42,
        out_c0_exe11222 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_c0_exe11222,
        out_c0_exe115 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_c0_exe115,
        out_c0_exe21327 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_c0_exe21327,
        out_dag_node_pm_017 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_dag_node_pm_017,
        out_pre693_pml_t_bitcast_0 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre693_pml_t_bitcast_0,
        out_pre693_pml_t_bitcast_1 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre693_pml_t_bitcast_1,
        out_pre693_pml_t_bitcast_2 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre693_pml_t_bitcast_2,
        out_pre693_pml_t_bitcast_3 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre693_pml_t_bitcast_3,
        out_pre694_pml_t_bitcast_0 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre694_pml_t_bitcast_0,
        out_pre694_pml_t_bitcast_1 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre694_pml_t_bitcast_1,
        out_pre694_pml_t_bitcast_2 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre694_pml_t_bitcast_2,
        out_pre694_pml_t_bitcast_3 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre694_pml_t_bitcast_3,
        out_pre695_pml_t_bitcast_0 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre695_pml_t_bitcast_0,
        out_pre695_pml_t_bitcast_1 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre695_pml_t_bitcast_1,
        out_pre695_pml_t_bitcast_2 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre695_pml_t_bitcast_2,
        out_pre695_pml_t_bitcast_3 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre695_pml_t_bitcast_3,
        out_pre_pml_t_bitcast_0 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre_pml_t_bitcast_0,
        out_pre_pml_t_bitcast_1 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre_pml_t_bitcast_1,
        out_pre_pml_t_bitcast_2 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre_pml_t_bitcast_2,
        out_pre_pml_t_bitcast_3 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre_pml_t_bitcast_3,
        out_stall_out_0 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_stall_out_0,
        out_valid_out_0 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- c_i9_254(CONSTANT,89)
    c_i9_254_q <= "011111110";

    -- bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x(BLACKBOX,9)
    thebb_ethash_calculate_dag_item_B3_sr_1_aunroll_x : bb_ethash_calculate_dag_item_B3_sr_1
    PORT MAP (
        in_i_data_0 => c_i9_254_q,
        in_i_data_1 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_dag_node_pm_017,
        in_i_data_2 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre695_pml_t_bitcast_0,
        in_i_data_3 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre695_pml_t_bitcast_1,
        in_i_data_4 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre695_pml_t_bitcast_2,
        in_i_data_5 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre695_pml_t_bitcast_3,
        in_i_data_6 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre694_pml_t_bitcast_0,
        in_i_data_7 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre694_pml_t_bitcast_1,
        in_i_data_8 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre694_pml_t_bitcast_2,
        in_i_data_9 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre694_pml_t_bitcast_3,
        in_i_data_10 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre693_pml_t_bitcast_0,
        in_i_data_11 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre693_pml_t_bitcast_1,
        in_i_data_12 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre693_pml_t_bitcast_2,
        in_i_data_13 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre693_pml_t_bitcast_3,
        in_i_data_14 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre_pml_t_bitcast_0,
        in_i_data_15 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre_pml_t_bitcast_1,
        in_i_data_16 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre_pml_t_bitcast_2,
        in_i_data_17 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_pre_pml_t_bitcast_3,
        in_i_data_18 => dupName_0_c_i32_0gr_x_q,
        in_i_data_19 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_c0_exe115,
        in_i_data_20 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_c0_exe11222,
        in_i_data_21 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_c0_exe21327,
        in_i_data_22 => bb_ethash_calculate_dag_item_B2_aunroll_x_out_acl_hw_wg_id42,
        in_i_stall => bb_ethash_calculate_dag_item_B3_aunroll_x_out_stall_out_1,
        in_i_valid => loop_limiter_ethash_calculate_dag_item1_out_o_valid,
        out_o_data_0 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_9,
        out_o_data_10 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_10,
        out_o_data_11 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_11,
        out_o_data_12 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_12,
        out_o_data_13 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_13,
        out_o_data_14 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_14,
        out_o_data_15 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_15,
        out_o_data_16 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_16,
        out_o_data_17 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_17,
        out_o_data_18 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_18,
        out_o_data_19 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_19,
        out_o_data_20 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_20,
        out_o_data_21 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_21,
        out_o_data_22 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_22,
        out_o_stall => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_stall,
        out_o_valid => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x(BLACKBOX,8)
    thebb_ethash_calculate_dag_item_B3_sr_0_aunroll_x : bb_ethash_calculate_dag_item_B3_sr_0
    PORT MAP (
        in_i_data_0 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_fpgaindvars_iv_next,
        in_i_data_1 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe20,
        in_i_data_2 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe15,
        in_i_data_3 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe16,
        in_i_data_4 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe17,
        in_i_data_5 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe18,
        in_i_data_6 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe10,
        in_i_data_7 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe11,
        in_i_data_8 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe12,
        in_i_data_9 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe13,
        in_i_data_10 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe5,
        in_i_data_11 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe6,
        in_i_data_12 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe7,
        in_i_data_13 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe8,
        in_i_data_14 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe1,
        in_i_data_15 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe2,
        in_i_data_16 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe3,
        in_i_data_17 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe4,
        in_i_data_18 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_inc43,
        in_i_data_19 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c0_exe114,
        in_i_data_20 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c0_exe11221,
        in_i_data_21 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c0_exe21326,
        in_i_data_22 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_acl_hw_wg_id41,
        in_i_stall => bb_ethash_calculate_dag_item_B3_aunroll_x_out_stall_out_0,
        in_i_valid => bb_ethash_calculate_dag_item_B3_aunroll_x_out_valid_out_1,
        out_o_data_0 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_9,
        out_o_data_10 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_10,
        out_o_data_11 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_11,
        out_o_data_12 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_12,
        out_o_data_13 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_13,
        out_o_data_14 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_14,
        out_o_data_15 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_15,
        out_o_data_16 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_16,
        out_o_data_17 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_17,
        out_o_data_18 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_18,
        out_o_data_19 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_19,
        out_o_data_20 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_20,
        out_o_data_21 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_21,
        out_o_data_22 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_22,
        out_o_stall => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_calculate_dag_item_B3_aunroll_x(BLACKBOX,7)
    thebb_ethash_calculate_dag_item_B3_aunroll_x : bb_ethash_calculate_dag_item_B3
    PORT MAP (
        in_acl_hw_wg_id41_0 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_22,
        in_acl_hw_wg_id41_1 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_22,
        in_c0_exe11221_0 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_20,
        in_c0_exe11221_1 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_20,
        in_c0_exe114_0 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_19,
        in_c0_exe114_1 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_19,
        in_c0_exe21326_0 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_21,
        in_c0_exe21326_1 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_21,
        in_dag_node_pm_1_0 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_1,
        in_dag_node_pm_1_1 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_1,
        in_flush => in_start,
        in_fpgaindvars_iv_0 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_0,
        in_fpgaindvars_iv_1 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_0,
        in_g_dag => in_arg_g_dag,
        in_g_light => in_arg_g_light,
        in_i11_0687_0 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_18,
        in_i11_0687_1 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_18,
        in_memcoalesce_g_light_load_02193_avm_readdata => in_memcoalesce_g_light_load_02193_avm_readdata,
        in_memcoalesce_g_light_load_02193_avm_readdatavalid => in_memcoalesce_g_light_load_02193_avm_readdatavalid,
        in_memcoalesce_g_light_load_02193_avm_waitrequest => in_memcoalesce_g_light_load_02193_avm_waitrequest,
        in_memcoalesce_g_light_load_02193_avm_writeack => in_memcoalesce_g_light_load_02193_avm_writeack,
        in_scalarizer_01585_0 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_2,
        in_scalarizer_01585_1 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_2,
        in_scalarizer_01587_0 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_6,
        in_scalarizer_01587_1 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_6,
        in_scalarizer_01591_0 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_10,
        in_scalarizer_01591_1 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_10,
        in_scalarizer_01595_0 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_14,
        in_scalarizer_01595_1 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_14,
        in_scalarizer_11586_0 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_3,
        in_scalarizer_11586_1 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_3,
        in_scalarizer_11588_0 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_7,
        in_scalarizer_11588_1 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_7,
        in_scalarizer_11592_0 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_11,
        in_scalarizer_11592_1 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_11,
        in_scalarizer_11596_0 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_15,
        in_scalarizer_11596_1 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_15,
        in_scalarizer_21589_0 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_8,
        in_scalarizer_21589_1 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_8,
        in_scalarizer_21593_0 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_12,
        in_scalarizer_21593_1 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_12,
        in_scalarizer_21597_0 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_16,
        in_scalarizer_21597_1 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_16,
        in_scalarizer_2_0 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_4,
        in_scalarizer_2_1 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_4,
        in_scalarizer_31590_0 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_9,
        in_scalarizer_31590_1 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_9,
        in_scalarizer_31594_0 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_13,
        in_scalarizer_31594_1 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_13,
        in_scalarizer_31598_0 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_17,
        in_scalarizer_31598_1 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_17,
        in_scalarizer_3_0 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_data_5,
        in_scalarizer_3_1 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_data_5,
        in_stall_in_0 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_stall,
        in_stall_in_1 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_stall,
        in_valid_in_0 => bb_ethash_calculate_dag_item_B3_sr_0_aunroll_x_out_o_valid,
        in_valid_in_1 => bb_ethash_calculate_dag_item_B3_sr_1_aunroll_x_out_o_valid,
        out_c1_exit_0 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_0,
        out_c1_exit_1 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_1,
        out_c1_exit_2 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_2,
        out_c1_exit_3 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_3,
        out_c1_exit_4 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_4,
        out_c1_exit_5 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_5,
        out_c1_exit_6 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_6,
        out_c1_exit_7 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_7,
        out_c1_exit_8 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_8,
        out_c1_exit_9 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_9,
        out_c1_exit_10 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_10,
        out_c1_exit_11 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_11,
        out_c1_exit_12 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_12,
        out_c1_exit_13 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_13,
        out_c1_exit_14 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_14,
        out_c1_exit_15 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_15,
        out_c1_exit_16 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_16,
        out_c1_exit_17 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_17,
        out_c1_exit_18 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_18,
        out_c1_exit_19 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_19,
        out_c1_exit_20 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_20,
        out_acl_hw_wg_id41 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_acl_hw_wg_id41,
        out_c0_exe11221 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c0_exe11221,
        out_c0_exe114 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c0_exe114,
        out_c0_exe21326 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c0_exe21326,
        out_c1_exe1 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe1,
        out_c1_exe10 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe10,
        out_c1_exe11 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe11,
        out_c1_exe12 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe12,
        out_c1_exe13 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe13,
        out_c1_exe15 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe15,
        out_c1_exe16 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe16,
        out_c1_exe17 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe17,
        out_c1_exe18 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe18,
        out_c1_exe2 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe2,
        out_c1_exe20 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe20,
        out_c1_exe3 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe3,
        out_c1_exe4 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe4,
        out_c1_exe5 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe5,
        out_c1_exe6 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe6,
        out_c1_exe7 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe7,
        out_c1_exe8 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe8,
        out_fpgaindvars_iv_next => bb_ethash_calculate_dag_item_B3_aunroll_x_out_fpgaindvars_iv_next,
        out_inc43 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_inc43,
        out_memcoalesce_g_light_load_02193_avm_address => bb_ethash_calculate_dag_item_B3_aunroll_x_out_memcoalesce_g_light_load_02193_avm_address,
        out_memcoalesce_g_light_load_02193_avm_burstcount => bb_ethash_calculate_dag_item_B3_aunroll_x_out_memcoalesce_g_light_load_02193_avm_burstcount,
        out_memcoalesce_g_light_load_02193_avm_byteenable => bb_ethash_calculate_dag_item_B3_aunroll_x_out_memcoalesce_g_light_load_02193_avm_byteenable,
        out_memcoalesce_g_light_load_02193_avm_enable => bb_ethash_calculate_dag_item_B3_aunroll_x_out_memcoalesce_g_light_load_02193_avm_enable,
        out_memcoalesce_g_light_load_02193_avm_read => bb_ethash_calculate_dag_item_B3_aunroll_x_out_memcoalesce_g_light_load_02193_avm_read,
        out_memcoalesce_g_light_load_02193_avm_write => bb_ethash_calculate_dag_item_B3_aunroll_x_out_memcoalesce_g_light_load_02193_avm_write,
        out_memcoalesce_g_light_load_02193_avm_writedata => bb_ethash_calculate_dag_item_B3_aunroll_x_out_memcoalesce_g_light_load_02193_avm_writedata,
        out_stall_out_0 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_stall_out_0,
        out_stall_out_1 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_stall_out_1,
        out_valid_out_0 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_valid_out_0,
        out_valid_out_1 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x(BLACKBOX,11)
    thebb_ethash_calculate_dag_item_B4_sr_0_aunroll_x : bb_ethash_calculate_dag_item_B4_sr_0
    PORT MAP (
        in_i_data_0 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c0_exe114,
        in_i_data_1 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c0_exe11221,
        in_i_data_2 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c0_exe21326,
        in_i_data_3 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_0,
        in_i_data_4 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_1,
        in_i_data_5 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_2,
        in_i_data_6 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_3,
        in_i_data_7 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_4,
        in_i_data_8 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_5,
        in_i_data_9 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_6,
        in_i_data_10 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_7,
        in_i_data_11 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_8,
        in_i_data_12 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_9,
        in_i_data_13 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_10,
        in_i_data_14 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_11,
        in_i_data_15 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_12,
        in_i_data_16 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_13,
        in_i_data_17 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_14,
        in_i_data_18 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_15,
        in_i_data_19 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_16,
        in_i_data_20 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_17,
        in_i_data_21 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_18,
        in_i_data_22 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_19,
        in_i_data_23 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exit_20,
        in_i_data_24 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe1,
        in_i_data_25 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe2,
        in_i_data_26 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe10,
        in_i_data_27 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe11,
        in_i_data_28 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe15,
        in_i_data_29 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe16,
        in_i_data_30 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_c1_exe20,
        in_i_data_31 => bb_ethash_calculate_dag_item_B3_aunroll_x_out_acl_hw_wg_id41,
        in_i_stall => bb_ethash_calculate_dag_item_B4_aunroll_x_out_stall_out_0,
        in_i_valid => bb_ethash_calculate_dag_item_B3_aunroll_x_out_valid_out_0,
        out_o_data_0 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_9,
        out_o_data_10 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_10,
        out_o_data_11 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_11,
        out_o_data_12 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_12,
        out_o_data_13 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_13,
        out_o_data_14 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_14,
        out_o_data_15 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_15,
        out_o_data_16 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_16,
        out_o_data_17 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_17,
        out_o_data_18 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_18,
        out_o_data_19 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_19,
        out_o_data_20 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_20,
        out_o_data_21 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_21,
        out_o_data_22 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_22,
        out_o_data_23 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_23,
        out_o_data_24 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_24,
        out_o_data_25 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_25,
        out_o_data_26 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_26,
        out_o_data_27 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_27,
        out_o_data_28 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_28,
        out_o_data_29 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_29,
        out_o_data_30 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_30,
        out_o_data_31 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_31,
        out_o_stall => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_calculate_dag_item_B4_aunroll_x(BLACKBOX,10)
    thebb_ethash_calculate_dag_item_B4_aunroll_x : bb_ethash_calculate_dag_item_B4
    PORT MAP (
        in_c1_exit28_0_0 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_3,
        in_c1_exit28_0_1 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_4,
        in_c1_exit28_0_2 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_5,
        in_c1_exit28_0_3 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_6,
        in_c1_exit28_0_4 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_7,
        in_c1_exit28_0_5 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_8,
        in_c1_exit28_0_6 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_9,
        in_c1_exit28_0_7 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_10,
        in_c1_exit28_0_8 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_11,
        in_c1_exit28_0_9 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_12,
        in_c1_exit28_0_10 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_13,
        in_c1_exit28_0_11 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_14,
        in_c1_exit28_0_12 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_15,
        in_c1_exit28_0_13 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_16,
        in_c1_exit28_0_14 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_17,
        in_c1_exit28_0_15 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_18,
        in_c1_exit28_0_16 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_19,
        in_c1_exit28_0_17 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_20,
        in_c1_exit28_0_18 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_21,
        in_c1_exit28_0_19 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_22,
        in_c1_exit28_0_20 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_23,
        in_acl_hw_wg_id40_0 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_31,
        in_c0_exe11220_0 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_1,
        in_c0_exe113_0 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_0,
        in_c0_exe21325_0 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_2,
        in_c1_exe1031_0 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_26,
        in_c1_exe1132_0 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_27,
        in_c1_exe129_0 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_24,
        in_c1_exe1533_0 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_28,
        in_c1_exe1634_0 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_29,
        in_c1_exe2035_0 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_30,
        in_c1_exe230_0 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_data_25,
        in_g_dag => in_arg_g_dag,
        in_stall_in_0 => loop_limiter_ethash_calculate_dag_item2_out_o_stall,
        in_valid_in_0 => bb_ethash_calculate_dag_item_B4_sr_0_aunroll_x_out_o_valid,
        out_acl_01644 => bb_ethash_calculate_dag_item_B4_aunroll_x_out_acl_01644,
        out_acl_01646 => bb_ethash_calculate_dag_item_B4_aunroll_x_out_acl_01646,
        out_acl_01648 => bb_ethash_calculate_dag_item_B4_aunroll_x_out_acl_01648,
        out_acl_11645 => bb_ethash_calculate_dag_item_B4_aunroll_x_out_acl_11645,
        out_acl_11647 => bb_ethash_calculate_dag_item_B4_aunroll_x_out_acl_11647,
        out_acl_11649 => bb_ethash_calculate_dag_item_B4_aunroll_x_out_acl_11649,
        out_acl_hw_wg_id40 => bb_ethash_calculate_dag_item_B4_aunroll_x_out_acl_hw_wg_id40,
        out_c0_exe11220 => bb_ethash_calculate_dag_item_B4_aunroll_x_out_c0_exe11220,
        out_c0_exe113 => bb_ethash_calculate_dag_item_B4_aunroll_x_out_c0_exe113,
        out_c0_exe21325 => bb_ethash_calculate_dag_item_B4_aunroll_x_out_c0_exe21325,
        out_c1_exe1031 => bb_ethash_calculate_dag_item_B4_aunroll_x_out_c1_exe1031,
        out_c1_exe1132 => bb_ethash_calculate_dag_item_B4_aunroll_x_out_c1_exe1132,
        out_c1_exe129 => bb_ethash_calculate_dag_item_B4_aunroll_x_out_c1_exe129,
        out_c1_exe1533 => bb_ethash_calculate_dag_item_B4_aunroll_x_out_c1_exe1533,
        out_c1_exe1634 => bb_ethash_calculate_dag_item_B4_aunroll_x_out_c1_exe1634,
        out_c1_exe230 => bb_ethash_calculate_dag_item_B4_aunroll_x_out_c1_exe230,
        out_pms_cs1241_pms_vs_pms_vm_pms_d => bb_ethash_calculate_dag_item_B4_aunroll_x_out_pms_cs1241_pms_vs_pms_vm_pms_d,
        out_stall_out_0 => bb_ethash_calculate_dag_item_B4_aunroll_x_out_stall_out_0,
        out_valid_out_0 => bb_ethash_calculate_dag_item_B4_aunroll_x_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x(BLACKBOX,14)
    thebb_ethash_calculate_dag_item_B5_sr_1_aunroll_x : bb_ethash_calculate_dag_item_B5_sr_1
    PORT MAP (
        in_i_data_0 => bb_ethash_calculate_dag_item_B4_aunroll_x_out_pms_cs1241_pms_vs_pms_vm_pms_d,
        in_i_data_1 => dupName_0_c_i32_0gr_x_q,
        in_i_data_2 => dupName_0_c_i32_0gr_x_q,
        in_i_data_3 => dupName_0_c_i32_0gr_x_q,
        in_i_data_4 => dupName_0_c_i32_0gr_x_q,
        in_i_data_5 => dupName_0_c_i32_0gr_x_q,
        in_i_data_6 => dupName_0_c_i32_0gr_x_q,
        in_i_data_7 => dupName_0_c_i32_0gr_x_q,
        in_i_data_8 => dupName_0_c_i32_0gr_x_q,
        in_i_data_9 => bb_ethash_calculate_dag_item_B4_aunroll_x_out_c1_exe1031,
        in_i_data_10 => bb_ethash_calculate_dag_item_B4_aunroll_x_out_c1_exe1132,
        in_i_data_11 => dupName_0_c_i32_0gr_x_q,
        in_i_data_12 => dupName_0_c_i32_0gr_x_q,
        in_i_data_13 => dupName_0_c_i32_0gr_x_q,
        in_i_data_14 => dupName_0_c_i32_0gr_x_q,
        in_i_data_15 => dupName_0_c_i32_0gr_x_q,
        in_i_data_16 => dupName_0_c_i32_0gr_x_q,
        in_i_data_17 => bb_ethash_calculate_dag_item_B4_aunroll_x_out_acl_01644,
        in_i_data_18 => bb_ethash_calculate_dag_item_B4_aunroll_x_out_acl_11645,
        in_i_data_19 => dupName_0_c_i32_0gr_x_q,
        in_i_data_20 => dupName_0_c_i32_0gr_x_q,
        in_i_data_21 => dupName_0_c_i32_0gr_x_q,
        in_i_data_22 => dupName_0_c_i32_0gr_x_q,
        in_i_data_23 => dupName_0_c_i32_0gr_x_q,
        in_i_data_24 => dupName_0_c_i32_0gr_x_q,
        in_i_data_25 => bb_ethash_calculate_dag_item_B4_aunroll_x_out_acl_01646,
        in_i_data_26 => bb_ethash_calculate_dag_item_B4_aunroll_x_out_acl_11647,
        in_i_data_27 => dupName_0_c_i32_0gr_x_q,
        in_i_data_28 => dupName_0_c_i32_0gr_x_q,
        in_i_data_29 => dupName_0_c_i32_0gr_x_q,
        in_i_data_30 => dupName_0_c_i32_0gr_x_q,
        in_i_data_31 => dupName_0_c_i32_0gr_x_q,
        in_i_data_32 => dupName_0_c_i32_0gr_x_q,
        in_i_data_33 => bb_ethash_calculate_dag_item_B4_aunroll_x_out_c1_exe1533,
        in_i_data_34 => bb_ethash_calculate_dag_item_B4_aunroll_x_out_c1_exe1634,
        in_i_data_35 => dupName_0_c_i32_0gr_x_q,
        in_i_data_36 => dupName_0_c_i32_0gr_x_q,
        in_i_data_37 => dupName_0_c_i32_0gr_x_q,
        in_i_data_38 => dupName_0_c_i32_0gr_x_q,
        in_i_data_39 => dupName_0_c_i32_0gr_x_q,
        in_i_data_40 => dupName_0_c_i32_0gr_x_q,
        in_i_data_41 => bb_ethash_calculate_dag_item_B4_aunroll_x_out_acl_01648,
        in_i_data_42 => bb_ethash_calculate_dag_item_B4_aunroll_x_out_acl_11649,
        in_i_data_43 => bb_ethash_calculate_dag_item_B4_aunroll_x_out_c1_exe129,
        in_i_data_44 => bb_ethash_calculate_dag_item_B4_aunroll_x_out_c1_exe230,
        in_i_data_45 => dupName_0_c_i32_1gr_x_q,
        in_i_data_46 => dupName_0_c_i32_2147483648_x_q,
        in_i_data_47 => dupName_0_c_i32_0gr_x_q,
        in_i_data_48 => bb_ethash_calculate_dag_item_B4_aunroll_x_out_c0_exe113,
        in_i_data_49 => bb_ethash_calculate_dag_item_B4_aunroll_x_out_c0_exe11220,
        in_i_data_50 => bb_ethash_calculate_dag_item_B4_aunroll_x_out_c0_exe21325,
        in_i_data_51 => bb_ethash_calculate_dag_item_B4_aunroll_x_out_acl_hw_wg_id40,
        in_i_stall => bb_ethash_calculate_dag_item_B5_aunroll_x_out_stall_out_1,
        in_i_valid => loop_limiter_ethash_calculate_dag_item2_out_o_valid,
        out_o_data_0 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_9,
        out_o_data_10 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_10,
        out_o_data_11 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_11,
        out_o_data_12 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_12,
        out_o_data_13 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_13,
        out_o_data_14 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_14,
        out_o_data_15 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_15,
        out_o_data_16 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_16,
        out_o_data_17 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_17,
        out_o_data_18 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_18,
        out_o_data_19 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_19,
        out_o_data_20 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_20,
        out_o_data_21 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_21,
        out_o_data_22 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_22,
        out_o_data_23 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_23,
        out_o_data_24 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_24,
        out_o_data_25 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_25,
        out_o_data_26 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_26,
        out_o_data_27 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_27,
        out_o_data_28 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_28,
        out_o_data_29 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_29,
        out_o_data_30 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_30,
        out_o_data_31 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_31,
        out_o_data_32 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_32,
        out_o_data_33 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_33,
        out_o_data_34 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_34,
        out_o_data_35 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_35,
        out_o_data_36 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_36,
        out_o_data_37 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_37,
        out_o_data_38 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_38,
        out_o_data_39 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_39,
        out_o_data_40 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_40,
        out_o_data_41 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_41,
        out_o_data_42 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_42,
        out_o_data_43 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_43,
        out_o_data_44 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_44,
        out_o_data_45 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_45,
        out_o_data_46 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_46,
        out_o_data_47 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_47,
        out_o_data_48 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_48,
        out_o_data_49 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_49,
        out_o_data_50 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_50,
        out_o_data_51 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_51,
        out_o_stall => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_stall,
        out_o_valid => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x(BLACKBOX,13)
    thebb_ethash_calculate_dag_item_B5_sr_0_aunroll_x : bb_ethash_calculate_dag_item_B5_sr_0
    PORT MAP (
        in_i_data_0 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe3172,
        in_i_data_1 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe4173,
        in_i_data_2 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe5174,
        in_i_data_3 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe6175,
        in_i_data_4 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe7176,
        in_i_data_5 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe8177,
        in_i_data_6 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe9178,
        in_i_data_7 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe10179,
        in_i_data_8 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe11180,
        in_i_data_9 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe12181,
        in_i_data_10 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe13182,
        in_i_data_11 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe14183,
        in_i_data_12 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe15184,
        in_i_data_13 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe16185,
        in_i_data_14 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe17186,
        in_i_data_15 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe18187,
        in_i_data_16 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe19188,
        in_i_data_17 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe20189,
        in_i_data_18 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe21190,
        in_i_data_19 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe22191,
        in_i_data_20 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe23192,
        in_i_data_21 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe24193,
        in_i_data_22 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe25194,
        in_i_data_23 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe26195,
        in_i_data_24 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe27196,
        in_i_data_25 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe28197,
        in_i_data_26 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe29198,
        in_i_data_27 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe30199,
        in_i_data_28 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe31200,
        in_i_data_29 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe32201,
        in_i_data_30 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe33202,
        in_i_data_31 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe34203,
        in_i_data_32 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe35204,
        in_i_data_33 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe36205,
        in_i_data_34 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe37206,
        in_i_data_35 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe38207,
        in_i_data_36 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe39208,
        in_i_data_37 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe40209,
        in_i_data_38 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe41210,
        in_i_data_39 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe42211,
        in_i_data_40 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe43212,
        in_i_data_41 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe44213,
        in_i_data_42 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe45214,
        in_i_data_43 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe46215,
        in_i_data_44 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe47216,
        in_i_data_45 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe48217,
        in_i_data_46 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe49218,
        in_i_data_47 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe50219,
        in_i_data_48 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe111,
        in_i_data_49 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe11219,
        in_i_data_50 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe21324,
        in_i_data_51 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_acl_hw_wg_id39,
        in_i_stall => bb_ethash_calculate_dag_item_B5_aunroll_x_out_stall_out_0,
        in_i_valid => bb_ethash_calculate_dag_item_B5_aunroll_x_out_valid_out_1,
        out_o_data_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_9,
        out_o_data_10 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_10,
        out_o_data_11 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_11,
        out_o_data_12 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_12,
        out_o_data_13 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_13,
        out_o_data_14 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_14,
        out_o_data_15 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_15,
        out_o_data_16 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_16,
        out_o_data_17 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_17,
        out_o_data_18 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_18,
        out_o_data_19 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_19,
        out_o_data_20 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_20,
        out_o_data_21 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_21,
        out_o_data_22 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_22,
        out_o_data_23 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_23,
        out_o_data_24 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_24,
        out_o_data_25 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_25,
        out_o_data_26 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_26,
        out_o_data_27 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_27,
        out_o_data_28 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_28,
        out_o_data_29 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_29,
        out_o_data_30 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_30,
        out_o_data_31 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_31,
        out_o_data_32 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_32,
        out_o_data_33 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_33,
        out_o_data_34 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_34,
        out_o_data_35 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_35,
        out_o_data_36 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_36,
        out_o_data_37 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_37,
        out_o_data_38 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_38,
        out_o_data_39 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_39,
        out_o_data_40 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_40,
        out_o_data_41 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_41,
        out_o_data_42 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_42,
        out_o_data_43 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_43,
        out_o_data_44 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_44,
        out_o_data_45 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_45,
        out_o_data_46 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_46,
        out_o_data_47 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_47,
        out_o_data_48 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_48,
        out_o_data_49 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_49,
        out_o_data_50 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_50,
        out_o_data_51 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_51,
        out_o_stall => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_calculate_dag_item_B5_aunroll_x(BLACKBOX,12)
    thebb_ethash_calculate_dag_item_B5_aunroll_x : bb_ethash_calculate_dag_item_B5
    PORT MAP (
        in_acl_hw_wg_id39_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_51,
        in_acl_hw_wg_id39_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_51,
        in_c0_exe111_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_48,
        in_c0_exe111_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_48,
        in_c0_exe11219_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_49,
        in_c0_exe11219_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_49,
        in_c0_exe21324_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_50,
        in_c0_exe21324_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_50,
        in_dag_node_pm_2_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_0,
        in_dag_node_pm_2_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_0,
        in_g_dag => in_arg_g_dag,
        in_r_0_i_i11_ph_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_47,
        in_r_0_i_i11_ph_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_47,
        in_scalarizer_01650_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_1,
        in_scalarizer_01650_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_1,
        in_scalarizer_01652_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_3,
        in_scalarizer_01652_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_3,
        in_scalarizer_01654_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_5,
        in_scalarizer_01654_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_5,
        in_scalarizer_01656_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_7,
        in_scalarizer_01656_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_7,
        in_scalarizer_01658_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_9,
        in_scalarizer_01658_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_9,
        in_scalarizer_01660_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_11,
        in_scalarizer_01660_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_11,
        in_scalarizer_01662_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_13,
        in_scalarizer_01662_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_13,
        in_scalarizer_01664_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_15,
        in_scalarizer_01664_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_15,
        in_scalarizer_01666_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_17,
        in_scalarizer_01666_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_17,
        in_scalarizer_01668_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_19,
        in_scalarizer_01668_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_19,
        in_scalarizer_01670_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_21,
        in_scalarizer_01670_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_21,
        in_scalarizer_01672_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_23,
        in_scalarizer_01672_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_23,
        in_scalarizer_01674_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_25,
        in_scalarizer_01674_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_25,
        in_scalarizer_01676_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_27,
        in_scalarizer_01676_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_27,
        in_scalarizer_01678_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_29,
        in_scalarizer_01678_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_29,
        in_scalarizer_01680_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_31,
        in_scalarizer_01680_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_31,
        in_scalarizer_01682_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_33,
        in_scalarizer_01682_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_33,
        in_scalarizer_01684_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_35,
        in_scalarizer_01684_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_35,
        in_scalarizer_01686_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_37,
        in_scalarizer_01686_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_37,
        in_scalarizer_01688_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_39,
        in_scalarizer_01688_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_39,
        in_scalarizer_01690_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_41,
        in_scalarizer_01690_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_41,
        in_scalarizer_01692_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_43,
        in_scalarizer_01692_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_43,
        in_scalarizer_01694_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_45,
        in_scalarizer_01694_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_45,
        in_scalarizer_11651_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_2,
        in_scalarizer_11651_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_2,
        in_scalarizer_11653_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_4,
        in_scalarizer_11653_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_4,
        in_scalarizer_11655_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_6,
        in_scalarizer_11655_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_6,
        in_scalarizer_11657_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_8,
        in_scalarizer_11657_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_8,
        in_scalarizer_11659_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_10,
        in_scalarizer_11659_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_10,
        in_scalarizer_11661_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_12,
        in_scalarizer_11661_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_12,
        in_scalarizer_11663_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_14,
        in_scalarizer_11663_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_14,
        in_scalarizer_11665_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_16,
        in_scalarizer_11665_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_16,
        in_scalarizer_11667_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_18,
        in_scalarizer_11667_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_18,
        in_scalarizer_11669_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_20,
        in_scalarizer_11669_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_20,
        in_scalarizer_11671_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_22,
        in_scalarizer_11671_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_22,
        in_scalarizer_11673_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_24,
        in_scalarizer_11673_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_24,
        in_scalarizer_11675_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_26,
        in_scalarizer_11675_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_26,
        in_scalarizer_11677_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_28,
        in_scalarizer_11677_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_28,
        in_scalarizer_11679_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_30,
        in_scalarizer_11679_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_30,
        in_scalarizer_11681_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_32,
        in_scalarizer_11681_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_32,
        in_scalarizer_11683_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_34,
        in_scalarizer_11683_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_34,
        in_scalarizer_11685_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_36,
        in_scalarizer_11685_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_36,
        in_scalarizer_11687_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_38,
        in_scalarizer_11687_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_38,
        in_scalarizer_11689_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_40,
        in_scalarizer_11689_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_40,
        in_scalarizer_11691_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_42,
        in_scalarizer_11691_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_42,
        in_scalarizer_11693_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_44,
        in_scalarizer_11693_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_44,
        in_scalarizer_11695_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_data_46,
        in_scalarizer_11695_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_data_46,
        in_stall_in_0 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_stall,
        in_stall_in_1 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_stall,
        in_valid_in_0 => bb_ethash_calculate_dag_item_B5_sr_0_aunroll_x_out_o_valid,
        in_valid_in_1 => bb_ethash_calculate_dag_item_B5_sr_1_aunroll_x_out_o_valid,
        out_c0_exit169_0 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_0,
        out_c0_exit169_1 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_1,
        out_c0_exit169_2 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_2,
        out_c0_exit169_3 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_3,
        out_c0_exit169_4 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_4,
        out_c0_exit169_5 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_5,
        out_c0_exit169_6 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_6,
        out_c0_exit169_7 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_7,
        out_c0_exit169_8 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_8,
        out_c0_exit169_9 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_9,
        out_c0_exit169_10 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_10,
        out_c0_exit169_11 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_11,
        out_c0_exit169_12 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_12,
        out_c0_exit169_13 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_13,
        out_c0_exit169_14 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_14,
        out_c0_exit169_15 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_15,
        out_c0_exit169_16 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_16,
        out_c0_exit169_17 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_17,
        out_c0_exit169_18 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_18,
        out_c0_exit169_19 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_19,
        out_c0_exit169_20 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_20,
        out_c0_exit169_21 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_21,
        out_c0_exit169_22 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_22,
        out_c0_exit169_23 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_23,
        out_c0_exit169_24 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_24,
        out_c0_exit169_25 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_25,
        out_c0_exit169_26 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_26,
        out_c0_exit169_27 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_27,
        out_c0_exit169_28 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_28,
        out_c0_exit169_29 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_29,
        out_c0_exit169_30 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_30,
        out_c0_exit169_31 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_31,
        out_c0_exit169_32 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_32,
        out_c0_exit169_33 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_33,
        out_c0_exit169_34 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_34,
        out_c0_exit169_35 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_35,
        out_c0_exit169_36 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_36,
        out_c0_exit169_37 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_37,
        out_c0_exit169_38 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_38,
        out_c0_exit169_39 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_39,
        out_c0_exit169_40 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_40,
        out_c0_exit169_41 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_41,
        out_c0_exit169_42 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_42,
        out_c0_exit169_43 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_43,
        out_c0_exit169_44 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_44,
        out_c0_exit169_45 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_45,
        out_c0_exit169_46 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_46,
        out_c0_exit169_47 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_47,
        out_c0_exit169_48 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_48,
        out_c0_exit169_49 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_49,
        out_c0_exit169_50 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_50,
        out_acl_hw_wg_id39 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_acl_hw_wg_id39,
        out_c0_exe10179 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe10179,
        out_c0_exe111 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe111,
        out_c0_exe11180 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe11180,
        out_c0_exe11219 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe11219,
        out_c0_exe12181 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe12181,
        out_c0_exe13182 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe13182,
        out_c0_exe14183 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe14183,
        out_c0_exe15184 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe15184,
        out_c0_exe16185 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe16185,
        out_c0_exe17186 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe17186,
        out_c0_exe18187 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe18187,
        out_c0_exe19188 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe19188,
        out_c0_exe20189 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe20189,
        out_c0_exe21190 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe21190,
        out_c0_exe21324 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe21324,
        out_c0_exe22191 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe22191,
        out_c0_exe23192 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe23192,
        out_c0_exe24193 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe24193,
        out_c0_exe25194 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe25194,
        out_c0_exe26195 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe26195,
        out_c0_exe27196 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe27196,
        out_c0_exe28197 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe28197,
        out_c0_exe29198 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe29198,
        out_c0_exe30199 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe30199,
        out_c0_exe31200 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe31200,
        out_c0_exe3172 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe3172,
        out_c0_exe32201 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe32201,
        out_c0_exe33202 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe33202,
        out_c0_exe34203 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe34203,
        out_c0_exe35204 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe35204,
        out_c0_exe36205 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe36205,
        out_c0_exe37206 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe37206,
        out_c0_exe38207 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe38207,
        out_c0_exe39208 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe39208,
        out_c0_exe40209 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe40209,
        out_c0_exe41210 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe41210,
        out_c0_exe4173 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe4173,
        out_c0_exe42211 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe42211,
        out_c0_exe43212 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe43212,
        out_c0_exe44213 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe44213,
        out_c0_exe45214 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe45214,
        out_c0_exe46215 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe46215,
        out_c0_exe47216 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe47216,
        out_c0_exe48217 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe48217,
        out_c0_exe49218 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe49218,
        out_c0_exe50219 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe50219,
        out_c0_exe5174 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe5174,
        out_c0_exe6175 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe6175,
        out_c0_exe7176 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe7176,
        out_c0_exe8177 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe8177,
        out_c0_exe9178 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe9178,
        out_dag_node_pm_2 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_dag_node_pm_2,
        out_stall_out_0 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_stall_out_0,
        out_stall_out_1 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_stall_out_1,
        out_valid_out_0 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_valid_out_0,
        out_valid_out_1 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x(BLACKBOX,16)
    thebb_ethash_calculate_dag_item_B6_sr_0_aunroll_x : bb_ethash_calculate_dag_item_B6_sr_0
    PORT MAP (
        in_i_data_0 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe111,
        in_i_data_1 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exe21324,
        in_i_data_2 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_dag_node_pm_2,
        in_i_data_3 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_0,
        in_i_data_4 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_1,
        in_i_data_5 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_2,
        in_i_data_6 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_3,
        in_i_data_7 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_4,
        in_i_data_8 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_5,
        in_i_data_9 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_6,
        in_i_data_10 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_7,
        in_i_data_11 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_8,
        in_i_data_12 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_9,
        in_i_data_13 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_10,
        in_i_data_14 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_11,
        in_i_data_15 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_12,
        in_i_data_16 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_13,
        in_i_data_17 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_14,
        in_i_data_18 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_15,
        in_i_data_19 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_16,
        in_i_data_20 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_17,
        in_i_data_21 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_18,
        in_i_data_22 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_19,
        in_i_data_23 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_20,
        in_i_data_24 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_21,
        in_i_data_25 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_22,
        in_i_data_26 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_23,
        in_i_data_27 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_24,
        in_i_data_28 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_25,
        in_i_data_29 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_26,
        in_i_data_30 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_27,
        in_i_data_31 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_28,
        in_i_data_32 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_29,
        in_i_data_33 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_30,
        in_i_data_34 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_31,
        in_i_data_35 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_32,
        in_i_data_36 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_33,
        in_i_data_37 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_34,
        in_i_data_38 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_35,
        in_i_data_39 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_36,
        in_i_data_40 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_37,
        in_i_data_41 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_38,
        in_i_data_42 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_39,
        in_i_data_43 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_40,
        in_i_data_44 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_41,
        in_i_data_45 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_42,
        in_i_data_46 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_43,
        in_i_data_47 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_44,
        in_i_data_48 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_45,
        in_i_data_49 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_46,
        in_i_data_50 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_47,
        in_i_data_51 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_48,
        in_i_data_52 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_49,
        in_i_data_53 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_c0_exit169_50,
        in_i_data_54 => bb_ethash_calculate_dag_item_B5_aunroll_x_out_acl_hw_wg_id39,
        in_i_stall => bb_ethash_calculate_dag_item_B6_aunroll_x_out_stall_out_0,
        in_i_valid => bb_ethash_calculate_dag_item_B5_aunroll_x_out_valid_out_0,
        out_o_data_0 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_9,
        out_o_data_10 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_10,
        out_o_data_11 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_11,
        out_o_data_12 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_12,
        out_o_data_13 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_13,
        out_o_data_14 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_14,
        out_o_data_15 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_15,
        out_o_data_16 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_16,
        out_o_data_17 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_17,
        out_o_data_18 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_18,
        out_o_data_19 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_19,
        out_o_data_20 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_20,
        out_o_data_21 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_21,
        out_o_data_22 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_22,
        out_o_data_23 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_23,
        out_o_data_24 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_24,
        out_o_data_25 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_25,
        out_o_data_26 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_26,
        out_o_data_27 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_27,
        out_o_data_28 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_28,
        out_o_data_29 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_29,
        out_o_data_30 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_30,
        out_o_data_31 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_31,
        out_o_data_32 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_32,
        out_o_data_33 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_33,
        out_o_data_34 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_34,
        out_o_data_35 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_35,
        out_o_data_36 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_36,
        out_o_data_37 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_37,
        out_o_data_38 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_38,
        out_o_data_39 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_39,
        out_o_data_40 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_40,
        out_o_data_41 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_41,
        out_o_data_42 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_42,
        out_o_data_43 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_43,
        out_o_data_44 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_44,
        out_o_data_45 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_45,
        out_o_data_46 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_46,
        out_o_data_47 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_47,
        out_o_data_48 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_48,
        out_o_data_49 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_49,
        out_o_data_50 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_50,
        out_o_data_51 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_51,
        out_o_data_52 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_52,
        out_o_data_53 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_53,
        out_o_data_54 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_54,
        out_o_stall => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_calculate_dag_item_B6_aunroll_x(BLACKBOX,15)
    thebb_ethash_calculate_dag_item_B6_aunroll_x : bb_ethash_calculate_dag_item_B6
    PORT MAP (
        in_c0_exit16937_0_0 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_3,
        in_c0_exit16937_0_1 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_4,
        in_c0_exit16937_0_2 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_5,
        in_c0_exit16937_0_3 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_6,
        in_c0_exit16937_0_4 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_7,
        in_c0_exit16937_0_5 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_8,
        in_c0_exit16937_0_6 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_9,
        in_c0_exit16937_0_7 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_10,
        in_c0_exit16937_0_8 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_11,
        in_c0_exit16937_0_9 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_12,
        in_c0_exit16937_0_10 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_13,
        in_c0_exit16937_0_11 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_14,
        in_c0_exit16937_0_12 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_15,
        in_c0_exit16937_0_13 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_16,
        in_c0_exit16937_0_14 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_17,
        in_c0_exit16937_0_15 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_18,
        in_c0_exit16937_0_16 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_19,
        in_c0_exit16937_0_17 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_20,
        in_c0_exit16937_0_18 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_21,
        in_c0_exit16937_0_19 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_22,
        in_c0_exit16937_0_20 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_23,
        in_c0_exit16937_0_21 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_24,
        in_c0_exit16937_0_22 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_25,
        in_c0_exit16937_0_23 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_26,
        in_c0_exit16937_0_24 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_27,
        in_c0_exit16937_0_25 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_28,
        in_c0_exit16937_0_26 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_29,
        in_c0_exit16937_0_27 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_30,
        in_c0_exit16937_0_28 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_31,
        in_c0_exit16937_0_29 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_32,
        in_c0_exit16937_0_30 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_33,
        in_c0_exit16937_0_31 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_34,
        in_c0_exit16937_0_32 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_35,
        in_c0_exit16937_0_33 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_36,
        in_c0_exit16937_0_34 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_37,
        in_c0_exit16937_0_35 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_38,
        in_c0_exit16937_0_36 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_39,
        in_c0_exit16937_0_37 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_40,
        in_c0_exit16937_0_38 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_41,
        in_c0_exit16937_0_39 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_42,
        in_c0_exit16937_0_40 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_43,
        in_c0_exit16937_0_41 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_44,
        in_c0_exit16937_0_42 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_45,
        in_c0_exit16937_0_43 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_46,
        in_c0_exit16937_0_44 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_47,
        in_c0_exit16937_0_45 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_48,
        in_c0_exit16937_0_46 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_49,
        in_c0_exit16937_0_47 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_50,
        in_c0_exit16937_0_48 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_51,
        in_c0_exit16937_0_49 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_52,
        in_c0_exit16937_0_50 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_53,
        in_acl_hw_wg_id38_0 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_54,
        in_c0_exe110_0 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_0,
        in_c0_exe21323_0 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_1,
        in_dag_node_pm_236_0 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_data_2,
        in_flush => in_start,
        in_g_dag => in_arg_g_dag,
        in_stall_in_0 => in_stall_in,
        in_unnamed_ethash_calculate_dag_item15_avm_readdata => in_unnamed_ethash_calculate_dag_item15_avm_readdata,
        in_unnamed_ethash_calculate_dag_item15_avm_readdatavalid => in_unnamed_ethash_calculate_dag_item15_avm_readdatavalid,
        in_unnamed_ethash_calculate_dag_item15_avm_waitrequest => in_unnamed_ethash_calculate_dag_item15_avm_waitrequest,
        in_unnamed_ethash_calculate_dag_item15_avm_writeack => in_unnamed_ethash_calculate_dag_item15_avm_writeack,
        in_valid_in_0 => bb_ethash_calculate_dag_item_B6_sr_0_aunroll_x_out_o_valid,
        out_acl_hw_wg_id38 => bb_ethash_calculate_dag_item_B6_aunroll_x_out_acl_hw_wg_id38,
        out_lsu_unnamed_ethash_calculate_dag_item15_o_active => bb_ethash_calculate_dag_item_B6_aunroll_x_out_lsu_unnamed_ethash_calculate_dag_item15_o_active,
        out_stall_out_0 => bb_ethash_calculate_dag_item_B6_aunroll_x_out_stall_out_0,
        out_unnamed_ethash_calculate_dag_item15_avm_address => bb_ethash_calculate_dag_item_B6_aunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_address,
        out_unnamed_ethash_calculate_dag_item15_avm_burstcount => bb_ethash_calculate_dag_item_B6_aunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_burstcount,
        out_unnamed_ethash_calculate_dag_item15_avm_byteenable => bb_ethash_calculate_dag_item_B6_aunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_byteenable,
        out_unnamed_ethash_calculate_dag_item15_avm_enable => bb_ethash_calculate_dag_item_B6_aunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_enable,
        out_unnamed_ethash_calculate_dag_item15_avm_read => bb_ethash_calculate_dag_item_B6_aunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_read,
        out_unnamed_ethash_calculate_dag_item15_avm_write => bb_ethash_calculate_dag_item_B6_aunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_write,
        out_unnamed_ethash_calculate_dag_item15_avm_writedata => bb_ethash_calculate_dag_item_B6_aunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_writedata,
        out_valid_out_0 => bb_ethash_calculate_dag_item_B6_aunroll_x_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- out_acl_hw_wg_id38(GPOUT,120)
    out_acl_hw_wg_id38 <= bb_ethash_calculate_dag_item_B6_aunroll_x_out_acl_hw_wg_id38;

    -- out_memcoalesce_g_light_load_02193_avm_address(GPOUT,121)
    out_memcoalesce_g_light_load_02193_avm_address <= bb_ethash_calculate_dag_item_B3_aunroll_x_out_memcoalesce_g_light_load_02193_avm_address;

    -- out_memcoalesce_g_light_load_02193_avm_burstcount(GPOUT,122)
    out_memcoalesce_g_light_load_02193_avm_burstcount <= bb_ethash_calculate_dag_item_B3_aunroll_x_out_memcoalesce_g_light_load_02193_avm_burstcount;

    -- out_memcoalesce_g_light_load_02193_avm_byteenable(GPOUT,123)
    out_memcoalesce_g_light_load_02193_avm_byteenable <= bb_ethash_calculate_dag_item_B3_aunroll_x_out_memcoalesce_g_light_load_02193_avm_byteenable;

    -- out_memcoalesce_g_light_load_02193_avm_enable(GPOUT,124)
    out_memcoalesce_g_light_load_02193_avm_enable <= bb_ethash_calculate_dag_item_B3_aunroll_x_out_memcoalesce_g_light_load_02193_avm_enable;

    -- out_memcoalesce_g_light_load_02193_avm_read(GPOUT,125)
    out_memcoalesce_g_light_load_02193_avm_read <= bb_ethash_calculate_dag_item_B3_aunroll_x_out_memcoalesce_g_light_load_02193_avm_read;

    -- out_memcoalesce_g_light_load_02193_avm_write(GPOUT,126)
    out_memcoalesce_g_light_load_02193_avm_write <= bb_ethash_calculate_dag_item_B3_aunroll_x_out_memcoalesce_g_light_load_02193_avm_write;

    -- out_memcoalesce_g_light_load_02193_avm_writedata(GPOUT,127)
    out_memcoalesce_g_light_load_02193_avm_writedata <= bb_ethash_calculate_dag_item_B3_aunroll_x_out_memcoalesce_g_light_load_02193_avm_writedata;

    -- out_memcoalesce_g_light_load_0_avm_address(GPOUT,128)
    out_memcoalesce_g_light_load_0_avm_address <= bb_ethash_calculate_dag_item_B0_out_memcoalesce_g_light_load_0_avm_address;

    -- out_memcoalesce_g_light_load_0_avm_burstcount(GPOUT,129)
    out_memcoalesce_g_light_load_0_avm_burstcount <= bb_ethash_calculate_dag_item_B0_out_memcoalesce_g_light_load_0_avm_burstcount;

    -- out_memcoalesce_g_light_load_0_avm_byteenable(GPOUT,130)
    out_memcoalesce_g_light_load_0_avm_byteenable <= bb_ethash_calculate_dag_item_B0_out_memcoalesce_g_light_load_0_avm_byteenable;

    -- out_memcoalesce_g_light_load_0_avm_enable(GPOUT,131)
    out_memcoalesce_g_light_load_0_avm_enable <= bb_ethash_calculate_dag_item_B0_out_memcoalesce_g_light_load_0_avm_enable;

    -- out_memcoalesce_g_light_load_0_avm_read(GPOUT,132)
    out_memcoalesce_g_light_load_0_avm_read <= bb_ethash_calculate_dag_item_B0_out_memcoalesce_g_light_load_0_avm_read;

    -- out_memcoalesce_g_light_load_0_avm_write(GPOUT,133)
    out_memcoalesce_g_light_load_0_avm_write <= bb_ethash_calculate_dag_item_B0_out_memcoalesce_g_light_load_0_avm_write;

    -- out_memcoalesce_g_light_load_0_avm_writedata(GPOUT,134)
    out_memcoalesce_g_light_load_0_avm_writedata <= bb_ethash_calculate_dag_item_B0_out_memcoalesce_g_light_load_0_avm_writedata;

    -- out_o_active_unnamed_ethash_calculate_dag_item15(GPOUT,135)
    out_o_active_unnamed_ethash_calculate_dag_item15 <= bb_ethash_calculate_dag_item_B6_aunroll_x_out_lsu_unnamed_ethash_calculate_dag_item15_o_active;

    -- out_stall_out(GPOUT,136)
    out_stall_out <= bb_ethash_calculate_dag_item_B0_out_stall_out_0;

    -- out_unnamed_ethash_calculate_dag_item15_avm_address(GPOUT,137)
    out_unnamed_ethash_calculate_dag_item15_avm_address <= bb_ethash_calculate_dag_item_B6_aunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_address;

    -- out_unnamed_ethash_calculate_dag_item15_avm_burstcount(GPOUT,138)
    out_unnamed_ethash_calculate_dag_item15_avm_burstcount <= bb_ethash_calculate_dag_item_B6_aunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_burstcount;

    -- out_unnamed_ethash_calculate_dag_item15_avm_byteenable(GPOUT,139)
    out_unnamed_ethash_calculate_dag_item15_avm_byteenable <= bb_ethash_calculate_dag_item_B6_aunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_byteenable;

    -- out_unnamed_ethash_calculate_dag_item15_avm_enable(GPOUT,140)
    out_unnamed_ethash_calculate_dag_item15_avm_enable <= bb_ethash_calculate_dag_item_B6_aunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_enable;

    -- out_unnamed_ethash_calculate_dag_item15_avm_read(GPOUT,141)
    out_unnamed_ethash_calculate_dag_item15_avm_read <= bb_ethash_calculate_dag_item_B6_aunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_read;

    -- out_unnamed_ethash_calculate_dag_item15_avm_write(GPOUT,142)
    out_unnamed_ethash_calculate_dag_item15_avm_write <= bb_ethash_calculate_dag_item_B6_aunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_write;

    -- out_unnamed_ethash_calculate_dag_item15_avm_writedata(GPOUT,143)
    out_unnamed_ethash_calculate_dag_item15_avm_writedata <= bb_ethash_calculate_dag_item_B6_aunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_writedata;

    -- out_valid_out(GPOUT,144)
    out_valid_out <= bb_ethash_calculate_dag_item_B6_aunroll_x_out_valid_out_0;

END normal;
