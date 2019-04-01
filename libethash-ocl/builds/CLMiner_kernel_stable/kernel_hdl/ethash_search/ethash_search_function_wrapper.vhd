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

-- VHDL created from ethash_search_function_wrapper
-- VHDL created on Mon Apr  1 13:53:06 2019


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

entity ethash_search_function_wrapper is
    port (
        avm_call152_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        avm_call152_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_call152_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_call152_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_g_header_load_0_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        avm_memcoalesce_g_header_load_0_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_g_header_load_0_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_g_header_load_0_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_016_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        avm_memcoalesce_null_load_016_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_016_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_016_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_0_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        avm_memcoalesce_null_load_0_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_0_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_0_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_198_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        avm_memdep_198_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_198_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_198_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_199_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        avm_memdep_199_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_199_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_199_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_200_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        avm_memdep_200_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_200_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_200_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_203_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        avm_memdep_203_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_203_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_203_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_204_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        avm_memdep_204_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_204_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_204_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_205_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        avm_memdep_205_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_205_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_205_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        avm_memdep_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search27_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        avm_unnamed_ethash_search27_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search27_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search27_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search28_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        avm_unnamed_ethash_search28_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search28_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search28_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search34_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        avm_unnamed_ethash_search34_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search34_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search34_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search35_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        avm_unnamed_ethash_search35_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search35_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search35_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search61_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        avm_unnamed_ethash_search61_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search61_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search61_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search62_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        avm_unnamed_ethash_search62_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search62_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search62_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search63_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        avm_unnamed_ethash_search63_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search63_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search63_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search64_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        avm_unnamed_ethash_search64_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search64_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search64_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        clock2x : in std_logic_vector(0 downto 0);  -- ufix1
        global_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        global_id_1 : in std_logic_vector(31 downto 0);  -- ufix32
        global_id_2 : in std_logic_vector(31 downto 0);  -- ufix32
        global_offset_0 : in std_logic_vector(31 downto 0);  -- ufix32
        global_offset_1 : in std_logic_vector(31 downto 0);  -- ufix32
        global_offset_2 : in std_logic_vector(31 downto 0);  -- ufix32
        global_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        global_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        global_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        group_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        group_id_1 : in std_logic_vector(31 downto 0);  -- ufix32
        group_id_2 : in std_logic_vector(31 downto 0);  -- ufix32
        kernel_arguments : in std_logic_vector(351 downto 0);  -- ufix352
        kernel_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        kernel_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        local_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        local_id_1 : in std_logic_vector(31 downto 0);  -- ufix32
        local_id_2 : in std_logic_vector(31 downto 0);  -- ufix32
        local_router_hang : in std_logic_vector(0 downto 0);  -- ufix1
        local_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        local_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        local_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        num_groups_0 : in std_logic_vector(31 downto 0);  -- ufix32
        num_groups_1 : in std_logic_vector(31 downto 0);  -- ufix32
        num_groups_2 : in std_logic_vector(31 downto 0);  -- ufix32
        stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        start : in std_logic_vector(0 downto 0);  -- ufix1
        valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        work_dim : in std_logic_vector(31 downto 0);  -- ufix32
        workgroup_size : in std_logic_vector(31 downto 0);  -- ufix32
        avm_call152_address : out std_logic_vector(32 downto 0);  -- ufix33
        avm_call152_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_call152_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        avm_call152_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_call152_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_call152_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_call152_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        avm_memcoalesce_g_header_load_0_address : out std_logic_vector(32 downto 0);  -- ufix33
        avm_memcoalesce_g_header_load_0_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_g_header_load_0_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        avm_memcoalesce_g_header_load_0_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_g_header_load_0_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_g_header_load_0_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_g_header_load_0_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        avm_memcoalesce_null_load_016_address : out std_logic_vector(31 downto 0);  -- ufix32
        avm_memcoalesce_null_load_016_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_016_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        avm_memcoalesce_null_load_016_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_016_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_016_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_016_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        avm_memcoalesce_null_load_0_address : out std_logic_vector(31 downto 0);  -- ufix32
        avm_memcoalesce_null_load_0_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_0_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        avm_memcoalesce_null_load_0_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_0_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_0_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_0_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        avm_memdep_198_address : out std_logic_vector(31 downto 0);  -- ufix32
        avm_memdep_198_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_198_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        avm_memdep_198_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_198_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_198_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_198_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        avm_memdep_199_address : out std_logic_vector(31 downto 0);  -- ufix32
        avm_memdep_199_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_199_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        avm_memdep_199_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_199_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_199_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_199_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        avm_memdep_200_address : out std_logic_vector(31 downto 0);  -- ufix32
        avm_memdep_200_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_200_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        avm_memdep_200_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_200_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_200_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_200_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        avm_memdep_203_address : out std_logic_vector(31 downto 0);  -- ufix32
        avm_memdep_203_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_203_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        avm_memdep_203_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_203_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_203_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_203_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        avm_memdep_204_address : out std_logic_vector(31 downto 0);  -- ufix32
        avm_memdep_204_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_204_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        avm_memdep_204_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_204_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_204_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_204_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        avm_memdep_205_address : out std_logic_vector(31 downto 0);  -- ufix32
        avm_memdep_205_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_205_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        avm_memdep_205_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_205_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_205_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_205_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        avm_memdep_address : out std_logic_vector(31 downto 0);  -- ufix32
        avm_memdep_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        avm_memdep_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        avm_unnamed_ethash_search27_address : out std_logic_vector(31 downto 0);  -- ufix32
        avm_unnamed_ethash_search27_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search27_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        avm_unnamed_ethash_search27_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search27_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search27_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search27_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        avm_unnamed_ethash_search28_address : out std_logic_vector(31 downto 0);  -- ufix32
        avm_unnamed_ethash_search28_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search28_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        avm_unnamed_ethash_search28_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search28_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search28_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search28_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        avm_unnamed_ethash_search34_address : out std_logic_vector(31 downto 0);  -- ufix32
        avm_unnamed_ethash_search34_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search34_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        avm_unnamed_ethash_search34_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search34_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search34_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search34_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        avm_unnamed_ethash_search35_address : out std_logic_vector(32 downto 0);  -- ufix33
        avm_unnamed_ethash_search35_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_unnamed_ethash_search35_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        avm_unnamed_ethash_search35_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search35_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search35_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search35_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        avm_unnamed_ethash_search61_address : out std_logic_vector(32 downto 0);  -- ufix33
        avm_unnamed_ethash_search61_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_unnamed_ethash_search61_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        avm_unnamed_ethash_search61_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search61_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search61_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search61_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        avm_unnamed_ethash_search62_address : out std_logic_vector(32 downto 0);  -- ufix33
        avm_unnamed_ethash_search62_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_unnamed_ethash_search62_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        avm_unnamed_ethash_search62_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search62_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search62_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search62_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        avm_unnamed_ethash_search63_address : out std_logic_vector(32 downto 0);  -- ufix33
        avm_unnamed_ethash_search63_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_unnamed_ethash_search63_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        avm_unnamed_ethash_search63_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search63_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search63_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search63_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        avm_unnamed_ethash_search64_address : out std_logic_vector(32 downto 0);  -- ufix33
        avm_unnamed_ethash_search64_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_unnamed_ethash_search64_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        avm_unnamed_ethash_search64_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search64_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search64_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_search64_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        clock2x_output : out std_logic_vector(0 downto 0);  -- ufix1
        has_a_lsu_active : out std_logic_vector(0 downto 0);  -- ufix1
        has_a_write_pending : out std_logic_vector(0 downto 0);  -- ufix1
        kernel_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        kernel_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end ethash_search_function_wrapper;

architecture normal of ethash_search_function_wrapper is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component acl_clock2x_holder is
        port (
            clock2x : in std_logic;
            myout : out std_logic;
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component acl_embedded_workgroup_issuer_dspba is
        generic (
            MAX_SIMULTANEOUS_WORKGROUPS : INTEGER := 12;
            MAX_WORKGROUP_SIZE : INTEGER := 128;
            WORKGROUP_EXIT_ORDER : STRING := "fifo"
        );
        port (
            done_hw_wg_id_in : in std_logic_vector(31 downto 0);
            global_id_in_0 : in std_logic_vector(31 downto 0);
            global_id_in_1 : in std_logic_vector(31 downto 0);
            global_id_in_2 : in std_logic_vector(31 downto 0);
            group_id_in_0 : in std_logic_vector(31 downto 0);
            group_id_in_1 : in std_logic_vector(31 downto 0);
            group_id_in_2 : in std_logic_vector(31 downto 0);
            local_id_in_0 : in std_logic_vector(31 downto 0);
            local_id_in_1 : in std_logic_vector(31 downto 0);
            local_id_in_2 : in std_logic_vector(31 downto 0);
            stall_entry : in std_logic;
            stall_exit : in std_logic;
            valid_exit : in std_logic;
            valid_in : in std_logic;
            workgroup_size : in std_logic_vector(31 downto 0);
            global_id_out_0 : out std_logic_vector(31 downto 0);
            hw_wg_id_out : out std_logic_vector(31 downto 0);
            stall_out : out std_logic;
            valid_entry : out std_logic;
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component ethash_search_function is
        port (
            in_arg_acl_hw_wg_id : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_g_dag : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arg_g_header : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arg_g_output : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arg_global_id_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_isolate : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_start_nonce : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arg_target : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_call152_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_call152_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_call152_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_call152_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_g_header_load_0_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_memcoalesce_g_header_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_g_header_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_g_header_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_016_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_016_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_016_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_016_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_198_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memdep_198_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_198_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_198_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_199_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memdep_199_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_199_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_199_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_200_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memdep_200_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_200_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_200_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_203_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memdep_203_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_203_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_203_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_204_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memdep_204_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_204_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_204_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_205_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memdep_205_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_205_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_205_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memdep_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_start : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search27_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_unnamed_ethash_search27_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search27_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search27_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search28_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_unnamed_ethash_search28_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search28_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search28_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search34_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_unnamed_ethash_search34_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search34_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search34_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search35_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_unnamed_ethash_search35_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search35_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search35_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search61_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_unnamed_ethash_search61_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search61_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search61_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search62_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_unnamed_ethash_search62_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search62_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search62_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search63_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_unnamed_ethash_search63_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search63_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search63_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search64_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_unnamed_ethash_search64_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search64_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search64_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_workgroup_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_call152_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_call152_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_call152_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_call152_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_call152_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_call152_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_call152_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_memcoalesce_g_header_load_0_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_memcoalesce_g_header_load_0_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_g_header_load_0_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_memcoalesce_g_header_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_g_header_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_g_header_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_g_header_load_0_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_016_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_016_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_016_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_016_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_016_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_016_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_016_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_memdep_198_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_198_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_198_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_memdep_198_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_198_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_198_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_198_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_memdep_199_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_199_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_199_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_memdep_199_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_199_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_199_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_199_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_memdep_200_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_200_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_200_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_memdep_200_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_200_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_200_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_200_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_memdep_203_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_203_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_203_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_memdep_203_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_203_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_203_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_203_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_memdep_204_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_204_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_204_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_memdep_204_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_204_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_204_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_204_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_memdep_205_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_205_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_205_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_memdep_205_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_205_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_205_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_205_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_memdep_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_memdep_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_o_active_call152 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_active_unnamed_ethash_search61 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_active_unnamed_ethash_search62 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_active_unnamed_ethash_search63 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_active_unnamed_ethash_search64 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_primWireOut : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search27_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_ethash_search27_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search27_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_unnamed_ethash_search27_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search27_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search27_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search27_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_unnamed_ethash_search28_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_ethash_search28_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search28_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_unnamed_ethash_search28_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search28_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search28_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search28_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_unnamed_ethash_search34_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_ethash_search34_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search34_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_unnamed_ethash_search34_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search34_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search34_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search34_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_unnamed_ethash_search35_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_unnamed_ethash_search35_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_ethash_search35_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_unnamed_ethash_search35_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search35_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search35_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search35_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_unnamed_ethash_search61_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_unnamed_ethash_search61_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_ethash_search61_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_unnamed_ethash_search61_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search61_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search61_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search61_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_unnamed_ethash_search62_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_unnamed_ethash_search62_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_ethash_search62_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_unnamed_ethash_search62_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search62_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search62_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search62_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_unnamed_ethash_search63_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_unnamed_ethash_search63_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_ethash_search63_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_unnamed_ethash_search63_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search63_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search63_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search63_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_unnamed_ethash_search64_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_unnamed_ethash_search64_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_ethash_search64_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_unnamed_ethash_search64_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search64_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search64_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search64_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_1_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_2_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_3_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_4_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal acl_clock2x_dummy_consumer_clock2x : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_clock2x_dummy_consumer_clock2x_bitsignaltemp : std_logic;
    signal acl_clock2x_dummy_consumer_myout : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_clock2x_dummy_consumer_myout_bitsignaltemp : std_logic;
    signal arg_g_dag_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal arg_g_header_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal arg_g_output_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal arg_isolate_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal arg_start_nonce_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal arg_target_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal const_32_bit_zero_q : STD_LOGIC_VECTOR (31 downto 0);
    signal embedded_issuer_done_hw_wg_id_in : STD_LOGIC_VECTOR (31 downto 0);
    signal embedded_issuer_global_id_in_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal embedded_issuer_global_id_in_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal embedded_issuer_global_id_in_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal embedded_issuer_group_id_in_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal embedded_issuer_group_id_in_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal embedded_issuer_group_id_in_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal embedded_issuer_local_id_in_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal embedded_issuer_local_id_in_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal embedded_issuer_local_id_in_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal embedded_issuer_stall_entry : STD_LOGIC_VECTOR (0 downto 0);
    signal embedded_issuer_stall_entry_bitsignaltemp : std_logic;
    signal embedded_issuer_stall_exit : STD_LOGIC_VECTOR (0 downto 0);
    signal embedded_issuer_stall_exit_bitsignaltemp : std_logic;
    signal embedded_issuer_valid_exit : STD_LOGIC_VECTOR (0 downto 0);
    signal embedded_issuer_valid_exit_bitsignaltemp : std_logic;
    signal embedded_issuer_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal embedded_issuer_valid_in_bitsignaltemp : std_logic;
    signal embedded_issuer_workgroup_size : STD_LOGIC_VECTOR (31 downto 0);
    signal embedded_issuer_global_id_out_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal embedded_issuer_hw_wg_id_out : STD_LOGIC_VECTOR (31 downto 0);
    signal embedded_issuer_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal embedded_issuer_stall_out_bitsignaltemp : std_logic;
    signal embedded_issuer_valid_entry : STD_LOGIC_VECTOR (0 downto 0);
    signal embedded_issuer_valid_entry_bitsignaltemp : std_logic;
    signal ethash_search_function_out_call152_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal ethash_search_function_out_call152_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal ethash_search_function_out_call152_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_function_out_call152_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_call152_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_call152_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_call152_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal ethash_search_function_out_memcoalesce_g_header_load_0_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal ethash_search_function_out_memcoalesce_g_header_load_0_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memcoalesce_g_header_load_0_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_function_out_memcoalesce_g_header_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memcoalesce_g_header_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memcoalesce_g_header_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memcoalesce_g_header_load_0_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal ethash_search_function_out_memcoalesce_null_load_016_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_function_out_memcoalesce_null_load_016_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memcoalesce_null_load_016_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal ethash_search_function_out_memcoalesce_null_load_016_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memcoalesce_null_load_016_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memcoalesce_null_load_016_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memcoalesce_null_load_016_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal ethash_search_function_out_memcoalesce_null_load_0_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_function_out_memcoalesce_null_load_0_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memcoalesce_null_load_0_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal ethash_search_function_out_memcoalesce_null_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memcoalesce_null_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memcoalesce_null_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memcoalesce_null_load_0_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal ethash_search_function_out_memdep_198_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_function_out_memdep_198_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memdep_198_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal ethash_search_function_out_memdep_198_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memdep_198_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memdep_198_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memdep_198_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal ethash_search_function_out_memdep_199_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_function_out_memdep_199_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memdep_199_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal ethash_search_function_out_memdep_199_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memdep_199_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memdep_199_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memdep_199_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal ethash_search_function_out_memdep_200_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_function_out_memdep_200_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memdep_200_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal ethash_search_function_out_memdep_200_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memdep_200_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memdep_200_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memdep_200_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal ethash_search_function_out_memdep_203_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_function_out_memdep_203_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memdep_203_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal ethash_search_function_out_memdep_203_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memdep_203_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memdep_203_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memdep_203_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal ethash_search_function_out_memdep_204_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_function_out_memdep_204_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memdep_204_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal ethash_search_function_out_memdep_204_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memdep_204_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memdep_204_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memdep_204_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal ethash_search_function_out_memdep_205_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_function_out_memdep_205_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memdep_205_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal ethash_search_function_out_memdep_205_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memdep_205_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memdep_205_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memdep_205_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal ethash_search_function_out_memdep_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_function_out_memdep_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memdep_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal ethash_search_function_out_memdep_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memdep_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memdep_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_memdep_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal ethash_search_function_out_o_active_call152 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_o_active_unnamed_ethash_search61 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_o_active_unnamed_ethash_search62 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_o_active_unnamed_ethash_search63 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_o_active_unnamed_ethash_search64 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_function_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search27_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search27_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search27_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search27_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search27_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search27_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search27_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search28_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search28_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search28_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search28_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search28_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search28_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search28_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search34_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search34_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search34_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search34_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search34_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search34_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search34_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search35_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search35_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search35_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search35_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search35_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search35_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search35_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search61_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search61_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search61_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search61_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search61_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search61_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search61_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search62_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search62_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search62_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search62_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search62_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search62_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search62_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search63_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search63_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search63_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search63_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search63_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search63_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search63_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search64_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search64_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search64_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search64_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search64_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search64_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_function_out_unnamed_ethash_search64_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal ethash_search_function_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ip_dsdk_adapt_cast_b : STD_LOGIC_VECTOR (63 downto 0);
    signal is_any_lsu_active_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- arg_target_select(BITSELECT,13)
    arg_target_select_b <= kernel_arguments(319 downto 256);

    -- dupName_3_ip_dsdk_adapt_cast_x(BITSELECT,5)
    dupName_3_ip_dsdk_adapt_cast_x_b <= arg_target_select_b(63 downto 0);

    -- arg_start_nonce_select(BITSELECT,12)
    arg_start_nonce_select_b <= kernel_arguments(255 downto 192);

    -- dupName_2_ip_dsdk_adapt_cast_x(BITSELECT,4)
    dupName_2_ip_dsdk_adapt_cast_x_b <= arg_start_nonce_select_b(63 downto 0);

    -- arg_isolate_select(BITSELECT,11)
    arg_isolate_select_b <= kernel_arguments(351 downto 320);

    -- dupName_4_ip_dsdk_adapt_cast_x(BITSELECT,6)
    dupName_4_ip_dsdk_adapt_cast_x_b <= arg_isolate_select_b(31 downto 0);

    -- arg_g_output_select(BITSELECT,10)
    arg_g_output_select_b <= kernel_arguments(63 downto 0);

    -- ip_dsdk_adapt_cast(BITSELECT,125)
    ip_dsdk_adapt_cast_b <= arg_g_output_select_b(63 downto 0);

    -- arg_g_header_select(BITSELECT,9)
    arg_g_header_select_b <= kernel_arguments(127 downto 64);

    -- dupName_0_ip_dsdk_adapt_cast_x(BITSELECT,2)
    dupName_0_ip_dsdk_adapt_cast_x_b <= arg_g_header_select_b(63 downto 0);

    -- arg_g_dag_select(BITSELECT,8)
    arg_g_dag_select_b <= kernel_arguments(191 downto 128);

    -- dupName_1_ip_dsdk_adapt_cast_x(BITSELECT,3)
    dupName_1_ip_dsdk_adapt_cast_x_b <= arg_g_dag_select_b(63 downto 0);

    -- const_32_bit_zero(CONSTANT,15)
    const_32_bit_zero_q <= "00000000000000000000000000000000";

    -- embedded_issuer(EXTIFACE,16)
    embedded_issuer_done_hw_wg_id_in <= const_32_bit_zero_q;
    embedded_issuer_global_id_in_0 <= global_id_0;
    embedded_issuer_global_id_in_1 <= ethash_search_function_out_primWireOut;
    embedded_issuer_global_id_in_2 <= ethash_search_function_out_primWireOut;
    embedded_issuer_group_id_in_0 <= ethash_search_function_out_primWireOut;
    embedded_issuer_group_id_in_1 <= ethash_search_function_out_primWireOut;
    embedded_issuer_group_id_in_2 <= ethash_search_function_out_primWireOut;
    embedded_issuer_local_id_in_0 <= ethash_search_function_out_primWireOut;
    embedded_issuer_local_id_in_1 <= ethash_search_function_out_primWireOut;
    embedded_issuer_local_id_in_2 <= ethash_search_function_out_primWireOut;
    embedded_issuer_stall_entry <= ethash_search_function_out_stall_out;
    embedded_issuer_stall_exit <= GND_q;
    embedded_issuer_valid_exit <= ethash_search_function_out_valid_out;
    embedded_issuer_valid_in <= kernel_valid_in;
    embedded_issuer_workgroup_size <= workgroup_size;
    embedded_issuer_stall_entry_bitsignaltemp <= embedded_issuer_stall_entry(0);
    embedded_issuer_stall_exit_bitsignaltemp <= embedded_issuer_stall_exit(0);
    embedded_issuer_valid_exit_bitsignaltemp <= embedded_issuer_valid_exit(0);
    embedded_issuer_valid_in_bitsignaltemp <= embedded_issuer_valid_in(0);
    embedded_issuer_stall_out(0) <= embedded_issuer_stall_out_bitsignaltemp;
    embedded_issuer_valid_entry(0) <= embedded_issuer_valid_entry_bitsignaltemp;
    theembedded_issuer : acl_embedded_workgroup_issuer_dspba
    GENERIC MAP (
        MAX_SIMULTANEOUS_WORKGROUPS => 12,
        MAX_WORKGROUP_SIZE => 128,
        WORKGROUP_EXIT_ORDER => "fifo"
    )
    PORT MAP (
        done_hw_wg_id_in => const_32_bit_zero_q,
        global_id_in_0 => global_id_0,
        global_id_in_1 => ethash_search_function_out_primWireOut,
        global_id_in_2 => ethash_search_function_out_primWireOut,
        group_id_in_0 => ethash_search_function_out_primWireOut,
        group_id_in_1 => ethash_search_function_out_primWireOut,
        group_id_in_2 => ethash_search_function_out_primWireOut,
        local_id_in_0 => ethash_search_function_out_primWireOut,
        local_id_in_1 => ethash_search_function_out_primWireOut,
        local_id_in_2 => ethash_search_function_out_primWireOut,
        stall_entry => embedded_issuer_stall_entry_bitsignaltemp,
        stall_exit => embedded_issuer_stall_exit_bitsignaltemp,
        valid_exit => embedded_issuer_valid_exit_bitsignaltemp,
        valid_in => embedded_issuer_valid_in_bitsignaltemp,
        workgroup_size => workgroup_size,
        global_id_out_0 => embedded_issuer_global_id_out_0,
        hw_wg_id_out => embedded_issuer_hw_wg_id_out,
        stall_out => embedded_issuer_stall_out_bitsignaltemp,
        valid_entry => embedded_issuer_valid_entry_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- ethash_search_function(BLACKBOX,17)
    theethash_search_function : ethash_search_function
    PORT MAP (
        in_arg_acl_hw_wg_id => embedded_issuer_hw_wg_id_out,
        in_arg_g_dag => dupName_1_ip_dsdk_adapt_cast_x_b,
        in_arg_g_header => dupName_0_ip_dsdk_adapt_cast_x_b,
        in_arg_g_output => ip_dsdk_adapt_cast_b,
        in_arg_global_id_0 => embedded_issuer_global_id_out_0,
        in_arg_global_size_0 => global_size_0,
        in_arg_global_size_1 => global_size_1,
        in_arg_global_size_2 => global_size_2,
        in_arg_isolate => dupName_4_ip_dsdk_adapt_cast_x_b,
        in_arg_local_size_0 => local_size_0,
        in_arg_local_size_1 => local_size_1,
        in_arg_local_size_2 => local_size_2,
        in_arg_start_nonce => dupName_2_ip_dsdk_adapt_cast_x_b,
        in_arg_target => dupName_3_ip_dsdk_adapt_cast_x_b,
        in_call152_avm_readdata => avm_call152_readdata,
        in_call152_avm_readdatavalid => avm_call152_readdatavalid,
        in_call152_avm_waitrequest => avm_call152_waitrequest,
        in_call152_avm_writeack => avm_call152_writeack,
        in_memcoalesce_g_header_load_0_avm_readdata => avm_memcoalesce_g_header_load_0_readdata,
        in_memcoalesce_g_header_load_0_avm_readdatavalid => avm_memcoalesce_g_header_load_0_readdatavalid,
        in_memcoalesce_g_header_load_0_avm_waitrequest => avm_memcoalesce_g_header_load_0_waitrequest,
        in_memcoalesce_g_header_load_0_avm_writeack => avm_memcoalesce_g_header_load_0_writeack,
        in_memcoalesce_null_load_016_avm_readdata => avm_memcoalesce_null_load_016_readdata,
        in_memcoalesce_null_load_016_avm_readdatavalid => avm_memcoalesce_null_load_016_readdatavalid,
        in_memcoalesce_null_load_016_avm_waitrequest => avm_memcoalesce_null_load_016_waitrequest,
        in_memcoalesce_null_load_016_avm_writeack => avm_memcoalesce_null_load_016_writeack,
        in_memcoalesce_null_load_0_avm_readdata => avm_memcoalesce_null_load_0_readdata,
        in_memcoalesce_null_load_0_avm_readdatavalid => avm_memcoalesce_null_load_0_readdatavalid,
        in_memcoalesce_null_load_0_avm_waitrequest => avm_memcoalesce_null_load_0_waitrequest,
        in_memcoalesce_null_load_0_avm_writeack => avm_memcoalesce_null_load_0_writeack,
        in_memdep_198_avm_readdata => avm_memdep_198_readdata,
        in_memdep_198_avm_readdatavalid => avm_memdep_198_readdatavalid,
        in_memdep_198_avm_waitrequest => avm_memdep_198_waitrequest,
        in_memdep_198_avm_writeack => avm_memdep_198_writeack,
        in_memdep_199_avm_readdata => avm_memdep_199_readdata,
        in_memdep_199_avm_readdatavalid => avm_memdep_199_readdatavalid,
        in_memdep_199_avm_waitrequest => avm_memdep_199_waitrequest,
        in_memdep_199_avm_writeack => avm_memdep_199_writeack,
        in_memdep_200_avm_readdata => avm_memdep_200_readdata,
        in_memdep_200_avm_readdatavalid => avm_memdep_200_readdatavalid,
        in_memdep_200_avm_waitrequest => avm_memdep_200_waitrequest,
        in_memdep_200_avm_writeack => avm_memdep_200_writeack,
        in_memdep_203_avm_readdata => avm_memdep_203_readdata,
        in_memdep_203_avm_readdatavalid => avm_memdep_203_readdatavalid,
        in_memdep_203_avm_waitrequest => avm_memdep_203_waitrequest,
        in_memdep_203_avm_writeack => avm_memdep_203_writeack,
        in_memdep_204_avm_readdata => avm_memdep_204_readdata,
        in_memdep_204_avm_readdatavalid => avm_memdep_204_readdatavalid,
        in_memdep_204_avm_waitrequest => avm_memdep_204_waitrequest,
        in_memdep_204_avm_writeack => avm_memdep_204_writeack,
        in_memdep_205_avm_readdata => avm_memdep_205_readdata,
        in_memdep_205_avm_readdatavalid => avm_memdep_205_readdatavalid,
        in_memdep_205_avm_waitrequest => avm_memdep_205_waitrequest,
        in_memdep_205_avm_writeack => avm_memdep_205_writeack,
        in_memdep_avm_readdata => avm_memdep_readdata,
        in_memdep_avm_readdatavalid => avm_memdep_readdatavalid,
        in_memdep_avm_waitrequest => avm_memdep_waitrequest,
        in_memdep_avm_writeack => avm_memdep_writeack,
        in_stall_in => GND_q,
        in_start => start,
        in_unnamed_ethash_search27_avm_readdata => avm_unnamed_ethash_search27_readdata,
        in_unnamed_ethash_search27_avm_readdatavalid => avm_unnamed_ethash_search27_readdatavalid,
        in_unnamed_ethash_search27_avm_waitrequest => avm_unnamed_ethash_search27_waitrequest,
        in_unnamed_ethash_search27_avm_writeack => avm_unnamed_ethash_search27_writeack,
        in_unnamed_ethash_search28_avm_readdata => avm_unnamed_ethash_search28_readdata,
        in_unnamed_ethash_search28_avm_readdatavalid => avm_unnamed_ethash_search28_readdatavalid,
        in_unnamed_ethash_search28_avm_waitrequest => avm_unnamed_ethash_search28_waitrequest,
        in_unnamed_ethash_search28_avm_writeack => avm_unnamed_ethash_search28_writeack,
        in_unnamed_ethash_search34_avm_readdata => avm_unnamed_ethash_search34_readdata,
        in_unnamed_ethash_search34_avm_readdatavalid => avm_unnamed_ethash_search34_readdatavalid,
        in_unnamed_ethash_search34_avm_waitrequest => avm_unnamed_ethash_search34_waitrequest,
        in_unnamed_ethash_search34_avm_writeack => avm_unnamed_ethash_search34_writeack,
        in_unnamed_ethash_search35_avm_readdata => avm_unnamed_ethash_search35_readdata,
        in_unnamed_ethash_search35_avm_readdatavalid => avm_unnamed_ethash_search35_readdatavalid,
        in_unnamed_ethash_search35_avm_waitrequest => avm_unnamed_ethash_search35_waitrequest,
        in_unnamed_ethash_search35_avm_writeack => avm_unnamed_ethash_search35_writeack,
        in_unnamed_ethash_search61_avm_readdata => avm_unnamed_ethash_search61_readdata,
        in_unnamed_ethash_search61_avm_readdatavalid => avm_unnamed_ethash_search61_readdatavalid,
        in_unnamed_ethash_search61_avm_waitrequest => avm_unnamed_ethash_search61_waitrequest,
        in_unnamed_ethash_search61_avm_writeack => avm_unnamed_ethash_search61_writeack,
        in_unnamed_ethash_search62_avm_readdata => avm_unnamed_ethash_search62_readdata,
        in_unnamed_ethash_search62_avm_readdatavalid => avm_unnamed_ethash_search62_readdatavalid,
        in_unnamed_ethash_search62_avm_waitrequest => avm_unnamed_ethash_search62_waitrequest,
        in_unnamed_ethash_search62_avm_writeack => avm_unnamed_ethash_search62_writeack,
        in_unnamed_ethash_search63_avm_readdata => avm_unnamed_ethash_search63_readdata,
        in_unnamed_ethash_search63_avm_readdatavalid => avm_unnamed_ethash_search63_readdatavalid,
        in_unnamed_ethash_search63_avm_waitrequest => avm_unnamed_ethash_search63_waitrequest,
        in_unnamed_ethash_search63_avm_writeack => avm_unnamed_ethash_search63_writeack,
        in_unnamed_ethash_search64_avm_readdata => avm_unnamed_ethash_search64_readdata,
        in_unnamed_ethash_search64_avm_readdatavalid => avm_unnamed_ethash_search64_readdatavalid,
        in_unnamed_ethash_search64_avm_waitrequest => avm_unnamed_ethash_search64_waitrequest,
        in_unnamed_ethash_search64_avm_writeack => avm_unnamed_ethash_search64_writeack,
        in_valid_in => embedded_issuer_valid_entry,
        in_workgroup_size => workgroup_size,
        out_call152_avm_address => ethash_search_function_out_call152_avm_address,
        out_call152_avm_burstcount => ethash_search_function_out_call152_avm_burstcount,
        out_call152_avm_byteenable => ethash_search_function_out_call152_avm_byteenable,
        out_call152_avm_enable => ethash_search_function_out_call152_avm_enable,
        out_call152_avm_read => ethash_search_function_out_call152_avm_read,
        out_call152_avm_write => ethash_search_function_out_call152_avm_write,
        out_call152_avm_writedata => ethash_search_function_out_call152_avm_writedata,
        out_memcoalesce_g_header_load_0_avm_address => ethash_search_function_out_memcoalesce_g_header_load_0_avm_address,
        out_memcoalesce_g_header_load_0_avm_burstcount => ethash_search_function_out_memcoalesce_g_header_load_0_avm_burstcount,
        out_memcoalesce_g_header_load_0_avm_byteenable => ethash_search_function_out_memcoalesce_g_header_load_0_avm_byteenable,
        out_memcoalesce_g_header_load_0_avm_enable => ethash_search_function_out_memcoalesce_g_header_load_0_avm_enable,
        out_memcoalesce_g_header_load_0_avm_read => ethash_search_function_out_memcoalesce_g_header_load_0_avm_read,
        out_memcoalesce_g_header_load_0_avm_write => ethash_search_function_out_memcoalesce_g_header_load_0_avm_write,
        out_memcoalesce_g_header_load_0_avm_writedata => ethash_search_function_out_memcoalesce_g_header_load_0_avm_writedata,
        out_memcoalesce_null_load_016_avm_address => ethash_search_function_out_memcoalesce_null_load_016_avm_address,
        out_memcoalesce_null_load_016_avm_burstcount => ethash_search_function_out_memcoalesce_null_load_016_avm_burstcount,
        out_memcoalesce_null_load_016_avm_byteenable => ethash_search_function_out_memcoalesce_null_load_016_avm_byteenable,
        out_memcoalesce_null_load_016_avm_enable => ethash_search_function_out_memcoalesce_null_load_016_avm_enable,
        out_memcoalesce_null_load_016_avm_read => ethash_search_function_out_memcoalesce_null_load_016_avm_read,
        out_memcoalesce_null_load_016_avm_write => ethash_search_function_out_memcoalesce_null_load_016_avm_write,
        out_memcoalesce_null_load_016_avm_writedata => ethash_search_function_out_memcoalesce_null_load_016_avm_writedata,
        out_memcoalesce_null_load_0_avm_address => ethash_search_function_out_memcoalesce_null_load_0_avm_address,
        out_memcoalesce_null_load_0_avm_burstcount => ethash_search_function_out_memcoalesce_null_load_0_avm_burstcount,
        out_memcoalesce_null_load_0_avm_byteenable => ethash_search_function_out_memcoalesce_null_load_0_avm_byteenable,
        out_memcoalesce_null_load_0_avm_enable => ethash_search_function_out_memcoalesce_null_load_0_avm_enable,
        out_memcoalesce_null_load_0_avm_read => ethash_search_function_out_memcoalesce_null_load_0_avm_read,
        out_memcoalesce_null_load_0_avm_write => ethash_search_function_out_memcoalesce_null_load_0_avm_write,
        out_memcoalesce_null_load_0_avm_writedata => ethash_search_function_out_memcoalesce_null_load_0_avm_writedata,
        out_memdep_198_avm_address => ethash_search_function_out_memdep_198_avm_address,
        out_memdep_198_avm_burstcount => ethash_search_function_out_memdep_198_avm_burstcount,
        out_memdep_198_avm_byteenable => ethash_search_function_out_memdep_198_avm_byteenable,
        out_memdep_198_avm_enable => ethash_search_function_out_memdep_198_avm_enable,
        out_memdep_198_avm_read => ethash_search_function_out_memdep_198_avm_read,
        out_memdep_198_avm_write => ethash_search_function_out_memdep_198_avm_write,
        out_memdep_198_avm_writedata => ethash_search_function_out_memdep_198_avm_writedata,
        out_memdep_199_avm_address => ethash_search_function_out_memdep_199_avm_address,
        out_memdep_199_avm_burstcount => ethash_search_function_out_memdep_199_avm_burstcount,
        out_memdep_199_avm_byteenable => ethash_search_function_out_memdep_199_avm_byteenable,
        out_memdep_199_avm_enable => ethash_search_function_out_memdep_199_avm_enable,
        out_memdep_199_avm_read => ethash_search_function_out_memdep_199_avm_read,
        out_memdep_199_avm_write => ethash_search_function_out_memdep_199_avm_write,
        out_memdep_199_avm_writedata => ethash_search_function_out_memdep_199_avm_writedata,
        out_memdep_200_avm_address => ethash_search_function_out_memdep_200_avm_address,
        out_memdep_200_avm_burstcount => ethash_search_function_out_memdep_200_avm_burstcount,
        out_memdep_200_avm_byteenable => ethash_search_function_out_memdep_200_avm_byteenable,
        out_memdep_200_avm_enable => ethash_search_function_out_memdep_200_avm_enable,
        out_memdep_200_avm_read => ethash_search_function_out_memdep_200_avm_read,
        out_memdep_200_avm_write => ethash_search_function_out_memdep_200_avm_write,
        out_memdep_200_avm_writedata => ethash_search_function_out_memdep_200_avm_writedata,
        out_memdep_203_avm_address => ethash_search_function_out_memdep_203_avm_address,
        out_memdep_203_avm_burstcount => ethash_search_function_out_memdep_203_avm_burstcount,
        out_memdep_203_avm_byteenable => ethash_search_function_out_memdep_203_avm_byteenable,
        out_memdep_203_avm_enable => ethash_search_function_out_memdep_203_avm_enable,
        out_memdep_203_avm_read => ethash_search_function_out_memdep_203_avm_read,
        out_memdep_203_avm_write => ethash_search_function_out_memdep_203_avm_write,
        out_memdep_203_avm_writedata => ethash_search_function_out_memdep_203_avm_writedata,
        out_memdep_204_avm_address => ethash_search_function_out_memdep_204_avm_address,
        out_memdep_204_avm_burstcount => ethash_search_function_out_memdep_204_avm_burstcount,
        out_memdep_204_avm_byteenable => ethash_search_function_out_memdep_204_avm_byteenable,
        out_memdep_204_avm_enable => ethash_search_function_out_memdep_204_avm_enable,
        out_memdep_204_avm_read => ethash_search_function_out_memdep_204_avm_read,
        out_memdep_204_avm_write => ethash_search_function_out_memdep_204_avm_write,
        out_memdep_204_avm_writedata => ethash_search_function_out_memdep_204_avm_writedata,
        out_memdep_205_avm_address => ethash_search_function_out_memdep_205_avm_address,
        out_memdep_205_avm_burstcount => ethash_search_function_out_memdep_205_avm_burstcount,
        out_memdep_205_avm_byteenable => ethash_search_function_out_memdep_205_avm_byteenable,
        out_memdep_205_avm_enable => ethash_search_function_out_memdep_205_avm_enable,
        out_memdep_205_avm_read => ethash_search_function_out_memdep_205_avm_read,
        out_memdep_205_avm_write => ethash_search_function_out_memdep_205_avm_write,
        out_memdep_205_avm_writedata => ethash_search_function_out_memdep_205_avm_writedata,
        out_memdep_avm_address => ethash_search_function_out_memdep_avm_address,
        out_memdep_avm_burstcount => ethash_search_function_out_memdep_avm_burstcount,
        out_memdep_avm_byteenable => ethash_search_function_out_memdep_avm_byteenable,
        out_memdep_avm_enable => ethash_search_function_out_memdep_avm_enable,
        out_memdep_avm_read => ethash_search_function_out_memdep_avm_read,
        out_memdep_avm_write => ethash_search_function_out_memdep_avm_write,
        out_memdep_avm_writedata => ethash_search_function_out_memdep_avm_writedata,
        out_o_active_call152 => ethash_search_function_out_o_active_call152,
        out_o_active_unnamed_ethash_search61 => ethash_search_function_out_o_active_unnamed_ethash_search61,
        out_o_active_unnamed_ethash_search62 => ethash_search_function_out_o_active_unnamed_ethash_search62,
        out_o_active_unnamed_ethash_search63 => ethash_search_function_out_o_active_unnamed_ethash_search63,
        out_o_active_unnamed_ethash_search64 => ethash_search_function_out_o_active_unnamed_ethash_search64,
        out_primWireOut => ethash_search_function_out_primWireOut,
        out_stall_out => ethash_search_function_out_stall_out,
        out_unnamed_ethash_search27_avm_address => ethash_search_function_out_unnamed_ethash_search27_avm_address,
        out_unnamed_ethash_search27_avm_burstcount => ethash_search_function_out_unnamed_ethash_search27_avm_burstcount,
        out_unnamed_ethash_search27_avm_byteenable => ethash_search_function_out_unnamed_ethash_search27_avm_byteenable,
        out_unnamed_ethash_search27_avm_enable => ethash_search_function_out_unnamed_ethash_search27_avm_enable,
        out_unnamed_ethash_search27_avm_read => ethash_search_function_out_unnamed_ethash_search27_avm_read,
        out_unnamed_ethash_search27_avm_write => ethash_search_function_out_unnamed_ethash_search27_avm_write,
        out_unnamed_ethash_search27_avm_writedata => ethash_search_function_out_unnamed_ethash_search27_avm_writedata,
        out_unnamed_ethash_search28_avm_address => ethash_search_function_out_unnamed_ethash_search28_avm_address,
        out_unnamed_ethash_search28_avm_burstcount => ethash_search_function_out_unnamed_ethash_search28_avm_burstcount,
        out_unnamed_ethash_search28_avm_byteenable => ethash_search_function_out_unnamed_ethash_search28_avm_byteenable,
        out_unnamed_ethash_search28_avm_enable => ethash_search_function_out_unnamed_ethash_search28_avm_enable,
        out_unnamed_ethash_search28_avm_read => ethash_search_function_out_unnamed_ethash_search28_avm_read,
        out_unnamed_ethash_search28_avm_write => ethash_search_function_out_unnamed_ethash_search28_avm_write,
        out_unnamed_ethash_search28_avm_writedata => ethash_search_function_out_unnamed_ethash_search28_avm_writedata,
        out_unnamed_ethash_search34_avm_address => ethash_search_function_out_unnamed_ethash_search34_avm_address,
        out_unnamed_ethash_search34_avm_burstcount => ethash_search_function_out_unnamed_ethash_search34_avm_burstcount,
        out_unnamed_ethash_search34_avm_byteenable => ethash_search_function_out_unnamed_ethash_search34_avm_byteenable,
        out_unnamed_ethash_search34_avm_enable => ethash_search_function_out_unnamed_ethash_search34_avm_enable,
        out_unnamed_ethash_search34_avm_read => ethash_search_function_out_unnamed_ethash_search34_avm_read,
        out_unnamed_ethash_search34_avm_write => ethash_search_function_out_unnamed_ethash_search34_avm_write,
        out_unnamed_ethash_search34_avm_writedata => ethash_search_function_out_unnamed_ethash_search34_avm_writedata,
        out_unnamed_ethash_search35_avm_address => ethash_search_function_out_unnamed_ethash_search35_avm_address,
        out_unnamed_ethash_search35_avm_burstcount => ethash_search_function_out_unnamed_ethash_search35_avm_burstcount,
        out_unnamed_ethash_search35_avm_byteenable => ethash_search_function_out_unnamed_ethash_search35_avm_byteenable,
        out_unnamed_ethash_search35_avm_enable => ethash_search_function_out_unnamed_ethash_search35_avm_enable,
        out_unnamed_ethash_search35_avm_read => ethash_search_function_out_unnamed_ethash_search35_avm_read,
        out_unnamed_ethash_search35_avm_write => ethash_search_function_out_unnamed_ethash_search35_avm_write,
        out_unnamed_ethash_search35_avm_writedata => ethash_search_function_out_unnamed_ethash_search35_avm_writedata,
        out_unnamed_ethash_search61_avm_address => ethash_search_function_out_unnamed_ethash_search61_avm_address,
        out_unnamed_ethash_search61_avm_burstcount => ethash_search_function_out_unnamed_ethash_search61_avm_burstcount,
        out_unnamed_ethash_search61_avm_byteenable => ethash_search_function_out_unnamed_ethash_search61_avm_byteenable,
        out_unnamed_ethash_search61_avm_enable => ethash_search_function_out_unnamed_ethash_search61_avm_enable,
        out_unnamed_ethash_search61_avm_read => ethash_search_function_out_unnamed_ethash_search61_avm_read,
        out_unnamed_ethash_search61_avm_write => ethash_search_function_out_unnamed_ethash_search61_avm_write,
        out_unnamed_ethash_search61_avm_writedata => ethash_search_function_out_unnamed_ethash_search61_avm_writedata,
        out_unnamed_ethash_search62_avm_address => ethash_search_function_out_unnamed_ethash_search62_avm_address,
        out_unnamed_ethash_search62_avm_burstcount => ethash_search_function_out_unnamed_ethash_search62_avm_burstcount,
        out_unnamed_ethash_search62_avm_byteenable => ethash_search_function_out_unnamed_ethash_search62_avm_byteenable,
        out_unnamed_ethash_search62_avm_enable => ethash_search_function_out_unnamed_ethash_search62_avm_enable,
        out_unnamed_ethash_search62_avm_read => ethash_search_function_out_unnamed_ethash_search62_avm_read,
        out_unnamed_ethash_search62_avm_write => ethash_search_function_out_unnamed_ethash_search62_avm_write,
        out_unnamed_ethash_search62_avm_writedata => ethash_search_function_out_unnamed_ethash_search62_avm_writedata,
        out_unnamed_ethash_search63_avm_address => ethash_search_function_out_unnamed_ethash_search63_avm_address,
        out_unnamed_ethash_search63_avm_burstcount => ethash_search_function_out_unnamed_ethash_search63_avm_burstcount,
        out_unnamed_ethash_search63_avm_byteenable => ethash_search_function_out_unnamed_ethash_search63_avm_byteenable,
        out_unnamed_ethash_search63_avm_enable => ethash_search_function_out_unnamed_ethash_search63_avm_enable,
        out_unnamed_ethash_search63_avm_read => ethash_search_function_out_unnamed_ethash_search63_avm_read,
        out_unnamed_ethash_search63_avm_write => ethash_search_function_out_unnamed_ethash_search63_avm_write,
        out_unnamed_ethash_search63_avm_writedata => ethash_search_function_out_unnamed_ethash_search63_avm_writedata,
        out_unnamed_ethash_search64_avm_address => ethash_search_function_out_unnamed_ethash_search64_avm_address,
        out_unnamed_ethash_search64_avm_burstcount => ethash_search_function_out_unnamed_ethash_search64_avm_burstcount,
        out_unnamed_ethash_search64_avm_byteenable => ethash_search_function_out_unnamed_ethash_search64_avm_byteenable,
        out_unnamed_ethash_search64_avm_enable => ethash_search_function_out_unnamed_ethash_search64_avm_enable,
        out_unnamed_ethash_search64_avm_read => ethash_search_function_out_unnamed_ethash_search64_avm_read,
        out_unnamed_ethash_search64_avm_write => ethash_search_function_out_unnamed_ethash_search64_avm_write,
        out_unnamed_ethash_search64_avm_writedata => ethash_search_function_out_unnamed_ethash_search64_avm_writedata,
        out_valid_out => ethash_search_function_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- avm_call152_address(GPOUT,127)
    avm_call152_address <= ethash_search_function_out_call152_avm_address;

    -- avm_call152_burstcount(GPOUT,128)
    avm_call152_burstcount <= ethash_search_function_out_call152_avm_burstcount;

    -- avm_call152_byteenable(GPOUT,129)
    avm_call152_byteenable <= ethash_search_function_out_call152_avm_byteenable;

    -- avm_call152_enable(GPOUT,130)
    avm_call152_enable <= ethash_search_function_out_call152_avm_enable;

    -- avm_call152_read(GPOUT,131)
    avm_call152_read <= ethash_search_function_out_call152_avm_read;

    -- avm_call152_write(GPOUT,132)
    avm_call152_write <= ethash_search_function_out_call152_avm_write;

    -- avm_call152_writedata(GPOUT,133)
    avm_call152_writedata <= ethash_search_function_out_call152_avm_writedata;

    -- avm_memcoalesce_g_header_load_0_address(GPOUT,134)
    avm_memcoalesce_g_header_load_0_address <= ethash_search_function_out_memcoalesce_g_header_load_0_avm_address;

    -- avm_memcoalesce_g_header_load_0_burstcount(GPOUT,135)
    avm_memcoalesce_g_header_load_0_burstcount <= ethash_search_function_out_memcoalesce_g_header_load_0_avm_burstcount;

    -- avm_memcoalesce_g_header_load_0_byteenable(GPOUT,136)
    avm_memcoalesce_g_header_load_0_byteenable <= ethash_search_function_out_memcoalesce_g_header_load_0_avm_byteenable;

    -- avm_memcoalesce_g_header_load_0_enable(GPOUT,137)
    avm_memcoalesce_g_header_load_0_enable <= ethash_search_function_out_memcoalesce_g_header_load_0_avm_enable;

    -- avm_memcoalesce_g_header_load_0_read(GPOUT,138)
    avm_memcoalesce_g_header_load_0_read <= ethash_search_function_out_memcoalesce_g_header_load_0_avm_read;

    -- avm_memcoalesce_g_header_load_0_write(GPOUT,139)
    avm_memcoalesce_g_header_load_0_write <= ethash_search_function_out_memcoalesce_g_header_load_0_avm_write;

    -- avm_memcoalesce_g_header_load_0_writedata(GPOUT,140)
    avm_memcoalesce_g_header_load_0_writedata <= ethash_search_function_out_memcoalesce_g_header_load_0_avm_writedata;

    -- avm_memcoalesce_null_load_016_address(GPOUT,141)
    avm_memcoalesce_null_load_016_address <= ethash_search_function_out_memcoalesce_null_load_016_avm_address;

    -- avm_memcoalesce_null_load_016_burstcount(GPOUT,142)
    avm_memcoalesce_null_load_016_burstcount <= ethash_search_function_out_memcoalesce_null_load_016_avm_burstcount;

    -- avm_memcoalesce_null_load_016_byteenable(GPOUT,143)
    avm_memcoalesce_null_load_016_byteenable <= ethash_search_function_out_memcoalesce_null_load_016_avm_byteenable;

    -- avm_memcoalesce_null_load_016_enable(GPOUT,144)
    avm_memcoalesce_null_load_016_enable <= ethash_search_function_out_memcoalesce_null_load_016_avm_enable;

    -- avm_memcoalesce_null_load_016_read(GPOUT,145)
    avm_memcoalesce_null_load_016_read <= ethash_search_function_out_memcoalesce_null_load_016_avm_read;

    -- avm_memcoalesce_null_load_016_write(GPOUT,146)
    avm_memcoalesce_null_load_016_write <= ethash_search_function_out_memcoalesce_null_load_016_avm_write;

    -- avm_memcoalesce_null_load_016_writedata(GPOUT,147)
    avm_memcoalesce_null_load_016_writedata <= ethash_search_function_out_memcoalesce_null_load_016_avm_writedata;

    -- avm_memcoalesce_null_load_0_address(GPOUT,148)
    avm_memcoalesce_null_load_0_address <= ethash_search_function_out_memcoalesce_null_load_0_avm_address;

    -- avm_memcoalesce_null_load_0_burstcount(GPOUT,149)
    avm_memcoalesce_null_load_0_burstcount <= ethash_search_function_out_memcoalesce_null_load_0_avm_burstcount;

    -- avm_memcoalesce_null_load_0_byteenable(GPOUT,150)
    avm_memcoalesce_null_load_0_byteenable <= ethash_search_function_out_memcoalesce_null_load_0_avm_byteenable;

    -- avm_memcoalesce_null_load_0_enable(GPOUT,151)
    avm_memcoalesce_null_load_0_enable <= ethash_search_function_out_memcoalesce_null_load_0_avm_enable;

    -- avm_memcoalesce_null_load_0_read(GPOUT,152)
    avm_memcoalesce_null_load_0_read <= ethash_search_function_out_memcoalesce_null_load_0_avm_read;

    -- avm_memcoalesce_null_load_0_write(GPOUT,153)
    avm_memcoalesce_null_load_0_write <= ethash_search_function_out_memcoalesce_null_load_0_avm_write;

    -- avm_memcoalesce_null_load_0_writedata(GPOUT,154)
    avm_memcoalesce_null_load_0_writedata <= ethash_search_function_out_memcoalesce_null_load_0_avm_writedata;

    -- avm_memdep_198_address(GPOUT,155)
    avm_memdep_198_address <= ethash_search_function_out_memdep_198_avm_address;

    -- avm_memdep_198_burstcount(GPOUT,156)
    avm_memdep_198_burstcount <= ethash_search_function_out_memdep_198_avm_burstcount;

    -- avm_memdep_198_byteenable(GPOUT,157)
    avm_memdep_198_byteenable <= ethash_search_function_out_memdep_198_avm_byteenable;

    -- avm_memdep_198_enable(GPOUT,158)
    avm_memdep_198_enable <= ethash_search_function_out_memdep_198_avm_enable;

    -- avm_memdep_198_read(GPOUT,159)
    avm_memdep_198_read <= ethash_search_function_out_memdep_198_avm_read;

    -- avm_memdep_198_write(GPOUT,160)
    avm_memdep_198_write <= ethash_search_function_out_memdep_198_avm_write;

    -- avm_memdep_198_writedata(GPOUT,161)
    avm_memdep_198_writedata <= ethash_search_function_out_memdep_198_avm_writedata;

    -- avm_memdep_199_address(GPOUT,162)
    avm_memdep_199_address <= ethash_search_function_out_memdep_199_avm_address;

    -- avm_memdep_199_burstcount(GPOUT,163)
    avm_memdep_199_burstcount <= ethash_search_function_out_memdep_199_avm_burstcount;

    -- avm_memdep_199_byteenable(GPOUT,164)
    avm_memdep_199_byteenable <= ethash_search_function_out_memdep_199_avm_byteenable;

    -- avm_memdep_199_enable(GPOUT,165)
    avm_memdep_199_enable <= ethash_search_function_out_memdep_199_avm_enable;

    -- avm_memdep_199_read(GPOUT,166)
    avm_memdep_199_read <= ethash_search_function_out_memdep_199_avm_read;

    -- avm_memdep_199_write(GPOUT,167)
    avm_memdep_199_write <= ethash_search_function_out_memdep_199_avm_write;

    -- avm_memdep_199_writedata(GPOUT,168)
    avm_memdep_199_writedata <= ethash_search_function_out_memdep_199_avm_writedata;

    -- avm_memdep_200_address(GPOUT,169)
    avm_memdep_200_address <= ethash_search_function_out_memdep_200_avm_address;

    -- avm_memdep_200_burstcount(GPOUT,170)
    avm_memdep_200_burstcount <= ethash_search_function_out_memdep_200_avm_burstcount;

    -- avm_memdep_200_byteenable(GPOUT,171)
    avm_memdep_200_byteenable <= ethash_search_function_out_memdep_200_avm_byteenable;

    -- avm_memdep_200_enable(GPOUT,172)
    avm_memdep_200_enable <= ethash_search_function_out_memdep_200_avm_enable;

    -- avm_memdep_200_read(GPOUT,173)
    avm_memdep_200_read <= ethash_search_function_out_memdep_200_avm_read;

    -- avm_memdep_200_write(GPOUT,174)
    avm_memdep_200_write <= ethash_search_function_out_memdep_200_avm_write;

    -- avm_memdep_200_writedata(GPOUT,175)
    avm_memdep_200_writedata <= ethash_search_function_out_memdep_200_avm_writedata;

    -- avm_memdep_203_address(GPOUT,176)
    avm_memdep_203_address <= ethash_search_function_out_memdep_203_avm_address;

    -- avm_memdep_203_burstcount(GPOUT,177)
    avm_memdep_203_burstcount <= ethash_search_function_out_memdep_203_avm_burstcount;

    -- avm_memdep_203_byteenable(GPOUT,178)
    avm_memdep_203_byteenable <= ethash_search_function_out_memdep_203_avm_byteenable;

    -- avm_memdep_203_enable(GPOUT,179)
    avm_memdep_203_enable <= ethash_search_function_out_memdep_203_avm_enable;

    -- avm_memdep_203_read(GPOUT,180)
    avm_memdep_203_read <= ethash_search_function_out_memdep_203_avm_read;

    -- avm_memdep_203_write(GPOUT,181)
    avm_memdep_203_write <= ethash_search_function_out_memdep_203_avm_write;

    -- avm_memdep_203_writedata(GPOUT,182)
    avm_memdep_203_writedata <= ethash_search_function_out_memdep_203_avm_writedata;

    -- avm_memdep_204_address(GPOUT,183)
    avm_memdep_204_address <= ethash_search_function_out_memdep_204_avm_address;

    -- avm_memdep_204_burstcount(GPOUT,184)
    avm_memdep_204_burstcount <= ethash_search_function_out_memdep_204_avm_burstcount;

    -- avm_memdep_204_byteenable(GPOUT,185)
    avm_memdep_204_byteenable <= ethash_search_function_out_memdep_204_avm_byteenable;

    -- avm_memdep_204_enable(GPOUT,186)
    avm_memdep_204_enable <= ethash_search_function_out_memdep_204_avm_enable;

    -- avm_memdep_204_read(GPOUT,187)
    avm_memdep_204_read <= ethash_search_function_out_memdep_204_avm_read;

    -- avm_memdep_204_write(GPOUT,188)
    avm_memdep_204_write <= ethash_search_function_out_memdep_204_avm_write;

    -- avm_memdep_204_writedata(GPOUT,189)
    avm_memdep_204_writedata <= ethash_search_function_out_memdep_204_avm_writedata;

    -- avm_memdep_205_address(GPOUT,190)
    avm_memdep_205_address <= ethash_search_function_out_memdep_205_avm_address;

    -- avm_memdep_205_burstcount(GPOUT,191)
    avm_memdep_205_burstcount <= ethash_search_function_out_memdep_205_avm_burstcount;

    -- avm_memdep_205_byteenable(GPOUT,192)
    avm_memdep_205_byteenable <= ethash_search_function_out_memdep_205_avm_byteenable;

    -- avm_memdep_205_enable(GPOUT,193)
    avm_memdep_205_enable <= ethash_search_function_out_memdep_205_avm_enable;

    -- avm_memdep_205_read(GPOUT,194)
    avm_memdep_205_read <= ethash_search_function_out_memdep_205_avm_read;

    -- avm_memdep_205_write(GPOUT,195)
    avm_memdep_205_write <= ethash_search_function_out_memdep_205_avm_write;

    -- avm_memdep_205_writedata(GPOUT,196)
    avm_memdep_205_writedata <= ethash_search_function_out_memdep_205_avm_writedata;

    -- avm_memdep_address(GPOUT,197)
    avm_memdep_address <= ethash_search_function_out_memdep_avm_address;

    -- avm_memdep_burstcount(GPOUT,198)
    avm_memdep_burstcount <= ethash_search_function_out_memdep_avm_burstcount;

    -- avm_memdep_byteenable(GPOUT,199)
    avm_memdep_byteenable <= ethash_search_function_out_memdep_avm_byteenable;

    -- avm_memdep_enable(GPOUT,200)
    avm_memdep_enable <= ethash_search_function_out_memdep_avm_enable;

    -- avm_memdep_read(GPOUT,201)
    avm_memdep_read <= ethash_search_function_out_memdep_avm_read;

    -- avm_memdep_write(GPOUT,202)
    avm_memdep_write <= ethash_search_function_out_memdep_avm_write;

    -- avm_memdep_writedata(GPOUT,203)
    avm_memdep_writedata <= ethash_search_function_out_memdep_avm_writedata;

    -- avm_unnamed_ethash_search27_address(GPOUT,204)
    avm_unnamed_ethash_search27_address <= ethash_search_function_out_unnamed_ethash_search27_avm_address;

    -- avm_unnamed_ethash_search27_burstcount(GPOUT,205)
    avm_unnamed_ethash_search27_burstcount <= ethash_search_function_out_unnamed_ethash_search27_avm_burstcount;

    -- avm_unnamed_ethash_search27_byteenable(GPOUT,206)
    avm_unnamed_ethash_search27_byteenable <= ethash_search_function_out_unnamed_ethash_search27_avm_byteenable;

    -- avm_unnamed_ethash_search27_enable(GPOUT,207)
    avm_unnamed_ethash_search27_enable <= ethash_search_function_out_unnamed_ethash_search27_avm_enable;

    -- avm_unnamed_ethash_search27_read(GPOUT,208)
    avm_unnamed_ethash_search27_read <= ethash_search_function_out_unnamed_ethash_search27_avm_read;

    -- avm_unnamed_ethash_search27_write(GPOUT,209)
    avm_unnamed_ethash_search27_write <= ethash_search_function_out_unnamed_ethash_search27_avm_write;

    -- avm_unnamed_ethash_search27_writedata(GPOUT,210)
    avm_unnamed_ethash_search27_writedata <= ethash_search_function_out_unnamed_ethash_search27_avm_writedata;

    -- avm_unnamed_ethash_search28_address(GPOUT,211)
    avm_unnamed_ethash_search28_address <= ethash_search_function_out_unnamed_ethash_search28_avm_address;

    -- avm_unnamed_ethash_search28_burstcount(GPOUT,212)
    avm_unnamed_ethash_search28_burstcount <= ethash_search_function_out_unnamed_ethash_search28_avm_burstcount;

    -- avm_unnamed_ethash_search28_byteenable(GPOUT,213)
    avm_unnamed_ethash_search28_byteenable <= ethash_search_function_out_unnamed_ethash_search28_avm_byteenable;

    -- avm_unnamed_ethash_search28_enable(GPOUT,214)
    avm_unnamed_ethash_search28_enable <= ethash_search_function_out_unnamed_ethash_search28_avm_enable;

    -- avm_unnamed_ethash_search28_read(GPOUT,215)
    avm_unnamed_ethash_search28_read <= ethash_search_function_out_unnamed_ethash_search28_avm_read;

    -- avm_unnamed_ethash_search28_write(GPOUT,216)
    avm_unnamed_ethash_search28_write <= ethash_search_function_out_unnamed_ethash_search28_avm_write;

    -- avm_unnamed_ethash_search28_writedata(GPOUT,217)
    avm_unnamed_ethash_search28_writedata <= ethash_search_function_out_unnamed_ethash_search28_avm_writedata;

    -- avm_unnamed_ethash_search34_address(GPOUT,218)
    avm_unnamed_ethash_search34_address <= ethash_search_function_out_unnamed_ethash_search34_avm_address;

    -- avm_unnamed_ethash_search34_burstcount(GPOUT,219)
    avm_unnamed_ethash_search34_burstcount <= ethash_search_function_out_unnamed_ethash_search34_avm_burstcount;

    -- avm_unnamed_ethash_search34_byteenable(GPOUT,220)
    avm_unnamed_ethash_search34_byteenable <= ethash_search_function_out_unnamed_ethash_search34_avm_byteenable;

    -- avm_unnamed_ethash_search34_enable(GPOUT,221)
    avm_unnamed_ethash_search34_enable <= ethash_search_function_out_unnamed_ethash_search34_avm_enable;

    -- avm_unnamed_ethash_search34_read(GPOUT,222)
    avm_unnamed_ethash_search34_read <= ethash_search_function_out_unnamed_ethash_search34_avm_read;

    -- avm_unnamed_ethash_search34_write(GPOUT,223)
    avm_unnamed_ethash_search34_write <= ethash_search_function_out_unnamed_ethash_search34_avm_write;

    -- avm_unnamed_ethash_search34_writedata(GPOUT,224)
    avm_unnamed_ethash_search34_writedata <= ethash_search_function_out_unnamed_ethash_search34_avm_writedata;

    -- avm_unnamed_ethash_search35_address(GPOUT,225)
    avm_unnamed_ethash_search35_address <= ethash_search_function_out_unnamed_ethash_search35_avm_address;

    -- avm_unnamed_ethash_search35_burstcount(GPOUT,226)
    avm_unnamed_ethash_search35_burstcount <= ethash_search_function_out_unnamed_ethash_search35_avm_burstcount;

    -- avm_unnamed_ethash_search35_byteenable(GPOUT,227)
    avm_unnamed_ethash_search35_byteenable <= ethash_search_function_out_unnamed_ethash_search35_avm_byteenable;

    -- avm_unnamed_ethash_search35_enable(GPOUT,228)
    avm_unnamed_ethash_search35_enable <= ethash_search_function_out_unnamed_ethash_search35_avm_enable;

    -- avm_unnamed_ethash_search35_read(GPOUT,229)
    avm_unnamed_ethash_search35_read <= ethash_search_function_out_unnamed_ethash_search35_avm_read;

    -- avm_unnamed_ethash_search35_write(GPOUT,230)
    avm_unnamed_ethash_search35_write <= ethash_search_function_out_unnamed_ethash_search35_avm_write;

    -- avm_unnamed_ethash_search35_writedata(GPOUT,231)
    avm_unnamed_ethash_search35_writedata <= ethash_search_function_out_unnamed_ethash_search35_avm_writedata;

    -- avm_unnamed_ethash_search61_address(GPOUT,232)
    avm_unnamed_ethash_search61_address <= ethash_search_function_out_unnamed_ethash_search61_avm_address;

    -- avm_unnamed_ethash_search61_burstcount(GPOUT,233)
    avm_unnamed_ethash_search61_burstcount <= ethash_search_function_out_unnamed_ethash_search61_avm_burstcount;

    -- avm_unnamed_ethash_search61_byteenable(GPOUT,234)
    avm_unnamed_ethash_search61_byteenable <= ethash_search_function_out_unnamed_ethash_search61_avm_byteenable;

    -- avm_unnamed_ethash_search61_enable(GPOUT,235)
    avm_unnamed_ethash_search61_enable <= ethash_search_function_out_unnamed_ethash_search61_avm_enable;

    -- avm_unnamed_ethash_search61_read(GPOUT,236)
    avm_unnamed_ethash_search61_read <= ethash_search_function_out_unnamed_ethash_search61_avm_read;

    -- avm_unnamed_ethash_search61_write(GPOUT,237)
    avm_unnamed_ethash_search61_write <= ethash_search_function_out_unnamed_ethash_search61_avm_write;

    -- avm_unnamed_ethash_search61_writedata(GPOUT,238)
    avm_unnamed_ethash_search61_writedata <= ethash_search_function_out_unnamed_ethash_search61_avm_writedata;

    -- avm_unnamed_ethash_search62_address(GPOUT,239)
    avm_unnamed_ethash_search62_address <= ethash_search_function_out_unnamed_ethash_search62_avm_address;

    -- avm_unnamed_ethash_search62_burstcount(GPOUT,240)
    avm_unnamed_ethash_search62_burstcount <= ethash_search_function_out_unnamed_ethash_search62_avm_burstcount;

    -- avm_unnamed_ethash_search62_byteenable(GPOUT,241)
    avm_unnamed_ethash_search62_byteenable <= ethash_search_function_out_unnamed_ethash_search62_avm_byteenable;

    -- avm_unnamed_ethash_search62_enable(GPOUT,242)
    avm_unnamed_ethash_search62_enable <= ethash_search_function_out_unnamed_ethash_search62_avm_enable;

    -- avm_unnamed_ethash_search62_read(GPOUT,243)
    avm_unnamed_ethash_search62_read <= ethash_search_function_out_unnamed_ethash_search62_avm_read;

    -- avm_unnamed_ethash_search62_write(GPOUT,244)
    avm_unnamed_ethash_search62_write <= ethash_search_function_out_unnamed_ethash_search62_avm_write;

    -- avm_unnamed_ethash_search62_writedata(GPOUT,245)
    avm_unnamed_ethash_search62_writedata <= ethash_search_function_out_unnamed_ethash_search62_avm_writedata;

    -- avm_unnamed_ethash_search63_address(GPOUT,246)
    avm_unnamed_ethash_search63_address <= ethash_search_function_out_unnamed_ethash_search63_avm_address;

    -- avm_unnamed_ethash_search63_burstcount(GPOUT,247)
    avm_unnamed_ethash_search63_burstcount <= ethash_search_function_out_unnamed_ethash_search63_avm_burstcount;

    -- avm_unnamed_ethash_search63_byteenable(GPOUT,248)
    avm_unnamed_ethash_search63_byteenable <= ethash_search_function_out_unnamed_ethash_search63_avm_byteenable;

    -- avm_unnamed_ethash_search63_enable(GPOUT,249)
    avm_unnamed_ethash_search63_enable <= ethash_search_function_out_unnamed_ethash_search63_avm_enable;

    -- avm_unnamed_ethash_search63_read(GPOUT,250)
    avm_unnamed_ethash_search63_read <= ethash_search_function_out_unnamed_ethash_search63_avm_read;

    -- avm_unnamed_ethash_search63_write(GPOUT,251)
    avm_unnamed_ethash_search63_write <= ethash_search_function_out_unnamed_ethash_search63_avm_write;

    -- avm_unnamed_ethash_search63_writedata(GPOUT,252)
    avm_unnamed_ethash_search63_writedata <= ethash_search_function_out_unnamed_ethash_search63_avm_writedata;

    -- avm_unnamed_ethash_search64_address(GPOUT,253)
    avm_unnamed_ethash_search64_address <= ethash_search_function_out_unnamed_ethash_search64_avm_address;

    -- avm_unnamed_ethash_search64_burstcount(GPOUT,254)
    avm_unnamed_ethash_search64_burstcount <= ethash_search_function_out_unnamed_ethash_search64_avm_burstcount;

    -- avm_unnamed_ethash_search64_byteenable(GPOUT,255)
    avm_unnamed_ethash_search64_byteenable <= ethash_search_function_out_unnamed_ethash_search64_avm_byteenable;

    -- avm_unnamed_ethash_search64_enable(GPOUT,256)
    avm_unnamed_ethash_search64_enable <= ethash_search_function_out_unnamed_ethash_search64_avm_enable;

    -- avm_unnamed_ethash_search64_read(GPOUT,257)
    avm_unnamed_ethash_search64_read <= ethash_search_function_out_unnamed_ethash_search64_avm_read;

    -- avm_unnamed_ethash_search64_write(GPOUT,258)
    avm_unnamed_ethash_search64_write <= ethash_search_function_out_unnamed_ethash_search64_avm_write;

    -- avm_unnamed_ethash_search64_writedata(GPOUT,259)
    avm_unnamed_ethash_search64_writedata <= ethash_search_function_out_unnamed_ethash_search64_avm_writedata;

    -- acl_clock2x_dummy_consumer(EXTIFACE,7)
    acl_clock2x_dummy_consumer_clock2x <= clock2x;
    acl_clock2x_dummy_consumer_clock2x_bitsignaltemp <= acl_clock2x_dummy_consumer_clock2x(0);
    acl_clock2x_dummy_consumer_myout(0) <= acl_clock2x_dummy_consumer_myout_bitsignaltemp;
    theacl_clock2x_dummy_consumer : acl_clock2x_holder
    PORT MAP (
        clock2x => acl_clock2x_dummy_consumer_clock2x_bitsignaltemp,
        myout => acl_clock2x_dummy_consumer_myout_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- clock2x_output(GPOUT,260)
    clock2x_output <= acl_clock2x_dummy_consumer_myout;

    -- is_any_lsu_active(LOGICAL,126)
    is_any_lsu_active_q <= ethash_search_function_out_o_active_call152 or ethash_search_function_out_o_active_unnamed_ethash_search61 or ethash_search_function_out_o_active_unnamed_ethash_search62 or ethash_search_function_out_o_active_unnamed_ethash_search63 or ethash_search_function_out_o_active_unnamed_ethash_search64;

    -- has_a_lsu_active(GPOUT,261)
    has_a_lsu_active <= is_any_lsu_active_q;

    -- has_a_write_pending(GPOUT,262)
    has_a_write_pending <= is_any_lsu_active_q;

    -- kernel_stall_out(GPOUT,263)
    kernel_stall_out <= embedded_issuer_stall_out;

    -- kernel_valid_out(GPOUT,264)
    kernel_valid_out <= ethash_search_function_out_valid_out;

END normal;
