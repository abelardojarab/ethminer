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

-- VHDL created from ethash_search_function
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

entity ethash_search_function is
    port (
        in_arg_acl_hw_wg_id : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_g_dag : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_g_header : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_g_output : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_global_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_isolate : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_start_nonce : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_target : in std_logic_vector(63 downto 0);  -- ufix64
        in_call152_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_call152_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_call152_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_call152_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_g_header_load_0_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_memcoalesce_g_header_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_g_header_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_g_header_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_null_load_016_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memcoalesce_null_load_016_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_null_load_016_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_null_load_016_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_null_load_0_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memcoalesce_null_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_null_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_null_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_198_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memdep_198_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_198_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_198_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_199_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memdep_199_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_199_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_199_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_200_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memdep_200_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_200_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_200_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_203_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memdep_203_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_203_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_203_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_204_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memdep_204_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_204_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_204_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_205_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memdep_205_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_205_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_205_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memdep_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_start : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search27_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_unnamed_ethash_search27_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search27_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search27_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search28_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_unnamed_ethash_search28_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search28_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search28_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search34_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_unnamed_ethash_search34_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search34_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search34_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search35_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_unnamed_ethash_search35_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search35_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search35_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search61_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_unnamed_ethash_search61_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search61_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search61_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search62_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_unnamed_ethash_search62_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search62_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search62_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search63_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_unnamed_ethash_search63_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search63_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search63_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search64_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_unnamed_ethash_search64_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search64_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search64_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_workgroup_size : in std_logic_vector(31 downto 0);  -- ufix32
        out_call152_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        out_call152_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_call152_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_call152_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_call152_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_call152_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_call152_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_memcoalesce_g_header_load_0_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        out_memcoalesce_g_header_load_0_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_g_header_load_0_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_memcoalesce_g_header_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_g_header_load_0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_g_header_load_0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_g_header_load_0_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_memcoalesce_null_load_016_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_null_load_016_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_016_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_memcoalesce_null_load_016_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_016_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_016_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_016_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_memcoalesce_null_load_0_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_null_load_0_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_0_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_memcoalesce_null_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_0_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_memdep_198_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_198_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_198_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_memdep_198_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_198_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_198_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_198_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_memdep_199_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_199_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_199_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_memdep_199_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_199_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_199_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_199_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_memdep_200_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_200_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_200_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_memdep_200_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_200_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_200_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_200_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_memdep_203_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_203_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_203_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_memdep_203_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_203_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_203_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_203_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_memdep_204_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_204_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_204_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_memdep_204_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_204_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_204_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_204_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_memdep_205_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_205_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_205_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_memdep_205_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_205_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_205_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_205_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_memdep_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_memdep_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_o_active_call152 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_active_unnamed_ethash_search61 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_active_unnamed_ethash_search62 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_active_unnamed_ethash_search63 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_active_unnamed_ethash_search64 : out std_logic_vector(0 downto 0);  -- ufix1
        out_primWireOut : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search27_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_ethash_search27_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search27_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_unnamed_ethash_search27_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search27_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search27_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search27_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_unnamed_ethash_search28_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_ethash_search28_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search28_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_unnamed_ethash_search28_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search28_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search28_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search28_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_unnamed_ethash_search34_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_ethash_search34_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search34_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_unnamed_ethash_search34_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search34_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search34_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search34_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_unnamed_ethash_search35_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        out_unnamed_ethash_search35_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_ethash_search35_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_ethash_search35_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search35_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search35_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search35_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_unnamed_ethash_search61_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        out_unnamed_ethash_search61_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_ethash_search61_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_ethash_search61_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search61_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search61_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search61_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_unnamed_ethash_search62_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        out_unnamed_ethash_search62_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_ethash_search62_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_ethash_search62_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search62_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search62_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search62_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_unnamed_ethash_search63_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        out_unnamed_ethash_search63_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_ethash_search63_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_ethash_search63_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search63_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search63_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search63_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_unnamed_ethash_search64_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        out_unnamed_ethash_search64_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_ethash_search64_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_ethash_search64_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search64_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search64_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search64_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end ethash_search_function;

architecture normal of ethash_search_function is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_ethash_search_B4_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(4 downto 0);  -- Fixed Point
            in_i_data_0_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_1_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_i_data_2_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_3_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
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
            in_i_data_23 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_24 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_25 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_26 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_27 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_28 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_29 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_30 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_31 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_32 : in std_logic_vector(3 downto 0);  -- Fixed Point
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
            in_i_data_43 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_44 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_45 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_46 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_47 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_48 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_49 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_50 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_o_data_0_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_1_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(2 downto 0);  -- Fixed Point
            out_o_data_2_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_3_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
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
            out_o_data_23 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_24 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_25 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_26 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_27 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_28 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_29 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_30 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_31 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_32 : out std_logic_vector(3 downto 0);  -- Fixed Point
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
            out_o_data_43 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_44 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_45 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_46 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_47 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_48 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_49 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_50 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_search_B4_sr_1 is
        port (
            in_i_data_0 : in std_logic_vector(4 downto 0);  -- Fixed Point
            in_i_data_0_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_1_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_i_data_2_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_3_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
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
            in_i_data_23 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_24 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_25 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_26 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_27 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_28 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_29 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_30 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_31 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_32 : in std_logic_vector(3 downto 0);  -- Fixed Point
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
            in_i_data_43 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_44 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_45 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_46 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_47 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_48 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_49 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_50 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_o_data_0_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_1_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(2 downto 0);  -- Fixed Point
            out_o_data_2_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_3_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
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
            out_o_data_23 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_24 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_25 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_26 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_27 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_28 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_29 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_30 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_31 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_32 : out std_logic_vector(3 downto 0);  -- Fixed Point
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
            out_o_data_43 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_44 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_45 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_46 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_47 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_48 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_49 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_50 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_search_B1_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(5 downto 0);  -- Fixed Point
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
            in_i_data_25 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_26 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_27 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_28 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_29 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_30 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_31 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_32 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_33 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_34 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_35 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_36 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_37 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_38 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_39 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_40 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_41 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_42 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_43 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_44 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_45 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_46 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_47 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_48 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_49 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(5 downto 0);  -- Fixed Point
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
            out_o_data_25 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_26 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_27 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_28 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_29 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_30 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_31 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_32 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_33 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_34 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_35 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_36 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_37 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_38 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_39 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_40 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_41 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_42 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_43 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_44 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_45 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_46 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_47 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_48 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_49 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_search_B1_sr_1 is
        port (
            in_i_data_0 : in std_logic_vector(5 downto 0);  -- Fixed Point
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
            in_i_data_25 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_26 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_27 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_28 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_29 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_30 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_31 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_32 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_33 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_34 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_35 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_36 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_37 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_38 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_39 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_40 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_41 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_42 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_43 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_44 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_45 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_46 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_47 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_48 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_49 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(5 downto 0);  -- Fixed Point
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
            out_o_data_25 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_26 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_27 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_28 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_29 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_30 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_31 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_32 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_33 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_34 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_35 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_36 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_37 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_38 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_39 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_40 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_41 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_42 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_43 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_44 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_45 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_46 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_47 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_48 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_49 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_search_B2_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
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
            in_i_data_26 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_27 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_28 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_29 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_30 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
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
            out_o_data_26 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_27 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_28 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_29 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_30 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_search_B3 is
        port (
            in_barrier_unnamed_ethash_search29_wgs_workgroup_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_barrier_unnamed_ethash_search30_wgs_workgroup_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_barrier_unnamed_ethash_search31_wgs_workgroup_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1106_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe1106_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2108_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe2108_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe3112_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe3112_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe4116_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe4116_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_encoder_ethash_search_B3_merge_priority_encoder_workgroup_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_fpgaindvars_iv12_0 : in std_logic_vector(3 downto 0);  -- Fixed Point
            in_fpgaindvars_iv12_1 : in std_logic_vector(3 downto 0);  -- Fixed Point
            in_g_dag : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_g_output : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_global_id_0195_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_id_0195_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i18_0908_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i18_0908_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_06_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_06_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr9_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr9_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
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
            in_memdep_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memdep_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_scalarizer_0100165_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100165_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100375_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100375_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100585_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100585_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100795_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100795_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01173_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01173_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01175_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01175_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01177_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01177_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01179_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01179_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099325_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099325_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099535_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099535_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099745_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099745_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099955_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099955_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100060_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100060_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100270_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100270_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100480_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100480_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100690_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100690_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11008100_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11008100_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11174_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11174_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11176_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11176_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11178_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11178_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11180_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11180_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199430_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199430_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199640_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199640_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199850_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199850_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_state_0_0_cast120_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_0_0_cast120_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_4_0_cast123_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_4_0_cast123_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_5_0_cast126_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_5_0_cast126_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_6_0_cast129_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_6_0_cast129_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_7_0_cast132_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_7_0_cast132_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_target : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_unnamed_ethash_search27_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_unnamed_ethash_search27_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search27_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search27_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search28_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_unnamed_ethash_search28_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search28_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search28_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search27_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_ethash_search27_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_ethash_search27_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_ethash_search27_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_and_RM : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_arraydecay51_RM : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx36_2_RM : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx45_RM : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe1106 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2108 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe3112 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe4116 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_cmp23 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_cmp23_xor : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_fpgaindvars_iv12 : out std_logic_vector(3 downto 0);  -- Fixed Point
            out_global_id_0195 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_i18_0908 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_06 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr_zext : out std_logic_vector(63 downto 0);  -- Fixed Point
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
            out_memdep_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_memdep_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_scalarizer_0100165 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0100375 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0100585 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0100795 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01173 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01175 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01177 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01179 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099325 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099535 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099745 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099955 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100060 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100270 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100480 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100690 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11008100 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11174 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11176 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11178 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11180 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_199430 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_199640 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_199850 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_state_0_0_cast120 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_4_0_cast123 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_5_0_cast126 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_6_0_cast129 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_7_0_cast132 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_unnamed_ethash_search27_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_ethash_search27_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search27_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_unnamed_ethash_search27_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search27_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search27_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search27_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_unnamed_ethash_search28 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_ethash_search28_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_ethash_search28_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search28_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_unnamed_ethash_search28_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search28_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search28_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search28_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_search_B3_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(3 downto 0);  -- Fixed Point
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
            in_i_data_28 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_29 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_30 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_31 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_32 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_33 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_34 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_35 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_36 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_37 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(3 downto 0);  -- Fixed Point
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
            out_o_data_28 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_29 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_30 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_31 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_32 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_33 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_34 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_35 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_36 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_37 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_search_B3_sr_1 is
        port (
            in_i_data_0 : in std_logic_vector(3 downto 0);  -- Fixed Point
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
            in_i_data_28 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_29 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_30 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_31 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_32 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_33 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_34 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_35 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_36 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_37 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(3 downto 0);  -- Fixed Point
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
            out_o_data_28 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_29 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_30 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_31 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_32 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_33 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_34 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_35 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_36 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_37 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_search_B4 is
        port (
            in_mix_pm_2_in_0_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mix_pm_2_in_0_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mix_pm_2_in_0_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mix_pm_2_in_0_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mix_pm_2_in_1_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mix_pm_2_in_1_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mix_pm_2_in_1_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mix_pm_2_in_1_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_a_1907_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_a_1907_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_and_RM155_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_and_RM155_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arraydecay51_RM166_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arraydecay51_RM166_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx36_2_RM165_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx36_2_RM165_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx45_RM163_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx45_RM163_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_barrier_unnamed_ethash_search33_wgs_workgroup_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1105_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe1105_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2110_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe2110_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe3114_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe3114_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe4118_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe4118_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_cmp23157_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_cmp23157_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_cmp23_xor159_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_cmp23_xor159_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_encoder_ethash_search_B4_merge_priority_encoder_workgroup_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_fpgaindvars_iv12136_0 : in std_logic_vector(3 downto 0);  -- Fixed Point
            in_fpgaindvars_iv12136_1 : in std_logic_vector(3 downto 0);  -- Fixed Point
            in_fpgaindvars_iv6_0 : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_fpgaindvars_iv6_1 : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_fpgaindvars_iv9_0 : in std_logic_vector(4 downto 0);  -- Fixed Point
            in_fpgaindvars_iv9_1 : in std_logic_vector(4 downto 0);  -- Fixed Point
            in_g_dag : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_g_output : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_global_id_0194_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_id_0194_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i18_0908154_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i18_0908154_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i66_2906_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i66_2906_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_05_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_05_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr11_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr11_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr_zext161_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_l_grpid_0_addr_zext161_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_memdep_204_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memdep_204_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_204_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_204_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_scalarizer_0100164_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100164_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100374_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100374_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100584_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100584_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100794_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100794_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01173138_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01173138_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01175142_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01175142_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01177146_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01177146_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01179150_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01179150_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099324_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099324_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099534_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099534_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099744_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099744_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099954_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099954_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100059_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100059_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100269_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100269_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100479_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100479_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100689_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100689_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100899_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100899_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11174140_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11174140_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11176144_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11176144_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11178148_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11178148_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11180152_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11180152_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199429_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199429_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199639_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199639_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199849_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199849_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_state_0_0_cast122_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_0_0_cast122_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_4_0_cast125_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_4_0_cast125_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_5_0_cast128_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_5_0_cast128_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_6_0_cast131_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_6_0_cast131_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_7_0_cast134_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_7_0_cast134_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_target : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_unnamed_ethash_search32_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_unnamed_ethash_search32_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_unnamed_ethash_search34_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_unnamed_ethash_search34_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search34_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search34_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search35_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_unnamed_ethash_search35_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search35_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search35_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_xor_i679_3_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_xor_i679_3_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_xor_i679_3_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_xor_i679_3_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_a_1907_LC_OuterPHI : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_and_RM155 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_arraydecay51_RM166 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx36_2_RM165 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx45_RM163 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe1105 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2110 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe3114 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe4118 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_cmp23157 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_cmp23_xor159 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_fpgaindvars_iv12136 : out std_logic_vector(3 downto 0);  -- Fixed Point
            out_fpgaindvars_iv6_LC_InnerPHI : out std_logic_vector(2 downto 0);  -- Fixed Point
            out_fpgaindvars_iv9_LC_OuterPHI : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_global_id_0194 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_i18_0908154 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_i66_2906_LC_InnerPHI : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_idxprom80_RM : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_l_grpid_05 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr_zext161 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_memdep_204_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_204_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_204_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_memdep_204_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_204_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_204_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_204_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_scalarizer_0100164 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0100374 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0100584 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0100794 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01173138 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01175142 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01177146 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01179150 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099324 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099534 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099744 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099954 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0xor1200 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100059 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100269 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100479 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100689 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100899 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11174140 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11176144 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11178148 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11180152 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_199429 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_199639 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_199849 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1xor1201 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_2xor : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_3xor : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_state_0_0_cast122 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_4_0_cast125 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_5_0_cast128 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_6_0_cast131 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_7_0_cast134 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_unnamed_ethash_search32 : out std_logic_vector(31 downto 0);  -- Fixed Point
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
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_search_B5_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
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
            in_i_data_18 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_19 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_20 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_21 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_22 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_23 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_24 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_25 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_26 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_27 : in std_logic_vector(3 downto 0);  -- Fixed Point
            in_i_data_28 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_29 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_30 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_31 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_32 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_33 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_34 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_35 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_36 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_37 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_38 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_39 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_40 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_41 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_42 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_43 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_44 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_45 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_46 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_47 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
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
            out_o_data_18 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_19 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_20 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_21 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_22 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_23 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_24 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_25 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_26 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_27 : out std_logic_vector(3 downto 0);  -- Fixed Point
            out_o_data_28 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_29 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_30 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_31 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_32 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_33 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_34 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_35 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_36 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_37 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_38 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_39 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_40 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_41 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_42 : out std_logic_vector(63 downto 0);  -- Fixed Point
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


    component bb_ethash_search_B6_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
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
            in_i_data_17 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_18 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_19 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_20 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_21 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_22 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_23 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_24 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_25 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_26 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
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
            out_o_data_17 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_19 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_20 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_21 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_22 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_23 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_25 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_26 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_search_B7_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(5 downto 0);  -- Fixed Point
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
            in_i_data_17 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_18 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_19 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_20 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_21 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_22 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_23 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_24 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_25 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_26 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_27 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_28 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_29 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_30 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_31 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_32 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_33 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_34 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_35 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_36 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_37 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_38 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_39 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_40 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_41 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(5 downto 0);  -- Fixed Point
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
            out_o_data_17 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_18 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_19 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_20 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_21 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_22 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_23 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_24 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_25 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_26 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_27 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_28 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_29 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_30 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_31 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_32 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_33 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_34 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_35 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_36 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_37 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_38 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_39 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_40 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_41 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_search_B7_sr_1 is
        port (
            in_i_data_0 : in std_logic_vector(5 downto 0);  -- Fixed Point
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
            in_i_data_17 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_18 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_19 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_20 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_21 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_22 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_23 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_24 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_25 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_26 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_27 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_28 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_29 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_30 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_31 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_32 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_33 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_34 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_35 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_36 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_37 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_38 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_39 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_40 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_41 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(5 downto 0);  -- Fixed Point
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
            out_o_data_17 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_18 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_19 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_20 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_21 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_22 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_23 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_24 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_25 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_26 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_27 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_28 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_29 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_30 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_31 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_32 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_33 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_34 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_35 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_36 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_37 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_38 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_39 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_40 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_41 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_search_B8_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_search_B0 is
        port (
            in_acl_hw_wg_id_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_g_dag : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_g_header : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_g_output : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_global_id_0_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_isolate : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memcoalesce_g_header_load_0_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_memcoalesce_g_header_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_g_header_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_g_header_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_start_nonce : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_target : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_wgl_0_enter_exit_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_wgl_0_enter_exit_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_wgl_0_wgs_wg_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_0979 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_0981 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_0983 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_0985 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_1980 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_1982 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_1984 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_1986 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_add : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_global_id_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_g_header_load_0_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_memcoalesce_g_header_load_0_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_g_header_load_0_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_memcoalesce_g_header_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_g_header_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_g_header_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_g_header_load_0_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_wgl_0_enter_exit_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_wgl_0_enter_exit_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_search_B1 is
        port (
            in_arrayidx10_i_i803_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx10_i_i803_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx12_i_i806_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx12_i_i806_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx14_i_i809_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx14_i_i809_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx16_i_i812_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx16_i_i812_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx1_i_i856_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx1_i_i856_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx20_i_i817_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx20_i_i817_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx22_i_i820_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx22_i_i820_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx24_i_i823_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx24_i_i823_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx26_i_i826_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx26_i_i826_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx2_i_i795_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx2_i_i795_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx30_i_i871_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx30_i_i871_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx32_i_i834_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx32_i_i834_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx34_i_i837_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx34_i_i837_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx36_i_i840_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx36_i_i840_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx39_i_i843_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx39_i_i843_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx40_i_i845_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx40_i_i845_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx42_i_i848_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx42_i_i848_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx44_i_i851_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx44_i_i851_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx46_i_i854_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx46_i_i854_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx4_i_i797_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx4_i_i797_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx6_i_i799_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx6_i_i799_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_encoder_ethash_search_B1_merge_priority_encoder_workgroup_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_fpgaindvars_iv15_0 : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_fpgaindvars_iv15_1 : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_g_dag : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_g_output : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_global_id_0197_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_id_0197_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_isolate : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_08_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_08_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr13_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr13_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_r_0_i_ph_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_r_0_i_ph_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01001_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01001_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01003_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01003_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01005_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01005_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01007_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01007_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0987_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0987_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0989_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0989_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0991_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0991_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0993_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0993_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0995_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0995_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0997_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0997_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0999_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0999_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11000_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11000_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11002_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11002_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11004_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11004_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11006_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11006_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11008_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11008_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1988_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1988_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1990_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1990_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1992_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1992_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1994_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1994_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1996_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1996_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1998_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1998_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_target : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe19 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe20 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe21 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe22 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe23 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe25 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe26 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe27 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe28 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe29 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe3 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe30 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe31 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe32 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe33 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe34 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe35 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe36 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe37 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe38 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe39 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe4 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe40 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe41 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe42 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe43 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe44 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe45 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe46 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe47 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe48 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe49 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe5 : out std_logic_vector(5 downto 0);  -- Fixed Point
            out_c0_exe50 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe51 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_global_id_0197 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_08 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01001 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01003 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01005 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01007 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0987 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0989 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0991 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0993 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0995 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0997 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0999 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11000 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11002 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11004 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11006 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11008 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1988 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1990 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1992 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1994 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1996 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1998 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_search_B2 is
        port (
            in_c0_exe1107_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2111_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe3115_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe4119_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_g_dag : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_g_output : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_global_id_0196_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_07_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr12_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100166_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100376_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100586_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100796_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_014_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_098716_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_098918_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099120_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099326_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099536_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099746_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099956_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100061_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100271_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100481_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100691_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11008101_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_115_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_198817_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199019_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199221_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199431_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199641_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199851_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_target : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1107 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2111 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe3115 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe4119 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_global_id_0196 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_07 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0100166 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0100376 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0100586 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0100796 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_014 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_098716 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_098918 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099120 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099326 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099536 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099746 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099956 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100061 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100271 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100481 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100691 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11008101 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_115 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_198817 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_199019 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_199221 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_199431 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_199641 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_199851 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_state_0_0_cast : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_4_0_cast : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_5_0_cast : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_6_0_cast : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_7_0_cast : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_search_B5 is
        port (
            in_arrayidx36_2_RM164_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx45_RM162_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_barrier_unnamed_ethash_search36_wgs_workgroup_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_barrier_unnamed_ethash_search40_wgs_workgroup_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1104_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2109_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe3113_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe4117_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_cmp23156_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_cmp23_xor158_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_fpgaindvars_iv12135_0 : in std_logic_vector(3 downto 0);  -- Fixed Point
            in_g_dag : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_g_output : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_global_id_0193_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i18_0908153_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_idxprom80_RM167_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_l_grpid_04_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr10_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr_zext160_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_016_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_016_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_016_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_016_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_205_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memdep_205_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_205_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_205_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_scalarizer_0100163_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100373_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100583_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100793_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01173137_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01175141_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01177145_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01179149_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099323_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099533_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099743_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099953_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0xor1200168_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100058_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100268_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100478_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100688_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100898_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11174139_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11176143_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11178147_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11180151_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199428_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199638_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199848_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1xor1201169_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_2xor170_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_3xor171_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_state_0_0_cast121_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_4_0_cast124_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_5_0_cast127_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_6_0_cast130_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_7_0_cast133_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_target : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_1413 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_1414 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_1415 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_1416 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1104 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2109 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe3113 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe4117 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_fpgaindvars_iv_next13 : out std_logic_vector(3 downto 0);  -- Fixed Point
            out_global_id_0193 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_inc123 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_04 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr10 : out std_logic_vector(31 downto 0);  -- Fixed Point
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
            out_memdep_205_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_205_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_205_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_memdep_205_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_205_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_205_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_205_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_scalarizer_0100163 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0100373 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0100583 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0100793 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099323 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099533 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099743 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099953 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100058 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100268 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100478 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100688 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100898 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_199428 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_199638 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_199848 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_state_0_0_cast121 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_4_0_cast124 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_5_0_cast127 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_6_0_cast130 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_7_0_cast133 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_search_B6 is
        port (
            in_acl_1413178_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_1414179_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_1415176_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_1416177_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1103_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe1172_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe2173_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe3174_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe4175_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_g_output : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_global_id_0192_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_03_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100162_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100372_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100582_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100792_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099322_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099532_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099742_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099952_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100057_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100267_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100477_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100687_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100897_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199427_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199637_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199847_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_target : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1103 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_global_id_0192 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_03 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0100162 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0100372 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0100582 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0100792 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099322 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099532 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099742 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099952 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100057 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100267 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100477 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100687 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100897 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_199427 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_199637 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_199847 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_state_10_2_cast : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_11_2_cast : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_8_2_cast : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_9_2_cast : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_search_B7 is
        port (
            in_arrayidx12_i_i19695_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx12_i_i19695_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx14_i_i21752_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx14_i_i21752_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx16_i_i23701_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx16_i_i23701_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx22_i_i28756_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx22_i_i28756_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx24_i_i30712_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx24_i_i30712_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx26_i_i32715_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx26_i_i32715_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx2_i_i10684_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx2_i_i10684_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx30_i_i35720_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx30_i_i35720_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx32_i_i37723_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx32_i_i37723_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx34_i_i39726_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx34_i_i39726_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx36_i_i41729_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx36_i_i41729_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx40_i_i44734_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx40_i_i44734_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx42_i_i46737_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx42_i_i46737_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx44_i_i48740_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx44_i_i48740_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx46_i_i50743_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx46_i_i50743_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx4_i_i12686_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx4_i_i12686_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx6_i_i14688_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx6_i_i14688_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe1102_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe1102_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_fpgaindvars_iv_0 : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_fpgaindvars_iv_1 : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_g_output : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_global_id_0191_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_id_0191_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_02_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_02_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_r_0_i1_ph_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_r_0_i1_ph_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01218_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01218_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01220_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01220_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01222_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01222_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01224_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01224_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01226_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01226_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01228_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01228_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01230_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01230_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01232_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01232_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11219_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11219_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11221_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11221_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11223_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11223_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11225_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11225_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11227_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11227_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11229_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11229_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11231_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11231_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11233_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11233_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_state_10_2_cast185_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_10_2_cast185_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_11_2_cast187_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_11_2_cast187_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_8_2_cast181_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_8_2_cast181_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_9_2_cast183_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_9_2_cast183_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_target : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe10162 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1102 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe11163 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1153 : out std_logic_vector(5 downto 0);  -- Fixed Point
            out_c0_exe12164 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe13165 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe14166 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe15167 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe16168 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe17169 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe18170 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe19171 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe20172 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe21173 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe2154 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe22174 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe23175 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe24176 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe25177 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe26178 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe27179 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe28180 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe29181 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe30182 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe31183 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe3155 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe32184 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe33185 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe34186 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe35187 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe4156 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe5157 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe6158 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe7159 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe8160 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe9161 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_global_id_0191 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_02 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01232 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11233 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_state_10_2_cast185 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_11_2_cast187 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_8_2_cast181 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_9_2_cast183 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_search_B8 is
        port (
            in_call152_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_call152_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_call152_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_call152_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_g_output : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_global_id_0190_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_01_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01232188_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11233189_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_state_10_2_cast184_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_11_2_cast186_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_8_2_cast180_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_9_2_cast182_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_target : in std_logic_vector(63 downto 0);  -- Fixed Point
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
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_wgl_0_exit_exit_stall_out : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_wgl_0_exit_exit_valid_out : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_call152_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_call152_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_call152_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_call152_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_call152_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_call152_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_call152_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_lsu_call152_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_ethash_search61_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_ethash_search62_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_ethash_search63_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_ethash_search64_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_wgl_0_exit_exit_stall_in : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_wgl_0_exit_exit_valid_in : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component loop_limiter_ethash_search0 is
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


    component loop_limiter_ethash_search1 is
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


    component loop_limiter_ethash_search2 is
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


    component loop_limiter_ethash_search3 is
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


    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_0_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_1_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (2 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_2_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_3_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_19 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_20 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_21 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_22 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_23 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_24 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_25 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_26 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_27 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_28 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_29 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_30 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_31 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_32 : STD_LOGIC_VECTOR (3 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_33 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_34 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_35 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_36 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_37 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_38 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_39 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_40 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_41 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_42 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_43 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_44 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_45 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_46 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_47 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_48 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_49 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_50 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_0_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_1_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (2 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_2_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_3_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_19 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_20 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_21 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_22 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_23 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_24 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_25 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_26 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_27 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_28 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_29 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_30 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_31 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_32 : STD_LOGIC_VECTOR (3 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_33 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_34 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_35 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_36 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_37 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_38 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_39 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_40 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_41 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_42 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_43 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_44 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_45 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_46 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_47 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_48 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_49 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_50 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (5 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_19 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_20 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_21 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_22 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_23 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_24 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_25 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_26 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_27 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_28 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_29 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_30 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_31 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_32 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_33 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_34 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_35 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_36 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_37 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_38 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_39 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_40 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_41 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_42 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_43 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_44 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_45 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_46 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_47 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_48 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_49 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B1_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (5 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_19 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_20 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_21 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_22 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_23 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_24 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_25 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_26 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_27 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_28 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_29 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_30 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_31 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_32 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_33 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_34 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_35 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_36 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_37 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_38 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_39 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_40 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_41 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_42 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_43 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_44 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_45 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_46 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_47 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_48 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_49 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B1_sr_1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_19 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_20 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_21 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_22 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_23 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_24 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_25 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_26 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_27 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_28 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_29 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_30 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B2_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search27_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search27_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search27_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search27_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_and_RM : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_arraydecay51_RM : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_arrayidx36_2_RM : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_arrayidx45_RM : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_c0_exe1106 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_c0_exe2108 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_c0_exe3112 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_c0_exe4116 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_cmp23 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_cmp23_xor : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_fpgaindvars_iv12 : STD_LOGIC_VECTOR (3 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_global_id_0195 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_i18_0908 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_l_grpid_06 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_l_grpid_0_addr9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_l_grpid_0_addr_zext : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_memdep_198_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_memdep_198_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_memdep_198_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_memdep_198_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_memdep_198_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_memdep_198_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_memdep_198_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_memdep_199_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_memdep_199_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_memdep_199_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_memdep_199_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_memdep_199_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_memdep_199_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_memdep_199_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_memdep_200_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_memdep_200_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_memdep_200_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_memdep_200_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_memdep_200_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_memdep_200_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_memdep_200_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_memdep_203_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_memdep_203_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_memdep_203_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_memdep_203_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_memdep_203_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_memdep_203_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_memdep_203_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_memdep_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_memdep_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_memdep_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_memdep_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_memdep_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_memdep_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_memdep_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_scalarizer_0100165 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_scalarizer_0100375 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_scalarizer_0100585 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_scalarizer_0100795 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_scalarizer_01173 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_scalarizer_01175 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_scalarizer_01177 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_scalarizer_01179 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_scalarizer_099325 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_scalarizer_099535 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_scalarizer_099745 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_scalarizer_099955 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_scalarizer_1100060 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_scalarizer_1100270 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_scalarizer_1100480 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_scalarizer_1100690 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_scalarizer_11008100 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_scalarizer_11174 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_scalarizer_11176 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_scalarizer_11178 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_scalarizer_11180 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_scalarizer_199430 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_scalarizer_199640 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_scalarizer_199850 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_state_0_0_cast120 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_state_4_0_cast123 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_state_5_0_cast126 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_state_6_0_cast129 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_state_7_0_cast132 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search27_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search27_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search27_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search27_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search27_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search27_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search27_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search28 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search28_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search28_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search28_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search28_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search28_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search28_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search28_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_ethash_search_B3_vunroll_x_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (3 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_19 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_20 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_21 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_22 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_23 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_24 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_25 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_26 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_27 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_28 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_29 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_30 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_31 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_32 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_33 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_34 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_35 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_36 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_37 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (3 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_19 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_20 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_21 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_22 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_23 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_24 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_25 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_26 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_27 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_28 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_29 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_30 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_31 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_32 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_33 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_34 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_35 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_36 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_37 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_sr_1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_xor_i679_3_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_xor_i679_3_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_xor_i679_3_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_xor_i679_3_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_a_1907_LC_OuterPHI : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_and_RM155 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_arraydecay51_RM166 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_arrayidx36_2_RM165 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_arrayidx45_RM163 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_c0_exe1105 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_c0_exe2110 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_c0_exe3114 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_c0_exe4118 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_cmp23157 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_cmp23_xor159 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_fpgaindvars_iv12136 : STD_LOGIC_VECTOR (3 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_fpgaindvars_iv6_LC_InnerPHI : STD_LOGIC_VECTOR (2 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_fpgaindvars_iv9_LC_OuterPHI : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_global_id_0194 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_i18_0908154 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_i66_2906_LC_InnerPHI : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_idxprom80_RM : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_l_grpid_05 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_l_grpid_0_addr11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_l_grpid_0_addr_zext161 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_memdep_204_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_memdep_204_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_memdep_204_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_memdep_204_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_memdep_204_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_memdep_204_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_memdep_204_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_scalarizer_0100164 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_scalarizer_0100374 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_scalarizer_0100584 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_scalarizer_0100794 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_scalarizer_01173138 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_scalarizer_01175142 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_scalarizer_01177146 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_scalarizer_01179150 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_scalarizer_099324 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_scalarizer_099534 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_scalarizer_099744 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_scalarizer_099954 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_scalarizer_0xor1200 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_scalarizer_1100059 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_scalarizer_1100269 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_scalarizer_1100479 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_scalarizer_1100689 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_scalarizer_1100899 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_scalarizer_11174140 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_scalarizer_11176144 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_scalarizer_11178148 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_scalarizer_11180152 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_scalarizer_199429 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_scalarizer_199639 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_scalarizer_199849 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_scalarizer_1xor1201 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_scalarizer_2xor : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_scalarizer_3xor : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_state_0_0_cast122 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_state_4_0_cast125 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_state_5_0_cast128 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_state_6_0_cast131 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_state_7_0_cast134 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search32 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search34_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search34_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search34_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search34_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search34_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search34_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search34_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search35_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search35_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search35_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search35_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search35_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search35_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search35_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_vunroll_x_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_18 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_19 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_20 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_21 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_22 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_23 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_24 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_25 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_26 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_27 : STD_LOGIC_VECTOR (3 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_28 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_29 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_30 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_31 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_32 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_33 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_34 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_35 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_36 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_37 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_38 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_39 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_40 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_41 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_42 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_43 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_44 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_45 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_46 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_47 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B5_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_17 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_19 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_20 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_21 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_22 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_23 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_24 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_25 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_26 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B6_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (5 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_17 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_18 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_19 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_20 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_21 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_22 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_23 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_24 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_25 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_26 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_27 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_28 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_29 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_30 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_31 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_32 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_33 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_34 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_35 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_36 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_37 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_38 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_39 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_40 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_41 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B7_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (5 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_17 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_18 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_19 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_20 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_21 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_22 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_23 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_24 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_25 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_26 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_27 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_28 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_29 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_30 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_31 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_32 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_33 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_34 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_35 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_36 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_37 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_38 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_39 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_40 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_41 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B7_sr_1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B8_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B8_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B8_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B8_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B8_sr_0_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B8_sr_0_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B8_sr_0_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B8_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_c_i32_0gr_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_c_i64_0gr_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_0_c_i64_1gr_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_0_c_i64_9223372036854775808_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_0_c_i6_23_x_q : STD_LOGIC_VECTOR (5 downto 0);
    signal bb_ethash_search_B0_out_acl_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B0_out_acl_0979 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B0_out_acl_0981 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B0_out_acl_0983 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B0_out_acl_0985 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B0_out_acl_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B0_out_acl_1980 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B0_out_acl_1982 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B0_out_acl_1984 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B0_out_acl_1986 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B0_out_add : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B0_out_global_id_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B0_out_l_grpid_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B0_out_l_grpid_0_addr : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B0_out_memcoalesce_g_header_load_0_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal bb_ethash_search_B0_out_memcoalesce_g_header_load_0_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B0_out_memcoalesce_g_header_load_0_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B0_out_memcoalesce_g_header_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B0_out_memcoalesce_g_header_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B0_out_memcoalesce_g_header_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B0_out_memcoalesce_g_header_load_0_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal bb_ethash_search_B0_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B0_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B0_out_wgl_0_enter_exit_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B0_out_wgl_0_enter_exit_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B1_out_c0_exe1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B1_out_c0_exe10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_c0_exe11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_c0_exe12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_c0_exe13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_c0_exe14 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_c0_exe15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_c0_exe16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_c0_exe17 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_c0_exe18 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_c0_exe19 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_c0_exe2 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_out_c0_exe20 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_c0_exe21 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_c0_exe22 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_c0_exe23 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_c0_exe24 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_c0_exe25 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_c0_exe26 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_c0_exe27 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_c0_exe28 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_c0_exe29 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_c0_exe3 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_out_c0_exe30 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_out_c0_exe31 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_out_c0_exe32 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_out_c0_exe33 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_out_c0_exe34 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_out_c0_exe35 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_out_c0_exe36 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_out_c0_exe37 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_out_c0_exe38 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_out_c0_exe39 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_out_c0_exe4 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_out_c0_exe40 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_out_c0_exe41 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_out_c0_exe42 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_out_c0_exe43 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_out_c0_exe44 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_out_c0_exe45 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_out_c0_exe46 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_out_c0_exe47 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_out_c0_exe48 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_out_c0_exe49 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_out_c0_exe5 : STD_LOGIC_VECTOR (5 downto 0);
    signal bb_ethash_search_B1_out_c0_exe50 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B1_out_c0_exe51 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_c0_exe6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_c0_exe7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_c0_exe8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_c0_exe9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_global_id_0197 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_l_grpid_08 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_l_grpid_0_addr13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_scalarizer_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_scalarizer_01001 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_scalarizer_01003 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_scalarizer_01005 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_scalarizer_01007 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_scalarizer_0987 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_scalarizer_0989 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_scalarizer_0991 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_scalarizer_0993 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_scalarizer_0995 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_scalarizer_0997 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_scalarizer_0999 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_scalarizer_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_scalarizer_11000 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_scalarizer_11002 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_scalarizer_11004 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_scalarizer_11006 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_scalarizer_11008 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_scalarizer_1988 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_scalarizer_1990 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_scalarizer_1992 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_scalarizer_1994 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_scalarizer_1996 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_scalarizer_1998 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B1_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B1_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B1_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B1_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B2_out_c0_exe1107 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B2_out_c0_exe2111 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B2_out_c0_exe3115 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B2_out_c0_exe4119 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B2_out_global_id_0196 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_out_l_grpid_07 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_out_l_grpid_0_addr12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_out_scalarizer_0100166 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_out_scalarizer_0100376 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_out_scalarizer_0100586 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_out_scalarizer_0100796 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_out_scalarizer_014 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_out_scalarizer_098716 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_out_scalarizer_098918 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_out_scalarizer_099120 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_out_scalarizer_099326 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_out_scalarizer_099536 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_out_scalarizer_099746 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_out_scalarizer_099956 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_out_scalarizer_1100061 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_out_scalarizer_1100271 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_out_scalarizer_1100481 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_out_scalarizer_1100691 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_out_scalarizer_11008101 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_out_scalarizer_115 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_out_scalarizer_198817 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_out_scalarizer_199019 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_out_scalarizer_199221 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_out_scalarizer_199431 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_out_scalarizer_199641 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_out_scalarizer_199851 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B2_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B2_out_state_0_0_cast : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B2_out_state_4_0_cast : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B2_out_state_5_0_cast : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B2_out_state_6_0_cast : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B2_out_state_7_0_cast : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B2_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B5_out_acl_1413 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_out_acl_1414 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_out_acl_1415 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_out_acl_1416 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_out_c0_exe1104 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B5_out_c0_exe2109 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B5_out_c0_exe3113 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B5_out_c0_exe4117 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B5_out_c1_exe1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_out_c1_exe2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_out_c1_exe3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_out_c1_exe4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_out_fpgaindvars_iv_next13 : STD_LOGIC_VECTOR (3 downto 0);
    signal bb_ethash_search_B5_out_global_id_0193 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_out_inc123 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_out_l_grpid_04 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_out_l_grpid_0_addr10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_out_memcoalesce_null_load_016_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_out_memcoalesce_null_load_016_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B5_out_memcoalesce_null_load_016_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_ethash_search_B5_out_memcoalesce_null_load_016_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B5_out_memcoalesce_null_load_016_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B5_out_memcoalesce_null_load_016_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B5_out_memcoalesce_null_load_016_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_ethash_search_B5_out_memcoalesce_null_load_0_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_out_memcoalesce_null_load_0_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B5_out_memcoalesce_null_load_0_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_ethash_search_B5_out_memcoalesce_null_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B5_out_memcoalesce_null_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B5_out_memcoalesce_null_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B5_out_memcoalesce_null_load_0_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_ethash_search_B5_out_memdep_205_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_out_memdep_205_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B5_out_memdep_205_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_ethash_search_B5_out_memdep_205_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B5_out_memdep_205_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B5_out_memdep_205_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B5_out_memdep_205_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_ethash_search_B5_out_scalarizer_0100163 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_out_scalarizer_0100373 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_out_scalarizer_0100583 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_out_scalarizer_0100793 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_out_scalarizer_099323 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_out_scalarizer_099533 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_out_scalarizer_099743 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_out_scalarizer_099953 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_out_scalarizer_1100058 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_out_scalarizer_1100268 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_out_scalarizer_1100478 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_out_scalarizer_1100688 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_out_scalarizer_1100898 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_out_scalarizer_199428 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_out_scalarizer_199638 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_out_scalarizer_199848 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B5_out_state_0_0_cast121 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B5_out_state_4_0_cast124 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B5_out_state_5_0_cast127 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B5_out_state_6_0_cast130 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B5_out_state_7_0_cast133 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B5_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B5_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B6_out_c0_exe1103 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B6_out_global_id_0192 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_out_l_grpid_03 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_out_scalarizer_0100162 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_out_scalarizer_0100372 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_out_scalarizer_0100582 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_out_scalarizer_0100792 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_out_scalarizer_099322 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_out_scalarizer_099532 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_out_scalarizer_099742 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_out_scalarizer_099952 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_out_scalarizer_1100057 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_out_scalarizer_1100267 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_out_scalarizer_1100477 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_out_scalarizer_1100687 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_out_scalarizer_1100897 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_out_scalarizer_199427 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_out_scalarizer_199637 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_out_scalarizer_199847 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B6_out_state_10_2_cast : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B6_out_state_11_2_cast : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B6_out_state_8_2_cast : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B6_out_state_9_2_cast : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B6_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B7_out_c0_exe10162 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_out_c0_exe1102 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B7_out_c0_exe11163 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_out_c0_exe1153 : STD_LOGIC_VECTOR (5 downto 0);
    signal bb_ethash_search_B7_out_c0_exe12164 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_out_c0_exe13165 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_out_c0_exe14166 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_out_c0_exe15167 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_out_c0_exe16168 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_out_c0_exe17169 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_out_c0_exe18170 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_out_c0_exe19171 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_out_c0_exe20172 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_out_c0_exe21173 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_out_c0_exe2154 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_out_c0_exe22174 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_out_c0_exe23175 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_out_c0_exe24176 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_out_c0_exe25177 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_out_c0_exe26178 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_out_c0_exe27179 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_out_c0_exe28180 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_out_c0_exe29181 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_out_c0_exe30182 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_out_c0_exe31183 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_out_c0_exe3155 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_out_c0_exe32184 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_out_c0_exe33185 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_out_c0_exe34186 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_out_c0_exe35187 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_out_c0_exe4156 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_out_c0_exe5157 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_out_c0_exe6158 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_out_c0_exe7159 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_out_c0_exe8160 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_out_c0_exe9161 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_out_global_id_0191 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_out_l_grpid_02 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_out_scalarizer_01232 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_out_scalarizer_11233 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B7_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B7_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B7_out_state_10_2_cast185 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_out_state_11_2_cast187 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_out_state_8_2_cast181 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_out_state_9_2_cast183 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B7_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B7_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_out_call152_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal bb_ethash_search_B8_out_call152_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_ethash_search_B8_out_call152_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B8_out_call152_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_out_call152_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_out_call152_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_out_call152_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal bb_ethash_search_B8_out_lsu_call152_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_out_lsu_unnamed_ethash_search61_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_out_lsu_unnamed_ethash_search62_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_out_lsu_unnamed_ethash_search63_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_out_lsu_unnamed_ethash_search64_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_out_unnamed_ethash_search61_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal bb_ethash_search_B8_out_unnamed_ethash_search61_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_ethash_search_B8_out_unnamed_ethash_search61_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B8_out_unnamed_ethash_search61_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_out_unnamed_ethash_search61_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_out_unnamed_ethash_search61_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_out_unnamed_ethash_search61_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal bb_ethash_search_B8_out_unnamed_ethash_search62_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal bb_ethash_search_B8_out_unnamed_ethash_search62_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_ethash_search_B8_out_unnamed_ethash_search62_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B8_out_unnamed_ethash_search62_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_out_unnamed_ethash_search62_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_out_unnamed_ethash_search62_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_out_unnamed_ethash_search62_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal bb_ethash_search_B8_out_unnamed_ethash_search63_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal bb_ethash_search_B8_out_unnamed_ethash_search63_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_ethash_search_B8_out_unnamed_ethash_search63_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B8_out_unnamed_ethash_search63_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_out_unnamed_ethash_search63_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_out_unnamed_ethash_search63_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_out_unnamed_ethash_search63_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal bb_ethash_search_B8_out_unnamed_ethash_search64_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal bb_ethash_search_B8_out_unnamed_ethash_search64_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_ethash_search_B8_out_unnamed_ethash_search64_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B8_out_unnamed_ethash_search64_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_out_unnamed_ethash_search64_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_out_unnamed_ethash_search64_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_out_unnamed_ethash_search64_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal bb_ethash_search_B8_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_out_wgl_0_exit_exit_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_out_wgl_0_exit_exit_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_2147483648_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i3_2gr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal c_i4_6gr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal c_i5_14_q : STD_LOGIC_VECTOR (4 downto 0);
    signal loop_limiter_ethash_search0_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_ethash_search0_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_ethash_search1_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_ethash_search1_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_ethash_search2_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_ethash_search2_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_ethash_search3_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_ethash_search3_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- bb_ethash_search_B1_sr_0_aunroll_x(BLACKBOX,4)
    thebb_ethash_search_B1_sr_0_aunroll_x : bb_ethash_search_B1_sr_0
    PORT MAP (
        in_i_data_0 => bb_ethash_search_B1_out_c0_exe5,
        in_i_data_1 => bb_ethash_search_B1_out_c0_exe6,
        in_i_data_2 => bb_ethash_search_B1_out_c0_exe7,
        in_i_data_3 => bb_ethash_search_B1_out_c0_exe8,
        in_i_data_4 => bb_ethash_search_B1_out_c0_exe9,
        in_i_data_5 => bb_ethash_search_B1_out_c0_exe10,
        in_i_data_6 => bb_ethash_search_B1_out_c0_exe11,
        in_i_data_7 => bb_ethash_search_B1_out_c0_exe12,
        in_i_data_8 => bb_ethash_search_B1_out_c0_exe13,
        in_i_data_9 => bb_ethash_search_B1_out_c0_exe14,
        in_i_data_10 => bb_ethash_search_B1_out_c0_exe15,
        in_i_data_11 => bb_ethash_search_B1_out_c0_exe16,
        in_i_data_12 => bb_ethash_search_B1_out_c0_exe17,
        in_i_data_13 => bb_ethash_search_B1_out_c0_exe18,
        in_i_data_14 => bb_ethash_search_B1_out_c0_exe19,
        in_i_data_15 => bb_ethash_search_B1_out_c0_exe20,
        in_i_data_16 => bb_ethash_search_B1_out_c0_exe21,
        in_i_data_17 => bb_ethash_search_B1_out_c0_exe22,
        in_i_data_18 => bb_ethash_search_B1_out_c0_exe23,
        in_i_data_19 => bb_ethash_search_B1_out_c0_exe24,
        in_i_data_20 => bb_ethash_search_B1_out_c0_exe25,
        in_i_data_21 => bb_ethash_search_B1_out_c0_exe26,
        in_i_data_22 => bb_ethash_search_B1_out_c0_exe27,
        in_i_data_23 => bb_ethash_search_B1_out_c0_exe28,
        in_i_data_24 => bb_ethash_search_B1_out_c0_exe29,
        in_i_data_25 => bb_ethash_search_B1_out_c0_exe30,
        in_i_data_26 => bb_ethash_search_B1_out_c0_exe31,
        in_i_data_27 => bb_ethash_search_B1_out_c0_exe32,
        in_i_data_28 => bb_ethash_search_B1_out_c0_exe33,
        in_i_data_29 => bb_ethash_search_B1_out_c0_exe34,
        in_i_data_30 => bb_ethash_search_B1_out_c0_exe35,
        in_i_data_31 => bb_ethash_search_B1_out_c0_exe36,
        in_i_data_32 => bb_ethash_search_B1_out_c0_exe37,
        in_i_data_33 => bb_ethash_search_B1_out_c0_exe38,
        in_i_data_34 => bb_ethash_search_B1_out_c0_exe39,
        in_i_data_35 => bb_ethash_search_B1_out_c0_exe40,
        in_i_data_36 => bb_ethash_search_B1_out_c0_exe41,
        in_i_data_37 => bb_ethash_search_B1_out_c0_exe42,
        in_i_data_38 => bb_ethash_search_B1_out_c0_exe43,
        in_i_data_39 => bb_ethash_search_B1_out_c0_exe44,
        in_i_data_40 => bb_ethash_search_B1_out_c0_exe45,
        in_i_data_41 => bb_ethash_search_B1_out_c0_exe46,
        in_i_data_42 => bb_ethash_search_B1_out_c0_exe47,
        in_i_data_43 => bb_ethash_search_B1_out_c0_exe48,
        in_i_data_44 => bb_ethash_search_B1_out_c0_exe49,
        in_i_data_45 => bb_ethash_search_B1_out_c0_exe50,
        in_i_data_46 => bb_ethash_search_B1_out_c0_exe51,
        in_i_data_47 => bb_ethash_search_B1_out_l_grpid_08,
        in_i_data_48 => bb_ethash_search_B1_out_l_grpid_0_addr13,
        in_i_data_49 => bb_ethash_search_B1_out_global_id_0197,
        in_i_stall => bb_ethash_search_B1_out_stall_out_0,
        in_i_valid => bb_ethash_search_B1_out_valid_out_0,
        out_o_data_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_9,
        out_o_data_10 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_10,
        out_o_data_11 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_11,
        out_o_data_12 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_12,
        out_o_data_13 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_13,
        out_o_data_14 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_14,
        out_o_data_15 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_15,
        out_o_data_16 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_16,
        out_o_data_17 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_17,
        out_o_data_18 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_18,
        out_o_data_19 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_19,
        out_o_data_20 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_20,
        out_o_data_21 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_21,
        out_o_data_22 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_22,
        out_o_data_23 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_23,
        out_o_data_24 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_24,
        out_o_data_25 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_25,
        out_o_data_26 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_26,
        out_o_data_27 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_27,
        out_o_data_28 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_28,
        out_o_data_29 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_29,
        out_o_data_30 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_30,
        out_o_data_31 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_31,
        out_o_data_32 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_32,
        out_o_data_33 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_33,
        out_o_data_34 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_34,
        out_o_data_35 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_35,
        out_o_data_36 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_36,
        out_o_data_37 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_37,
        out_o_data_38 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_38,
        out_o_data_39 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_39,
        out_o_data_40 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_40,
        out_o_data_41 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_41,
        out_o_data_42 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_42,
        out_o_data_43 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_43,
        out_o_data_44 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_44,
        out_o_data_45 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_45,
        out_o_data_46 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_46,
        out_o_data_47 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_47,
        out_o_data_48 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_48,
        out_o_data_49 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_49,
        out_o_stall => bb_ethash_search_B1_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_ethash_search_B1_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_search_B1(BLACKBOX,64)
    thebb_ethash_search_B1 : bb_ethash_search_B1
    PORT MAP (
        in_arrayidx10_i_i803_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_40,
        in_arrayidx10_i_i803_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_40,
        in_arrayidx12_i_i806_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_39,
        in_arrayidx12_i_i806_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_39,
        in_arrayidx14_i_i809_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_38,
        in_arrayidx14_i_i809_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_38,
        in_arrayidx16_i_i812_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_37,
        in_arrayidx16_i_i812_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_37,
        in_arrayidx1_i_i856_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_45,
        in_arrayidx1_i_i856_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_45,
        in_arrayidx20_i_i817_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_36,
        in_arrayidx20_i_i817_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_36,
        in_arrayidx22_i_i820_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_35,
        in_arrayidx22_i_i820_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_35,
        in_arrayidx24_i_i823_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_34,
        in_arrayidx24_i_i823_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_34,
        in_arrayidx26_i_i826_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_33,
        in_arrayidx26_i_i826_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_33,
        in_arrayidx2_i_i795_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_43,
        in_arrayidx2_i_i795_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_43,
        in_arrayidx30_i_i871_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_44,
        in_arrayidx30_i_i871_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_44,
        in_arrayidx32_i_i834_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_32,
        in_arrayidx32_i_i834_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_32,
        in_arrayidx34_i_i837_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_31,
        in_arrayidx34_i_i837_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_31,
        in_arrayidx36_i_i840_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_30,
        in_arrayidx36_i_i840_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_30,
        in_arrayidx39_i_i843_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_29,
        in_arrayidx39_i_i843_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_29,
        in_arrayidx40_i_i845_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_28,
        in_arrayidx40_i_i845_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_28,
        in_arrayidx42_i_i848_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_27,
        in_arrayidx42_i_i848_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_27,
        in_arrayidx44_i_i851_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_26,
        in_arrayidx44_i_i851_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_26,
        in_arrayidx46_i_i854_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_25,
        in_arrayidx46_i_i854_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_25,
        in_arrayidx4_i_i797_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_42,
        in_arrayidx4_i_i797_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_42,
        in_arrayidx6_i_i799_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_41,
        in_arrayidx6_i_i799_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_41,
        in_encoder_ethash_search_B1_merge_priority_encoder_workgroup_size => in_workgroup_size,
        in_fpgaindvars_iv15_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_0,
        in_fpgaindvars_iv15_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_0,
        in_g_dag => in_arg_g_dag,
        in_g_output => in_arg_g_output,
        in_global_id_0197_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_49,
        in_global_id_0197_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_49,
        in_isolate => in_arg_isolate,
        in_l_grpid_08_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_47,
        in_l_grpid_08_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_47,
        in_l_grpid_0_addr13_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_48,
        in_l_grpid_0_addr13_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_48,
        in_r_0_i_ph_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_46,
        in_r_0_i_ph_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_46,
        in_scalarizer_01001_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_17,
        in_scalarizer_01001_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_17,
        in_scalarizer_01003_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_19,
        in_scalarizer_01003_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_19,
        in_scalarizer_01005_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_21,
        in_scalarizer_01005_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_21,
        in_scalarizer_01007_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_23,
        in_scalarizer_01007_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_23,
        in_scalarizer_0987_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_3,
        in_scalarizer_0987_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_3,
        in_scalarizer_0989_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_5,
        in_scalarizer_0989_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_5,
        in_scalarizer_0991_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_7,
        in_scalarizer_0991_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_7,
        in_scalarizer_0993_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_9,
        in_scalarizer_0993_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_9,
        in_scalarizer_0995_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_11,
        in_scalarizer_0995_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_11,
        in_scalarizer_0997_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_13,
        in_scalarizer_0997_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_13,
        in_scalarizer_0999_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_15,
        in_scalarizer_0999_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_15,
        in_scalarizer_0_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_1,
        in_scalarizer_0_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_1,
        in_scalarizer_11000_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_16,
        in_scalarizer_11000_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_16,
        in_scalarizer_11002_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_18,
        in_scalarizer_11002_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_18,
        in_scalarizer_11004_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_20,
        in_scalarizer_11004_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_20,
        in_scalarizer_11006_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_22,
        in_scalarizer_11006_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_22,
        in_scalarizer_11008_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_24,
        in_scalarizer_11008_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_24,
        in_scalarizer_1988_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_4,
        in_scalarizer_1988_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_4,
        in_scalarizer_1990_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_6,
        in_scalarizer_1990_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_6,
        in_scalarizer_1992_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_8,
        in_scalarizer_1992_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_8,
        in_scalarizer_1994_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_10,
        in_scalarizer_1994_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_10,
        in_scalarizer_1996_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_12,
        in_scalarizer_1996_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_12,
        in_scalarizer_1998_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_14,
        in_scalarizer_1998_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_14,
        in_scalarizer_1_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_data_2,
        in_scalarizer_1_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_2,
        in_stall_in_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_stall,
        in_stall_in_1 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_stall,
        in_target => in_arg_target,
        in_valid_in_0 => bb_ethash_search_B1_sr_0_aunroll_x_out_o_valid,
        in_valid_in_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_valid,
        out_c0_exe1 => bb_ethash_search_B1_out_c0_exe1,
        out_c0_exe10 => bb_ethash_search_B1_out_c0_exe10,
        out_c0_exe11 => bb_ethash_search_B1_out_c0_exe11,
        out_c0_exe12 => bb_ethash_search_B1_out_c0_exe12,
        out_c0_exe13 => bb_ethash_search_B1_out_c0_exe13,
        out_c0_exe14 => bb_ethash_search_B1_out_c0_exe14,
        out_c0_exe15 => bb_ethash_search_B1_out_c0_exe15,
        out_c0_exe16 => bb_ethash_search_B1_out_c0_exe16,
        out_c0_exe17 => bb_ethash_search_B1_out_c0_exe17,
        out_c0_exe18 => bb_ethash_search_B1_out_c0_exe18,
        out_c0_exe19 => bb_ethash_search_B1_out_c0_exe19,
        out_c0_exe2 => bb_ethash_search_B1_out_c0_exe2,
        out_c0_exe20 => bb_ethash_search_B1_out_c0_exe20,
        out_c0_exe21 => bb_ethash_search_B1_out_c0_exe21,
        out_c0_exe22 => bb_ethash_search_B1_out_c0_exe22,
        out_c0_exe23 => bb_ethash_search_B1_out_c0_exe23,
        out_c0_exe24 => bb_ethash_search_B1_out_c0_exe24,
        out_c0_exe25 => bb_ethash_search_B1_out_c0_exe25,
        out_c0_exe26 => bb_ethash_search_B1_out_c0_exe26,
        out_c0_exe27 => bb_ethash_search_B1_out_c0_exe27,
        out_c0_exe28 => bb_ethash_search_B1_out_c0_exe28,
        out_c0_exe29 => bb_ethash_search_B1_out_c0_exe29,
        out_c0_exe3 => bb_ethash_search_B1_out_c0_exe3,
        out_c0_exe30 => bb_ethash_search_B1_out_c0_exe30,
        out_c0_exe31 => bb_ethash_search_B1_out_c0_exe31,
        out_c0_exe32 => bb_ethash_search_B1_out_c0_exe32,
        out_c0_exe33 => bb_ethash_search_B1_out_c0_exe33,
        out_c0_exe34 => bb_ethash_search_B1_out_c0_exe34,
        out_c0_exe35 => bb_ethash_search_B1_out_c0_exe35,
        out_c0_exe36 => bb_ethash_search_B1_out_c0_exe36,
        out_c0_exe37 => bb_ethash_search_B1_out_c0_exe37,
        out_c0_exe38 => bb_ethash_search_B1_out_c0_exe38,
        out_c0_exe39 => bb_ethash_search_B1_out_c0_exe39,
        out_c0_exe4 => bb_ethash_search_B1_out_c0_exe4,
        out_c0_exe40 => bb_ethash_search_B1_out_c0_exe40,
        out_c0_exe41 => bb_ethash_search_B1_out_c0_exe41,
        out_c0_exe42 => bb_ethash_search_B1_out_c0_exe42,
        out_c0_exe43 => bb_ethash_search_B1_out_c0_exe43,
        out_c0_exe44 => bb_ethash_search_B1_out_c0_exe44,
        out_c0_exe45 => bb_ethash_search_B1_out_c0_exe45,
        out_c0_exe46 => bb_ethash_search_B1_out_c0_exe46,
        out_c0_exe47 => bb_ethash_search_B1_out_c0_exe47,
        out_c0_exe48 => bb_ethash_search_B1_out_c0_exe48,
        out_c0_exe49 => bb_ethash_search_B1_out_c0_exe49,
        out_c0_exe5 => bb_ethash_search_B1_out_c0_exe5,
        out_c0_exe50 => bb_ethash_search_B1_out_c0_exe50,
        out_c0_exe51 => bb_ethash_search_B1_out_c0_exe51,
        out_c0_exe6 => bb_ethash_search_B1_out_c0_exe6,
        out_c0_exe7 => bb_ethash_search_B1_out_c0_exe7,
        out_c0_exe8 => bb_ethash_search_B1_out_c0_exe8,
        out_c0_exe9 => bb_ethash_search_B1_out_c0_exe9,
        out_global_id_0197 => bb_ethash_search_B1_out_global_id_0197,
        out_l_grpid_08 => bb_ethash_search_B1_out_l_grpid_08,
        out_l_grpid_0_addr13 => bb_ethash_search_B1_out_l_grpid_0_addr13,
        out_scalarizer_0 => bb_ethash_search_B1_out_scalarizer_0,
        out_scalarizer_01001 => bb_ethash_search_B1_out_scalarizer_01001,
        out_scalarizer_01003 => bb_ethash_search_B1_out_scalarizer_01003,
        out_scalarizer_01005 => bb_ethash_search_B1_out_scalarizer_01005,
        out_scalarizer_01007 => bb_ethash_search_B1_out_scalarizer_01007,
        out_scalarizer_0987 => bb_ethash_search_B1_out_scalarizer_0987,
        out_scalarizer_0989 => bb_ethash_search_B1_out_scalarizer_0989,
        out_scalarizer_0991 => bb_ethash_search_B1_out_scalarizer_0991,
        out_scalarizer_0993 => bb_ethash_search_B1_out_scalarizer_0993,
        out_scalarizer_0995 => bb_ethash_search_B1_out_scalarizer_0995,
        out_scalarizer_0997 => bb_ethash_search_B1_out_scalarizer_0997,
        out_scalarizer_0999 => bb_ethash_search_B1_out_scalarizer_0999,
        out_scalarizer_1 => bb_ethash_search_B1_out_scalarizer_1,
        out_scalarizer_11000 => bb_ethash_search_B1_out_scalarizer_11000,
        out_scalarizer_11002 => bb_ethash_search_B1_out_scalarizer_11002,
        out_scalarizer_11004 => bb_ethash_search_B1_out_scalarizer_11004,
        out_scalarizer_11006 => bb_ethash_search_B1_out_scalarizer_11006,
        out_scalarizer_11008 => bb_ethash_search_B1_out_scalarizer_11008,
        out_scalarizer_1988 => bb_ethash_search_B1_out_scalarizer_1988,
        out_scalarizer_1990 => bb_ethash_search_B1_out_scalarizer_1990,
        out_scalarizer_1992 => bb_ethash_search_B1_out_scalarizer_1992,
        out_scalarizer_1994 => bb_ethash_search_B1_out_scalarizer_1994,
        out_scalarizer_1996 => bb_ethash_search_B1_out_scalarizer_1996,
        out_scalarizer_1998 => bb_ethash_search_B1_out_scalarizer_1998,
        out_stall_out_0 => bb_ethash_search_B1_out_stall_out_0,
        out_stall_out_1 => bb_ethash_search_B1_out_stall_out_1,
        out_valid_out_0 => bb_ethash_search_B1_out_valid_out_0,
        out_valid_out_1 => bb_ethash_search_B1_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_search_B4_sr_0_aunroll_vunroll_x(BLACKBOX,2)
    thebb_ethash_search_B4_sr_0_aunroll_vunroll_x : bb_ethash_search_B4_sr_0
    PORT MAP (
        in_i_data_0 => bb_ethash_search_B4_vunroll_x_out_fpgaindvars_iv9_LC_OuterPHI,
        in_i_data_0_3 => bb_ethash_search_B4_vunroll_x_out_xor_i679_3_0,
        in_i_data_1 => bb_ethash_search_B4_vunroll_x_out_a_1907_LC_OuterPHI,
        in_i_data_1_3 => bb_ethash_search_B4_vunroll_x_out_xor_i679_3_1,
        in_i_data_2 => bb_ethash_search_B4_vunroll_x_out_fpgaindvars_iv6_LC_InnerPHI,
        in_i_data_2_3 => bb_ethash_search_B4_vunroll_x_out_xor_i679_3_2,
        in_i_data_3_3 => bb_ethash_search_B4_vunroll_x_out_xor_i679_3_3,
        in_i_data_4 => bb_ethash_search_B4_vunroll_x_out_i66_2906_LC_InnerPHI,
        in_i_data_5 => bb_ethash_search_B4_vunroll_x_out_l_grpid_05,
        in_i_data_6 => bb_ethash_search_B4_vunroll_x_out_l_grpid_0_addr11,
        in_i_data_7 => bb_ethash_search_B4_vunroll_x_out_scalarizer_099324,
        in_i_data_8 => bb_ethash_search_B4_vunroll_x_out_scalarizer_199429,
        in_i_data_9 => bb_ethash_search_B4_vunroll_x_out_scalarizer_099534,
        in_i_data_10 => bb_ethash_search_B4_vunroll_x_out_scalarizer_199639,
        in_i_data_11 => bb_ethash_search_B4_vunroll_x_out_scalarizer_099744,
        in_i_data_12 => bb_ethash_search_B4_vunroll_x_out_scalarizer_199849,
        in_i_data_13 => bb_ethash_search_B4_vunroll_x_out_scalarizer_099954,
        in_i_data_14 => bb_ethash_search_B4_vunroll_x_out_scalarizer_1100059,
        in_i_data_15 => bb_ethash_search_B4_vunroll_x_out_scalarizer_0100164,
        in_i_data_16 => bb_ethash_search_B4_vunroll_x_out_scalarizer_1100269,
        in_i_data_17 => bb_ethash_search_B4_vunroll_x_out_scalarizer_0100374,
        in_i_data_18 => bb_ethash_search_B4_vunroll_x_out_scalarizer_1100479,
        in_i_data_19 => bb_ethash_search_B4_vunroll_x_out_scalarizer_0100584,
        in_i_data_20 => bb_ethash_search_B4_vunroll_x_out_scalarizer_1100689,
        in_i_data_21 => bb_ethash_search_B4_vunroll_x_out_scalarizer_0100794,
        in_i_data_22 => bb_ethash_search_B4_vunroll_x_out_scalarizer_1100899,
        in_i_data_23 => bb_ethash_search_B4_vunroll_x_out_c0_exe1105,
        in_i_data_24 => bb_ethash_search_B4_vunroll_x_out_c0_exe2110,
        in_i_data_25 => bb_ethash_search_B4_vunroll_x_out_c0_exe3114,
        in_i_data_26 => bb_ethash_search_B4_vunroll_x_out_c0_exe4118,
        in_i_data_27 => bb_ethash_search_B4_vunroll_x_out_state_0_0_cast122,
        in_i_data_28 => bb_ethash_search_B4_vunroll_x_out_state_4_0_cast125,
        in_i_data_29 => bb_ethash_search_B4_vunroll_x_out_state_5_0_cast128,
        in_i_data_30 => bb_ethash_search_B4_vunroll_x_out_state_6_0_cast131,
        in_i_data_31 => bb_ethash_search_B4_vunroll_x_out_state_7_0_cast134,
        in_i_data_32 => bb_ethash_search_B4_vunroll_x_out_fpgaindvars_iv12136,
        in_i_data_33 => bb_ethash_search_B4_vunroll_x_out_scalarizer_01173138,
        in_i_data_34 => bb_ethash_search_B4_vunroll_x_out_scalarizer_11174140,
        in_i_data_35 => bb_ethash_search_B4_vunroll_x_out_scalarizer_01175142,
        in_i_data_36 => bb_ethash_search_B4_vunroll_x_out_scalarizer_11176144,
        in_i_data_37 => bb_ethash_search_B4_vunroll_x_out_scalarizer_01177146,
        in_i_data_38 => bb_ethash_search_B4_vunroll_x_out_scalarizer_11178148,
        in_i_data_39 => bb_ethash_search_B4_vunroll_x_out_scalarizer_01179150,
        in_i_data_40 => bb_ethash_search_B4_vunroll_x_out_scalarizer_11180152,
        in_i_data_41 => bb_ethash_search_B4_vunroll_x_out_i18_0908154,
        in_i_data_42 => bb_ethash_search_B4_vunroll_x_out_and_RM155,
        in_i_data_43 => bb_ethash_search_B4_vunroll_x_out_cmp23157,
        in_i_data_44 => bb_ethash_search_B4_vunroll_x_out_cmp23_xor159,
        in_i_data_45 => bb_ethash_search_B4_vunroll_x_out_l_grpid_0_addr_zext161,
        in_i_data_46 => bb_ethash_search_B4_vunroll_x_out_arrayidx45_RM163,
        in_i_data_47 => bb_ethash_search_B4_vunroll_x_out_arrayidx36_2_RM165,
        in_i_data_48 => bb_ethash_search_B4_vunroll_x_out_arraydecay51_RM166,
        in_i_data_49 => bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search32,
        in_i_data_50 => bb_ethash_search_B4_vunroll_x_out_global_id_0194,
        in_i_stall => bb_ethash_search_B4_vunroll_x_out_stall_out_0,
        in_i_valid => bb_ethash_search_B4_vunroll_x_out_valid_out_0,
        out_o_data_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_0,
        out_o_data_0_3 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_0_3,
        out_o_data_1 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_1,
        out_o_data_1_3 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_1_3,
        out_o_data_2 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_2,
        out_o_data_2_3 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_2_3,
        out_o_data_3_3 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_3_3,
        out_o_data_4 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_4,
        out_o_data_5 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_5,
        out_o_data_6 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_6,
        out_o_data_7 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_7,
        out_o_data_8 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_8,
        out_o_data_9 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_9,
        out_o_data_10 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_10,
        out_o_data_11 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_11,
        out_o_data_12 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_12,
        out_o_data_13 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_13,
        out_o_data_14 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_14,
        out_o_data_15 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_15,
        out_o_data_16 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_16,
        out_o_data_17 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_17,
        out_o_data_18 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_18,
        out_o_data_19 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_19,
        out_o_data_20 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_20,
        out_o_data_21 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_21,
        out_o_data_22 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_22,
        out_o_data_23 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_23,
        out_o_data_24 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_24,
        out_o_data_25 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_25,
        out_o_data_26 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_26,
        out_o_data_27 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_27,
        out_o_data_28 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_28,
        out_o_data_29 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_29,
        out_o_data_30 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_30,
        out_o_data_31 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_31,
        out_o_data_32 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_32,
        out_o_data_33 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_33,
        out_o_data_34 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_34,
        out_o_data_35 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_35,
        out_o_data_36 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_36,
        out_o_data_37 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_37,
        out_o_data_38 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_38,
        out_o_data_39 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_39,
        out_o_data_40 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_40,
        out_o_data_41 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_41,
        out_o_data_42 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_42,
        out_o_data_43 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_43,
        out_o_data_44 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_44,
        out_o_data_45 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_45,
        out_o_data_46 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_46,
        out_o_data_47 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_47,
        out_o_data_48 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_48,
        out_o_data_49 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_49,
        out_o_data_50 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_50,
        out_o_stall => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_stall,
        out_o_valid => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_search_B4_vunroll_x(BLACKBOX,10)
    thebb_ethash_search_B4_vunroll_x : bb_ethash_search_B4
    PORT MAP (
        in_mix_pm_2_in_0_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_0_3,
        in_mix_pm_2_in_0_1 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_1_3,
        in_mix_pm_2_in_0_2 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_2_3,
        in_mix_pm_2_in_0_3 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_3_3,
        in_mix_pm_2_in_1_0 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_0_3,
        in_mix_pm_2_in_1_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_1_3,
        in_mix_pm_2_in_1_2 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_2_3,
        in_mix_pm_2_in_1_3 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_3_3,
        in_a_1907_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_1,
        in_a_1907_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_1,
        in_and_RM155_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_42,
        in_and_RM155_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_42,
        in_arraydecay51_RM166_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_48,
        in_arraydecay51_RM166_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_48,
        in_arrayidx36_2_RM165_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_47,
        in_arrayidx36_2_RM165_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_47,
        in_arrayidx45_RM163_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_46,
        in_arrayidx45_RM163_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_46,
        in_barrier_unnamed_ethash_search33_wgs_workgroup_size => in_workgroup_size,
        in_c0_exe1105_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_23,
        in_c0_exe1105_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_23,
        in_c0_exe2110_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_24,
        in_c0_exe2110_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_24,
        in_c0_exe3114_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_25,
        in_c0_exe3114_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_25,
        in_c0_exe4118_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_26,
        in_c0_exe4118_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_26,
        in_cmp23157_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_43,
        in_cmp23157_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_43,
        in_cmp23_xor159_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_44,
        in_cmp23_xor159_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_44,
        in_encoder_ethash_search_B4_merge_priority_encoder_workgroup_size => in_workgroup_size,
        in_flush => in_start,
        in_fpgaindvars_iv12136_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_32,
        in_fpgaindvars_iv12136_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_32,
        in_fpgaindvars_iv6_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_2,
        in_fpgaindvars_iv6_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_2,
        in_fpgaindvars_iv9_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_0,
        in_fpgaindvars_iv9_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_0,
        in_g_dag => in_arg_g_dag,
        in_g_output => in_arg_g_output,
        in_global_id_0194_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_50,
        in_global_id_0194_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_50,
        in_i18_0908154_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_41,
        in_i18_0908154_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_41,
        in_i66_2906_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_4,
        in_i66_2906_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_4,
        in_l_grpid_05_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_5,
        in_l_grpid_05_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_5,
        in_l_grpid_0_addr11_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_6,
        in_l_grpid_0_addr11_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_6,
        in_l_grpid_0_addr_zext161_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_45,
        in_l_grpid_0_addr_zext161_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_45,
        in_memdep_204_avm_readdata => in_memdep_204_avm_readdata,
        in_memdep_204_avm_readdatavalid => in_memdep_204_avm_readdatavalid,
        in_memdep_204_avm_waitrequest => in_memdep_204_avm_waitrequest,
        in_memdep_204_avm_writeack => in_memdep_204_avm_writeack,
        in_scalarizer_0100164_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_15,
        in_scalarizer_0100164_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_15,
        in_scalarizer_0100374_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_17,
        in_scalarizer_0100374_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_17,
        in_scalarizer_0100584_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_19,
        in_scalarizer_0100584_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_19,
        in_scalarizer_0100794_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_21,
        in_scalarizer_0100794_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_21,
        in_scalarizer_01173138_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_33,
        in_scalarizer_01173138_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_33,
        in_scalarizer_01175142_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_35,
        in_scalarizer_01175142_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_35,
        in_scalarizer_01177146_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_37,
        in_scalarizer_01177146_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_37,
        in_scalarizer_01179150_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_39,
        in_scalarizer_01179150_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_39,
        in_scalarizer_099324_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_7,
        in_scalarizer_099324_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_7,
        in_scalarizer_099534_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_9,
        in_scalarizer_099534_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_9,
        in_scalarizer_099744_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_11,
        in_scalarizer_099744_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_11,
        in_scalarizer_099954_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_13,
        in_scalarizer_099954_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_13,
        in_scalarizer_1100059_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_14,
        in_scalarizer_1100059_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_14,
        in_scalarizer_1100269_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_16,
        in_scalarizer_1100269_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_16,
        in_scalarizer_1100479_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_18,
        in_scalarizer_1100479_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_18,
        in_scalarizer_1100689_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_20,
        in_scalarizer_1100689_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_20,
        in_scalarizer_1100899_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_22,
        in_scalarizer_1100899_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_22,
        in_scalarizer_11174140_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_34,
        in_scalarizer_11174140_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_34,
        in_scalarizer_11176144_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_36,
        in_scalarizer_11176144_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_36,
        in_scalarizer_11178148_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_38,
        in_scalarizer_11178148_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_38,
        in_scalarizer_11180152_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_40,
        in_scalarizer_11180152_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_40,
        in_scalarizer_199429_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_8,
        in_scalarizer_199429_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_8,
        in_scalarizer_199639_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_10,
        in_scalarizer_199639_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_10,
        in_scalarizer_199849_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_12,
        in_scalarizer_199849_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_12,
        in_stall_in_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_stall,
        in_stall_in_1 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_stall,
        in_state_0_0_cast122_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_27,
        in_state_0_0_cast122_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_27,
        in_state_4_0_cast125_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_28,
        in_state_4_0_cast125_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_28,
        in_state_5_0_cast128_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_29,
        in_state_5_0_cast128_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_29,
        in_state_6_0_cast131_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_30,
        in_state_6_0_cast131_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_30,
        in_state_7_0_cast134_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_31,
        in_state_7_0_cast134_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_31,
        in_target => in_arg_target,
        in_unnamed_ethash_search32_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_data_49,
        in_unnamed_ethash_search32_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_49,
        in_unnamed_ethash_search34_avm_readdata => in_unnamed_ethash_search34_avm_readdata,
        in_unnamed_ethash_search34_avm_readdatavalid => in_unnamed_ethash_search34_avm_readdatavalid,
        in_unnamed_ethash_search34_avm_waitrequest => in_unnamed_ethash_search34_avm_waitrequest,
        in_unnamed_ethash_search34_avm_writeack => in_unnamed_ethash_search34_avm_writeack,
        in_unnamed_ethash_search35_avm_readdata => in_unnamed_ethash_search35_avm_readdata,
        in_unnamed_ethash_search35_avm_readdatavalid => in_unnamed_ethash_search35_avm_readdatavalid,
        in_unnamed_ethash_search35_avm_waitrequest => in_unnamed_ethash_search35_avm_waitrequest,
        in_unnamed_ethash_search35_avm_writeack => in_unnamed_ethash_search35_avm_writeack,
        in_valid_in_0 => bb_ethash_search_B4_sr_0_aunroll_vunroll_x_out_o_valid,
        in_valid_in_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_valid,
        out_xor_i679_3_0 => bb_ethash_search_B4_vunroll_x_out_xor_i679_3_0,
        out_xor_i679_3_1 => bb_ethash_search_B4_vunroll_x_out_xor_i679_3_1,
        out_xor_i679_3_2 => bb_ethash_search_B4_vunroll_x_out_xor_i679_3_2,
        out_xor_i679_3_3 => bb_ethash_search_B4_vunroll_x_out_xor_i679_3_3,
        out_a_1907_LC_OuterPHI => bb_ethash_search_B4_vunroll_x_out_a_1907_LC_OuterPHI,
        out_and_RM155 => bb_ethash_search_B4_vunroll_x_out_and_RM155,
        out_arraydecay51_RM166 => bb_ethash_search_B4_vunroll_x_out_arraydecay51_RM166,
        out_arrayidx36_2_RM165 => bb_ethash_search_B4_vunroll_x_out_arrayidx36_2_RM165,
        out_arrayidx45_RM163 => bb_ethash_search_B4_vunroll_x_out_arrayidx45_RM163,
        out_c0_exe1105 => bb_ethash_search_B4_vunroll_x_out_c0_exe1105,
        out_c0_exe2110 => bb_ethash_search_B4_vunroll_x_out_c0_exe2110,
        out_c0_exe3114 => bb_ethash_search_B4_vunroll_x_out_c0_exe3114,
        out_c0_exe4118 => bb_ethash_search_B4_vunroll_x_out_c0_exe4118,
        out_cmp23157 => bb_ethash_search_B4_vunroll_x_out_cmp23157,
        out_cmp23_xor159 => bb_ethash_search_B4_vunroll_x_out_cmp23_xor159,
        out_fpgaindvars_iv12136 => bb_ethash_search_B4_vunroll_x_out_fpgaindvars_iv12136,
        out_fpgaindvars_iv6_LC_InnerPHI => bb_ethash_search_B4_vunroll_x_out_fpgaindvars_iv6_LC_InnerPHI,
        out_fpgaindvars_iv9_LC_OuterPHI => bb_ethash_search_B4_vunroll_x_out_fpgaindvars_iv9_LC_OuterPHI,
        out_global_id_0194 => bb_ethash_search_B4_vunroll_x_out_global_id_0194,
        out_i18_0908154 => bb_ethash_search_B4_vunroll_x_out_i18_0908154,
        out_i66_2906_LC_InnerPHI => bb_ethash_search_B4_vunroll_x_out_i66_2906_LC_InnerPHI,
        out_idxprom80_RM => bb_ethash_search_B4_vunroll_x_out_idxprom80_RM,
        out_l_grpid_05 => bb_ethash_search_B4_vunroll_x_out_l_grpid_05,
        out_l_grpid_0_addr11 => bb_ethash_search_B4_vunroll_x_out_l_grpid_0_addr11,
        out_l_grpid_0_addr_zext161 => bb_ethash_search_B4_vunroll_x_out_l_grpid_0_addr_zext161,
        out_memdep_204_avm_address => bb_ethash_search_B4_vunroll_x_out_memdep_204_avm_address,
        out_memdep_204_avm_burstcount => bb_ethash_search_B4_vunroll_x_out_memdep_204_avm_burstcount,
        out_memdep_204_avm_byteenable => bb_ethash_search_B4_vunroll_x_out_memdep_204_avm_byteenable,
        out_memdep_204_avm_enable => bb_ethash_search_B4_vunroll_x_out_memdep_204_avm_enable,
        out_memdep_204_avm_read => bb_ethash_search_B4_vunroll_x_out_memdep_204_avm_read,
        out_memdep_204_avm_write => bb_ethash_search_B4_vunroll_x_out_memdep_204_avm_write,
        out_memdep_204_avm_writedata => bb_ethash_search_B4_vunroll_x_out_memdep_204_avm_writedata,
        out_scalarizer_0100164 => bb_ethash_search_B4_vunroll_x_out_scalarizer_0100164,
        out_scalarizer_0100374 => bb_ethash_search_B4_vunroll_x_out_scalarizer_0100374,
        out_scalarizer_0100584 => bb_ethash_search_B4_vunroll_x_out_scalarizer_0100584,
        out_scalarizer_0100794 => bb_ethash_search_B4_vunroll_x_out_scalarizer_0100794,
        out_scalarizer_01173138 => bb_ethash_search_B4_vunroll_x_out_scalarizer_01173138,
        out_scalarizer_01175142 => bb_ethash_search_B4_vunroll_x_out_scalarizer_01175142,
        out_scalarizer_01177146 => bb_ethash_search_B4_vunroll_x_out_scalarizer_01177146,
        out_scalarizer_01179150 => bb_ethash_search_B4_vunroll_x_out_scalarizer_01179150,
        out_scalarizer_099324 => bb_ethash_search_B4_vunroll_x_out_scalarizer_099324,
        out_scalarizer_099534 => bb_ethash_search_B4_vunroll_x_out_scalarizer_099534,
        out_scalarizer_099744 => bb_ethash_search_B4_vunroll_x_out_scalarizer_099744,
        out_scalarizer_099954 => bb_ethash_search_B4_vunroll_x_out_scalarizer_099954,
        out_scalarizer_0xor1200 => bb_ethash_search_B4_vunroll_x_out_scalarizer_0xor1200,
        out_scalarizer_1100059 => bb_ethash_search_B4_vunroll_x_out_scalarizer_1100059,
        out_scalarizer_1100269 => bb_ethash_search_B4_vunroll_x_out_scalarizer_1100269,
        out_scalarizer_1100479 => bb_ethash_search_B4_vunroll_x_out_scalarizer_1100479,
        out_scalarizer_1100689 => bb_ethash_search_B4_vunroll_x_out_scalarizer_1100689,
        out_scalarizer_1100899 => bb_ethash_search_B4_vunroll_x_out_scalarizer_1100899,
        out_scalarizer_11174140 => bb_ethash_search_B4_vunroll_x_out_scalarizer_11174140,
        out_scalarizer_11176144 => bb_ethash_search_B4_vunroll_x_out_scalarizer_11176144,
        out_scalarizer_11178148 => bb_ethash_search_B4_vunroll_x_out_scalarizer_11178148,
        out_scalarizer_11180152 => bb_ethash_search_B4_vunroll_x_out_scalarizer_11180152,
        out_scalarizer_199429 => bb_ethash_search_B4_vunroll_x_out_scalarizer_199429,
        out_scalarizer_199639 => bb_ethash_search_B4_vunroll_x_out_scalarizer_199639,
        out_scalarizer_199849 => bb_ethash_search_B4_vunroll_x_out_scalarizer_199849,
        out_scalarizer_1xor1201 => bb_ethash_search_B4_vunroll_x_out_scalarizer_1xor1201,
        out_scalarizer_2xor => bb_ethash_search_B4_vunroll_x_out_scalarizer_2xor,
        out_scalarizer_3xor => bb_ethash_search_B4_vunroll_x_out_scalarizer_3xor,
        out_stall_out_0 => bb_ethash_search_B4_vunroll_x_out_stall_out_0,
        out_stall_out_1 => bb_ethash_search_B4_vunroll_x_out_stall_out_1,
        out_state_0_0_cast122 => bb_ethash_search_B4_vunroll_x_out_state_0_0_cast122,
        out_state_4_0_cast125 => bb_ethash_search_B4_vunroll_x_out_state_4_0_cast125,
        out_state_5_0_cast128 => bb_ethash_search_B4_vunroll_x_out_state_5_0_cast128,
        out_state_6_0_cast131 => bb_ethash_search_B4_vunroll_x_out_state_6_0_cast131,
        out_state_7_0_cast134 => bb_ethash_search_B4_vunroll_x_out_state_7_0_cast134,
        out_unnamed_ethash_search32 => bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search32,
        out_unnamed_ethash_search34_avm_address => bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search34_avm_address,
        out_unnamed_ethash_search34_avm_burstcount => bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search34_avm_burstcount,
        out_unnamed_ethash_search34_avm_byteenable => bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search34_avm_byteenable,
        out_unnamed_ethash_search34_avm_enable => bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search34_avm_enable,
        out_unnamed_ethash_search34_avm_read => bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search34_avm_read,
        out_unnamed_ethash_search34_avm_write => bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search34_avm_write,
        out_unnamed_ethash_search34_avm_writedata => bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search34_avm_writedata,
        out_unnamed_ethash_search35_avm_address => bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search35_avm_address,
        out_unnamed_ethash_search35_avm_burstcount => bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search35_avm_burstcount,
        out_unnamed_ethash_search35_avm_byteenable => bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search35_avm_byteenable,
        out_unnamed_ethash_search35_avm_enable => bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search35_avm_enable,
        out_unnamed_ethash_search35_avm_read => bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search35_avm_read,
        out_unnamed_ethash_search35_avm_write => bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search35_avm_write,
        out_unnamed_ethash_search35_avm_writedata => bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search35_avm_writedata,
        out_valid_out_0 => bb_ethash_search_B4_vunroll_x_out_valid_out_0,
        out_valid_out_1 => bb_ethash_search_B4_vunroll_x_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- c_i3_2gr(CONSTANT,73)
    c_i3_2gr_q <= "010";

    -- dupName_0_c_i32_0gr_x(CONSTANT,16)
    dupName_0_c_i32_0gr_x_q <= "00000000000000000000000000000000";

    -- c_i5_14(CONSTANT,75)
    c_i5_14_q <= "01110";

    -- bb_ethash_search_B4_sr_1_aunroll_vunroll_x(BLACKBOX,3)
    thebb_ethash_search_B4_sr_1_aunroll_vunroll_x : bb_ethash_search_B4_sr_1
    PORT MAP (
        in_i_data_0 => c_i5_14_q,
        in_i_data_0_3 => bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search27_0,
        in_i_data_1 => dupName_0_c_i32_0gr_x_q,
        in_i_data_1_3 => bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search27_1,
        in_i_data_2 => c_i3_2gr_q,
        in_i_data_2_3 => bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search27_2,
        in_i_data_3_3 => bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search27_3,
        in_i_data_4 => dupName_0_c_i32_0gr_x_q,
        in_i_data_5 => bb_ethash_search_B3_vunroll_x_out_l_grpid_06,
        in_i_data_6 => bb_ethash_search_B3_vunroll_x_out_l_grpid_0_addr9,
        in_i_data_7 => bb_ethash_search_B3_vunroll_x_out_scalarizer_099325,
        in_i_data_8 => bb_ethash_search_B3_vunroll_x_out_scalarizer_199430,
        in_i_data_9 => bb_ethash_search_B3_vunroll_x_out_scalarizer_099535,
        in_i_data_10 => bb_ethash_search_B3_vunroll_x_out_scalarizer_199640,
        in_i_data_11 => bb_ethash_search_B3_vunroll_x_out_scalarizer_099745,
        in_i_data_12 => bb_ethash_search_B3_vunroll_x_out_scalarizer_199850,
        in_i_data_13 => bb_ethash_search_B3_vunroll_x_out_scalarizer_099955,
        in_i_data_14 => bb_ethash_search_B3_vunroll_x_out_scalarizer_1100060,
        in_i_data_15 => bb_ethash_search_B3_vunroll_x_out_scalarizer_0100165,
        in_i_data_16 => bb_ethash_search_B3_vunroll_x_out_scalarizer_1100270,
        in_i_data_17 => bb_ethash_search_B3_vunroll_x_out_scalarizer_0100375,
        in_i_data_18 => bb_ethash_search_B3_vunroll_x_out_scalarizer_1100480,
        in_i_data_19 => bb_ethash_search_B3_vunroll_x_out_scalarizer_0100585,
        in_i_data_20 => bb_ethash_search_B3_vunroll_x_out_scalarizer_1100690,
        in_i_data_21 => bb_ethash_search_B3_vunroll_x_out_scalarizer_0100795,
        in_i_data_22 => bb_ethash_search_B3_vunroll_x_out_scalarizer_11008100,
        in_i_data_23 => bb_ethash_search_B3_vunroll_x_out_c0_exe1106,
        in_i_data_24 => bb_ethash_search_B3_vunroll_x_out_c0_exe2108,
        in_i_data_25 => bb_ethash_search_B3_vunroll_x_out_c0_exe3112,
        in_i_data_26 => bb_ethash_search_B3_vunroll_x_out_c0_exe4116,
        in_i_data_27 => bb_ethash_search_B3_vunroll_x_out_state_0_0_cast120,
        in_i_data_28 => bb_ethash_search_B3_vunroll_x_out_state_4_0_cast123,
        in_i_data_29 => bb_ethash_search_B3_vunroll_x_out_state_5_0_cast126,
        in_i_data_30 => bb_ethash_search_B3_vunroll_x_out_state_6_0_cast129,
        in_i_data_31 => bb_ethash_search_B3_vunroll_x_out_state_7_0_cast132,
        in_i_data_32 => bb_ethash_search_B3_vunroll_x_out_fpgaindvars_iv12,
        in_i_data_33 => bb_ethash_search_B3_vunroll_x_out_scalarizer_01173,
        in_i_data_34 => bb_ethash_search_B3_vunroll_x_out_scalarizer_11174,
        in_i_data_35 => bb_ethash_search_B3_vunroll_x_out_scalarizer_01175,
        in_i_data_36 => bb_ethash_search_B3_vunroll_x_out_scalarizer_11176,
        in_i_data_37 => bb_ethash_search_B3_vunroll_x_out_scalarizer_01177,
        in_i_data_38 => bb_ethash_search_B3_vunroll_x_out_scalarizer_11178,
        in_i_data_39 => bb_ethash_search_B3_vunroll_x_out_scalarizer_01179,
        in_i_data_40 => bb_ethash_search_B3_vunroll_x_out_scalarizer_11180,
        in_i_data_41 => bb_ethash_search_B3_vunroll_x_out_i18_0908,
        in_i_data_42 => bb_ethash_search_B3_vunroll_x_out_and_RM,
        in_i_data_43 => bb_ethash_search_B3_vunroll_x_out_cmp23,
        in_i_data_44 => bb_ethash_search_B3_vunroll_x_out_cmp23_xor,
        in_i_data_45 => bb_ethash_search_B3_vunroll_x_out_l_grpid_0_addr_zext,
        in_i_data_46 => bb_ethash_search_B3_vunroll_x_out_arrayidx45_RM,
        in_i_data_47 => bb_ethash_search_B3_vunroll_x_out_arrayidx36_2_RM,
        in_i_data_48 => bb_ethash_search_B3_vunroll_x_out_arraydecay51_RM,
        in_i_data_49 => bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search28,
        in_i_data_50 => bb_ethash_search_B3_vunroll_x_out_global_id_0195,
        in_i_stall => bb_ethash_search_B4_vunroll_x_out_stall_out_1,
        in_i_valid => loop_limiter_ethash_search3_out_o_valid,
        out_o_data_0 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_0,
        out_o_data_0_3 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_0_3,
        out_o_data_1 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_1,
        out_o_data_1_3 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_1_3,
        out_o_data_2 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_2,
        out_o_data_2_3 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_2_3,
        out_o_data_3_3 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_3_3,
        out_o_data_4 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_4,
        out_o_data_5 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_5,
        out_o_data_6 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_6,
        out_o_data_7 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_7,
        out_o_data_8 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_8,
        out_o_data_9 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_9,
        out_o_data_10 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_10,
        out_o_data_11 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_11,
        out_o_data_12 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_12,
        out_o_data_13 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_13,
        out_o_data_14 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_14,
        out_o_data_15 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_15,
        out_o_data_16 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_16,
        out_o_data_17 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_17,
        out_o_data_18 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_18,
        out_o_data_19 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_19,
        out_o_data_20 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_20,
        out_o_data_21 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_21,
        out_o_data_22 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_22,
        out_o_data_23 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_23,
        out_o_data_24 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_24,
        out_o_data_25 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_25,
        out_o_data_26 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_26,
        out_o_data_27 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_27,
        out_o_data_28 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_28,
        out_o_data_29 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_29,
        out_o_data_30 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_30,
        out_o_data_31 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_31,
        out_o_data_32 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_32,
        out_o_data_33 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_33,
        out_o_data_34 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_34,
        out_o_data_35 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_35,
        out_o_data_36 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_36,
        out_o_data_37 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_37,
        out_o_data_38 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_38,
        out_o_data_39 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_39,
        out_o_data_40 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_40,
        out_o_data_41 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_41,
        out_o_data_42 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_42,
        out_o_data_43 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_43,
        out_o_data_44 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_44,
        out_o_data_45 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_45,
        out_o_data_46 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_46,
        out_o_data_47 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_47,
        out_o_data_48 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_48,
        out_o_data_49 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_49,
        out_o_data_50 => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_data_50,
        out_o_stall => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_stall,
        out_o_valid => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- loop_limiter_ethash_search3(BLACKBOX,178)
    theloop_limiter_ethash_search3 : loop_limiter_ethash_search3
    PORT MAP (
        in_i_stall => bb_ethash_search_B4_sr_1_aunroll_vunroll_x_out_o_stall,
        in_i_stall_exit => bb_ethash_search_B5_sr_0_aunroll_x_out_o_stall,
        in_i_valid => bb_ethash_search_B3_vunroll_x_out_valid_out_0,
        in_i_valid_exit => bb_ethash_search_B4_vunroll_x_out_valid_out_1,
        out_o_stall => loop_limiter_ethash_search3_out_o_stall,
        out_o_valid => loop_limiter_ethash_search3_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_search_B3_vunroll_x(BLACKBOX,7)
    thebb_ethash_search_B3_vunroll_x : bb_ethash_search_B3
    PORT MAP (
        in_barrier_unnamed_ethash_search29_wgs_workgroup_size => in_workgroup_size,
        in_barrier_unnamed_ethash_search30_wgs_workgroup_size => in_workgroup_size,
        in_barrier_unnamed_ethash_search31_wgs_workgroup_size => in_workgroup_size,
        in_c0_exe1106_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_28,
        in_c0_exe1106_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_28,
        in_c0_exe2108_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_29,
        in_c0_exe2108_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_29,
        in_c0_exe3112_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_30,
        in_c0_exe3112_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_30,
        in_c0_exe4116_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_31,
        in_c0_exe4116_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_31,
        in_encoder_ethash_search_B3_merge_priority_encoder_workgroup_size => in_workgroup_size,
        in_flush => in_start,
        in_fpgaindvars_iv12_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_0,
        in_fpgaindvars_iv12_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_0,
        in_g_dag => in_arg_g_dag,
        in_g_output => in_arg_g_output,
        in_global_id_0195_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_37,
        in_global_id_0195_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_37,
        in_i18_0908_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_9,
        in_i18_0908_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_9,
        in_l_grpid_06_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_10,
        in_l_grpid_06_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_10,
        in_l_grpid_0_addr9_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_11,
        in_l_grpid_0_addr9_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_11,
        in_memdep_198_avm_readdata => in_memdep_198_avm_readdata,
        in_memdep_198_avm_readdatavalid => in_memdep_198_avm_readdatavalid,
        in_memdep_198_avm_waitrequest => in_memdep_198_avm_waitrequest,
        in_memdep_198_avm_writeack => in_memdep_198_avm_writeack,
        in_memdep_199_avm_readdata => in_memdep_199_avm_readdata,
        in_memdep_199_avm_readdatavalid => in_memdep_199_avm_readdatavalid,
        in_memdep_199_avm_waitrequest => in_memdep_199_avm_waitrequest,
        in_memdep_199_avm_writeack => in_memdep_199_avm_writeack,
        in_memdep_200_avm_readdata => in_memdep_200_avm_readdata,
        in_memdep_200_avm_readdatavalid => in_memdep_200_avm_readdatavalid,
        in_memdep_200_avm_waitrequest => in_memdep_200_avm_waitrequest,
        in_memdep_200_avm_writeack => in_memdep_200_avm_writeack,
        in_memdep_203_avm_readdata => in_memdep_203_avm_readdata,
        in_memdep_203_avm_readdatavalid => in_memdep_203_avm_readdatavalid,
        in_memdep_203_avm_waitrequest => in_memdep_203_avm_waitrequest,
        in_memdep_203_avm_writeack => in_memdep_203_avm_writeack,
        in_memdep_avm_readdata => in_memdep_avm_readdata,
        in_memdep_avm_readdatavalid => in_memdep_avm_readdatavalid,
        in_memdep_avm_waitrequest => in_memdep_avm_waitrequest,
        in_memdep_avm_writeack => in_memdep_avm_writeack,
        in_scalarizer_0100165_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_20,
        in_scalarizer_0100165_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_20,
        in_scalarizer_0100375_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_22,
        in_scalarizer_0100375_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_22,
        in_scalarizer_0100585_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_24,
        in_scalarizer_0100585_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_24,
        in_scalarizer_0100795_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_26,
        in_scalarizer_0100795_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_26,
        in_scalarizer_01173_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_1,
        in_scalarizer_01173_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_1,
        in_scalarizer_01175_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_3,
        in_scalarizer_01175_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_3,
        in_scalarizer_01177_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_5,
        in_scalarizer_01177_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_5,
        in_scalarizer_01179_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_7,
        in_scalarizer_01179_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_7,
        in_scalarizer_099325_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_12,
        in_scalarizer_099325_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_12,
        in_scalarizer_099535_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_14,
        in_scalarizer_099535_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_14,
        in_scalarizer_099745_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_16,
        in_scalarizer_099745_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_16,
        in_scalarizer_099955_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_18,
        in_scalarizer_099955_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_18,
        in_scalarizer_1100060_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_19,
        in_scalarizer_1100060_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_19,
        in_scalarizer_1100270_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_21,
        in_scalarizer_1100270_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_21,
        in_scalarizer_1100480_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_23,
        in_scalarizer_1100480_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_23,
        in_scalarizer_1100690_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_25,
        in_scalarizer_1100690_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_25,
        in_scalarizer_11008100_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_27,
        in_scalarizer_11008100_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_27,
        in_scalarizer_11174_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_2,
        in_scalarizer_11174_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_2,
        in_scalarizer_11176_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_4,
        in_scalarizer_11176_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_4,
        in_scalarizer_11178_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_6,
        in_scalarizer_11178_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_6,
        in_scalarizer_11180_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_8,
        in_scalarizer_11180_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_8,
        in_scalarizer_199430_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_13,
        in_scalarizer_199430_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_13,
        in_scalarizer_199640_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_15,
        in_scalarizer_199640_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_15,
        in_scalarizer_199850_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_17,
        in_scalarizer_199850_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_17,
        in_stall_in_0 => loop_limiter_ethash_search3_out_o_stall,
        in_state_0_0_cast120_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_32,
        in_state_0_0_cast120_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_32,
        in_state_4_0_cast123_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_33,
        in_state_4_0_cast123_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_33,
        in_state_5_0_cast126_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_34,
        in_state_5_0_cast126_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_34,
        in_state_6_0_cast129_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_35,
        in_state_6_0_cast129_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_35,
        in_state_7_0_cast132_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_36,
        in_state_7_0_cast132_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_36,
        in_target => in_arg_target,
        in_unnamed_ethash_search27_avm_readdata => in_unnamed_ethash_search27_avm_readdata,
        in_unnamed_ethash_search27_avm_readdatavalid => in_unnamed_ethash_search27_avm_readdatavalid,
        in_unnamed_ethash_search27_avm_waitrequest => in_unnamed_ethash_search27_avm_waitrequest,
        in_unnamed_ethash_search27_avm_writeack => in_unnamed_ethash_search27_avm_writeack,
        in_unnamed_ethash_search28_avm_readdata => in_unnamed_ethash_search28_avm_readdata,
        in_unnamed_ethash_search28_avm_readdatavalid => in_unnamed_ethash_search28_avm_readdatavalid,
        in_unnamed_ethash_search28_avm_waitrequest => in_unnamed_ethash_search28_avm_waitrequest,
        in_unnamed_ethash_search28_avm_writeack => in_unnamed_ethash_search28_avm_writeack,
        in_valid_in_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_valid,
        in_valid_in_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_valid,
        out_unnamed_ethash_search27_0 => bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search27_0,
        out_unnamed_ethash_search27_1 => bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search27_1,
        out_unnamed_ethash_search27_2 => bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search27_2,
        out_unnamed_ethash_search27_3 => bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search27_3,
        out_and_RM => bb_ethash_search_B3_vunroll_x_out_and_RM,
        out_arraydecay51_RM => bb_ethash_search_B3_vunroll_x_out_arraydecay51_RM,
        out_arrayidx36_2_RM => bb_ethash_search_B3_vunroll_x_out_arrayidx36_2_RM,
        out_arrayidx45_RM => bb_ethash_search_B3_vunroll_x_out_arrayidx45_RM,
        out_c0_exe1106 => bb_ethash_search_B3_vunroll_x_out_c0_exe1106,
        out_c0_exe2108 => bb_ethash_search_B3_vunroll_x_out_c0_exe2108,
        out_c0_exe3112 => bb_ethash_search_B3_vunroll_x_out_c0_exe3112,
        out_c0_exe4116 => bb_ethash_search_B3_vunroll_x_out_c0_exe4116,
        out_cmp23 => bb_ethash_search_B3_vunroll_x_out_cmp23,
        out_cmp23_xor => bb_ethash_search_B3_vunroll_x_out_cmp23_xor,
        out_fpgaindvars_iv12 => bb_ethash_search_B3_vunroll_x_out_fpgaindvars_iv12,
        out_global_id_0195 => bb_ethash_search_B3_vunroll_x_out_global_id_0195,
        out_i18_0908 => bb_ethash_search_B3_vunroll_x_out_i18_0908,
        out_l_grpid_06 => bb_ethash_search_B3_vunroll_x_out_l_grpid_06,
        out_l_grpid_0_addr9 => bb_ethash_search_B3_vunroll_x_out_l_grpid_0_addr9,
        out_l_grpid_0_addr_zext => bb_ethash_search_B3_vunroll_x_out_l_grpid_0_addr_zext,
        out_memdep_198_avm_address => bb_ethash_search_B3_vunroll_x_out_memdep_198_avm_address,
        out_memdep_198_avm_burstcount => bb_ethash_search_B3_vunroll_x_out_memdep_198_avm_burstcount,
        out_memdep_198_avm_byteenable => bb_ethash_search_B3_vunroll_x_out_memdep_198_avm_byteenable,
        out_memdep_198_avm_enable => bb_ethash_search_B3_vunroll_x_out_memdep_198_avm_enable,
        out_memdep_198_avm_read => bb_ethash_search_B3_vunroll_x_out_memdep_198_avm_read,
        out_memdep_198_avm_write => bb_ethash_search_B3_vunroll_x_out_memdep_198_avm_write,
        out_memdep_198_avm_writedata => bb_ethash_search_B3_vunroll_x_out_memdep_198_avm_writedata,
        out_memdep_199_avm_address => bb_ethash_search_B3_vunroll_x_out_memdep_199_avm_address,
        out_memdep_199_avm_burstcount => bb_ethash_search_B3_vunroll_x_out_memdep_199_avm_burstcount,
        out_memdep_199_avm_byteenable => bb_ethash_search_B3_vunroll_x_out_memdep_199_avm_byteenable,
        out_memdep_199_avm_enable => bb_ethash_search_B3_vunroll_x_out_memdep_199_avm_enable,
        out_memdep_199_avm_read => bb_ethash_search_B3_vunroll_x_out_memdep_199_avm_read,
        out_memdep_199_avm_write => bb_ethash_search_B3_vunroll_x_out_memdep_199_avm_write,
        out_memdep_199_avm_writedata => bb_ethash_search_B3_vunroll_x_out_memdep_199_avm_writedata,
        out_memdep_200_avm_address => bb_ethash_search_B3_vunroll_x_out_memdep_200_avm_address,
        out_memdep_200_avm_burstcount => bb_ethash_search_B3_vunroll_x_out_memdep_200_avm_burstcount,
        out_memdep_200_avm_byteenable => bb_ethash_search_B3_vunroll_x_out_memdep_200_avm_byteenable,
        out_memdep_200_avm_enable => bb_ethash_search_B3_vunroll_x_out_memdep_200_avm_enable,
        out_memdep_200_avm_read => bb_ethash_search_B3_vunroll_x_out_memdep_200_avm_read,
        out_memdep_200_avm_write => bb_ethash_search_B3_vunroll_x_out_memdep_200_avm_write,
        out_memdep_200_avm_writedata => bb_ethash_search_B3_vunroll_x_out_memdep_200_avm_writedata,
        out_memdep_203_avm_address => bb_ethash_search_B3_vunroll_x_out_memdep_203_avm_address,
        out_memdep_203_avm_burstcount => bb_ethash_search_B3_vunroll_x_out_memdep_203_avm_burstcount,
        out_memdep_203_avm_byteenable => bb_ethash_search_B3_vunroll_x_out_memdep_203_avm_byteenable,
        out_memdep_203_avm_enable => bb_ethash_search_B3_vunroll_x_out_memdep_203_avm_enable,
        out_memdep_203_avm_read => bb_ethash_search_B3_vunroll_x_out_memdep_203_avm_read,
        out_memdep_203_avm_write => bb_ethash_search_B3_vunroll_x_out_memdep_203_avm_write,
        out_memdep_203_avm_writedata => bb_ethash_search_B3_vunroll_x_out_memdep_203_avm_writedata,
        out_memdep_avm_address => bb_ethash_search_B3_vunroll_x_out_memdep_avm_address,
        out_memdep_avm_burstcount => bb_ethash_search_B3_vunroll_x_out_memdep_avm_burstcount,
        out_memdep_avm_byteenable => bb_ethash_search_B3_vunroll_x_out_memdep_avm_byteenable,
        out_memdep_avm_enable => bb_ethash_search_B3_vunroll_x_out_memdep_avm_enable,
        out_memdep_avm_read => bb_ethash_search_B3_vunroll_x_out_memdep_avm_read,
        out_memdep_avm_write => bb_ethash_search_B3_vunroll_x_out_memdep_avm_write,
        out_memdep_avm_writedata => bb_ethash_search_B3_vunroll_x_out_memdep_avm_writedata,
        out_scalarizer_0100165 => bb_ethash_search_B3_vunroll_x_out_scalarizer_0100165,
        out_scalarizer_0100375 => bb_ethash_search_B3_vunroll_x_out_scalarizer_0100375,
        out_scalarizer_0100585 => bb_ethash_search_B3_vunroll_x_out_scalarizer_0100585,
        out_scalarizer_0100795 => bb_ethash_search_B3_vunroll_x_out_scalarizer_0100795,
        out_scalarizer_01173 => bb_ethash_search_B3_vunroll_x_out_scalarizer_01173,
        out_scalarizer_01175 => bb_ethash_search_B3_vunroll_x_out_scalarizer_01175,
        out_scalarizer_01177 => bb_ethash_search_B3_vunroll_x_out_scalarizer_01177,
        out_scalarizer_01179 => bb_ethash_search_B3_vunroll_x_out_scalarizer_01179,
        out_scalarizer_099325 => bb_ethash_search_B3_vunroll_x_out_scalarizer_099325,
        out_scalarizer_099535 => bb_ethash_search_B3_vunroll_x_out_scalarizer_099535,
        out_scalarizer_099745 => bb_ethash_search_B3_vunroll_x_out_scalarizer_099745,
        out_scalarizer_099955 => bb_ethash_search_B3_vunroll_x_out_scalarizer_099955,
        out_scalarizer_1100060 => bb_ethash_search_B3_vunroll_x_out_scalarizer_1100060,
        out_scalarizer_1100270 => bb_ethash_search_B3_vunroll_x_out_scalarizer_1100270,
        out_scalarizer_1100480 => bb_ethash_search_B3_vunroll_x_out_scalarizer_1100480,
        out_scalarizer_1100690 => bb_ethash_search_B3_vunroll_x_out_scalarizer_1100690,
        out_scalarizer_11008100 => bb_ethash_search_B3_vunroll_x_out_scalarizer_11008100,
        out_scalarizer_11174 => bb_ethash_search_B3_vunroll_x_out_scalarizer_11174,
        out_scalarizer_11176 => bb_ethash_search_B3_vunroll_x_out_scalarizer_11176,
        out_scalarizer_11178 => bb_ethash_search_B3_vunroll_x_out_scalarizer_11178,
        out_scalarizer_11180 => bb_ethash_search_B3_vunroll_x_out_scalarizer_11180,
        out_scalarizer_199430 => bb_ethash_search_B3_vunroll_x_out_scalarizer_199430,
        out_scalarizer_199640 => bb_ethash_search_B3_vunroll_x_out_scalarizer_199640,
        out_scalarizer_199850 => bb_ethash_search_B3_vunroll_x_out_scalarizer_199850,
        out_stall_out_0 => bb_ethash_search_B3_vunroll_x_out_stall_out_0,
        out_stall_out_1 => bb_ethash_search_B3_vunroll_x_out_stall_out_1,
        out_state_0_0_cast120 => bb_ethash_search_B3_vunroll_x_out_state_0_0_cast120,
        out_state_4_0_cast123 => bb_ethash_search_B3_vunroll_x_out_state_4_0_cast123,
        out_state_5_0_cast126 => bb_ethash_search_B3_vunroll_x_out_state_5_0_cast126,
        out_state_6_0_cast129 => bb_ethash_search_B3_vunroll_x_out_state_6_0_cast129,
        out_state_7_0_cast132 => bb_ethash_search_B3_vunroll_x_out_state_7_0_cast132,
        out_unnamed_ethash_search27_avm_address => bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search27_avm_address,
        out_unnamed_ethash_search27_avm_burstcount => bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search27_avm_burstcount,
        out_unnamed_ethash_search27_avm_byteenable => bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search27_avm_byteenable,
        out_unnamed_ethash_search27_avm_enable => bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search27_avm_enable,
        out_unnamed_ethash_search27_avm_read => bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search27_avm_read,
        out_unnamed_ethash_search27_avm_write => bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search27_avm_write,
        out_unnamed_ethash_search27_avm_writedata => bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search27_avm_writedata,
        out_unnamed_ethash_search28 => bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search28,
        out_unnamed_ethash_search28_avm_address => bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search28_avm_address,
        out_unnamed_ethash_search28_avm_burstcount => bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search28_avm_burstcount,
        out_unnamed_ethash_search28_avm_byteenable => bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search28_avm_byteenable,
        out_unnamed_ethash_search28_avm_enable => bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search28_avm_enable,
        out_unnamed_ethash_search28_avm_read => bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search28_avm_read,
        out_unnamed_ethash_search28_avm_write => bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search28_avm_write,
        out_unnamed_ethash_search28_avm_writedata => bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search28_avm_writedata,
        out_valid_out_0 => bb_ethash_search_B3_vunroll_x_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_search_B3_sr_0_aunroll_x(BLACKBOX,8)
    thebb_ethash_search_B3_sr_0_aunroll_x : bb_ethash_search_B3_sr_0
    PORT MAP (
        in_i_data_0 => bb_ethash_search_B5_out_fpgaindvars_iv_next13,
        in_i_data_1 => bb_ethash_search_B5_out_c1_exe1,
        in_i_data_2 => bb_ethash_search_B5_out_c1_exe2,
        in_i_data_3 => bb_ethash_search_B5_out_c1_exe3,
        in_i_data_4 => bb_ethash_search_B5_out_c1_exe4,
        in_i_data_5 => bb_ethash_search_B5_out_acl_1413,
        in_i_data_6 => bb_ethash_search_B5_out_acl_1414,
        in_i_data_7 => bb_ethash_search_B5_out_acl_1415,
        in_i_data_8 => bb_ethash_search_B5_out_acl_1416,
        in_i_data_9 => bb_ethash_search_B5_out_inc123,
        in_i_data_10 => bb_ethash_search_B5_out_l_grpid_04,
        in_i_data_11 => bb_ethash_search_B5_out_l_grpid_0_addr10,
        in_i_data_12 => bb_ethash_search_B5_out_scalarizer_099323,
        in_i_data_13 => bb_ethash_search_B5_out_scalarizer_199428,
        in_i_data_14 => bb_ethash_search_B5_out_scalarizer_099533,
        in_i_data_15 => bb_ethash_search_B5_out_scalarizer_199638,
        in_i_data_16 => bb_ethash_search_B5_out_scalarizer_099743,
        in_i_data_17 => bb_ethash_search_B5_out_scalarizer_199848,
        in_i_data_18 => bb_ethash_search_B5_out_scalarizer_099953,
        in_i_data_19 => bb_ethash_search_B5_out_scalarizer_1100058,
        in_i_data_20 => bb_ethash_search_B5_out_scalarizer_0100163,
        in_i_data_21 => bb_ethash_search_B5_out_scalarizer_1100268,
        in_i_data_22 => bb_ethash_search_B5_out_scalarizer_0100373,
        in_i_data_23 => bb_ethash_search_B5_out_scalarizer_1100478,
        in_i_data_24 => bb_ethash_search_B5_out_scalarizer_0100583,
        in_i_data_25 => bb_ethash_search_B5_out_scalarizer_1100688,
        in_i_data_26 => bb_ethash_search_B5_out_scalarizer_0100793,
        in_i_data_27 => bb_ethash_search_B5_out_scalarizer_1100898,
        in_i_data_28 => bb_ethash_search_B5_out_c0_exe1104,
        in_i_data_29 => bb_ethash_search_B5_out_c0_exe2109,
        in_i_data_30 => bb_ethash_search_B5_out_c0_exe3113,
        in_i_data_31 => bb_ethash_search_B5_out_c0_exe4117,
        in_i_data_32 => bb_ethash_search_B5_out_state_0_0_cast121,
        in_i_data_33 => bb_ethash_search_B5_out_state_4_0_cast124,
        in_i_data_34 => bb_ethash_search_B5_out_state_5_0_cast127,
        in_i_data_35 => bb_ethash_search_B5_out_state_6_0_cast130,
        in_i_data_36 => bb_ethash_search_B5_out_state_7_0_cast133,
        in_i_data_37 => bb_ethash_search_B5_out_global_id_0193,
        in_i_stall => bb_ethash_search_B3_vunroll_x_out_stall_out_0,
        in_i_valid => bb_ethash_search_B5_out_valid_out_1,
        out_o_data_0 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_9,
        out_o_data_10 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_10,
        out_o_data_11 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_11,
        out_o_data_12 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_12,
        out_o_data_13 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_13,
        out_o_data_14 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_14,
        out_o_data_15 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_15,
        out_o_data_16 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_16,
        out_o_data_17 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_17,
        out_o_data_18 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_18,
        out_o_data_19 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_19,
        out_o_data_20 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_20,
        out_o_data_21 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_21,
        out_o_data_22 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_22,
        out_o_data_23 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_23,
        out_o_data_24 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_24,
        out_o_data_25 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_25,
        out_o_data_26 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_26,
        out_o_data_27 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_27,
        out_o_data_28 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_28,
        out_o_data_29 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_29,
        out_o_data_30 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_30,
        out_o_data_31 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_31,
        out_o_data_32 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_32,
        out_o_data_33 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_33,
        out_o_data_34 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_34,
        out_o_data_35 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_35,
        out_o_data_36 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_36,
        out_o_data_37 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_data_37,
        out_o_stall => bb_ethash_search_B3_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_ethash_search_B3_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_search_B5_sr_0_aunroll_x(BLACKBOX,11)
    thebb_ethash_search_B5_sr_0_aunroll_x : bb_ethash_search_B5_sr_0
    PORT MAP (
        in_i_data_0 => bb_ethash_search_B4_vunroll_x_out_l_grpid_05,
        in_i_data_1 => bb_ethash_search_B4_vunroll_x_out_l_grpid_0_addr11,
        in_i_data_2 => bb_ethash_search_B4_vunroll_x_out_scalarizer_099324,
        in_i_data_3 => bb_ethash_search_B4_vunroll_x_out_scalarizer_199429,
        in_i_data_4 => bb_ethash_search_B4_vunroll_x_out_scalarizer_099534,
        in_i_data_5 => bb_ethash_search_B4_vunroll_x_out_scalarizer_199639,
        in_i_data_6 => bb_ethash_search_B4_vunroll_x_out_scalarizer_099744,
        in_i_data_7 => bb_ethash_search_B4_vunroll_x_out_scalarizer_199849,
        in_i_data_8 => bb_ethash_search_B4_vunroll_x_out_scalarizer_099954,
        in_i_data_9 => bb_ethash_search_B4_vunroll_x_out_scalarizer_1100059,
        in_i_data_10 => bb_ethash_search_B4_vunroll_x_out_scalarizer_0100164,
        in_i_data_11 => bb_ethash_search_B4_vunroll_x_out_scalarizer_1100269,
        in_i_data_12 => bb_ethash_search_B4_vunroll_x_out_scalarizer_0100374,
        in_i_data_13 => bb_ethash_search_B4_vunroll_x_out_scalarizer_1100479,
        in_i_data_14 => bb_ethash_search_B4_vunroll_x_out_scalarizer_0100584,
        in_i_data_15 => bb_ethash_search_B4_vunroll_x_out_scalarizer_1100689,
        in_i_data_16 => bb_ethash_search_B4_vunroll_x_out_scalarizer_0100794,
        in_i_data_17 => bb_ethash_search_B4_vunroll_x_out_scalarizer_1100899,
        in_i_data_18 => bb_ethash_search_B4_vunroll_x_out_c0_exe1105,
        in_i_data_19 => bb_ethash_search_B4_vunroll_x_out_c0_exe2110,
        in_i_data_20 => bb_ethash_search_B4_vunroll_x_out_c0_exe3114,
        in_i_data_21 => bb_ethash_search_B4_vunroll_x_out_c0_exe4118,
        in_i_data_22 => bb_ethash_search_B4_vunroll_x_out_state_0_0_cast122,
        in_i_data_23 => bb_ethash_search_B4_vunroll_x_out_state_4_0_cast125,
        in_i_data_24 => bb_ethash_search_B4_vunroll_x_out_state_5_0_cast128,
        in_i_data_25 => bb_ethash_search_B4_vunroll_x_out_state_6_0_cast131,
        in_i_data_26 => bb_ethash_search_B4_vunroll_x_out_state_7_0_cast134,
        in_i_data_27 => bb_ethash_search_B4_vunroll_x_out_fpgaindvars_iv12136,
        in_i_data_28 => bb_ethash_search_B4_vunroll_x_out_scalarizer_01173138,
        in_i_data_29 => bb_ethash_search_B4_vunroll_x_out_scalarizer_11174140,
        in_i_data_30 => bb_ethash_search_B4_vunroll_x_out_scalarizer_01175142,
        in_i_data_31 => bb_ethash_search_B4_vunroll_x_out_scalarizer_11176144,
        in_i_data_32 => bb_ethash_search_B4_vunroll_x_out_scalarizer_01177146,
        in_i_data_33 => bb_ethash_search_B4_vunroll_x_out_scalarizer_11178148,
        in_i_data_34 => bb_ethash_search_B4_vunroll_x_out_scalarizer_01179150,
        in_i_data_35 => bb_ethash_search_B4_vunroll_x_out_scalarizer_11180152,
        in_i_data_36 => bb_ethash_search_B4_vunroll_x_out_i18_0908154,
        in_i_data_37 => bb_ethash_search_B4_vunroll_x_out_cmp23157,
        in_i_data_38 => bb_ethash_search_B4_vunroll_x_out_cmp23_xor159,
        in_i_data_39 => bb_ethash_search_B4_vunroll_x_out_l_grpid_0_addr_zext161,
        in_i_data_40 => bb_ethash_search_B4_vunroll_x_out_arrayidx45_RM163,
        in_i_data_41 => bb_ethash_search_B4_vunroll_x_out_arrayidx36_2_RM165,
        in_i_data_42 => bb_ethash_search_B4_vunroll_x_out_idxprom80_RM,
        in_i_data_43 => bb_ethash_search_B4_vunroll_x_out_scalarizer_0xor1200,
        in_i_data_44 => bb_ethash_search_B4_vunroll_x_out_scalarizer_1xor1201,
        in_i_data_45 => bb_ethash_search_B4_vunroll_x_out_scalarizer_2xor,
        in_i_data_46 => bb_ethash_search_B4_vunroll_x_out_scalarizer_3xor,
        in_i_data_47 => bb_ethash_search_B4_vunroll_x_out_global_id_0194,
        in_i_stall => bb_ethash_search_B5_out_stall_out_0,
        in_i_valid => bb_ethash_search_B4_vunroll_x_out_valid_out_1,
        out_o_data_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_9,
        out_o_data_10 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_10,
        out_o_data_11 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_11,
        out_o_data_12 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_12,
        out_o_data_13 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_13,
        out_o_data_14 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_14,
        out_o_data_15 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_15,
        out_o_data_16 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_16,
        out_o_data_17 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_17,
        out_o_data_18 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_18,
        out_o_data_19 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_19,
        out_o_data_20 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_20,
        out_o_data_21 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_21,
        out_o_data_22 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_22,
        out_o_data_23 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_23,
        out_o_data_24 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_24,
        out_o_data_25 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_25,
        out_o_data_26 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_26,
        out_o_data_27 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_27,
        out_o_data_28 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_28,
        out_o_data_29 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_29,
        out_o_data_30 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_30,
        out_o_data_31 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_31,
        out_o_data_32 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_32,
        out_o_data_33 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_33,
        out_o_data_34 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_34,
        out_o_data_35 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_35,
        out_o_data_36 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_36,
        out_o_data_37 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_37,
        out_o_data_38 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_38,
        out_o_data_39 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_39,
        out_o_data_40 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_40,
        out_o_data_41 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_41,
        out_o_data_42 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_42,
        out_o_data_43 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_43,
        out_o_data_44 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_44,
        out_o_data_45 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_45,
        out_o_data_46 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_46,
        out_o_data_47 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_47,
        out_o_stall => bb_ethash_search_B5_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_ethash_search_B5_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_search_B5(BLACKBOX,66)
    thebb_ethash_search_B5 : bb_ethash_search_B5
    PORT MAP (
        in_arrayidx36_2_RM164_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_41,
        in_arrayidx45_RM162_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_40,
        in_barrier_unnamed_ethash_search36_wgs_workgroup_size => in_workgroup_size,
        in_barrier_unnamed_ethash_search40_wgs_workgroup_size => in_workgroup_size,
        in_c0_exe1104_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_18,
        in_c0_exe2109_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_19,
        in_c0_exe3113_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_20,
        in_c0_exe4117_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_21,
        in_cmp23156_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_37,
        in_cmp23_xor158_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_38,
        in_flush => in_start,
        in_fpgaindvars_iv12135_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_27,
        in_g_dag => in_arg_g_dag,
        in_g_output => in_arg_g_output,
        in_global_id_0193_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_47,
        in_i18_0908153_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_36,
        in_idxprom80_RM167_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_42,
        in_l_grpid_04_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_0,
        in_l_grpid_0_addr10_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_1,
        in_l_grpid_0_addr_zext160_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_39,
        in_memcoalesce_null_load_016_avm_readdata => in_memcoalesce_null_load_016_avm_readdata,
        in_memcoalesce_null_load_016_avm_readdatavalid => in_memcoalesce_null_load_016_avm_readdatavalid,
        in_memcoalesce_null_load_016_avm_waitrequest => in_memcoalesce_null_load_016_avm_waitrequest,
        in_memcoalesce_null_load_016_avm_writeack => in_memcoalesce_null_load_016_avm_writeack,
        in_memcoalesce_null_load_0_avm_readdata => in_memcoalesce_null_load_0_avm_readdata,
        in_memcoalesce_null_load_0_avm_readdatavalid => in_memcoalesce_null_load_0_avm_readdatavalid,
        in_memcoalesce_null_load_0_avm_waitrequest => in_memcoalesce_null_load_0_avm_waitrequest,
        in_memcoalesce_null_load_0_avm_writeack => in_memcoalesce_null_load_0_avm_writeack,
        in_memdep_205_avm_readdata => in_memdep_205_avm_readdata,
        in_memdep_205_avm_readdatavalid => in_memdep_205_avm_readdatavalid,
        in_memdep_205_avm_waitrequest => in_memdep_205_avm_waitrequest,
        in_memdep_205_avm_writeack => in_memdep_205_avm_writeack,
        in_scalarizer_0100163_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_10,
        in_scalarizer_0100373_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_12,
        in_scalarizer_0100583_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_14,
        in_scalarizer_0100793_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_16,
        in_scalarizer_01173137_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_28,
        in_scalarizer_01175141_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_30,
        in_scalarizer_01177145_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_32,
        in_scalarizer_01179149_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_34,
        in_scalarizer_099323_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_2,
        in_scalarizer_099533_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_4,
        in_scalarizer_099743_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_6,
        in_scalarizer_099953_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_8,
        in_scalarizer_0xor1200168_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_43,
        in_scalarizer_1100058_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_9,
        in_scalarizer_1100268_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_11,
        in_scalarizer_1100478_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_13,
        in_scalarizer_1100688_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_15,
        in_scalarizer_1100898_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_17,
        in_scalarizer_11174139_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_29,
        in_scalarizer_11176143_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_31,
        in_scalarizer_11178147_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_33,
        in_scalarizer_11180151_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_35,
        in_scalarizer_199428_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_3,
        in_scalarizer_199638_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_5,
        in_scalarizer_199848_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_7,
        in_scalarizer_1xor1201169_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_44,
        in_scalarizer_2xor170_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_45,
        in_scalarizer_3xor171_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_46,
        in_stall_in_0 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_stall,
        in_stall_in_1 => bb_ethash_search_B3_sr_0_aunroll_x_out_o_stall,
        in_state_0_0_cast121_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_22,
        in_state_4_0_cast124_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_23,
        in_state_5_0_cast127_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_24,
        in_state_6_0_cast130_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_25,
        in_state_7_0_cast133_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_data_26,
        in_target => in_arg_target,
        in_valid_in_0 => bb_ethash_search_B5_sr_0_aunroll_x_out_o_valid,
        out_acl_1413 => bb_ethash_search_B5_out_acl_1413,
        out_acl_1414 => bb_ethash_search_B5_out_acl_1414,
        out_acl_1415 => bb_ethash_search_B5_out_acl_1415,
        out_acl_1416 => bb_ethash_search_B5_out_acl_1416,
        out_c0_exe1104 => bb_ethash_search_B5_out_c0_exe1104,
        out_c0_exe2109 => bb_ethash_search_B5_out_c0_exe2109,
        out_c0_exe3113 => bb_ethash_search_B5_out_c0_exe3113,
        out_c0_exe4117 => bb_ethash_search_B5_out_c0_exe4117,
        out_c1_exe1 => bb_ethash_search_B5_out_c1_exe1,
        out_c1_exe2 => bb_ethash_search_B5_out_c1_exe2,
        out_c1_exe3 => bb_ethash_search_B5_out_c1_exe3,
        out_c1_exe4 => bb_ethash_search_B5_out_c1_exe4,
        out_fpgaindvars_iv_next13 => bb_ethash_search_B5_out_fpgaindvars_iv_next13,
        out_global_id_0193 => bb_ethash_search_B5_out_global_id_0193,
        out_inc123 => bb_ethash_search_B5_out_inc123,
        out_l_grpid_04 => bb_ethash_search_B5_out_l_grpid_04,
        out_l_grpid_0_addr10 => bb_ethash_search_B5_out_l_grpid_0_addr10,
        out_memcoalesce_null_load_016_avm_address => bb_ethash_search_B5_out_memcoalesce_null_load_016_avm_address,
        out_memcoalesce_null_load_016_avm_burstcount => bb_ethash_search_B5_out_memcoalesce_null_load_016_avm_burstcount,
        out_memcoalesce_null_load_016_avm_byteenable => bb_ethash_search_B5_out_memcoalesce_null_load_016_avm_byteenable,
        out_memcoalesce_null_load_016_avm_enable => bb_ethash_search_B5_out_memcoalesce_null_load_016_avm_enable,
        out_memcoalesce_null_load_016_avm_read => bb_ethash_search_B5_out_memcoalesce_null_load_016_avm_read,
        out_memcoalesce_null_load_016_avm_write => bb_ethash_search_B5_out_memcoalesce_null_load_016_avm_write,
        out_memcoalesce_null_load_016_avm_writedata => bb_ethash_search_B5_out_memcoalesce_null_load_016_avm_writedata,
        out_memcoalesce_null_load_0_avm_address => bb_ethash_search_B5_out_memcoalesce_null_load_0_avm_address,
        out_memcoalesce_null_load_0_avm_burstcount => bb_ethash_search_B5_out_memcoalesce_null_load_0_avm_burstcount,
        out_memcoalesce_null_load_0_avm_byteenable => bb_ethash_search_B5_out_memcoalesce_null_load_0_avm_byteenable,
        out_memcoalesce_null_load_0_avm_enable => bb_ethash_search_B5_out_memcoalesce_null_load_0_avm_enable,
        out_memcoalesce_null_load_0_avm_read => bb_ethash_search_B5_out_memcoalesce_null_load_0_avm_read,
        out_memcoalesce_null_load_0_avm_write => bb_ethash_search_B5_out_memcoalesce_null_load_0_avm_write,
        out_memcoalesce_null_load_0_avm_writedata => bb_ethash_search_B5_out_memcoalesce_null_load_0_avm_writedata,
        out_memdep_205_avm_address => bb_ethash_search_B5_out_memdep_205_avm_address,
        out_memdep_205_avm_burstcount => bb_ethash_search_B5_out_memdep_205_avm_burstcount,
        out_memdep_205_avm_byteenable => bb_ethash_search_B5_out_memdep_205_avm_byteenable,
        out_memdep_205_avm_enable => bb_ethash_search_B5_out_memdep_205_avm_enable,
        out_memdep_205_avm_read => bb_ethash_search_B5_out_memdep_205_avm_read,
        out_memdep_205_avm_write => bb_ethash_search_B5_out_memdep_205_avm_write,
        out_memdep_205_avm_writedata => bb_ethash_search_B5_out_memdep_205_avm_writedata,
        out_scalarizer_0100163 => bb_ethash_search_B5_out_scalarizer_0100163,
        out_scalarizer_0100373 => bb_ethash_search_B5_out_scalarizer_0100373,
        out_scalarizer_0100583 => bb_ethash_search_B5_out_scalarizer_0100583,
        out_scalarizer_0100793 => bb_ethash_search_B5_out_scalarizer_0100793,
        out_scalarizer_099323 => bb_ethash_search_B5_out_scalarizer_099323,
        out_scalarizer_099533 => bb_ethash_search_B5_out_scalarizer_099533,
        out_scalarizer_099743 => bb_ethash_search_B5_out_scalarizer_099743,
        out_scalarizer_099953 => bb_ethash_search_B5_out_scalarizer_099953,
        out_scalarizer_1100058 => bb_ethash_search_B5_out_scalarizer_1100058,
        out_scalarizer_1100268 => bb_ethash_search_B5_out_scalarizer_1100268,
        out_scalarizer_1100478 => bb_ethash_search_B5_out_scalarizer_1100478,
        out_scalarizer_1100688 => bb_ethash_search_B5_out_scalarizer_1100688,
        out_scalarizer_1100898 => bb_ethash_search_B5_out_scalarizer_1100898,
        out_scalarizer_199428 => bb_ethash_search_B5_out_scalarizer_199428,
        out_scalarizer_199638 => bb_ethash_search_B5_out_scalarizer_199638,
        out_scalarizer_199848 => bb_ethash_search_B5_out_scalarizer_199848,
        out_stall_out_0 => bb_ethash_search_B5_out_stall_out_0,
        out_state_0_0_cast121 => bb_ethash_search_B5_out_state_0_0_cast121,
        out_state_4_0_cast124 => bb_ethash_search_B5_out_state_4_0_cast124,
        out_state_5_0_cast127 => bb_ethash_search_B5_out_state_5_0_cast127,
        out_state_6_0_cast130 => bb_ethash_search_B5_out_state_6_0_cast130,
        out_state_7_0_cast133 => bb_ethash_search_B5_out_state_7_0_cast133,
        out_valid_out_0 => bb_ethash_search_B5_out_valid_out_0,
        out_valid_out_1 => bb_ethash_search_B5_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_search_B7_sr_0_aunroll_x(BLACKBOX,13)
    thebb_ethash_search_B7_sr_0_aunroll_x : bb_ethash_search_B7_sr_0
    PORT MAP (
        in_i_data_0 => bb_ethash_search_B7_out_c0_exe1153,
        in_i_data_1 => bb_ethash_search_B7_out_c0_exe2154,
        in_i_data_2 => bb_ethash_search_B7_out_c0_exe3155,
        in_i_data_3 => bb_ethash_search_B7_out_c0_exe4156,
        in_i_data_4 => bb_ethash_search_B7_out_c0_exe5157,
        in_i_data_5 => bb_ethash_search_B7_out_c0_exe6158,
        in_i_data_6 => bb_ethash_search_B7_out_c0_exe7159,
        in_i_data_7 => bb_ethash_search_B7_out_c0_exe8160,
        in_i_data_8 => bb_ethash_search_B7_out_c0_exe9161,
        in_i_data_9 => bb_ethash_search_B7_out_c0_exe10162,
        in_i_data_10 => bb_ethash_search_B7_out_c0_exe11163,
        in_i_data_11 => bb_ethash_search_B7_out_c0_exe12164,
        in_i_data_12 => bb_ethash_search_B7_out_c0_exe13165,
        in_i_data_13 => bb_ethash_search_B7_out_c0_exe14166,
        in_i_data_14 => bb_ethash_search_B7_out_c0_exe15167,
        in_i_data_15 => bb_ethash_search_B7_out_c0_exe16168,
        in_i_data_16 => bb_ethash_search_B7_out_c0_exe17169,
        in_i_data_17 => bb_ethash_search_B7_out_c0_exe18170,
        in_i_data_18 => bb_ethash_search_B7_out_c0_exe19171,
        in_i_data_19 => bb_ethash_search_B7_out_c0_exe20172,
        in_i_data_20 => bb_ethash_search_B7_out_c0_exe21173,
        in_i_data_21 => bb_ethash_search_B7_out_c0_exe22174,
        in_i_data_22 => bb_ethash_search_B7_out_c0_exe23175,
        in_i_data_23 => bb_ethash_search_B7_out_c0_exe24176,
        in_i_data_24 => bb_ethash_search_B7_out_c0_exe25177,
        in_i_data_25 => bb_ethash_search_B7_out_c0_exe26178,
        in_i_data_26 => bb_ethash_search_B7_out_c0_exe27179,
        in_i_data_27 => bb_ethash_search_B7_out_c0_exe28180,
        in_i_data_28 => bb_ethash_search_B7_out_c0_exe29181,
        in_i_data_29 => bb_ethash_search_B7_out_c0_exe30182,
        in_i_data_30 => bb_ethash_search_B7_out_c0_exe31183,
        in_i_data_31 => bb_ethash_search_B7_out_c0_exe32184,
        in_i_data_32 => bb_ethash_search_B7_out_c0_exe33185,
        in_i_data_33 => bb_ethash_search_B7_out_c0_exe34186,
        in_i_data_34 => bb_ethash_search_B7_out_c0_exe35187,
        in_i_data_35 => bb_ethash_search_B7_out_l_grpid_02,
        in_i_data_36 => bb_ethash_search_B7_out_c0_exe1102,
        in_i_data_37 => bb_ethash_search_B7_out_state_8_2_cast181,
        in_i_data_38 => bb_ethash_search_B7_out_state_9_2_cast183,
        in_i_data_39 => bb_ethash_search_B7_out_state_10_2_cast185,
        in_i_data_40 => bb_ethash_search_B7_out_state_11_2_cast187,
        in_i_data_41 => bb_ethash_search_B7_out_global_id_0191,
        in_i_stall => bb_ethash_search_B7_out_stall_out_0,
        in_i_valid => bb_ethash_search_B7_out_valid_out_0,
        out_o_data_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_9,
        out_o_data_10 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_10,
        out_o_data_11 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_11,
        out_o_data_12 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_12,
        out_o_data_13 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_13,
        out_o_data_14 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_14,
        out_o_data_15 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_15,
        out_o_data_16 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_16,
        out_o_data_17 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_17,
        out_o_data_18 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_18,
        out_o_data_19 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_19,
        out_o_data_20 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_20,
        out_o_data_21 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_21,
        out_o_data_22 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_22,
        out_o_data_23 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_23,
        out_o_data_24 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_24,
        out_o_data_25 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_25,
        out_o_data_26 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_26,
        out_o_data_27 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_27,
        out_o_data_28 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_28,
        out_o_data_29 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_29,
        out_o_data_30 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_30,
        out_o_data_31 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_31,
        out_o_data_32 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_32,
        out_o_data_33 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_33,
        out_o_data_34 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_34,
        out_o_data_35 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_35,
        out_o_data_36 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_36,
        out_o_data_37 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_37,
        out_o_data_38 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_38,
        out_o_data_39 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_39,
        out_o_data_40 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_40,
        out_o_data_41 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_41,
        out_o_stall => bb_ethash_search_B7_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_ethash_search_B7_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_search_B7(BLACKBOX,68)
    thebb_ethash_search_B7 : bb_ethash_search_B7
    PORT MAP (
        in_arrayidx12_i_i19695_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_28,
        in_arrayidx12_i_i19695_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_28,
        in_arrayidx14_i_i21752_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_33,
        in_arrayidx14_i_i21752_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_33,
        in_arrayidx16_i_i23701_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_27,
        in_arrayidx16_i_i23701_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_27,
        in_arrayidx22_i_i28756_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_32,
        in_arrayidx22_i_i28756_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_32,
        in_arrayidx24_i_i30712_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_26,
        in_arrayidx24_i_i30712_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_26,
        in_arrayidx26_i_i32715_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_25,
        in_arrayidx26_i_i32715_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_25,
        in_arrayidx2_i_i10684_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_31,
        in_arrayidx2_i_i10684_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_31,
        in_arrayidx30_i_i35720_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_24,
        in_arrayidx30_i_i35720_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_24,
        in_arrayidx32_i_i37723_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_23,
        in_arrayidx32_i_i37723_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_23,
        in_arrayidx34_i_i39726_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_22,
        in_arrayidx34_i_i39726_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_22,
        in_arrayidx36_i_i41729_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_21,
        in_arrayidx36_i_i41729_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_21,
        in_arrayidx40_i_i44734_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_20,
        in_arrayidx40_i_i44734_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_20,
        in_arrayidx42_i_i46737_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_19,
        in_arrayidx42_i_i46737_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_19,
        in_arrayidx44_i_i48740_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_18,
        in_arrayidx44_i_i48740_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_18,
        in_arrayidx46_i_i50743_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_17,
        in_arrayidx46_i_i50743_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_17,
        in_arrayidx4_i_i12686_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_30,
        in_arrayidx4_i_i12686_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_30,
        in_arrayidx6_i_i14688_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_29,
        in_arrayidx6_i_i14688_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_29,
        in_c0_exe1102_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_36,
        in_c0_exe1102_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_36,
        in_fpgaindvars_iv_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_0,
        in_fpgaindvars_iv_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_0,
        in_g_output => in_arg_g_output,
        in_global_id_0191_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_41,
        in_global_id_0191_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_41,
        in_l_grpid_02_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_35,
        in_l_grpid_02_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_35,
        in_r_0_i1_ph_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_34,
        in_r_0_i1_ph_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_34,
        in_scalarizer_01218_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_1,
        in_scalarizer_01218_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_1,
        in_scalarizer_01220_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_3,
        in_scalarizer_01220_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_3,
        in_scalarizer_01222_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_5,
        in_scalarizer_01222_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_5,
        in_scalarizer_01224_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_7,
        in_scalarizer_01224_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_7,
        in_scalarizer_01226_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_9,
        in_scalarizer_01226_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_9,
        in_scalarizer_01228_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_11,
        in_scalarizer_01228_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_11,
        in_scalarizer_01230_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_13,
        in_scalarizer_01230_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_13,
        in_scalarizer_01232_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_15,
        in_scalarizer_01232_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_15,
        in_scalarizer_11219_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_2,
        in_scalarizer_11219_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_2,
        in_scalarizer_11221_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_4,
        in_scalarizer_11221_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_4,
        in_scalarizer_11223_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_6,
        in_scalarizer_11223_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_6,
        in_scalarizer_11225_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_8,
        in_scalarizer_11225_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_8,
        in_scalarizer_11227_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_10,
        in_scalarizer_11227_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_10,
        in_scalarizer_11229_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_12,
        in_scalarizer_11229_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_12,
        in_scalarizer_11231_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_14,
        in_scalarizer_11231_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_14,
        in_scalarizer_11233_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_16,
        in_scalarizer_11233_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_16,
        in_stall_in_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_stall,
        in_stall_in_1 => bb_ethash_search_B8_sr_0_aunroll_x_out_o_stall,
        in_state_10_2_cast185_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_39,
        in_state_10_2_cast185_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_39,
        in_state_11_2_cast187_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_40,
        in_state_11_2_cast187_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_40,
        in_state_8_2_cast181_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_37,
        in_state_8_2_cast181_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_37,
        in_state_9_2_cast183_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_data_38,
        in_state_9_2_cast183_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_38,
        in_target => in_arg_target,
        in_valid_in_0 => bb_ethash_search_B7_sr_0_aunroll_x_out_o_valid,
        in_valid_in_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_valid,
        out_c0_exe10162 => bb_ethash_search_B7_out_c0_exe10162,
        out_c0_exe1102 => bb_ethash_search_B7_out_c0_exe1102,
        out_c0_exe11163 => bb_ethash_search_B7_out_c0_exe11163,
        out_c0_exe1153 => bb_ethash_search_B7_out_c0_exe1153,
        out_c0_exe12164 => bb_ethash_search_B7_out_c0_exe12164,
        out_c0_exe13165 => bb_ethash_search_B7_out_c0_exe13165,
        out_c0_exe14166 => bb_ethash_search_B7_out_c0_exe14166,
        out_c0_exe15167 => bb_ethash_search_B7_out_c0_exe15167,
        out_c0_exe16168 => bb_ethash_search_B7_out_c0_exe16168,
        out_c0_exe17169 => bb_ethash_search_B7_out_c0_exe17169,
        out_c0_exe18170 => bb_ethash_search_B7_out_c0_exe18170,
        out_c0_exe19171 => bb_ethash_search_B7_out_c0_exe19171,
        out_c0_exe20172 => bb_ethash_search_B7_out_c0_exe20172,
        out_c0_exe21173 => bb_ethash_search_B7_out_c0_exe21173,
        out_c0_exe2154 => bb_ethash_search_B7_out_c0_exe2154,
        out_c0_exe22174 => bb_ethash_search_B7_out_c0_exe22174,
        out_c0_exe23175 => bb_ethash_search_B7_out_c0_exe23175,
        out_c0_exe24176 => bb_ethash_search_B7_out_c0_exe24176,
        out_c0_exe25177 => bb_ethash_search_B7_out_c0_exe25177,
        out_c0_exe26178 => bb_ethash_search_B7_out_c0_exe26178,
        out_c0_exe27179 => bb_ethash_search_B7_out_c0_exe27179,
        out_c0_exe28180 => bb_ethash_search_B7_out_c0_exe28180,
        out_c0_exe29181 => bb_ethash_search_B7_out_c0_exe29181,
        out_c0_exe30182 => bb_ethash_search_B7_out_c0_exe30182,
        out_c0_exe31183 => bb_ethash_search_B7_out_c0_exe31183,
        out_c0_exe3155 => bb_ethash_search_B7_out_c0_exe3155,
        out_c0_exe32184 => bb_ethash_search_B7_out_c0_exe32184,
        out_c0_exe33185 => bb_ethash_search_B7_out_c0_exe33185,
        out_c0_exe34186 => bb_ethash_search_B7_out_c0_exe34186,
        out_c0_exe35187 => bb_ethash_search_B7_out_c0_exe35187,
        out_c0_exe4156 => bb_ethash_search_B7_out_c0_exe4156,
        out_c0_exe5157 => bb_ethash_search_B7_out_c0_exe5157,
        out_c0_exe6158 => bb_ethash_search_B7_out_c0_exe6158,
        out_c0_exe7159 => bb_ethash_search_B7_out_c0_exe7159,
        out_c0_exe8160 => bb_ethash_search_B7_out_c0_exe8160,
        out_c0_exe9161 => bb_ethash_search_B7_out_c0_exe9161,
        out_global_id_0191 => bb_ethash_search_B7_out_global_id_0191,
        out_l_grpid_02 => bb_ethash_search_B7_out_l_grpid_02,
        out_scalarizer_01232 => bb_ethash_search_B7_out_scalarizer_01232,
        out_scalarizer_11233 => bb_ethash_search_B7_out_scalarizer_11233,
        out_stall_out_0 => bb_ethash_search_B7_out_stall_out_0,
        out_stall_out_1 => bb_ethash_search_B7_out_stall_out_1,
        out_state_10_2_cast185 => bb_ethash_search_B7_out_state_10_2_cast185,
        out_state_11_2_cast187 => bb_ethash_search_B7_out_state_11_2_cast187,
        out_state_8_2_cast181 => bb_ethash_search_B7_out_state_8_2_cast181,
        out_state_9_2_cast183 => bb_ethash_search_B7_out_state_9_2_cast183,
        out_valid_out_0 => bb_ethash_search_B7_out_valid_out_0,
        out_valid_out_1 => bb_ethash_search_B7_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_c_i64_9223372036854775808_x(CONSTANT,19)
    dupName_0_c_i64_9223372036854775808_x_q <= "1000000000000000000000000000000000000000000000000000000000000000";

    -- dupName_0_c_i64_1gr_x(CONSTANT,18)
    dupName_0_c_i64_1gr_x_q <= "0000000000000000000000000000000000000000000000000000000000000001";

    -- dupName_0_c_i64_0gr_x(CONSTANT,17)
    dupName_0_c_i64_0gr_x_q <= "0000000000000000000000000000000000000000000000000000000000000000";

    -- dupName_0_c_i6_23_x(CONSTANT,20)
    dupName_0_c_i6_23_x_q <= "010111";

    -- bb_ethash_search_B7_sr_1_aunroll_x(BLACKBOX,14)
    thebb_ethash_search_B7_sr_1_aunroll_x : bb_ethash_search_B7_sr_1
    PORT MAP (
        in_i_data_0 => dupName_0_c_i6_23_x_q,
        in_i_data_1 => bb_ethash_search_B6_out_scalarizer_099322,
        in_i_data_2 => bb_ethash_search_B6_out_scalarizer_199427,
        in_i_data_3 => bb_ethash_search_B6_out_scalarizer_099532,
        in_i_data_4 => bb_ethash_search_B6_out_scalarizer_199637,
        in_i_data_5 => bb_ethash_search_B6_out_scalarizer_099742,
        in_i_data_6 => bb_ethash_search_B6_out_scalarizer_199847,
        in_i_data_7 => bb_ethash_search_B6_out_scalarizer_099952,
        in_i_data_8 => bb_ethash_search_B6_out_scalarizer_1100057,
        in_i_data_9 => bb_ethash_search_B6_out_scalarizer_0100162,
        in_i_data_10 => bb_ethash_search_B6_out_scalarizer_1100267,
        in_i_data_11 => bb_ethash_search_B6_out_scalarizer_0100372,
        in_i_data_12 => bb_ethash_search_B6_out_scalarizer_1100477,
        in_i_data_13 => bb_ethash_search_B6_out_scalarizer_0100582,
        in_i_data_14 => bb_ethash_search_B6_out_scalarizer_1100687,
        in_i_data_15 => bb_ethash_search_B6_out_scalarizer_0100792,
        in_i_data_16 => bb_ethash_search_B6_out_scalarizer_1100897,
        in_i_data_17 => dupName_0_c_i64_0gr_x_q,
        in_i_data_18 => dupName_0_c_i64_0gr_x_q,
        in_i_data_19 => dupName_0_c_i64_0gr_x_q,
        in_i_data_20 => bb_ethash_search_B6_out_state_9_2_cast,
        in_i_data_21 => dupName_0_c_i64_0gr_x_q,
        in_i_data_22 => dupName_0_c_i64_0gr_x_q,
        in_i_data_23 => dupName_0_c_i64_0gr_x_q,
        in_i_data_24 => bb_ethash_search_B6_out_state_8_2_cast,
        in_i_data_25 => dupName_0_c_i64_0gr_x_q,
        in_i_data_26 => dupName_0_c_i64_0gr_x_q,
        in_i_data_27 => dupName_0_c_i64_0gr_x_q,
        in_i_data_28 => bb_ethash_search_B6_out_state_11_2_cast,
        in_i_data_29 => dupName_0_c_i64_0gr_x_q,
        in_i_data_30 => dupName_0_c_i64_0gr_x_q,
        in_i_data_31 => bb_ethash_search_B6_out_state_10_2_cast,
        in_i_data_32 => dupName_0_c_i64_1gr_x_q,
        in_i_data_33 => dupName_0_c_i64_9223372036854775808_x_q,
        in_i_data_34 => dupName_0_c_i32_0gr_x_q,
        in_i_data_35 => bb_ethash_search_B6_out_l_grpid_03,
        in_i_data_36 => bb_ethash_search_B6_out_c0_exe1103,
        in_i_data_37 => bb_ethash_search_B6_out_state_8_2_cast,
        in_i_data_38 => bb_ethash_search_B6_out_state_9_2_cast,
        in_i_data_39 => bb_ethash_search_B6_out_state_10_2_cast,
        in_i_data_40 => bb_ethash_search_B6_out_state_11_2_cast,
        in_i_data_41 => bb_ethash_search_B6_out_global_id_0192,
        in_i_stall => bb_ethash_search_B7_out_stall_out_1,
        in_i_valid => loop_limiter_ethash_search2_out_o_valid,
        out_o_data_0 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_9,
        out_o_data_10 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_10,
        out_o_data_11 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_11,
        out_o_data_12 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_12,
        out_o_data_13 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_13,
        out_o_data_14 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_14,
        out_o_data_15 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_15,
        out_o_data_16 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_16,
        out_o_data_17 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_17,
        out_o_data_18 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_18,
        out_o_data_19 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_19,
        out_o_data_20 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_20,
        out_o_data_21 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_21,
        out_o_data_22 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_22,
        out_o_data_23 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_23,
        out_o_data_24 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_24,
        out_o_data_25 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_25,
        out_o_data_26 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_26,
        out_o_data_27 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_27,
        out_o_data_28 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_28,
        out_o_data_29 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_29,
        out_o_data_30 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_30,
        out_o_data_31 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_31,
        out_o_data_32 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_32,
        out_o_data_33 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_33,
        out_o_data_34 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_34,
        out_o_data_35 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_35,
        out_o_data_36 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_36,
        out_o_data_37 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_37,
        out_o_data_38 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_38,
        out_o_data_39 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_39,
        out_o_data_40 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_40,
        out_o_data_41 => bb_ethash_search_B7_sr_1_aunroll_x_out_o_data_41,
        out_o_stall => bb_ethash_search_B7_sr_1_aunroll_x_out_o_stall,
        out_o_valid => bb_ethash_search_B7_sr_1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- loop_limiter_ethash_search2(BLACKBOX,177)
    theloop_limiter_ethash_search2 : loop_limiter_ethash_search2
    PORT MAP (
        in_i_stall => bb_ethash_search_B7_sr_1_aunroll_x_out_o_stall,
        in_i_stall_exit => bb_ethash_search_B8_sr_0_aunroll_x_out_o_stall,
        in_i_valid => bb_ethash_search_B6_out_valid_out_0,
        in_i_valid_exit => bb_ethash_search_B7_out_valid_out_1,
        out_o_stall => loop_limiter_ethash_search2_out_o_stall,
        out_o_valid => loop_limiter_ethash_search2_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_search_B6(BLACKBOX,67)
    thebb_ethash_search_B6 : bb_ethash_search_B6
    PORT MAP (
        in_acl_1413178_0 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_24,
        in_acl_1414179_0 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_25,
        in_acl_1415176_0 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_22,
        in_acl_1416177_0 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_23,
        in_c0_exe1103_0 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_17,
        in_c1_exe1172_0 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_18,
        in_c1_exe2173_0 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_19,
        in_c1_exe3174_0 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_20,
        in_c1_exe4175_0 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_21,
        in_g_output => in_arg_g_output,
        in_global_id_0192_0 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_26,
        in_l_grpid_03_0 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_0,
        in_scalarizer_0100162_0 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_9,
        in_scalarizer_0100372_0 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_11,
        in_scalarizer_0100582_0 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_13,
        in_scalarizer_0100792_0 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_15,
        in_scalarizer_099322_0 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_1,
        in_scalarizer_099532_0 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_3,
        in_scalarizer_099742_0 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_5,
        in_scalarizer_099952_0 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_7,
        in_scalarizer_1100057_0 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_8,
        in_scalarizer_1100267_0 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_10,
        in_scalarizer_1100477_0 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_12,
        in_scalarizer_1100687_0 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_14,
        in_scalarizer_1100897_0 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_16,
        in_scalarizer_199427_0 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_2,
        in_scalarizer_199637_0 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_4,
        in_scalarizer_199847_0 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_6,
        in_stall_in_0 => loop_limiter_ethash_search2_out_o_stall,
        in_target => in_arg_target,
        in_valid_in_0 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_valid,
        out_c0_exe1103 => bb_ethash_search_B6_out_c0_exe1103,
        out_global_id_0192 => bb_ethash_search_B6_out_global_id_0192,
        out_l_grpid_03 => bb_ethash_search_B6_out_l_grpid_03,
        out_scalarizer_0100162 => bb_ethash_search_B6_out_scalarizer_0100162,
        out_scalarizer_0100372 => bb_ethash_search_B6_out_scalarizer_0100372,
        out_scalarizer_0100582 => bb_ethash_search_B6_out_scalarizer_0100582,
        out_scalarizer_0100792 => bb_ethash_search_B6_out_scalarizer_0100792,
        out_scalarizer_099322 => bb_ethash_search_B6_out_scalarizer_099322,
        out_scalarizer_099532 => bb_ethash_search_B6_out_scalarizer_099532,
        out_scalarizer_099742 => bb_ethash_search_B6_out_scalarizer_099742,
        out_scalarizer_099952 => bb_ethash_search_B6_out_scalarizer_099952,
        out_scalarizer_1100057 => bb_ethash_search_B6_out_scalarizer_1100057,
        out_scalarizer_1100267 => bb_ethash_search_B6_out_scalarizer_1100267,
        out_scalarizer_1100477 => bb_ethash_search_B6_out_scalarizer_1100477,
        out_scalarizer_1100687 => bb_ethash_search_B6_out_scalarizer_1100687,
        out_scalarizer_1100897 => bb_ethash_search_B6_out_scalarizer_1100897,
        out_scalarizer_199427 => bb_ethash_search_B6_out_scalarizer_199427,
        out_scalarizer_199637 => bb_ethash_search_B6_out_scalarizer_199637,
        out_scalarizer_199847 => bb_ethash_search_B6_out_scalarizer_199847,
        out_stall_out_0 => bb_ethash_search_B6_out_stall_out_0,
        out_state_10_2_cast => bb_ethash_search_B6_out_state_10_2_cast,
        out_state_11_2_cast => bb_ethash_search_B6_out_state_11_2_cast,
        out_state_8_2_cast => bb_ethash_search_B6_out_state_8_2_cast,
        out_state_9_2_cast => bb_ethash_search_B6_out_state_9_2_cast,
        out_valid_out_0 => bb_ethash_search_B6_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_search_B6_sr_0_aunroll_x(BLACKBOX,12)
    thebb_ethash_search_B6_sr_0_aunroll_x : bb_ethash_search_B6_sr_0
    PORT MAP (
        in_i_data_0 => bb_ethash_search_B5_out_l_grpid_04,
        in_i_data_1 => bb_ethash_search_B5_out_scalarizer_099323,
        in_i_data_2 => bb_ethash_search_B5_out_scalarizer_199428,
        in_i_data_3 => bb_ethash_search_B5_out_scalarizer_099533,
        in_i_data_4 => bb_ethash_search_B5_out_scalarizer_199638,
        in_i_data_5 => bb_ethash_search_B5_out_scalarizer_099743,
        in_i_data_6 => bb_ethash_search_B5_out_scalarizer_199848,
        in_i_data_7 => bb_ethash_search_B5_out_scalarizer_099953,
        in_i_data_8 => bb_ethash_search_B5_out_scalarizer_1100058,
        in_i_data_9 => bb_ethash_search_B5_out_scalarizer_0100163,
        in_i_data_10 => bb_ethash_search_B5_out_scalarizer_1100268,
        in_i_data_11 => bb_ethash_search_B5_out_scalarizer_0100373,
        in_i_data_12 => bb_ethash_search_B5_out_scalarizer_1100478,
        in_i_data_13 => bb_ethash_search_B5_out_scalarizer_0100583,
        in_i_data_14 => bb_ethash_search_B5_out_scalarizer_1100688,
        in_i_data_15 => bb_ethash_search_B5_out_scalarizer_0100793,
        in_i_data_16 => bb_ethash_search_B5_out_scalarizer_1100898,
        in_i_data_17 => bb_ethash_search_B5_out_c0_exe1104,
        in_i_data_18 => bb_ethash_search_B5_out_c1_exe1,
        in_i_data_19 => bb_ethash_search_B5_out_c1_exe2,
        in_i_data_20 => bb_ethash_search_B5_out_c1_exe3,
        in_i_data_21 => bb_ethash_search_B5_out_c1_exe4,
        in_i_data_22 => bb_ethash_search_B5_out_acl_1415,
        in_i_data_23 => bb_ethash_search_B5_out_acl_1416,
        in_i_data_24 => bb_ethash_search_B5_out_acl_1413,
        in_i_data_25 => bb_ethash_search_B5_out_acl_1414,
        in_i_data_26 => bb_ethash_search_B5_out_global_id_0193,
        in_i_stall => bb_ethash_search_B6_out_stall_out_0,
        in_i_valid => bb_ethash_search_B5_out_valid_out_0,
        out_o_data_0 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_9,
        out_o_data_10 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_10,
        out_o_data_11 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_11,
        out_o_data_12 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_12,
        out_o_data_13 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_13,
        out_o_data_14 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_14,
        out_o_data_15 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_15,
        out_o_data_16 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_16,
        out_o_data_17 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_17,
        out_o_data_18 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_18,
        out_o_data_19 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_19,
        out_o_data_20 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_20,
        out_o_data_21 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_21,
        out_o_data_22 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_22,
        out_o_data_23 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_23,
        out_o_data_24 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_24,
        out_o_data_25 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_25,
        out_o_data_26 => bb_ethash_search_B6_sr_0_aunroll_x_out_o_data_26,
        out_o_stall => bb_ethash_search_B6_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_ethash_search_B6_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- c_i4_6gr(CONSTANT,74)
    c_i4_6gr_q <= "0110";

    -- bb_ethash_search_B3_sr_1_aunroll_x(BLACKBOX,9)
    thebb_ethash_search_B3_sr_1_aunroll_x : bb_ethash_search_B3_sr_1
    PORT MAP (
        in_i_data_0 => c_i4_6gr_q,
        in_i_data_1 => bb_ethash_search_B2_out_scalarizer_014,
        in_i_data_2 => bb_ethash_search_B2_out_scalarizer_115,
        in_i_data_3 => bb_ethash_search_B2_out_scalarizer_098716,
        in_i_data_4 => bb_ethash_search_B2_out_scalarizer_198817,
        in_i_data_5 => bb_ethash_search_B2_out_scalarizer_098918,
        in_i_data_6 => bb_ethash_search_B2_out_scalarizer_199019,
        in_i_data_7 => bb_ethash_search_B2_out_scalarizer_099120,
        in_i_data_8 => bb_ethash_search_B2_out_scalarizer_199221,
        in_i_data_9 => dupName_0_c_i32_0gr_x_q,
        in_i_data_10 => bb_ethash_search_B2_out_l_grpid_07,
        in_i_data_11 => bb_ethash_search_B2_out_l_grpid_0_addr12,
        in_i_data_12 => bb_ethash_search_B2_out_scalarizer_099326,
        in_i_data_13 => bb_ethash_search_B2_out_scalarizer_199431,
        in_i_data_14 => bb_ethash_search_B2_out_scalarizer_099536,
        in_i_data_15 => bb_ethash_search_B2_out_scalarizer_199641,
        in_i_data_16 => bb_ethash_search_B2_out_scalarizer_099746,
        in_i_data_17 => bb_ethash_search_B2_out_scalarizer_199851,
        in_i_data_18 => bb_ethash_search_B2_out_scalarizer_099956,
        in_i_data_19 => bb_ethash_search_B2_out_scalarizer_1100061,
        in_i_data_20 => bb_ethash_search_B2_out_scalarizer_0100166,
        in_i_data_21 => bb_ethash_search_B2_out_scalarizer_1100271,
        in_i_data_22 => bb_ethash_search_B2_out_scalarizer_0100376,
        in_i_data_23 => bb_ethash_search_B2_out_scalarizer_1100481,
        in_i_data_24 => bb_ethash_search_B2_out_scalarizer_0100586,
        in_i_data_25 => bb_ethash_search_B2_out_scalarizer_1100691,
        in_i_data_26 => bb_ethash_search_B2_out_scalarizer_0100796,
        in_i_data_27 => bb_ethash_search_B2_out_scalarizer_11008101,
        in_i_data_28 => bb_ethash_search_B2_out_c0_exe1107,
        in_i_data_29 => bb_ethash_search_B2_out_c0_exe2111,
        in_i_data_30 => bb_ethash_search_B2_out_c0_exe3115,
        in_i_data_31 => bb_ethash_search_B2_out_c0_exe4119,
        in_i_data_32 => bb_ethash_search_B2_out_state_0_0_cast,
        in_i_data_33 => bb_ethash_search_B2_out_state_4_0_cast,
        in_i_data_34 => bb_ethash_search_B2_out_state_5_0_cast,
        in_i_data_35 => bb_ethash_search_B2_out_state_6_0_cast,
        in_i_data_36 => bb_ethash_search_B2_out_state_7_0_cast,
        in_i_data_37 => bb_ethash_search_B2_out_global_id_0196,
        in_i_stall => bb_ethash_search_B3_vunroll_x_out_stall_out_1,
        in_i_valid => loop_limiter_ethash_search1_out_o_valid,
        out_o_data_0 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_9,
        out_o_data_10 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_10,
        out_o_data_11 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_11,
        out_o_data_12 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_12,
        out_o_data_13 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_13,
        out_o_data_14 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_14,
        out_o_data_15 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_15,
        out_o_data_16 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_16,
        out_o_data_17 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_17,
        out_o_data_18 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_18,
        out_o_data_19 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_19,
        out_o_data_20 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_20,
        out_o_data_21 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_21,
        out_o_data_22 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_22,
        out_o_data_23 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_23,
        out_o_data_24 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_24,
        out_o_data_25 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_25,
        out_o_data_26 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_26,
        out_o_data_27 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_27,
        out_o_data_28 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_28,
        out_o_data_29 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_29,
        out_o_data_30 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_30,
        out_o_data_31 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_31,
        out_o_data_32 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_32,
        out_o_data_33 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_33,
        out_o_data_34 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_34,
        out_o_data_35 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_35,
        out_o_data_36 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_36,
        out_o_data_37 => bb_ethash_search_B3_sr_1_aunroll_x_out_o_data_37,
        out_o_stall => bb_ethash_search_B3_sr_1_aunroll_x_out_o_stall,
        out_o_valid => bb_ethash_search_B3_sr_1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- loop_limiter_ethash_search1(BLACKBOX,176)
    theloop_limiter_ethash_search1 : loop_limiter_ethash_search1
    PORT MAP (
        in_i_stall => bb_ethash_search_B3_sr_1_aunroll_x_out_o_stall,
        in_i_stall_exit => bb_ethash_search_B6_sr_0_aunroll_x_out_o_stall,
        in_i_valid => bb_ethash_search_B2_out_valid_out_0,
        in_i_valid_exit => bb_ethash_search_B5_out_valid_out_0,
        out_o_stall => loop_limiter_ethash_search1_out_o_stall,
        out_o_valid => loop_limiter_ethash_search1_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_search_B2(BLACKBOX,65)
    thebb_ethash_search_B2 : bb_ethash_search_B2
    PORT MAP (
        in_c0_exe1107_0 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_26,
        in_c0_exe2111_0 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_27,
        in_c0_exe3115_0 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_28,
        in_c0_exe4119_0 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_29,
        in_g_dag => in_arg_g_dag,
        in_g_output => in_arg_g_output,
        in_global_id_0196_0 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_30,
        in_l_grpid_07_0 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_0,
        in_l_grpid_0_addr12_0 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_1,
        in_scalarizer_0100166_0 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_18,
        in_scalarizer_0100376_0 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_20,
        in_scalarizer_0100586_0 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_22,
        in_scalarizer_0100796_0 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_24,
        in_scalarizer_014_0 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_2,
        in_scalarizer_098716_0 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_4,
        in_scalarizer_098918_0 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_6,
        in_scalarizer_099120_0 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_8,
        in_scalarizer_099326_0 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_10,
        in_scalarizer_099536_0 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_12,
        in_scalarizer_099746_0 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_14,
        in_scalarizer_099956_0 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_16,
        in_scalarizer_1100061_0 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_17,
        in_scalarizer_1100271_0 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_19,
        in_scalarizer_1100481_0 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_21,
        in_scalarizer_1100691_0 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_23,
        in_scalarizer_11008101_0 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_25,
        in_scalarizer_115_0 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_3,
        in_scalarizer_198817_0 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_5,
        in_scalarizer_199019_0 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_7,
        in_scalarizer_199221_0 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_9,
        in_scalarizer_199431_0 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_11,
        in_scalarizer_199641_0 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_13,
        in_scalarizer_199851_0 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_15,
        in_stall_in_0 => loop_limiter_ethash_search1_out_o_stall,
        in_target => in_arg_target,
        in_valid_in_0 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_valid,
        out_c0_exe1107 => bb_ethash_search_B2_out_c0_exe1107,
        out_c0_exe2111 => bb_ethash_search_B2_out_c0_exe2111,
        out_c0_exe3115 => bb_ethash_search_B2_out_c0_exe3115,
        out_c0_exe4119 => bb_ethash_search_B2_out_c0_exe4119,
        out_global_id_0196 => bb_ethash_search_B2_out_global_id_0196,
        out_l_grpid_07 => bb_ethash_search_B2_out_l_grpid_07,
        out_l_grpid_0_addr12 => bb_ethash_search_B2_out_l_grpid_0_addr12,
        out_scalarizer_0100166 => bb_ethash_search_B2_out_scalarizer_0100166,
        out_scalarizer_0100376 => bb_ethash_search_B2_out_scalarizer_0100376,
        out_scalarizer_0100586 => bb_ethash_search_B2_out_scalarizer_0100586,
        out_scalarizer_0100796 => bb_ethash_search_B2_out_scalarizer_0100796,
        out_scalarizer_014 => bb_ethash_search_B2_out_scalarizer_014,
        out_scalarizer_098716 => bb_ethash_search_B2_out_scalarizer_098716,
        out_scalarizer_098918 => bb_ethash_search_B2_out_scalarizer_098918,
        out_scalarizer_099120 => bb_ethash_search_B2_out_scalarizer_099120,
        out_scalarizer_099326 => bb_ethash_search_B2_out_scalarizer_099326,
        out_scalarizer_099536 => bb_ethash_search_B2_out_scalarizer_099536,
        out_scalarizer_099746 => bb_ethash_search_B2_out_scalarizer_099746,
        out_scalarizer_099956 => bb_ethash_search_B2_out_scalarizer_099956,
        out_scalarizer_1100061 => bb_ethash_search_B2_out_scalarizer_1100061,
        out_scalarizer_1100271 => bb_ethash_search_B2_out_scalarizer_1100271,
        out_scalarizer_1100481 => bb_ethash_search_B2_out_scalarizer_1100481,
        out_scalarizer_1100691 => bb_ethash_search_B2_out_scalarizer_1100691,
        out_scalarizer_11008101 => bb_ethash_search_B2_out_scalarizer_11008101,
        out_scalarizer_115 => bb_ethash_search_B2_out_scalarizer_115,
        out_scalarizer_198817 => bb_ethash_search_B2_out_scalarizer_198817,
        out_scalarizer_199019 => bb_ethash_search_B2_out_scalarizer_199019,
        out_scalarizer_199221 => bb_ethash_search_B2_out_scalarizer_199221,
        out_scalarizer_199431 => bb_ethash_search_B2_out_scalarizer_199431,
        out_scalarizer_199641 => bb_ethash_search_B2_out_scalarizer_199641,
        out_scalarizer_199851 => bb_ethash_search_B2_out_scalarizer_199851,
        out_stall_out_0 => bb_ethash_search_B2_out_stall_out_0,
        out_state_0_0_cast => bb_ethash_search_B2_out_state_0_0_cast,
        out_state_4_0_cast => bb_ethash_search_B2_out_state_4_0_cast,
        out_state_5_0_cast => bb_ethash_search_B2_out_state_5_0_cast,
        out_state_6_0_cast => bb_ethash_search_B2_out_state_6_0_cast,
        out_state_7_0_cast => bb_ethash_search_B2_out_state_7_0_cast,
        out_valid_out_0 => bb_ethash_search_B2_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_search_B2_sr_0_aunroll_x(BLACKBOX,6)
    thebb_ethash_search_B2_sr_0_aunroll_x : bb_ethash_search_B2_sr_0
    PORT MAP (
        in_i_data_0 => bb_ethash_search_B1_out_l_grpid_08,
        in_i_data_1 => bb_ethash_search_B1_out_l_grpid_0_addr13,
        in_i_data_2 => bb_ethash_search_B1_out_scalarizer_0,
        in_i_data_3 => bb_ethash_search_B1_out_scalarizer_1,
        in_i_data_4 => bb_ethash_search_B1_out_scalarizer_0987,
        in_i_data_5 => bb_ethash_search_B1_out_scalarizer_1988,
        in_i_data_6 => bb_ethash_search_B1_out_scalarizer_0989,
        in_i_data_7 => bb_ethash_search_B1_out_scalarizer_1990,
        in_i_data_8 => bb_ethash_search_B1_out_scalarizer_0991,
        in_i_data_9 => bb_ethash_search_B1_out_scalarizer_1992,
        in_i_data_10 => bb_ethash_search_B1_out_scalarizer_0993,
        in_i_data_11 => bb_ethash_search_B1_out_scalarizer_1994,
        in_i_data_12 => bb_ethash_search_B1_out_scalarizer_0995,
        in_i_data_13 => bb_ethash_search_B1_out_scalarizer_1996,
        in_i_data_14 => bb_ethash_search_B1_out_scalarizer_0997,
        in_i_data_15 => bb_ethash_search_B1_out_scalarizer_1998,
        in_i_data_16 => bb_ethash_search_B1_out_scalarizer_0999,
        in_i_data_17 => bb_ethash_search_B1_out_scalarizer_11000,
        in_i_data_18 => bb_ethash_search_B1_out_scalarizer_01001,
        in_i_data_19 => bb_ethash_search_B1_out_scalarizer_11002,
        in_i_data_20 => bb_ethash_search_B1_out_scalarizer_01003,
        in_i_data_21 => bb_ethash_search_B1_out_scalarizer_11004,
        in_i_data_22 => bb_ethash_search_B1_out_scalarizer_01005,
        in_i_data_23 => bb_ethash_search_B1_out_scalarizer_11006,
        in_i_data_24 => bb_ethash_search_B1_out_scalarizer_01007,
        in_i_data_25 => bb_ethash_search_B1_out_scalarizer_11008,
        in_i_data_26 => bb_ethash_search_B1_out_c0_exe1,
        in_i_data_27 => bb_ethash_search_B1_out_c0_exe2,
        in_i_data_28 => bb_ethash_search_B1_out_c0_exe3,
        in_i_data_29 => bb_ethash_search_B1_out_c0_exe4,
        in_i_data_30 => bb_ethash_search_B1_out_global_id_0197,
        in_i_stall => bb_ethash_search_B2_out_stall_out_0,
        in_i_valid => bb_ethash_search_B1_out_valid_out_1,
        out_o_data_0 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_9,
        out_o_data_10 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_10,
        out_o_data_11 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_11,
        out_o_data_12 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_12,
        out_o_data_13 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_13,
        out_o_data_14 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_14,
        out_o_data_15 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_15,
        out_o_data_16 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_16,
        out_o_data_17 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_17,
        out_o_data_18 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_18,
        out_o_data_19 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_19,
        out_o_data_20 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_20,
        out_o_data_21 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_21,
        out_o_data_22 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_22,
        out_o_data_23 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_23,
        out_o_data_24 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_24,
        out_o_data_25 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_25,
        out_o_data_26 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_26,
        out_o_data_27 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_27,
        out_o_data_28 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_28,
        out_o_data_29 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_29,
        out_o_data_30 => bb_ethash_search_B2_sr_0_aunroll_x_out_o_data_30,
        out_o_stall => bb_ethash_search_B2_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_ethash_search_B2_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- c_i32_1gr(CONSTANT,71)
    c_i32_1gr_q <= "00000000000000000000000000000001";

    -- c_i32_2147483648(CONSTANT,72)
    c_i32_2147483648_q <= "10000000000000000000000000000000";

    -- bb_ethash_search_B1_sr_1_aunroll_x(BLACKBOX,5)
    thebb_ethash_search_B1_sr_1_aunroll_x : bb_ethash_search_B1_sr_1
    PORT MAP (
        in_i_data_0 => dupName_0_c_i6_23_x_q,
        in_i_data_1 => dupName_0_c_i32_0gr_x_q,
        in_i_data_2 => dupName_0_c_i32_0gr_x_q,
        in_i_data_3 => dupName_0_c_i32_0gr_x_q,
        in_i_data_4 => dupName_0_c_i32_0gr_x_q,
        in_i_data_5 => dupName_0_c_i32_0gr_x_q,
        in_i_data_6 => dupName_0_c_i32_0gr_x_q,
        in_i_data_7 => dupName_0_c_i32_0gr_x_q,
        in_i_data_8 => c_i32_2147483648_q,
        in_i_data_9 => dupName_0_c_i32_0gr_x_q,
        in_i_data_10 => dupName_0_c_i32_0gr_x_q,
        in_i_data_11 => dupName_0_c_i32_0gr_x_q,
        in_i_data_12 => dupName_0_c_i32_0gr_x_q,
        in_i_data_13 => c_i32_1gr_q,
        in_i_data_14 => dupName_0_c_i32_0gr_x_q,
        in_i_data_15 => bb_ethash_search_B0_out_acl_0985,
        in_i_data_16 => bb_ethash_search_B0_out_acl_1986,
        in_i_data_17 => bb_ethash_search_B0_out_acl_0983,
        in_i_data_18 => bb_ethash_search_B0_out_acl_1984,
        in_i_data_19 => bb_ethash_search_B0_out_acl_0981,
        in_i_data_20 => bb_ethash_search_B0_out_acl_1982,
        in_i_data_21 => bb_ethash_search_B0_out_acl_0979,
        in_i_data_22 => bb_ethash_search_B0_out_acl_1980,
        in_i_data_23 => bb_ethash_search_B0_out_acl_0,
        in_i_data_24 => bb_ethash_search_B0_out_acl_1,
        in_i_data_25 => dupName_0_c_i64_0gr_x_q,
        in_i_data_26 => dupName_0_c_i64_0gr_x_q,
        in_i_data_27 => dupName_0_c_i64_0gr_x_q,
        in_i_data_28 => dupName_0_c_i64_0gr_x_q,
        in_i_data_29 => bb_ethash_search_B0_out_add,
        in_i_data_30 => dupName_0_c_i64_0gr_x_q,
        in_i_data_31 => dupName_0_c_i64_0gr_x_q,
        in_i_data_32 => dupName_0_c_i64_0gr_x_q,
        in_i_data_33 => dupName_0_c_i64_0gr_x_q,
        in_i_data_34 => dupName_0_c_i64_0gr_x_q,
        in_i_data_35 => dupName_0_c_i64_0gr_x_q,
        in_i_data_36 => dupName_0_c_i64_0gr_x_q,
        in_i_data_37 => dupName_0_c_i64_0gr_x_q,
        in_i_data_38 => dupName_0_c_i64_0gr_x_q,
        in_i_data_39 => dupName_0_c_i64_0gr_x_q,
        in_i_data_40 => dupName_0_c_i64_0gr_x_q,
        in_i_data_41 => dupName_0_c_i64_0gr_x_q,
        in_i_data_42 => dupName_0_c_i64_0gr_x_q,
        in_i_data_43 => dupName_0_c_i64_0gr_x_q,
        in_i_data_44 => dupName_0_c_i64_9223372036854775808_x_q,
        in_i_data_45 => dupName_0_c_i64_1gr_x_q,
        in_i_data_46 => dupName_0_c_i32_0gr_x_q,
        in_i_data_47 => bb_ethash_search_B0_out_l_grpid_0,
        in_i_data_48 => bb_ethash_search_B0_out_l_grpid_0_addr,
        in_i_data_49 => bb_ethash_search_B0_out_global_id_0,
        in_i_stall => bb_ethash_search_B1_out_stall_out_1,
        in_i_valid => loop_limiter_ethash_search0_out_o_valid,
        out_o_data_0 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_9,
        out_o_data_10 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_10,
        out_o_data_11 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_11,
        out_o_data_12 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_12,
        out_o_data_13 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_13,
        out_o_data_14 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_14,
        out_o_data_15 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_15,
        out_o_data_16 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_16,
        out_o_data_17 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_17,
        out_o_data_18 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_18,
        out_o_data_19 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_19,
        out_o_data_20 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_20,
        out_o_data_21 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_21,
        out_o_data_22 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_22,
        out_o_data_23 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_23,
        out_o_data_24 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_24,
        out_o_data_25 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_25,
        out_o_data_26 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_26,
        out_o_data_27 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_27,
        out_o_data_28 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_28,
        out_o_data_29 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_29,
        out_o_data_30 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_30,
        out_o_data_31 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_31,
        out_o_data_32 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_32,
        out_o_data_33 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_33,
        out_o_data_34 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_34,
        out_o_data_35 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_35,
        out_o_data_36 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_36,
        out_o_data_37 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_37,
        out_o_data_38 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_38,
        out_o_data_39 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_39,
        out_o_data_40 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_40,
        out_o_data_41 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_41,
        out_o_data_42 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_42,
        out_o_data_43 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_43,
        out_o_data_44 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_44,
        out_o_data_45 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_45,
        out_o_data_46 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_46,
        out_o_data_47 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_47,
        out_o_data_48 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_48,
        out_o_data_49 => bb_ethash_search_B1_sr_1_aunroll_x_out_o_data_49,
        out_o_stall => bb_ethash_search_B1_sr_1_aunroll_x_out_o_stall,
        out_o_valid => bb_ethash_search_B1_sr_1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- loop_limiter_ethash_search0(BLACKBOX,175)
    theloop_limiter_ethash_search0 : loop_limiter_ethash_search0
    PORT MAP (
        in_i_stall => bb_ethash_search_B1_sr_1_aunroll_x_out_o_stall,
        in_i_stall_exit => bb_ethash_search_B2_sr_0_aunroll_x_out_o_stall,
        in_i_valid => bb_ethash_search_B0_out_valid_out_0,
        in_i_valid_exit => bb_ethash_search_B1_out_valid_out_1,
        out_o_stall => loop_limiter_ethash_search0_out_o_stall,
        out_o_valid => loop_limiter_ethash_search0_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_search_B0(BLACKBOX,63)
    thebb_ethash_search_B0 : bb_ethash_search_B0
    PORT MAP (
        in_acl_hw_wg_id_0 => in_arg_acl_hw_wg_id,
        in_flush => in_start,
        in_g_dag => in_arg_g_dag,
        in_g_header => in_arg_g_header,
        in_g_output => in_arg_g_output,
        in_global_id_0_0 => in_arg_global_id_0,
        in_isolate => in_arg_isolate,
        in_memcoalesce_g_header_load_0_avm_readdata => in_memcoalesce_g_header_load_0_avm_readdata,
        in_memcoalesce_g_header_load_0_avm_readdatavalid => in_memcoalesce_g_header_load_0_avm_readdatavalid,
        in_memcoalesce_g_header_load_0_avm_waitrequest => in_memcoalesce_g_header_load_0_avm_waitrequest,
        in_memcoalesce_g_header_load_0_avm_writeack => in_memcoalesce_g_header_load_0_avm_writeack,
        in_stall_in_0 => loop_limiter_ethash_search0_out_o_stall,
        in_start_nonce => in_arg_start_nonce,
        in_target => in_arg_target,
        in_valid_in_0 => in_valid_in,
        in_wgl_0_enter_exit_stall_in => bb_ethash_search_B8_out_wgl_0_exit_exit_stall_in,
        in_wgl_0_enter_exit_valid_in => bb_ethash_search_B8_out_wgl_0_exit_exit_valid_in,
        in_wgl_0_wgs_wg_size => in_workgroup_size,
        out_acl_0 => bb_ethash_search_B0_out_acl_0,
        out_acl_0979 => bb_ethash_search_B0_out_acl_0979,
        out_acl_0981 => bb_ethash_search_B0_out_acl_0981,
        out_acl_0983 => bb_ethash_search_B0_out_acl_0983,
        out_acl_0985 => bb_ethash_search_B0_out_acl_0985,
        out_acl_1 => bb_ethash_search_B0_out_acl_1,
        out_acl_1980 => bb_ethash_search_B0_out_acl_1980,
        out_acl_1982 => bb_ethash_search_B0_out_acl_1982,
        out_acl_1984 => bb_ethash_search_B0_out_acl_1984,
        out_acl_1986 => bb_ethash_search_B0_out_acl_1986,
        out_add => bb_ethash_search_B0_out_add,
        out_global_id_0 => bb_ethash_search_B0_out_global_id_0,
        out_l_grpid_0 => bb_ethash_search_B0_out_l_grpid_0,
        out_l_grpid_0_addr => bb_ethash_search_B0_out_l_grpid_0_addr,
        out_memcoalesce_g_header_load_0_avm_address => bb_ethash_search_B0_out_memcoalesce_g_header_load_0_avm_address,
        out_memcoalesce_g_header_load_0_avm_burstcount => bb_ethash_search_B0_out_memcoalesce_g_header_load_0_avm_burstcount,
        out_memcoalesce_g_header_load_0_avm_byteenable => bb_ethash_search_B0_out_memcoalesce_g_header_load_0_avm_byteenable,
        out_memcoalesce_g_header_load_0_avm_enable => bb_ethash_search_B0_out_memcoalesce_g_header_load_0_avm_enable,
        out_memcoalesce_g_header_load_0_avm_read => bb_ethash_search_B0_out_memcoalesce_g_header_load_0_avm_read,
        out_memcoalesce_g_header_load_0_avm_write => bb_ethash_search_B0_out_memcoalesce_g_header_load_0_avm_write,
        out_memcoalesce_g_header_load_0_avm_writedata => bb_ethash_search_B0_out_memcoalesce_g_header_load_0_avm_writedata,
        out_stall_out_0 => bb_ethash_search_B0_out_stall_out_0,
        out_valid_out_0 => bb_ethash_search_B0_out_valid_out_0,
        out_wgl_0_enter_exit_stall_out => bb_ethash_search_B0_out_wgl_0_enter_exit_stall_out,
        out_wgl_0_enter_exit_valid_out => bb_ethash_search_B0_out_wgl_0_enter_exit_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_search_B8_sr_0_aunroll_x(BLACKBOX,15)
    thebb_ethash_search_B8_sr_0_aunroll_x : bb_ethash_search_B8_sr_0
    PORT MAP (
        in_i_data_0 => bb_ethash_search_B7_out_l_grpid_02,
        in_i_data_1 => bb_ethash_search_B7_out_state_8_2_cast181,
        in_i_data_2 => bb_ethash_search_B7_out_state_9_2_cast183,
        in_i_data_3 => bb_ethash_search_B7_out_state_10_2_cast185,
        in_i_data_4 => bb_ethash_search_B7_out_state_11_2_cast187,
        in_i_data_5 => bb_ethash_search_B7_out_scalarizer_01232,
        in_i_data_6 => bb_ethash_search_B7_out_scalarizer_11233,
        in_i_data_7 => bb_ethash_search_B7_out_global_id_0191,
        in_i_stall => bb_ethash_search_B8_out_stall_out_0,
        in_i_valid => bb_ethash_search_B7_out_valid_out_1,
        out_o_data_0 => bb_ethash_search_B8_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_ethash_search_B8_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_ethash_search_B8_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_ethash_search_B8_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_ethash_search_B8_sr_0_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_ethash_search_B8_sr_0_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_ethash_search_B8_sr_0_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_ethash_search_B8_sr_0_aunroll_x_out_o_data_7,
        out_o_stall => bb_ethash_search_B8_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_ethash_search_B8_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_search_B8(BLACKBOX,69)
    thebb_ethash_search_B8 : bb_ethash_search_B8
    PORT MAP (
        in_call152_avm_readdata => in_call152_avm_readdata,
        in_call152_avm_readdatavalid => in_call152_avm_readdatavalid,
        in_call152_avm_waitrequest => in_call152_avm_waitrequest,
        in_call152_avm_writeack => in_call152_avm_writeack,
        in_flush => in_start,
        in_g_output => in_arg_g_output,
        in_global_id_0190_0 => bb_ethash_search_B8_sr_0_aunroll_x_out_o_data_7,
        in_l_grpid_01_0 => bb_ethash_search_B8_sr_0_aunroll_x_out_o_data_0,
        in_scalarizer_01232188_0 => bb_ethash_search_B8_sr_0_aunroll_x_out_o_data_5,
        in_scalarizer_11233189_0 => bb_ethash_search_B8_sr_0_aunroll_x_out_o_data_6,
        in_stall_in_0 => in_stall_in,
        in_state_10_2_cast184_0 => bb_ethash_search_B8_sr_0_aunroll_x_out_o_data_3,
        in_state_11_2_cast186_0 => bb_ethash_search_B8_sr_0_aunroll_x_out_o_data_4,
        in_state_8_2_cast180_0 => bb_ethash_search_B8_sr_0_aunroll_x_out_o_data_1,
        in_state_9_2_cast182_0 => bb_ethash_search_B8_sr_0_aunroll_x_out_o_data_2,
        in_target => in_arg_target,
        in_unnamed_ethash_search61_avm_readdata => in_unnamed_ethash_search61_avm_readdata,
        in_unnamed_ethash_search61_avm_readdatavalid => in_unnamed_ethash_search61_avm_readdatavalid,
        in_unnamed_ethash_search61_avm_waitrequest => in_unnamed_ethash_search61_avm_waitrequest,
        in_unnamed_ethash_search61_avm_writeack => in_unnamed_ethash_search61_avm_writeack,
        in_unnamed_ethash_search62_avm_readdata => in_unnamed_ethash_search62_avm_readdata,
        in_unnamed_ethash_search62_avm_readdatavalid => in_unnamed_ethash_search62_avm_readdatavalid,
        in_unnamed_ethash_search62_avm_waitrequest => in_unnamed_ethash_search62_avm_waitrequest,
        in_unnamed_ethash_search62_avm_writeack => in_unnamed_ethash_search62_avm_writeack,
        in_unnamed_ethash_search63_avm_readdata => in_unnamed_ethash_search63_avm_readdata,
        in_unnamed_ethash_search63_avm_readdatavalid => in_unnamed_ethash_search63_avm_readdatavalid,
        in_unnamed_ethash_search63_avm_waitrequest => in_unnamed_ethash_search63_avm_waitrequest,
        in_unnamed_ethash_search63_avm_writeack => in_unnamed_ethash_search63_avm_writeack,
        in_unnamed_ethash_search64_avm_readdata => in_unnamed_ethash_search64_avm_readdata,
        in_unnamed_ethash_search64_avm_readdatavalid => in_unnamed_ethash_search64_avm_readdatavalid,
        in_unnamed_ethash_search64_avm_waitrequest => in_unnamed_ethash_search64_avm_waitrequest,
        in_unnamed_ethash_search64_avm_writeack => in_unnamed_ethash_search64_avm_writeack,
        in_valid_in_0 => bb_ethash_search_B8_sr_0_aunroll_x_out_o_valid,
        in_wgl_0_exit_exit_stall_out => bb_ethash_search_B0_out_wgl_0_enter_exit_stall_out,
        in_wgl_0_exit_exit_valid_out => bb_ethash_search_B0_out_wgl_0_enter_exit_valid_out,
        out_call152_avm_address => bb_ethash_search_B8_out_call152_avm_address,
        out_call152_avm_burstcount => bb_ethash_search_B8_out_call152_avm_burstcount,
        out_call152_avm_byteenable => bb_ethash_search_B8_out_call152_avm_byteenable,
        out_call152_avm_enable => bb_ethash_search_B8_out_call152_avm_enable,
        out_call152_avm_read => bb_ethash_search_B8_out_call152_avm_read,
        out_call152_avm_write => bb_ethash_search_B8_out_call152_avm_write,
        out_call152_avm_writedata => bb_ethash_search_B8_out_call152_avm_writedata,
        out_lsu_call152_o_active => bb_ethash_search_B8_out_lsu_call152_o_active,
        out_lsu_unnamed_ethash_search61_o_active => bb_ethash_search_B8_out_lsu_unnamed_ethash_search61_o_active,
        out_lsu_unnamed_ethash_search62_o_active => bb_ethash_search_B8_out_lsu_unnamed_ethash_search62_o_active,
        out_lsu_unnamed_ethash_search63_o_active => bb_ethash_search_B8_out_lsu_unnamed_ethash_search63_o_active,
        out_lsu_unnamed_ethash_search64_o_active => bb_ethash_search_B8_out_lsu_unnamed_ethash_search64_o_active,
        out_stall_out_0 => bb_ethash_search_B8_out_stall_out_0,
        out_unnamed_ethash_search61_avm_address => bb_ethash_search_B8_out_unnamed_ethash_search61_avm_address,
        out_unnamed_ethash_search61_avm_burstcount => bb_ethash_search_B8_out_unnamed_ethash_search61_avm_burstcount,
        out_unnamed_ethash_search61_avm_byteenable => bb_ethash_search_B8_out_unnamed_ethash_search61_avm_byteenable,
        out_unnamed_ethash_search61_avm_enable => bb_ethash_search_B8_out_unnamed_ethash_search61_avm_enable,
        out_unnamed_ethash_search61_avm_read => bb_ethash_search_B8_out_unnamed_ethash_search61_avm_read,
        out_unnamed_ethash_search61_avm_write => bb_ethash_search_B8_out_unnamed_ethash_search61_avm_write,
        out_unnamed_ethash_search61_avm_writedata => bb_ethash_search_B8_out_unnamed_ethash_search61_avm_writedata,
        out_unnamed_ethash_search62_avm_address => bb_ethash_search_B8_out_unnamed_ethash_search62_avm_address,
        out_unnamed_ethash_search62_avm_burstcount => bb_ethash_search_B8_out_unnamed_ethash_search62_avm_burstcount,
        out_unnamed_ethash_search62_avm_byteenable => bb_ethash_search_B8_out_unnamed_ethash_search62_avm_byteenable,
        out_unnamed_ethash_search62_avm_enable => bb_ethash_search_B8_out_unnamed_ethash_search62_avm_enable,
        out_unnamed_ethash_search62_avm_read => bb_ethash_search_B8_out_unnamed_ethash_search62_avm_read,
        out_unnamed_ethash_search62_avm_write => bb_ethash_search_B8_out_unnamed_ethash_search62_avm_write,
        out_unnamed_ethash_search62_avm_writedata => bb_ethash_search_B8_out_unnamed_ethash_search62_avm_writedata,
        out_unnamed_ethash_search63_avm_address => bb_ethash_search_B8_out_unnamed_ethash_search63_avm_address,
        out_unnamed_ethash_search63_avm_burstcount => bb_ethash_search_B8_out_unnamed_ethash_search63_avm_burstcount,
        out_unnamed_ethash_search63_avm_byteenable => bb_ethash_search_B8_out_unnamed_ethash_search63_avm_byteenable,
        out_unnamed_ethash_search63_avm_enable => bb_ethash_search_B8_out_unnamed_ethash_search63_avm_enable,
        out_unnamed_ethash_search63_avm_read => bb_ethash_search_B8_out_unnamed_ethash_search63_avm_read,
        out_unnamed_ethash_search63_avm_write => bb_ethash_search_B8_out_unnamed_ethash_search63_avm_write,
        out_unnamed_ethash_search63_avm_writedata => bb_ethash_search_B8_out_unnamed_ethash_search63_avm_writedata,
        out_unnamed_ethash_search64_avm_address => bb_ethash_search_B8_out_unnamed_ethash_search64_avm_address,
        out_unnamed_ethash_search64_avm_burstcount => bb_ethash_search_B8_out_unnamed_ethash_search64_avm_burstcount,
        out_unnamed_ethash_search64_avm_byteenable => bb_ethash_search_B8_out_unnamed_ethash_search64_avm_byteenable,
        out_unnamed_ethash_search64_avm_enable => bb_ethash_search_B8_out_unnamed_ethash_search64_avm_enable,
        out_unnamed_ethash_search64_avm_read => bb_ethash_search_B8_out_unnamed_ethash_search64_avm_read,
        out_unnamed_ethash_search64_avm_write => bb_ethash_search_B8_out_unnamed_ethash_search64_avm_write,
        out_unnamed_ethash_search64_avm_writedata => bb_ethash_search_B8_out_unnamed_ethash_search64_avm_writedata,
        out_valid_out_0 => bb_ethash_search_B8_out_valid_out_0,
        out_wgl_0_exit_exit_stall_in => bb_ethash_search_B8_out_wgl_0_exit_exit_stall_in,
        out_wgl_0_exit_exit_valid_in => bb_ethash_search_B8_out_wgl_0_exit_exit_valid_in,
        clock => clock,
        resetn => resetn
    );

    -- out_call152_avm_address(GPOUT,179)
    out_call152_avm_address <= bb_ethash_search_B8_out_call152_avm_address;

    -- out_call152_avm_burstcount(GPOUT,180)
    out_call152_avm_burstcount <= bb_ethash_search_B8_out_call152_avm_burstcount;

    -- out_call152_avm_byteenable(GPOUT,181)
    out_call152_avm_byteenable <= bb_ethash_search_B8_out_call152_avm_byteenable;

    -- out_call152_avm_enable(GPOUT,182)
    out_call152_avm_enable <= bb_ethash_search_B8_out_call152_avm_enable;

    -- out_call152_avm_read(GPOUT,183)
    out_call152_avm_read <= bb_ethash_search_B8_out_call152_avm_read;

    -- out_call152_avm_write(GPOUT,184)
    out_call152_avm_write <= bb_ethash_search_B8_out_call152_avm_write;

    -- out_call152_avm_writedata(GPOUT,185)
    out_call152_avm_writedata <= bb_ethash_search_B8_out_call152_avm_writedata;

    -- out_memcoalesce_g_header_load_0_avm_address(GPOUT,186)
    out_memcoalesce_g_header_load_0_avm_address <= bb_ethash_search_B0_out_memcoalesce_g_header_load_0_avm_address;

    -- out_memcoalesce_g_header_load_0_avm_burstcount(GPOUT,187)
    out_memcoalesce_g_header_load_0_avm_burstcount <= bb_ethash_search_B0_out_memcoalesce_g_header_load_0_avm_burstcount;

    -- out_memcoalesce_g_header_load_0_avm_byteenable(GPOUT,188)
    out_memcoalesce_g_header_load_0_avm_byteenable <= bb_ethash_search_B0_out_memcoalesce_g_header_load_0_avm_byteenable;

    -- out_memcoalesce_g_header_load_0_avm_enable(GPOUT,189)
    out_memcoalesce_g_header_load_0_avm_enable <= bb_ethash_search_B0_out_memcoalesce_g_header_load_0_avm_enable;

    -- out_memcoalesce_g_header_load_0_avm_read(GPOUT,190)
    out_memcoalesce_g_header_load_0_avm_read <= bb_ethash_search_B0_out_memcoalesce_g_header_load_0_avm_read;

    -- out_memcoalesce_g_header_load_0_avm_write(GPOUT,191)
    out_memcoalesce_g_header_load_0_avm_write <= bb_ethash_search_B0_out_memcoalesce_g_header_load_0_avm_write;

    -- out_memcoalesce_g_header_load_0_avm_writedata(GPOUT,192)
    out_memcoalesce_g_header_load_0_avm_writedata <= bb_ethash_search_B0_out_memcoalesce_g_header_load_0_avm_writedata;

    -- out_memcoalesce_null_load_016_avm_address(GPOUT,193)
    out_memcoalesce_null_load_016_avm_address <= bb_ethash_search_B5_out_memcoalesce_null_load_016_avm_address;

    -- out_memcoalesce_null_load_016_avm_burstcount(GPOUT,194)
    out_memcoalesce_null_load_016_avm_burstcount <= bb_ethash_search_B5_out_memcoalesce_null_load_016_avm_burstcount;

    -- out_memcoalesce_null_load_016_avm_byteenable(GPOUT,195)
    out_memcoalesce_null_load_016_avm_byteenable <= bb_ethash_search_B5_out_memcoalesce_null_load_016_avm_byteenable;

    -- out_memcoalesce_null_load_016_avm_enable(GPOUT,196)
    out_memcoalesce_null_load_016_avm_enable <= bb_ethash_search_B5_out_memcoalesce_null_load_016_avm_enable;

    -- out_memcoalesce_null_load_016_avm_read(GPOUT,197)
    out_memcoalesce_null_load_016_avm_read <= bb_ethash_search_B5_out_memcoalesce_null_load_016_avm_read;

    -- out_memcoalesce_null_load_016_avm_write(GPOUT,198)
    out_memcoalesce_null_load_016_avm_write <= bb_ethash_search_B5_out_memcoalesce_null_load_016_avm_write;

    -- out_memcoalesce_null_load_016_avm_writedata(GPOUT,199)
    out_memcoalesce_null_load_016_avm_writedata <= bb_ethash_search_B5_out_memcoalesce_null_load_016_avm_writedata;

    -- out_memcoalesce_null_load_0_avm_address(GPOUT,200)
    out_memcoalesce_null_load_0_avm_address <= bb_ethash_search_B5_out_memcoalesce_null_load_0_avm_address;

    -- out_memcoalesce_null_load_0_avm_burstcount(GPOUT,201)
    out_memcoalesce_null_load_0_avm_burstcount <= bb_ethash_search_B5_out_memcoalesce_null_load_0_avm_burstcount;

    -- out_memcoalesce_null_load_0_avm_byteenable(GPOUT,202)
    out_memcoalesce_null_load_0_avm_byteenable <= bb_ethash_search_B5_out_memcoalesce_null_load_0_avm_byteenable;

    -- out_memcoalesce_null_load_0_avm_enable(GPOUT,203)
    out_memcoalesce_null_load_0_avm_enable <= bb_ethash_search_B5_out_memcoalesce_null_load_0_avm_enable;

    -- out_memcoalesce_null_load_0_avm_read(GPOUT,204)
    out_memcoalesce_null_load_0_avm_read <= bb_ethash_search_B5_out_memcoalesce_null_load_0_avm_read;

    -- out_memcoalesce_null_load_0_avm_write(GPOUT,205)
    out_memcoalesce_null_load_0_avm_write <= bb_ethash_search_B5_out_memcoalesce_null_load_0_avm_write;

    -- out_memcoalesce_null_load_0_avm_writedata(GPOUT,206)
    out_memcoalesce_null_load_0_avm_writedata <= bb_ethash_search_B5_out_memcoalesce_null_load_0_avm_writedata;

    -- out_memdep_198_avm_address(GPOUT,207)
    out_memdep_198_avm_address <= bb_ethash_search_B3_vunroll_x_out_memdep_198_avm_address;

    -- out_memdep_198_avm_burstcount(GPOUT,208)
    out_memdep_198_avm_burstcount <= bb_ethash_search_B3_vunroll_x_out_memdep_198_avm_burstcount;

    -- out_memdep_198_avm_byteenable(GPOUT,209)
    out_memdep_198_avm_byteenable <= bb_ethash_search_B3_vunroll_x_out_memdep_198_avm_byteenable;

    -- out_memdep_198_avm_enable(GPOUT,210)
    out_memdep_198_avm_enable <= bb_ethash_search_B3_vunroll_x_out_memdep_198_avm_enable;

    -- out_memdep_198_avm_read(GPOUT,211)
    out_memdep_198_avm_read <= bb_ethash_search_B3_vunroll_x_out_memdep_198_avm_read;

    -- out_memdep_198_avm_write(GPOUT,212)
    out_memdep_198_avm_write <= bb_ethash_search_B3_vunroll_x_out_memdep_198_avm_write;

    -- out_memdep_198_avm_writedata(GPOUT,213)
    out_memdep_198_avm_writedata <= bb_ethash_search_B3_vunroll_x_out_memdep_198_avm_writedata;

    -- out_memdep_199_avm_address(GPOUT,214)
    out_memdep_199_avm_address <= bb_ethash_search_B3_vunroll_x_out_memdep_199_avm_address;

    -- out_memdep_199_avm_burstcount(GPOUT,215)
    out_memdep_199_avm_burstcount <= bb_ethash_search_B3_vunroll_x_out_memdep_199_avm_burstcount;

    -- out_memdep_199_avm_byteenable(GPOUT,216)
    out_memdep_199_avm_byteenable <= bb_ethash_search_B3_vunroll_x_out_memdep_199_avm_byteenable;

    -- out_memdep_199_avm_enable(GPOUT,217)
    out_memdep_199_avm_enable <= bb_ethash_search_B3_vunroll_x_out_memdep_199_avm_enable;

    -- out_memdep_199_avm_read(GPOUT,218)
    out_memdep_199_avm_read <= bb_ethash_search_B3_vunroll_x_out_memdep_199_avm_read;

    -- out_memdep_199_avm_write(GPOUT,219)
    out_memdep_199_avm_write <= bb_ethash_search_B3_vunroll_x_out_memdep_199_avm_write;

    -- out_memdep_199_avm_writedata(GPOUT,220)
    out_memdep_199_avm_writedata <= bb_ethash_search_B3_vunroll_x_out_memdep_199_avm_writedata;

    -- out_memdep_200_avm_address(GPOUT,221)
    out_memdep_200_avm_address <= bb_ethash_search_B3_vunroll_x_out_memdep_200_avm_address;

    -- out_memdep_200_avm_burstcount(GPOUT,222)
    out_memdep_200_avm_burstcount <= bb_ethash_search_B3_vunroll_x_out_memdep_200_avm_burstcount;

    -- out_memdep_200_avm_byteenable(GPOUT,223)
    out_memdep_200_avm_byteenable <= bb_ethash_search_B3_vunroll_x_out_memdep_200_avm_byteenable;

    -- out_memdep_200_avm_enable(GPOUT,224)
    out_memdep_200_avm_enable <= bb_ethash_search_B3_vunroll_x_out_memdep_200_avm_enable;

    -- out_memdep_200_avm_read(GPOUT,225)
    out_memdep_200_avm_read <= bb_ethash_search_B3_vunroll_x_out_memdep_200_avm_read;

    -- out_memdep_200_avm_write(GPOUT,226)
    out_memdep_200_avm_write <= bb_ethash_search_B3_vunroll_x_out_memdep_200_avm_write;

    -- out_memdep_200_avm_writedata(GPOUT,227)
    out_memdep_200_avm_writedata <= bb_ethash_search_B3_vunroll_x_out_memdep_200_avm_writedata;

    -- out_memdep_203_avm_address(GPOUT,228)
    out_memdep_203_avm_address <= bb_ethash_search_B3_vunroll_x_out_memdep_203_avm_address;

    -- out_memdep_203_avm_burstcount(GPOUT,229)
    out_memdep_203_avm_burstcount <= bb_ethash_search_B3_vunroll_x_out_memdep_203_avm_burstcount;

    -- out_memdep_203_avm_byteenable(GPOUT,230)
    out_memdep_203_avm_byteenable <= bb_ethash_search_B3_vunroll_x_out_memdep_203_avm_byteenable;

    -- out_memdep_203_avm_enable(GPOUT,231)
    out_memdep_203_avm_enable <= bb_ethash_search_B3_vunroll_x_out_memdep_203_avm_enable;

    -- out_memdep_203_avm_read(GPOUT,232)
    out_memdep_203_avm_read <= bb_ethash_search_B3_vunroll_x_out_memdep_203_avm_read;

    -- out_memdep_203_avm_write(GPOUT,233)
    out_memdep_203_avm_write <= bb_ethash_search_B3_vunroll_x_out_memdep_203_avm_write;

    -- out_memdep_203_avm_writedata(GPOUT,234)
    out_memdep_203_avm_writedata <= bb_ethash_search_B3_vunroll_x_out_memdep_203_avm_writedata;

    -- out_memdep_204_avm_address(GPOUT,235)
    out_memdep_204_avm_address <= bb_ethash_search_B4_vunroll_x_out_memdep_204_avm_address;

    -- out_memdep_204_avm_burstcount(GPOUT,236)
    out_memdep_204_avm_burstcount <= bb_ethash_search_B4_vunroll_x_out_memdep_204_avm_burstcount;

    -- out_memdep_204_avm_byteenable(GPOUT,237)
    out_memdep_204_avm_byteenable <= bb_ethash_search_B4_vunroll_x_out_memdep_204_avm_byteenable;

    -- out_memdep_204_avm_enable(GPOUT,238)
    out_memdep_204_avm_enable <= bb_ethash_search_B4_vunroll_x_out_memdep_204_avm_enable;

    -- out_memdep_204_avm_read(GPOUT,239)
    out_memdep_204_avm_read <= bb_ethash_search_B4_vunroll_x_out_memdep_204_avm_read;

    -- out_memdep_204_avm_write(GPOUT,240)
    out_memdep_204_avm_write <= bb_ethash_search_B4_vunroll_x_out_memdep_204_avm_write;

    -- out_memdep_204_avm_writedata(GPOUT,241)
    out_memdep_204_avm_writedata <= bb_ethash_search_B4_vunroll_x_out_memdep_204_avm_writedata;

    -- out_memdep_205_avm_address(GPOUT,242)
    out_memdep_205_avm_address <= bb_ethash_search_B5_out_memdep_205_avm_address;

    -- out_memdep_205_avm_burstcount(GPOUT,243)
    out_memdep_205_avm_burstcount <= bb_ethash_search_B5_out_memdep_205_avm_burstcount;

    -- out_memdep_205_avm_byteenable(GPOUT,244)
    out_memdep_205_avm_byteenable <= bb_ethash_search_B5_out_memdep_205_avm_byteenable;

    -- out_memdep_205_avm_enable(GPOUT,245)
    out_memdep_205_avm_enable <= bb_ethash_search_B5_out_memdep_205_avm_enable;

    -- out_memdep_205_avm_read(GPOUT,246)
    out_memdep_205_avm_read <= bb_ethash_search_B5_out_memdep_205_avm_read;

    -- out_memdep_205_avm_write(GPOUT,247)
    out_memdep_205_avm_write <= bb_ethash_search_B5_out_memdep_205_avm_write;

    -- out_memdep_205_avm_writedata(GPOUT,248)
    out_memdep_205_avm_writedata <= bb_ethash_search_B5_out_memdep_205_avm_writedata;

    -- out_memdep_avm_address(GPOUT,249)
    out_memdep_avm_address <= bb_ethash_search_B3_vunroll_x_out_memdep_avm_address;

    -- out_memdep_avm_burstcount(GPOUT,250)
    out_memdep_avm_burstcount <= bb_ethash_search_B3_vunroll_x_out_memdep_avm_burstcount;

    -- out_memdep_avm_byteenable(GPOUT,251)
    out_memdep_avm_byteenable <= bb_ethash_search_B3_vunroll_x_out_memdep_avm_byteenable;

    -- out_memdep_avm_enable(GPOUT,252)
    out_memdep_avm_enable <= bb_ethash_search_B3_vunroll_x_out_memdep_avm_enable;

    -- out_memdep_avm_read(GPOUT,253)
    out_memdep_avm_read <= bb_ethash_search_B3_vunroll_x_out_memdep_avm_read;

    -- out_memdep_avm_write(GPOUT,254)
    out_memdep_avm_write <= bb_ethash_search_B3_vunroll_x_out_memdep_avm_write;

    -- out_memdep_avm_writedata(GPOUT,255)
    out_memdep_avm_writedata <= bb_ethash_search_B3_vunroll_x_out_memdep_avm_writedata;

    -- out_o_active_call152(GPOUT,256)
    out_o_active_call152 <= bb_ethash_search_B8_out_lsu_call152_o_active;

    -- out_o_active_unnamed_ethash_search61(GPOUT,257)
    out_o_active_unnamed_ethash_search61 <= bb_ethash_search_B8_out_lsu_unnamed_ethash_search61_o_active;

    -- out_o_active_unnamed_ethash_search62(GPOUT,258)
    out_o_active_unnamed_ethash_search62 <= bb_ethash_search_B8_out_lsu_unnamed_ethash_search62_o_active;

    -- out_o_active_unnamed_ethash_search63(GPOUT,259)
    out_o_active_unnamed_ethash_search63 <= bb_ethash_search_B8_out_lsu_unnamed_ethash_search63_o_active;

    -- out_o_active_unnamed_ethash_search64(GPOUT,260)
    out_o_active_unnamed_ethash_search64 <= bb_ethash_search_B8_out_lsu_unnamed_ethash_search64_o_active;

    -- out_primWireOut(GPOUT,261)
    out_primWireOut <= dupName_0_c_i32_0gr_x_q;

    -- out_stall_out(GPOUT,262)
    out_stall_out <= bb_ethash_search_B0_out_stall_out_0;

    -- out_unnamed_ethash_search27_avm_address(GPOUT,263)
    out_unnamed_ethash_search27_avm_address <= bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search27_avm_address;

    -- out_unnamed_ethash_search27_avm_burstcount(GPOUT,264)
    out_unnamed_ethash_search27_avm_burstcount <= bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search27_avm_burstcount;

    -- out_unnamed_ethash_search27_avm_byteenable(GPOUT,265)
    out_unnamed_ethash_search27_avm_byteenable <= bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search27_avm_byteenable;

    -- out_unnamed_ethash_search27_avm_enable(GPOUT,266)
    out_unnamed_ethash_search27_avm_enable <= bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search27_avm_enable;

    -- out_unnamed_ethash_search27_avm_read(GPOUT,267)
    out_unnamed_ethash_search27_avm_read <= bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search27_avm_read;

    -- out_unnamed_ethash_search27_avm_write(GPOUT,268)
    out_unnamed_ethash_search27_avm_write <= bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search27_avm_write;

    -- out_unnamed_ethash_search27_avm_writedata(GPOUT,269)
    out_unnamed_ethash_search27_avm_writedata <= bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search27_avm_writedata;

    -- out_unnamed_ethash_search28_avm_address(GPOUT,270)
    out_unnamed_ethash_search28_avm_address <= bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search28_avm_address;

    -- out_unnamed_ethash_search28_avm_burstcount(GPOUT,271)
    out_unnamed_ethash_search28_avm_burstcount <= bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search28_avm_burstcount;

    -- out_unnamed_ethash_search28_avm_byteenable(GPOUT,272)
    out_unnamed_ethash_search28_avm_byteenable <= bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search28_avm_byteenable;

    -- out_unnamed_ethash_search28_avm_enable(GPOUT,273)
    out_unnamed_ethash_search28_avm_enable <= bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search28_avm_enable;

    -- out_unnamed_ethash_search28_avm_read(GPOUT,274)
    out_unnamed_ethash_search28_avm_read <= bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search28_avm_read;

    -- out_unnamed_ethash_search28_avm_write(GPOUT,275)
    out_unnamed_ethash_search28_avm_write <= bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search28_avm_write;

    -- out_unnamed_ethash_search28_avm_writedata(GPOUT,276)
    out_unnamed_ethash_search28_avm_writedata <= bb_ethash_search_B3_vunroll_x_out_unnamed_ethash_search28_avm_writedata;

    -- out_unnamed_ethash_search34_avm_address(GPOUT,277)
    out_unnamed_ethash_search34_avm_address <= bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search34_avm_address;

    -- out_unnamed_ethash_search34_avm_burstcount(GPOUT,278)
    out_unnamed_ethash_search34_avm_burstcount <= bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search34_avm_burstcount;

    -- out_unnamed_ethash_search34_avm_byteenable(GPOUT,279)
    out_unnamed_ethash_search34_avm_byteenable <= bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search34_avm_byteenable;

    -- out_unnamed_ethash_search34_avm_enable(GPOUT,280)
    out_unnamed_ethash_search34_avm_enable <= bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search34_avm_enable;

    -- out_unnamed_ethash_search34_avm_read(GPOUT,281)
    out_unnamed_ethash_search34_avm_read <= bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search34_avm_read;

    -- out_unnamed_ethash_search34_avm_write(GPOUT,282)
    out_unnamed_ethash_search34_avm_write <= bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search34_avm_write;

    -- out_unnamed_ethash_search34_avm_writedata(GPOUT,283)
    out_unnamed_ethash_search34_avm_writedata <= bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search34_avm_writedata;

    -- out_unnamed_ethash_search35_avm_address(GPOUT,284)
    out_unnamed_ethash_search35_avm_address <= bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search35_avm_address;

    -- out_unnamed_ethash_search35_avm_burstcount(GPOUT,285)
    out_unnamed_ethash_search35_avm_burstcount <= bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search35_avm_burstcount;

    -- out_unnamed_ethash_search35_avm_byteenable(GPOUT,286)
    out_unnamed_ethash_search35_avm_byteenable <= bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search35_avm_byteenable;

    -- out_unnamed_ethash_search35_avm_enable(GPOUT,287)
    out_unnamed_ethash_search35_avm_enable <= bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search35_avm_enable;

    -- out_unnamed_ethash_search35_avm_read(GPOUT,288)
    out_unnamed_ethash_search35_avm_read <= bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search35_avm_read;

    -- out_unnamed_ethash_search35_avm_write(GPOUT,289)
    out_unnamed_ethash_search35_avm_write <= bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search35_avm_write;

    -- out_unnamed_ethash_search35_avm_writedata(GPOUT,290)
    out_unnamed_ethash_search35_avm_writedata <= bb_ethash_search_B4_vunroll_x_out_unnamed_ethash_search35_avm_writedata;

    -- out_unnamed_ethash_search61_avm_address(GPOUT,291)
    out_unnamed_ethash_search61_avm_address <= bb_ethash_search_B8_out_unnamed_ethash_search61_avm_address;

    -- out_unnamed_ethash_search61_avm_burstcount(GPOUT,292)
    out_unnamed_ethash_search61_avm_burstcount <= bb_ethash_search_B8_out_unnamed_ethash_search61_avm_burstcount;

    -- out_unnamed_ethash_search61_avm_byteenable(GPOUT,293)
    out_unnamed_ethash_search61_avm_byteenable <= bb_ethash_search_B8_out_unnamed_ethash_search61_avm_byteenable;

    -- out_unnamed_ethash_search61_avm_enable(GPOUT,294)
    out_unnamed_ethash_search61_avm_enable <= bb_ethash_search_B8_out_unnamed_ethash_search61_avm_enable;

    -- out_unnamed_ethash_search61_avm_read(GPOUT,295)
    out_unnamed_ethash_search61_avm_read <= bb_ethash_search_B8_out_unnamed_ethash_search61_avm_read;

    -- out_unnamed_ethash_search61_avm_write(GPOUT,296)
    out_unnamed_ethash_search61_avm_write <= bb_ethash_search_B8_out_unnamed_ethash_search61_avm_write;

    -- out_unnamed_ethash_search61_avm_writedata(GPOUT,297)
    out_unnamed_ethash_search61_avm_writedata <= bb_ethash_search_B8_out_unnamed_ethash_search61_avm_writedata;

    -- out_unnamed_ethash_search62_avm_address(GPOUT,298)
    out_unnamed_ethash_search62_avm_address <= bb_ethash_search_B8_out_unnamed_ethash_search62_avm_address;

    -- out_unnamed_ethash_search62_avm_burstcount(GPOUT,299)
    out_unnamed_ethash_search62_avm_burstcount <= bb_ethash_search_B8_out_unnamed_ethash_search62_avm_burstcount;

    -- out_unnamed_ethash_search62_avm_byteenable(GPOUT,300)
    out_unnamed_ethash_search62_avm_byteenable <= bb_ethash_search_B8_out_unnamed_ethash_search62_avm_byteenable;

    -- out_unnamed_ethash_search62_avm_enable(GPOUT,301)
    out_unnamed_ethash_search62_avm_enable <= bb_ethash_search_B8_out_unnamed_ethash_search62_avm_enable;

    -- out_unnamed_ethash_search62_avm_read(GPOUT,302)
    out_unnamed_ethash_search62_avm_read <= bb_ethash_search_B8_out_unnamed_ethash_search62_avm_read;

    -- out_unnamed_ethash_search62_avm_write(GPOUT,303)
    out_unnamed_ethash_search62_avm_write <= bb_ethash_search_B8_out_unnamed_ethash_search62_avm_write;

    -- out_unnamed_ethash_search62_avm_writedata(GPOUT,304)
    out_unnamed_ethash_search62_avm_writedata <= bb_ethash_search_B8_out_unnamed_ethash_search62_avm_writedata;

    -- out_unnamed_ethash_search63_avm_address(GPOUT,305)
    out_unnamed_ethash_search63_avm_address <= bb_ethash_search_B8_out_unnamed_ethash_search63_avm_address;

    -- out_unnamed_ethash_search63_avm_burstcount(GPOUT,306)
    out_unnamed_ethash_search63_avm_burstcount <= bb_ethash_search_B8_out_unnamed_ethash_search63_avm_burstcount;

    -- out_unnamed_ethash_search63_avm_byteenable(GPOUT,307)
    out_unnamed_ethash_search63_avm_byteenable <= bb_ethash_search_B8_out_unnamed_ethash_search63_avm_byteenable;

    -- out_unnamed_ethash_search63_avm_enable(GPOUT,308)
    out_unnamed_ethash_search63_avm_enable <= bb_ethash_search_B8_out_unnamed_ethash_search63_avm_enable;

    -- out_unnamed_ethash_search63_avm_read(GPOUT,309)
    out_unnamed_ethash_search63_avm_read <= bb_ethash_search_B8_out_unnamed_ethash_search63_avm_read;

    -- out_unnamed_ethash_search63_avm_write(GPOUT,310)
    out_unnamed_ethash_search63_avm_write <= bb_ethash_search_B8_out_unnamed_ethash_search63_avm_write;

    -- out_unnamed_ethash_search63_avm_writedata(GPOUT,311)
    out_unnamed_ethash_search63_avm_writedata <= bb_ethash_search_B8_out_unnamed_ethash_search63_avm_writedata;

    -- out_unnamed_ethash_search64_avm_address(GPOUT,312)
    out_unnamed_ethash_search64_avm_address <= bb_ethash_search_B8_out_unnamed_ethash_search64_avm_address;

    -- out_unnamed_ethash_search64_avm_burstcount(GPOUT,313)
    out_unnamed_ethash_search64_avm_burstcount <= bb_ethash_search_B8_out_unnamed_ethash_search64_avm_burstcount;

    -- out_unnamed_ethash_search64_avm_byteenable(GPOUT,314)
    out_unnamed_ethash_search64_avm_byteenable <= bb_ethash_search_B8_out_unnamed_ethash_search64_avm_byteenable;

    -- out_unnamed_ethash_search64_avm_enable(GPOUT,315)
    out_unnamed_ethash_search64_avm_enable <= bb_ethash_search_B8_out_unnamed_ethash_search64_avm_enable;

    -- out_unnamed_ethash_search64_avm_read(GPOUT,316)
    out_unnamed_ethash_search64_avm_read <= bb_ethash_search_B8_out_unnamed_ethash_search64_avm_read;

    -- out_unnamed_ethash_search64_avm_write(GPOUT,317)
    out_unnamed_ethash_search64_avm_write <= bb_ethash_search_B8_out_unnamed_ethash_search64_avm_write;

    -- out_unnamed_ethash_search64_avm_writedata(GPOUT,318)
    out_unnamed_ethash_search64_avm_writedata <= bb_ethash_search_B8_out_unnamed_ethash_search64_avm_writedata;

    -- out_valid_out(GPOUT,319)
    out_valid_out <= bb_ethash_search_B8_out_valid_out_0;

END normal;
