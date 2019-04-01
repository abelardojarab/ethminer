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

-- VHDL created from bb_ethash_search_B3
-- VHDL created on Mon Apr  1 13:53:04 2019


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

entity bb_ethash_search_B3 is
    port (
        out_unnamed_ethash_search27_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_ethash_search27_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_ethash_search27_2 : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_ethash_search27_3 : out std_logic_vector(31 downto 0);  -- ufix32
        out_and_RM : out std_logic_vector(31 downto 0);  -- ufix32
        out_arraydecay51_RM : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx36_2_RM : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx45_RM : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe1106 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe2108 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe3112 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe4116 : out std_logic_vector(63 downto 0);  -- ufix64
        out_cmp23 : out std_logic_vector(0 downto 0);  -- ufix1
        out_cmp23_xor : out std_logic_vector(0 downto 0);  -- ufix1
        out_fpgaindvars_iv12 : out std_logic_vector(3 downto 0);  -- ufix4
        out_global_id_0195 : out std_logic_vector(31 downto 0);  -- ufix32
        out_i18_0908 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_06 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0_addr9 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0_addr_zext : out std_logic_vector(63 downto 0);  -- ufix64
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
        out_memdep_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_memdep_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_scalarizer_0100165 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0100375 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0100585 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0100795 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01173 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01175 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01177 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01179 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099325 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099535 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099745 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099955 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100060 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100270 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100480 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100690 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11008100 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11174 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11176 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11178 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11180 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_199430 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_199640 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_199850 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_state_0_0_cast120 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_4_0_cast123 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_5_0_cast126 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_6_0_cast129 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_7_0_cast132 : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_ethash_search27_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_ethash_search27_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search27_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_unnamed_ethash_search27_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search27_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search27_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search27_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_unnamed_ethash_search28 : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_ethash_search28_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_ethash_search28_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search28_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_unnamed_ethash_search28_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search28_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search28_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search28_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        in_barrier_unnamed_ethash_search29_wgs_workgroup_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_barrier_unnamed_ethash_search30_wgs_workgroup_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_barrier_unnamed_ethash_search31_wgs_workgroup_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1106_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1106_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2108_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe2108_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe3112_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe3112_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe4116_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe4116_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_encoder_ethash_search_B3_merge_priority_encoder_workgroup_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_fpgaindvars_iv12_0 : in std_logic_vector(3 downto 0);  -- ufix4
        in_fpgaindvars_iv12_1 : in std_logic_vector(3 downto 0);  -- ufix4
        in_g_dag : in std_logic_vector(63 downto 0);  -- ufix64
        in_g_output : in std_logic_vector(63 downto 0);  -- ufix64
        in_global_id_0195_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_global_id_0195_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i18_0908_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i18_0908_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_06_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_06_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr9_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr9_1 : in std_logic_vector(31 downto 0);  -- ufix32
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
        in_memdep_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memdep_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_scalarizer_0100165_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100165_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100375_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100375_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100585_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100585_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100795_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100795_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01173_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01173_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01175_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01175_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01177_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01177_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01179_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01179_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099325_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099325_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099535_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099535_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099745_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099745_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099955_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099955_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100060_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100060_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100270_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100270_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100480_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100480_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100690_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100690_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11008100_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11008100_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11174_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11174_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11176_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11176_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11178_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11178_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11180_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11180_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199430_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199430_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199640_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199640_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199850_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199850_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_state_0_0_cast120_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_0_0_cast120_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_4_0_cast123_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_4_0_cast123_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_5_0_cast126_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_5_0_cast126_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_6_0_cast129_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_6_0_cast129_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_7_0_cast132_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_7_0_cast132_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_target : in std_logic_vector(63 downto 0);  -- ufix64
        in_unnamed_ethash_search27_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_unnamed_ethash_search27_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search27_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search27_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search28_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_unnamed_ethash_search28_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search28_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search28_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_ethash_search_B3;

architecture normal of bb_ethash_search_B3 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component ethash_search_B3_branch is
        port (
            in_unnamed_ethash_search27_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_unnamed_ethash_search27_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_unnamed_ethash_search27_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_unnamed_ethash_search27_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_and_RM : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arraydecay51_RM : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx36_2_RM : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx45_RM : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe1106 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2108 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe3112 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe4116 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_cmp23 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_cmp23_xor : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_fpgaindvars_iv12 : in std_logic_vector(3 downto 0);  -- Fixed Point
            in_global_id_0195 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i18_0908 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_06 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr_zext : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_scalarizer_0100165 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100375 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100585 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100795 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01173 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01175 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01177 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01179 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099325 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099535 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099745 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099955 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100060 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100270 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100480 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100690 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11008100 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11174 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11176 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11178 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11180 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199430 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199640 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199850 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_state_0_0_cast120 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_4_0_cast123 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_5_0_cast126 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_6_0_cast129 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_7_0_cast132 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_unnamed_ethash_search28 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_state_0_0_cast120 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_4_0_cast123 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_5_0_cast126 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_6_0_cast129 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_7_0_cast132 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_unnamed_ethash_search28 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_search_B3_stall_region is
        port (
            in_barrier_unnamed_ethash_search29_wgs_workgroup_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_barrier_unnamed_ethash_search30_wgs_workgroup_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_barrier_unnamed_ethash_search31_wgs_workgroup_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1106 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2108 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe3112 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe4116 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_fpgaindvars_iv12 : in std_logic_vector(3 downto 0);  -- Fixed Point
            in_global_id_0195 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i18_0908 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_06 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr9 : in std_logic_vector(31 downto 0);  -- Fixed Point
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
            in_scalarizer_0100165 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100375 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100585 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100795 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01173 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01175 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01177 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01179 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099325 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099535 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099745 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099955 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100060 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100270 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100480 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100690 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11008100 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11174 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11176 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11178 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11180 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199430 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199640 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199850 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_state_0_0_cast120 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_4_0_cast123 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_5_0_cast126 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_6_0_cast129 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_7_0_cast132 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_unnamed_ethash_search27_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_unnamed_ethash_search27_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search27_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search27_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search28_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_unnamed_ethash_search28_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search28_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search28_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component ethash_search_B3_merge is
        port (
            in_c0_exe1106_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe1106_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2108_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe2108_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe3112_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe3112_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe4116_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe4116_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_encoder_ethash_search_B3_merge_priority_encoder_workgroup_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_fpgaindvars_iv12_0 : in std_logic_vector(3 downto 0);  -- Fixed Point
            in_fpgaindvars_iv12_1 : in std_logic_vector(3 downto 0);  -- Fixed Point
            in_global_id_0195_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_id_0195_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i18_0908_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i18_0908_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_06_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_06_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr9_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr9_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
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
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1106 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2108 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe3112 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe4116 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_fpgaindvars_iv12 : out std_logic_vector(3 downto 0);  -- Fixed Point
            out_global_id_0195 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_i18_0908 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_06 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr9 : out std_logic_vector(31 downto 0);  -- Fixed Point
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
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component dupName_1_loop_capacity_FIFO_2u1i4agm0676j6e6x6s6u0qc0xgbuoz is
        port (
            in_data_in : in std_logic_vector(1412 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(1412 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal dupName_0_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_1_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_2_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_3_data_out_select_x_b : STD_LOGIC_VECTOR (3 downto 0);
    signal dupName_4_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_5_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_6_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_7_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_8_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_9_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_10_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_11_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_12_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_13_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_14_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_15_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_16_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_17_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_18_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_19_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_20_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_21_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_22_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_23_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_24_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_25_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_26_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_27_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_28_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_29_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_30_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_31_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_32_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_33_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_34_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_35_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_36_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_unnamed_ethash_search27_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_unnamed_ethash_search27_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_unnamed_ethash_search27_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_unnamed_ethash_search27_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_and_RM : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_arraydecay51_RM : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_arrayidx36_2_RM : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_arrayidx45_RM : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_c0_exe1106 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_c0_exe2108 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_c0_exe3112 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_c0_exe4116 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_cmp23 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_cmp23_xor : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_fpgaindvars_iv12 : STD_LOGIC_VECTOR (3 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_global_id_0195 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_i18_0908 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_l_grpid_06 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_l_grpid_0_addr9 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_l_grpid_0_addr_zext : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_scalarizer_0100165 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_scalarizer_0100375 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_scalarizer_0100585 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_scalarizer_0100795 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_scalarizer_01173 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_scalarizer_01175 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_scalarizer_01177 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_scalarizer_01179 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_scalarizer_099325 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_scalarizer_099535 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_scalarizer_099745 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_scalarizer_099955 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_scalarizer_1100060 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_scalarizer_1100270 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_scalarizer_1100480 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_scalarizer_1100690 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_scalarizer_11008100 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_scalarizer_11174 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_scalarizer_11176 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_scalarizer_11178 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_scalarizer_11180 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_scalarizer_199430 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_scalarizer_199640 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_scalarizer_199850 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_state_0_0_cast120 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_state_4_0_cast123 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_state_5_0_cast126 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_state_6_0_cast129 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_state_7_0_cast132 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_unnamed_ethash_search28 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_branch_vunroll_x_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal num0_cast_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal num10_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num11_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num12_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num13_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num14_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num15_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num16_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num17_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num18_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num19_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num1_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num20_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num21_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num22_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num23_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num24_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num25_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num26_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num27_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num28_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num29_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num2_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num30_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num31_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num32_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num33_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num34_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num35_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num36_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num37_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num3_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num4_cast_x_b : STD_LOGIC_VECTOR (3 downto 0);
    signal num5_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num6_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num7_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num8_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num9_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal aggregateWireOut_join_q : STD_LOGIC_VECTOR (1412 downto 0);
    signal bb_ethash_search_B3_stall_region_out_unnamed_ethash_search27_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_unnamed_ethash_search27_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_unnamed_ethash_search27_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_unnamed_ethash_search27_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_and_RM : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_arraydecay51_RM : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_stall_region_out_arrayidx36_2_RM : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_stall_region_out_arrayidx45_RM : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_stall_region_out_c0_exe1106 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_stall_region_out_c0_exe2108 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_stall_region_out_c0_exe3112 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_stall_region_out_c0_exe4116 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_stall_region_out_cmp23 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_stall_region_out_cmp23_xor : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_stall_region_out_fpgaindvars_iv12 : STD_LOGIC_VECTOR (3 downto 0);
    signal bb_ethash_search_B3_stall_region_out_global_id_0195 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_i18_0908 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_l_grpid_06 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_l_grpid_0_addr9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_l_grpid_0_addr_zext : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_stall_region_out_memdep_198_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_memdep_198_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_stall_region_out_memdep_198_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_ethash_search_B3_stall_region_out_memdep_198_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_stall_region_out_memdep_198_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_stall_region_out_memdep_198_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_stall_region_out_memdep_198_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_ethash_search_B3_stall_region_out_memdep_199_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_memdep_199_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_stall_region_out_memdep_199_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_ethash_search_B3_stall_region_out_memdep_199_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_stall_region_out_memdep_199_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_stall_region_out_memdep_199_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_stall_region_out_memdep_199_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_ethash_search_B3_stall_region_out_memdep_200_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_memdep_200_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_stall_region_out_memdep_200_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_ethash_search_B3_stall_region_out_memdep_200_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_stall_region_out_memdep_200_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_stall_region_out_memdep_200_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_stall_region_out_memdep_200_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_ethash_search_B3_stall_region_out_memdep_203_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_memdep_203_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_stall_region_out_memdep_203_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_ethash_search_B3_stall_region_out_memdep_203_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_stall_region_out_memdep_203_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_stall_region_out_memdep_203_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_stall_region_out_memdep_203_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_ethash_search_B3_stall_region_out_memdep_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_memdep_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_stall_region_out_memdep_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_ethash_search_B3_stall_region_out_memdep_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_stall_region_out_memdep_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_stall_region_out_memdep_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_stall_region_out_memdep_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_ethash_search_B3_stall_region_out_scalarizer_0100165 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_scalarizer_0100375 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_scalarizer_0100585 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_scalarizer_0100795 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_scalarizer_01173 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_scalarizer_01175 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_scalarizer_01177 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_scalarizer_01179 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_scalarizer_099325 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_scalarizer_099535 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_scalarizer_099745 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_scalarizer_099955 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_scalarizer_1100060 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_scalarizer_1100270 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_scalarizer_1100480 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_scalarizer_1100690 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_scalarizer_11008100 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_scalarizer_11174 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_scalarizer_11176 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_scalarizer_11178 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_scalarizer_11180 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_scalarizer_199430 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_scalarizer_199640 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_scalarizer_199850 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_stall_region_out_state_0_0_cast120 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_stall_region_out_state_4_0_cast123 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_stall_region_out_state_5_0_cast126 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_stall_region_out_state_6_0_cast129 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_stall_region_out_state_7_0_cast132 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B3_stall_region_out_unnamed_ethash_search27_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_unnamed_ethash_search27_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_stall_region_out_unnamed_ethash_search27_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_ethash_search_B3_stall_region_out_unnamed_ethash_search27_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_stall_region_out_unnamed_ethash_search27_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_stall_region_out_unnamed_ethash_search27_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_stall_region_out_unnamed_ethash_search27_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_ethash_search_B3_stall_region_out_unnamed_ethash_search28 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_unnamed_ethash_search28_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B3_stall_region_out_unnamed_ethash_search28_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_stall_region_out_unnamed_ethash_search28_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_ethash_search_B3_stall_region_out_unnamed_ethash_search28_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_stall_region_out_unnamed_ethash_search28_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_stall_region_out_unnamed_ethash_search28_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B3_stall_region_out_unnamed_ethash_search28_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_ethash_search_B3_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal data_out_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B3_merge_out_c0_exe1106 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B3_merge_out_c0_exe2108 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_merge_out_c0_exe3112 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_merge_out_c0_exe4116 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_merge_out_fpgaindvars_iv12 : STD_LOGIC_VECTOR (3 downto 0);
    signal ethash_search_B3_merge_out_global_id_0195 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_out_i18_0908 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_out_l_grpid_06 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_out_l_grpid_0_addr9 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_out_scalarizer_0100165 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_out_scalarizer_0100375 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_out_scalarizer_0100585 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_out_scalarizer_0100795 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_out_scalarizer_01173 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_out_scalarizer_01175 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_out_scalarizer_01177 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_out_scalarizer_01179 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_out_scalarizer_099325 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_out_scalarizer_099535 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_out_scalarizer_099745 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_out_scalarizer_099955 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_out_scalarizer_1100060 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_out_scalarizer_1100270 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_out_scalarizer_1100480 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_out_scalarizer_1100690 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_out_scalarizer_11008100 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_out_scalarizer_11174 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_out_scalarizer_11176 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_out_scalarizer_11178 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_out_scalarizer_11180 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_out_scalarizer_199430 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_out_scalarizer_199640 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_out_scalarizer_199850 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B3_merge_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B3_merge_out_state_0_0_cast120 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_merge_out_state_4_0_cast123 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_merge_out_state_5_0_cast126 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_merge_out_state_6_0_cast129 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_merge_out_state_7_0_cast132 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_capacity_FIFO_out_data_out : STD_LOGIC_VECTOR (1412 downto 0);
    signal loop_capacity_FIFO_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_capacity_FIFO_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- ethash_search_B3_merge(BLACKBOX,183)
    theethash_search_B3_merge : ethash_search_B3_merge
    PORT MAP (
        in_c0_exe1106_0 => in_c0_exe1106_0,
        in_c0_exe1106_1 => in_c0_exe1106_1,
        in_c0_exe2108_0 => in_c0_exe2108_0,
        in_c0_exe2108_1 => in_c0_exe2108_1,
        in_c0_exe3112_0 => in_c0_exe3112_0,
        in_c0_exe3112_1 => in_c0_exe3112_1,
        in_c0_exe4116_0 => in_c0_exe4116_0,
        in_c0_exe4116_1 => in_c0_exe4116_1,
        in_encoder_ethash_search_B3_merge_priority_encoder_workgroup_size => in_encoder_ethash_search_B3_merge_priority_encoder_workgroup_size,
        in_fpgaindvars_iv12_0 => in_fpgaindvars_iv12_0,
        in_fpgaindvars_iv12_1 => in_fpgaindvars_iv12_1,
        in_global_id_0195_0 => in_global_id_0195_0,
        in_global_id_0195_1 => in_global_id_0195_1,
        in_i18_0908_0 => in_i18_0908_0,
        in_i18_0908_1 => in_i18_0908_1,
        in_l_grpid_06_0 => in_l_grpid_06_0,
        in_l_grpid_06_1 => in_l_grpid_06_1,
        in_l_grpid_0_addr9_0 => in_l_grpid_0_addr9_0,
        in_l_grpid_0_addr9_1 => in_l_grpid_0_addr9_1,
        in_scalarizer_0100165_0 => in_scalarizer_0100165_0,
        in_scalarizer_0100165_1 => in_scalarizer_0100165_1,
        in_scalarizer_0100375_0 => in_scalarizer_0100375_0,
        in_scalarizer_0100375_1 => in_scalarizer_0100375_1,
        in_scalarizer_0100585_0 => in_scalarizer_0100585_0,
        in_scalarizer_0100585_1 => in_scalarizer_0100585_1,
        in_scalarizer_0100795_0 => in_scalarizer_0100795_0,
        in_scalarizer_0100795_1 => in_scalarizer_0100795_1,
        in_scalarizer_01173_0 => in_scalarizer_01173_0,
        in_scalarizer_01173_1 => in_scalarizer_01173_1,
        in_scalarizer_01175_0 => in_scalarizer_01175_0,
        in_scalarizer_01175_1 => in_scalarizer_01175_1,
        in_scalarizer_01177_0 => in_scalarizer_01177_0,
        in_scalarizer_01177_1 => in_scalarizer_01177_1,
        in_scalarizer_01179_0 => in_scalarizer_01179_0,
        in_scalarizer_01179_1 => in_scalarizer_01179_1,
        in_scalarizer_099325_0 => in_scalarizer_099325_0,
        in_scalarizer_099325_1 => in_scalarizer_099325_1,
        in_scalarizer_099535_0 => in_scalarizer_099535_0,
        in_scalarizer_099535_1 => in_scalarizer_099535_1,
        in_scalarizer_099745_0 => in_scalarizer_099745_0,
        in_scalarizer_099745_1 => in_scalarizer_099745_1,
        in_scalarizer_099955_0 => in_scalarizer_099955_0,
        in_scalarizer_099955_1 => in_scalarizer_099955_1,
        in_scalarizer_1100060_0 => in_scalarizer_1100060_0,
        in_scalarizer_1100060_1 => in_scalarizer_1100060_1,
        in_scalarizer_1100270_0 => in_scalarizer_1100270_0,
        in_scalarizer_1100270_1 => in_scalarizer_1100270_1,
        in_scalarizer_1100480_0 => in_scalarizer_1100480_0,
        in_scalarizer_1100480_1 => in_scalarizer_1100480_1,
        in_scalarizer_1100690_0 => in_scalarizer_1100690_0,
        in_scalarizer_1100690_1 => in_scalarizer_1100690_1,
        in_scalarizer_11008100_0 => in_scalarizer_11008100_0,
        in_scalarizer_11008100_1 => in_scalarizer_11008100_1,
        in_scalarizer_11174_0 => in_scalarizer_11174_0,
        in_scalarizer_11174_1 => in_scalarizer_11174_1,
        in_scalarizer_11176_0 => in_scalarizer_11176_0,
        in_scalarizer_11176_1 => in_scalarizer_11176_1,
        in_scalarizer_11178_0 => in_scalarizer_11178_0,
        in_scalarizer_11178_1 => in_scalarizer_11178_1,
        in_scalarizer_11180_0 => in_scalarizer_11180_0,
        in_scalarizer_11180_1 => in_scalarizer_11180_1,
        in_scalarizer_199430_0 => in_scalarizer_199430_0,
        in_scalarizer_199430_1 => in_scalarizer_199430_1,
        in_scalarizer_199640_0 => in_scalarizer_199640_0,
        in_scalarizer_199640_1 => in_scalarizer_199640_1,
        in_scalarizer_199850_0 => in_scalarizer_199850_0,
        in_scalarizer_199850_1 => in_scalarizer_199850_1,
        in_stall_in => loop_capacity_FIFO_out_stall_out,
        in_state_0_0_cast120_0 => in_state_0_0_cast120_0,
        in_state_0_0_cast120_1 => in_state_0_0_cast120_1,
        in_state_4_0_cast123_0 => in_state_4_0_cast123_0,
        in_state_4_0_cast123_1 => in_state_4_0_cast123_1,
        in_state_5_0_cast126_0 => in_state_5_0_cast126_0,
        in_state_5_0_cast126_1 => in_state_5_0_cast126_1,
        in_state_6_0_cast129_0 => in_state_6_0_cast129_0,
        in_state_6_0_cast129_1 => in_state_6_0_cast129_1,
        in_state_7_0_cast132_0 => in_state_7_0_cast132_0,
        in_state_7_0_cast132_1 => in_state_7_0_cast132_1,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        out_c0_exe1106 => ethash_search_B3_merge_out_c0_exe1106,
        out_c0_exe2108 => ethash_search_B3_merge_out_c0_exe2108,
        out_c0_exe3112 => ethash_search_B3_merge_out_c0_exe3112,
        out_c0_exe4116 => ethash_search_B3_merge_out_c0_exe4116,
        out_fpgaindvars_iv12 => ethash_search_B3_merge_out_fpgaindvars_iv12,
        out_global_id_0195 => ethash_search_B3_merge_out_global_id_0195,
        out_i18_0908 => ethash_search_B3_merge_out_i18_0908,
        out_l_grpid_06 => ethash_search_B3_merge_out_l_grpid_06,
        out_l_grpid_0_addr9 => ethash_search_B3_merge_out_l_grpid_0_addr9,
        out_scalarizer_0100165 => ethash_search_B3_merge_out_scalarizer_0100165,
        out_scalarizer_0100375 => ethash_search_B3_merge_out_scalarizer_0100375,
        out_scalarizer_0100585 => ethash_search_B3_merge_out_scalarizer_0100585,
        out_scalarizer_0100795 => ethash_search_B3_merge_out_scalarizer_0100795,
        out_scalarizer_01173 => ethash_search_B3_merge_out_scalarizer_01173,
        out_scalarizer_01175 => ethash_search_B3_merge_out_scalarizer_01175,
        out_scalarizer_01177 => ethash_search_B3_merge_out_scalarizer_01177,
        out_scalarizer_01179 => ethash_search_B3_merge_out_scalarizer_01179,
        out_scalarizer_099325 => ethash_search_B3_merge_out_scalarizer_099325,
        out_scalarizer_099535 => ethash_search_B3_merge_out_scalarizer_099535,
        out_scalarizer_099745 => ethash_search_B3_merge_out_scalarizer_099745,
        out_scalarizer_099955 => ethash_search_B3_merge_out_scalarizer_099955,
        out_scalarizer_1100060 => ethash_search_B3_merge_out_scalarizer_1100060,
        out_scalarizer_1100270 => ethash_search_B3_merge_out_scalarizer_1100270,
        out_scalarizer_1100480 => ethash_search_B3_merge_out_scalarizer_1100480,
        out_scalarizer_1100690 => ethash_search_B3_merge_out_scalarizer_1100690,
        out_scalarizer_11008100 => ethash_search_B3_merge_out_scalarizer_11008100,
        out_scalarizer_11174 => ethash_search_B3_merge_out_scalarizer_11174,
        out_scalarizer_11176 => ethash_search_B3_merge_out_scalarizer_11176,
        out_scalarizer_11178 => ethash_search_B3_merge_out_scalarizer_11178,
        out_scalarizer_11180 => ethash_search_B3_merge_out_scalarizer_11180,
        out_scalarizer_199430 => ethash_search_B3_merge_out_scalarizer_199430,
        out_scalarizer_199640 => ethash_search_B3_merge_out_scalarizer_199640,
        out_scalarizer_199850 => ethash_search_B3_merge_out_scalarizer_199850,
        out_stall_out_0 => ethash_search_B3_merge_out_stall_out_0,
        out_stall_out_1 => ethash_search_B3_merge_out_stall_out_1,
        out_state_0_0_cast120 => ethash_search_B3_merge_out_state_0_0_cast120,
        out_state_4_0_cast123 => ethash_search_B3_merge_out_state_4_0_cast123,
        out_state_5_0_cast126 => ethash_search_B3_merge_out_state_5_0_cast126,
        out_state_6_0_cast129 => ethash_search_B3_merge_out_state_6_0_cast129,
        out_state_7_0_cast132 => ethash_search_B3_merge_out_state_7_0_cast132,
        out_valid_out => ethash_search_B3_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- num37_cast_x(BITSELECT,172)
    num37_cast_x_b <= ethash_search_B3_merge_out_state_7_0_cast132(63 downto 0);

    -- num36_cast_x(BITSELECT,171)
    num36_cast_x_b <= ethash_search_B3_merge_out_state_6_0_cast129(63 downto 0);

    -- num35_cast_x(BITSELECT,170)
    num35_cast_x_b <= ethash_search_B3_merge_out_state_5_0_cast126(63 downto 0);

    -- num34_cast_x(BITSELECT,169)
    num34_cast_x_b <= ethash_search_B3_merge_out_state_4_0_cast123(63 downto 0);

    -- num33_cast_x(BITSELECT,168)
    num33_cast_x_b <= ethash_search_B3_merge_out_state_0_0_cast120(63 downto 0);

    -- num32_cast_x(BITSELECT,167)
    num32_cast_x_b <= ethash_search_B3_merge_out_scalarizer_199850(31 downto 0);

    -- num31_cast_x(BITSELECT,166)
    num31_cast_x_b <= ethash_search_B3_merge_out_scalarizer_199640(31 downto 0);

    -- num30_cast_x(BITSELECT,165)
    num30_cast_x_b <= ethash_search_B3_merge_out_scalarizer_199430(31 downto 0);

    -- num29_cast_x(BITSELECT,163)
    num29_cast_x_b <= ethash_search_B3_merge_out_scalarizer_11180(31 downto 0);

    -- num28_cast_x(BITSELECT,162)
    num28_cast_x_b <= ethash_search_B3_merge_out_scalarizer_11178(31 downto 0);

    -- num27_cast_x(BITSELECT,161)
    num27_cast_x_b <= ethash_search_B3_merge_out_scalarizer_11176(31 downto 0);

    -- num26_cast_x(BITSELECT,160)
    num26_cast_x_b <= ethash_search_B3_merge_out_scalarizer_11174(31 downto 0);

    -- num25_cast_x(BITSELECT,159)
    num25_cast_x_b <= ethash_search_B3_merge_out_scalarizer_11008100(31 downto 0);

    -- num24_cast_x(BITSELECT,158)
    num24_cast_x_b <= ethash_search_B3_merge_out_scalarizer_1100690(31 downto 0);

    -- num23_cast_x(BITSELECT,157)
    num23_cast_x_b <= ethash_search_B3_merge_out_scalarizer_1100480(31 downto 0);

    -- num22_cast_x(BITSELECT,156)
    num22_cast_x_b <= ethash_search_B3_merge_out_scalarizer_1100270(31 downto 0);

    -- num21_cast_x(BITSELECT,155)
    num21_cast_x_b <= ethash_search_B3_merge_out_scalarizer_1100060(31 downto 0);

    -- num20_cast_x(BITSELECT,154)
    num20_cast_x_b <= ethash_search_B3_merge_out_scalarizer_099955(31 downto 0);

    -- num19_cast_x(BITSELECT,152)
    num19_cast_x_b <= ethash_search_B3_merge_out_scalarizer_099745(31 downto 0);

    -- num18_cast_x(BITSELECT,151)
    num18_cast_x_b <= ethash_search_B3_merge_out_scalarizer_099535(31 downto 0);

    -- num17_cast_x(BITSELECT,150)
    num17_cast_x_b <= ethash_search_B3_merge_out_scalarizer_099325(31 downto 0);

    -- num16_cast_x(BITSELECT,149)
    num16_cast_x_b <= ethash_search_B3_merge_out_scalarizer_01179(31 downto 0);

    -- num15_cast_x(BITSELECT,148)
    num15_cast_x_b <= ethash_search_B3_merge_out_scalarizer_01177(31 downto 0);

    -- num14_cast_x(BITSELECT,147)
    num14_cast_x_b <= ethash_search_B3_merge_out_scalarizer_01175(31 downto 0);

    -- num13_cast_x(BITSELECT,146)
    num13_cast_x_b <= ethash_search_B3_merge_out_scalarizer_01173(31 downto 0);

    -- num12_cast_x(BITSELECT,145)
    num12_cast_x_b <= ethash_search_B3_merge_out_scalarizer_0100795(31 downto 0);

    -- num11_cast_x(BITSELECT,144)
    num11_cast_x_b <= ethash_search_B3_merge_out_scalarizer_0100585(31 downto 0);

    -- num10_cast_x(BITSELECT,143)
    num10_cast_x_b <= ethash_search_B3_merge_out_scalarizer_0100375(31 downto 0);

    -- num9_cast_x(BITSELECT,179)
    num9_cast_x_b <= ethash_search_B3_merge_out_scalarizer_0100165(31 downto 0);

    -- num8_cast_x(BITSELECT,178)
    num8_cast_x_b <= ethash_search_B3_merge_out_l_grpid_0_addr9(31 downto 0);

    -- num7_cast_x(BITSELECT,177)
    num7_cast_x_b <= ethash_search_B3_merge_out_l_grpid_06(31 downto 0);

    -- num6_cast_x(BITSELECT,176)
    num6_cast_x_b <= ethash_search_B3_merge_out_i18_0908(31 downto 0);

    -- num5_cast_x(BITSELECT,175)
    num5_cast_x_b <= ethash_search_B3_merge_out_global_id_0195(31 downto 0);

    -- num4_cast_x(BITSELECT,174)
    num4_cast_x_b <= ethash_search_B3_merge_out_fpgaindvars_iv12(3 downto 0);

    -- num3_cast_x(BITSELECT,173)
    num3_cast_x_b <= ethash_search_B3_merge_out_c0_exe4116(63 downto 0);

    -- num2_cast_x(BITSELECT,164)
    num2_cast_x_b <= ethash_search_B3_merge_out_c0_exe3112(63 downto 0);

    -- num1_cast_x(BITSELECT,153)
    num1_cast_x_b <= ethash_search_B3_merge_out_c0_exe2108(63 downto 0);

    -- num0_cast_x(BITSELECT,142)
    num0_cast_x_b <= ethash_search_B3_merge_out_c0_exe1106(0 downto 0);

    -- aggregateWireOut_join(BITJOIN,180)
    aggregateWireOut_join_q <= num37_cast_x_b & num36_cast_x_b & num35_cast_x_b & num34_cast_x_b & num33_cast_x_b & num32_cast_x_b & num31_cast_x_b & num30_cast_x_b & num29_cast_x_b & num28_cast_x_b & num27_cast_x_b & num26_cast_x_b & num25_cast_x_b & num24_cast_x_b & num23_cast_x_b & num22_cast_x_b & num21_cast_x_b & num20_cast_x_b & num19_cast_x_b & num18_cast_x_b & num17_cast_x_b & num16_cast_x_b & num15_cast_x_b & num14_cast_x_b & num13_cast_x_b & num12_cast_x_b & num11_cast_x_b & num10_cast_x_b & num9_cast_x_b & num8_cast_x_b & num7_cast_x_b & num6_cast_x_b & num5_cast_x_b & num4_cast_x_b & num3_cast_x_b & num2_cast_x_b & num1_cast_x_b & num0_cast_x_b;

    -- loop_capacity_FIFO(BLACKBOX,299)
    theloop_capacity_FIFO : dupName_1_loop_capacity_FIFO_2u1i4agm0676j6e6x6s6u0qc0xgbuoz
    PORT MAP (
        in_data_in => aggregateWireOut_join_q,
        in_stall_in => bb_ethash_search_B3_stall_region_out_stall_out,
        in_valid_in => ethash_search_B3_merge_out_valid_out,
        out_data_out => loop_capacity_FIFO_out_data_out,
        out_stall_out => loop_capacity_FIFO_out_stall_out,
        out_valid_out => loop_capacity_FIFO_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- dupName_36_data_out_select_x(BITSELECT,38)
    dupName_36_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1412 downto 1349);

    -- dupName_35_data_out_select_x(BITSELECT,37)
    dupName_35_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1348 downto 1285);

    -- dupName_34_data_out_select_x(BITSELECT,36)
    dupName_34_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1284 downto 1221);

    -- dupName_33_data_out_select_x(BITSELECT,35)
    dupName_33_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1220 downto 1157);

    -- dupName_32_data_out_select_x(BITSELECT,34)
    dupName_32_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1156 downto 1093);

    -- dupName_31_data_out_select_x(BITSELECT,33)
    dupName_31_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1092 downto 1061);

    -- dupName_30_data_out_select_x(BITSELECT,32)
    dupName_30_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1060 downto 1029);

    -- dupName_29_data_out_select_x(BITSELECT,31)
    dupName_29_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1028 downto 997);

    -- dupName_28_data_out_select_x(BITSELECT,30)
    dupName_28_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(996 downto 965);

    -- dupName_27_data_out_select_x(BITSELECT,29)
    dupName_27_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(964 downto 933);

    -- dupName_26_data_out_select_x(BITSELECT,28)
    dupName_26_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(932 downto 901);

    -- dupName_25_data_out_select_x(BITSELECT,27)
    dupName_25_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(900 downto 869);

    -- dupName_24_data_out_select_x(BITSELECT,26)
    dupName_24_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(868 downto 837);

    -- dupName_23_data_out_select_x(BITSELECT,25)
    dupName_23_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(836 downto 805);

    -- dupName_22_data_out_select_x(BITSELECT,24)
    dupName_22_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(804 downto 773);

    -- dupName_21_data_out_select_x(BITSELECT,23)
    dupName_21_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(772 downto 741);

    -- dupName_20_data_out_select_x(BITSELECT,22)
    dupName_20_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(740 downto 709);

    -- dupName_19_data_out_select_x(BITSELECT,21)
    dupName_19_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(708 downto 677);

    -- dupName_18_data_out_select_x(BITSELECT,20)
    dupName_18_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(676 downto 645);

    -- dupName_17_data_out_select_x(BITSELECT,19)
    dupName_17_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(644 downto 613);

    -- dupName_16_data_out_select_x(BITSELECT,18)
    dupName_16_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(612 downto 581);

    -- dupName_15_data_out_select_x(BITSELECT,17)
    dupName_15_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(580 downto 549);

    -- dupName_14_data_out_select_x(BITSELECT,16)
    dupName_14_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(548 downto 517);

    -- dupName_13_data_out_select_x(BITSELECT,15)
    dupName_13_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(516 downto 485);

    -- dupName_12_data_out_select_x(BITSELECT,14)
    dupName_12_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(484 downto 453);

    -- dupName_11_data_out_select_x(BITSELECT,13)
    dupName_11_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(452 downto 421);

    -- dupName_10_data_out_select_x(BITSELECT,12)
    dupName_10_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(420 downto 389);

    -- dupName_9_data_out_select_x(BITSELECT,11)
    dupName_9_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(388 downto 357);

    -- dupName_8_data_out_select_x(BITSELECT,10)
    dupName_8_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(356 downto 325);

    -- dupName_7_data_out_select_x(BITSELECT,9)
    dupName_7_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(324 downto 293);

    -- dupName_6_data_out_select_x(BITSELECT,8)
    dupName_6_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(292 downto 261);

    -- dupName_5_data_out_select_x(BITSELECT,7)
    dupName_5_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(260 downto 229);

    -- dupName_4_data_out_select_x(BITSELECT,6)
    dupName_4_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(228 downto 197);

    -- dupName_3_data_out_select_x(BITSELECT,5)
    dupName_3_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(196 downto 193);

    -- dupName_2_data_out_select_x(BITSELECT,4)
    dupName_2_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(192 downto 129);

    -- dupName_1_data_out_select_x(BITSELECT,3)
    dupName_1_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(128 downto 65);

    -- dupName_0_data_out_select_x(BITSELECT,2)
    dupName_0_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(64 downto 1);

    -- data_out_select(BITSELECT,182)
    data_out_select_b <= loop_capacity_FIFO_out_data_out(0 downto 0);

    -- bb_ethash_search_B3_stall_region(BLACKBOX,181)
    thebb_ethash_search_B3_stall_region : bb_ethash_search_B3_stall_region
    PORT MAP (
        in_barrier_unnamed_ethash_search29_wgs_workgroup_size => in_barrier_unnamed_ethash_search29_wgs_workgroup_size,
        in_barrier_unnamed_ethash_search30_wgs_workgroup_size => in_barrier_unnamed_ethash_search30_wgs_workgroup_size,
        in_barrier_unnamed_ethash_search31_wgs_workgroup_size => in_barrier_unnamed_ethash_search31_wgs_workgroup_size,
        in_c0_exe1106 => data_out_select_b,
        in_c0_exe2108 => dupName_0_data_out_select_x_b,
        in_c0_exe3112 => dupName_1_data_out_select_x_b,
        in_c0_exe4116 => dupName_2_data_out_select_x_b,
        in_flush => in_flush,
        in_fpgaindvars_iv12 => dupName_3_data_out_select_x_b,
        in_global_id_0195 => dupName_4_data_out_select_x_b,
        in_i18_0908 => dupName_5_data_out_select_x_b,
        in_l_grpid_06 => dupName_6_data_out_select_x_b,
        in_l_grpid_0_addr9 => dupName_7_data_out_select_x_b,
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
        in_scalarizer_0100165 => dupName_8_data_out_select_x_b,
        in_scalarizer_0100375 => dupName_9_data_out_select_x_b,
        in_scalarizer_0100585 => dupName_10_data_out_select_x_b,
        in_scalarizer_0100795 => dupName_11_data_out_select_x_b,
        in_scalarizer_01173 => dupName_12_data_out_select_x_b,
        in_scalarizer_01175 => dupName_13_data_out_select_x_b,
        in_scalarizer_01177 => dupName_14_data_out_select_x_b,
        in_scalarizer_01179 => dupName_15_data_out_select_x_b,
        in_scalarizer_099325 => dupName_16_data_out_select_x_b,
        in_scalarizer_099535 => dupName_17_data_out_select_x_b,
        in_scalarizer_099745 => dupName_18_data_out_select_x_b,
        in_scalarizer_099955 => dupName_19_data_out_select_x_b,
        in_scalarizer_1100060 => dupName_20_data_out_select_x_b,
        in_scalarizer_1100270 => dupName_21_data_out_select_x_b,
        in_scalarizer_1100480 => dupName_22_data_out_select_x_b,
        in_scalarizer_1100690 => dupName_23_data_out_select_x_b,
        in_scalarizer_11008100 => dupName_24_data_out_select_x_b,
        in_scalarizer_11174 => dupName_25_data_out_select_x_b,
        in_scalarizer_11176 => dupName_26_data_out_select_x_b,
        in_scalarizer_11178 => dupName_27_data_out_select_x_b,
        in_scalarizer_11180 => dupName_28_data_out_select_x_b,
        in_scalarizer_199430 => dupName_29_data_out_select_x_b,
        in_scalarizer_199640 => dupName_30_data_out_select_x_b,
        in_scalarizer_199850 => dupName_31_data_out_select_x_b,
        in_stall_in => ethash_search_B3_branch_vunroll_x_out_stall_out,
        in_state_0_0_cast120 => dupName_32_data_out_select_x_b,
        in_state_4_0_cast123 => dupName_33_data_out_select_x_b,
        in_state_5_0_cast126 => dupName_34_data_out_select_x_b,
        in_state_6_0_cast129 => dupName_35_data_out_select_x_b,
        in_state_7_0_cast132 => dupName_36_data_out_select_x_b,
        in_unnamed_ethash_search27_avm_readdata => in_unnamed_ethash_search27_avm_readdata,
        in_unnamed_ethash_search27_avm_readdatavalid => in_unnamed_ethash_search27_avm_readdatavalid,
        in_unnamed_ethash_search27_avm_waitrequest => in_unnamed_ethash_search27_avm_waitrequest,
        in_unnamed_ethash_search27_avm_writeack => in_unnamed_ethash_search27_avm_writeack,
        in_unnamed_ethash_search28_avm_readdata => in_unnamed_ethash_search28_avm_readdata,
        in_unnamed_ethash_search28_avm_readdatavalid => in_unnamed_ethash_search28_avm_readdatavalid,
        in_unnamed_ethash_search28_avm_waitrequest => in_unnamed_ethash_search28_avm_waitrequest,
        in_unnamed_ethash_search28_avm_writeack => in_unnamed_ethash_search28_avm_writeack,
        in_valid_in => loop_capacity_FIFO_out_valid_out,
        out_unnamed_ethash_search27_0 => bb_ethash_search_B3_stall_region_out_unnamed_ethash_search27_0,
        out_unnamed_ethash_search27_1 => bb_ethash_search_B3_stall_region_out_unnamed_ethash_search27_1,
        out_unnamed_ethash_search27_2 => bb_ethash_search_B3_stall_region_out_unnamed_ethash_search27_2,
        out_unnamed_ethash_search27_3 => bb_ethash_search_B3_stall_region_out_unnamed_ethash_search27_3,
        out_and_RM => bb_ethash_search_B3_stall_region_out_and_RM,
        out_arraydecay51_RM => bb_ethash_search_B3_stall_region_out_arraydecay51_RM,
        out_arrayidx36_2_RM => bb_ethash_search_B3_stall_region_out_arrayidx36_2_RM,
        out_arrayidx45_RM => bb_ethash_search_B3_stall_region_out_arrayidx45_RM,
        out_c0_exe1106 => bb_ethash_search_B3_stall_region_out_c0_exe1106,
        out_c0_exe2108 => bb_ethash_search_B3_stall_region_out_c0_exe2108,
        out_c0_exe3112 => bb_ethash_search_B3_stall_region_out_c0_exe3112,
        out_c0_exe4116 => bb_ethash_search_B3_stall_region_out_c0_exe4116,
        out_cmp23 => bb_ethash_search_B3_stall_region_out_cmp23,
        out_cmp23_xor => bb_ethash_search_B3_stall_region_out_cmp23_xor,
        out_fpgaindvars_iv12 => bb_ethash_search_B3_stall_region_out_fpgaindvars_iv12,
        out_global_id_0195 => bb_ethash_search_B3_stall_region_out_global_id_0195,
        out_i18_0908 => bb_ethash_search_B3_stall_region_out_i18_0908,
        out_l_grpid_06 => bb_ethash_search_B3_stall_region_out_l_grpid_06,
        out_l_grpid_0_addr9 => bb_ethash_search_B3_stall_region_out_l_grpid_0_addr9,
        out_l_grpid_0_addr_zext => bb_ethash_search_B3_stall_region_out_l_grpid_0_addr_zext,
        out_memdep_198_avm_address => bb_ethash_search_B3_stall_region_out_memdep_198_avm_address,
        out_memdep_198_avm_burstcount => bb_ethash_search_B3_stall_region_out_memdep_198_avm_burstcount,
        out_memdep_198_avm_byteenable => bb_ethash_search_B3_stall_region_out_memdep_198_avm_byteenable,
        out_memdep_198_avm_enable => bb_ethash_search_B3_stall_region_out_memdep_198_avm_enable,
        out_memdep_198_avm_read => bb_ethash_search_B3_stall_region_out_memdep_198_avm_read,
        out_memdep_198_avm_write => bb_ethash_search_B3_stall_region_out_memdep_198_avm_write,
        out_memdep_198_avm_writedata => bb_ethash_search_B3_stall_region_out_memdep_198_avm_writedata,
        out_memdep_199_avm_address => bb_ethash_search_B3_stall_region_out_memdep_199_avm_address,
        out_memdep_199_avm_burstcount => bb_ethash_search_B3_stall_region_out_memdep_199_avm_burstcount,
        out_memdep_199_avm_byteenable => bb_ethash_search_B3_stall_region_out_memdep_199_avm_byteenable,
        out_memdep_199_avm_enable => bb_ethash_search_B3_stall_region_out_memdep_199_avm_enable,
        out_memdep_199_avm_read => bb_ethash_search_B3_stall_region_out_memdep_199_avm_read,
        out_memdep_199_avm_write => bb_ethash_search_B3_stall_region_out_memdep_199_avm_write,
        out_memdep_199_avm_writedata => bb_ethash_search_B3_stall_region_out_memdep_199_avm_writedata,
        out_memdep_200_avm_address => bb_ethash_search_B3_stall_region_out_memdep_200_avm_address,
        out_memdep_200_avm_burstcount => bb_ethash_search_B3_stall_region_out_memdep_200_avm_burstcount,
        out_memdep_200_avm_byteenable => bb_ethash_search_B3_stall_region_out_memdep_200_avm_byteenable,
        out_memdep_200_avm_enable => bb_ethash_search_B3_stall_region_out_memdep_200_avm_enable,
        out_memdep_200_avm_read => bb_ethash_search_B3_stall_region_out_memdep_200_avm_read,
        out_memdep_200_avm_write => bb_ethash_search_B3_stall_region_out_memdep_200_avm_write,
        out_memdep_200_avm_writedata => bb_ethash_search_B3_stall_region_out_memdep_200_avm_writedata,
        out_memdep_203_avm_address => bb_ethash_search_B3_stall_region_out_memdep_203_avm_address,
        out_memdep_203_avm_burstcount => bb_ethash_search_B3_stall_region_out_memdep_203_avm_burstcount,
        out_memdep_203_avm_byteenable => bb_ethash_search_B3_stall_region_out_memdep_203_avm_byteenable,
        out_memdep_203_avm_enable => bb_ethash_search_B3_stall_region_out_memdep_203_avm_enable,
        out_memdep_203_avm_read => bb_ethash_search_B3_stall_region_out_memdep_203_avm_read,
        out_memdep_203_avm_write => bb_ethash_search_B3_stall_region_out_memdep_203_avm_write,
        out_memdep_203_avm_writedata => bb_ethash_search_B3_stall_region_out_memdep_203_avm_writedata,
        out_memdep_avm_address => bb_ethash_search_B3_stall_region_out_memdep_avm_address,
        out_memdep_avm_burstcount => bb_ethash_search_B3_stall_region_out_memdep_avm_burstcount,
        out_memdep_avm_byteenable => bb_ethash_search_B3_stall_region_out_memdep_avm_byteenable,
        out_memdep_avm_enable => bb_ethash_search_B3_stall_region_out_memdep_avm_enable,
        out_memdep_avm_read => bb_ethash_search_B3_stall_region_out_memdep_avm_read,
        out_memdep_avm_write => bb_ethash_search_B3_stall_region_out_memdep_avm_write,
        out_memdep_avm_writedata => bb_ethash_search_B3_stall_region_out_memdep_avm_writedata,
        out_scalarizer_0100165 => bb_ethash_search_B3_stall_region_out_scalarizer_0100165,
        out_scalarizer_0100375 => bb_ethash_search_B3_stall_region_out_scalarizer_0100375,
        out_scalarizer_0100585 => bb_ethash_search_B3_stall_region_out_scalarizer_0100585,
        out_scalarizer_0100795 => bb_ethash_search_B3_stall_region_out_scalarizer_0100795,
        out_scalarizer_01173 => bb_ethash_search_B3_stall_region_out_scalarizer_01173,
        out_scalarizer_01175 => bb_ethash_search_B3_stall_region_out_scalarizer_01175,
        out_scalarizer_01177 => bb_ethash_search_B3_stall_region_out_scalarizer_01177,
        out_scalarizer_01179 => bb_ethash_search_B3_stall_region_out_scalarizer_01179,
        out_scalarizer_099325 => bb_ethash_search_B3_stall_region_out_scalarizer_099325,
        out_scalarizer_099535 => bb_ethash_search_B3_stall_region_out_scalarizer_099535,
        out_scalarizer_099745 => bb_ethash_search_B3_stall_region_out_scalarizer_099745,
        out_scalarizer_099955 => bb_ethash_search_B3_stall_region_out_scalarizer_099955,
        out_scalarizer_1100060 => bb_ethash_search_B3_stall_region_out_scalarizer_1100060,
        out_scalarizer_1100270 => bb_ethash_search_B3_stall_region_out_scalarizer_1100270,
        out_scalarizer_1100480 => bb_ethash_search_B3_stall_region_out_scalarizer_1100480,
        out_scalarizer_1100690 => bb_ethash_search_B3_stall_region_out_scalarizer_1100690,
        out_scalarizer_11008100 => bb_ethash_search_B3_stall_region_out_scalarizer_11008100,
        out_scalarizer_11174 => bb_ethash_search_B3_stall_region_out_scalarizer_11174,
        out_scalarizer_11176 => bb_ethash_search_B3_stall_region_out_scalarizer_11176,
        out_scalarizer_11178 => bb_ethash_search_B3_stall_region_out_scalarizer_11178,
        out_scalarizer_11180 => bb_ethash_search_B3_stall_region_out_scalarizer_11180,
        out_scalarizer_199430 => bb_ethash_search_B3_stall_region_out_scalarizer_199430,
        out_scalarizer_199640 => bb_ethash_search_B3_stall_region_out_scalarizer_199640,
        out_scalarizer_199850 => bb_ethash_search_B3_stall_region_out_scalarizer_199850,
        out_stall_out => bb_ethash_search_B3_stall_region_out_stall_out,
        out_state_0_0_cast120 => bb_ethash_search_B3_stall_region_out_state_0_0_cast120,
        out_state_4_0_cast123 => bb_ethash_search_B3_stall_region_out_state_4_0_cast123,
        out_state_5_0_cast126 => bb_ethash_search_B3_stall_region_out_state_5_0_cast126,
        out_state_6_0_cast129 => bb_ethash_search_B3_stall_region_out_state_6_0_cast129,
        out_state_7_0_cast132 => bb_ethash_search_B3_stall_region_out_state_7_0_cast132,
        out_unnamed_ethash_search27_avm_address => bb_ethash_search_B3_stall_region_out_unnamed_ethash_search27_avm_address,
        out_unnamed_ethash_search27_avm_burstcount => bb_ethash_search_B3_stall_region_out_unnamed_ethash_search27_avm_burstcount,
        out_unnamed_ethash_search27_avm_byteenable => bb_ethash_search_B3_stall_region_out_unnamed_ethash_search27_avm_byteenable,
        out_unnamed_ethash_search27_avm_enable => bb_ethash_search_B3_stall_region_out_unnamed_ethash_search27_avm_enable,
        out_unnamed_ethash_search27_avm_read => bb_ethash_search_B3_stall_region_out_unnamed_ethash_search27_avm_read,
        out_unnamed_ethash_search27_avm_write => bb_ethash_search_B3_stall_region_out_unnamed_ethash_search27_avm_write,
        out_unnamed_ethash_search27_avm_writedata => bb_ethash_search_B3_stall_region_out_unnamed_ethash_search27_avm_writedata,
        out_unnamed_ethash_search28 => bb_ethash_search_B3_stall_region_out_unnamed_ethash_search28,
        out_unnamed_ethash_search28_avm_address => bb_ethash_search_B3_stall_region_out_unnamed_ethash_search28_avm_address,
        out_unnamed_ethash_search28_avm_burstcount => bb_ethash_search_B3_stall_region_out_unnamed_ethash_search28_avm_burstcount,
        out_unnamed_ethash_search28_avm_byteenable => bb_ethash_search_B3_stall_region_out_unnamed_ethash_search28_avm_byteenable,
        out_unnamed_ethash_search28_avm_enable => bb_ethash_search_B3_stall_region_out_unnamed_ethash_search28_avm_enable,
        out_unnamed_ethash_search28_avm_read => bb_ethash_search_B3_stall_region_out_unnamed_ethash_search28_avm_read,
        out_unnamed_ethash_search28_avm_write => bb_ethash_search_B3_stall_region_out_unnamed_ethash_search28_avm_write,
        out_unnamed_ethash_search28_avm_writedata => bb_ethash_search_B3_stall_region_out_unnamed_ethash_search28_avm_writedata,
        out_valid_out => bb_ethash_search_B3_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- ethash_search_B3_branch_vunroll_x(BLACKBOX,39)
    theethash_search_B3_branch_vunroll_x : ethash_search_B3_branch
    PORT MAP (
        in_unnamed_ethash_search27_0 => bb_ethash_search_B3_stall_region_out_unnamed_ethash_search27_0,
        in_unnamed_ethash_search27_1 => bb_ethash_search_B3_stall_region_out_unnamed_ethash_search27_1,
        in_unnamed_ethash_search27_2 => bb_ethash_search_B3_stall_region_out_unnamed_ethash_search27_2,
        in_unnamed_ethash_search27_3 => bb_ethash_search_B3_stall_region_out_unnamed_ethash_search27_3,
        in_and_RM => bb_ethash_search_B3_stall_region_out_and_RM,
        in_arraydecay51_RM => bb_ethash_search_B3_stall_region_out_arraydecay51_RM,
        in_arrayidx36_2_RM => bb_ethash_search_B3_stall_region_out_arrayidx36_2_RM,
        in_arrayidx45_RM => bb_ethash_search_B3_stall_region_out_arrayidx45_RM,
        in_c0_exe1106 => bb_ethash_search_B3_stall_region_out_c0_exe1106,
        in_c0_exe2108 => bb_ethash_search_B3_stall_region_out_c0_exe2108,
        in_c0_exe3112 => bb_ethash_search_B3_stall_region_out_c0_exe3112,
        in_c0_exe4116 => bb_ethash_search_B3_stall_region_out_c0_exe4116,
        in_cmp23 => bb_ethash_search_B3_stall_region_out_cmp23,
        in_cmp23_xor => bb_ethash_search_B3_stall_region_out_cmp23_xor,
        in_fpgaindvars_iv12 => bb_ethash_search_B3_stall_region_out_fpgaindvars_iv12,
        in_global_id_0195 => bb_ethash_search_B3_stall_region_out_global_id_0195,
        in_i18_0908 => bb_ethash_search_B3_stall_region_out_i18_0908,
        in_l_grpid_06 => bb_ethash_search_B3_stall_region_out_l_grpid_06,
        in_l_grpid_0_addr9 => bb_ethash_search_B3_stall_region_out_l_grpid_0_addr9,
        in_l_grpid_0_addr_zext => bb_ethash_search_B3_stall_region_out_l_grpid_0_addr_zext,
        in_scalarizer_0100165 => bb_ethash_search_B3_stall_region_out_scalarizer_0100165,
        in_scalarizer_0100375 => bb_ethash_search_B3_stall_region_out_scalarizer_0100375,
        in_scalarizer_0100585 => bb_ethash_search_B3_stall_region_out_scalarizer_0100585,
        in_scalarizer_0100795 => bb_ethash_search_B3_stall_region_out_scalarizer_0100795,
        in_scalarizer_01173 => bb_ethash_search_B3_stall_region_out_scalarizer_01173,
        in_scalarizer_01175 => bb_ethash_search_B3_stall_region_out_scalarizer_01175,
        in_scalarizer_01177 => bb_ethash_search_B3_stall_region_out_scalarizer_01177,
        in_scalarizer_01179 => bb_ethash_search_B3_stall_region_out_scalarizer_01179,
        in_scalarizer_099325 => bb_ethash_search_B3_stall_region_out_scalarizer_099325,
        in_scalarizer_099535 => bb_ethash_search_B3_stall_region_out_scalarizer_099535,
        in_scalarizer_099745 => bb_ethash_search_B3_stall_region_out_scalarizer_099745,
        in_scalarizer_099955 => bb_ethash_search_B3_stall_region_out_scalarizer_099955,
        in_scalarizer_1100060 => bb_ethash_search_B3_stall_region_out_scalarizer_1100060,
        in_scalarizer_1100270 => bb_ethash_search_B3_stall_region_out_scalarizer_1100270,
        in_scalarizer_1100480 => bb_ethash_search_B3_stall_region_out_scalarizer_1100480,
        in_scalarizer_1100690 => bb_ethash_search_B3_stall_region_out_scalarizer_1100690,
        in_scalarizer_11008100 => bb_ethash_search_B3_stall_region_out_scalarizer_11008100,
        in_scalarizer_11174 => bb_ethash_search_B3_stall_region_out_scalarizer_11174,
        in_scalarizer_11176 => bb_ethash_search_B3_stall_region_out_scalarizer_11176,
        in_scalarizer_11178 => bb_ethash_search_B3_stall_region_out_scalarizer_11178,
        in_scalarizer_11180 => bb_ethash_search_B3_stall_region_out_scalarizer_11180,
        in_scalarizer_199430 => bb_ethash_search_B3_stall_region_out_scalarizer_199430,
        in_scalarizer_199640 => bb_ethash_search_B3_stall_region_out_scalarizer_199640,
        in_scalarizer_199850 => bb_ethash_search_B3_stall_region_out_scalarizer_199850,
        in_stall_in_0 => in_stall_in_0,
        in_state_0_0_cast120 => bb_ethash_search_B3_stall_region_out_state_0_0_cast120,
        in_state_4_0_cast123 => bb_ethash_search_B3_stall_region_out_state_4_0_cast123,
        in_state_5_0_cast126 => bb_ethash_search_B3_stall_region_out_state_5_0_cast126,
        in_state_6_0_cast129 => bb_ethash_search_B3_stall_region_out_state_6_0_cast129,
        in_state_7_0_cast132 => bb_ethash_search_B3_stall_region_out_state_7_0_cast132,
        in_unnamed_ethash_search28 => bb_ethash_search_B3_stall_region_out_unnamed_ethash_search28,
        in_valid_in => bb_ethash_search_B3_stall_region_out_valid_out,
        out_unnamed_ethash_search27_0 => ethash_search_B3_branch_vunroll_x_out_unnamed_ethash_search27_0,
        out_unnamed_ethash_search27_1 => ethash_search_B3_branch_vunroll_x_out_unnamed_ethash_search27_1,
        out_unnamed_ethash_search27_2 => ethash_search_B3_branch_vunroll_x_out_unnamed_ethash_search27_2,
        out_unnamed_ethash_search27_3 => ethash_search_B3_branch_vunroll_x_out_unnamed_ethash_search27_3,
        out_and_RM => ethash_search_B3_branch_vunroll_x_out_and_RM,
        out_arraydecay51_RM => ethash_search_B3_branch_vunroll_x_out_arraydecay51_RM,
        out_arrayidx36_2_RM => ethash_search_B3_branch_vunroll_x_out_arrayidx36_2_RM,
        out_arrayidx45_RM => ethash_search_B3_branch_vunroll_x_out_arrayidx45_RM,
        out_c0_exe1106 => ethash_search_B3_branch_vunroll_x_out_c0_exe1106,
        out_c0_exe2108 => ethash_search_B3_branch_vunroll_x_out_c0_exe2108,
        out_c0_exe3112 => ethash_search_B3_branch_vunroll_x_out_c0_exe3112,
        out_c0_exe4116 => ethash_search_B3_branch_vunroll_x_out_c0_exe4116,
        out_cmp23 => ethash_search_B3_branch_vunroll_x_out_cmp23,
        out_cmp23_xor => ethash_search_B3_branch_vunroll_x_out_cmp23_xor,
        out_fpgaindvars_iv12 => ethash_search_B3_branch_vunroll_x_out_fpgaindvars_iv12,
        out_global_id_0195 => ethash_search_B3_branch_vunroll_x_out_global_id_0195,
        out_i18_0908 => ethash_search_B3_branch_vunroll_x_out_i18_0908,
        out_l_grpid_06 => ethash_search_B3_branch_vunroll_x_out_l_grpid_06,
        out_l_grpid_0_addr9 => ethash_search_B3_branch_vunroll_x_out_l_grpid_0_addr9,
        out_l_grpid_0_addr_zext => ethash_search_B3_branch_vunroll_x_out_l_grpid_0_addr_zext,
        out_scalarizer_0100165 => ethash_search_B3_branch_vunroll_x_out_scalarizer_0100165,
        out_scalarizer_0100375 => ethash_search_B3_branch_vunroll_x_out_scalarizer_0100375,
        out_scalarizer_0100585 => ethash_search_B3_branch_vunroll_x_out_scalarizer_0100585,
        out_scalarizer_0100795 => ethash_search_B3_branch_vunroll_x_out_scalarizer_0100795,
        out_scalarizer_01173 => ethash_search_B3_branch_vunroll_x_out_scalarizer_01173,
        out_scalarizer_01175 => ethash_search_B3_branch_vunroll_x_out_scalarizer_01175,
        out_scalarizer_01177 => ethash_search_B3_branch_vunroll_x_out_scalarizer_01177,
        out_scalarizer_01179 => ethash_search_B3_branch_vunroll_x_out_scalarizer_01179,
        out_scalarizer_099325 => ethash_search_B3_branch_vunroll_x_out_scalarizer_099325,
        out_scalarizer_099535 => ethash_search_B3_branch_vunroll_x_out_scalarizer_099535,
        out_scalarizer_099745 => ethash_search_B3_branch_vunroll_x_out_scalarizer_099745,
        out_scalarizer_099955 => ethash_search_B3_branch_vunroll_x_out_scalarizer_099955,
        out_scalarizer_1100060 => ethash_search_B3_branch_vunroll_x_out_scalarizer_1100060,
        out_scalarizer_1100270 => ethash_search_B3_branch_vunroll_x_out_scalarizer_1100270,
        out_scalarizer_1100480 => ethash_search_B3_branch_vunroll_x_out_scalarizer_1100480,
        out_scalarizer_1100690 => ethash_search_B3_branch_vunroll_x_out_scalarizer_1100690,
        out_scalarizer_11008100 => ethash_search_B3_branch_vunroll_x_out_scalarizer_11008100,
        out_scalarizer_11174 => ethash_search_B3_branch_vunroll_x_out_scalarizer_11174,
        out_scalarizer_11176 => ethash_search_B3_branch_vunroll_x_out_scalarizer_11176,
        out_scalarizer_11178 => ethash_search_B3_branch_vunroll_x_out_scalarizer_11178,
        out_scalarizer_11180 => ethash_search_B3_branch_vunroll_x_out_scalarizer_11180,
        out_scalarizer_199430 => ethash_search_B3_branch_vunroll_x_out_scalarizer_199430,
        out_scalarizer_199640 => ethash_search_B3_branch_vunroll_x_out_scalarizer_199640,
        out_scalarizer_199850 => ethash_search_B3_branch_vunroll_x_out_scalarizer_199850,
        out_stall_out => ethash_search_B3_branch_vunroll_x_out_stall_out,
        out_state_0_0_cast120 => ethash_search_B3_branch_vunroll_x_out_state_0_0_cast120,
        out_state_4_0_cast123 => ethash_search_B3_branch_vunroll_x_out_state_4_0_cast123,
        out_state_5_0_cast126 => ethash_search_B3_branch_vunroll_x_out_state_5_0_cast126,
        out_state_6_0_cast129 => ethash_search_B3_branch_vunroll_x_out_state_6_0_cast129,
        out_state_7_0_cast132 => ethash_search_B3_branch_vunroll_x_out_state_7_0_cast132,
        out_unnamed_ethash_search28 => ethash_search_B3_branch_vunroll_x_out_unnamed_ethash_search28,
        out_valid_out_0 => ethash_search_B3_branch_vunroll_x_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- out_unnamed_ethash_search27_0(GPOUT,40)
    out_unnamed_ethash_search27_0 <= ethash_search_B3_branch_vunroll_x_out_unnamed_ethash_search27_0;

    -- out_unnamed_ethash_search27_1(GPOUT,41)
    out_unnamed_ethash_search27_1 <= ethash_search_B3_branch_vunroll_x_out_unnamed_ethash_search27_1;

    -- out_unnamed_ethash_search27_2(GPOUT,42)
    out_unnamed_ethash_search27_2 <= ethash_search_B3_branch_vunroll_x_out_unnamed_ethash_search27_2;

    -- out_unnamed_ethash_search27_3(GPOUT,43)
    out_unnamed_ethash_search27_3 <= ethash_search_B3_branch_vunroll_x_out_unnamed_ethash_search27_3;

    -- out_and_RM(GPOUT,44)
    out_and_RM <= ethash_search_B3_branch_vunroll_x_out_and_RM;

    -- out_arraydecay51_RM(GPOUT,45)
    out_arraydecay51_RM <= ethash_search_B3_branch_vunroll_x_out_arraydecay51_RM;

    -- out_arrayidx36_2_RM(GPOUT,46)
    out_arrayidx36_2_RM <= ethash_search_B3_branch_vunroll_x_out_arrayidx36_2_RM;

    -- out_arrayidx45_RM(GPOUT,47)
    out_arrayidx45_RM <= ethash_search_B3_branch_vunroll_x_out_arrayidx45_RM;

    -- out_c0_exe1106(GPOUT,48)
    out_c0_exe1106 <= ethash_search_B3_branch_vunroll_x_out_c0_exe1106;

    -- out_c0_exe2108(GPOUT,49)
    out_c0_exe2108 <= ethash_search_B3_branch_vunroll_x_out_c0_exe2108;

    -- out_c0_exe3112(GPOUT,50)
    out_c0_exe3112 <= ethash_search_B3_branch_vunroll_x_out_c0_exe3112;

    -- out_c0_exe4116(GPOUT,51)
    out_c0_exe4116 <= ethash_search_B3_branch_vunroll_x_out_c0_exe4116;

    -- out_cmp23(GPOUT,52)
    out_cmp23 <= ethash_search_B3_branch_vunroll_x_out_cmp23;

    -- out_cmp23_xor(GPOUT,53)
    out_cmp23_xor <= ethash_search_B3_branch_vunroll_x_out_cmp23_xor;

    -- out_fpgaindvars_iv12(GPOUT,54)
    out_fpgaindvars_iv12 <= ethash_search_B3_branch_vunroll_x_out_fpgaindvars_iv12;

    -- out_global_id_0195(GPOUT,55)
    out_global_id_0195 <= ethash_search_B3_branch_vunroll_x_out_global_id_0195;

    -- out_i18_0908(GPOUT,56)
    out_i18_0908 <= ethash_search_B3_branch_vunroll_x_out_i18_0908;

    -- out_l_grpid_06(GPOUT,57)
    out_l_grpid_06 <= ethash_search_B3_branch_vunroll_x_out_l_grpid_06;

    -- out_l_grpid_0_addr9(GPOUT,58)
    out_l_grpid_0_addr9 <= ethash_search_B3_branch_vunroll_x_out_l_grpid_0_addr9;

    -- out_l_grpid_0_addr_zext(GPOUT,59)
    out_l_grpid_0_addr_zext <= ethash_search_B3_branch_vunroll_x_out_l_grpid_0_addr_zext;

    -- out_memdep_198_avm_address(GPOUT,60)
    out_memdep_198_avm_address <= bb_ethash_search_B3_stall_region_out_memdep_198_avm_address;

    -- out_memdep_198_avm_burstcount(GPOUT,61)
    out_memdep_198_avm_burstcount <= bb_ethash_search_B3_stall_region_out_memdep_198_avm_burstcount;

    -- out_memdep_198_avm_byteenable(GPOUT,62)
    out_memdep_198_avm_byteenable <= bb_ethash_search_B3_stall_region_out_memdep_198_avm_byteenable;

    -- out_memdep_198_avm_enable(GPOUT,63)
    out_memdep_198_avm_enable <= bb_ethash_search_B3_stall_region_out_memdep_198_avm_enable;

    -- out_memdep_198_avm_read(GPOUT,64)
    out_memdep_198_avm_read <= bb_ethash_search_B3_stall_region_out_memdep_198_avm_read;

    -- out_memdep_198_avm_write(GPOUT,65)
    out_memdep_198_avm_write <= bb_ethash_search_B3_stall_region_out_memdep_198_avm_write;

    -- out_memdep_198_avm_writedata(GPOUT,66)
    out_memdep_198_avm_writedata <= bb_ethash_search_B3_stall_region_out_memdep_198_avm_writedata;

    -- out_memdep_199_avm_address(GPOUT,67)
    out_memdep_199_avm_address <= bb_ethash_search_B3_stall_region_out_memdep_199_avm_address;

    -- out_memdep_199_avm_burstcount(GPOUT,68)
    out_memdep_199_avm_burstcount <= bb_ethash_search_B3_stall_region_out_memdep_199_avm_burstcount;

    -- out_memdep_199_avm_byteenable(GPOUT,69)
    out_memdep_199_avm_byteenable <= bb_ethash_search_B3_stall_region_out_memdep_199_avm_byteenable;

    -- out_memdep_199_avm_enable(GPOUT,70)
    out_memdep_199_avm_enable <= bb_ethash_search_B3_stall_region_out_memdep_199_avm_enable;

    -- out_memdep_199_avm_read(GPOUT,71)
    out_memdep_199_avm_read <= bb_ethash_search_B3_stall_region_out_memdep_199_avm_read;

    -- out_memdep_199_avm_write(GPOUT,72)
    out_memdep_199_avm_write <= bb_ethash_search_B3_stall_region_out_memdep_199_avm_write;

    -- out_memdep_199_avm_writedata(GPOUT,73)
    out_memdep_199_avm_writedata <= bb_ethash_search_B3_stall_region_out_memdep_199_avm_writedata;

    -- out_memdep_200_avm_address(GPOUT,74)
    out_memdep_200_avm_address <= bb_ethash_search_B3_stall_region_out_memdep_200_avm_address;

    -- out_memdep_200_avm_burstcount(GPOUT,75)
    out_memdep_200_avm_burstcount <= bb_ethash_search_B3_stall_region_out_memdep_200_avm_burstcount;

    -- out_memdep_200_avm_byteenable(GPOUT,76)
    out_memdep_200_avm_byteenable <= bb_ethash_search_B3_stall_region_out_memdep_200_avm_byteenable;

    -- out_memdep_200_avm_enable(GPOUT,77)
    out_memdep_200_avm_enable <= bb_ethash_search_B3_stall_region_out_memdep_200_avm_enable;

    -- out_memdep_200_avm_read(GPOUT,78)
    out_memdep_200_avm_read <= bb_ethash_search_B3_stall_region_out_memdep_200_avm_read;

    -- out_memdep_200_avm_write(GPOUT,79)
    out_memdep_200_avm_write <= bb_ethash_search_B3_stall_region_out_memdep_200_avm_write;

    -- out_memdep_200_avm_writedata(GPOUT,80)
    out_memdep_200_avm_writedata <= bb_ethash_search_B3_stall_region_out_memdep_200_avm_writedata;

    -- out_memdep_203_avm_address(GPOUT,81)
    out_memdep_203_avm_address <= bb_ethash_search_B3_stall_region_out_memdep_203_avm_address;

    -- out_memdep_203_avm_burstcount(GPOUT,82)
    out_memdep_203_avm_burstcount <= bb_ethash_search_B3_stall_region_out_memdep_203_avm_burstcount;

    -- out_memdep_203_avm_byteenable(GPOUT,83)
    out_memdep_203_avm_byteenable <= bb_ethash_search_B3_stall_region_out_memdep_203_avm_byteenable;

    -- out_memdep_203_avm_enable(GPOUT,84)
    out_memdep_203_avm_enable <= bb_ethash_search_B3_stall_region_out_memdep_203_avm_enable;

    -- out_memdep_203_avm_read(GPOUT,85)
    out_memdep_203_avm_read <= bb_ethash_search_B3_stall_region_out_memdep_203_avm_read;

    -- out_memdep_203_avm_write(GPOUT,86)
    out_memdep_203_avm_write <= bb_ethash_search_B3_stall_region_out_memdep_203_avm_write;

    -- out_memdep_203_avm_writedata(GPOUT,87)
    out_memdep_203_avm_writedata <= bb_ethash_search_B3_stall_region_out_memdep_203_avm_writedata;

    -- out_memdep_avm_address(GPOUT,88)
    out_memdep_avm_address <= bb_ethash_search_B3_stall_region_out_memdep_avm_address;

    -- out_memdep_avm_burstcount(GPOUT,89)
    out_memdep_avm_burstcount <= bb_ethash_search_B3_stall_region_out_memdep_avm_burstcount;

    -- out_memdep_avm_byteenable(GPOUT,90)
    out_memdep_avm_byteenable <= bb_ethash_search_B3_stall_region_out_memdep_avm_byteenable;

    -- out_memdep_avm_enable(GPOUT,91)
    out_memdep_avm_enable <= bb_ethash_search_B3_stall_region_out_memdep_avm_enable;

    -- out_memdep_avm_read(GPOUT,92)
    out_memdep_avm_read <= bb_ethash_search_B3_stall_region_out_memdep_avm_read;

    -- out_memdep_avm_write(GPOUT,93)
    out_memdep_avm_write <= bb_ethash_search_B3_stall_region_out_memdep_avm_write;

    -- out_memdep_avm_writedata(GPOUT,94)
    out_memdep_avm_writedata <= bb_ethash_search_B3_stall_region_out_memdep_avm_writedata;

    -- out_scalarizer_0100165(GPOUT,95)
    out_scalarizer_0100165 <= ethash_search_B3_branch_vunroll_x_out_scalarizer_0100165;

    -- out_scalarizer_0100375(GPOUT,96)
    out_scalarizer_0100375 <= ethash_search_B3_branch_vunroll_x_out_scalarizer_0100375;

    -- out_scalarizer_0100585(GPOUT,97)
    out_scalarizer_0100585 <= ethash_search_B3_branch_vunroll_x_out_scalarizer_0100585;

    -- out_scalarizer_0100795(GPOUT,98)
    out_scalarizer_0100795 <= ethash_search_B3_branch_vunroll_x_out_scalarizer_0100795;

    -- out_scalarizer_01173(GPOUT,99)
    out_scalarizer_01173 <= ethash_search_B3_branch_vunroll_x_out_scalarizer_01173;

    -- out_scalarizer_01175(GPOUT,100)
    out_scalarizer_01175 <= ethash_search_B3_branch_vunroll_x_out_scalarizer_01175;

    -- out_scalarizer_01177(GPOUT,101)
    out_scalarizer_01177 <= ethash_search_B3_branch_vunroll_x_out_scalarizer_01177;

    -- out_scalarizer_01179(GPOUT,102)
    out_scalarizer_01179 <= ethash_search_B3_branch_vunroll_x_out_scalarizer_01179;

    -- out_scalarizer_099325(GPOUT,103)
    out_scalarizer_099325 <= ethash_search_B3_branch_vunroll_x_out_scalarizer_099325;

    -- out_scalarizer_099535(GPOUT,104)
    out_scalarizer_099535 <= ethash_search_B3_branch_vunroll_x_out_scalarizer_099535;

    -- out_scalarizer_099745(GPOUT,105)
    out_scalarizer_099745 <= ethash_search_B3_branch_vunroll_x_out_scalarizer_099745;

    -- out_scalarizer_099955(GPOUT,106)
    out_scalarizer_099955 <= ethash_search_B3_branch_vunroll_x_out_scalarizer_099955;

    -- out_scalarizer_1100060(GPOUT,107)
    out_scalarizer_1100060 <= ethash_search_B3_branch_vunroll_x_out_scalarizer_1100060;

    -- out_scalarizer_1100270(GPOUT,108)
    out_scalarizer_1100270 <= ethash_search_B3_branch_vunroll_x_out_scalarizer_1100270;

    -- out_scalarizer_1100480(GPOUT,109)
    out_scalarizer_1100480 <= ethash_search_B3_branch_vunroll_x_out_scalarizer_1100480;

    -- out_scalarizer_1100690(GPOUT,110)
    out_scalarizer_1100690 <= ethash_search_B3_branch_vunroll_x_out_scalarizer_1100690;

    -- out_scalarizer_11008100(GPOUT,111)
    out_scalarizer_11008100 <= ethash_search_B3_branch_vunroll_x_out_scalarizer_11008100;

    -- out_scalarizer_11174(GPOUT,112)
    out_scalarizer_11174 <= ethash_search_B3_branch_vunroll_x_out_scalarizer_11174;

    -- out_scalarizer_11176(GPOUT,113)
    out_scalarizer_11176 <= ethash_search_B3_branch_vunroll_x_out_scalarizer_11176;

    -- out_scalarizer_11178(GPOUT,114)
    out_scalarizer_11178 <= ethash_search_B3_branch_vunroll_x_out_scalarizer_11178;

    -- out_scalarizer_11180(GPOUT,115)
    out_scalarizer_11180 <= ethash_search_B3_branch_vunroll_x_out_scalarizer_11180;

    -- out_scalarizer_199430(GPOUT,116)
    out_scalarizer_199430 <= ethash_search_B3_branch_vunroll_x_out_scalarizer_199430;

    -- out_scalarizer_199640(GPOUT,117)
    out_scalarizer_199640 <= ethash_search_B3_branch_vunroll_x_out_scalarizer_199640;

    -- out_scalarizer_199850(GPOUT,118)
    out_scalarizer_199850 <= ethash_search_B3_branch_vunroll_x_out_scalarizer_199850;

    -- out_stall_out_0(GPOUT,119)
    out_stall_out_0 <= ethash_search_B3_merge_out_stall_out_0;

    -- out_stall_out_1(GPOUT,120)
    out_stall_out_1 <= ethash_search_B3_merge_out_stall_out_1;

    -- out_state_0_0_cast120(GPOUT,121)
    out_state_0_0_cast120 <= ethash_search_B3_branch_vunroll_x_out_state_0_0_cast120;

    -- out_state_4_0_cast123(GPOUT,122)
    out_state_4_0_cast123 <= ethash_search_B3_branch_vunroll_x_out_state_4_0_cast123;

    -- out_state_5_0_cast126(GPOUT,123)
    out_state_5_0_cast126 <= ethash_search_B3_branch_vunroll_x_out_state_5_0_cast126;

    -- out_state_6_0_cast129(GPOUT,124)
    out_state_6_0_cast129 <= ethash_search_B3_branch_vunroll_x_out_state_6_0_cast129;

    -- out_state_7_0_cast132(GPOUT,125)
    out_state_7_0_cast132 <= ethash_search_B3_branch_vunroll_x_out_state_7_0_cast132;

    -- out_unnamed_ethash_search27_avm_address(GPOUT,126)
    out_unnamed_ethash_search27_avm_address <= bb_ethash_search_B3_stall_region_out_unnamed_ethash_search27_avm_address;

    -- out_unnamed_ethash_search27_avm_burstcount(GPOUT,127)
    out_unnamed_ethash_search27_avm_burstcount <= bb_ethash_search_B3_stall_region_out_unnamed_ethash_search27_avm_burstcount;

    -- out_unnamed_ethash_search27_avm_byteenable(GPOUT,128)
    out_unnamed_ethash_search27_avm_byteenable <= bb_ethash_search_B3_stall_region_out_unnamed_ethash_search27_avm_byteenable;

    -- out_unnamed_ethash_search27_avm_enable(GPOUT,129)
    out_unnamed_ethash_search27_avm_enable <= bb_ethash_search_B3_stall_region_out_unnamed_ethash_search27_avm_enable;

    -- out_unnamed_ethash_search27_avm_read(GPOUT,130)
    out_unnamed_ethash_search27_avm_read <= bb_ethash_search_B3_stall_region_out_unnamed_ethash_search27_avm_read;

    -- out_unnamed_ethash_search27_avm_write(GPOUT,131)
    out_unnamed_ethash_search27_avm_write <= bb_ethash_search_B3_stall_region_out_unnamed_ethash_search27_avm_write;

    -- out_unnamed_ethash_search27_avm_writedata(GPOUT,132)
    out_unnamed_ethash_search27_avm_writedata <= bb_ethash_search_B3_stall_region_out_unnamed_ethash_search27_avm_writedata;

    -- out_unnamed_ethash_search28(GPOUT,133)
    out_unnamed_ethash_search28 <= ethash_search_B3_branch_vunroll_x_out_unnamed_ethash_search28;

    -- out_unnamed_ethash_search28_avm_address(GPOUT,134)
    out_unnamed_ethash_search28_avm_address <= bb_ethash_search_B3_stall_region_out_unnamed_ethash_search28_avm_address;

    -- out_unnamed_ethash_search28_avm_burstcount(GPOUT,135)
    out_unnamed_ethash_search28_avm_burstcount <= bb_ethash_search_B3_stall_region_out_unnamed_ethash_search28_avm_burstcount;

    -- out_unnamed_ethash_search28_avm_byteenable(GPOUT,136)
    out_unnamed_ethash_search28_avm_byteenable <= bb_ethash_search_B3_stall_region_out_unnamed_ethash_search28_avm_byteenable;

    -- out_unnamed_ethash_search28_avm_enable(GPOUT,137)
    out_unnamed_ethash_search28_avm_enable <= bb_ethash_search_B3_stall_region_out_unnamed_ethash_search28_avm_enable;

    -- out_unnamed_ethash_search28_avm_read(GPOUT,138)
    out_unnamed_ethash_search28_avm_read <= bb_ethash_search_B3_stall_region_out_unnamed_ethash_search28_avm_read;

    -- out_unnamed_ethash_search28_avm_write(GPOUT,139)
    out_unnamed_ethash_search28_avm_write <= bb_ethash_search_B3_stall_region_out_unnamed_ethash_search28_avm_write;

    -- out_unnamed_ethash_search28_avm_writedata(GPOUT,140)
    out_unnamed_ethash_search28_avm_writedata <= bb_ethash_search_B3_stall_region_out_unnamed_ethash_search28_avm_writedata;

    -- out_valid_out_0(GPOUT,141)
    out_valid_out_0 <= ethash_search_B3_branch_vunroll_x_out_valid_out_0;

END normal;
