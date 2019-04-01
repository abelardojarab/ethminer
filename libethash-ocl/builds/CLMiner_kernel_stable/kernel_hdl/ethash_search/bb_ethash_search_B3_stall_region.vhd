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

-- VHDL created from bb_ethash_search_B3_stall_region
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

entity bb_ethash_search_B3_stall_region is
    port (
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
        out_state_0_0_cast120 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_4_0_cast123 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_5_0_cast126 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_6_0_cast129 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_7_0_cast132 : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_ethash_search27_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_ethash_search27_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_ethash_search27_2 : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_ethash_search27_3 : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_ethash_search28 : out std_logic_vector(31 downto 0);  -- ufix32
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_199_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memdep_199_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_199_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_199_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_199_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_199_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_199_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_199_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_199_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_memdep_199_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_memdep_199_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1106 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2108 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe3112 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe4116 : in std_logic_vector(63 downto 0);  -- ufix64
        in_fpgaindvars_iv12 : in std_logic_vector(3 downto 0);  -- ufix4
        in_global_id_0195 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i18_0908 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_06 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr9 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100165 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100375 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100585 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100795 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01173 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01175 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01177 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01179 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099325 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099535 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099745 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099955 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100060 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100270 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100480 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100690 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11008100 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11174 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11176 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11178 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11180 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199430 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199640 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199850 : in std_logic_vector(31 downto 0);  -- ufix32
        in_state_0_0_cast120 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_4_0_cast123 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_5_0_cast126 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_6_0_cast129 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_7_0_cast132 : in std_logic_vector(63 downto 0);  -- ufix64
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_198_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memdep_198_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_198_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_198_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_198_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_198_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_198_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_198_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_198_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_memdep_198_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_memdep_198_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memdep_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_memdep_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_memdep_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        in_barrier_unnamed_ethash_search29_wgs_workgroup_size : in std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_ethash_search27_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_ethash_search27_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search27_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search27_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search27_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_unnamed_ethash_search27_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_unnamed_ethash_search27_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search27_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_unnamed_ethash_search27_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search27_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search27_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_203_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_203_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_203_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_203_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_203_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_memdep_203_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_memdep_203_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        in_barrier_unnamed_ethash_search30_wgs_workgroup_size : in std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_ethash_search28_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_ethash_search28_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search28_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search28_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search28_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_unnamed_ethash_search28_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_unnamed_ethash_search28_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_203_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memdep_203_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_203_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_203_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_barrier_unnamed_ethash_search31_wgs_workgroup_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_unnamed_ethash_search28_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_unnamed_ethash_search28_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search28_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search28_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_200_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memdep_200_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_200_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_200_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_200_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_200_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_200_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_200_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_200_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_memdep_200_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_memdep_200_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_ethash_search_B3_stall_region;

architecture normal of bb_ethash_search_B3_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component ethash_search_B3_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(3 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
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
            in_data_in_20 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_21 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_22 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_23 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_24 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_25 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_26 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_27 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_28 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_29 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_30 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_31 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_32 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_33 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_34 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_35 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_36 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_37 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(3 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
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
            out_data_out_20 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_21 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_22 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_23 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_25 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_26 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_27 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_28 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_29 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_30 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_31 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_32 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_33 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_34 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_35 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_36 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_37 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_unnamed_ethash_search27_ethash_search237 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_bitwiseor : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search27_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_unnamed_ethash_search27_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search27_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search27_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_readdata_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_readdata_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_readdata_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search27_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_ethash_search27_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search27_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_unnamed_ethash_search27_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search27_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search27_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search27_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_store_memdep_198_ethash_search229 is
        port (
            in_i_writedata_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_writedata_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_bitwiseor : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_198_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memdep_198_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_198_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_198_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_198_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_198_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_198_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_memdep_198_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_198_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_198_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_198_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_writeack : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_store_memdep_199_ethash_search226 is
        port (
            in_i_writedata_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_writedata_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_bitwiseor : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_199_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memdep_199_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_199_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_199_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_199_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_199_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_199_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_memdep_199_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_199_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_199_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_199_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_writeack : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_store_memdep_200_ethash_search223 is
        port (
            in_i_writedata_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_writedata_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_bitwiseor : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_200_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memdep_200_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_200_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_200_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_200_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_200_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_200_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_memdep_200_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_200_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_200_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_200_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_writeack : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_store_memdep_ethash_search232 is
        port (
            in_i_writedata_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_writedata_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_bitwiseor : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memdep_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_memdep_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_writeack : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_unnamed_ethash_search28_ethash_search247 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_bitwiseor : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search28_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_unnamed_ethash_search28_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search28_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search28_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search28_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_ethash_search28_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search28_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_unnamed_ethash_search28_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search28_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search28_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search28_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sbar_unnamed_ethash_search29_ethash_search234 is
        port (
            in_data_entry : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_entry : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_workgroup_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_exit : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_entry : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_exit : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sbar_unnamed_ethash_search30_ethash_search239 is
        port (
            in_data_entry : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_entry : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_workgroup_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_exit : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_entry : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_exit : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sbar_unnamed_ethash_search31_ethash_search245 is
        port (
            in_data_entry : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_entry : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_workgroup_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_exit : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_entry : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_exit : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_store_memdep_203_ethash_search243 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_bitwiseor : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_writedata : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memdep_203_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memdep_203_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_203_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_203_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_203_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_203_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_203_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_memdep_203_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_203_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_203_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_203_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_writeack : out std_logic_vector(0 downto 0);  -- Fixed Point
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
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (3 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_19 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_20 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_21 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_22 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_23 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_24 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_25 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_26 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_27 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_28 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_29 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_30 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_31 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_32 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_33 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_34 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_35 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_36 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_data_out_37 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B3_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arraydecay51_rm_ethash_search_ethash_search241_dupName_0_trunc_sel_x_in : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arraydecay51_rm_ethash_search_ethash_search241_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arraydecay51_rm_ethash_search_ethash_search241_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arraydecay51_rm_ethash_search_ethash_search241_mult_multconst_x_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arraydecay51_rm_ethash_search_ethash_search241_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx36_2_rm_ethash_search_ethash_search225_dupName_0_trunc_sel_x_in : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx36_2_rm_ethash_search_ethash_search225_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx36_2_rm_ethash_search_ethash_search225_dupName_1_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx36_2_rm_ethash_search_ethash_search225_dupName_0_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx36_2_rm_ethash_search_ethash_search225_dupName_0_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx36_2_rm_ethash_search_ethash_search225_dupName_0_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx36_2_rm_ethash_search_ethash_search225_dupName_0_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx36_2_rm_ethash_search_ethash_search225_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx36_2_rm_ethash_search_ethash_search225_c_i64_16_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx36_4_rm_ethash_search_ethash_search228_dupName_0_trunc_sel_x_in : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx36_4_rm_ethash_search_ethash_search228_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx36_4_rm_ethash_search_ethash_search228_dupName_1_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx36_4_rm_ethash_search_ethash_search228_dupName_0_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx36_4_rm_ethash_search_ethash_search228_dupName_0_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx36_4_rm_ethash_search_ethash_search228_dupName_0_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx36_4_rm_ethash_search_ethash_search228_dupName_0_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx36_4_rm_ethash_search_ethash_search228_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx36_4_rm_ethash_search_ethash_search228_c_i64_32_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx36_6_rm_ethash_search_ethash_search231_dupName_0_trunc_sel_x_in : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx36_6_rm_ethash_search_ethash_search231_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx36_6_rm_ethash_search_ethash_search231_dupName_1_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx36_6_rm_ethash_search_ethash_search231_dupName_0_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx36_6_rm_ethash_search_ethash_search231_dupName_0_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx36_6_rm_ethash_search_ethash_search231_dupName_0_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx36_6_rm_ethash_search_ethash_search231_dupName_0_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx36_6_rm_ethash_search_ethash_search231_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx36_6_rm_ethash_search_ethash_search231_c_i64_48_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx45_rm_ethash_search_ethash_search222_dupName_0_trunc_sel_x_in : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx45_rm_ethash_search_ethash_search222_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx45_rm_ethash_search_ethash_search222_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx45_rm_ethash_search_ethash_search222_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_multconst_x_q : STD_LOGIC_VECTOR (58 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_trunc_sel_x_in : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_dupName_1_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_dupName_2_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_idxprom43_rm_ethash_search_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_idxprom44_rm_ethash_search_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_l_grpid_0_addr_zext_ethash_search_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_unnamed_ethash_search27_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_unnamed_ethash_search27_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_unnamed_ethash_search27_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_unnamed_ethash_search27_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_unnamed_ethash_search27_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_unnamed_ethash_search27_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_unnamed_ethash_search27_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal i_store_memdep_198_ethash_search_aunroll_x_out_memdep_198_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_store_memdep_198_ethash_search_aunroll_x_out_memdep_198_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_198_ethash_search_aunroll_x_out_memdep_198_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal i_store_memdep_198_ethash_search_aunroll_x_out_memdep_198_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_198_ethash_search_aunroll_x_out_memdep_198_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_198_ethash_search_aunroll_x_out_memdep_198_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_198_ethash_search_aunroll_x_out_memdep_198_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal i_store_memdep_198_ethash_search_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_198_ethash_search_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_198_ethash_search_aunroll_x_out_o_writeack : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_199_ethash_search_aunroll_x_out_memdep_199_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_store_memdep_199_ethash_search_aunroll_x_out_memdep_199_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_199_ethash_search_aunroll_x_out_memdep_199_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal i_store_memdep_199_ethash_search_aunroll_x_out_memdep_199_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_199_ethash_search_aunroll_x_out_memdep_199_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_199_ethash_search_aunroll_x_out_memdep_199_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_199_ethash_search_aunroll_x_out_memdep_199_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal i_store_memdep_199_ethash_search_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_199_ethash_search_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_199_ethash_search_aunroll_x_out_o_writeack : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_200_ethash_search_aunroll_x_out_memdep_200_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_store_memdep_200_ethash_search_aunroll_x_out_memdep_200_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_200_ethash_search_aunroll_x_out_memdep_200_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal i_store_memdep_200_ethash_search_aunroll_x_out_memdep_200_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_200_ethash_search_aunroll_x_out_memdep_200_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_200_ethash_search_aunroll_x_out_memdep_200_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_200_ethash_search_aunroll_x_out_memdep_200_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal i_store_memdep_200_ethash_search_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_200_ethash_search_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_200_ethash_search_aunroll_x_out_o_writeack : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_ethash_search_aunroll_x_out_memdep_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_store_memdep_ethash_search_aunroll_x_out_memdep_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_ethash_search_aunroll_x_out_memdep_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal i_store_memdep_ethash_search_aunroll_x_out_memdep_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_ethash_search_aunroll_x_out_memdep_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_ethash_search_aunroll_x_out_memdep_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_ethash_search_aunroll_x_out_memdep_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal i_store_memdep_ethash_search_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_ethash_search_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_ethash_search_aunroll_x_out_o_writeack : STD_LOGIC_VECTOR (0 downto 0);
    signal i_toi1_intcast_ethash_search_sel_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_3gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_7gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and42_rm_ethash_search_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and42_rm_ethash_search_vt_const_31_q : STD_LOGIC_VECTOR (29 downto 0);
    signal i_and42_rm_ethash_search_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and42_rm_ethash_search_vt_select_1_b : STD_LOGIC_VECTOR (1 downto 0);
    signal i_and_rm_ethash_search_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and_rm_ethash_search_vt_const_31_q : STD_LOGIC_VECTOR (28 downto 0);
    signal i_and_rm_ethash_search_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and_rm_ethash_search_vt_select_2_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_arraydecay51_rm_ethash_search_vt_const_5_q : STD_LOGIC_VECTOR (5 downto 0);
    signal i_arraydecay51_rm_ethash_search_vt_const_63_q : STD_LOGIC_VECTOR (53 downto 0);
    signal i_arraydecay51_rm_ethash_search_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arraydecay51_rm_ethash_search_vt_select_9_b : STD_LOGIC_VECTOR (3 downto 0);
    signal i_arrayidx36_2_rm_ethash_search_vt_const_5_q : STD_LOGIC_VECTOR (5 downto 0);
    signal i_arrayidx36_2_rm_ethash_search_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx36_2_rm_ethash_search_vt_select_9_b : STD_LOGIC_VECTOR (3 downto 0);
    signal i_arrayidx36_4_rm_ethash_search_vt_const_5_q : STD_LOGIC_VECTOR (5 downto 0);
    signal i_arrayidx36_4_rm_ethash_search_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx36_4_rm_ethash_search_vt_select_9_b : STD_LOGIC_VECTOR (3 downto 0);
    signal i_arrayidx36_6_rm_ethash_search_vt_const_5_q : STD_LOGIC_VECTOR (5 downto 0);
    signal i_arrayidx36_6_rm_ethash_search_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx36_6_rm_ethash_search_vt_select_9_b : STD_LOGIC_VECTOR (3 downto 0);
    signal i_arrayidx45_rm_ethash_search_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx45_rm_ethash_search_vt_select_9_b : STD_LOGIC_VECTOR (3 downto 0);
    signal i_arrayidx46_rm_ethash_search_vt_const_3_q : STD_LOGIC_VECTOR (3 downto 0);
    signal i_arrayidx46_rm_ethash_search_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx46_rm_ethash_search_vt_select_9_b : STD_LOGIC_VECTOR (5 downto 0);
    signal i_barrier_dep201_ethash_search_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_barrier_dep202_ethash_search_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_barrier_dep_ethash_search_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_barrier_dep_ethash_search_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp23_ethash_search_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp23_xor_ethash_search_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp52_xor_rm_ethash_search_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_idxprom43_rm_ethash_search_vt_const_63_q : STD_LOGIC_VECTOR (61 downto 0);
    signal i_idxprom43_rm_ethash_search_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_idxprom43_rm_ethash_search_vt_select_1_b : STD_LOGIC_VECTOR (1 downto 0);
    signal i_idxprom44_rm_ethash_search_vt_const_63_q : STD_LOGIC_VECTOR (59 downto 0);
    signal i_idxprom44_rm_ethash_search_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_idxprom44_rm_ethash_search_vt_select_3_b : STD_LOGIC_VECTOR (3 downto 0);
    signal i_l_grpid_0_addr_zext_ethash_search_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_l_grpid_0_addr_zext_ethash_search_vt_select_31_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_ethash_search28_ethash_search_out_o_readdata : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_ethash_search28_ethash_search_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_ethash_search28_ethash_search_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_ethash_search28_ethash_search_out_unnamed_ethash_search28_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_ethash_search28_ethash_search_out_unnamed_ethash_search28_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_ethash_search28_ethash_search_out_unnamed_ethash_search28_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_unnamed_ethash_search28_ethash_search_out_unnamed_ethash_search28_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_ethash_search28_ethash_search_out_unnamed_ethash_search28_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_ethash_search28_ethash_search_out_unnamed_ethash_search28_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_ethash_search28_ethash_search_out_unnamed_ethash_search28_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal i_memcoalesce_null_bitcast_011_rm_ethash_search_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_memcoalesce_null_bitcast_011_rm_ethash_search_vt_select_9_b : STD_LOGIC_VECTOR (3 downto 0);
    signal i_memcoalesce_null_bitcast_03_rm_ethash_search_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_memcoalesce_null_bitcast_03_rm_ethash_search_vt_select_9_b : STD_LOGIC_VECTOR (3 downto 0);
    signal i_memcoalesce_null_bitcast_07_rm_ethash_search_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_memcoalesce_null_bitcast_07_rm_ethash_search_vt_select_9_b : STD_LOGIC_VECTOR (3 downto 0);
    signal i_memcoalesce_null_bitcast_0_rm_ethash_search_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_memcoalesce_null_bitcast_0_rm_ethash_search_vt_select_9_b : STD_LOGIC_VECTOR (3 downto 0);
    signal i_rem_rm_ethash_search_vt_const_31_q : STD_LOGIC_VECTOR (2 downto 0);
    signal i_rem_rm_ethash_search_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_rem_rm_ethash_search_vt_select_28_b : STD_LOGIC_VECTOR (28 downto 0);
    signal i_sbar_unnamed_ethash_search29_ethash_search_out_data_exit : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sbar_unnamed_ethash_search29_ethash_search_out_stall_entry : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sbar_unnamed_ethash_search29_ethash_search_out_valid_exit : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sbar_unnamed_ethash_search30_ethash_search_out_data_exit : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sbar_unnamed_ethash_search30_ethash_search_out_stall_entry : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sbar_unnamed_ethash_search30_ethash_search_out_valid_exit : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sbar_unnamed_ethash_search31_ethash_search_out_data_exit : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sbar_unnamed_ethash_search31_ethash_search_out_stall_entry : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sbar_unnamed_ethash_search31_ethash_search_out_valid_exit : STD_LOGIC_VECTOR (0 downto 0);
    signal i_shr_rm_ethash_search_vt_const_31_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_shr_rm_ethash_search_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_shr_rm_ethash_search_vt_select_3_b : STD_LOGIC_VECTOR (3 downto 0);
    signal i_store_memdep_203_ethash_search_out_memdep_203_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_store_memdep_203_ethash_search_out_memdep_203_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_203_ethash_search_out_memdep_203_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal i_store_memdep_203_ethash_search_out_memdep_203_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_203_ethash_search_out_memdep_203_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_203_ethash_search_out_memdep_203_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_203_ethash_search_out_memdep_203_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal i_store_memdep_203_ethash_search_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_203_ethash_search_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_203_ethash_search_out_o_writeack : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_join_13_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_align_14_q : STD_LOGIC_VECTOR (42 downto 0);
    signal i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_align_14_qint : STD_LOGIC_VECTOR (42 downto 0);
    signal i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_join_16_q : STD_LOGIC_VECTOR (70 downto 0);
    signal i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (71 downto 0);
    signal i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (71 downto 0);
    signal i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (71 downto 0);
    signal i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (71 downto 0);
    signal i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_join_13_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_align_14_q : STD_LOGIC_VECTOR (42 downto 0);
    signal i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_align_14_qint : STD_LOGIC_VECTOR (42 downto 0);
    signal i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_join_16_q : STD_LOGIC_VECTOR (70 downto 0);
    signal i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (71 downto 0);
    signal i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (71 downto 0);
    signal i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (71 downto 0);
    signal i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (71 downto 0);
    signal i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_join_13_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_align_14_q : STD_LOGIC_VECTOR (42 downto 0);
    signal i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_align_14_qint : STD_LOGIC_VECTOR (42 downto 0);
    signal i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_join_16_q : STD_LOGIC_VECTOR (70 downto 0);
    signal i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (71 downto 0);
    signal i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (71 downto 0);
    signal i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (71 downto 0);
    signal i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (71 downto 0);
    signal i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_join_13_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_align_14_q : STD_LOGIC_VECTOR (42 downto 0);
    signal i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_align_14_qint : STD_LOGIC_VECTOR (42 downto 0);
    signal i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_join_16_q : STD_LOGIC_VECTOR (70 downto 0);
    signal i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (71 downto 0);
    signal i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (71 downto 0);
    signal i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (71 downto 0);
    signal i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (71 downto 0);
    signal i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_join_13_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_align_14_q : STD_LOGIC_VECTOR (42 downto 0);
    signal i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_align_14_qint : STD_LOGIC_VECTOR (42 downto 0);
    signal i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_join_16_q : STD_LOGIC_VECTOR (70 downto 0);
    signal i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (71 downto 0);
    signal i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (71 downto 0);
    signal i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (71 downto 0);
    signal i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (71 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_join_13_q : STD_LOGIC_VECTOR (58 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_align_14_q : STD_LOGIC_VECTOR (40 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_align_14_qint : STD_LOGIC_VECTOR (40 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_join_16_q : STD_LOGIC_VECTOR (68 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (69 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (69 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (69 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (69 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_join_13_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_align_14_q : STD_LOGIC_VECTOR (42 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_align_14_qint : STD_LOGIC_VECTOR (42 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_join_16_q : STD_LOGIC_VECTOR (70 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (71 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (71 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (71 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (71 downto 0);
    signal rightShiftStage0Idx1Rng2_uid370_i_rem_rm_ethash_search_ethash_search221_shift_x_b : STD_LOGIC_VECTOR (29 downto 0);
    signal rightShiftStage0Idx1Pad2_uid371_i_rem_rm_ethash_search_ethash_search221_shift_x_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0Idx1_uid372_i_rem_rm_ethash_search_ethash_search221_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0_uid374_i_rem_rm_ethash_search_ethash_search221_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid374_i_rem_rm_ethash_search_ethash_search221_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage1Idx1Rng1_uid375_i_rem_rm_ethash_search_ethash_search221_shift_x_b : STD_LOGIC_VECTOR (30 downto 0);
    signal rightShiftStage1Idx1_uid377_i_rem_rm_ethash_search_ethash_search221_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage1_uid379_i_rem_rm_ethash_search_ethash_search221_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage1_uid379_i_rem_rm_ethash_search_ethash_search221_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_shr_rm_ethash_search_BitSelect_for_a_b : STD_LOGIC_VECTOR (3 downto 0);
    signal i_shr_rm_ethash_search_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (13 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist5_i_cmp23_xor_ethash_search_q_30_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_cmp23_xor_ethash_search_q_30_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist5_i_cmp23_xor_ethash_search_q_30_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_cmp23_xor_ethash_search_q_30_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist5_i_cmp23_xor_ethash_search_q_30_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_cmp23_xor_ethash_search_q_30_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_cmp23_xor_ethash_search_q_30_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist5_i_cmp23_xor_ethash_search_q_30_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_cmp23_xor_ethash_search_q_30_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist5_i_cmp23_xor_ethash_search_q_30_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_cmp23_xor_ethash_search_q_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_cmp23_xor_ethash_search_q_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist6_i_cmp23_xor_ethash_search_q_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_cmp23_xor_ethash_search_q_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist6_i_cmp23_xor_ethash_search_q_516_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_cmp23_xor_ethash_search_q_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_cmp23_xor_ethash_search_q_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist6_i_cmp23_xor_ethash_search_q_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_cmp23_xor_ethash_search_q_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist6_i_cmp23_xor_ethash_search_q_516_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_cmp23_ethash_search_q_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_cmp23_ethash_search_q_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist7_i_cmp23_ethash_search_q_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_cmp23_ethash_search_q_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist7_i_cmp23_ethash_search_q_516_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_cmp23_ethash_search_q_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_cmp23_ethash_search_q_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist7_i_cmp23_ethash_search_q_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_cmp23_ethash_search_q_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist7_i_cmp23_ethash_search_q_516_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_barrier_dep_ethash_search_q_30_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_barrier_dep_ethash_search_q_30_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist8_i_barrier_dep_ethash_search_q_30_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_barrier_dep_ethash_search_q_30_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist8_i_barrier_dep_ethash_search_q_30_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_barrier_dep_ethash_search_q_30_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_barrier_dep_ethash_search_q_30_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist8_i_barrier_dep_ethash_search_q_30_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_barrier_dep_ethash_search_q_30_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist8_i_barrier_dep_ethash_search_q_30_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_data_in : STD_LOGIC_VECTOR (5 downto 0);
    signal redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_data_out : STD_LOGIC_VECTOR (5 downto 0);
    signal redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_data_in : STD_LOGIC_VECTOR (3 downto 0);
    signal redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_data_out : STD_LOGIC_VECTOR (3 downto 0);
    signal redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_data_in : STD_LOGIC_VECTOR (3 downto 0);
    signal redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_data_out : STD_LOGIC_VECTOR (3 downto 0);
    signal redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist17_i_and_rm_ethash_search_vt_join_q_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_i_and_rm_ethash_search_vt_join_q_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist17_i_and_rm_ethash_search_vt_join_q_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_i_and_rm_ethash_search_vt_join_q_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist17_i_and_rm_ethash_search_vt_join_q_516_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist17_i_and_rm_ethash_search_vt_join_q_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_i_and_rm_ethash_search_vt_join_q_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist17_i_and_rm_ethash_search_vt_join_q_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_i_and_rm_ethash_search_vt_join_q_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist17_i_and_rm_ethash_search_vt_join_q_516_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo_data_in : STD_LOGIC_VECTOR (3 downto 0);
    signal redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo_data_out : STD_LOGIC_VECTOR (3 downto 0);
    signal redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_ethash_search_B3_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (1412 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (3 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_h : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_i : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_j : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_k : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_l : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_m : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_n : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_o : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_p : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_r : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_s : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_t : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_u : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_v : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_w : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_x : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_y : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_z : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_aa : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_bb : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_cc : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_dd : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_ee : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_ff : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_gg : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_hh : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_ii : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_jj : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_kk : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_ll : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B3_merge_reg_aunroll_x_mm : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal bubble_select_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_store_memdep_198_ethash_search_aunroll_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_store_memdep_198_ethash_search_aunroll_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_store_memdep_199_ethash_search_aunroll_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_store_memdep_199_ethash_search_aunroll_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_store_memdep_200_ethash_search_aunroll_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_store_memdep_200_ethash_search_aunroll_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_store_memdep_ethash_search_aunroll_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_store_memdep_ethash_search_aunroll_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_load_unnamed_ethash_search28_ethash_search_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_unnamed_ethash_search28_ethash_search_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_sbar_unnamed_ethash_search29_ethash_search_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sbar_unnamed_ethash_search29_ethash_search_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_sbar_unnamed_ethash_search30_ethash_search_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sbar_unnamed_ethash_search30_ethash_search_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_sbar_unnamed_ethash_search31_ethash_search_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sbar_unnamed_ethash_search31_ethash_search_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_store_memdep_203_ethash_search_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_store_memdep_203_ethash_search_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (1412 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_f : STD_LOGIC_VECTOR (3 downto 0);
    signal bubble_select_stall_entry_g : STD_LOGIC_VECTOR (31 downto 0);
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
    signal bubble_select_stall_entry_y : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_z : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aa : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_bb : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_cc : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_dd : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_ee : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_ff : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_gg : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_hh : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_ii : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_jj : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_kk : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_ll : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_mm : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist5_i_cmp23_xor_ethash_search_q_30_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist5_i_cmp23_xor_ethash_search_q_30_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist6_i_cmp23_xor_ethash_search_q_516_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist6_i_cmp23_xor_ethash_search_q_516_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist7_i_cmp23_ethash_search_q_516_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist7_i_cmp23_ethash_search_q_516_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist8_i_barrier_dep_ethash_search_q_30_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist8_i_barrier_dep_ethash_search_q_30_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_q : STD_LOGIC_VECTOR (5 downto 0);
    signal bubble_select_redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_b : STD_LOGIC_VECTOR (5 downto 0);
    signal bubble_join_redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_q : STD_LOGIC_VECTOR (3 downto 0);
    signal bubble_select_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_b : STD_LOGIC_VECTOR (3 downto 0);
    signal bubble_join_redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_q : STD_LOGIC_VECTOR (3 downto 0);
    signal bubble_select_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_b : STD_LOGIC_VECTOR (3 downto 0);
    signal bubble_join_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist17_i_and_rm_ethash_search_vt_join_q_516_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist17_i_and_rm_ethash_search_vt_join_q_516_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo_q : STD_LOGIC_VECTOR (3 downto 0);
    signal bubble_select_redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo_b : STD_LOGIC_VECTOR (3 downto 0);
    signal bubble_join_redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg18 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg18 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed18 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg19 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg19 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed19 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg20 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg20 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed20 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg21 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg21 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed21 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg22 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg22 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed22 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg23 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg23 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed23 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg24 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg24 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed24 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg25 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg25 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed25 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg26 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg26 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed26 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg27 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg27 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed27 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg28 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg28 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed28 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg29 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg29 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed29 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg30 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg30 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed30 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg31 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg31 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed31 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg32 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg32 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed32 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg33 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg33 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed33 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg34 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg34 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed34 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg35 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg35 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed35 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg36 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg36 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed36 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg37 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg37 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed37 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg38 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg38 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed38 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg39 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg39 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed39 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg40 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg40 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed40 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg41 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg41 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed41 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg42 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg42 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed42 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg43 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg43 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed43 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg44 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg44 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed44 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg45 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg45 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed45 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg46 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg46 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed46 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg47 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg47 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed47 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg48 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg48 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed48 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or18 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or19 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or20 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or21 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or22 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or23 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or24 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or25 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or26 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or27 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or28 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or29 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or30 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or31 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or32 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or33 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or34 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or35 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or36 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or37 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or38 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or39 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or40 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or41 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or42 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or43 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or44 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or45 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or46 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_or47 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V18 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V19 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V20 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V21 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V22 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V23 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V24 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V25 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V26 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V27 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V28 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V29 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V30 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V31 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V32 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V33 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V34 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V35 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V36 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V37 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V38 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V39 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V40 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V41 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V42 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V43 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V44 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V45 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V46 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V47 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B3_merge_reg_aunroll_x_V48 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_memdep_198_ethash_search_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_memdep_198_ethash_search_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_memdep_198_ethash_search_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_i_store_memdep_199_ethash_search_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_i_store_memdep_199_ethash_search_aunroll_x_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_i_store_memdep_199_ethash_search_aunroll_x_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_i_store_memdep_199_ethash_search_aunroll_x_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_i_store_memdep_199_ethash_search_aunroll_x_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_i_store_memdep_199_ethash_search_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_i_store_memdep_199_ethash_search_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_memdep_ethash_search_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_memdep_ethash_search_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_memdep_ethash_search_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_barrier_dep_ethash_search_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_barrier_dep_ethash_search_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_barrier_dep_ethash_search_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_barrier_dep_ethash_search_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_barrier_dep_ethash_search_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_barrier_dep_ethash_search_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_barrier_dep_ethash_search_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sbar_unnamed_ethash_search29_ethash_search_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sbar_unnamed_ethash_search29_ethash_search_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sbar_unnamed_ethash_search29_ethash_search_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sbar_unnamed_ethash_search30_ethash_search_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sbar_unnamed_ethash_search30_ethash_search_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sbar_unnamed_ethash_search30_ethash_search_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sbar_unnamed_ethash_search31_ethash_search_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sbar_unnamed_ethash_search31_ethash_search_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sbar_unnamed_ethash_search31_ethash_search_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_memdep_203_ethash_search_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_memdep_203_ethash_search_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_memdep_203_ethash_search_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_i_barrier_dep_ethash_search_q_30_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_i_barrier_dep_ethash_search_q_30_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_i_barrier_dep_ethash_search_q_30_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_i_barrier_dep_ethash_search_q_30_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_i_barrier_dep_ethash_search_q_30_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and18 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and19 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and20 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and21 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and22 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and23 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and24 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and25 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and26 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and27 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and28 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and29 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and30 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and31 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and32 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and33 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and34 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and35 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and36 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and37 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and38 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and39 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and40 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and41 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and42 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and43 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and44 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and45 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and46 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and47 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and48 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_sbar_unnamed_ethash_search29_ethash_search_data_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_sbar_unnamed_ethash_search29_ethash_search_data_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_sbar_unnamed_ethash_search29_ethash_search_data_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_sbar_unnamed_ethash_search29_ethash_search_data_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_sbar_unnamed_ethash_search29_ethash_search_data_reg_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_sbar_unnamed_ethash_search29_ethash_search_data_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_sbar_unnamed_ethash_search29_ethash_search_data_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_sbar_unnamed_ethash_search29_ethash_search_data_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_sbar_unnamed_ethash_search29_ethash_search_data_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_sbar_unnamed_ethash_search29_ethash_search_data_reg_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_reg_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_reg_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_reg_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_reg_data_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- i_arraydecay51_rm_ethash_search_vt_const_63(CONSTANT,155)
    i_arraydecay51_rm_ethash_search_vt_const_63_q <= "000000000000000000000000000000000000000000000000000000";

    -- i_arraydecay51_rm_ethash_search_ethash_search241_mult_multconst_x(CONSTANT,44)
    i_arraydecay51_rm_ethash_search_ethash_search241_mult_multconst_x_q <= "000000000000000000000000000000000000000000000000000000000";

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- i_idxprom44_rm_ethash_search_vt_const_63(CONSTANT,189)
    i_idxprom44_rm_ethash_search_vt_const_63_q <= "000000000000000000000000000000000000000000000000000000000000";

    -- i_shr_rm_ethash_search_vt_const_31(CONSTANT,224)
    i_shr_rm_ethash_search_vt_const_31_q <= "0000000000000000000000000000";

    -- i_rem_rm_ethash_search_vt_const_31(CONSTANT,217)
    i_rem_rm_ethash_search_vt_const_31_q <= "000";

    -- rightShiftStage1Idx1Rng1_uid375_i_rem_rm_ethash_search_ethash_search221_shift_x(BITSELECT,374)@1
    rightShiftStage1Idx1Rng1_uid375_i_rem_rm_ethash_search_ethash_search221_shift_x_b <= rightShiftStage0_uid374_i_rem_rm_ethash_search_ethash_search221_shift_x_q(31 downto 1);

    -- rightShiftStage1Idx1_uid377_i_rem_rm_ethash_search_ethash_search221_shift_x(BITJOIN,376)@1
    rightShiftStage1Idx1_uid377_i_rem_rm_ethash_search_ethash_search221_shift_x_q <= GND_q & rightShiftStage1Idx1Rng1_uid375_i_rem_rm_ethash_search_ethash_search221_shift_x_b;

    -- rightShiftStage0Idx1Pad2_uid371_i_rem_rm_ethash_search_ethash_search221_shift_x(CONSTANT,370)
    rightShiftStage0Idx1Pad2_uid371_i_rem_rm_ethash_search_ethash_search221_shift_x_q <= "00";

    -- rightShiftStage0Idx1Rng2_uid370_i_rem_rm_ethash_search_ethash_search221_shift_x(BITSELECT,369)@1
    rightShiftStage0Idx1Rng2_uid370_i_rem_rm_ethash_search_ethash_search221_shift_x_b <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_mm(31 downto 2);

    -- rightShiftStage0Idx1_uid372_i_rem_rm_ethash_search_ethash_search221_shift_x(BITJOIN,371)@1
    rightShiftStage0Idx1_uid372_i_rem_rm_ethash_search_ethash_search221_shift_x_q <= rightShiftStage0Idx1Pad2_uid371_i_rem_rm_ethash_search_ethash_search221_shift_x_q & rightShiftStage0Idx1Rng2_uid370_i_rem_rm_ethash_search_ethash_search221_shift_x_b;

    -- SE_stall_entry(STALLENABLE,865)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= ethash_search_B3_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,577)
    bubble_join_stall_entry_q <= in_state_7_0_cast132 & in_state_6_0_cast129 & in_state_5_0_cast126 & in_state_4_0_cast123 & in_state_0_0_cast120 & in_scalarizer_199850 & in_scalarizer_199640 & in_scalarizer_199430 & in_scalarizer_11180 & in_scalarizer_11178 & in_scalarizer_11176 & in_scalarizer_11174 & in_scalarizer_11008100 & in_scalarizer_1100690 & in_scalarizer_1100480 & in_scalarizer_1100270 & in_scalarizer_1100060 & in_scalarizer_099955 & in_scalarizer_099745 & in_scalarizer_099535 & in_scalarizer_099325 & in_scalarizer_01179 & in_scalarizer_01177 & in_scalarizer_01175 & in_scalarizer_01173 & in_scalarizer_0100795 & in_scalarizer_0100585 & in_scalarizer_0100375 & in_scalarizer_0100165 & in_l_grpid_0_addr9 & in_l_grpid_06 & in_i18_0908 & in_global_id_0195 & in_fpgaindvars_iv12 & in_c0_exe4116 & in_c0_exe3112 & in_c0_exe2108 & in_c0_exe1106;

    -- bubble_select_stall_entry(BITSELECT,578)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(0 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(64 downto 1));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(128 downto 65));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(192 downto 129));
    bubble_select_stall_entry_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(196 downto 193));
    bubble_select_stall_entry_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(228 downto 197));
    bubble_select_stall_entry_h <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(260 downto 229));
    bubble_select_stall_entry_i <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(292 downto 261));
    bubble_select_stall_entry_j <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(324 downto 293));
    bubble_select_stall_entry_k <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(356 downto 325));
    bubble_select_stall_entry_l <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(388 downto 357));
    bubble_select_stall_entry_m <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(420 downto 389));
    bubble_select_stall_entry_n <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(452 downto 421));
    bubble_select_stall_entry_o <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(484 downto 453));
    bubble_select_stall_entry_p <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(516 downto 485));
    bubble_select_stall_entry_q <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(548 downto 517));
    bubble_select_stall_entry_r <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(580 downto 549));
    bubble_select_stall_entry_s <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(612 downto 581));
    bubble_select_stall_entry_t <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(644 downto 613));
    bubble_select_stall_entry_u <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(676 downto 645));
    bubble_select_stall_entry_v <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(708 downto 677));
    bubble_select_stall_entry_w <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(740 downto 709));
    bubble_select_stall_entry_x <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(772 downto 741));
    bubble_select_stall_entry_y <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(804 downto 773));
    bubble_select_stall_entry_z <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(836 downto 805));
    bubble_select_stall_entry_aa <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(868 downto 837));
    bubble_select_stall_entry_bb <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(900 downto 869));
    bubble_select_stall_entry_cc <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(932 downto 901));
    bubble_select_stall_entry_dd <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(964 downto 933));
    bubble_select_stall_entry_ee <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(996 downto 965));
    bubble_select_stall_entry_ff <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1028 downto 997));
    bubble_select_stall_entry_gg <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1060 downto 1029));
    bubble_select_stall_entry_hh <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1092 downto 1061));
    bubble_select_stall_entry_ii <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1156 downto 1093));
    bubble_select_stall_entry_jj <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1220 downto 1157));
    bubble_select_stall_entry_kk <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1284 downto 1221));
    bubble_select_stall_entry_ll <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1348 downto 1285));
    bubble_select_stall_entry_mm <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1412 downto 1349));

    -- ethash_search_B3_merge_reg_aunroll_x(BLACKBOX,39)@0
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
    -- out out_data_out_23@1
    -- out out_data_out_24@1
    -- out out_data_out_25@1
    -- out out_data_out_26@1
    -- out out_data_out_27@1
    -- out out_data_out_28@1
    -- out out_data_out_29@1
    -- out out_data_out_30@1
    -- out out_data_out_31@1
    -- out out_data_out_32@1
    -- out out_data_out_33@1
    -- out out_data_out_34@1
    -- out out_data_out_35@1
    -- out out_data_out_36@1
    -- out out_data_out_37@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    theethash_search_B3_merge_reg_aunroll_x : ethash_search_B3_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_f,
        in_data_in_1 => bubble_select_stall_entry_o,
        in_data_in_2 => bubble_select_stall_entry_bb,
        in_data_in_3 => bubble_select_stall_entry_p,
        in_data_in_4 => bubble_select_stall_entry_cc,
        in_data_in_5 => bubble_select_stall_entry_q,
        in_data_in_6 => bubble_select_stall_entry_dd,
        in_data_in_7 => bubble_select_stall_entry_r,
        in_data_in_8 => bubble_select_stall_entry_ee,
        in_data_in_9 => bubble_select_stall_entry_h,
        in_data_in_10 => bubble_select_stall_entry_i,
        in_data_in_11 => bubble_select_stall_entry_j,
        in_data_in_12 => bubble_select_stall_entry_s,
        in_data_in_13 => bubble_select_stall_entry_ff,
        in_data_in_14 => bubble_select_stall_entry_t,
        in_data_in_15 => bubble_select_stall_entry_gg,
        in_data_in_16 => bubble_select_stall_entry_u,
        in_data_in_17 => bubble_select_stall_entry_hh,
        in_data_in_18 => bubble_select_stall_entry_v,
        in_data_in_19 => bubble_select_stall_entry_w,
        in_data_in_20 => bubble_select_stall_entry_k,
        in_data_in_21 => bubble_select_stall_entry_x,
        in_data_in_22 => bubble_select_stall_entry_l,
        in_data_in_23 => bubble_select_stall_entry_y,
        in_data_in_24 => bubble_select_stall_entry_m,
        in_data_in_25 => bubble_select_stall_entry_z,
        in_data_in_26 => bubble_select_stall_entry_n,
        in_data_in_27 => bubble_select_stall_entry_aa,
        in_data_in_28 => bubble_select_stall_entry_b,
        in_data_in_29 => bubble_select_stall_entry_c,
        in_data_in_30 => bubble_select_stall_entry_d,
        in_data_in_31 => bubble_select_stall_entry_e,
        in_data_in_32 => bubble_select_stall_entry_ii,
        in_data_in_33 => bubble_select_stall_entry_jj,
        in_data_in_34 => bubble_select_stall_entry_kk,
        in_data_in_35 => bubble_select_stall_entry_ll,
        in_data_in_36 => bubble_select_stall_entry_mm,
        in_data_in_37 => bubble_select_stall_entry_g,
        in_stall_in => SE_out_ethash_search_B3_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_0,
        out_data_out_1 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_1,
        out_data_out_2 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_2,
        out_data_out_3 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_3,
        out_data_out_4 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_4,
        out_data_out_5 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_5,
        out_data_out_6 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_6,
        out_data_out_7 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_7,
        out_data_out_8 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_8,
        out_data_out_9 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_9,
        out_data_out_10 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_10,
        out_data_out_11 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_11,
        out_data_out_12 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_12,
        out_data_out_13 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_13,
        out_data_out_14 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_14,
        out_data_out_15 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_15,
        out_data_out_16 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_16,
        out_data_out_17 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_17,
        out_data_out_18 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_18,
        out_data_out_19 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_19,
        out_data_out_20 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_20,
        out_data_out_21 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_21,
        out_data_out_22 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_22,
        out_data_out_23 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_23,
        out_data_out_24 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_24,
        out_data_out_25 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_25,
        out_data_out_26 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_26,
        out_data_out_27 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_27,
        out_data_out_28 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_28,
        out_data_out_29 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_29,
        out_data_out_30 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_30,
        out_data_out_31 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_31,
        out_data_out_32 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_32,
        out_data_out_33 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_33,
        out_data_out_34 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_34,
        out_data_out_35 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_35,
        out_data_out_36 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_36,
        out_data_out_37 => ethash_search_B3_merge_reg_aunroll_x_out_data_out_37,
        out_stall_out => ethash_search_B3_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => ethash_search_B3_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_ethash_search_B3_merge_reg_aunroll_x(BITJOIN,543)
    bubble_join_ethash_search_B3_merge_reg_aunroll_x_q <= ethash_search_B3_merge_reg_aunroll_x_out_data_out_37 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_36 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_35 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_34 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_33 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_32 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_31 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_30 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_29 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_28 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_27 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_26 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_25 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_24 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_23 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_22 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_21 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_20 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_19 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_18 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_17 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_16 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_15 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_14 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_13 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_12 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_11 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_10 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_9 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_8 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_7 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_6 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_5 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_4 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_3 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_2 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_1 & ethash_search_B3_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_ethash_search_B3_merge_reg_aunroll_x(BITSELECT,544)
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(3 downto 0));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(35 downto 4));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(67 downto 36));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(99 downto 68));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(131 downto 100));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(163 downto 132));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(195 downto 164));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(227 downto 196));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_j <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(259 downto 228));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_k <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(291 downto 260));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_l <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(323 downto 292));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_m <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(355 downto 324));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_n <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(387 downto 356));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_o <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(419 downto 388));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_p <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(451 downto 420));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_q <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(483 downto 452));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_r <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(515 downto 484));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_s <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(547 downto 516));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_t <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(579 downto 548));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_u <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(611 downto 580));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_v <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(643 downto 612));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_w <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(675 downto 644));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_x <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(707 downto 676));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_y <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(739 downto 708));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_z <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(771 downto 740));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_aa <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(803 downto 772));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_bb <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(835 downto 804));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_cc <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(867 downto 836));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_dd <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(868 downto 868));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_ee <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(932 downto 869));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_ff <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(996 downto 933));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_gg <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(1060 downto 997));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_hh <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(1124 downto 1061));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_ii <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(1188 downto 1125));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_jj <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(1252 downto 1189));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_kk <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(1316 downto 1253));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_ll <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(1380 downto 1317));
    bubble_select_ethash_search_B3_merge_reg_aunroll_x_mm <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B3_merge_reg_aunroll_x_q(1412 downto 1381));

    -- rightShiftStage0_uid374_i_rem_rm_ethash_search_ethash_search221_shift_x(MUX,373)@1
    rightShiftStage0_uid374_i_rem_rm_ethash_search_ethash_search221_shift_x_s <= VCC_q;
    rightShiftStage0_uid374_i_rem_rm_ethash_search_ethash_search221_shift_x_combproc: PROCESS (rightShiftStage0_uid374_i_rem_rm_ethash_search_ethash_search221_shift_x_s, bubble_select_ethash_search_B3_merge_reg_aunroll_x_mm, rightShiftStage0Idx1_uid372_i_rem_rm_ethash_search_ethash_search221_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid374_i_rem_rm_ethash_search_ethash_search221_shift_x_s) IS
            WHEN "0" => rightShiftStage0_uid374_i_rem_rm_ethash_search_ethash_search221_shift_x_q <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_mm;
            WHEN "1" => rightShiftStage0_uid374_i_rem_rm_ethash_search_ethash_search221_shift_x_q <= rightShiftStage0Idx1_uid372_i_rem_rm_ethash_search_ethash_search221_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid374_i_rem_rm_ethash_search_ethash_search221_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1_uid379_i_rem_rm_ethash_search_ethash_search221_shift_x(MUX,378)@1
    rightShiftStage1_uid379_i_rem_rm_ethash_search_ethash_search221_shift_x_s <= VCC_q;
    rightShiftStage1_uid379_i_rem_rm_ethash_search_ethash_search221_shift_x_combproc: PROCESS (rightShiftStage1_uid379_i_rem_rm_ethash_search_ethash_search221_shift_x_s, rightShiftStage0_uid374_i_rem_rm_ethash_search_ethash_search221_shift_x_q, rightShiftStage1Idx1_uid377_i_rem_rm_ethash_search_ethash_search221_shift_x_q)
    BEGIN
        CASE (rightShiftStage1_uid379_i_rem_rm_ethash_search_ethash_search221_shift_x_s) IS
            WHEN "0" => rightShiftStage1_uid379_i_rem_rm_ethash_search_ethash_search221_shift_x_q <= rightShiftStage0_uid374_i_rem_rm_ethash_search_ethash_search221_shift_x_q;
            WHEN "1" => rightShiftStage1_uid379_i_rem_rm_ethash_search_ethash_search221_shift_x_q <= rightShiftStage1Idx1_uid377_i_rem_rm_ethash_search_ethash_search221_shift_x_q;
            WHEN OTHERS => rightShiftStage1_uid379_i_rem_rm_ethash_search_ethash_search221_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_rem_rm_ethash_search_vt_select_28(BITSELECT,219)@1
    i_rem_rm_ethash_search_vt_select_28_b <= rightShiftStage1_uid379_i_rem_rm_ethash_search_ethash_search221_shift_x_q(28 downto 0);

    -- i_rem_rm_ethash_search_vt_join(BITJOIN,218)@1
    i_rem_rm_ethash_search_vt_join_q <= i_rem_rm_ethash_search_vt_const_31_q & i_rem_rm_ethash_search_vt_select_28_b;

    -- i_shr_rm_ethash_search_BitSelect_for_a(BITSELECT,383)@1
    i_shr_rm_ethash_search_BitSelect_for_a_b <= i_rem_rm_ethash_search_vt_join_q(3 downto 0);

    -- i_shr_rm_ethash_search_join(BITJOIN,384)@1
    i_shr_rm_ethash_search_join_q <= GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & i_shr_rm_ethash_search_BitSelect_for_a_b;

    -- i_shr_rm_ethash_search_vt_select_3(BITSELECT,226)@1
    i_shr_rm_ethash_search_vt_select_3_b <= i_shr_rm_ethash_search_join_q(3 downto 0);

    -- i_shr_rm_ethash_search_vt_join(BITJOIN,225)@1
    i_shr_rm_ethash_search_vt_join_q <= i_shr_rm_ethash_search_vt_const_31_q & i_shr_rm_ethash_search_vt_select_3_b;

    -- i_idxprom44_rm_ethash_search_sel_x(BITSELECT,123)@1
    i_idxprom44_rm_ethash_search_sel_x_b <= std_logic_vector(resize(unsigned(i_shr_rm_ethash_search_vt_join_q(31 downto 0)), 64));

    -- i_idxprom44_rm_ethash_search_vt_select_3(BITSELECT,191)@1
    i_idxprom44_rm_ethash_search_vt_select_3_b <= i_idxprom44_rm_ethash_search_sel_x_b(3 downto 0);

    -- i_idxprom44_rm_ethash_search_vt_join(BITJOIN,190)@1
    i_idxprom44_rm_ethash_search_vt_join_q <= i_idxprom44_rm_ethash_search_vt_const_63_q & i_idxprom44_rm_ethash_search_vt_select_3_b;

    -- i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_bs1_merged_bit_select(BITSELECT,415)@1
    i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_bs1_merged_bit_select_b <= i_idxprom44_rm_ethash_search_vt_join_q(17 downto 0);
    i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_bs1_merged_bit_select_c <= i_idxprom44_rm_ethash_search_vt_join_q(63 downto 54);
    i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_bs1_merged_bit_select_d <= i_idxprom44_rm_ethash_search_vt_join_q(35 downto 18);
    i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_bs1_merged_bit_select_e <= i_idxprom44_rm_ethash_search_vt_join_q(53 downto 36);

    -- i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_im3_shift0(BITSHIFT,387)@1
    i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_im3_shift0_qint <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_bs1_merged_bit_select_c & "000000";
    i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_im3_shift0_q <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_im3_shift0_qint(15 downto 0);

    -- i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_align_15(BITSHIFT,255)@1
    i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_im3_shift0_q) & "00000000000";
    i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_align_15_q <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_align_15_qint(27 downto 0);

    -- i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_im6_shift0(BITSHIFT,388)@1
    i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_im6_shift0_qint <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_bs1_merged_bit_select_d & "000000";
    i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_im6_shift0_q <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_im6_shift0_qint(23 downto 0);

    -- i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_align_14(BITSHIFT,254)@1
    i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_im6_shift0_q) & "000000000000000000";
    i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_align_14_q <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_align_14_qint(42 downto 0);

    -- i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_join_16(BITJOIN,256)@1
    i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_join_16_q <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_align_15_q & i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_align_14_q;

    -- i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_im9_shift0(BITSHIFT,389)@1
    i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_im9_shift0_qint <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_bs1_merged_bit_select_e & "000000";
    i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_im9_shift0_q <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_im9_shift0_qint(23 downto 0);

    -- i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_align_12(BITSHIFT,252)@1
    i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_im9_shift0_q) & "00000000000";
    i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_align_12_q <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_align_12_qint(35 downto 0);

    -- i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_im0_shift0(BITSHIFT,386)@1
    i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_im0_shift0_qint <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_bs1_merged_bit_select_b & "000000";
    i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_im0_shift0_q <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_im0_shift0_qint(23 downto 0);

    -- i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_join_13(BITJOIN,253)@1
    i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_join_13_q <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_im0_shift0_q);

    -- i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_result_add_0_0(ADD,257)@1
    i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_join_13_q);
    i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_join_16_q);
    i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_result_add_0_0_a) + UNSIGNED(i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_result_add_0_0_b));
    i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_result_add_0_0_q <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_result_add_0_0_o(71 downto 0);

    -- i_arraydecay51_rm_ethash_search_ethash_search241_mult_extender_x(BITJOIN,43)@1
    i_arraydecay51_rm_ethash_search_ethash_search241_mult_extender_x_q <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_multconst_x_q & i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_result_add_0_0_q(70 downto 0);

    -- i_arraydecay51_rm_ethash_search_ethash_search241_trunc_sel_x(BITSELECT,45)@1
    i_arraydecay51_rm_ethash_search_ethash_search241_trunc_sel_x_b <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_extender_x_q(63 downto 0);

    -- i_arraydecay51_rm_ethash_search_ethash_search241_dupName_0_trunc_sel_x(BITSELECT,40)@1
    i_arraydecay51_rm_ethash_search_ethash_search241_dupName_0_trunc_sel_x_in <= STD_LOGIC_VECTOR("0" & i_arraydecay51_rm_ethash_search_ethash_search241_trunc_sel_x_b);
    i_arraydecay51_rm_ethash_search_ethash_search241_dupName_0_trunc_sel_x_b <= i_arraydecay51_rm_ethash_search_ethash_search241_dupName_0_trunc_sel_x_in(63 downto 0);

    -- i_arraydecay51_rm_ethash_search_vt_select_9(BITSELECT,157)@1
    i_arraydecay51_rm_ethash_search_vt_select_9_b <= i_arraydecay51_rm_ethash_search_ethash_search241_dupName_0_trunc_sel_x_b(9 downto 6);

    -- bubble_join_i_sbar_unnamed_ethash_search29_ethash_search(BITJOIN,565)
    bubble_join_i_sbar_unnamed_ethash_search29_ethash_search_q <= i_sbar_unnamed_ethash_search29_ethash_search_out_data_exit;

    -- bubble_join_i_sbar_unnamed_ethash_search30_ethash_search(BITJOIN,568)
    bubble_join_i_sbar_unnamed_ethash_search30_ethash_search_q <= i_sbar_unnamed_ethash_search30_ethash_search_out_data_exit;

    -- bubble_join_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo(BITJOIN,635)
    bubble_join_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_q <= redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_data_out;

    -- bubble_select_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo(BITSELECT,636)
    bubble_select_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_q(31 downto 0));

    -- SE_out_i_sbar_unnamed_ethash_search31_ethash_search(STALLENABLE,860)
    -- Valid signal propagation
    SE_out_i_sbar_unnamed_ethash_search31_ethash_search_V0 <= SE_out_i_sbar_unnamed_ethash_search31_ethash_search_wireValid;
    -- Backward Stall generation
    SE_out_i_sbar_unnamed_ethash_search31_ethash_search_backStall <= bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_reg_stall_out or not (SE_out_i_sbar_unnamed_ethash_search31_ethash_search_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_sbar_unnamed_ethash_search31_ethash_search_wireValid <= i_sbar_unnamed_ethash_search31_ethash_search_out_valid_exit;

    -- bubble_join_i_store_memdep_203_ethash_search(BITJOIN,574)
    bubble_join_i_store_memdep_203_ethash_search_q <= i_store_memdep_203_ethash_search_out_o_writeack;

    -- bubble_select_i_store_memdep_203_ethash_search(BITSELECT,575)
    bubble_select_i_store_memdep_203_ethash_search_b <= STD_LOGIC_VECTOR(bubble_join_i_store_memdep_203_ethash_search_q(0 downto 0));

    -- i_sbar_unnamed_ethash_search31_ethash_search(BLACKBOX,222)@355
    -- in in_stall_exit@20000000
    -- out out_data_exit@485
    -- out out_stall_entry@20000000
    -- out out_valid_exit@485
    thei_sbar_unnamed_ethash_search31_ethash_search : i_sbar_unnamed_ethash_search31_ethash_search245
    PORT MAP (
        in_data_entry => bubble_select_i_store_memdep_203_ethash_search_b,
        in_stall_exit => SE_out_i_sbar_unnamed_ethash_search31_ethash_search_backStall,
        in_valid_entry => SE_out_i_store_memdep_203_ethash_search_V0,
        in_workgroup_size => in_barrier_unnamed_ethash_search31_wgs_workgroup_size,
        out_data_exit => i_sbar_unnamed_ethash_search31_ethash_search_out_data_exit,
        out_stall_entry => i_sbar_unnamed_ethash_search31_ethash_search_out_stall_entry,
        out_valid_exit => i_sbar_unnamed_ethash_search31_ethash_search_out_valid_exit,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_store_memdep_203_ethash_search(STALLENABLE,864)
    -- Valid signal propagation
    SE_out_i_store_memdep_203_ethash_search_V0 <= SE_out_i_store_memdep_203_ethash_search_wireValid;
    -- Backward Stall generation
    SE_out_i_store_memdep_203_ethash_search_backStall <= i_sbar_unnamed_ethash_search31_ethash_search_out_stall_entry or not (SE_out_i_store_memdep_203_ethash_search_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_store_memdep_203_ethash_search_wireValid <= i_store_memdep_203_ethash_search_out_o_valid;

    -- c_i32_0gr(CONSTANT,138)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- bubble_join_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo(BITJOIN,629)
    bubble_join_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_q <= redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_data_out;

    -- bubble_select_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo(BITSELECT,630)
    bubble_select_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_q(31 downto 0));

    -- i_cmp52_xor_rm_ethash_search(LOGICAL,183)@324
    i_cmp52_xor_rm_ethash_search_q <= "1" WHEN bubble_select_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_b /= c_i32_0gr_q ELSE "0";

    -- bubble_select_i_sbar_unnamed_ethash_search30_ethash_search(BITSELECT,569)
    bubble_select_i_sbar_unnamed_ethash_search30_ethash_search_b <= STD_LOGIC_VECTOR(bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_reg_data_out(0 downto 0));

    -- redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo(STALLFIFO,481)
    redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_valid_in <= SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_V1;
    redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_stall_in <= SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_backStall;
    redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_data_in <= bubble_select_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_b;
    redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_valid_in_bitsignaltemp <= redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_valid_in(0);
    redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_stall_in_bitsignaltemp <= redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_stall_in(0);
    redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_valid_out(0) <= redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_valid_out_bitsignaltemp;
    redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_stall_out(0) <= redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_stall_out_bitsignaltemp;
    theredist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 163,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_valid_in_bitsignaltemp,
        stall_in => redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_b,
        valid_out => redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_valid_out_bitsignaltemp,
        stall_out => redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_stall_out_bitsignaltemp,
        data_out => redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo(BITJOIN,587)
    bubble_join_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_q <= redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_data_out;

    -- bubble_select_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo(BITSELECT,588)
    bubble_select_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_q(63 downto 0));

    -- i_store_memdep_203_ethash_search(BLACKBOX,227)@324
    -- in in_i_stall@20000000
    -- out out_memdep_203_avm_address@20000000
    -- out out_memdep_203_avm_burstcount@20000000
    -- out out_memdep_203_avm_byteenable@20000000
    -- out out_memdep_203_avm_enable@20000000
    -- out out_memdep_203_avm_read@20000000
    -- out out_memdep_203_avm_write@20000000
    -- out out_memdep_203_avm_writedata@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@355
    -- out out_o_writeack@355
    thei_store_memdep_203_ethash_search : i_store_memdep_203_ethash_search243
    PORT MAP (
        in_flush => in_flush,
        in_i_address => i_arraydecay51_rm_ethash_search_vt_join_q,
        in_i_bitwiseor => bubble_select_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_b,
        in_i_dependence => bubble_select_i_sbar_unnamed_ethash_search30_ethash_search_b,
        in_i_predicate => i_cmp52_xor_rm_ethash_search_q,
        in_i_stall => SE_out_i_store_memdep_203_ethash_search_backStall,
        in_i_valid => SE_out_bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_V0,
        in_i_writedata => bubble_select_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_b,
        in_memdep_203_avm_readdata => in_memdep_203_avm_readdata,
        in_memdep_203_avm_readdatavalid => in_memdep_203_avm_readdatavalid,
        in_memdep_203_avm_waitrequest => in_memdep_203_avm_waitrequest,
        in_memdep_203_avm_writeack => in_memdep_203_avm_writeack,
        out_memdep_203_avm_address => i_store_memdep_203_ethash_search_out_memdep_203_avm_address,
        out_memdep_203_avm_burstcount => i_store_memdep_203_ethash_search_out_memdep_203_avm_burstcount,
        out_memdep_203_avm_byteenable => i_store_memdep_203_ethash_search_out_memdep_203_avm_byteenable,
        out_memdep_203_avm_enable => i_store_memdep_203_ethash_search_out_memdep_203_avm_enable,
        out_memdep_203_avm_read => i_store_memdep_203_ethash_search_out_memdep_203_avm_read,
        out_memdep_203_avm_write => i_store_memdep_203_ethash_search_out_memdep_203_avm_write,
        out_memdep_203_avm_writedata => i_store_memdep_203_ethash_search_out_memdep_203_avm_writedata,
        out_o_stall => i_store_memdep_203_ethash_search_out_o_stall,
        out_o_valid => i_store_memdep_203_ethash_search_out_o_valid,
        out_o_writeack => i_store_memdep_203_ethash_search_out_o_writeack,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo(STALLENABLE,984)
    SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_fromReg0 <= (others => '0');
            SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_fromReg0 <= SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_toReg0;
            -- Succesor 1
            SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_fromReg1 <= SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_consumed0 <= (not (SE_out_bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_backStall) and SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_wireValid) or SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_fromReg0;
    SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_consumed1 <= (not (redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo_stall_out) and SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_wireValid) or SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_fromReg1;
    -- Consuming
    SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_StallValid <= SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_backStall and SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_wireValid;
    SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_toReg0 <= SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_StallValid and SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_consumed0;
    SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_toReg1 <= SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_StallValid and SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_or0 <= SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_consumed0;
    SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_wireStall <= not (SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_consumed1 and SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_or0);
    SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_backStall <= SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_V0 <= SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_wireValid and not (SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_fromReg0);
    SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_V1 <= SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_wireValid and not (SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_wireValid <= redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_valid_out;

    -- redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo(STALLFIFO,482)
    redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_valid_in <= SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_V1;
    redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_stall_in <= SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_backStall;
    redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_data_in <= bubble_select_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_b;
    redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_valid_in_bitsignaltemp <= redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_valid_in(0);
    redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_stall_in_bitsignaltemp <= redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_stall_in(0);
    redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_valid_out(0) <= redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_valid_out_bitsignaltemp;
    redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_stall_out(0) <= redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_stall_out_bitsignaltemp;
    theredist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 162,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_valid_in_bitsignaltemp,
        stall_in => redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_b,
        valid_out => redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_valid_out_bitsignaltemp,
        stall_out => redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_stall_out_bitsignaltemp,
        data_out => redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo(STALLENABLE,952)
    SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_fromReg0 <= (others => '0');
            SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_fromReg0 <= SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_toReg0;
            -- Succesor 1
            SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_fromReg1 <= SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_consumed0 <= (not (SE_out_bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_backStall) and SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_wireValid) or SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_fromReg0;
    SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_consumed1 <= (not (redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_stall_out) and SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_wireValid) or SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_fromReg1;
    -- Consuming
    SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_StallValid <= SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_backStall and SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_wireValid;
    SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_toReg0 <= SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_StallValid and SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_consumed0;
    SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_toReg1 <= SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_StallValid and SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_or0 <= SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_consumed0;
    SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_wireStall <= not (SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_consumed1 and SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_or0);
    SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_backStall <= SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_V0 <= SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_wireValid and not (SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_fromReg0);
    SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_V1 <= SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_wireValid and not (SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_wireValid <= redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_valid_out;

    -- SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo(STALLENABLE,980)
    SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_fromReg0 <= (others => '0');
            SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_fromReg0 <= SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_toReg0;
            -- Succesor 1
            SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_fromReg1 <= SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_consumed0 <= (not (SE_out_bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_backStall) and SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_wireValid) or SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_fromReg0;
    SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_consumed1 <= (not (redist17_i_and_rm_ethash_search_vt_join_q_516_fifo_stall_out) and SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_wireValid) or SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_fromReg1;
    -- Consuming
    SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_StallValid <= SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_backStall and SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_wireValid;
    SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_toReg0 <= SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_StallValid and SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_consumed0;
    SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_toReg1 <= SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_StallValid and SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_or0 <= SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_consumed0;
    SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_wireStall <= not (SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_consumed1 and SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_or0);
    SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_backStall <= SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_V0 <= SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_wireValid and not (SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_fromReg0);
    SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_V1 <= SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_wireValid and not (SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_wireValid <= redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_valid_out;

    -- SE_out_bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data(STALLENABLE,1108)
    -- Valid signal propagation
    SE_out_bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_V0 <= SE_out_bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_backStall <= i_store_memdep_203_ethash_search_out_o_stall or not (SE_out_bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_and0 <= bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_reg_valid_out;
    SE_out_bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_and1 <= SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_V0 and SE_out_bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_and0;
    SE_out_bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_and2 <= SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_V0 and SE_out_bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_and1;
    SE_out_bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_and3 <= SE_out_redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_V0 and SE_out_bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_and2;
    SE_out_bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_wireValid <= SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_V0 and SE_out_bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_and3;

    -- bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_reg(STALLFIFO,1378)
    bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_reg_valid_in <= SE_out_i_sbar_unnamed_ethash_search30_ethash_search_V0;
    bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_reg_stall_in <= SE_out_bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_backStall;
    bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_reg_data_in <= bubble_join_i_sbar_unnamed_ethash_search30_ethash_search_q;
    bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_reg_valid_in_bitsignaltemp <= bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_reg_valid_in(0);
    bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_reg_stall_in_bitsignaltemp <= bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_reg_stall_in(0);
    bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_reg_valid_out(0) <= bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_reg_valid_out_bitsignaltemp;
    bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_reg_stall_out(0) <= bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_reg_stall_out_bitsignaltemp;
    thebubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_reg : acl_data_fifo
    GENERIC MAP (
        DEPTH => 3,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "zl_reg"
    )
    PORT MAP (
        valid_in => bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_reg_stall_in_bitsignaltemp,
        data_in => bubble_join_i_sbar_unnamed_ethash_search30_ethash_search_q,
        valid_out => bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_reg_stall_out_bitsignaltemp,
        data_out => bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_reg_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_sbar_unnamed_ethash_search30_ethash_search(STALLENABLE,858)
    -- Valid signal propagation
    SE_out_i_sbar_unnamed_ethash_search30_ethash_search_V0 <= SE_out_i_sbar_unnamed_ethash_search30_ethash_search_wireValid;
    -- Backward Stall generation
    SE_out_i_sbar_unnamed_ethash_search30_ethash_search_backStall <= bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_reg_stall_out or not (SE_out_i_sbar_unnamed_ethash_search30_ethash_search_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_sbar_unnamed_ethash_search30_ethash_search_wireValid <= i_sbar_unnamed_ethash_search30_ethash_search_out_valid_exit;

    -- bubble_join_i_load_unnamed_ethash_search27_ethash_search_vunroll_x(BITJOIN,546)
    bubble_join_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_q <= i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3 & i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2 & i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1 & i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0;

    -- bubble_select_i_load_unnamed_ethash_search27_ethash_search_vunroll_x(BITSELECT,547)
    bubble_select_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_q(31 downto 0));
    bubble_select_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_q(63 downto 32));
    bubble_select_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_q(95 downto 64));
    bubble_select_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_q(127 downto 96));

    -- i_toi1_intcast_ethash_search_sel_x(BITSELECT,134)@194
    i_toi1_intcast_ethash_search_sel_x_b <= bubble_select_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_b(0 downto 0);

    -- i_sbar_unnamed_ethash_search30_ethash_search(BLACKBOX,221)@194
    -- in in_stall_exit@20000000
    -- out out_data_exit@324
    -- out out_stall_entry@20000000
    -- out out_valid_exit@324
    thei_sbar_unnamed_ethash_search30_ethash_search : i_sbar_unnamed_ethash_search30_ethash_search239
    PORT MAP (
        in_data_entry => i_toi1_intcast_ethash_search_sel_x_b,
        in_stall_exit => SE_out_i_sbar_unnamed_ethash_search30_ethash_search_backStall,
        in_valid_entry => SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_V4,
        in_workgroup_size => in_barrier_unnamed_ethash_search30_wgs_workgroup_size,
        out_data_exit => i_sbar_unnamed_ethash_search30_ethash_search_out_data_exit,
        out_stall_entry => i_sbar_unnamed_ethash_search30_ethash_search_out_stall_entry,
        out_valid_exit => i_sbar_unnamed_ethash_search30_ethash_search_out_valid_exit,
        clock => clock,
        resetn => resetn
    );

    -- redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo(STALLFIFO,497)
    redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_valid_in <= SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_V0;
    redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_stall_in <= SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_backStall;
    redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_data_in <= bubble_select_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_b;
    redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_valid_in_bitsignaltemp <= redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_valid_in(0);
    redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_stall_in_bitsignaltemp <= redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_stall_in(0);
    redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_valid_out(0) <= redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_valid_out_bitsignaltemp;
    redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_stall_out(0) <= redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_stall_out_bitsignaltemp;
    theredist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 131,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_valid_in_bitsignaltemp,
        stall_in => redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_b,
        valid_out => redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_valid_out_bitsignaltemp,
        stall_out => redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_stall_out_bitsignaltemp,
        data_out => redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x(STALLENABLE,803)
    SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_fromReg0 <= (others => '0');
            SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_fromReg1 <= (others => '0');
            SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_fromReg2 <= (others => '0');
            SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_fromReg3 <= (others => '0');
            SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_fromReg4 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_fromReg0 <= SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_toReg0;
            -- Succesor 1
            SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_fromReg1 <= SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_toReg1;
            -- Succesor 2
            SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_fromReg2 <= SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_toReg2;
            -- Succesor 3
            SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_fromReg3 <= SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_toReg3;
            -- Succesor 4
            SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_fromReg4 <= SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_toReg4;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_consumed0 <= (not (redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_stall_out) and SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_wireValid) or SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_fromReg0;
    SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_consumed1 <= (not (redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo_stall_out) and SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_wireValid) or SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_fromReg1;
    SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_consumed2 <= (not (redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo_stall_out) and SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_wireValid) or SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_fromReg2;
    SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_consumed3 <= (not (redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo_stall_out) and SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_wireValid) or SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_fromReg3;
    SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_consumed4 <= (not (i_sbar_unnamed_ethash_search30_ethash_search_out_stall_entry) and SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_wireValid) or SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_fromReg4;
    -- Consuming
    SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_StallValid <= SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_backStall and SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_wireValid;
    SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_toReg0 <= SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_StallValid and SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_consumed0;
    SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_toReg1 <= SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_StallValid and SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_consumed1;
    SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_toReg2 <= SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_StallValid and SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_consumed2;
    SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_toReg3 <= SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_StallValid and SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_consumed3;
    SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_toReg4 <= SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_StallValid and SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_consumed4;
    -- Backward Stall generation
    SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_or0 <= SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_consumed0;
    SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_or1 <= SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_consumed1 and SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_or0;
    SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_or2 <= SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_consumed2 and SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_or1;
    SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_or3 <= SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_consumed3 and SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_or2;
    SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_wireStall <= not (SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_consumed4 and SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_or3);
    SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_backStall <= SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_V0 <= SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_wireValid and not (SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_fromReg0);
    SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_V1 <= SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_wireValid and not (SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_fromReg1);
    SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_V2 <= SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_wireValid and not (SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_fromReg2);
    SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_V3 <= SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_wireValid and not (SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_fromReg3);
    SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_V4 <= SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_wireValid and not (SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_fromReg4);
    -- Computing multiple Valid(s)
    SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_wireValid <= i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_valid;

    -- bubble_select_i_sbar_unnamed_ethash_search29_ethash_search(BITSELECT,566)
    bubble_select_i_sbar_unnamed_ethash_search29_ethash_search_b <= STD_LOGIC_VECTOR(bubble_out_i_sbar_unnamed_ethash_search29_ethash_search_data_reg_data_out(0 downto 0));

    -- bubble_join_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo(BITJOIN,581)
    bubble_join_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_q <= redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_data_out;

    -- bubble_select_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo(BITSELECT,582)
    bubble_select_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_q(63 downto 0));

    -- SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo(STALLENABLE,1058)
    SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_fromReg0 <= (others => '0');
            SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_fromReg0 <= SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_toReg0;
            -- Succesor 1
            SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_fromReg1 <= SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_consumed0 <= (not (SE_in_i_store_memdep_199_ethash_search_aunroll_x_backStall) and SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_wireValid) or SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_fromReg0;
    SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_consumed1 <= (not (redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo_stall_out) and SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_wireValid) or SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_fromReg1;
    -- Consuming
    SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_StallValid <= SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_backStall and SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_wireValid;
    SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_toReg0 <= SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_StallValid and SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_consumed0;
    SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_toReg1 <= SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_StallValid and SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_or0 <= SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_consumed0;
    SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_wireStall <= not (SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_consumed1 and SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_or0);
    SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_backStall <= SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_V0 <= SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_wireValid and not (SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_fromReg0);
    SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_V1 <= SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_wireValid and not (SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_wireValid <= redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_valid_out;

    -- SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo(STALLENABLE,1054)
    SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_fromReg0 <= (others => '0');
            SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_fromReg0 <= SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_toReg0;
            -- Succesor 1
            SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_fromReg1 <= SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_consumed0 <= (not (SE_in_i_store_memdep_199_ethash_search_aunroll_x_backStall) and SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_wireValid) or SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_fromReg0;
    SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_consumed1 <= (not (redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo_stall_out) and SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_wireValid) or SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_fromReg1;
    -- Consuming
    SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_StallValid <= SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_backStall and SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_wireValid;
    SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_toReg0 <= SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_StallValid and SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_consumed0;
    SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_toReg1 <= SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_StallValid and SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_or0 <= SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_consumed0;
    SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_wireStall <= not (SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_consumed1 and SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_or0);
    SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_backStall <= SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_V0 <= SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_wireValid and not (SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_fromReg0);
    SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_V1 <= SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_wireValid and not (SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_wireValid <= redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_valid_out;

    -- SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo(STALLENABLE,958)
    SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_fromReg0 <= (others => '0');
            SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_fromReg0 <= SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_toReg0;
            -- Succesor 1
            SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_fromReg1 <= SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_consumed0 <= (not (SE_in_i_store_memdep_199_ethash_search_aunroll_x_backStall) and SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_wireValid) or SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_fromReg0;
    SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_consumed1 <= (not (redist6_i_cmp23_xor_ethash_search_q_516_fifo_stall_out) and SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_wireValid) or SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_fromReg1;
    -- Consuming
    SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_StallValid <= SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_backStall and SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_wireValid;
    SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_toReg0 <= SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_StallValid and SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_consumed0;
    SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_toReg1 <= SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_StallValid and SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_or0 <= SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_consumed0;
    SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_wireStall <= not (SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_consumed1 and SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_or0);
    SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_backStall <= SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_V0 <= SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_wireValid and not (SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_fromReg0);
    SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_V1 <= SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_wireValid and not (SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_wireValid <= redist5_i_cmp23_xor_ethash_search_q_30_fifo_valid_out;

    -- SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo(STALLENABLE,970)
    SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_fromReg0 <= (others => '0');
            SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_fromReg0 <= SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_toReg0;
            -- Succesor 1
            SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_fromReg1 <= SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_consumed0 <= (not (redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo_stall_out) and SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_wireValid) or SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_fromReg0;
    SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_consumed1 <= (not (SE_in_i_store_memdep_199_ethash_search_aunroll_x_backStall) and SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_wireValid) or SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_fromReg1;
    -- Consuming
    SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_StallValid <= SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_backStall and SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_wireValid;
    SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_toReg0 <= SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_StallValid and SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_consumed0;
    SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_toReg1 <= SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_StallValid and SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_or0 <= SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_consumed0;
    SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_wireStall <= not (SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_consumed1 and SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_or0);
    SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_backStall <= SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_V0 <= SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_wireValid and not (SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_fromReg0);
    SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_V1 <= SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_wireValid and not (SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_wireValid <= redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_valid_out;

    -- SE_in_i_store_memdep_199_ethash_search_aunroll_x(STALLENABLE,806)
    -- Valid signal propagation
    SE_in_i_store_memdep_199_ethash_search_aunroll_x_V0 <= SE_in_i_store_memdep_199_ethash_search_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_in_i_store_memdep_199_ethash_search_aunroll_x_backStall <= i_store_memdep_199_ethash_search_aunroll_x_out_o_stall or not (SE_in_i_store_memdep_199_ethash_search_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_in_i_store_memdep_199_ethash_search_aunroll_x_and0 <= SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_V1;
    SE_in_i_store_memdep_199_ethash_search_aunroll_x_and1 <= SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_V0 and SE_in_i_store_memdep_199_ethash_search_aunroll_x_and0;
    SE_in_i_store_memdep_199_ethash_search_aunroll_x_and2 <= SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_V0 and SE_in_i_store_memdep_199_ethash_search_aunroll_x_and1;
    SE_in_i_store_memdep_199_ethash_search_aunroll_x_and3 <= SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_V0 and SE_in_i_store_memdep_199_ethash_search_aunroll_x_and2;
    SE_in_i_store_memdep_199_ethash_search_aunroll_x_wireValid <= SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_V0 and SE_in_i_store_memdep_199_ethash_search_aunroll_x_and3;

    -- SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo(STALLENABLE,948)
    SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_fromReg0 <= (others => '0');
            SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_fromReg0 <= SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_toReg0;
            -- Succesor 1
            SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_fromReg1 <= SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_consumed0 <= (not (SE_in_i_store_memdep_199_ethash_search_aunroll_x_backStall) and SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_wireValid) or SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_fromReg0;
    SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_consumed1 <= (not (redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_stall_out) and SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_wireValid) or SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_fromReg1;
    -- Consuming
    SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_StallValid <= SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_backStall and SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_wireValid;
    SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_toReg0 <= SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_StallValid and SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_consumed0;
    SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_toReg1 <= SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_StallValid and SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_or0 <= SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_consumed0;
    SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_wireStall <= not (SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_consumed1 and SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_or0);
    SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_backStall <= SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_V0 <= SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_wireValid and not (SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_fromReg0);
    SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_V1 <= SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_wireValid and not (SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_wireValid <= redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_valid_out;

    -- redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo(STALLFIFO,480)
    redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_valid_in <= SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_V1;
    redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_stall_in <= SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_backStall;
    redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_data_in <= bubble_select_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_b;
    redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_valid_in_bitsignaltemp <= redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_valid_in(0);
    redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_stall_in_bitsignaltemp <= redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_stall_in(0);
    redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_valid_out(0) <= redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_valid_out_bitsignaltemp;
    redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_stall_out(0) <= redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_stall_out_bitsignaltemp;
    theredist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 132,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_valid_in_bitsignaltemp,
        stall_in => redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_b,
        valid_out => redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_valid_out_bitsignaltemp,
        stall_out => redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_stall_out_bitsignaltemp,
        data_out => redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo(BITJOIN,584)
    bubble_join_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_q <= redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_data_out;

    -- bubble_select_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo(BITSELECT,585)
    bubble_select_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_q(63 downto 0));

    -- bubble_join_redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo(BITJOIN,608)
    bubble_join_redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_q <= redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_data_out;

    -- bubble_select_redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo(BITSELECT,609)
    bubble_select_redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_q(5 downto 0));

    -- i_arrayidx46_rm_ethash_search_vt_const_3(CONSTANT,174)
    i_arrayidx46_rm_ethash_search_vt_const_3_q <= "0000";

    -- i_arrayidx46_rm_ethash_search_vt_join(BITJOIN,176)@162
    i_arrayidx46_rm_ethash_search_vt_join_q <= i_arraydecay51_rm_ethash_search_vt_const_63_q & bubble_select_redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_b & i_arrayidx46_rm_ethash_search_vt_const_3_q;

    -- i_load_unnamed_ethash_search27_ethash_search_vunroll_x(BLACKBOX,125)@162
    -- in in_i_stall@20000000
    -- out out_o_readdata_0@194
    -- out out_o_readdata_1@194
    -- out out_o_readdata_2@194
    -- out out_o_readdata_3@194
    -- out out_o_stall@20000000
    -- out out_o_valid@194
    -- out out_unnamed_ethash_search27_avm_address@20000000
    -- out out_unnamed_ethash_search27_avm_burstcount@20000000
    -- out out_unnamed_ethash_search27_avm_byteenable@20000000
    -- out out_unnamed_ethash_search27_avm_enable@20000000
    -- out out_unnamed_ethash_search27_avm_read@20000000
    -- out out_unnamed_ethash_search27_avm_write@20000000
    -- out out_unnamed_ethash_search27_avm_writedata@20000000
    thei_load_unnamed_ethash_search27_ethash_search_vunroll_x : i_load_unnamed_ethash_search27_ethash_search237
    PORT MAP (
        in_flush => in_flush,
        in_i_address => i_arrayidx46_rm_ethash_search_vt_join_q,
        in_i_bitwiseor => bubble_select_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_b,
        in_i_dependence => bubble_select_i_sbar_unnamed_ethash_search29_ethash_search_b,
        in_i_predicate => GND_q,
        in_i_stall => SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_backStall,
        in_i_valid => SE_out_redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_V0,
        in_unnamed_ethash_search27_avm_readdata => in_unnamed_ethash_search27_avm_readdata,
        in_unnamed_ethash_search27_avm_readdatavalid => in_unnamed_ethash_search27_avm_readdatavalid,
        in_unnamed_ethash_search27_avm_waitrequest => in_unnamed_ethash_search27_avm_waitrequest,
        in_unnamed_ethash_search27_avm_writeack => in_unnamed_ethash_search27_avm_writeack,
        out_o_readdata_0 => i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0,
        out_o_readdata_1 => i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1,
        out_o_readdata_2 => i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2,
        out_o_readdata_3 => i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3,
        out_o_stall => i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_stall,
        out_o_valid => i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_valid,
        out_unnamed_ethash_search27_avm_address => i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_unnamed_ethash_search27_avm_address,
        out_unnamed_ethash_search27_avm_burstcount => i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_unnamed_ethash_search27_avm_burstcount,
        out_unnamed_ethash_search27_avm_byteenable => i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_unnamed_ethash_search27_avm_byteenable,
        out_unnamed_ethash_search27_avm_enable => i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_unnamed_ethash_search27_avm_enable,
        out_unnamed_ethash_search27_avm_read => i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_unnamed_ethash_search27_avm_read,
        out_unnamed_ethash_search27_avm_write => i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_unnamed_ethash_search27_avm_write,
        out_unnamed_ethash_search27_avm_writedata => i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_unnamed_ethash_search27_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo(STALLENABLE,950)
    SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_fromReg0 <= (others => '0');
            SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_fromReg0 <= SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_toReg0;
            -- Succesor 1
            SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_fromReg1 <= SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_consumed0 <= (not (SE_out_redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_backStall) and SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_wireValid) or SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_fromReg0;
    SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_consumed1 <= (not (redist2_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_323_fifo_stall_out) and SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_wireValid) or SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_fromReg1;
    -- Consuming
    SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_StallValid <= SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_backStall and SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_wireValid;
    SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_toReg0 <= SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_StallValid and SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_consumed0;
    SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_toReg1 <= SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_StallValid and SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_or0 <= SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_consumed0;
    SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_wireStall <= not (SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_consumed1 and SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_or0);
    SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_backStall <= SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_V0 <= SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_wireValid and not (SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_fromReg0);
    SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_V1 <= SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_wireValid and not (SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_wireValid <= redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_valid_out;

    -- SE_out_redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo(STALLENABLE,966)
    -- Valid signal propagation
    SE_out_redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_V0 <= SE_out_redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_backStall <= i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_stall or not (SE_out_redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_and0 <= redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_valid_out;
    SE_out_redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_and1 <= bubble_out_i_sbar_unnamed_ethash_search29_ethash_search_data_reg_valid_out and SE_out_redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_and0;
    SE_out_redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_wireValid <= SE_out_redist1_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_161_fifo_V0 and SE_out_redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_and1;

    -- bubble_out_i_sbar_unnamed_ethash_search29_ethash_search_data_reg(STALLFIFO,1377)
    bubble_out_i_sbar_unnamed_ethash_search29_ethash_search_data_reg_valid_in <= SE_out_i_sbar_unnamed_ethash_search29_ethash_search_V0;
    bubble_out_i_sbar_unnamed_ethash_search29_ethash_search_data_reg_stall_in <= SE_out_redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_backStall;
    bubble_out_i_sbar_unnamed_ethash_search29_ethash_search_data_reg_data_in <= bubble_join_i_sbar_unnamed_ethash_search29_ethash_search_q;
    bubble_out_i_sbar_unnamed_ethash_search29_ethash_search_data_reg_valid_in_bitsignaltemp <= bubble_out_i_sbar_unnamed_ethash_search29_ethash_search_data_reg_valid_in(0);
    bubble_out_i_sbar_unnamed_ethash_search29_ethash_search_data_reg_stall_in_bitsignaltemp <= bubble_out_i_sbar_unnamed_ethash_search29_ethash_search_data_reg_stall_in(0);
    bubble_out_i_sbar_unnamed_ethash_search29_ethash_search_data_reg_valid_out(0) <= bubble_out_i_sbar_unnamed_ethash_search29_ethash_search_data_reg_valid_out_bitsignaltemp;
    bubble_out_i_sbar_unnamed_ethash_search29_ethash_search_data_reg_stall_out(0) <= bubble_out_i_sbar_unnamed_ethash_search29_ethash_search_data_reg_stall_out_bitsignaltemp;
    thebubble_out_i_sbar_unnamed_ethash_search29_ethash_search_data_reg : acl_data_fifo
    GENERIC MAP (
        DEPTH => 3,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "zl_reg"
    )
    PORT MAP (
        valid_in => bubble_out_i_sbar_unnamed_ethash_search29_ethash_search_data_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_sbar_unnamed_ethash_search29_ethash_search_data_reg_stall_in_bitsignaltemp,
        data_in => bubble_join_i_sbar_unnamed_ethash_search29_ethash_search_q,
        valid_out => bubble_out_i_sbar_unnamed_ethash_search29_ethash_search_data_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_sbar_unnamed_ethash_search29_ethash_search_data_reg_stall_out_bitsignaltemp,
        data_out => bubble_out_i_sbar_unnamed_ethash_search29_ethash_search_data_reg_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_sbar_unnamed_ethash_search29_ethash_search(STALLENABLE,856)
    -- Valid signal propagation
    SE_out_i_sbar_unnamed_ethash_search29_ethash_search_V0 <= SE_out_i_sbar_unnamed_ethash_search29_ethash_search_wireValid;
    -- Backward Stall generation
    SE_out_i_sbar_unnamed_ethash_search29_ethash_search_backStall <= bubble_out_i_sbar_unnamed_ethash_search29_ethash_search_data_reg_stall_out or not (SE_out_i_sbar_unnamed_ethash_search29_ethash_search_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_sbar_unnamed_ethash_search29_ethash_search_wireValid <= i_sbar_unnamed_ethash_search29_ethash_search_out_valid_exit;

    -- bubble_join_i_store_memdep_200_ethash_search_aunroll_x(BITJOIN,555)
    bubble_join_i_store_memdep_200_ethash_search_aunroll_x_q <= i_store_memdep_200_ethash_search_aunroll_x_out_o_writeack;

    -- bubble_select_i_store_memdep_200_ethash_search_aunroll_x(BITSELECT,556)
    bubble_select_i_store_memdep_200_ethash_search_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_store_memdep_200_ethash_search_aunroll_x_q(0 downto 0));

    -- bubble_join_i_store_memdep_199_ethash_search_aunroll_x(BITJOIN,552)
    bubble_join_i_store_memdep_199_ethash_search_aunroll_x_q <= i_store_memdep_199_ethash_search_aunroll_x_out_o_writeack;

    -- bubble_select_i_store_memdep_199_ethash_search_aunroll_x(BITSELECT,553)
    bubble_select_i_store_memdep_199_ethash_search_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_store_memdep_199_ethash_search_aunroll_x_q(0 downto 0));

    -- i_barrier_dep201_ethash_search(LOGICAL,178)@32
    i_barrier_dep201_ethash_search_q <= bubble_select_i_store_memdep_199_ethash_search_aunroll_x_b or bubble_select_i_store_memdep_200_ethash_search_aunroll_x_b;

    -- bubble_join_redist8_i_barrier_dep_ethash_search_q_30_fifo(BITJOIN,605)
    bubble_join_redist8_i_barrier_dep_ethash_search_q_30_fifo_q <= redist8_i_barrier_dep_ethash_search_q_30_fifo_data_out;

    -- bubble_select_redist8_i_barrier_dep_ethash_search_q_30_fifo(BITSELECT,606)
    bubble_select_redist8_i_barrier_dep_ethash_search_q_30_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist8_i_barrier_dep_ethash_search_q_30_fifo_q(0 downto 0));

    -- i_barrier_dep202_ethash_search(LOGICAL,179)@32
    i_barrier_dep202_ethash_search_q <= bubble_select_redist8_i_barrier_dep_ethash_search_q_30_fifo_b or i_barrier_dep201_ethash_search_q;

    -- i_sbar_unnamed_ethash_search29_ethash_search(BLACKBOX,220)@32
    -- in in_stall_exit@20000000
    -- out out_data_exit@162
    -- out out_stall_entry@20000000
    -- out out_valid_exit@162
    thei_sbar_unnamed_ethash_search29_ethash_search : i_sbar_unnamed_ethash_search29_ethash_search234
    PORT MAP (
        in_data_entry => i_barrier_dep202_ethash_search_q,
        in_stall_exit => SE_out_i_sbar_unnamed_ethash_search29_ethash_search_backStall,
        in_valid_entry => SE_out_redist8_i_barrier_dep_ethash_search_q_30_fifo_V0,
        in_workgroup_size => in_barrier_unnamed_ethash_search29_wgs_workgroup_size,
        out_data_exit => i_sbar_unnamed_ethash_search29_ethash_search_out_data_exit,
        out_stall_entry => i_sbar_unnamed_ethash_search29_ethash_search_out_stall_entry,
        out_valid_exit => i_sbar_unnamed_ethash_search29_ethash_search_out_valid_exit,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_redist5_i_cmp23_xor_ethash_search_q_30_fifo(BITJOIN,596)
    bubble_join_redist5_i_cmp23_xor_ethash_search_q_30_fifo_q <= redist5_i_cmp23_xor_ethash_search_q_30_fifo_data_out;

    -- bubble_select_redist5_i_cmp23_xor_ethash_search_q_30_fifo(BITSELECT,597)
    bubble_select_redist5_i_cmp23_xor_ethash_search_q_30_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist5_i_cmp23_xor_ethash_search_q_30_fifo_q(0 downto 0));

    -- bubble_join_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo(BITJOIN,614)
    bubble_join_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_q <= redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_data_out;

    -- bubble_select_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo(BITSELECT,615)
    bubble_select_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_q(3 downto 0));

    -- i_arrayidx36_2_rm_ethash_search_vt_join(BITJOIN,160)@31
    i_arrayidx36_2_rm_ethash_search_vt_join_q <= i_arraydecay51_rm_ethash_search_vt_const_63_q & bubble_select_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_b & i_arrayidx36_2_rm_ethash_search_vt_const_5_q;

    -- i_memcoalesce_null_bitcast_03_rm_ethash_search_vt_select_9(BITSELECT,206)@31
    i_memcoalesce_null_bitcast_03_rm_ethash_search_vt_select_9_b <= i_arrayidx36_2_rm_ethash_search_vt_join_q(9 downto 6);

    -- i_arrayidx36_2_rm_ethash_search_vt_const_5(CONSTANT,158)
    i_arrayidx36_2_rm_ethash_search_vt_const_5_q <= "010000";

    -- i_memcoalesce_null_bitcast_03_rm_ethash_search_vt_join(BITJOIN,205)@31
    i_memcoalesce_null_bitcast_03_rm_ethash_search_vt_join_q <= i_arraydecay51_rm_ethash_search_vt_const_63_q & i_memcoalesce_null_bitcast_03_rm_ethash_search_vt_select_9_b & i_arrayidx36_2_rm_ethash_search_vt_const_5_q;

    -- bubble_join_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo(BITJOIN,746)
    bubble_join_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_q <= redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_data_out;

    -- bubble_select_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo(BITSELECT,747)
    bubble_select_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_q(63 downto 0));

    -- bubble_join_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo(BITJOIN,740)
    bubble_join_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_q <= redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_data_out;

    -- bubble_select_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo(BITSELECT,741)
    bubble_select_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_q(63 downto 0));

    -- i_store_memdep_199_ethash_search_aunroll_x(BLACKBOX,131)@31
    -- in in_i_stall@20000000
    -- out out_memdep_199_avm_address@20000000
    -- out out_memdep_199_avm_burstcount@20000000
    -- out out_memdep_199_avm_byteenable@20000000
    -- out out_memdep_199_avm_enable@20000000
    -- out out_memdep_199_avm_read@20000000
    -- out out_memdep_199_avm_write@20000000
    -- out out_memdep_199_avm_writedata@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@32
    -- out out_o_writeack@32
    thei_store_memdep_199_ethash_search_aunroll_x : i_store_memdep_199_ethash_search226
    PORT MAP (
        in_i_writedata_0 => bubble_select_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_b,
        in_i_writedata_1 => bubble_select_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_b,
        in_flush => in_flush,
        in_i_address => i_memcoalesce_null_bitcast_03_rm_ethash_search_vt_join_q,
        in_i_bitwiseor => bubble_select_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_b,
        in_i_predicate => bubble_select_redist5_i_cmp23_xor_ethash_search_q_30_fifo_b,
        in_i_stall => SE_out_redist8_i_barrier_dep_ethash_search_q_30_fifo_backStall,
        in_i_valid => SE_in_i_store_memdep_199_ethash_search_aunroll_x_V0,
        in_memdep_199_avm_readdata => in_memdep_199_avm_readdata,
        in_memdep_199_avm_readdatavalid => in_memdep_199_avm_readdatavalid,
        in_memdep_199_avm_waitrequest => in_memdep_199_avm_waitrequest,
        in_memdep_199_avm_writeack => in_memdep_199_avm_writeack,
        out_memdep_199_avm_address => i_store_memdep_199_ethash_search_aunroll_x_out_memdep_199_avm_address,
        out_memdep_199_avm_burstcount => i_store_memdep_199_ethash_search_aunroll_x_out_memdep_199_avm_burstcount,
        out_memdep_199_avm_byteenable => i_store_memdep_199_ethash_search_aunroll_x_out_memdep_199_avm_byteenable,
        out_memdep_199_avm_enable => i_store_memdep_199_ethash_search_aunroll_x_out_memdep_199_avm_enable,
        out_memdep_199_avm_read => i_store_memdep_199_ethash_search_aunroll_x_out_memdep_199_avm_read,
        out_memdep_199_avm_write => i_store_memdep_199_ethash_search_aunroll_x_out_memdep_199_avm_write,
        out_memdep_199_avm_writedata => i_store_memdep_199_ethash_search_aunroll_x_out_memdep_199_avm_writedata,
        out_o_stall => i_store_memdep_199_ethash_search_aunroll_x_out_o_stall,
        out_o_valid => i_store_memdep_199_ethash_search_aunroll_x_out_o_valid,
        out_o_writeack => i_store_memdep_199_ethash_search_aunroll_x_out_o_writeack,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_store_memdep_198_ethash_search_aunroll_x(BITJOIN,549)
    bubble_join_i_store_memdep_198_ethash_search_aunroll_x_q <= i_store_memdep_198_ethash_search_aunroll_x_out_o_writeack;

    -- bubble_select_i_store_memdep_198_ethash_search_aunroll_x(BITSELECT,550)
    bubble_select_i_store_memdep_198_ethash_search_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_store_memdep_198_ethash_search_aunroll_x_q(0 downto 0));

    -- bubble_join_i_store_memdep_ethash_search_aunroll_x(BITJOIN,558)
    bubble_join_i_store_memdep_ethash_search_aunroll_x_q <= i_store_memdep_ethash_search_aunroll_x_out_o_writeack;

    -- bubble_select_i_store_memdep_ethash_search_aunroll_x(BITSELECT,559)
    bubble_select_i_store_memdep_ethash_search_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_store_memdep_ethash_search_aunroll_x_q(0 downto 0));

    -- i_barrier_dep_ethash_search(LOGICAL,180)@2 + 1
    i_barrier_dep_ethash_search_qi <= bubble_select_i_store_memdep_ethash_search_aunroll_x_b or bubble_select_i_store_memdep_198_ethash_search_aunroll_x_b;
    i_barrier_dep_ethash_search_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_barrier_dep_ethash_search_qi, xout => i_barrier_dep_ethash_search_q, ena => SE_i_barrier_dep_ethash_search_backEN(0), clk => clock, aclr => resetn );

    -- SE_out_i_store_memdep_ethash_search_aunroll_x(STALLENABLE,811)
    -- Valid signal propagation
    SE_out_i_store_memdep_ethash_search_aunroll_x_V0 <= SE_out_i_store_memdep_ethash_search_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_store_memdep_ethash_search_aunroll_x_backStall <= SE_i_barrier_dep_ethash_search_backStall or not (SE_out_i_store_memdep_ethash_search_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_store_memdep_ethash_search_aunroll_x_wireValid <= i_store_memdep_ethash_search_aunroll_x_out_o_valid;

    -- SE_out_i_store_memdep_198_ethash_search_aunroll_x(STALLENABLE,805)
    -- Valid signal propagation
    SE_out_i_store_memdep_198_ethash_search_aunroll_x_V0 <= SE_out_i_store_memdep_198_ethash_search_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_store_memdep_198_ethash_search_aunroll_x_backStall <= SE_i_barrier_dep_ethash_search_backStall or not (SE_out_i_store_memdep_198_ethash_search_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_store_memdep_198_ethash_search_aunroll_x_wireValid <= i_store_memdep_198_ethash_search_aunroll_x_out_o_valid;

    -- SE_i_barrier_dep_ethash_search(STALLENABLE,833)
    -- Valid signal propagation
    SE_i_barrier_dep_ethash_search_V0 <= SE_i_barrier_dep_ethash_search_R_v_0;
    -- Stall signal propagation
    SE_i_barrier_dep_ethash_search_s_tv_0 <= redist8_i_barrier_dep_ethash_search_q_30_fifo_stall_out and SE_i_barrier_dep_ethash_search_R_v_0;
    -- Backward Enable generation
    SE_i_barrier_dep_ethash_search_backEN <= not (SE_i_barrier_dep_ethash_search_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_barrier_dep_ethash_search_and0 <= SE_out_i_store_memdep_198_ethash_search_aunroll_x_V0 and SE_i_barrier_dep_ethash_search_backEN;
    SE_i_barrier_dep_ethash_search_v_s_0 <= SE_out_i_store_memdep_ethash_search_aunroll_x_V0 and SE_i_barrier_dep_ethash_search_and0;
    -- Backward Stall generation
    SE_i_barrier_dep_ethash_search_backStall <= not (SE_i_barrier_dep_ethash_search_v_s_0);
    SE_i_barrier_dep_ethash_search_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_barrier_dep_ethash_search_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_barrier_dep_ethash_search_backEN = "0") THEN
                SE_i_barrier_dep_ethash_search_R_v_0 <= SE_i_barrier_dep_ethash_search_R_v_0 and SE_i_barrier_dep_ethash_search_s_tv_0;
            ELSE
                SE_i_barrier_dep_ethash_search_R_v_0 <= SE_i_barrier_dep_ethash_search_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- redist8_i_barrier_dep_ethash_search_q_30_fifo(STALLFIFO,487)
    redist8_i_barrier_dep_ethash_search_q_30_fifo_valid_in <= SE_i_barrier_dep_ethash_search_V0;
    redist8_i_barrier_dep_ethash_search_q_30_fifo_stall_in <= SE_out_redist8_i_barrier_dep_ethash_search_q_30_fifo_backStall;
    redist8_i_barrier_dep_ethash_search_q_30_fifo_data_in <= i_barrier_dep_ethash_search_q;
    redist8_i_barrier_dep_ethash_search_q_30_fifo_valid_in_bitsignaltemp <= redist8_i_barrier_dep_ethash_search_q_30_fifo_valid_in(0);
    redist8_i_barrier_dep_ethash_search_q_30_fifo_stall_in_bitsignaltemp <= redist8_i_barrier_dep_ethash_search_q_30_fifo_stall_in(0);
    redist8_i_barrier_dep_ethash_search_q_30_fifo_valid_out(0) <= redist8_i_barrier_dep_ethash_search_q_30_fifo_valid_out_bitsignaltemp;
    redist8_i_barrier_dep_ethash_search_q_30_fifo_stall_out(0) <= redist8_i_barrier_dep_ethash_search_q_30_fifo_stall_out_bitsignaltemp;
    theredist8_i_barrier_dep_ethash_search_q_30_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 30,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist8_i_barrier_dep_ethash_search_q_30_fifo_valid_in_bitsignaltemp,
        stall_in => redist8_i_barrier_dep_ethash_search_q_30_fifo_stall_in_bitsignaltemp,
        data_in => i_barrier_dep_ethash_search_q,
        valid_out => redist8_i_barrier_dep_ethash_search_q_30_fifo_valid_out_bitsignaltemp,
        stall_out => redist8_i_barrier_dep_ethash_search_q_30_fifo_stall_out_bitsignaltemp,
        data_out => redist8_i_barrier_dep_ethash_search_q_30_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist8_i_barrier_dep_ethash_search_q_30_fifo(STALLENABLE,964)
    -- Valid signal propagation
    SE_out_redist8_i_barrier_dep_ethash_search_q_30_fifo_V0 <= SE_out_redist8_i_barrier_dep_ethash_search_q_30_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist8_i_barrier_dep_ethash_search_q_30_fifo_backStall <= i_sbar_unnamed_ethash_search29_ethash_search_out_stall_entry or not (SE_out_redist8_i_barrier_dep_ethash_search_q_30_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist8_i_barrier_dep_ethash_search_q_30_fifo_and0 <= redist8_i_barrier_dep_ethash_search_q_30_fifo_valid_out;
    SE_out_redist8_i_barrier_dep_ethash_search_q_30_fifo_and1 <= i_store_memdep_200_ethash_search_aunroll_x_out_o_valid and SE_out_redist8_i_barrier_dep_ethash_search_q_30_fifo_and0;
    SE_out_redist8_i_barrier_dep_ethash_search_q_30_fifo_wireValid <= i_store_memdep_199_ethash_search_aunroll_x_out_o_valid and SE_out_redist8_i_barrier_dep_ethash_search_q_30_fifo_and1;

    -- i_and_rm_ethash_search_vt_const_31(CONSTANT,151)
    i_and_rm_ethash_search_vt_const_31_q <= "00000000000000000000000000000";

    -- c_i32_7gr(CONSTANT,141)
    c_i32_7gr_q <= "00000000000000000000000000000111";

    -- i_and_rm_ethash_search(LOGICAL,150)@1
    i_and_rm_ethash_search_q <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_mm and c_i32_7gr_q;

    -- i_and_rm_ethash_search_vt_select_2(BITSELECT,153)@1
    i_and_rm_ethash_search_vt_select_2_b <= i_and_rm_ethash_search_q(2 downto 0);

    -- i_and_rm_ethash_search_vt_join(BITJOIN,152)@1
    i_and_rm_ethash_search_vt_join_q <= i_and_rm_ethash_search_vt_const_31_q & i_and_rm_ethash_search_vt_select_2_b;

    -- i_cmp23_ethash_search(LOGICAL,181)@1
    i_cmp23_ethash_search_q <= "1" WHEN bubble_select_ethash_search_B3_merge_reg_aunroll_x_k = i_and_rm_ethash_search_vt_join_q ELSE "0";

    -- i_cmp23_xor_ethash_search(LOGICAL,182)@1
    i_cmp23_xor_ethash_search_q <= i_cmp23_ethash_search_q xor VCC_q;

    -- i_l_grpid_0_addr_zext_ethash_search_sel_x(BITSELECT,124)@1
    i_l_grpid_0_addr_zext_ethash_search_sel_x_b <= std_logic_vector(resize(unsigned(bubble_select_ethash_search_B3_merge_reg_aunroll_x_m(31 downto 0)), 64));

    -- i_l_grpid_0_addr_zext_ethash_search_vt_select_31(BITSELECT,195)@1
    i_l_grpid_0_addr_zext_ethash_search_vt_select_31_b <= i_l_grpid_0_addr_zext_ethash_search_sel_x_b(31 downto 0);

    -- i_l_grpid_0_addr_zext_ethash_search_vt_join(BITJOIN,194)@1
    i_l_grpid_0_addr_zext_ethash_search_vt_join_q <= c_i32_0gr_q & i_l_grpid_0_addr_zext_ethash_search_vt_select_31_b;

    -- i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_im3_shift0(BITSHIFT,403)@1
    i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_im3_shift0_qint <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_bs1_merged_bit_select_c & "000000";
    i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_im3_shift0_q <= i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_im3_shift0_qint(15 downto 0);

    -- i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_align_15(BITSHIFT,327)@1
    i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_im3_shift0_q) & "00000000000";
    i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_align_15_q <= i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_im6_shift0(BITSHIFT,404)@1
    i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_im6_shift0_qint <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_bs1_merged_bit_select_d & "000000";
    i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_im6_shift0_q <= i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_im6_shift0_qint(23 downto 0);

    -- i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_align_14(BITSHIFT,326)@1
    i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_align_14_q <= i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_align_14_qint(42 downto 0);

    -- i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_join_16(BITJOIN,328)@1
    i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_join_16_q <= i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_align_15_q & i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_align_14_q;

    -- i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_im9_shift0(BITSHIFT,405)@1
    i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_im9_shift0_qint <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_bs1_merged_bit_select_e & "000000";
    i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_im9_shift0_q <= i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_im9_shift0_qint(23 downto 0);

    -- i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_align_12(BITSHIFT,324)@1
    i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_im9_shift0_q) & "00000000000";
    i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_align_12_q <= i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_im0_shift0(BITSHIFT,402)@1
    i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_im0_shift0_qint <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_bs1_merged_bit_select_b & "000000";
    i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_im0_shift0_q <= i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_im0_shift0_qint(23 downto 0);

    -- i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_join_13(BITJOIN,325)@1
    i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_join_13_q <= i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_im0_shift0_q);

    -- i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_result_add_0_0(ADD,329)@1
    i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_join_13_q);
    i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_join_16_q);
    i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_result_add_0_0_b));
    i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_result_add_0_0_q <= i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_result_add_0_0_o(71 downto 0);

    -- i_arrayidx45_rm_ethash_search_ethash_search222_mult_extender_x(BITJOIN,95)@1
    i_arrayidx45_rm_ethash_search_ethash_search222_mult_extender_x_q <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_multconst_x_q & i_arrayidx45_rm_ethash_search_ethash_search222_mult_x_result_add_0_0_q(70 downto 0);

    -- i_arrayidx45_rm_ethash_search_ethash_search222_trunc_sel_x(BITSELECT,97)@1
    i_arrayidx45_rm_ethash_search_ethash_search222_trunc_sel_x_b <= i_arrayidx45_rm_ethash_search_ethash_search222_mult_extender_x_q(63 downto 0);

    -- i_arrayidx45_rm_ethash_search_ethash_search222_dupName_0_trunc_sel_x(BITSELECT,92)@1
    i_arrayidx45_rm_ethash_search_ethash_search222_dupName_0_trunc_sel_x_in <= STD_LOGIC_VECTOR("0" & i_arrayidx45_rm_ethash_search_ethash_search222_trunc_sel_x_b);
    i_arrayidx45_rm_ethash_search_ethash_search222_dupName_0_trunc_sel_x_b <= i_arrayidx45_rm_ethash_search_ethash_search222_dupName_0_trunc_sel_x_in(63 downto 0);

    -- i_arrayidx45_rm_ethash_search_vt_select_9(BITSELECT,173)@1
    i_arrayidx45_rm_ethash_search_vt_select_9_b <= i_arrayidx45_rm_ethash_search_ethash_search222_dupName_0_trunc_sel_x_b(9 downto 6);

    -- i_arrayidx45_rm_ethash_search_vt_join(BITJOIN,172)@1
    i_arrayidx45_rm_ethash_search_vt_join_q <= i_arraydecay51_rm_ethash_search_vt_const_63_q & i_arrayidx45_rm_ethash_search_vt_select_9_b & i_arraydecay51_rm_ethash_search_vt_const_5_q;

    -- i_memcoalesce_null_bitcast_0_rm_ethash_search_vt_select_9(BITSELECT,216)@1
    i_memcoalesce_null_bitcast_0_rm_ethash_search_vt_select_9_b <= i_arrayidx45_rm_ethash_search_vt_join_q(9 downto 6);

    -- i_memcoalesce_null_bitcast_0_rm_ethash_search_vt_join(BITJOIN,215)@1
    i_memcoalesce_null_bitcast_0_rm_ethash_search_vt_join_q <= i_arraydecay51_rm_ethash_search_vt_const_63_q & i_memcoalesce_null_bitcast_0_rm_ethash_search_vt_select_9_b & i_arraydecay51_rm_ethash_search_vt_const_5_q;

    -- i_store_memdep_200_ethash_search_aunroll_x(BLACKBOX,132)@1
    -- in in_i_stall@20000000
    -- out out_memdep_200_avm_address@20000000
    -- out out_memdep_200_avm_burstcount@20000000
    -- out out_memdep_200_avm_byteenable@20000000
    -- out out_memdep_200_avm_enable@20000000
    -- out out_memdep_200_avm_read@20000000
    -- out out_memdep_200_avm_write@20000000
    -- out out_memdep_200_avm_writedata@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@32
    -- out out_o_writeack@32
    thei_store_memdep_200_ethash_search_aunroll_x : i_store_memdep_200_ethash_search223
    PORT MAP (
        in_i_writedata_0 => bubble_select_ethash_search_B3_merge_reg_aunroll_x_hh,
        in_i_writedata_1 => bubble_select_ethash_search_B3_merge_reg_aunroll_x_ee,
        in_flush => in_flush,
        in_i_address => i_memcoalesce_null_bitcast_0_rm_ethash_search_vt_join_q,
        in_i_bitwiseor => i_l_grpid_0_addr_zext_ethash_search_vt_join_q,
        in_i_predicate => i_cmp23_xor_ethash_search_q,
        in_i_stall => SE_out_redist8_i_barrier_dep_ethash_search_q_30_fifo_backStall,
        in_i_valid => SE_out_ethash_search_B3_merge_reg_aunroll_x_V48,
        in_memdep_200_avm_readdata => in_memdep_200_avm_readdata,
        in_memdep_200_avm_readdatavalid => in_memdep_200_avm_readdatavalid,
        in_memdep_200_avm_waitrequest => in_memdep_200_avm_waitrequest,
        in_memdep_200_avm_writeack => in_memdep_200_avm_writeack,
        out_memdep_200_avm_address => i_store_memdep_200_ethash_search_aunroll_x_out_memdep_200_avm_address,
        out_memdep_200_avm_burstcount => i_store_memdep_200_ethash_search_aunroll_x_out_memdep_200_avm_burstcount,
        out_memdep_200_avm_byteenable => i_store_memdep_200_ethash_search_aunroll_x_out_memdep_200_avm_byteenable,
        out_memdep_200_avm_enable => i_store_memdep_200_ethash_search_aunroll_x_out_memdep_200_avm_enable,
        out_memdep_200_avm_read => i_store_memdep_200_ethash_search_aunroll_x_out_memdep_200_avm_read,
        out_memdep_200_avm_write => i_store_memdep_200_ethash_search_aunroll_x_out_memdep_200_avm_write,
        out_memdep_200_avm_writedata => i_store_memdep_200_ethash_search_aunroll_x_out_memdep_200_avm_writedata,
        out_o_stall => i_store_memdep_200_ethash_search_aunroll_x_out_o_stall,
        out_o_valid => i_store_memdep_200_ethash_search_aunroll_x_out_o_valid,
        out_o_writeack => i_store_memdep_200_ethash_search_aunroll_x_out_o_writeack,
        clock => clock,
        resetn => resetn
    );

    -- i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_multconst_x(CONSTANT,103)
    i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_multconst_x_q <= "00000000000000000000000000000000000000000000000000000000000";

    -- i_idxprom43_rm_ethash_search_vt_const_63(CONSTANT,185)
    i_idxprom43_rm_ethash_search_vt_const_63_q <= "00000000000000000000000000000000000000000000000000000000000000";

    -- i_and42_rm_ethash_search_vt_const_31(CONSTANT,147)
    i_and42_rm_ethash_search_vt_const_31_q <= "000000000000000000000000000000";

    -- c_i32_3gr(CONSTANT,140)
    c_i32_3gr_q <= "00000000000000000000000000000011";

    -- i_and42_rm_ethash_search(LOGICAL,146)@1
    i_and42_rm_ethash_search_q <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_mm and c_i32_3gr_q;

    -- i_and42_rm_ethash_search_vt_select_1(BITSELECT,149)@1
    i_and42_rm_ethash_search_vt_select_1_b <= i_and42_rm_ethash_search_q(1 downto 0);

    -- i_and42_rm_ethash_search_vt_join(BITJOIN,148)@1
    i_and42_rm_ethash_search_vt_join_q <= i_and42_rm_ethash_search_vt_const_31_q & i_and42_rm_ethash_search_vt_select_1_b;

    -- i_idxprom43_rm_ethash_search_sel_x(BITSELECT,122)@1
    i_idxprom43_rm_ethash_search_sel_x_b <= std_logic_vector(resize(unsigned(i_and42_rm_ethash_search_vt_join_q(31 downto 0)), 64));

    -- i_idxprom43_rm_ethash_search_vt_select_1(BITSELECT,187)@1
    i_idxprom43_rm_ethash_search_vt_select_1_b <= i_idxprom43_rm_ethash_search_sel_x_b(1 downto 0);

    -- i_idxprom43_rm_ethash_search_vt_join(BITJOIN,186)@1
    i_idxprom43_rm_ethash_search_vt_join_q <= i_idxprom43_rm_ethash_search_vt_const_63_q & i_idxprom43_rm_ethash_search_vt_select_1_b;

    -- i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_bs1_merged_bit_select(BITSELECT,414)@1
    i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_bs1_merged_bit_select_b <= i_idxprom43_rm_ethash_search_vt_join_q(17 downto 0);
    i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_bs1_merged_bit_select_c <= i_idxprom43_rm_ethash_search_vt_join_q(63 downto 54);
    i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_bs1_merged_bit_select_d <= i_idxprom43_rm_ethash_search_vt_join_q(35 downto 18);
    i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_bs1_merged_bit_select_e <= i_idxprom43_rm_ethash_search_vt_join_q(53 downto 36);

    -- i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_im3_shift0(BITSHIFT,407)@1
    i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_im3_shift0_qint <= i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_bs1_merged_bit_select_c & "0000";
    i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_im3_shift0_q <= i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_im3_shift0_qint(13 downto 0);

    -- i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_align_15(BITSHIFT,345)@1
    i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_im3_shift0_q) & "0000000000000";
    i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_align_15_q <= i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_im6_shift0(BITSHIFT,408)@1
    i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_im6_shift0_qint <= i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_bs1_merged_bit_select_d & "0000";
    i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_im6_shift0_q <= i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_im6_shift0_qint(21 downto 0);

    -- i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_align_14(BITSHIFT,344)@1
    i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_align_14_q <= i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_align_14_qint(40 downto 0);

    -- i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_join_16(BITJOIN,346)@1
    i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_join_16_q <= i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_align_15_q & i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_align_14_q;

    -- i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_im9_shift0(BITSHIFT,409)@1
    i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_im9_shift0_qint <= i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_bs1_merged_bit_select_e & "0000";
    i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_im9_shift0_q <= i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_im9_shift0_qint(21 downto 0);

    -- i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_align_12(BITSHIFT,342)@1
    i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_im9_shift0_q) & "0000000000000";
    i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_align_12_q <= i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_im0_shift0(BITSHIFT,406)@1
    i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_im0_shift0_qint <= i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_bs1_merged_bit_select_b & "0000";
    i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_im0_shift0_q <= i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_im0_shift0_qint(21 downto 0);

    -- i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_join_13(BITJOIN,343)@1
    i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_join_13_q <= i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_im0_shift0_q);

    -- i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_result_add_0_0(ADD,347)@1
    i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_join_13_q);
    i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_join_16_q);
    i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_result_add_0_0_b));
    i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_result_add_0_0_q <= i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_result_add_0_0_o(69 downto 0);

    -- i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_extender_x(BITJOIN,102)@1
    i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_extender_x_q <= i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_multconst_x_q & i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_x_result_add_0_0_q(68 downto 0);

    -- i_arrayidx46_rm_ethash_search_ethash_search236_dupName_1_trunc_sel_x(BITSELECT,105)@1
    i_arrayidx46_rm_ethash_search_ethash_search236_dupName_1_trunc_sel_x_b <= i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_mult_extender_x_q(63 downto 0);

    -- i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_im3_shift0(BITSHIFT,411)@1
    i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_im3_shift0_qint <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_bs1_merged_bit_select_c & "000000";
    i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_im3_shift0_q <= i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_im3_shift0_qint(15 downto 0);

    -- i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_align_15(BITSHIFT,363)@1
    i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_im3_shift0_q) & "00000000000";
    i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_align_15_q <= i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_im6_shift0(BITSHIFT,412)@1
    i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_im6_shift0_qint <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_bs1_merged_bit_select_d & "000000";
    i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_im6_shift0_q <= i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_im6_shift0_qint(23 downto 0);

    -- i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_align_14(BITSHIFT,362)@1
    i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_align_14_q <= i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_align_14_qint(42 downto 0);

    -- i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_join_16(BITJOIN,364)@1
    i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_join_16_q <= i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_align_15_q & i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_align_14_q;

    -- i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_im9_shift0(BITSHIFT,413)@1
    i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_im9_shift0_qint <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_bs1_merged_bit_select_e & "000000";
    i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_im9_shift0_q <= i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_im9_shift0_qint(23 downto 0);

    -- i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_align_12(BITSHIFT,360)@1
    i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_im9_shift0_q) & "00000000000";
    i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_align_12_q <= i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_im0_shift0(BITSHIFT,410)@1
    i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_im0_shift0_qint <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_bs1_merged_bit_select_b & "000000";
    i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_im0_shift0_q <= i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_im0_shift0_qint(23 downto 0);

    -- i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_join_13(BITJOIN,361)@1
    i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_join_13_q <= i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_im0_shift0_q);

    -- i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_result_add_0_0(ADD,365)@1
    i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_join_13_q);
    i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_join_16_q);
    i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_result_add_0_0_b));
    i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_result_add_0_0_q <= i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_result_add_0_0_o(71 downto 0);

    -- i_arrayidx46_rm_ethash_search_ethash_search236_mult_extender_x(BITJOIN,114)@1
    i_arrayidx46_rm_ethash_search_ethash_search236_mult_extender_x_q <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_multconst_x_q & i_arrayidx46_rm_ethash_search_ethash_search236_mult_x_result_add_0_0_q(70 downto 0);

    -- i_arrayidx46_rm_ethash_search_ethash_search236_trunc_sel_x(BITSELECT,116)@1
    i_arrayidx46_rm_ethash_search_ethash_search236_trunc_sel_x_b <= i_arrayidx46_rm_ethash_search_ethash_search236_mult_extender_x_q(63 downto 0);

    -- i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_trunc_sel_x(BITSELECT,104)@1
    i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_trunc_sel_x_in <= STD_LOGIC_VECTOR("0" & i_arrayidx46_rm_ethash_search_ethash_search236_trunc_sel_x_b);
    i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_trunc_sel_x_b <= i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_trunc_sel_x_in(63 downto 0);

    -- i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_add_x(ADD,109)@1
    i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_add_x_a <= STD_LOGIC_VECTOR("0" & i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_trunc_sel_x_b);
    i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_add_x_b <= STD_LOGIC_VECTOR("0" & i_arrayidx46_rm_ethash_search_ethash_search236_dupName_1_trunc_sel_x_b);
    i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_add_x_a) + UNSIGNED(i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_add_x_b));
    i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_add_x_q <= i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_add_x_o(64 downto 0);

    -- i_arrayidx46_rm_ethash_search_ethash_search236_dupName_2_trunc_sel_x(BITSELECT,106)@1
    i_arrayidx46_rm_ethash_search_ethash_search236_dupName_2_trunc_sel_x_b <= i_arrayidx46_rm_ethash_search_ethash_search236_dupName_0_add_x_q(63 downto 0);

    -- i_arrayidx46_rm_ethash_search_vt_select_9(BITSELECT,177)@1
    i_arrayidx46_rm_ethash_search_vt_select_9_b <= i_arrayidx46_rm_ethash_search_ethash_search236_dupName_2_trunc_sel_x_b(9 downto 4);

    -- redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo(STALLFIFO,488)
    redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V47;
    redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_stall_in <= SE_out_redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_backStall;
    redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_data_in <= i_arrayidx46_rm_ethash_search_vt_select_9_b;
    redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_valid_in_bitsignaltemp <= redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_valid_in(0);
    redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_stall_in_bitsignaltemp <= redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_stall_in(0);
    redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_valid_out(0) <= redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_valid_out_bitsignaltemp;
    redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_stall_out(0) <= redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_stall_out_bitsignaltemp;
    theredist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 162,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 6,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_valid_in_bitsignaltemp,
        stall_in => redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_stall_in_bitsignaltemp,
        data_in => i_arrayidx46_rm_ethash_search_vt_select_9_b,
        valid_out => redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_valid_out_bitsignaltemp,
        stall_out => redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_stall_out_bitsignaltemp,
        data_out => redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- i_arrayidx36_6_rm_ethash_search_ethash_search231_c_i64_48_x(CONSTANT,88)
    i_arrayidx36_6_rm_ethash_search_ethash_search231_c_i64_48_x_q <= "0000000000000000000000000000000000000000000000000000000000110000";

    -- i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_im3_shift0(BITSHIFT,399)@1
    i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_im3_shift0_qint <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_bs1_merged_bit_select_c & "000000";
    i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_im3_shift0_q <= i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_im3_shift0_qint(15 downto 0);

    -- i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_align_15(BITSHIFT,309)@1
    i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_im3_shift0_q) & "00000000000";
    i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_align_15_q <= i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_im6_shift0(BITSHIFT,400)@1
    i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_im6_shift0_qint <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_bs1_merged_bit_select_d & "000000";
    i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_im6_shift0_q <= i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_im6_shift0_qint(23 downto 0);

    -- i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_align_14(BITSHIFT,308)@1
    i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_align_14_q <= i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_align_14_qint(42 downto 0);

    -- i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_join_16(BITJOIN,310)@1
    i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_join_16_q <= i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_align_15_q & i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_align_14_q;

    -- i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_im9_shift0(BITSHIFT,401)@1
    i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_im9_shift0_qint <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_bs1_merged_bit_select_e & "000000";
    i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_im9_shift0_q <= i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_im9_shift0_qint(23 downto 0);

    -- i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_align_12(BITSHIFT,306)@1
    i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_im9_shift0_q) & "00000000000";
    i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_align_12_q <= i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_im0_shift0(BITSHIFT,398)@1
    i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_im0_shift0_qint <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_bs1_merged_bit_select_b & "000000";
    i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_im0_shift0_q <= i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_im0_shift0_qint(23 downto 0);

    -- i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_join_13(BITJOIN,307)@1
    i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_join_13_q <= i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_im0_shift0_q);

    -- i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_result_add_0_0(ADD,311)@1
    i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_join_13_q);
    i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_join_16_q);
    i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_result_add_0_0_b));
    i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_result_add_0_0_q <= i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_result_add_0_0_o(71 downto 0);

    -- i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_extender_x(BITJOIN,84)@1
    i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_extender_x_q <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_multconst_x_q & i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_x_result_add_0_0_q(70 downto 0);

    -- i_arrayidx36_6_rm_ethash_search_ethash_search231_trunc_sel_x(BITSELECT,86)@1
    i_arrayidx36_6_rm_ethash_search_ethash_search231_trunc_sel_x_b <= i_arrayidx36_6_rm_ethash_search_ethash_search231_mult_extender_x_q(63 downto 0);

    -- i_arrayidx36_6_rm_ethash_search_ethash_search231_dupName_0_trunc_sel_x(BITSELECT,78)@1
    i_arrayidx36_6_rm_ethash_search_ethash_search231_dupName_0_trunc_sel_x_in <= STD_LOGIC_VECTOR("0" & i_arrayidx36_6_rm_ethash_search_ethash_search231_trunc_sel_x_b);
    i_arrayidx36_6_rm_ethash_search_ethash_search231_dupName_0_trunc_sel_x_b <= i_arrayidx36_6_rm_ethash_search_ethash_search231_dupName_0_trunc_sel_x_in(63 downto 0);

    -- i_arrayidx36_6_rm_ethash_search_ethash_search231_dupName_0_add_x(ADD,81)@1
    i_arrayidx36_6_rm_ethash_search_ethash_search231_dupName_0_add_x_a <= STD_LOGIC_VECTOR("0" & i_arrayidx36_6_rm_ethash_search_ethash_search231_dupName_0_trunc_sel_x_b);
    i_arrayidx36_6_rm_ethash_search_ethash_search231_dupName_0_add_x_b <= STD_LOGIC_VECTOR("0" & i_arrayidx36_6_rm_ethash_search_ethash_search231_c_i64_48_x_q);
    i_arrayidx36_6_rm_ethash_search_ethash_search231_dupName_0_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx36_6_rm_ethash_search_ethash_search231_dupName_0_add_x_a) + UNSIGNED(i_arrayidx36_6_rm_ethash_search_ethash_search231_dupName_0_add_x_b));
    i_arrayidx36_6_rm_ethash_search_ethash_search231_dupName_0_add_x_q <= i_arrayidx36_6_rm_ethash_search_ethash_search231_dupName_0_add_x_o(64 downto 0);

    -- i_arrayidx36_6_rm_ethash_search_ethash_search231_dupName_1_trunc_sel_x(BITSELECT,79)@1
    i_arrayidx36_6_rm_ethash_search_ethash_search231_dupName_1_trunc_sel_x_b <= i_arrayidx36_6_rm_ethash_search_ethash_search231_dupName_0_add_x_q(63 downto 0);

    -- i_arrayidx36_6_rm_ethash_search_vt_select_9(BITSELECT,169)@1
    i_arrayidx36_6_rm_ethash_search_vt_select_9_b <= i_arrayidx36_6_rm_ethash_search_ethash_search231_dupName_1_trunc_sel_x_b(9 downto 6);

    -- i_arrayidx36_6_rm_ethash_search_vt_join(BITJOIN,168)@1
    i_arrayidx36_6_rm_ethash_search_vt_join_q <= i_arraydecay51_rm_ethash_search_vt_const_63_q & i_arrayidx36_6_rm_ethash_search_vt_select_9_b & i_arrayidx36_6_rm_ethash_search_vt_const_5_q;

    -- i_memcoalesce_null_bitcast_011_rm_ethash_search_vt_select_9(BITSELECT,201)@1
    i_memcoalesce_null_bitcast_011_rm_ethash_search_vt_select_9_b <= i_arrayidx36_6_rm_ethash_search_vt_join_q(9 downto 6);

    -- i_arrayidx36_6_rm_ethash_search_vt_const_5(CONSTANT,166)
    i_arrayidx36_6_rm_ethash_search_vt_const_5_q <= "110000";

    -- i_memcoalesce_null_bitcast_011_rm_ethash_search_vt_join(BITJOIN,200)@1
    i_memcoalesce_null_bitcast_011_rm_ethash_search_vt_join_q <= i_arraydecay51_rm_ethash_search_vt_const_63_q & i_memcoalesce_null_bitcast_011_rm_ethash_search_vt_select_9_b & i_arrayidx36_6_rm_ethash_search_vt_const_5_q;

    -- i_store_memdep_ethash_search_aunroll_x(BLACKBOX,133)@1
    -- in in_i_stall@20000000
    -- out out_memdep_avm_address@20000000
    -- out out_memdep_avm_burstcount@20000000
    -- out out_memdep_avm_byteenable@20000000
    -- out out_memdep_avm_enable@20000000
    -- out out_memdep_avm_read@20000000
    -- out out_memdep_avm_write@20000000
    -- out out_memdep_avm_writedata@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@2
    -- out out_o_writeack@2
    thei_store_memdep_ethash_search_aunroll_x : i_store_memdep_ethash_search232
    PORT MAP (
        in_i_writedata_0 => bubble_select_ethash_search_B3_merge_reg_aunroll_x_kk,
        in_i_writedata_1 => bubble_select_ethash_search_B3_merge_reg_aunroll_x_ll,
        in_flush => in_flush,
        in_i_address => i_memcoalesce_null_bitcast_011_rm_ethash_search_vt_join_q,
        in_i_bitwiseor => i_l_grpid_0_addr_zext_ethash_search_vt_join_q,
        in_i_predicate => i_cmp23_xor_ethash_search_q,
        in_i_stall => SE_out_i_store_memdep_ethash_search_aunroll_x_backStall,
        in_i_valid => SE_out_ethash_search_B3_merge_reg_aunroll_x_V46,
        in_memdep_avm_readdata => in_memdep_avm_readdata,
        in_memdep_avm_readdatavalid => in_memdep_avm_readdatavalid,
        in_memdep_avm_waitrequest => in_memdep_avm_waitrequest,
        in_memdep_avm_writeack => in_memdep_avm_writeack,
        out_memdep_avm_address => i_store_memdep_ethash_search_aunroll_x_out_memdep_avm_address,
        out_memdep_avm_burstcount => i_store_memdep_ethash_search_aunroll_x_out_memdep_avm_burstcount,
        out_memdep_avm_byteenable => i_store_memdep_ethash_search_aunroll_x_out_memdep_avm_byteenable,
        out_memdep_avm_enable => i_store_memdep_ethash_search_aunroll_x_out_memdep_avm_enable,
        out_memdep_avm_read => i_store_memdep_ethash_search_aunroll_x_out_memdep_avm_read,
        out_memdep_avm_write => i_store_memdep_ethash_search_aunroll_x_out_memdep_avm_write,
        out_memdep_avm_writedata => i_store_memdep_ethash_search_aunroll_x_out_memdep_avm_writedata,
        out_o_stall => i_store_memdep_ethash_search_aunroll_x_out_o_stall,
        out_o_valid => i_store_memdep_ethash_search_aunroll_x_out_o_valid,
        out_o_writeack => i_store_memdep_ethash_search_aunroll_x_out_o_writeack,
        clock => clock,
        resetn => resetn
    );

    -- i_arrayidx36_4_rm_ethash_search_ethash_search228_c_i64_32_x(CONSTANT,74)
    i_arrayidx36_4_rm_ethash_search_ethash_search228_c_i64_32_x_q <= "0000000000000000000000000000000000000000000000000000000000100000";

    -- i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_im3_shift0(BITSHIFT,395)@1
    i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_im3_shift0_qint <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_bs1_merged_bit_select_c & "000000";
    i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_im3_shift0_q <= i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_im3_shift0_qint(15 downto 0);

    -- i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_align_15(BITSHIFT,291)@1
    i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_im3_shift0_q) & "00000000000";
    i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_align_15_q <= i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_im6_shift0(BITSHIFT,396)@1
    i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_im6_shift0_qint <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_bs1_merged_bit_select_d & "000000";
    i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_im6_shift0_q <= i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_im6_shift0_qint(23 downto 0);

    -- i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_align_14(BITSHIFT,290)@1
    i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_align_14_q <= i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_align_14_qint(42 downto 0);

    -- i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_join_16(BITJOIN,292)@1
    i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_join_16_q <= i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_align_15_q & i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_align_14_q;

    -- i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_im9_shift0(BITSHIFT,397)@1
    i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_im9_shift0_qint <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_bs1_merged_bit_select_e & "000000";
    i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_im9_shift0_q <= i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_im9_shift0_qint(23 downto 0);

    -- i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_align_12(BITSHIFT,288)@1
    i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_im9_shift0_q) & "00000000000";
    i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_align_12_q <= i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_im0_shift0(BITSHIFT,394)@1
    i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_im0_shift0_qint <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_bs1_merged_bit_select_b & "000000";
    i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_im0_shift0_q <= i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_im0_shift0_qint(23 downto 0);

    -- i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_join_13(BITJOIN,289)@1
    i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_join_13_q <= i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_im0_shift0_q);

    -- i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_result_add_0_0(ADD,293)@1
    i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_join_13_q);
    i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_join_16_q);
    i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_result_add_0_0_b));
    i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_result_add_0_0_q <= i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_result_add_0_0_o(71 downto 0);

    -- i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_extender_x(BITJOIN,70)@1
    i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_extender_x_q <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_multconst_x_q & i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_x_result_add_0_0_q(70 downto 0);

    -- i_arrayidx36_4_rm_ethash_search_ethash_search228_trunc_sel_x(BITSELECT,72)@1
    i_arrayidx36_4_rm_ethash_search_ethash_search228_trunc_sel_x_b <= i_arrayidx36_4_rm_ethash_search_ethash_search228_mult_extender_x_q(63 downto 0);

    -- i_arrayidx36_4_rm_ethash_search_ethash_search228_dupName_0_trunc_sel_x(BITSELECT,64)@1
    i_arrayidx36_4_rm_ethash_search_ethash_search228_dupName_0_trunc_sel_x_in <= STD_LOGIC_VECTOR("0" & i_arrayidx36_4_rm_ethash_search_ethash_search228_trunc_sel_x_b);
    i_arrayidx36_4_rm_ethash_search_ethash_search228_dupName_0_trunc_sel_x_b <= i_arrayidx36_4_rm_ethash_search_ethash_search228_dupName_0_trunc_sel_x_in(63 downto 0);

    -- i_arrayidx36_4_rm_ethash_search_ethash_search228_dupName_0_add_x(ADD,67)@1
    i_arrayidx36_4_rm_ethash_search_ethash_search228_dupName_0_add_x_a <= STD_LOGIC_VECTOR("0" & i_arrayidx36_4_rm_ethash_search_ethash_search228_dupName_0_trunc_sel_x_b);
    i_arrayidx36_4_rm_ethash_search_ethash_search228_dupName_0_add_x_b <= STD_LOGIC_VECTOR("0" & i_arrayidx36_4_rm_ethash_search_ethash_search228_c_i64_32_x_q);
    i_arrayidx36_4_rm_ethash_search_ethash_search228_dupName_0_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx36_4_rm_ethash_search_ethash_search228_dupName_0_add_x_a) + UNSIGNED(i_arrayidx36_4_rm_ethash_search_ethash_search228_dupName_0_add_x_b));
    i_arrayidx36_4_rm_ethash_search_ethash_search228_dupName_0_add_x_q <= i_arrayidx36_4_rm_ethash_search_ethash_search228_dupName_0_add_x_o(64 downto 0);

    -- i_arrayidx36_4_rm_ethash_search_ethash_search228_dupName_1_trunc_sel_x(BITSELECT,65)@1
    i_arrayidx36_4_rm_ethash_search_ethash_search228_dupName_1_trunc_sel_x_b <= i_arrayidx36_4_rm_ethash_search_ethash_search228_dupName_0_add_x_q(63 downto 0);

    -- i_arrayidx36_4_rm_ethash_search_vt_select_9(BITSELECT,165)@1
    i_arrayidx36_4_rm_ethash_search_vt_select_9_b <= i_arrayidx36_4_rm_ethash_search_ethash_search228_dupName_1_trunc_sel_x_b(9 downto 6);

    -- i_arrayidx36_4_rm_ethash_search_vt_join(BITJOIN,164)@1
    i_arrayidx36_4_rm_ethash_search_vt_join_q <= i_arraydecay51_rm_ethash_search_vt_const_63_q & i_arrayidx36_4_rm_ethash_search_vt_select_9_b & i_arrayidx36_4_rm_ethash_search_vt_const_5_q;

    -- i_memcoalesce_null_bitcast_07_rm_ethash_search_vt_select_9(BITSELECT,211)@1
    i_memcoalesce_null_bitcast_07_rm_ethash_search_vt_select_9_b <= i_arrayidx36_4_rm_ethash_search_vt_join_q(9 downto 6);

    -- i_arrayidx36_4_rm_ethash_search_vt_const_5(CONSTANT,162)
    i_arrayidx36_4_rm_ethash_search_vt_const_5_q <= "100000";

    -- i_memcoalesce_null_bitcast_07_rm_ethash_search_vt_join(BITJOIN,210)@1
    i_memcoalesce_null_bitcast_07_rm_ethash_search_vt_join_q <= i_arraydecay51_rm_ethash_search_vt_const_63_q & i_memcoalesce_null_bitcast_07_rm_ethash_search_vt_select_9_b & i_arrayidx36_4_rm_ethash_search_vt_const_5_q;

    -- i_store_memdep_198_ethash_search_aunroll_x(BLACKBOX,130)@1
    -- in in_i_stall@20000000
    -- out out_memdep_198_avm_address@20000000
    -- out out_memdep_198_avm_burstcount@20000000
    -- out out_memdep_198_avm_byteenable@20000000
    -- out out_memdep_198_avm_enable@20000000
    -- out out_memdep_198_avm_read@20000000
    -- out out_memdep_198_avm_write@20000000
    -- out out_memdep_198_avm_writedata@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@2
    -- out out_o_writeack@2
    thei_store_memdep_198_ethash_search_aunroll_x : i_store_memdep_198_ethash_search229
    PORT MAP (
        in_i_writedata_0 => bubble_select_ethash_search_B3_merge_reg_aunroll_x_ii,
        in_i_writedata_1 => bubble_select_ethash_search_B3_merge_reg_aunroll_x_jj,
        in_flush => in_flush,
        in_i_address => i_memcoalesce_null_bitcast_07_rm_ethash_search_vt_join_q,
        in_i_bitwiseor => i_l_grpid_0_addr_zext_ethash_search_vt_join_q,
        in_i_predicate => i_cmp23_xor_ethash_search_q,
        in_i_stall => SE_out_i_store_memdep_198_ethash_search_aunroll_x_backStall,
        in_i_valid => SE_out_ethash_search_B3_merge_reg_aunroll_x_V45,
        in_memdep_198_avm_readdata => in_memdep_198_avm_readdata,
        in_memdep_198_avm_readdatavalid => in_memdep_198_avm_readdatavalid,
        in_memdep_198_avm_waitrequest => in_memdep_198_avm_waitrequest,
        in_memdep_198_avm_writeack => in_memdep_198_avm_writeack,
        out_memdep_198_avm_address => i_store_memdep_198_ethash_search_aunroll_x_out_memdep_198_avm_address,
        out_memdep_198_avm_burstcount => i_store_memdep_198_ethash_search_aunroll_x_out_memdep_198_avm_burstcount,
        out_memdep_198_avm_byteenable => i_store_memdep_198_ethash_search_aunroll_x_out_memdep_198_avm_byteenable,
        out_memdep_198_avm_enable => i_store_memdep_198_ethash_search_aunroll_x_out_memdep_198_avm_enable,
        out_memdep_198_avm_read => i_store_memdep_198_ethash_search_aunroll_x_out_memdep_198_avm_read,
        out_memdep_198_avm_write => i_store_memdep_198_ethash_search_aunroll_x_out_memdep_198_avm_write,
        out_memdep_198_avm_writedata => i_store_memdep_198_ethash_search_aunroll_x_out_memdep_198_avm_writedata,
        out_o_stall => i_store_memdep_198_ethash_search_aunroll_x_out_o_stall,
        out_o_valid => i_store_memdep_198_ethash_search_aunroll_x_out_o_valid,
        out_o_writeack => i_store_memdep_198_ethash_search_aunroll_x_out_o_writeack,
        clock => clock,
        resetn => resetn
    );

    -- i_arrayidx36_2_rm_ethash_search_ethash_search225_c_i64_16_x(CONSTANT,60)
    i_arrayidx36_2_rm_ethash_search_ethash_search225_c_i64_16_x_q <= "0000000000000000000000000000000000000000000000000000000000010000";

    -- i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_im3_shift0(BITSHIFT,391)@1
    i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_im3_shift0_qint <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_bs1_merged_bit_select_c & "000000";
    i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_im3_shift0_q <= i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_im3_shift0_qint(15 downto 0);

    -- i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_align_15(BITSHIFT,273)@1
    i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_im3_shift0_q) & "00000000000";
    i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_align_15_q <= i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_im6_shift0(BITSHIFT,392)@1
    i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_im6_shift0_qint <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_bs1_merged_bit_select_d & "000000";
    i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_im6_shift0_q <= i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_im6_shift0_qint(23 downto 0);

    -- i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_align_14(BITSHIFT,272)@1
    i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_align_14_q <= i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_align_14_qint(42 downto 0);

    -- i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_join_16(BITJOIN,274)@1
    i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_join_16_q <= i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_align_15_q & i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_align_14_q;

    -- i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_im9_shift0(BITSHIFT,393)@1
    i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_im9_shift0_qint <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_bs1_merged_bit_select_e & "000000";
    i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_im9_shift0_q <= i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_im9_shift0_qint(23 downto 0);

    -- i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_align_12(BITSHIFT,270)@1
    i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_im9_shift0_q) & "00000000000";
    i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_align_12_q <= i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_im0_shift0(BITSHIFT,390)@1
    i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_im0_shift0_qint <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_x_bs1_merged_bit_select_b & "000000";
    i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_im0_shift0_q <= i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_im0_shift0_qint(23 downto 0);

    -- i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_join_13(BITJOIN,271)@1
    i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_join_13_q <= i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_im0_shift0_q);

    -- i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_result_add_0_0(ADD,275)@1
    i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_join_13_q);
    i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_join_16_q);
    i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_result_add_0_0_b));
    i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_result_add_0_0_q <= i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_result_add_0_0_o(71 downto 0);

    -- i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_extender_x(BITJOIN,56)@1
    i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_extender_x_q <= i_arraydecay51_rm_ethash_search_ethash_search241_mult_multconst_x_q & i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_x_result_add_0_0_q(70 downto 0);

    -- i_arrayidx36_2_rm_ethash_search_ethash_search225_trunc_sel_x(BITSELECT,58)@1
    i_arrayidx36_2_rm_ethash_search_ethash_search225_trunc_sel_x_b <= i_arrayidx36_2_rm_ethash_search_ethash_search225_mult_extender_x_q(63 downto 0);

    -- i_arrayidx36_2_rm_ethash_search_ethash_search225_dupName_0_trunc_sel_x(BITSELECT,50)@1
    i_arrayidx36_2_rm_ethash_search_ethash_search225_dupName_0_trunc_sel_x_in <= STD_LOGIC_VECTOR("0" & i_arrayidx36_2_rm_ethash_search_ethash_search225_trunc_sel_x_b);
    i_arrayidx36_2_rm_ethash_search_ethash_search225_dupName_0_trunc_sel_x_b <= i_arrayidx36_2_rm_ethash_search_ethash_search225_dupName_0_trunc_sel_x_in(63 downto 0);

    -- i_arrayidx36_2_rm_ethash_search_ethash_search225_dupName_0_add_x(ADD,53)@1
    i_arrayidx36_2_rm_ethash_search_ethash_search225_dupName_0_add_x_a <= STD_LOGIC_VECTOR("0" & i_arrayidx36_2_rm_ethash_search_ethash_search225_dupName_0_trunc_sel_x_b);
    i_arrayidx36_2_rm_ethash_search_ethash_search225_dupName_0_add_x_b <= STD_LOGIC_VECTOR("0" & i_arrayidx36_2_rm_ethash_search_ethash_search225_c_i64_16_x_q);
    i_arrayidx36_2_rm_ethash_search_ethash_search225_dupName_0_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx36_2_rm_ethash_search_ethash_search225_dupName_0_add_x_a) + UNSIGNED(i_arrayidx36_2_rm_ethash_search_ethash_search225_dupName_0_add_x_b));
    i_arrayidx36_2_rm_ethash_search_ethash_search225_dupName_0_add_x_q <= i_arrayidx36_2_rm_ethash_search_ethash_search225_dupName_0_add_x_o(64 downto 0);

    -- i_arrayidx36_2_rm_ethash_search_ethash_search225_dupName_1_trunc_sel_x(BITSELECT,51)@1
    i_arrayidx36_2_rm_ethash_search_ethash_search225_dupName_1_trunc_sel_x_b <= i_arrayidx36_2_rm_ethash_search_ethash_search225_dupName_0_add_x_q(63 downto 0);

    -- i_arrayidx36_2_rm_ethash_search_vt_select_9(BITSELECT,161)@1
    i_arrayidx36_2_rm_ethash_search_vt_select_9_b <= i_arrayidx36_2_rm_ethash_search_ethash_search225_dupName_1_trunc_sel_x_b(9 downto 6);

    -- redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo(STALLFIFO,490)
    redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V43;
    redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_stall_in <= SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_backStall;
    redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_data_in <= i_arrayidx36_2_rm_ethash_search_vt_select_9_b;
    redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_valid_in_bitsignaltemp <= redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_valid_in(0);
    redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_stall_in_bitsignaltemp <= redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_stall_in(0);
    redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_valid_out(0) <= redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_valid_out_bitsignaltemp;
    redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_stall_out(0) <= redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_stall_out_bitsignaltemp;
    theredist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 31,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 4,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_valid_in_bitsignaltemp,
        stall_in => redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_stall_in_bitsignaltemp,
        data_in => i_arrayidx36_2_rm_ethash_search_vt_select_9_b,
        valid_out => redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_valid_out_bitsignaltemp,
        stall_out => redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_stall_out_bitsignaltemp,
        data_out => redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist5_i_cmp23_xor_ethash_search_q_30_fifo(STALLFIFO,484)
    redist5_i_cmp23_xor_ethash_search_q_30_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V41;
    redist5_i_cmp23_xor_ethash_search_q_30_fifo_stall_in <= SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_backStall;
    redist5_i_cmp23_xor_ethash_search_q_30_fifo_data_in <= i_cmp23_xor_ethash_search_q;
    redist5_i_cmp23_xor_ethash_search_q_30_fifo_valid_in_bitsignaltemp <= redist5_i_cmp23_xor_ethash_search_q_30_fifo_valid_in(0);
    redist5_i_cmp23_xor_ethash_search_q_30_fifo_stall_in_bitsignaltemp <= redist5_i_cmp23_xor_ethash_search_q_30_fifo_stall_in(0);
    redist5_i_cmp23_xor_ethash_search_q_30_fifo_valid_out(0) <= redist5_i_cmp23_xor_ethash_search_q_30_fifo_valid_out_bitsignaltemp;
    redist5_i_cmp23_xor_ethash_search_q_30_fifo_stall_out(0) <= redist5_i_cmp23_xor_ethash_search_q_30_fifo_stall_out_bitsignaltemp;
    theredist5_i_cmp23_xor_ethash_search_q_30_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 31,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist5_i_cmp23_xor_ethash_search_q_30_fifo_valid_in_bitsignaltemp,
        stall_in => redist5_i_cmp23_xor_ethash_search_q_30_fifo_stall_in_bitsignaltemp,
        data_in => i_cmp23_xor_ethash_search_q,
        valid_out => redist5_i_cmp23_xor_ethash_search_q_30_fifo_valid_out_bitsignaltemp,
        stall_out => redist5_i_cmp23_xor_ethash_search_q_30_fifo_stall_out_bitsignaltemp,
        data_out => redist5_i_cmp23_xor_ethash_search_q_30_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo(STALLFIFO,479)
    redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V39;
    redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_stall_in <= SE_out_redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_backStall;
    redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_data_in <= i_l_grpid_0_addr_zext_ethash_search_vt_join_q;
    redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_valid_in_bitsignaltemp <= redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_valid_in(0);
    redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_stall_in_bitsignaltemp <= redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_stall_in(0);
    redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_valid_out(0) <= redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_valid_out_bitsignaltemp;
    redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_stall_out(0) <= redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_stall_out_bitsignaltemp;
    theredist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 31,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_valid_in_bitsignaltemp,
        stall_in => redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_stall_in_bitsignaltemp,
        data_in => i_l_grpid_0_addr_zext_ethash_search_vt_join_q,
        valid_out => redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_valid_out_bitsignaltemp,
        stall_out => redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_stall_out_bitsignaltemp,
        data_out => redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist16_i_and_rm_ethash_search_vt_join_q_323_fifo(STALLFIFO,495)
    redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V38;
    redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_stall_in <= SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_backStall;
    redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_data_in <= i_and_rm_ethash_search_vt_join_q;
    redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_valid_in_bitsignaltemp <= redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_valid_in(0);
    redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_stall_in_bitsignaltemp <= redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_stall_in(0);
    redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_valid_out(0) <= redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_valid_out_bitsignaltemp;
    redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_stall_out(0) <= redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_stall_out_bitsignaltemp;
    theredist16_i_and_rm_ethash_search_vt_join_q_323_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 324,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_valid_in_bitsignaltemp,
        stall_in => redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_stall_in_bitsignaltemp,
        data_in => i_and_rm_ethash_search_vt_join_q,
        valid_out => redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_valid_out_bitsignaltemp,
        stall_out => redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_stall_out_bitsignaltemp,
        data_out => redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo(STALLFIFO,534)
    redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V31;
    redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_stall_in <= SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_backStall;
    redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_gg;
    redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_valid_in_bitsignaltemp <= redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_valid_in(0);
    redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_stall_in_bitsignaltemp <= redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_stall_in(0);
    redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_valid_out(0) <= redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_valid_out_bitsignaltemp;
    redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_stall_out(0) <= redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_stall_out_bitsignaltemp;
    theredist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 31,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_valid_in_bitsignaltemp,
        stall_in => redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_gg,
        valid_out => redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_valid_out_bitsignaltemp,
        stall_out => redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_stall_out_bitsignaltemp,
        data_out => redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo(STALLFIFO,532)
    redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V30;
    redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_stall_in <= SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_backStall;
    redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_ff;
    redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_valid_in_bitsignaltemp <= redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_valid_in(0);
    redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_stall_in_bitsignaltemp <= redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_stall_in(0);
    redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_valid_out(0) <= redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_valid_out_bitsignaltemp;
    redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_stall_out(0) <= redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_stall_out_bitsignaltemp;
    theredist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 31,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_valid_in_bitsignaltemp,
        stall_in => redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_ff,
        valid_out => redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_valid_out_bitsignaltemp,
        stall_out => redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_stall_out_bitsignaltemp,
        data_out => redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_ethash_search_B3_merge_reg_aunroll_x(STALLENABLE,770)
    SE_out_ethash_search_B3_merge_reg_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg0 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg1 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg2 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg3 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg4 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg5 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg6 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg7 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg8 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg9 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg10 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg11 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg12 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg13 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg14 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg15 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg16 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg17 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg18 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg19 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg20 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg21 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg22 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg23 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg24 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg25 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg26 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg27 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg28 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg29 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg30 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg31 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg32 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg33 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg34 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg35 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg36 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg37 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg38 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg39 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg40 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg41 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg42 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg43 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg44 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg45 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg46 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg47 <= (others => '0');
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg48 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg0 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg1 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg1;
            -- Succesor 2
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg2 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg2;
            -- Succesor 3
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg3 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg3;
            -- Succesor 4
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg4 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg4;
            -- Succesor 5
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg5 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg5;
            -- Succesor 6
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg6 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg6;
            -- Succesor 7
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg7 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg7;
            -- Succesor 8
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg8 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg8;
            -- Succesor 9
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg9 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg9;
            -- Succesor 10
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg10 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg10;
            -- Succesor 11
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg11 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg11;
            -- Succesor 12
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg12 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg12;
            -- Succesor 13
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg13 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg13;
            -- Succesor 14
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg14 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg14;
            -- Succesor 15
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg15 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg15;
            -- Succesor 16
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg16 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg16;
            -- Succesor 17
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg17 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg17;
            -- Succesor 18
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg18 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg18;
            -- Succesor 19
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg19 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg19;
            -- Succesor 20
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg20 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg20;
            -- Succesor 21
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg21 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg21;
            -- Succesor 22
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg22 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg22;
            -- Succesor 23
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg23 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg23;
            -- Succesor 24
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg24 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg24;
            -- Succesor 25
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg25 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg25;
            -- Succesor 26
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg26 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg26;
            -- Succesor 27
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg27 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg27;
            -- Succesor 28
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg28 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg28;
            -- Succesor 29
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg29 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg29;
            -- Succesor 30
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg30 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg30;
            -- Succesor 31
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg31 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg31;
            -- Succesor 32
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg32 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg32;
            -- Succesor 33
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg33 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg33;
            -- Succesor 34
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg34 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg34;
            -- Succesor 35
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg35 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg35;
            -- Succesor 36
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg36 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg36;
            -- Succesor 37
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg37 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg37;
            -- Succesor 38
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg38 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg38;
            -- Succesor 39
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg39 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg39;
            -- Succesor 40
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg40 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg40;
            -- Succesor 41
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg41 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg41;
            -- Succesor 42
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg42 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg42;
            -- Succesor 43
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg43 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg43;
            -- Succesor 44
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg44 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg44;
            -- Succesor 45
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg45 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg45;
            -- Succesor 46
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg46 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg46;
            -- Succesor 47
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg47 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg47;
            -- Succesor 48
            SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg48 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg48;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed0 <= (not (redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg0;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed1 <= (not (redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg1;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed2 <= (not (redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg2;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed3 <= (not (redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg3;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed4 <= (not (redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg4;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed5 <= (not (redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg5;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed6 <= (not (redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg6;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed7 <= (not (redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg7;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed8 <= (not (redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg8;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed9 <= (not (redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg9;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed10 <= (not (redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg10;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed11 <= (not (redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg11;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed12 <= (not (redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg12;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed13 <= (not (redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg13;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed14 <= (not (redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg14;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed15 <= (not (redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg15;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed16 <= (not (redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg16;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed17 <= (not (redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg17;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed18 <= (not (redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg18;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed19 <= (not (redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg19;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed20 <= (not (redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg20;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed21 <= (not (redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg21;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed22 <= (not (redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg22;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed23 <= (not (redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg23;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed24 <= (not (redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg24;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed25 <= (not (redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg25;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed26 <= (not (redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg26;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed27 <= (not (redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg27;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed28 <= (not (redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg28;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed29 <= (not (redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg29;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed30 <= (not (redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg30;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed31 <= (not (redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg31;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed32 <= (not (redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg32;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed33 <= (not (redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg33;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed34 <= (not (redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg34;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed35 <= (not (redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg35;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed36 <= (not (redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg36;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed37 <= (not (redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg37;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed38 <= (not (redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg38;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed39 <= (not (redist0_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_30_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg39;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed40 <= (not (redist7_i_cmp23_ethash_search_q_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg40;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed41 <= (not (redist5_i_cmp23_xor_ethash_search_q_30_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg41;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed42 <= (not (redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg42;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed43 <= (not (redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg43;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed44 <= (not (redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg44;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed45 <= (not (i_store_memdep_198_ethash_search_aunroll_x_out_o_stall) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg45;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed46 <= (not (i_store_memdep_ethash_search_aunroll_x_out_o_stall) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg46;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed47 <= (not (redist9_i_arrayidx46_rm_ethash_search_vt_select_9_b_161_fifo_stall_out) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg47;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed48 <= (not (i_store_memdep_200_ethash_search_aunroll_x_out_o_stall) and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg48;
    -- Consuming
    SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid <= SE_out_ethash_search_B3_merge_reg_aunroll_x_backStall and SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg0 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed0;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg1 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed1;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg2 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed2;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg3 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed3;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg4 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed4;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg5 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed5;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg6 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed6;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg7 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed7;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg8 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed8;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg9 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed9;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg10 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed10;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg11 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed11;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg12 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed12;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg13 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed13;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg14 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed14;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg15 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed15;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg16 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed16;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg17 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed17;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg18 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed18;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg19 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed19;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg20 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed20;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg21 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed21;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg22 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed22;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg23 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed23;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg24 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed24;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg25 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed25;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg26 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed26;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg27 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed27;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg28 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed28;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg29 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed29;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg30 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed30;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg31 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed31;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg32 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed32;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg33 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed33;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg34 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed34;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg35 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed35;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg36 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed36;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg37 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed37;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg38 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed38;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg39 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed39;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg40 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed40;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg41 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed41;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg42 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed42;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg43 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed43;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg44 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed44;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg45 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed45;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg46 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed46;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg47 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed47;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_toReg48 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed48;
    -- Backward Stall generation
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or0 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed0;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or1 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed1 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or0;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or2 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed2 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or1;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or3 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed3 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or2;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or4 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed4 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or3;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or5 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed5 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or4;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or6 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed6 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or5;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or7 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed7 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or6;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or8 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed8 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or7;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or9 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed9 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or8;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or10 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed10 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or9;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or11 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed11 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or10;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or12 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed12 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or11;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or13 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed13 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or12;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or14 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed14 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or13;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or15 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed15 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or14;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or16 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed16 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or15;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or17 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed17 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or16;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or18 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed18 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or17;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or19 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed19 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or18;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or20 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed20 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or19;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or21 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed21 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or20;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or22 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed22 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or21;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or23 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed23 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or22;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or24 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed24 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or23;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or25 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed25 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or24;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or26 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed26 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or25;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or27 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed27 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or26;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or28 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed28 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or27;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or29 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed29 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or28;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or30 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed30 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or29;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or31 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed31 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or30;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or32 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed32 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or31;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or33 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed33 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or32;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or34 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed34 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or33;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or35 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed35 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or34;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or36 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed36 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or35;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or37 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed37 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or36;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or38 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed38 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or37;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or39 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed39 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or38;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or40 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed40 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or39;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or41 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed41 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or40;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or42 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed42 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or41;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or43 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed43 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or42;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or44 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed44 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or43;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or45 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed45 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or44;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or46 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed46 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or45;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_or47 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed47 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or46;
    SE_out_ethash_search_B3_merge_reg_aunroll_x_wireStall <= not (SE_out_ethash_search_B3_merge_reg_aunroll_x_consumed48 and SE_out_ethash_search_B3_merge_reg_aunroll_x_or47);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_backStall <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V0 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg0);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V1 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg1);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V2 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg2);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V3 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg3);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V4 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg4);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V5 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg5);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V6 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg6);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V7 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg7);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V8 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg8);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V9 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg9);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V10 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg10);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V11 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg11);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V12 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg12);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V13 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg13);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V14 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg14);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V15 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg15);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V16 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg16);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V17 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg17);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V18 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg18);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V19 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg19);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V20 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg20);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V21 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg21);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V22 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg22);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V23 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg23);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V24 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg24);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V25 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg25);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V26 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg26);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V27 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg27);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V28 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg28);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V29 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg29);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V30 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg30);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V31 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg31);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V32 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg32);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V33 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg33);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V34 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg34);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V35 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg35);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V36 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg36);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V37 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg37);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V38 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg38);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V39 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg39);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V40 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg40);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V41 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg41);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V42 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg42);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V43 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg43);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V44 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg44);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V45 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg45);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V46 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg46);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V47 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg47);
    SE_out_ethash_search_B3_merge_reg_aunroll_x_V48 <= SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B3_merge_reg_aunroll_x_fromReg48);
    -- Computing multiple Valid(s)
    SE_out_ethash_search_B3_merge_reg_aunroll_x_wireValid <= ethash_search_B3_merge_reg_aunroll_x_out_valid_out;

    -- redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo(STALLFIFO,492)
    redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V42;
    redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_stall_in <= SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_backStall;
    redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_data_in <= i_arraydecay51_rm_ethash_search_vt_select_9_b;
    redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_valid_in_bitsignaltemp <= redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_valid_in(0);
    redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_stall_in_bitsignaltemp <= redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_stall_in(0);
    redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_valid_out(0) <= redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_valid_out_bitsignaltemp;
    redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_stall_out(0) <= redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_stall_out_bitsignaltemp;
    theredist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 324,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 4,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_valid_in_bitsignaltemp,
        stall_in => redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_stall_in_bitsignaltemp,
        data_in => i_arraydecay51_rm_ethash_search_vt_select_9_b,
        valid_out => redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_valid_out_bitsignaltemp,
        stall_out => redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_stall_out_bitsignaltemp,
        data_out => redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo(BITJOIN,620)
    bubble_join_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_q <= redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_data_out;

    -- bubble_select_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo(BITSELECT,621)
    bubble_select_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_q(3 downto 0));

    -- i_arraydecay51_rm_ethash_search_vt_const_5(CONSTANT,154)
    i_arraydecay51_rm_ethash_search_vt_const_5_q <= "000000";

    -- i_arraydecay51_rm_ethash_search_vt_join(BITJOIN,156)@324
    i_arraydecay51_rm_ethash_search_vt_join_q <= i_arraydecay51_rm_ethash_search_vt_const_63_q & bubble_select_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_b & i_arraydecay51_rm_ethash_search_vt_const_5_q;

    -- SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo(STALLENABLE,974)
    SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_fromReg0 <= (others => '0');
            SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_fromReg0 <= SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_toReg0;
            -- Succesor 1
            SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_fromReg1 <= SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_consumed0 <= (not (SE_out_bubble_out_i_sbar_unnamed_ethash_search30_ethash_search_data_backStall) and SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_wireValid) or SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_fromReg0;
    SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_consumed1 <= (not (redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_stall_out) and SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_wireValid) or SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_fromReg1;
    -- Consuming
    SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_StallValid <= SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_backStall and SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_wireValid;
    SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_toReg0 <= SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_StallValid and SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_consumed0;
    SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_toReg1 <= SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_StallValid and SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_or0 <= SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_consumed0;
    SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_wireStall <= not (SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_consumed1 and SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_or0);
    SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_backStall <= SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_V0 <= SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_wireValid and not (SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_fromReg0);
    SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_V1 <= SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_wireValid and not (SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_wireValid <= redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_valid_out;

    -- redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo(STALLFIFO,493)
    redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_valid_in <= SE_out_redist13_i_arraydecay51_rm_ethash_search_vt_select_9_b_323_fifo_V1;
    redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_stall_in <= SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_backStall;
    redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_data_in <= i_arraydecay51_rm_ethash_search_vt_join_q;
    redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_valid_in_bitsignaltemp <= redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_valid_in(0);
    redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_stall_in_bitsignaltemp <= redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_stall_in(0);
    redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_valid_out(0) <= redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_valid_out_bitsignaltemp;
    redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_stall_out(0) <= redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_stall_out_bitsignaltemp;
    theredist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 162,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_valid_in_bitsignaltemp,
        stall_in => redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_stall_in_bitsignaltemp,
        data_in => i_arraydecay51_rm_ethash_search_vt_join_q,
        valid_out => redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_valid_out_bitsignaltemp,
        stall_out => redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_stall_out_bitsignaltemp,
        data_out => redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo(STALLENABLE,976)
    SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_fromReg0 <= (others => '0');
            SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_fromReg0 <= SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_toReg0;
            -- Succesor 1
            SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_fromReg1 <= SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_consumed0 <= (not (SE_out_bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_backStall) and SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_wireValid) or SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_fromReg0;
    SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_consumed1 <= (not (redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo_stall_out) and SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_wireValid) or SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_fromReg1;
    -- Consuming
    SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_StallValid <= SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_backStall and SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_wireValid;
    SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_toReg0 <= SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_StallValid and SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_consumed0;
    SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_toReg1 <= SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_StallValid and SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_or0 <= SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_consumed0;
    SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_wireStall <= not (SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_consumed1 and SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_or0);
    SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_backStall <= SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_V0 <= SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_wireValid and not (SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_fromReg0);
    SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_V1 <= SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_wireValid and not (SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_wireValid <= redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_valid_out;

    -- SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo(STALLENABLE,954)
    SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_fromReg0 <= (others => '0');
            SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_fromReg0 <= SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_toReg0;
            -- Succesor 1
            SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_fromReg1 <= SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_consumed0 <= (not (SE_out_bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_backStall) and SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_wireValid) or SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_fromReg0;
    SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_consumed1 <= (not (redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo_stall_out) and SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_wireValid) or SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_fromReg1;
    -- Consuming
    SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_StallValid <= SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_backStall and SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_wireValid;
    SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_toReg0 <= SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_StallValid and SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_consumed0;
    SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_toReg1 <= SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_StallValid and SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_or0 <= SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_consumed0;
    SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_wireStall <= not (SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_consumed1 and SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_or0);
    SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_backStall <= SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_V0 <= SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_wireValid and not (SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_fromReg0);
    SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_V1 <= SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_wireValid and not (SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_wireValid <= redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_valid_out;

    -- bubble_join_i_sbar_unnamed_ethash_search31_ethash_search(BITJOIN,571)
    bubble_join_i_sbar_unnamed_ethash_search31_ethash_search_q <= i_sbar_unnamed_ethash_search31_ethash_search_out_data_exit;

    -- bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_reg(STALLFIFO,1379)
    bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_reg_valid_in <= SE_out_i_sbar_unnamed_ethash_search31_ethash_search_V0;
    bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_reg_stall_in <= SE_out_bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_backStall;
    bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_reg_data_in <= bubble_join_i_sbar_unnamed_ethash_search31_ethash_search_q;
    bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_reg_valid_in_bitsignaltemp <= bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_reg_valid_in(0);
    bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_reg_stall_in_bitsignaltemp <= bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_reg_stall_in(0);
    bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_reg_valid_out(0) <= bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_reg_valid_out_bitsignaltemp;
    bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_reg_stall_out(0) <= bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_reg_stall_out_bitsignaltemp;
    thebubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_reg : acl_data_fifo
    GENERIC MAP (
        DEPTH => 3,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "zl_reg"
    )
    PORT MAP (
        valid_in => bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_reg_stall_in_bitsignaltemp,
        data_in => bubble_join_i_sbar_unnamed_ethash_search31_ethash_search_q,
        valid_out => bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_reg_stall_out_bitsignaltemp,
        data_out => bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_reg_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data(STALLENABLE,1112)
    -- Valid signal propagation
    SE_out_bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_V0 <= SE_out_bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_backStall <= i_load_unnamed_ethash_search28_ethash_search_out_o_stall or not (SE_out_bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_and0 <= bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_reg_valid_out;
    SE_out_bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_and1 <= SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_V0 and SE_out_bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_and0;
    SE_out_bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_wireValid <= SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_V0 and SE_out_bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_and1;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- bubble_select_i_sbar_unnamed_ethash_search31_ethash_search(BITSELECT,572)
    bubble_select_i_sbar_unnamed_ethash_search31_ethash_search_b <= STD_LOGIC_VECTOR(bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_reg_data_out(0 downto 0));

    -- bubble_join_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo(BITJOIN,590)
    bubble_join_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_q <= redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_data_out;

    -- bubble_select_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo(BITSELECT,591)
    bubble_select_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_q(63 downto 0));

    -- bubble_join_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo(BITJOIN,623)
    bubble_join_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_q <= redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_data_out;

    -- bubble_select_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo(BITSELECT,624)
    bubble_select_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_q(63 downto 0));

    -- i_load_unnamed_ethash_search28_ethash_search(BLACKBOX,196)@485
    -- in in_i_stall@20000000
    -- out out_o_readdata@517
    -- out out_o_stall@20000000
    -- out out_o_valid@517
    -- out out_unnamed_ethash_search28_avm_address@20000000
    -- out out_unnamed_ethash_search28_avm_burstcount@20000000
    -- out out_unnamed_ethash_search28_avm_byteenable@20000000
    -- out out_unnamed_ethash_search28_avm_enable@20000000
    -- out out_unnamed_ethash_search28_avm_read@20000000
    -- out out_unnamed_ethash_search28_avm_write@20000000
    -- out out_unnamed_ethash_search28_avm_writedata@20000000
    thei_load_unnamed_ethash_search28_ethash_search : i_load_unnamed_ethash_search28_ethash_search247
    PORT MAP (
        in_flush => in_flush,
        in_i_address => bubble_select_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_b,
        in_i_bitwiseor => bubble_select_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_b,
        in_i_dependence => bubble_select_i_sbar_unnamed_ethash_search31_ethash_search_b,
        in_i_predicate => GND_q,
        in_i_stall => SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall,
        in_i_valid => SE_out_bubble_out_i_sbar_unnamed_ethash_search31_ethash_search_data_V0,
        in_unnamed_ethash_search28_avm_readdata => in_unnamed_ethash_search28_avm_readdata,
        in_unnamed_ethash_search28_avm_readdatavalid => in_unnamed_ethash_search28_avm_readdatavalid,
        in_unnamed_ethash_search28_avm_waitrequest => in_unnamed_ethash_search28_avm_waitrequest,
        in_unnamed_ethash_search28_avm_writeack => in_unnamed_ethash_search28_avm_writeack,
        out_o_readdata => i_load_unnamed_ethash_search28_ethash_search_out_o_readdata,
        out_o_stall => i_load_unnamed_ethash_search28_ethash_search_out_o_stall,
        out_o_valid => i_load_unnamed_ethash_search28_ethash_search_out_o_valid,
        out_unnamed_ethash_search28_avm_address => i_load_unnamed_ethash_search28_ethash_search_out_unnamed_ethash_search28_avm_address,
        out_unnamed_ethash_search28_avm_burstcount => i_load_unnamed_ethash_search28_ethash_search_out_unnamed_ethash_search28_avm_burstcount,
        out_unnamed_ethash_search28_avm_byteenable => i_load_unnamed_ethash_search28_ethash_search_out_unnamed_ethash_search28_avm_byteenable,
        out_unnamed_ethash_search28_avm_enable => i_load_unnamed_ethash_search28_ethash_search_out_unnamed_ethash_search28_avm_enable,
        out_unnamed_ethash_search28_avm_read => i_load_unnamed_ethash_search28_ethash_search_out_unnamed_ethash_search28_avm_read,
        out_unnamed_ethash_search28_avm_write => i_load_unnamed_ethash_search28_ethash_search_out_unnamed_ethash_search28_avm_write,
        out_unnamed_ethash_search28_avm_writedata => i_load_unnamed_ethash_search28_ethash_search_out_unnamed_ethash_search28_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo(STALLFIFO,483)
    redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo_valid_in <= SE_out_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_V1;
    redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo_data_in <= bubble_select_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_b;
    redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo_valid_in_bitsignaltemp <= redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo_valid_in(0);
    redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo_stall_in_bitsignaltemp <= redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo_stall_in(0);
    redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo_valid_out(0) <= redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo_valid_out_bitsignaltemp;
    redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo_stall_out(0) <= redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo_stall_out_bitsignaltemp;
    theredist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 33,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist3_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_484_fifo_b,
        valid_out => redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo_stall_out_bitsignaltemp,
        data_out => redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist6_i_cmp23_xor_ethash_search_q_516_fifo(STALLFIFO,485)
    redist6_i_cmp23_xor_ethash_search_q_516_fifo_valid_in <= SE_out_redist5_i_cmp23_xor_ethash_search_q_30_fifo_V1;
    redist6_i_cmp23_xor_ethash_search_q_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist6_i_cmp23_xor_ethash_search_q_516_fifo_data_in <= bubble_select_redist5_i_cmp23_xor_ethash_search_q_30_fifo_b;
    redist6_i_cmp23_xor_ethash_search_q_516_fifo_valid_in_bitsignaltemp <= redist6_i_cmp23_xor_ethash_search_q_516_fifo_valid_in(0);
    redist6_i_cmp23_xor_ethash_search_q_516_fifo_stall_in_bitsignaltemp <= redist6_i_cmp23_xor_ethash_search_q_516_fifo_stall_in(0);
    redist6_i_cmp23_xor_ethash_search_q_516_fifo_valid_out(0) <= redist6_i_cmp23_xor_ethash_search_q_516_fifo_valid_out_bitsignaltemp;
    redist6_i_cmp23_xor_ethash_search_q_516_fifo_stall_out(0) <= redist6_i_cmp23_xor_ethash_search_q_516_fifo_stall_out_bitsignaltemp;
    theredist6_i_cmp23_xor_ethash_search_q_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 487,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist6_i_cmp23_xor_ethash_search_q_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist6_i_cmp23_xor_ethash_search_q_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist5_i_cmp23_xor_ethash_search_q_30_fifo_b,
        valid_out => redist6_i_cmp23_xor_ethash_search_q_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist6_i_cmp23_xor_ethash_search_q_516_fifo_stall_out_bitsignaltemp,
        data_out => redist6_i_cmp23_xor_ethash_search_q_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist7_i_cmp23_ethash_search_q_516_fifo(STALLFIFO,486)
    redist7_i_cmp23_ethash_search_q_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V40;
    redist7_i_cmp23_ethash_search_q_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist7_i_cmp23_ethash_search_q_516_fifo_data_in <= i_cmp23_ethash_search_q;
    redist7_i_cmp23_ethash_search_q_516_fifo_valid_in_bitsignaltemp <= redist7_i_cmp23_ethash_search_q_516_fifo_valid_in(0);
    redist7_i_cmp23_ethash_search_q_516_fifo_stall_in_bitsignaltemp <= redist7_i_cmp23_ethash_search_q_516_fifo_stall_in(0);
    redist7_i_cmp23_ethash_search_q_516_fifo_valid_out(0) <= redist7_i_cmp23_ethash_search_q_516_fifo_valid_out_bitsignaltemp;
    redist7_i_cmp23_ethash_search_q_516_fifo_stall_out(0) <= redist7_i_cmp23_ethash_search_q_516_fifo_stall_out_bitsignaltemp;
    theredist7_i_cmp23_ethash_search_q_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist7_i_cmp23_ethash_search_q_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist7_i_cmp23_ethash_search_q_516_fifo_stall_in_bitsignaltemp,
        data_in => i_cmp23_ethash_search_q,
        valid_out => redist7_i_cmp23_ethash_search_q_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist7_i_cmp23_ethash_search_q_516_fifo_stall_out_bitsignaltemp,
        data_out => redist7_i_cmp23_ethash_search_q_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo(STALLFIFO,489)
    redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V44;
    redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo_data_in <= i_arrayidx45_rm_ethash_search_vt_join_q;
    redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo_valid_in_bitsignaltemp <= redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo_valid_in(0);
    redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo_stall_in_bitsignaltemp <= redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo_stall_in(0);
    redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo_valid_out(0) <= redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo_valid_out_bitsignaltemp;
    redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo_stall_out(0) <= redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo_stall_out_bitsignaltemp;
    theredist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo_stall_in_bitsignaltemp,
        data_in => i_arrayidx45_rm_ethash_search_vt_join_q,
        valid_out => redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo_stall_out_bitsignaltemp,
        data_out => redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo(STALLFIFO,491)
    redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo_valid_in <= SE_out_redist11_i_arrayidx36_2_rm_ethash_search_vt_select_9_b_30_fifo_V0;
    redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo_data_in <= i_arrayidx36_2_rm_ethash_search_vt_join_q;
    redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo_valid_in_bitsignaltemp <= redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo_valid_in(0);
    redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo_stall_in_bitsignaltemp <= redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo_stall_in(0);
    redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo_valid_out(0) <= redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo_valid_out_bitsignaltemp;
    redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo_stall_out(0) <= redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo_stall_out_bitsignaltemp;
    theredist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 487,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo_valid_in_bitsignaltemp,
        stall_in => redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo_stall_in_bitsignaltemp,
        data_in => i_arrayidx36_2_rm_ethash_search_vt_join_q,
        valid_out => redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo_valid_out_bitsignaltemp,
        stall_out => redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo_stall_out_bitsignaltemp,
        data_out => redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo(STALLFIFO,494)
    redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo_valid_in <= SE_out_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_V1;
    redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo_data_in <= bubble_select_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_b;
    redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo_valid_in_bitsignaltemp <= redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo_valid_in(0);
    redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo_stall_in_bitsignaltemp <= redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo_stall_in(0);
    redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo_valid_out(0) <= redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo_valid_out_bitsignaltemp;
    redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo_stall_out(0) <= redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo_stall_out_bitsignaltemp;
    theredist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 33,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo_valid_in_bitsignaltemp,
        stall_in => redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist14_i_arraydecay51_rm_ethash_search_vt_join_q_161_fifo_b,
        valid_out => redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo_valid_out_bitsignaltemp,
        stall_out => redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo_stall_out_bitsignaltemp,
        data_out => redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist17_i_and_rm_ethash_search_vt_join_q_516_fifo(STALLFIFO,496)
    redist17_i_and_rm_ethash_search_vt_join_q_516_fifo_valid_in <= SE_out_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_V1;
    redist17_i_and_rm_ethash_search_vt_join_q_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist17_i_and_rm_ethash_search_vt_join_q_516_fifo_data_in <= bubble_select_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_b;
    redist17_i_and_rm_ethash_search_vt_join_q_516_fifo_valid_in_bitsignaltemp <= redist17_i_and_rm_ethash_search_vt_join_q_516_fifo_valid_in(0);
    redist17_i_and_rm_ethash_search_vt_join_q_516_fifo_stall_in_bitsignaltemp <= redist17_i_and_rm_ethash_search_vt_join_q_516_fifo_stall_in(0);
    redist17_i_and_rm_ethash_search_vt_join_q_516_fifo_valid_out(0) <= redist17_i_and_rm_ethash_search_vt_join_q_516_fifo_valid_out_bitsignaltemp;
    redist17_i_and_rm_ethash_search_vt_join_q_516_fifo_stall_out(0) <= redist17_i_and_rm_ethash_search_vt_join_q_516_fifo_stall_out_bitsignaltemp;
    theredist17_i_and_rm_ethash_search_vt_join_q_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 194,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist17_i_and_rm_ethash_search_vt_join_q_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist17_i_and_rm_ethash_search_vt_join_q_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist16_i_and_rm_ethash_search_vt_join_q_323_fifo_b,
        valid_out => redist17_i_and_rm_ethash_search_vt_join_q_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist17_i_and_rm_ethash_search_vt_join_q_516_fifo_stall_out_bitsignaltemp,
        data_out => redist17_i_and_rm_ethash_search_vt_join_q_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo(STALLFIFO,498)
    redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo_valid_in <= SE_out_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_V1;
    redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo_data_in <= bubble_select_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_b;
    redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo_valid_in_bitsignaltemp <= redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo_valid_in(0);
    redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo_stall_in_bitsignaltemp <= redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo_stall_in(0);
    redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo_valid_out(0) <= redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo_valid_out_bitsignaltemp;
    redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo_stall_out(0) <= redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo_stall_out_bitsignaltemp;
    theredist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 194,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo_valid_in_bitsignaltemp,
        stall_in => redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist18_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_130_fifo_b,
        valid_out => redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo_valid_out_bitsignaltemp,
        stall_out => redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo_stall_out_bitsignaltemp,
        data_out => redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo(STALLFIFO,499)
    redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo_valid_in <= SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_V1;
    redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo_data_in <= bubble_select_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_c;
    redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo_valid_in_bitsignaltemp <= redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo_valid_in(0);
    redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo_stall_in_bitsignaltemp <= redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo_stall_in(0);
    redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo_valid_out(0) <= redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo_valid_out_bitsignaltemp;
    redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo_stall_out(0) <= redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo_stall_out_bitsignaltemp;
    theredist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 324,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo_valid_in_bitsignaltemp,
        stall_in => redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_c,
        valid_out => redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo_valid_out_bitsignaltemp,
        stall_out => redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo_stall_out_bitsignaltemp,
        data_out => redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo(STALLFIFO,500)
    redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo_valid_in <= SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_V2;
    redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo_data_in <= bubble_select_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_d;
    redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo_valid_in_bitsignaltemp <= redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo_valid_in(0);
    redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo_stall_in_bitsignaltemp <= redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo_stall_in(0);
    redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo_valid_out(0) <= redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo_valid_out_bitsignaltemp;
    redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo_stall_out(0) <= redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo_stall_out_bitsignaltemp;
    theredist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 324,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo_valid_in_bitsignaltemp,
        stall_in => redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_d,
        valid_out => redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo_valid_out_bitsignaltemp,
        stall_out => redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo_stall_out_bitsignaltemp,
        data_out => redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo(STALLFIFO,501)
    redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo_valid_in <= SE_out_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_V3;
    redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo_data_in <= bubble_select_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_e;
    redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo_valid_in_bitsignaltemp <= redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo_valid_in(0);
    redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo_stall_in_bitsignaltemp <= redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo_stall_in(0);
    redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo_valid_out(0) <= redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo_valid_out_bitsignaltemp;
    redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo_stall_out(0) <= redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo_stall_out_bitsignaltemp;
    theredist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 324,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo_valid_in_bitsignaltemp,
        stall_in => redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_e,
        valid_out => redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo_valid_out_bitsignaltemp,
        stall_out => redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo_stall_out_bitsignaltemp,
        data_out => redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo(STALLFIFO,502)
    redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V0;
    redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_b;
    redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo_valid_in_bitsignaltemp <= redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo_valid_in(0);
    redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo_stall_in_bitsignaltemp <= redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo_stall_in(0);
    redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo_valid_out(0) <= redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo_valid_out_bitsignaltemp;
    redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo_stall_out(0) <= redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo_stall_out_bitsignaltemp;
    theredist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 4,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_b,
        valid_out => redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo_stall_out_bitsignaltemp,
        data_out => redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo(STALLFIFO,503)
    redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V1;
    redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_c;
    redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo_valid_in_bitsignaltemp <= redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo_valid_in(0);
    redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo_stall_in_bitsignaltemp <= redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo_stall_in(0);
    redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo_valid_out(0) <= redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo_valid_out_bitsignaltemp;
    redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo_stall_out(0) <= redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo_stall_out_bitsignaltemp;
    theredist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_c,
        valid_out => redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo_stall_out_bitsignaltemp,
        data_out => redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo(STALLFIFO,504)
    redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V2;
    redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_d;
    redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo_valid_in_bitsignaltemp <= redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo_valid_in(0);
    redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo_stall_in_bitsignaltemp <= redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo_stall_in(0);
    redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo_valid_out(0) <= redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo_valid_out_bitsignaltemp;
    redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo_stall_out(0) <= redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo_stall_out_bitsignaltemp;
    theredist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_d,
        valid_out => redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo_stall_out_bitsignaltemp,
        data_out => redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo(STALLFIFO,505)
    redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V3;
    redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_e;
    redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo_valid_in_bitsignaltemp <= redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo_valid_in(0);
    redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo_stall_in_bitsignaltemp <= redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo_stall_in(0);
    redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo_valid_out(0) <= redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo_valid_out_bitsignaltemp;
    redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo_stall_out(0) <= redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo_stall_out_bitsignaltemp;
    theredist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_e,
        valid_out => redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo_stall_out_bitsignaltemp,
        data_out => redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo(STALLFIFO,506)
    redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V4;
    redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_f;
    redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo_valid_in_bitsignaltemp <= redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo_valid_in(0);
    redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo_stall_in_bitsignaltemp <= redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo_stall_in(0);
    redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo_valid_out(0) <= redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo_valid_out_bitsignaltemp;
    redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo_stall_out(0) <= redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo_stall_out_bitsignaltemp;
    theredist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_f,
        valid_out => redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo_stall_out_bitsignaltemp,
        data_out => redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo(STALLFIFO,507)
    redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V5;
    redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_g;
    redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo_valid_in_bitsignaltemp <= redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo_valid_in(0);
    redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo_stall_in_bitsignaltemp <= redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo_stall_in(0);
    redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo_valid_out(0) <= redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo_valid_out_bitsignaltemp;
    redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo_stall_out(0) <= redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo_stall_out_bitsignaltemp;
    theredist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_g,
        valid_out => redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo_stall_out_bitsignaltemp,
        data_out => redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo(STALLFIFO,508)
    redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V6;
    redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_h;
    redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo_valid_in_bitsignaltemp <= redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo_valid_in(0);
    redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo_stall_in_bitsignaltemp <= redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo_stall_in(0);
    redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo_valid_out(0) <= redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo_valid_out_bitsignaltemp;
    redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo_stall_out(0) <= redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo_stall_out_bitsignaltemp;
    theredist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_h,
        valid_out => redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo_stall_out_bitsignaltemp,
        data_out => redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo(STALLFIFO,509)
    redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V7;
    redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_i;
    redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo_valid_in_bitsignaltemp <= redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo_valid_in(0);
    redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo_stall_in_bitsignaltemp <= redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo_stall_in(0);
    redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo_valid_out(0) <= redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo_valid_out_bitsignaltemp;
    redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo_stall_out(0) <= redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo_stall_out_bitsignaltemp;
    theredist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_i,
        valid_out => redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo_stall_out_bitsignaltemp,
        data_out => redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo(STALLFIFO,510)
    redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V8;
    redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_j;
    redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo_valid_in_bitsignaltemp <= redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo_valid_in(0);
    redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo_stall_in_bitsignaltemp <= redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo_stall_in(0);
    redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo_valid_out(0) <= redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo_valid_out_bitsignaltemp;
    redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo_stall_out(0) <= redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo_stall_out_bitsignaltemp;
    theredist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_j,
        valid_out => redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo_stall_out_bitsignaltemp,
        data_out => redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo(STALLFIFO,511)
    redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V9;
    redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_k;
    redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo_valid_in_bitsignaltemp <= redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo_valid_in(0);
    redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo_stall_in_bitsignaltemp <= redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo_stall_in(0);
    redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo_valid_out(0) <= redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo_valid_out_bitsignaltemp;
    redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo_stall_out(0) <= redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo_stall_out_bitsignaltemp;
    theredist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_k,
        valid_out => redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo_stall_out_bitsignaltemp,
        data_out => redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo(STALLFIFO,512)
    redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V10;
    redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_l;
    redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo_valid_in_bitsignaltemp <= redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo_valid_in(0);
    redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo_stall_in_bitsignaltemp <= redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo_stall_in(0);
    redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo_valid_out(0) <= redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo_valid_out_bitsignaltemp;
    redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo_stall_out(0) <= redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo_stall_out_bitsignaltemp;
    theredist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_l,
        valid_out => redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo_stall_out_bitsignaltemp,
        data_out => redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo(STALLFIFO,513)
    redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V11;
    redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_m;
    redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo_valid_in_bitsignaltemp <= redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo_valid_in(0);
    redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo_stall_in_bitsignaltemp <= redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo_stall_in(0);
    redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo_valid_out(0) <= redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo_valid_out_bitsignaltemp;
    redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo_stall_out(0) <= redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo_stall_out_bitsignaltemp;
    theredist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_m,
        valid_out => redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo_stall_out_bitsignaltemp,
        data_out => redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo(STALLFIFO,514)
    redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V12;
    redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_n;
    redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo_valid_in_bitsignaltemp <= redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo_valid_in(0);
    redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo_stall_in_bitsignaltemp <= redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo_stall_in(0);
    redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo_valid_out(0) <= redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo_valid_out_bitsignaltemp;
    redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo_stall_out(0) <= redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo_stall_out_bitsignaltemp;
    theredist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_n,
        valid_out => redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo_stall_out_bitsignaltemp,
        data_out => redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo(STALLFIFO,515)
    redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V13;
    redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_o;
    redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo_valid_in_bitsignaltemp <= redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo_valid_in(0);
    redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo_stall_in_bitsignaltemp <= redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo_stall_in(0);
    redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo_valid_out(0) <= redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo_valid_out_bitsignaltemp;
    redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo_stall_out(0) <= redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo_stall_out_bitsignaltemp;
    theredist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_o,
        valid_out => redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo_stall_out_bitsignaltemp,
        data_out => redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo(STALLFIFO,516)
    redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V14;
    redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_p;
    redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo_valid_in_bitsignaltemp <= redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo_valid_in(0);
    redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo_stall_in_bitsignaltemp <= redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo_stall_in(0);
    redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo_valid_out(0) <= redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo_valid_out_bitsignaltemp;
    redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo_stall_out(0) <= redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo_stall_out_bitsignaltemp;
    theredist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_p,
        valid_out => redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo_stall_out_bitsignaltemp,
        data_out => redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo(STALLFIFO,517)
    redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V15;
    redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_q;
    redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo_valid_in_bitsignaltemp <= redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo_valid_in(0);
    redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo_stall_in_bitsignaltemp <= redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo_stall_in(0);
    redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo_valid_out(0) <= redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo_valid_out_bitsignaltemp;
    redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo_stall_out(0) <= redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo_stall_out_bitsignaltemp;
    theredist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_q,
        valid_out => redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo_stall_out_bitsignaltemp,
        data_out => redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo(STALLFIFO,518)
    redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V16;
    redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_r;
    redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo_valid_in_bitsignaltemp <= redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo_valid_in(0);
    redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo_stall_in_bitsignaltemp <= redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo_stall_in(0);
    redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo_valid_out(0) <= redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo_valid_out_bitsignaltemp;
    redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo_stall_out(0) <= redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo_stall_out_bitsignaltemp;
    theredist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_r,
        valid_out => redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo_stall_out_bitsignaltemp,
        data_out => redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo(STALLFIFO,519)
    redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V17;
    redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_s;
    redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo_valid_in_bitsignaltemp <= redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo_valid_in(0);
    redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo_stall_in_bitsignaltemp <= redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo_stall_in(0);
    redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo_valid_out(0) <= redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo_valid_out_bitsignaltemp;
    redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo_stall_out(0) <= redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo_stall_out_bitsignaltemp;
    theredist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_s,
        valid_out => redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo_stall_out_bitsignaltemp,
        data_out => redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo(STALLFIFO,520)
    redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V18;
    redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_t;
    redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo_valid_in_bitsignaltemp <= redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo_valid_in(0);
    redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo_stall_in_bitsignaltemp <= redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo_stall_in(0);
    redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo_valid_out(0) <= redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo_valid_out_bitsignaltemp;
    redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo_stall_out(0) <= redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo_stall_out_bitsignaltemp;
    theredist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_t,
        valid_out => redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo_stall_out_bitsignaltemp,
        data_out => redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo(STALLFIFO,521)
    redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V19;
    redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_u;
    redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo_valid_in_bitsignaltemp <= redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo_valid_in(0);
    redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo_stall_in_bitsignaltemp <= redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo_stall_in(0);
    redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo_valid_out(0) <= redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo_valid_out_bitsignaltemp;
    redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo_stall_out(0) <= redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo_stall_out_bitsignaltemp;
    theredist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_u,
        valid_out => redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo_stall_out_bitsignaltemp,
        data_out => redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo(STALLFIFO,522)
    redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V20;
    redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_v;
    redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo_valid_in_bitsignaltemp <= redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo_valid_in(0);
    redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo_stall_in_bitsignaltemp <= redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo_stall_in(0);
    redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo_valid_out(0) <= redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo_valid_out_bitsignaltemp;
    redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo_stall_out(0) <= redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo_stall_out_bitsignaltemp;
    theredist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_v,
        valid_out => redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo_stall_out_bitsignaltemp,
        data_out => redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo(STALLFIFO,523)
    redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V21;
    redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_w;
    redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo_valid_in_bitsignaltemp <= redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo_valid_in(0);
    redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo_stall_in_bitsignaltemp <= redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo_stall_in(0);
    redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo_valid_out(0) <= redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo_valid_out_bitsignaltemp;
    redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo_stall_out(0) <= redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo_stall_out_bitsignaltemp;
    theredist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_w,
        valid_out => redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo_stall_out_bitsignaltemp,
        data_out => redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo(STALLFIFO,524)
    redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V22;
    redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_x;
    redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo_valid_in_bitsignaltemp <= redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo_valid_in(0);
    redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo_stall_in_bitsignaltemp <= redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo_stall_in(0);
    redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo_valid_out(0) <= redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo_valid_out_bitsignaltemp;
    redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo_stall_out(0) <= redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo_stall_out_bitsignaltemp;
    theredist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_x,
        valid_out => redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo_stall_out_bitsignaltemp,
        data_out => redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo(STALLFIFO,525)
    redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V23;
    redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_y;
    redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo_valid_in_bitsignaltemp <= redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo_valid_in(0);
    redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo_stall_in_bitsignaltemp <= redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo_stall_in(0);
    redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo_valid_out(0) <= redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo_valid_out_bitsignaltemp;
    redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo_stall_out(0) <= redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo_stall_out_bitsignaltemp;
    theredist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_y,
        valid_out => redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo_stall_out_bitsignaltemp,
        data_out => redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo(STALLFIFO,526)
    redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V24;
    redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_z;
    redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo_valid_in_bitsignaltemp <= redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo_valid_in(0);
    redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo_stall_in_bitsignaltemp <= redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo_stall_in(0);
    redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo_valid_out(0) <= redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo_valid_out_bitsignaltemp;
    redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo_stall_out(0) <= redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo_stall_out_bitsignaltemp;
    theredist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_z,
        valid_out => redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo_stall_out_bitsignaltemp,
        data_out => redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo(STALLFIFO,527)
    redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V25;
    redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_aa;
    redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo_valid_in_bitsignaltemp <= redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo_valid_in(0);
    redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo_stall_in_bitsignaltemp <= redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo_stall_in(0);
    redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo_valid_out(0) <= redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo_valid_out_bitsignaltemp;
    redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo_stall_out(0) <= redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo_stall_out_bitsignaltemp;
    theredist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_aa,
        valid_out => redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo_stall_out_bitsignaltemp,
        data_out => redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo(STALLFIFO,528)
    redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V26;
    redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_bb;
    redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo_valid_in_bitsignaltemp <= redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo_valid_in(0);
    redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo_stall_in_bitsignaltemp <= redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo_stall_in(0);
    redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo_valid_out(0) <= redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo_valid_out_bitsignaltemp;
    redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo_stall_out(0) <= redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo_stall_out_bitsignaltemp;
    theredist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_bb,
        valid_out => redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo_stall_out_bitsignaltemp,
        data_out => redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo(STALLFIFO,529)
    redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V27;
    redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_cc;
    redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo_valid_in_bitsignaltemp <= redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo_valid_in(0);
    redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo_stall_in_bitsignaltemp <= redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo_stall_in(0);
    redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo_valid_out(0) <= redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo_valid_out_bitsignaltemp;
    redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo_stall_out(0) <= redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo_stall_out_bitsignaltemp;
    theredist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_cc,
        valid_out => redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo_stall_out_bitsignaltemp,
        data_out => redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo(STALLFIFO,530)
    redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V28;
    redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_dd;
    redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo_valid_in_bitsignaltemp <= redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo_valid_in(0);
    redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo_stall_in_bitsignaltemp <= redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo_stall_in(0);
    redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo_valid_out(0) <= redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo_valid_out_bitsignaltemp;
    redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo_stall_out(0) <= redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo_stall_out_bitsignaltemp;
    theredist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_dd,
        valid_out => redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo_stall_out_bitsignaltemp,
        data_out => redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo(STALLFIFO,531)
    redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V29;
    redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_ee;
    redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo_valid_in_bitsignaltemp <= redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo_valid_in(0);
    redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo_stall_in_bitsignaltemp <= redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo_stall_in(0);
    redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo_valid_out(0) <= redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo_valid_out_bitsignaltemp;
    redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo_stall_out(0) <= redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo_stall_out_bitsignaltemp;
    theredist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_ee,
        valid_out => redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo_stall_out_bitsignaltemp,
        data_out => redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo(STALLFIFO,533)
    redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo_valid_in <= SE_out_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_V1;
    redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo_data_in <= bubble_select_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_b;
    redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo_valid_in_bitsignaltemp <= redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo_valid_in(0);
    redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo_stall_in_bitsignaltemp <= redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo_stall_in(0);
    redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo_valid_out(0) <= redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo_valid_out_bitsignaltemp;
    redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo_stall_out(0) <= redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo_stall_out_bitsignaltemp;
    theredist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 487,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist53_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_30_fifo_b,
        valid_out => redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo_stall_out_bitsignaltemp,
        data_out => redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo(STALLFIFO,535)
    redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo_valid_in <= SE_out_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_V1;
    redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo_data_in <= bubble_select_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_b;
    redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo_valid_in_bitsignaltemp <= redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo_valid_in(0);
    redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo_stall_in_bitsignaltemp <= redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo_stall_in(0);
    redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo_valid_out(0) <= redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo_valid_out_bitsignaltemp;
    redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo_stall_out(0) <= redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo_stall_out_bitsignaltemp;
    theredist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 487,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist55_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_30_fifo_b,
        valid_out => redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo_stall_out_bitsignaltemp,
        data_out => redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo(STALLFIFO,536)
    redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V32;
    redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_hh;
    redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo_valid_in_bitsignaltemp <= redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo_valid_in(0);
    redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo_stall_in_bitsignaltemp <= redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo_stall_in(0);
    redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo_valid_out(0) <= redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo_valid_out_bitsignaltemp;
    redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo_stall_out(0) <= redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo_stall_out_bitsignaltemp;
    theredist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_hh,
        valid_out => redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo_stall_out_bitsignaltemp,
        data_out => redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo(STALLFIFO,537)
    redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V33;
    redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_ii;
    redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo_valid_in_bitsignaltemp <= redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo_valid_in(0);
    redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo_stall_in_bitsignaltemp <= redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo_stall_in(0);
    redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo_valid_out(0) <= redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo_valid_out_bitsignaltemp;
    redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo_stall_out(0) <= redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo_stall_out_bitsignaltemp;
    theredist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_ii,
        valid_out => redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo_stall_out_bitsignaltemp,
        data_out => redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo(STALLFIFO,538)
    redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V34;
    redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_jj;
    redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo_valid_in_bitsignaltemp <= redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo_valid_in(0);
    redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo_stall_in_bitsignaltemp <= redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo_stall_in(0);
    redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo_valid_out(0) <= redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo_valid_out_bitsignaltemp;
    redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo_stall_out(0) <= redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo_stall_out_bitsignaltemp;
    theredist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_jj,
        valid_out => redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo_stall_out_bitsignaltemp,
        data_out => redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo(STALLFIFO,539)
    redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V35;
    redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_kk;
    redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo_valid_in_bitsignaltemp <= redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo_valid_in(0);
    redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo_stall_in_bitsignaltemp <= redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo_stall_in(0);
    redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo_valid_out(0) <= redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo_valid_out_bitsignaltemp;
    redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo_stall_out(0) <= redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo_stall_out_bitsignaltemp;
    theredist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_kk,
        valid_out => redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo_stall_out_bitsignaltemp,
        data_out => redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo(STALLFIFO,540)
    redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V36;
    redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_ll;
    redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo_valid_in_bitsignaltemp <= redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo_valid_in(0);
    redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo_stall_in_bitsignaltemp <= redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo_stall_in(0);
    redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo_valid_out(0) <= redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo_valid_out_bitsignaltemp;
    redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo_stall_out(0) <= redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo_stall_out_bitsignaltemp;
    theredist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_ll,
        valid_out => redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo_stall_out_bitsignaltemp,
        data_out => redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo(STALLFIFO,541)
    redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_valid_in <= SE_out_ethash_search_B3_merge_reg_aunroll_x_V37;
    redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_stall_in <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall;
    redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_data_in <= bubble_select_ethash_search_B3_merge_reg_aunroll_x_mm;
    redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_valid_in_bitsignaltemp <= redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_valid_in(0);
    redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_stall_in_bitsignaltemp <= redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_stall_in(0);
    redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_valid_out(0) <= redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_valid_out_bitsignaltemp;
    redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_stall_out(0) <= redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_stall_out_bitsignaltemp;
    theredist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 517,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_valid_in_bitsignaltemp,
        stall_in => redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B3_merge_reg_aunroll_x_mm,
        valid_out => redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_valid_out_bitsignaltemp,
        stall_out => redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_stall_out_bitsignaltemp,
        data_out => redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo(STALLENABLE,1072)
    -- Valid signal propagation
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_V0 <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_backStall <= in_stall_in or not (SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and0 <= redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_valid_out;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and1 <= redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and0;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and2 <= redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and1;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and3 <= redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and2;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and4 <= redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and3;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and5 <= redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and4;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and6 <= redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and5;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and7 <= redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and6;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and8 <= redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and7;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and9 <= redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and8;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and10 <= redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and9;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and11 <= redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and10;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and12 <= redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and11;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and13 <= redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and12;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and14 <= redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and13;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and15 <= redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and14;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and16 <= redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and15;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and17 <= redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and16;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and18 <= redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and17;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and19 <= redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and18;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and20 <= redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and19;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and21 <= redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and20;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and22 <= redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and21;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and23 <= redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and22;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and24 <= redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and23;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and25 <= redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and24;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and26 <= redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and25;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and27 <= redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and26;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and28 <= redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and27;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and29 <= redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and28;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and30 <= redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and29;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and31 <= redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and30;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and32 <= redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and31;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and33 <= redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and32;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and34 <= redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and33;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and35 <= redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and34;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and36 <= redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and35;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and37 <= redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and36;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and38 <= redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and37;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and39 <= redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and38;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and40 <= redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and39;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and41 <= redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and40;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and42 <= redist17_i_and_rm_ethash_search_vt_join_q_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and41;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and43 <= redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and42;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and44 <= redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and43;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and45 <= redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and44;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and46 <= redist7_i_cmp23_ethash_search_q_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and45;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and47 <= redist6_i_cmp23_xor_ethash_search_q_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and46;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and48 <= redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo_valid_out and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and47;
    SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_wireValid <= i_load_unnamed_ethash_search28_ethash_search_out_o_valid and SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_and48;

    -- bubble_join_i_load_unnamed_ethash_search28_ethash_search(BITJOIN,561)
    bubble_join_i_load_unnamed_ethash_search28_ethash_search_q <= i_load_unnamed_ethash_search28_ethash_search_out_o_readdata;

    -- bubble_select_i_load_unnamed_ethash_search28_ethash_search(BITSELECT,562)
    bubble_select_i_load_unnamed_ethash_search28_ethash_search_b <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_ethash_search28_ethash_search_q(31 downto 0));

    -- bubble_join_redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo(BITJOIN,647)
    bubble_join_redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo_q <= redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo_data_out;

    -- bubble_select_redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo(BITSELECT,648)
    bubble_select_redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo_q(31 downto 0));

    -- bubble_join_redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo(BITJOIN,644)
    bubble_join_redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo_q <= redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo_data_out;

    -- bubble_select_redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo(BITSELECT,645)
    bubble_select_redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo_q(31 downto 0));

    -- bubble_join_redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo(BITJOIN,641)
    bubble_join_redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo_q <= redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo_data_out;

    -- bubble_select_redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo(BITSELECT,642)
    bubble_select_redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo_q(31 downto 0));

    -- bubble_join_redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo(BITJOIN,638)
    bubble_join_redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo_q <= redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo_data_out;

    -- bubble_select_redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo(BITSELECT,639)
    bubble_select_redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo_q(31 downto 0));

    -- bubble_join_redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo(BITJOIN,764)
    bubble_join_redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo_q <= redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo_data_out;

    -- bubble_select_redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo(BITSELECT,765)
    bubble_select_redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo_q(63 downto 0));

    -- bubble_join_redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo(BITJOIN,761)
    bubble_join_redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo_q <= redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo_data_out;

    -- bubble_select_redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo(BITSELECT,762)
    bubble_select_redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo_q(63 downto 0));

    -- bubble_join_redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo(BITJOIN,758)
    bubble_join_redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo_q <= redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo_data_out;

    -- bubble_select_redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo(BITSELECT,759)
    bubble_select_redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo_q(63 downto 0));

    -- bubble_join_redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo(BITJOIN,755)
    bubble_join_redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo_q <= redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo_data_out;

    -- bubble_select_redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo(BITSELECT,756)
    bubble_select_redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo_q(63 downto 0));

    -- bubble_join_redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo(BITJOIN,752)
    bubble_join_redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo_q <= redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo_data_out;

    -- bubble_select_redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo(BITSELECT,753)
    bubble_select_redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo_q(63 downto 0));

    -- bubble_join_redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo(BITJOIN,701)
    bubble_join_redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo_q <= redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo_data_out;

    -- bubble_select_redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo(BITSELECT,702)
    bubble_select_redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo_q(31 downto 0));

    -- bubble_join_redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo(BITJOIN,695)
    bubble_join_redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo_q <= redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo_data_out;

    -- bubble_select_redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo(BITSELECT,696)
    bubble_select_redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo_q(31 downto 0));

    -- bubble_join_redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo(BITJOIN,689)
    bubble_join_redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo_q <= redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo_data_out;

    -- bubble_select_redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo(BITSELECT,690)
    bubble_select_redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo_q(31 downto 0));

    -- bubble_join_redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo(BITJOIN,674)
    bubble_join_redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo_q <= redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo_data_out;

    -- bubble_select_redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo(BITSELECT,675)
    bubble_select_redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo_q(31 downto 0));

    -- bubble_join_redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo(BITJOIN,668)
    bubble_join_redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo_q <= redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo_data_out;

    -- bubble_select_redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo(BITSELECT,669)
    bubble_select_redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo_q(31 downto 0));

    -- bubble_join_redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo(BITJOIN,662)
    bubble_join_redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo_q <= redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo_data_out;

    -- bubble_select_redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo(BITSELECT,663)
    bubble_select_redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo_q(31 downto 0));

    -- bubble_join_redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo(BITJOIN,656)
    bubble_join_redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo_q <= redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo_data_out;

    -- bubble_select_redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo(BITSELECT,657)
    bubble_select_redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo_q(31 downto 0));

    -- bubble_join_redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo(BITJOIN,731)
    bubble_join_redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo_q <= redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo_data_out;

    -- bubble_select_redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo(BITSELECT,732)
    bubble_select_redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo_q(31 downto 0));

    -- bubble_join_redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo(BITJOIN,725)
    bubble_join_redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo_q <= redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo_data_out;

    -- bubble_select_redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo(BITSELECT,726)
    bubble_select_redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo_q(31 downto 0));

    -- bubble_join_redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo(BITJOIN,719)
    bubble_join_redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo_q <= redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo_data_out;

    -- bubble_select_redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo(BITSELECT,720)
    bubble_select_redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo_q(31 downto 0));

    -- bubble_join_redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo(BITJOIN,713)
    bubble_join_redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo_q <= redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo_data_out;

    -- bubble_select_redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo(BITSELECT,714)
    bubble_select_redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo_q(31 downto 0));

    -- bubble_join_redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo(BITJOIN,707)
    bubble_join_redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo_q <= redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo_data_out;

    -- bubble_select_redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo(BITSELECT,708)
    bubble_select_redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo_q(31 downto 0));

    -- bubble_join_redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo(BITJOIN,704)
    bubble_join_redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo_q <= redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo_data_out;

    -- bubble_select_redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo(BITSELECT,705)
    bubble_select_redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo_q(31 downto 0));

    -- bubble_join_redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo(BITJOIN,698)
    bubble_join_redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo_q <= redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo_data_out;

    -- bubble_select_redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo(BITSELECT,699)
    bubble_select_redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo_q(31 downto 0));

    -- bubble_join_redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo(BITJOIN,692)
    bubble_join_redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo_q <= redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo_data_out;

    -- bubble_select_redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo(BITSELECT,693)
    bubble_select_redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo_q(31 downto 0));

    -- bubble_join_redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo(BITJOIN,686)
    bubble_join_redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo_q <= redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo_data_out;

    -- bubble_select_redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo(BITSELECT,687)
    bubble_select_redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo_q(31 downto 0));

    -- bubble_join_redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo(BITJOIN,671)
    bubble_join_redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo_q <= redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo_data_out;

    -- bubble_select_redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo(BITSELECT,672)
    bubble_select_redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo_q(31 downto 0));

    -- bubble_join_redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo(BITJOIN,665)
    bubble_join_redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo_q <= redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo_data_out;

    -- bubble_select_redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo(BITSELECT,666)
    bubble_select_redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo_q(31 downto 0));

    -- bubble_join_redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo(BITJOIN,659)
    bubble_join_redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo_q <= redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo_data_out;

    -- bubble_select_redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo(BITSELECT,660)
    bubble_select_redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo_q(31 downto 0));

    -- bubble_join_redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo(BITJOIN,653)
    bubble_join_redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo_q <= redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo_data_out;

    -- bubble_select_redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo(BITSELECT,654)
    bubble_select_redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo_q(31 downto 0));

    -- bubble_join_redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo(BITJOIN,728)
    bubble_join_redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo_q <= redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo_data_out;

    -- bubble_select_redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo(BITSELECT,729)
    bubble_select_redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo_q(31 downto 0));

    -- bubble_join_redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo(BITJOIN,722)
    bubble_join_redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo_q <= redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo_data_out;

    -- bubble_select_redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo(BITSELECT,723)
    bubble_select_redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo_q(31 downto 0));

    -- bubble_join_redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo(BITJOIN,716)
    bubble_join_redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo_q <= redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo_data_out;

    -- bubble_select_redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo(BITSELECT,717)
    bubble_select_redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo_q(31 downto 0));

    -- bubble_join_redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo(BITJOIN,710)
    bubble_join_redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo_q <= redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo_data_out;

    -- bubble_select_redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo(BITSELECT,711)
    bubble_select_redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo_q(31 downto 0));

    -- bubble_join_redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo(BITJOIN,593)
    bubble_join_redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo_q <= redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo_data_out;

    -- bubble_select_redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo(BITSELECT,594)
    bubble_select_redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo_q(63 downto 0));

    -- bubble_join_redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo(BITJOIN,683)
    bubble_join_redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo_q <= redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo_data_out;

    -- bubble_select_redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo(BITSELECT,684)
    bubble_select_redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo_q(31 downto 0));

    -- bubble_join_redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo(BITJOIN,680)
    bubble_join_redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo_q <= redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo_data_out;

    -- bubble_select_redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo(BITSELECT,681)
    bubble_select_redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo_q(31 downto 0));

    -- bubble_join_redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo(BITJOIN,677)
    bubble_join_redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo_q <= redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo_data_out;

    -- bubble_select_redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo(BITSELECT,678)
    bubble_select_redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo_q(31 downto 0));

    -- bubble_join_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo(BITJOIN,767)
    bubble_join_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_q <= redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_data_out;

    -- bubble_select_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo(BITSELECT,768)
    bubble_select_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_q(31 downto 0));

    -- bubble_join_redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo(BITJOIN,650)
    bubble_join_redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo_q <= redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo_data_out;

    -- bubble_select_redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo(BITSELECT,651)
    bubble_select_redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo_q(3 downto 0));

    -- bubble_join_redist6_i_cmp23_xor_ethash_search_q_516_fifo(BITJOIN,599)
    bubble_join_redist6_i_cmp23_xor_ethash_search_q_516_fifo_q <= redist6_i_cmp23_xor_ethash_search_q_516_fifo_data_out;

    -- bubble_select_redist6_i_cmp23_xor_ethash_search_q_516_fifo(BITSELECT,600)
    bubble_select_redist6_i_cmp23_xor_ethash_search_q_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist6_i_cmp23_xor_ethash_search_q_516_fifo_q(0 downto 0));

    -- bubble_join_redist7_i_cmp23_ethash_search_q_516_fifo(BITJOIN,602)
    bubble_join_redist7_i_cmp23_ethash_search_q_516_fifo_q <= redist7_i_cmp23_ethash_search_q_516_fifo_data_out;

    -- bubble_select_redist7_i_cmp23_ethash_search_q_516_fifo(BITSELECT,603)
    bubble_select_redist7_i_cmp23_ethash_search_q_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist7_i_cmp23_ethash_search_q_516_fifo_q(0 downto 0));

    -- bubble_join_redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo(BITJOIN,749)
    bubble_join_redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo_q <= redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo_data_out;

    -- bubble_select_redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo(BITSELECT,750)
    bubble_select_redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo_q(63 downto 0));

    -- bubble_join_redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo(BITJOIN,743)
    bubble_join_redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo_q <= redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo_data_out;

    -- bubble_select_redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo(BITSELECT,744)
    bubble_select_redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo_q(63 downto 0));

    -- bubble_join_redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo(BITJOIN,737)
    bubble_join_redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo_q <= redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo_data_out;

    -- bubble_select_redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo(BITSELECT,738)
    bubble_select_redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo_q(63 downto 0));

    -- bubble_join_redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo(BITJOIN,734)
    bubble_join_redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo_q <= redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo_data_out;

    -- bubble_select_redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo(BITSELECT,735)
    bubble_select_redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo_q(0 downto 0));

    -- bubble_join_redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo(BITJOIN,611)
    bubble_join_redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo_q <= redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo_data_out;

    -- bubble_select_redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo(BITSELECT,612)
    bubble_select_redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo_q(63 downto 0));

    -- bubble_join_redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo(BITJOIN,617)
    bubble_join_redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo_q <= redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo_data_out;

    -- bubble_select_redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo(BITSELECT,618)
    bubble_select_redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo_q(63 downto 0));

    -- bubble_join_redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo(BITJOIN,626)
    bubble_join_redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo_q <= redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo_data_out;

    -- bubble_select_redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo(BITSELECT,627)
    bubble_select_redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo_q(63 downto 0));

    -- bubble_join_redist17_i_and_rm_ethash_search_vt_join_q_516_fifo(BITJOIN,632)
    bubble_join_redist17_i_and_rm_ethash_search_vt_join_q_516_fifo_q <= redist17_i_and_rm_ethash_search_vt_join_q_516_fifo_data_out;

    -- bubble_select_redist17_i_and_rm_ethash_search_vt_join_q_516_fifo(BITSELECT,633)
    bubble_select_redist17_i_and_rm_ethash_search_vt_join_q_516_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist17_i_and_rm_ethash_search_vt_join_q_516_fifo_q(31 downto 0));

    -- dupName_0_sync_out_vunroll_x(GPOUT,2)@517
    out_and_RM <= bubble_select_redist17_i_and_rm_ethash_search_vt_join_q_516_fifo_b;
    out_arraydecay51_RM <= bubble_select_redist15_i_arraydecay51_rm_ethash_search_vt_join_q_193_fifo_b;
    out_arrayidx36_2_RM <= bubble_select_redist12_i_arrayidx36_2_rm_ethash_search_vt_join_q_486_fifo_b;
    out_arrayidx45_RM <= bubble_select_redist10_i_arrayidx45_rm_ethash_search_vt_join_q_516_fifo_b;
    out_c0_exe1106 <= bubble_select_redist51_ethash_search_B3_merge_reg_aunroll_x_out_data_out_28_516_fifo_b;
    out_c0_exe2108 <= bubble_select_redist52_ethash_search_B3_merge_reg_aunroll_x_out_data_out_29_516_fifo_b;
    out_c0_exe3112 <= bubble_select_redist54_ethash_search_B3_merge_reg_aunroll_x_out_data_out_30_516_fifo_b;
    out_c0_exe4116 <= bubble_select_redist56_ethash_search_B3_merge_reg_aunroll_x_out_data_out_31_516_fifo_b;
    out_cmp23 <= bubble_select_redist7_i_cmp23_ethash_search_q_516_fifo_b;
    out_cmp23_xor <= bubble_select_redist6_i_cmp23_xor_ethash_search_q_516_fifo_b;
    out_fpgaindvars_iv12 <= bubble_select_redist23_ethash_search_B3_merge_reg_aunroll_x_out_data_out_0_516_fifo_b;
    out_global_id_0195 <= bubble_select_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_b;
    out_i18_0908 <= bubble_select_redist32_ethash_search_B3_merge_reg_aunroll_x_out_data_out_9_516_fifo_b;
    out_l_grpid_06 <= bubble_select_redist33_ethash_search_B3_merge_reg_aunroll_x_out_data_out_10_516_fifo_b;
    out_l_grpid_0_addr9 <= bubble_select_redist34_ethash_search_B3_merge_reg_aunroll_x_out_data_out_11_516_fifo_b;
    out_l_grpid_0_addr_zext <= bubble_select_redist4_i_l_grpid_0_addr_zext_ethash_search_vt_join_q_516_fifo_b;
    out_scalarizer_0100165 <= bubble_select_redist43_ethash_search_B3_merge_reg_aunroll_x_out_data_out_20_516_fifo_b;
    out_scalarizer_0100375 <= bubble_select_redist45_ethash_search_B3_merge_reg_aunroll_x_out_data_out_22_516_fifo_b;
    out_scalarizer_0100585 <= bubble_select_redist47_ethash_search_B3_merge_reg_aunroll_x_out_data_out_24_516_fifo_b;
    out_scalarizer_0100795 <= bubble_select_redist49_ethash_search_B3_merge_reg_aunroll_x_out_data_out_26_516_fifo_b;
    out_scalarizer_01173 <= bubble_select_redist24_ethash_search_B3_merge_reg_aunroll_x_out_data_out_1_516_fifo_b;
    out_scalarizer_01175 <= bubble_select_redist26_ethash_search_B3_merge_reg_aunroll_x_out_data_out_3_516_fifo_b;
    out_scalarizer_01177 <= bubble_select_redist28_ethash_search_B3_merge_reg_aunroll_x_out_data_out_5_516_fifo_b;
    out_scalarizer_01179 <= bubble_select_redist30_ethash_search_B3_merge_reg_aunroll_x_out_data_out_7_516_fifo_b;
    out_scalarizer_099325 <= bubble_select_redist35_ethash_search_B3_merge_reg_aunroll_x_out_data_out_12_516_fifo_b;
    out_scalarizer_099535 <= bubble_select_redist37_ethash_search_B3_merge_reg_aunroll_x_out_data_out_14_516_fifo_b;
    out_scalarizer_099745 <= bubble_select_redist39_ethash_search_B3_merge_reg_aunroll_x_out_data_out_16_516_fifo_b;
    out_scalarizer_099955 <= bubble_select_redist41_ethash_search_B3_merge_reg_aunroll_x_out_data_out_18_516_fifo_b;
    out_scalarizer_1100060 <= bubble_select_redist42_ethash_search_B3_merge_reg_aunroll_x_out_data_out_19_516_fifo_b;
    out_scalarizer_1100270 <= bubble_select_redist44_ethash_search_B3_merge_reg_aunroll_x_out_data_out_21_516_fifo_b;
    out_scalarizer_1100480 <= bubble_select_redist46_ethash_search_B3_merge_reg_aunroll_x_out_data_out_23_516_fifo_b;
    out_scalarizer_1100690 <= bubble_select_redist48_ethash_search_B3_merge_reg_aunroll_x_out_data_out_25_516_fifo_b;
    out_scalarizer_11008100 <= bubble_select_redist50_ethash_search_B3_merge_reg_aunroll_x_out_data_out_27_516_fifo_b;
    out_scalarizer_11174 <= bubble_select_redist25_ethash_search_B3_merge_reg_aunroll_x_out_data_out_2_516_fifo_b;
    out_scalarizer_11176 <= bubble_select_redist27_ethash_search_B3_merge_reg_aunroll_x_out_data_out_4_516_fifo_b;
    out_scalarizer_11178 <= bubble_select_redist29_ethash_search_B3_merge_reg_aunroll_x_out_data_out_6_516_fifo_b;
    out_scalarizer_11180 <= bubble_select_redist31_ethash_search_B3_merge_reg_aunroll_x_out_data_out_8_516_fifo_b;
    out_scalarizer_199430 <= bubble_select_redist36_ethash_search_B3_merge_reg_aunroll_x_out_data_out_13_516_fifo_b;
    out_scalarizer_199640 <= bubble_select_redist38_ethash_search_B3_merge_reg_aunroll_x_out_data_out_15_516_fifo_b;
    out_scalarizer_199850 <= bubble_select_redist40_ethash_search_B3_merge_reg_aunroll_x_out_data_out_17_516_fifo_b;
    out_state_0_0_cast120 <= bubble_select_redist57_ethash_search_B3_merge_reg_aunroll_x_out_data_out_32_516_fifo_b;
    out_state_4_0_cast123 <= bubble_select_redist58_ethash_search_B3_merge_reg_aunroll_x_out_data_out_33_516_fifo_b;
    out_state_5_0_cast126 <= bubble_select_redist59_ethash_search_B3_merge_reg_aunroll_x_out_data_out_34_516_fifo_b;
    out_state_6_0_cast129 <= bubble_select_redist60_ethash_search_B3_merge_reg_aunroll_x_out_data_out_35_516_fifo_b;
    out_state_7_0_cast132 <= bubble_select_redist61_ethash_search_B3_merge_reg_aunroll_x_out_data_out_36_516_fifo_b;
    out_unnamed_ethash_search27_0 <= bubble_select_redist19_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_0_323_fifo_b;
    out_unnamed_ethash_search27_1 <= bubble_select_redist20_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_1_323_fifo_b;
    out_unnamed_ethash_search27_2 <= bubble_select_redist21_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_2_323_fifo_b;
    out_unnamed_ethash_search27_3 <= bubble_select_redist22_i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_o_readdata_3_323_fifo_b;
    out_unnamed_ethash_search28 <= bubble_select_i_load_unnamed_ethash_search28_ethash_search_b;
    out_valid_out <= SE_out_redist62_ethash_search_B3_merge_reg_aunroll_x_out_data_out_37_516_fifo_V0;

    -- dupName_0_ext_sig_sync_out_x(GPOUT,4)
    out_memdep_199_avm_address <= i_store_memdep_199_ethash_search_aunroll_x_out_memdep_199_avm_address;
    out_memdep_199_avm_enable <= i_store_memdep_199_ethash_search_aunroll_x_out_memdep_199_avm_enable;
    out_memdep_199_avm_read <= i_store_memdep_199_ethash_search_aunroll_x_out_memdep_199_avm_read;
    out_memdep_199_avm_write <= i_store_memdep_199_ethash_search_aunroll_x_out_memdep_199_avm_write;
    out_memdep_199_avm_writedata <= i_store_memdep_199_ethash_search_aunroll_x_out_memdep_199_avm_writedata;
    out_memdep_199_avm_byteenable <= i_store_memdep_199_ethash_search_aunroll_x_out_memdep_199_avm_byteenable;
    out_memdep_199_avm_burstcount <= i_store_memdep_199_ethash_search_aunroll_x_out_memdep_199_avm_burstcount;

    -- dupName_1_ext_sig_sync_out_x(GPOUT,9)
    out_memdep_198_avm_address <= i_store_memdep_198_ethash_search_aunroll_x_out_memdep_198_avm_address;
    out_memdep_198_avm_enable <= i_store_memdep_198_ethash_search_aunroll_x_out_memdep_198_avm_enable;
    out_memdep_198_avm_read <= i_store_memdep_198_ethash_search_aunroll_x_out_memdep_198_avm_read;
    out_memdep_198_avm_write <= i_store_memdep_198_ethash_search_aunroll_x_out_memdep_198_avm_write;
    out_memdep_198_avm_writedata <= i_store_memdep_198_ethash_search_aunroll_x_out_memdep_198_avm_writedata;
    out_memdep_198_avm_byteenable <= i_store_memdep_198_ethash_search_aunroll_x_out_memdep_198_avm_byteenable;
    out_memdep_198_avm_burstcount <= i_store_memdep_198_ethash_search_aunroll_x_out_memdep_198_avm_burstcount;

    -- dupName_2_ext_sig_sync_out_x(GPOUT,13)
    out_memdep_avm_address <= i_store_memdep_ethash_search_aunroll_x_out_memdep_avm_address;
    out_memdep_avm_enable <= i_store_memdep_ethash_search_aunroll_x_out_memdep_avm_enable;
    out_memdep_avm_read <= i_store_memdep_ethash_search_aunroll_x_out_memdep_avm_read;
    out_memdep_avm_write <= i_store_memdep_ethash_search_aunroll_x_out_memdep_avm_write;
    out_memdep_avm_writedata <= i_store_memdep_ethash_search_aunroll_x_out_memdep_avm_writedata;
    out_memdep_avm_byteenable <= i_store_memdep_ethash_search_aunroll_x_out_memdep_avm_byteenable;
    out_memdep_avm_burstcount <= i_store_memdep_ethash_search_aunroll_x_out_memdep_avm_burstcount;

    -- dupName_3_ext_sig_sync_out_x(GPOUT,17)
    out_unnamed_ethash_search27_avm_address <= i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_unnamed_ethash_search27_avm_address;
    out_unnamed_ethash_search27_avm_enable <= i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_unnamed_ethash_search27_avm_enable;
    out_unnamed_ethash_search27_avm_read <= i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_unnamed_ethash_search27_avm_read;
    out_unnamed_ethash_search27_avm_write <= i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_unnamed_ethash_search27_avm_write;
    out_unnamed_ethash_search27_avm_writedata <= i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_unnamed_ethash_search27_avm_writedata;
    out_unnamed_ethash_search27_avm_byteenable <= i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_unnamed_ethash_search27_avm_byteenable;
    out_unnamed_ethash_search27_avm_burstcount <= i_load_unnamed_ethash_search27_ethash_search_vunroll_x_out_unnamed_ethash_search27_avm_burstcount;

    -- dupName_4_ext_sig_sync_out_x(GPOUT,21)
    out_memdep_203_avm_address <= i_store_memdep_203_ethash_search_out_memdep_203_avm_address;
    out_memdep_203_avm_enable <= i_store_memdep_203_ethash_search_out_memdep_203_avm_enable;
    out_memdep_203_avm_read <= i_store_memdep_203_ethash_search_out_memdep_203_avm_read;
    out_memdep_203_avm_write <= i_store_memdep_203_ethash_search_out_memdep_203_avm_write;
    out_memdep_203_avm_writedata <= i_store_memdep_203_ethash_search_out_memdep_203_avm_writedata;
    out_memdep_203_avm_byteenable <= i_store_memdep_203_ethash_search_out_memdep_203_avm_byteenable;
    out_memdep_203_avm_burstcount <= i_store_memdep_203_ethash_search_out_memdep_203_avm_burstcount;

    -- dupName_5_ext_sig_sync_out_x(GPOUT,25)
    out_unnamed_ethash_search28_avm_address <= i_load_unnamed_ethash_search28_ethash_search_out_unnamed_ethash_search28_avm_address;
    out_unnamed_ethash_search28_avm_enable <= i_load_unnamed_ethash_search28_ethash_search_out_unnamed_ethash_search28_avm_enable;
    out_unnamed_ethash_search28_avm_read <= i_load_unnamed_ethash_search28_ethash_search_out_unnamed_ethash_search28_avm_read;
    out_unnamed_ethash_search28_avm_write <= i_load_unnamed_ethash_search28_ethash_search_out_unnamed_ethash_search28_avm_write;
    out_unnamed_ethash_search28_avm_writedata <= i_load_unnamed_ethash_search28_ethash_search_out_unnamed_ethash_search28_avm_writedata;
    out_unnamed_ethash_search28_avm_byteenable <= i_load_unnamed_ethash_search28_ethash_search_out_unnamed_ethash_search28_avm_byteenable;
    out_unnamed_ethash_search28_avm_burstcount <= i_load_unnamed_ethash_search28_ethash_search_out_unnamed_ethash_search28_avm_burstcount;

    -- ext_sig_sync_out(GPOUT,145)
    out_memdep_200_avm_address <= i_store_memdep_200_ethash_search_aunroll_x_out_memdep_200_avm_address;
    out_memdep_200_avm_enable <= i_store_memdep_200_ethash_search_aunroll_x_out_memdep_200_avm_enable;
    out_memdep_200_avm_read <= i_store_memdep_200_ethash_search_aunroll_x_out_memdep_200_avm_read;
    out_memdep_200_avm_write <= i_store_memdep_200_ethash_search_aunroll_x_out_memdep_200_avm_write;
    out_memdep_200_avm_writedata <= i_store_memdep_200_ethash_search_aunroll_x_out_memdep_200_avm_writedata;
    out_memdep_200_avm_byteenable <= i_store_memdep_200_ethash_search_aunroll_x_out_memdep_200_avm_byteenable;
    out_memdep_200_avm_burstcount <= i_store_memdep_200_ethash_search_aunroll_x_out_memdep_200_avm_burstcount;

    -- sync_out(GPOUT,239)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
