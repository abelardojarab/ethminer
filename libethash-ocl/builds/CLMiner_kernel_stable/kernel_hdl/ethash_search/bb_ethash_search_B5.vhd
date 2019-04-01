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

-- VHDL created from bb_ethash_search_B5
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

entity bb_ethash_search_B5 is
    port (
        in_arrayidx36_2_RM164_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx45_RM162_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_barrier_unnamed_ethash_search36_wgs_workgroup_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_barrier_unnamed_ethash_search40_wgs_workgroup_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1104_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2109_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe3113_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe4117_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_cmp23156_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_cmp23_xor158_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_fpgaindvars_iv12135_0 : in std_logic_vector(3 downto 0);  -- ufix4
        in_g_dag : in std_logic_vector(63 downto 0);  -- ufix64
        in_g_output : in std_logic_vector(63 downto 0);  -- ufix64
        in_global_id_0193_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i18_0908153_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_idxprom80_RM167_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_l_grpid_04_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr10_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr_zext160_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_memcoalesce_null_load_016_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memcoalesce_null_load_016_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_null_load_016_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_null_load_016_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_null_load_0_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memcoalesce_null_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_null_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_null_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_205_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memdep_205_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_205_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_205_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_scalarizer_0100163_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100373_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100583_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100793_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01173137_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01175141_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01177145_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01179149_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099323_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099533_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099743_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099953_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0xor1200168_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100058_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100268_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100478_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100688_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100898_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11174139_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11176143_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11178147_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11180151_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199428_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199638_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199848_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1xor1201169_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_2xor170_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_3xor171_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_state_0_0_cast121_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_4_0_cast124_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_5_0_cast127_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_6_0_cast130_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_7_0_cast133_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_target : in std_logic_vector(63 downto 0);  -- ufix64
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_acl_1413 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_1414 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_1415 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_1416 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe1104 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe2109 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe3113 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe4117 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exe1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe2 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe3 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe4 : out std_logic_vector(31 downto 0);  -- ufix32
        out_fpgaindvars_iv_next13 : out std_logic_vector(3 downto 0);  -- ufix4
        out_global_id_0193 : out std_logic_vector(31 downto 0);  -- ufix32
        out_inc123 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_04 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0_addr10 : out std_logic_vector(31 downto 0);  -- ufix32
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
        out_memdep_205_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_205_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_205_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_memdep_205_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_205_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_205_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_205_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_scalarizer_0100163 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0100373 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0100583 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0100793 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099323 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099533 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099743 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099953 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100058 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100268 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100478 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100688 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100898 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_199428 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_199638 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_199848 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_state_0_0_cast121 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_4_0_cast124 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_5_0_cast127 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_6_0_cast130 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_7_0_cast133 : out std_logic_vector(63 downto 0);  -- ufix64
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_ethash_search_B5;

architecture normal of bb_ethash_search_B5 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_ethash_search_B5_stall_region is
        port (
            in_arrayidx36_2_RM164 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx45_RM162 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_barrier_unnamed_ethash_search36_wgs_workgroup_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_barrier_unnamed_ethash_search40_wgs_workgroup_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1104 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2109 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe3113 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe4117 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_cmp23156 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_cmp23_xor158 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_fpgaindvars_iv12135 : in std_logic_vector(3 downto 0);  -- Fixed Point
            in_global_id_0193 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i18_0908153 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_idxprom80_RM167 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_l_grpid_04 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr_zext160 : in std_logic_vector(63 downto 0);  -- Fixed Point
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
            in_scalarizer_0100163 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100373 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100583 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100793 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01173137 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01175141 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01177145 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01179149 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099323 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099533 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099743 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099953 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0xor1200168 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100058 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100268 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100478 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100688 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100898 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11174139 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11176143 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11178147 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11180151 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199428 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199638 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199848 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1xor1201169 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_2xor170 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_3xor171 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_state_0_0_cast121 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_4_0_cast124 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_5_0_cast127 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_6_0_cast130 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_7_0_cast133 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_exitcond14 : out std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_state_0_0_cast121 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_4_0_cast124 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_5_0_cast127 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_6_0_cast130 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_7_0_cast133 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component ethash_search_B5_branch is
        port (
            in_acl_1413 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_1414 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_1415 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_1416 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1104 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2109 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe3113 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe4117 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_exitcond14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_fpgaindvars_iv_next13 : in std_logic_vector(3 downto 0);  -- Fixed Point
            in_global_id_0193 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_inc123 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_04 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100163 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100373 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100583 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100793 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099323 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099533 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099743 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099953 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100058 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100268 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100478 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100688 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100898 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199428 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199638 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199848 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_state_0_0_cast121 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_4_0_cast124 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_5_0_cast127 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_6_0_cast130 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_7_0_cast133 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
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


    component ethash_search_B5_merge is
        port (
            in_arrayidx36_2_RM164_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx45_RM162_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe1104_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2109_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe3113_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe4117_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_cmp23156_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_cmp23_xor158_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_fpgaindvars_iv12135_0 : in std_logic_vector(3 downto 0);  -- Fixed Point
            in_global_id_0193_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i18_0908153_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_idxprom80_RM167_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_l_grpid_04_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr10_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr_zext160_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
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
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_state_0_0_cast121_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_4_0_cast124_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_5_0_cast127_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_6_0_cast130_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_7_0_cast133_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_arrayidx36_2_RM164 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx45_RM162 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe1104 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2109 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe3113 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe4117 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_cmp23156 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_cmp23_xor158 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_fpgaindvars_iv12135 : out std_logic_vector(3 downto 0);  -- Fixed Point
            out_global_id_0193 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_i18_0908153 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_idxprom80_RM167 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_l_grpid_04 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr_zext160 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_scalarizer_0100163 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0100373 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0100583 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0100793 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01173137 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01175141 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01177145 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01179149 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099323 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099533 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099743 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_099953 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_0xor1200168 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100058 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100268 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100478 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100688 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1100898 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11174139 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11176143 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11178147 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11180151 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_199428 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_199638 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_199848 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_1xor1201169 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_2xor170 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_3xor171 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_state_0_0_cast121 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_4_0_cast124 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_5_0_cast127 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_6_0_cast130 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_7_0_cast133 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_ethash_search_B5_stall_region_out_acl_1413 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_stall_region_out_acl_1414 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_stall_region_out_acl_1415 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_stall_region_out_acl_1416 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_stall_region_out_c0_exe1104 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B5_stall_region_out_c0_exe2109 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B5_stall_region_out_c0_exe3113 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B5_stall_region_out_c0_exe4117 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B5_stall_region_out_c1_exe1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_stall_region_out_c1_exe2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_stall_region_out_c1_exe3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_stall_region_out_c1_exe4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_stall_region_out_exitcond14 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B5_stall_region_out_fpgaindvars_iv_next13 : STD_LOGIC_VECTOR (3 downto 0);
    signal bb_ethash_search_B5_stall_region_out_global_id_0193 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_stall_region_out_inc123 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_stall_region_out_l_grpid_04 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_stall_region_out_l_grpid_0_addr10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_016_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_016_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_016_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_016_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_016_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_016_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_016_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_0_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_0_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_0_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_0_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_ethash_search_B5_stall_region_out_memdep_205_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_stall_region_out_memdep_205_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B5_stall_region_out_memdep_205_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_ethash_search_B5_stall_region_out_memdep_205_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B5_stall_region_out_memdep_205_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B5_stall_region_out_memdep_205_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B5_stall_region_out_memdep_205_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_ethash_search_B5_stall_region_out_scalarizer_0100163 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_stall_region_out_scalarizer_0100373 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_stall_region_out_scalarizer_0100583 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_stall_region_out_scalarizer_0100793 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_stall_region_out_scalarizer_099323 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_stall_region_out_scalarizer_099533 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_stall_region_out_scalarizer_099743 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_stall_region_out_scalarizer_099953 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_stall_region_out_scalarizer_1100058 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_stall_region_out_scalarizer_1100268 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_stall_region_out_scalarizer_1100478 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_stall_region_out_scalarizer_1100688 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_stall_region_out_scalarizer_1100898 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_stall_region_out_scalarizer_199428 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_stall_region_out_scalarizer_199638 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_stall_region_out_scalarizer_199848 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B5_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B5_stall_region_out_state_0_0_cast121 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B5_stall_region_out_state_4_0_cast124 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B5_stall_region_out_state_5_0_cast127 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B5_stall_region_out_state_6_0_cast130 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B5_stall_region_out_state_7_0_cast133 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B5_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B5_branch_out_acl_1413 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_branch_out_acl_1414 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_branch_out_acl_1415 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_branch_out_acl_1416 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_branch_out_c0_exe1104 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B5_branch_out_c0_exe2109 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B5_branch_out_c0_exe3113 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B5_branch_out_c0_exe4117 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B5_branch_out_c1_exe1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_branch_out_c1_exe2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_branch_out_c1_exe3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_branch_out_c1_exe4 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_branch_out_fpgaindvars_iv_next13 : STD_LOGIC_VECTOR (3 downto 0);
    signal ethash_search_B5_branch_out_global_id_0193 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_branch_out_inc123 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_branch_out_l_grpid_04 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_branch_out_l_grpid_0_addr10 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_branch_out_scalarizer_0100163 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_branch_out_scalarizer_0100373 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_branch_out_scalarizer_0100583 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_branch_out_scalarizer_0100793 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_branch_out_scalarizer_099323 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_branch_out_scalarizer_099533 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_branch_out_scalarizer_099743 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_branch_out_scalarizer_099953 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_branch_out_scalarizer_1100058 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_branch_out_scalarizer_1100268 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_branch_out_scalarizer_1100478 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_branch_out_scalarizer_1100688 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_branch_out_scalarizer_1100898 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_branch_out_scalarizer_199428 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_branch_out_scalarizer_199638 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_branch_out_scalarizer_199848 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B5_branch_out_state_0_0_cast121 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B5_branch_out_state_4_0_cast124 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B5_branch_out_state_5_0_cast127 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B5_branch_out_state_6_0_cast130 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B5_branch_out_state_7_0_cast133 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B5_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B5_branch_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B5_merge_out_arrayidx36_2_RM164 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B5_merge_out_arrayidx45_RM162 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B5_merge_out_c0_exe1104 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B5_merge_out_c0_exe2109 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B5_merge_out_c0_exe3113 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B5_merge_out_c0_exe4117 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B5_merge_out_cmp23156 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B5_merge_out_cmp23_xor158 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B5_merge_out_fpgaindvars_iv12135 : STD_LOGIC_VECTOR (3 downto 0);
    signal ethash_search_B5_merge_out_global_id_0193 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_merge_out_i18_0908153 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_merge_out_idxprom80_RM167 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B5_merge_out_l_grpid_04 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_merge_out_l_grpid_0_addr10 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_merge_out_l_grpid_0_addr_zext160 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B5_merge_out_scalarizer_0100163 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_merge_out_scalarizer_0100373 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_merge_out_scalarizer_0100583 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_merge_out_scalarizer_0100793 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_merge_out_scalarizer_01173137 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_merge_out_scalarizer_01175141 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_merge_out_scalarizer_01177145 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_merge_out_scalarizer_01179149 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_merge_out_scalarizer_099323 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_merge_out_scalarizer_099533 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_merge_out_scalarizer_099743 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_merge_out_scalarizer_099953 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_merge_out_scalarizer_0xor1200168 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_merge_out_scalarizer_1100058 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_merge_out_scalarizer_1100268 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_merge_out_scalarizer_1100478 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_merge_out_scalarizer_1100688 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_merge_out_scalarizer_1100898 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_merge_out_scalarizer_11174139 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_merge_out_scalarizer_11176143 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_merge_out_scalarizer_11178147 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_merge_out_scalarizer_11180151 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_merge_out_scalarizer_199428 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_merge_out_scalarizer_199638 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_merge_out_scalarizer_199848 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_merge_out_scalarizer_1xor1201169 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_merge_out_scalarizer_2xor170 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_merge_out_scalarizer_3xor171 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B5_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B5_merge_out_state_0_0_cast121 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B5_merge_out_state_4_0_cast124 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B5_merge_out_state_5_0_cast127 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B5_merge_out_state_6_0_cast130 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B5_merge_out_state_7_0_cast133 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B5_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- ethash_search_B5_merge(BLACKBOX,4)
    theethash_search_B5_merge : ethash_search_B5_merge
    PORT MAP (
        in_arrayidx36_2_RM164_0 => in_arrayidx36_2_RM164_0,
        in_arrayidx45_RM162_0 => in_arrayidx45_RM162_0,
        in_c0_exe1104_0 => in_c0_exe1104_0,
        in_c0_exe2109_0 => in_c0_exe2109_0,
        in_c0_exe3113_0 => in_c0_exe3113_0,
        in_c0_exe4117_0 => in_c0_exe4117_0,
        in_cmp23156_0 => in_cmp23156_0,
        in_cmp23_xor158_0 => in_cmp23_xor158_0,
        in_fpgaindvars_iv12135_0 => in_fpgaindvars_iv12135_0,
        in_global_id_0193_0 => in_global_id_0193_0,
        in_i18_0908153_0 => in_i18_0908153_0,
        in_idxprom80_RM167_0 => in_idxprom80_RM167_0,
        in_l_grpid_04_0 => in_l_grpid_04_0,
        in_l_grpid_0_addr10_0 => in_l_grpid_0_addr10_0,
        in_l_grpid_0_addr_zext160_0 => in_l_grpid_0_addr_zext160_0,
        in_scalarizer_0100163_0 => in_scalarizer_0100163_0,
        in_scalarizer_0100373_0 => in_scalarizer_0100373_0,
        in_scalarizer_0100583_0 => in_scalarizer_0100583_0,
        in_scalarizer_0100793_0 => in_scalarizer_0100793_0,
        in_scalarizer_01173137_0 => in_scalarizer_01173137_0,
        in_scalarizer_01175141_0 => in_scalarizer_01175141_0,
        in_scalarizer_01177145_0 => in_scalarizer_01177145_0,
        in_scalarizer_01179149_0 => in_scalarizer_01179149_0,
        in_scalarizer_099323_0 => in_scalarizer_099323_0,
        in_scalarizer_099533_0 => in_scalarizer_099533_0,
        in_scalarizer_099743_0 => in_scalarizer_099743_0,
        in_scalarizer_099953_0 => in_scalarizer_099953_0,
        in_scalarizer_0xor1200168_0 => in_scalarizer_0xor1200168_0,
        in_scalarizer_1100058_0 => in_scalarizer_1100058_0,
        in_scalarizer_1100268_0 => in_scalarizer_1100268_0,
        in_scalarizer_1100478_0 => in_scalarizer_1100478_0,
        in_scalarizer_1100688_0 => in_scalarizer_1100688_0,
        in_scalarizer_1100898_0 => in_scalarizer_1100898_0,
        in_scalarizer_11174139_0 => in_scalarizer_11174139_0,
        in_scalarizer_11176143_0 => in_scalarizer_11176143_0,
        in_scalarizer_11178147_0 => in_scalarizer_11178147_0,
        in_scalarizer_11180151_0 => in_scalarizer_11180151_0,
        in_scalarizer_199428_0 => in_scalarizer_199428_0,
        in_scalarizer_199638_0 => in_scalarizer_199638_0,
        in_scalarizer_199848_0 => in_scalarizer_199848_0,
        in_scalarizer_1xor1201169_0 => in_scalarizer_1xor1201169_0,
        in_scalarizer_2xor170_0 => in_scalarizer_2xor170_0,
        in_scalarizer_3xor171_0 => in_scalarizer_3xor171_0,
        in_stall_in => bb_ethash_search_B5_stall_region_out_stall_out,
        in_state_0_0_cast121_0 => in_state_0_0_cast121_0,
        in_state_4_0_cast124_0 => in_state_4_0_cast124_0,
        in_state_5_0_cast127_0 => in_state_5_0_cast127_0,
        in_state_6_0_cast130_0 => in_state_6_0_cast130_0,
        in_state_7_0_cast133_0 => in_state_7_0_cast133_0,
        in_valid_in_0 => in_valid_in_0,
        out_arrayidx36_2_RM164 => ethash_search_B5_merge_out_arrayidx36_2_RM164,
        out_arrayidx45_RM162 => ethash_search_B5_merge_out_arrayidx45_RM162,
        out_c0_exe1104 => ethash_search_B5_merge_out_c0_exe1104,
        out_c0_exe2109 => ethash_search_B5_merge_out_c0_exe2109,
        out_c0_exe3113 => ethash_search_B5_merge_out_c0_exe3113,
        out_c0_exe4117 => ethash_search_B5_merge_out_c0_exe4117,
        out_cmp23156 => ethash_search_B5_merge_out_cmp23156,
        out_cmp23_xor158 => ethash_search_B5_merge_out_cmp23_xor158,
        out_fpgaindvars_iv12135 => ethash_search_B5_merge_out_fpgaindvars_iv12135,
        out_global_id_0193 => ethash_search_B5_merge_out_global_id_0193,
        out_i18_0908153 => ethash_search_B5_merge_out_i18_0908153,
        out_idxprom80_RM167 => ethash_search_B5_merge_out_idxprom80_RM167,
        out_l_grpid_04 => ethash_search_B5_merge_out_l_grpid_04,
        out_l_grpid_0_addr10 => ethash_search_B5_merge_out_l_grpid_0_addr10,
        out_l_grpid_0_addr_zext160 => ethash_search_B5_merge_out_l_grpid_0_addr_zext160,
        out_scalarizer_0100163 => ethash_search_B5_merge_out_scalarizer_0100163,
        out_scalarizer_0100373 => ethash_search_B5_merge_out_scalarizer_0100373,
        out_scalarizer_0100583 => ethash_search_B5_merge_out_scalarizer_0100583,
        out_scalarizer_0100793 => ethash_search_B5_merge_out_scalarizer_0100793,
        out_scalarizer_01173137 => ethash_search_B5_merge_out_scalarizer_01173137,
        out_scalarizer_01175141 => ethash_search_B5_merge_out_scalarizer_01175141,
        out_scalarizer_01177145 => ethash_search_B5_merge_out_scalarizer_01177145,
        out_scalarizer_01179149 => ethash_search_B5_merge_out_scalarizer_01179149,
        out_scalarizer_099323 => ethash_search_B5_merge_out_scalarizer_099323,
        out_scalarizer_099533 => ethash_search_B5_merge_out_scalarizer_099533,
        out_scalarizer_099743 => ethash_search_B5_merge_out_scalarizer_099743,
        out_scalarizer_099953 => ethash_search_B5_merge_out_scalarizer_099953,
        out_scalarizer_0xor1200168 => ethash_search_B5_merge_out_scalarizer_0xor1200168,
        out_scalarizer_1100058 => ethash_search_B5_merge_out_scalarizer_1100058,
        out_scalarizer_1100268 => ethash_search_B5_merge_out_scalarizer_1100268,
        out_scalarizer_1100478 => ethash_search_B5_merge_out_scalarizer_1100478,
        out_scalarizer_1100688 => ethash_search_B5_merge_out_scalarizer_1100688,
        out_scalarizer_1100898 => ethash_search_B5_merge_out_scalarizer_1100898,
        out_scalarizer_11174139 => ethash_search_B5_merge_out_scalarizer_11174139,
        out_scalarizer_11176143 => ethash_search_B5_merge_out_scalarizer_11176143,
        out_scalarizer_11178147 => ethash_search_B5_merge_out_scalarizer_11178147,
        out_scalarizer_11180151 => ethash_search_B5_merge_out_scalarizer_11180151,
        out_scalarizer_199428 => ethash_search_B5_merge_out_scalarizer_199428,
        out_scalarizer_199638 => ethash_search_B5_merge_out_scalarizer_199638,
        out_scalarizer_199848 => ethash_search_B5_merge_out_scalarizer_199848,
        out_scalarizer_1xor1201169 => ethash_search_B5_merge_out_scalarizer_1xor1201169,
        out_scalarizer_2xor170 => ethash_search_B5_merge_out_scalarizer_2xor170,
        out_scalarizer_3xor171 => ethash_search_B5_merge_out_scalarizer_3xor171,
        out_stall_out_0 => ethash_search_B5_merge_out_stall_out_0,
        out_state_0_0_cast121 => ethash_search_B5_merge_out_state_0_0_cast121,
        out_state_4_0_cast124 => ethash_search_B5_merge_out_state_4_0_cast124,
        out_state_5_0_cast127 => ethash_search_B5_merge_out_state_5_0_cast127,
        out_state_6_0_cast130 => ethash_search_B5_merge_out_state_6_0_cast130,
        out_state_7_0_cast133 => ethash_search_B5_merge_out_state_7_0_cast133,
        out_valid_out => ethash_search_B5_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_search_B5_stall_region(BLACKBOX,2)
    thebb_ethash_search_B5_stall_region : bb_ethash_search_B5_stall_region
    PORT MAP (
        in_arrayidx36_2_RM164 => ethash_search_B5_merge_out_arrayidx36_2_RM164,
        in_arrayidx45_RM162 => ethash_search_B5_merge_out_arrayidx45_RM162,
        in_barrier_unnamed_ethash_search36_wgs_workgroup_size => in_barrier_unnamed_ethash_search36_wgs_workgroup_size,
        in_barrier_unnamed_ethash_search40_wgs_workgroup_size => in_barrier_unnamed_ethash_search40_wgs_workgroup_size,
        in_c0_exe1104 => ethash_search_B5_merge_out_c0_exe1104,
        in_c0_exe2109 => ethash_search_B5_merge_out_c0_exe2109,
        in_c0_exe3113 => ethash_search_B5_merge_out_c0_exe3113,
        in_c0_exe4117 => ethash_search_B5_merge_out_c0_exe4117,
        in_cmp23156 => ethash_search_B5_merge_out_cmp23156,
        in_cmp23_xor158 => ethash_search_B5_merge_out_cmp23_xor158,
        in_flush => in_flush,
        in_fpgaindvars_iv12135 => ethash_search_B5_merge_out_fpgaindvars_iv12135,
        in_global_id_0193 => ethash_search_B5_merge_out_global_id_0193,
        in_i18_0908153 => ethash_search_B5_merge_out_i18_0908153,
        in_idxprom80_RM167 => ethash_search_B5_merge_out_idxprom80_RM167,
        in_l_grpid_04 => ethash_search_B5_merge_out_l_grpid_04,
        in_l_grpid_0_addr10 => ethash_search_B5_merge_out_l_grpid_0_addr10,
        in_l_grpid_0_addr_zext160 => ethash_search_B5_merge_out_l_grpid_0_addr_zext160,
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
        in_scalarizer_0100163 => ethash_search_B5_merge_out_scalarizer_0100163,
        in_scalarizer_0100373 => ethash_search_B5_merge_out_scalarizer_0100373,
        in_scalarizer_0100583 => ethash_search_B5_merge_out_scalarizer_0100583,
        in_scalarizer_0100793 => ethash_search_B5_merge_out_scalarizer_0100793,
        in_scalarizer_01173137 => ethash_search_B5_merge_out_scalarizer_01173137,
        in_scalarizer_01175141 => ethash_search_B5_merge_out_scalarizer_01175141,
        in_scalarizer_01177145 => ethash_search_B5_merge_out_scalarizer_01177145,
        in_scalarizer_01179149 => ethash_search_B5_merge_out_scalarizer_01179149,
        in_scalarizer_099323 => ethash_search_B5_merge_out_scalarizer_099323,
        in_scalarizer_099533 => ethash_search_B5_merge_out_scalarizer_099533,
        in_scalarizer_099743 => ethash_search_B5_merge_out_scalarizer_099743,
        in_scalarizer_099953 => ethash_search_B5_merge_out_scalarizer_099953,
        in_scalarizer_0xor1200168 => ethash_search_B5_merge_out_scalarizer_0xor1200168,
        in_scalarizer_1100058 => ethash_search_B5_merge_out_scalarizer_1100058,
        in_scalarizer_1100268 => ethash_search_B5_merge_out_scalarizer_1100268,
        in_scalarizer_1100478 => ethash_search_B5_merge_out_scalarizer_1100478,
        in_scalarizer_1100688 => ethash_search_B5_merge_out_scalarizer_1100688,
        in_scalarizer_1100898 => ethash_search_B5_merge_out_scalarizer_1100898,
        in_scalarizer_11174139 => ethash_search_B5_merge_out_scalarizer_11174139,
        in_scalarizer_11176143 => ethash_search_B5_merge_out_scalarizer_11176143,
        in_scalarizer_11178147 => ethash_search_B5_merge_out_scalarizer_11178147,
        in_scalarizer_11180151 => ethash_search_B5_merge_out_scalarizer_11180151,
        in_scalarizer_199428 => ethash_search_B5_merge_out_scalarizer_199428,
        in_scalarizer_199638 => ethash_search_B5_merge_out_scalarizer_199638,
        in_scalarizer_199848 => ethash_search_B5_merge_out_scalarizer_199848,
        in_scalarizer_1xor1201169 => ethash_search_B5_merge_out_scalarizer_1xor1201169,
        in_scalarizer_2xor170 => ethash_search_B5_merge_out_scalarizer_2xor170,
        in_scalarizer_3xor171 => ethash_search_B5_merge_out_scalarizer_3xor171,
        in_stall_in => ethash_search_B5_branch_out_stall_out,
        in_state_0_0_cast121 => ethash_search_B5_merge_out_state_0_0_cast121,
        in_state_4_0_cast124 => ethash_search_B5_merge_out_state_4_0_cast124,
        in_state_5_0_cast127 => ethash_search_B5_merge_out_state_5_0_cast127,
        in_state_6_0_cast130 => ethash_search_B5_merge_out_state_6_0_cast130,
        in_state_7_0_cast133 => ethash_search_B5_merge_out_state_7_0_cast133,
        in_valid_in => ethash_search_B5_merge_out_valid_out,
        out_acl_1413 => bb_ethash_search_B5_stall_region_out_acl_1413,
        out_acl_1414 => bb_ethash_search_B5_stall_region_out_acl_1414,
        out_acl_1415 => bb_ethash_search_B5_stall_region_out_acl_1415,
        out_acl_1416 => bb_ethash_search_B5_stall_region_out_acl_1416,
        out_c0_exe1104 => bb_ethash_search_B5_stall_region_out_c0_exe1104,
        out_c0_exe2109 => bb_ethash_search_B5_stall_region_out_c0_exe2109,
        out_c0_exe3113 => bb_ethash_search_B5_stall_region_out_c0_exe3113,
        out_c0_exe4117 => bb_ethash_search_B5_stall_region_out_c0_exe4117,
        out_c1_exe1 => bb_ethash_search_B5_stall_region_out_c1_exe1,
        out_c1_exe2 => bb_ethash_search_B5_stall_region_out_c1_exe2,
        out_c1_exe3 => bb_ethash_search_B5_stall_region_out_c1_exe3,
        out_c1_exe4 => bb_ethash_search_B5_stall_region_out_c1_exe4,
        out_exitcond14 => bb_ethash_search_B5_stall_region_out_exitcond14,
        out_fpgaindvars_iv_next13 => bb_ethash_search_B5_stall_region_out_fpgaindvars_iv_next13,
        out_global_id_0193 => bb_ethash_search_B5_stall_region_out_global_id_0193,
        out_inc123 => bb_ethash_search_B5_stall_region_out_inc123,
        out_l_grpid_04 => bb_ethash_search_B5_stall_region_out_l_grpid_04,
        out_l_grpid_0_addr10 => bb_ethash_search_B5_stall_region_out_l_grpid_0_addr10,
        out_memcoalesce_null_load_016_avm_address => bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_016_avm_address,
        out_memcoalesce_null_load_016_avm_burstcount => bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_016_avm_burstcount,
        out_memcoalesce_null_load_016_avm_byteenable => bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_016_avm_byteenable,
        out_memcoalesce_null_load_016_avm_enable => bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_016_avm_enable,
        out_memcoalesce_null_load_016_avm_read => bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_016_avm_read,
        out_memcoalesce_null_load_016_avm_write => bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_016_avm_write,
        out_memcoalesce_null_load_016_avm_writedata => bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_016_avm_writedata,
        out_memcoalesce_null_load_0_avm_address => bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_0_avm_address,
        out_memcoalesce_null_load_0_avm_burstcount => bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_0_avm_burstcount,
        out_memcoalesce_null_load_0_avm_byteenable => bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_0_avm_byteenable,
        out_memcoalesce_null_load_0_avm_enable => bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_0_avm_enable,
        out_memcoalesce_null_load_0_avm_read => bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_0_avm_read,
        out_memcoalesce_null_load_0_avm_write => bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_0_avm_write,
        out_memcoalesce_null_load_0_avm_writedata => bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_0_avm_writedata,
        out_memdep_205_avm_address => bb_ethash_search_B5_stall_region_out_memdep_205_avm_address,
        out_memdep_205_avm_burstcount => bb_ethash_search_B5_stall_region_out_memdep_205_avm_burstcount,
        out_memdep_205_avm_byteenable => bb_ethash_search_B5_stall_region_out_memdep_205_avm_byteenable,
        out_memdep_205_avm_enable => bb_ethash_search_B5_stall_region_out_memdep_205_avm_enable,
        out_memdep_205_avm_read => bb_ethash_search_B5_stall_region_out_memdep_205_avm_read,
        out_memdep_205_avm_write => bb_ethash_search_B5_stall_region_out_memdep_205_avm_write,
        out_memdep_205_avm_writedata => bb_ethash_search_B5_stall_region_out_memdep_205_avm_writedata,
        out_scalarizer_0100163 => bb_ethash_search_B5_stall_region_out_scalarizer_0100163,
        out_scalarizer_0100373 => bb_ethash_search_B5_stall_region_out_scalarizer_0100373,
        out_scalarizer_0100583 => bb_ethash_search_B5_stall_region_out_scalarizer_0100583,
        out_scalarizer_0100793 => bb_ethash_search_B5_stall_region_out_scalarizer_0100793,
        out_scalarizer_099323 => bb_ethash_search_B5_stall_region_out_scalarizer_099323,
        out_scalarizer_099533 => bb_ethash_search_B5_stall_region_out_scalarizer_099533,
        out_scalarizer_099743 => bb_ethash_search_B5_stall_region_out_scalarizer_099743,
        out_scalarizer_099953 => bb_ethash_search_B5_stall_region_out_scalarizer_099953,
        out_scalarizer_1100058 => bb_ethash_search_B5_stall_region_out_scalarizer_1100058,
        out_scalarizer_1100268 => bb_ethash_search_B5_stall_region_out_scalarizer_1100268,
        out_scalarizer_1100478 => bb_ethash_search_B5_stall_region_out_scalarizer_1100478,
        out_scalarizer_1100688 => bb_ethash_search_B5_stall_region_out_scalarizer_1100688,
        out_scalarizer_1100898 => bb_ethash_search_B5_stall_region_out_scalarizer_1100898,
        out_scalarizer_199428 => bb_ethash_search_B5_stall_region_out_scalarizer_199428,
        out_scalarizer_199638 => bb_ethash_search_B5_stall_region_out_scalarizer_199638,
        out_scalarizer_199848 => bb_ethash_search_B5_stall_region_out_scalarizer_199848,
        out_stall_out => bb_ethash_search_B5_stall_region_out_stall_out,
        out_state_0_0_cast121 => bb_ethash_search_B5_stall_region_out_state_0_0_cast121,
        out_state_4_0_cast124 => bb_ethash_search_B5_stall_region_out_state_4_0_cast124,
        out_state_5_0_cast127 => bb_ethash_search_B5_stall_region_out_state_5_0_cast127,
        out_state_6_0_cast130 => bb_ethash_search_B5_stall_region_out_state_6_0_cast130,
        out_state_7_0_cast133 => bb_ethash_search_B5_stall_region_out_state_7_0_cast133,
        out_valid_out => bb_ethash_search_B5_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- ethash_search_B5_branch(BLACKBOX,3)
    theethash_search_B5_branch : ethash_search_B5_branch
    PORT MAP (
        in_acl_1413 => bb_ethash_search_B5_stall_region_out_acl_1413,
        in_acl_1414 => bb_ethash_search_B5_stall_region_out_acl_1414,
        in_acl_1415 => bb_ethash_search_B5_stall_region_out_acl_1415,
        in_acl_1416 => bb_ethash_search_B5_stall_region_out_acl_1416,
        in_c0_exe1104 => bb_ethash_search_B5_stall_region_out_c0_exe1104,
        in_c0_exe2109 => bb_ethash_search_B5_stall_region_out_c0_exe2109,
        in_c0_exe3113 => bb_ethash_search_B5_stall_region_out_c0_exe3113,
        in_c0_exe4117 => bb_ethash_search_B5_stall_region_out_c0_exe4117,
        in_c1_exe1 => bb_ethash_search_B5_stall_region_out_c1_exe1,
        in_c1_exe2 => bb_ethash_search_B5_stall_region_out_c1_exe2,
        in_c1_exe3 => bb_ethash_search_B5_stall_region_out_c1_exe3,
        in_c1_exe4 => bb_ethash_search_B5_stall_region_out_c1_exe4,
        in_exitcond14 => bb_ethash_search_B5_stall_region_out_exitcond14,
        in_fpgaindvars_iv_next13 => bb_ethash_search_B5_stall_region_out_fpgaindvars_iv_next13,
        in_global_id_0193 => bb_ethash_search_B5_stall_region_out_global_id_0193,
        in_inc123 => bb_ethash_search_B5_stall_region_out_inc123,
        in_l_grpid_04 => bb_ethash_search_B5_stall_region_out_l_grpid_04,
        in_l_grpid_0_addr10 => bb_ethash_search_B5_stall_region_out_l_grpid_0_addr10,
        in_scalarizer_0100163 => bb_ethash_search_B5_stall_region_out_scalarizer_0100163,
        in_scalarizer_0100373 => bb_ethash_search_B5_stall_region_out_scalarizer_0100373,
        in_scalarizer_0100583 => bb_ethash_search_B5_stall_region_out_scalarizer_0100583,
        in_scalarizer_0100793 => bb_ethash_search_B5_stall_region_out_scalarizer_0100793,
        in_scalarizer_099323 => bb_ethash_search_B5_stall_region_out_scalarizer_099323,
        in_scalarizer_099533 => bb_ethash_search_B5_stall_region_out_scalarizer_099533,
        in_scalarizer_099743 => bb_ethash_search_B5_stall_region_out_scalarizer_099743,
        in_scalarizer_099953 => bb_ethash_search_B5_stall_region_out_scalarizer_099953,
        in_scalarizer_1100058 => bb_ethash_search_B5_stall_region_out_scalarizer_1100058,
        in_scalarizer_1100268 => bb_ethash_search_B5_stall_region_out_scalarizer_1100268,
        in_scalarizer_1100478 => bb_ethash_search_B5_stall_region_out_scalarizer_1100478,
        in_scalarizer_1100688 => bb_ethash_search_B5_stall_region_out_scalarizer_1100688,
        in_scalarizer_1100898 => bb_ethash_search_B5_stall_region_out_scalarizer_1100898,
        in_scalarizer_199428 => bb_ethash_search_B5_stall_region_out_scalarizer_199428,
        in_scalarizer_199638 => bb_ethash_search_B5_stall_region_out_scalarizer_199638,
        in_scalarizer_199848 => bb_ethash_search_B5_stall_region_out_scalarizer_199848,
        in_stall_in_0 => in_stall_in_0,
        in_stall_in_1 => in_stall_in_1,
        in_state_0_0_cast121 => bb_ethash_search_B5_stall_region_out_state_0_0_cast121,
        in_state_4_0_cast124 => bb_ethash_search_B5_stall_region_out_state_4_0_cast124,
        in_state_5_0_cast127 => bb_ethash_search_B5_stall_region_out_state_5_0_cast127,
        in_state_6_0_cast130 => bb_ethash_search_B5_stall_region_out_state_6_0_cast130,
        in_state_7_0_cast133 => bb_ethash_search_B5_stall_region_out_state_7_0_cast133,
        in_valid_in => bb_ethash_search_B5_stall_region_out_valid_out,
        out_acl_1413 => ethash_search_B5_branch_out_acl_1413,
        out_acl_1414 => ethash_search_B5_branch_out_acl_1414,
        out_acl_1415 => ethash_search_B5_branch_out_acl_1415,
        out_acl_1416 => ethash_search_B5_branch_out_acl_1416,
        out_c0_exe1104 => ethash_search_B5_branch_out_c0_exe1104,
        out_c0_exe2109 => ethash_search_B5_branch_out_c0_exe2109,
        out_c0_exe3113 => ethash_search_B5_branch_out_c0_exe3113,
        out_c0_exe4117 => ethash_search_B5_branch_out_c0_exe4117,
        out_c1_exe1 => ethash_search_B5_branch_out_c1_exe1,
        out_c1_exe2 => ethash_search_B5_branch_out_c1_exe2,
        out_c1_exe3 => ethash_search_B5_branch_out_c1_exe3,
        out_c1_exe4 => ethash_search_B5_branch_out_c1_exe4,
        out_fpgaindvars_iv_next13 => ethash_search_B5_branch_out_fpgaindvars_iv_next13,
        out_global_id_0193 => ethash_search_B5_branch_out_global_id_0193,
        out_inc123 => ethash_search_B5_branch_out_inc123,
        out_l_grpid_04 => ethash_search_B5_branch_out_l_grpid_04,
        out_l_grpid_0_addr10 => ethash_search_B5_branch_out_l_grpid_0_addr10,
        out_scalarizer_0100163 => ethash_search_B5_branch_out_scalarizer_0100163,
        out_scalarizer_0100373 => ethash_search_B5_branch_out_scalarizer_0100373,
        out_scalarizer_0100583 => ethash_search_B5_branch_out_scalarizer_0100583,
        out_scalarizer_0100793 => ethash_search_B5_branch_out_scalarizer_0100793,
        out_scalarizer_099323 => ethash_search_B5_branch_out_scalarizer_099323,
        out_scalarizer_099533 => ethash_search_B5_branch_out_scalarizer_099533,
        out_scalarizer_099743 => ethash_search_B5_branch_out_scalarizer_099743,
        out_scalarizer_099953 => ethash_search_B5_branch_out_scalarizer_099953,
        out_scalarizer_1100058 => ethash_search_B5_branch_out_scalarizer_1100058,
        out_scalarizer_1100268 => ethash_search_B5_branch_out_scalarizer_1100268,
        out_scalarizer_1100478 => ethash_search_B5_branch_out_scalarizer_1100478,
        out_scalarizer_1100688 => ethash_search_B5_branch_out_scalarizer_1100688,
        out_scalarizer_1100898 => ethash_search_B5_branch_out_scalarizer_1100898,
        out_scalarizer_199428 => ethash_search_B5_branch_out_scalarizer_199428,
        out_scalarizer_199638 => ethash_search_B5_branch_out_scalarizer_199638,
        out_scalarizer_199848 => ethash_search_B5_branch_out_scalarizer_199848,
        out_stall_out => ethash_search_B5_branch_out_stall_out,
        out_state_0_0_cast121 => ethash_search_B5_branch_out_state_0_0_cast121,
        out_state_4_0_cast124 => ethash_search_B5_branch_out_state_4_0_cast124,
        out_state_5_0_cast127 => ethash_search_B5_branch_out_state_5_0_cast127,
        out_state_6_0_cast130 => ethash_search_B5_branch_out_state_6_0_cast130,
        out_state_7_0_cast133 => ethash_search_B5_branch_out_state_7_0_cast133,
        out_valid_out_0 => ethash_search_B5_branch_out_valid_out_0,
        out_valid_out_1 => ethash_search_B5_branch_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_acl_1413(GPOUT,74)
    out_acl_1413 <= ethash_search_B5_branch_out_acl_1413;

    -- out_acl_1414(GPOUT,75)
    out_acl_1414 <= ethash_search_B5_branch_out_acl_1414;

    -- out_acl_1415(GPOUT,76)
    out_acl_1415 <= ethash_search_B5_branch_out_acl_1415;

    -- out_acl_1416(GPOUT,77)
    out_acl_1416 <= ethash_search_B5_branch_out_acl_1416;

    -- out_c0_exe1104(GPOUT,78)
    out_c0_exe1104 <= ethash_search_B5_branch_out_c0_exe1104;

    -- out_c0_exe2109(GPOUT,79)
    out_c0_exe2109 <= ethash_search_B5_branch_out_c0_exe2109;

    -- out_c0_exe3113(GPOUT,80)
    out_c0_exe3113 <= ethash_search_B5_branch_out_c0_exe3113;

    -- out_c0_exe4117(GPOUT,81)
    out_c0_exe4117 <= ethash_search_B5_branch_out_c0_exe4117;

    -- out_c1_exe1(GPOUT,82)
    out_c1_exe1 <= ethash_search_B5_branch_out_c1_exe1;

    -- out_c1_exe2(GPOUT,83)
    out_c1_exe2 <= ethash_search_B5_branch_out_c1_exe2;

    -- out_c1_exe3(GPOUT,84)
    out_c1_exe3 <= ethash_search_B5_branch_out_c1_exe3;

    -- out_c1_exe4(GPOUT,85)
    out_c1_exe4 <= ethash_search_B5_branch_out_c1_exe4;

    -- out_fpgaindvars_iv_next13(GPOUT,86)
    out_fpgaindvars_iv_next13 <= ethash_search_B5_branch_out_fpgaindvars_iv_next13;

    -- out_global_id_0193(GPOUT,87)
    out_global_id_0193 <= ethash_search_B5_branch_out_global_id_0193;

    -- out_inc123(GPOUT,88)
    out_inc123 <= ethash_search_B5_branch_out_inc123;

    -- out_l_grpid_04(GPOUT,89)
    out_l_grpid_04 <= ethash_search_B5_branch_out_l_grpid_04;

    -- out_l_grpid_0_addr10(GPOUT,90)
    out_l_grpid_0_addr10 <= ethash_search_B5_branch_out_l_grpid_0_addr10;

    -- out_memcoalesce_null_load_016_avm_address(GPOUT,91)
    out_memcoalesce_null_load_016_avm_address <= bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_016_avm_address;

    -- out_memcoalesce_null_load_016_avm_burstcount(GPOUT,92)
    out_memcoalesce_null_load_016_avm_burstcount <= bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_016_avm_burstcount;

    -- out_memcoalesce_null_load_016_avm_byteenable(GPOUT,93)
    out_memcoalesce_null_load_016_avm_byteenable <= bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_016_avm_byteenable;

    -- out_memcoalesce_null_load_016_avm_enable(GPOUT,94)
    out_memcoalesce_null_load_016_avm_enable <= bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_016_avm_enable;

    -- out_memcoalesce_null_load_016_avm_read(GPOUT,95)
    out_memcoalesce_null_load_016_avm_read <= bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_016_avm_read;

    -- out_memcoalesce_null_load_016_avm_write(GPOUT,96)
    out_memcoalesce_null_load_016_avm_write <= bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_016_avm_write;

    -- out_memcoalesce_null_load_016_avm_writedata(GPOUT,97)
    out_memcoalesce_null_load_016_avm_writedata <= bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_016_avm_writedata;

    -- out_memcoalesce_null_load_0_avm_address(GPOUT,98)
    out_memcoalesce_null_load_0_avm_address <= bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_0_avm_address;

    -- out_memcoalesce_null_load_0_avm_burstcount(GPOUT,99)
    out_memcoalesce_null_load_0_avm_burstcount <= bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_0_avm_burstcount;

    -- out_memcoalesce_null_load_0_avm_byteenable(GPOUT,100)
    out_memcoalesce_null_load_0_avm_byteenable <= bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_0_avm_byteenable;

    -- out_memcoalesce_null_load_0_avm_enable(GPOUT,101)
    out_memcoalesce_null_load_0_avm_enable <= bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_0_avm_enable;

    -- out_memcoalesce_null_load_0_avm_read(GPOUT,102)
    out_memcoalesce_null_load_0_avm_read <= bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_0_avm_read;

    -- out_memcoalesce_null_load_0_avm_write(GPOUT,103)
    out_memcoalesce_null_load_0_avm_write <= bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_0_avm_write;

    -- out_memcoalesce_null_load_0_avm_writedata(GPOUT,104)
    out_memcoalesce_null_load_0_avm_writedata <= bb_ethash_search_B5_stall_region_out_memcoalesce_null_load_0_avm_writedata;

    -- out_memdep_205_avm_address(GPOUT,105)
    out_memdep_205_avm_address <= bb_ethash_search_B5_stall_region_out_memdep_205_avm_address;

    -- out_memdep_205_avm_burstcount(GPOUT,106)
    out_memdep_205_avm_burstcount <= bb_ethash_search_B5_stall_region_out_memdep_205_avm_burstcount;

    -- out_memdep_205_avm_byteenable(GPOUT,107)
    out_memdep_205_avm_byteenable <= bb_ethash_search_B5_stall_region_out_memdep_205_avm_byteenable;

    -- out_memdep_205_avm_enable(GPOUT,108)
    out_memdep_205_avm_enable <= bb_ethash_search_B5_stall_region_out_memdep_205_avm_enable;

    -- out_memdep_205_avm_read(GPOUT,109)
    out_memdep_205_avm_read <= bb_ethash_search_B5_stall_region_out_memdep_205_avm_read;

    -- out_memdep_205_avm_write(GPOUT,110)
    out_memdep_205_avm_write <= bb_ethash_search_B5_stall_region_out_memdep_205_avm_write;

    -- out_memdep_205_avm_writedata(GPOUT,111)
    out_memdep_205_avm_writedata <= bb_ethash_search_B5_stall_region_out_memdep_205_avm_writedata;

    -- out_scalarizer_0100163(GPOUT,112)
    out_scalarizer_0100163 <= ethash_search_B5_branch_out_scalarizer_0100163;

    -- out_scalarizer_0100373(GPOUT,113)
    out_scalarizer_0100373 <= ethash_search_B5_branch_out_scalarizer_0100373;

    -- out_scalarizer_0100583(GPOUT,114)
    out_scalarizer_0100583 <= ethash_search_B5_branch_out_scalarizer_0100583;

    -- out_scalarizer_0100793(GPOUT,115)
    out_scalarizer_0100793 <= ethash_search_B5_branch_out_scalarizer_0100793;

    -- out_scalarizer_099323(GPOUT,116)
    out_scalarizer_099323 <= ethash_search_B5_branch_out_scalarizer_099323;

    -- out_scalarizer_099533(GPOUT,117)
    out_scalarizer_099533 <= ethash_search_B5_branch_out_scalarizer_099533;

    -- out_scalarizer_099743(GPOUT,118)
    out_scalarizer_099743 <= ethash_search_B5_branch_out_scalarizer_099743;

    -- out_scalarizer_099953(GPOUT,119)
    out_scalarizer_099953 <= ethash_search_B5_branch_out_scalarizer_099953;

    -- out_scalarizer_1100058(GPOUT,120)
    out_scalarizer_1100058 <= ethash_search_B5_branch_out_scalarizer_1100058;

    -- out_scalarizer_1100268(GPOUT,121)
    out_scalarizer_1100268 <= ethash_search_B5_branch_out_scalarizer_1100268;

    -- out_scalarizer_1100478(GPOUT,122)
    out_scalarizer_1100478 <= ethash_search_B5_branch_out_scalarizer_1100478;

    -- out_scalarizer_1100688(GPOUT,123)
    out_scalarizer_1100688 <= ethash_search_B5_branch_out_scalarizer_1100688;

    -- out_scalarizer_1100898(GPOUT,124)
    out_scalarizer_1100898 <= ethash_search_B5_branch_out_scalarizer_1100898;

    -- out_scalarizer_199428(GPOUT,125)
    out_scalarizer_199428 <= ethash_search_B5_branch_out_scalarizer_199428;

    -- out_scalarizer_199638(GPOUT,126)
    out_scalarizer_199638 <= ethash_search_B5_branch_out_scalarizer_199638;

    -- out_scalarizer_199848(GPOUT,127)
    out_scalarizer_199848 <= ethash_search_B5_branch_out_scalarizer_199848;

    -- out_stall_out_0(GPOUT,128)
    out_stall_out_0 <= ethash_search_B5_merge_out_stall_out_0;

    -- out_state_0_0_cast121(GPOUT,129)
    out_state_0_0_cast121 <= ethash_search_B5_branch_out_state_0_0_cast121;

    -- out_state_4_0_cast124(GPOUT,130)
    out_state_4_0_cast124 <= ethash_search_B5_branch_out_state_4_0_cast124;

    -- out_state_5_0_cast127(GPOUT,131)
    out_state_5_0_cast127 <= ethash_search_B5_branch_out_state_5_0_cast127;

    -- out_state_6_0_cast130(GPOUT,132)
    out_state_6_0_cast130 <= ethash_search_B5_branch_out_state_6_0_cast130;

    -- out_state_7_0_cast133(GPOUT,133)
    out_state_7_0_cast133 <= ethash_search_B5_branch_out_state_7_0_cast133;

    -- out_valid_out_0(GPOUT,134)
    out_valid_out_0 <= ethash_search_B5_branch_out_valid_out_0;

    -- out_valid_out_1(GPOUT,135)
    out_valid_out_1 <= ethash_search_B5_branch_out_valid_out_1;

END normal;
