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

-- VHDL created from bb_ethash_search_B5_stall_region
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

entity bb_ethash_search_B5_stall_region is
    port (
        in_barrier_unnamed_ethash_search36_wgs_workgroup_size : in std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_null_load_0_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_null_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_0_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_memcoalesce_null_load_0_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_memcoalesce_null_load_0_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        in_arrayidx36_2_RM164 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx45_RM162 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe1104 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2109 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe3113 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe4117 : in std_logic_vector(63 downto 0);  -- ufix64
        in_cmp23156 : in std_logic_vector(0 downto 0);  -- ufix1
        in_cmp23_xor158 : in std_logic_vector(0 downto 0);  -- ufix1
        in_fpgaindvars_iv12135 : in std_logic_vector(3 downto 0);  -- ufix4
        in_global_id_0193 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i18_0908153 : in std_logic_vector(31 downto 0);  -- ufix32
        in_idxprom80_RM167 : in std_logic_vector(63 downto 0);  -- ufix64
        in_l_grpid_04 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr10 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr_zext160 : in std_logic_vector(63 downto 0);  -- ufix64
        in_scalarizer_0100163 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100373 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100583 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100793 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01173137 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01175141 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01177145 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01179149 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099323 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099533 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099743 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099953 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0xor1200168 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100058 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100268 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100478 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100688 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100898 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11174139 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11176143 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11178147 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11180151 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199428 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199638 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199848 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1xor1201169 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_2xor170 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_3xor171 : in std_logic_vector(31 downto 0);  -- ufix32
        in_state_0_0_cast121 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_4_0_cast124 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_5_0_cast127 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_6_0_cast130 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_7_0_cast133 : in std_logic_vector(63 downto 0);  -- ufix64
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
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
        out_exitcond14 : out std_logic_vector(0 downto 0);  -- ufix1
        out_fpgaindvars_iv_next13 : out std_logic_vector(3 downto 0);  -- ufix4
        out_global_id_0193 : out std_logic_vector(31 downto 0);  -- ufix32
        out_inc123 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_04 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0_addr10 : out std_logic_vector(31 downto 0);  -- ufix32
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
        out_state_0_0_cast121 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_4_0_cast124 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_5_0_cast127 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_6_0_cast130 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_7_0_cast133 : out std_logic_vector(63 downto 0);  -- ufix64
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_null_load_0_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memcoalesce_null_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_null_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_null_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_016_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_null_load_016_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_016_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_016_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_016_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_memcoalesce_null_load_016_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_memcoalesce_null_load_016_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_null_load_016_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memcoalesce_null_load_016_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_null_load_016_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_null_load_016_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_barrier_unnamed_ethash_search40_wgs_workgroup_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_memdep_205_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memdep_205_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_205_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_205_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_205_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_205_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_205_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_205_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_205_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_memdep_205_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_memdep_205_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_ethash_search_B5_stall_region;

architecture normal of bb_ethash_search_B5_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_load_memcoalesce_null_load_0_ethash_search346 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_bitwiseor : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata_0 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_readdata_1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c0_for_end91_ethash_search_c0_enter35_ethash_search is
        port (
            in_c0_eni434_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni434_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni434_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni434_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni434_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit41_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit41_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search is
        port (
            in_unnamed_ethash_search37_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search37_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_unnamed_ethash_search37_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search37_3 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_unnamed_ethash_search37_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search37_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_unnamed_ethash_search37_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_unnamed_ethash_search37_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_unnamed_ethash_search37_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_016_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_016_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_016_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_016_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_016_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_016_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_016_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_016_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_016_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_016_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_016_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sbar_unnamed_ethash_search36_ethash_search344 is
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


    component i_sbar_unnamed_ethash_search40_ethash_search357 is
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


    component i_store_memdep_205_ethash_search342 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_bitwiseor : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_writedata : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memdep_205_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memdep_205_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_205_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_205_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_205_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_205_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_205_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_memdep_205_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_205_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_205_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_205_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
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
    signal bgTrunc_i_fpgaindvars_iv_next13_ethash_search_sel_x_b : STD_LOGIC_VECTOR (3 downto 0);
    signal bgTrunc_i_inc123_ethash_search_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx97_rm_ethash_search_ethash_search341_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx97_rm_ethash_search_ethash_search341_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx97_rm_ethash_search_ethash_search341_mult_multconst_x_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx97_rm_ethash_search_ethash_search341_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx97_rm_ethash_search_ethash_search341_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx97_rm_ethash_search_ethash_search341_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx97_rm_ethash_search_ethash_search341_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_out_o_readdata_0 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_out_o_readdata_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_out_memcoalesce_null_load_0_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_out_memcoalesce_null_load_0_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_out_memcoalesce_null_load_0_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_out_memcoalesce_null_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_out_memcoalesce_null_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_out_memcoalesce_null_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_out_memcoalesce_null_load_0_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_memcoalesce_null_load_0_toi1_intcast_ethash_search_sel_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_end91_ethash_search_c0_enter35_ethash_search_aunroll_x_out_c0_exit41_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_end91_ethash_search_c0_enter35_ethash_search_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_end91_ethash_search_c0_enter35_ethash_search_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_ethash_search360_unnamed_ethash_search41_select_0_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_ethash_search360_unnamed_ethash_search41_select_1_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i4_1gr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal i_acl_1413_ethash_search_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_1413_ethash_search_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_1414_ethash_search_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_1414_ethash_search_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_1415_ethash_search_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_1415_ethash_search_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_1416_ethash_search_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_1416_ethash_search_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_barrier_dep206_ethash_search_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_fpgaindvars_iv_next13_ethash_search_a : STD_LOGIC_VECTOR (4 downto 0);
    signal i_fpgaindvars_iv_next13_ethash_search_b : STD_LOGIC_VECTOR (4 downto 0);
    signal i_fpgaindvars_iv_next13_ethash_search_o : STD_LOGIC_VECTOR (4 downto 0);
    signal i_fpgaindvars_iv_next13_ethash_search_q : STD_LOGIC_VECTOR (4 downto 0);
    signal i_inc123_ethash_search_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc123_ethash_search_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc123_ethash_search_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc123_ethash_search_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sbar_unnamed_ethash_search36_ethash_search_out_data_exit : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sbar_unnamed_ethash_search36_ethash_search_out_stall_entry : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sbar_unnamed_ethash_search36_ethash_search_out_valid_exit : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sbar_unnamed_ethash_search40_ethash_search_out_stall_entry : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sbar_unnamed_ethash_search40_ethash_search_out_valid_exit : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_205_ethash_search_out_memdep_205_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_store_memdep_205_ethash_search_out_memdep_205_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_205_ethash_search_out_memdep_205_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal i_store_memdep_205_ethash_search_out_memdep_205_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_205_ethash_search_out_memdep_205_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_205_ethash_search_out_memdep_205_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_205_ethash_search_out_memdep_205_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal i_store_memdep_205_ethash_search_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_205_ethash_search_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_205_ethash_search_out_o_writeack : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_exitcond14_ethash_search_cmp_sign_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_ethash_search362_unnamed_ethash_search42_select_0_x_merged_bit_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_ethash_search362_unnamed_ethash_search42_select_0_x_merged_bit_select_c : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal redist0_stall_entry_o4_173_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_stall_entry_o4_173_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist0_stall_entry_o4_173_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_stall_entry_o4_173_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist0_stall_entry_o4_173_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist0_stall_entry_o4_173_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_stall_entry_o4_173_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist0_stall_entry_o4_173_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_stall_entry_o4_173_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist0_stall_entry_o4_173_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist1_stall_entry_o5_12_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_o5_12_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist1_stall_entry_o5_12_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_o5_12_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist1_stall_entry_o5_12_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist1_stall_entry_o5_12_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_o5_12_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist1_stall_entry_o5_12_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_o5_12_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist1_stall_entry_o5_12_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_stall_entry_o5_173_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_stall_entry_o5_173_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist2_stall_entry_o5_173_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_stall_entry_o5_173_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist2_stall_entry_o5_173_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_stall_entry_o5_173_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_stall_entry_o5_173_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist2_stall_entry_o5_173_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_stall_entry_o5_173_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist2_stall_entry_o5_173_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist3_stall_entry_o6_335_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_stall_entry_o6_335_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist3_stall_entry_o6_335_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_stall_entry_o6_335_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist3_stall_entry_o6_335_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_stall_entry_o6_335_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_stall_entry_o6_335_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist3_stall_entry_o6_335_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_stall_entry_o6_335_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist3_stall_entry_o6_335_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_stall_entry_o7_335_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_stall_entry_o7_335_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist4_stall_entry_o7_335_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_stall_entry_o7_335_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist4_stall_entry_o7_335_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist4_stall_entry_o7_335_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_stall_entry_o7_335_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist4_stall_entry_o7_335_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_stall_entry_o7_335_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist4_stall_entry_o7_335_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist5_stall_entry_o8_335_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_stall_entry_o8_335_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist5_stall_entry_o8_335_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_stall_entry_o8_335_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist5_stall_entry_o8_335_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist5_stall_entry_o8_335_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_stall_entry_o8_335_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist5_stall_entry_o8_335_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_stall_entry_o8_335_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist5_stall_entry_o8_335_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist6_stall_entry_o9_335_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_stall_entry_o9_335_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist6_stall_entry_o9_335_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_stall_entry_o9_335_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist6_stall_entry_o9_335_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist6_stall_entry_o9_335_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_stall_entry_o9_335_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist6_stall_entry_o9_335_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_stall_entry_o9_335_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist6_stall_entry_o9_335_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist7_stall_entry_o10_173_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_stall_entry_o10_173_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist7_stall_entry_o10_173_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_stall_entry_o10_173_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist7_stall_entry_o10_173_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_stall_entry_o10_173_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_stall_entry_o10_173_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist7_stall_entry_o10_173_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_stall_entry_o10_173_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist7_stall_entry_o10_173_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_stall_entry_o10_205_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_stall_entry_o10_205_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist8_stall_entry_o10_205_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_stall_entry_o10_205_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist8_stall_entry_o10_205_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_stall_entry_o10_205_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_stall_entry_o10_205_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist8_stall_entry_o10_205_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_stall_entry_o10_205_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist8_stall_entry_o10_205_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_stall_entry_o11_173_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_stall_entry_o11_173_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist9_stall_entry_o11_173_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_stall_entry_o11_173_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist9_stall_entry_o11_173_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_stall_entry_o11_173_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_stall_entry_o11_173_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist9_stall_entry_o11_173_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_stall_entry_o11_173_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist9_stall_entry_o11_173_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_stall_entry_o12_335_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_stall_entry_o12_335_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist10_stall_entry_o12_335_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_stall_entry_o12_335_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist10_stall_entry_o12_335_fifo_data_in : STD_LOGIC_VECTOR (3 downto 0);
    signal redist10_stall_entry_o12_335_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_stall_entry_o12_335_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist10_stall_entry_o12_335_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_stall_entry_o12_335_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist10_stall_entry_o12_335_fifo_data_out : STD_LOGIC_VECTOR (3 downto 0);
    signal redist11_stall_entry_o13_335_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_stall_entry_o13_335_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist11_stall_entry_o13_335_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_stall_entry_o13_335_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist11_stall_entry_o13_335_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_stall_entry_o13_335_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_stall_entry_o13_335_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist11_stall_entry_o13_335_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_stall_entry_o13_335_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist11_stall_entry_o13_335_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_stall_entry_o16_335_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_stall_entry_o16_335_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist12_stall_entry_o16_335_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_stall_entry_o16_335_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist12_stall_entry_o16_335_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_stall_entry_o16_335_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_stall_entry_o16_335_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist12_stall_entry_o16_335_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_stall_entry_o16_335_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist12_stall_entry_o16_335_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_stall_entry_o17_335_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_stall_entry_o17_335_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist13_stall_entry_o17_335_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_stall_entry_o17_335_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist13_stall_entry_o17_335_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_stall_entry_o17_335_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_stall_entry_o17_335_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist13_stall_entry_o17_335_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_stall_entry_o17_335_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist13_stall_entry_o17_335_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_stall_entry_o18_12_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_stall_entry_o18_12_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist14_stall_entry_o18_12_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_stall_entry_o18_12_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist14_stall_entry_o18_12_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist14_stall_entry_o18_12_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_stall_entry_o18_12_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist14_stall_entry_o18_12_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_stall_entry_o18_12_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist14_stall_entry_o18_12_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist15_stall_entry_o18_173_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_stall_entry_o18_173_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist15_stall_entry_o18_173_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_stall_entry_o18_173_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist15_stall_entry_o18_173_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist15_stall_entry_o18_173_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_stall_entry_o18_173_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist15_stall_entry_o18_173_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_stall_entry_o18_173_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist15_stall_entry_o18_173_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist16_stall_entry_o19_335_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_stall_entry_o19_335_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist16_stall_entry_o19_335_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_stall_entry_o19_335_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist16_stall_entry_o19_335_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist16_stall_entry_o19_335_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_stall_entry_o19_335_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist16_stall_entry_o19_335_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_stall_entry_o19_335_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist16_stall_entry_o19_335_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist17_stall_entry_o20_335_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_stall_entry_o20_335_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist17_stall_entry_o20_335_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_stall_entry_o20_335_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist17_stall_entry_o20_335_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist17_stall_entry_o20_335_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_stall_entry_o20_335_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist17_stall_entry_o20_335_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_stall_entry_o20_335_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist17_stall_entry_o20_335_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist18_stall_entry_o21_335_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_stall_entry_o21_335_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist18_stall_entry_o21_335_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_stall_entry_o21_335_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist18_stall_entry_o21_335_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist18_stall_entry_o21_335_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_stall_entry_o21_335_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist18_stall_entry_o21_335_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_stall_entry_o21_335_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist18_stall_entry_o21_335_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist19_stall_entry_o22_335_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_stall_entry_o22_335_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist19_stall_entry_o22_335_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_stall_entry_o22_335_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist19_stall_entry_o22_335_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist19_stall_entry_o22_335_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_stall_entry_o22_335_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist19_stall_entry_o22_335_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_stall_entry_o22_335_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist19_stall_entry_o22_335_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist20_stall_entry_o23_173_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_stall_entry_o23_173_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist20_stall_entry_o23_173_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_stall_entry_o23_173_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist20_stall_entry_o23_173_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist20_stall_entry_o23_173_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_stall_entry_o23_173_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist20_stall_entry_o23_173_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_stall_entry_o23_173_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist20_stall_entry_o23_173_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist21_stall_entry_o24_173_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_stall_entry_o24_173_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist21_stall_entry_o24_173_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_stall_entry_o24_173_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist21_stall_entry_o24_173_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist21_stall_entry_o24_173_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_stall_entry_o24_173_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist21_stall_entry_o24_173_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_stall_entry_o24_173_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist21_stall_entry_o24_173_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist22_stall_entry_o25_205_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_stall_entry_o25_205_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist22_stall_entry_o25_205_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_stall_entry_o25_205_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist22_stall_entry_o25_205_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist22_stall_entry_o25_205_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_stall_entry_o25_205_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist22_stall_entry_o25_205_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_stall_entry_o25_205_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist22_stall_entry_o25_205_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist23_stall_entry_o26_205_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_stall_entry_o26_205_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist23_stall_entry_o26_205_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_stall_entry_o26_205_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist23_stall_entry_o26_205_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist23_stall_entry_o26_205_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_stall_entry_o26_205_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist23_stall_entry_o26_205_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_stall_entry_o26_205_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist23_stall_entry_o26_205_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist24_stall_entry_o27_335_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_stall_entry_o27_335_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist24_stall_entry_o27_335_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_stall_entry_o27_335_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist24_stall_entry_o27_335_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist24_stall_entry_o27_335_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_stall_entry_o27_335_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist24_stall_entry_o27_335_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_stall_entry_o27_335_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist24_stall_entry_o27_335_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist25_stall_entry_o28_335_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_stall_entry_o28_335_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist25_stall_entry_o28_335_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_stall_entry_o28_335_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist25_stall_entry_o28_335_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist25_stall_entry_o28_335_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_stall_entry_o28_335_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist25_stall_entry_o28_335_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_stall_entry_o28_335_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist25_stall_entry_o28_335_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist26_stall_entry_o29_335_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_stall_entry_o29_335_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist26_stall_entry_o29_335_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_stall_entry_o29_335_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist26_stall_entry_o29_335_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist26_stall_entry_o29_335_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_stall_entry_o29_335_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist26_stall_entry_o29_335_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_stall_entry_o29_335_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist26_stall_entry_o29_335_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist27_stall_entry_o30_335_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_stall_entry_o30_335_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist27_stall_entry_o30_335_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_stall_entry_o30_335_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist27_stall_entry_o30_335_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist27_stall_entry_o30_335_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_stall_entry_o30_335_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist27_stall_entry_o30_335_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_stall_entry_o30_335_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist27_stall_entry_o30_335_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist28_stall_entry_o32_335_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_stall_entry_o32_335_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist28_stall_entry_o32_335_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_stall_entry_o32_335_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist28_stall_entry_o32_335_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist28_stall_entry_o32_335_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_stall_entry_o32_335_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist28_stall_entry_o32_335_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_stall_entry_o32_335_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist28_stall_entry_o32_335_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist29_stall_entry_o33_335_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_stall_entry_o33_335_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist29_stall_entry_o33_335_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_stall_entry_o33_335_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist29_stall_entry_o33_335_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist29_stall_entry_o33_335_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_stall_entry_o33_335_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist29_stall_entry_o33_335_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_stall_entry_o33_335_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist29_stall_entry_o33_335_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist30_stall_entry_o34_335_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_stall_entry_o34_335_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist30_stall_entry_o34_335_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_stall_entry_o34_335_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist30_stall_entry_o34_335_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist30_stall_entry_o34_335_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_stall_entry_o34_335_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist30_stall_entry_o34_335_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_stall_entry_o34_335_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist30_stall_entry_o34_335_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist31_stall_entry_o35_335_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_stall_entry_o35_335_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist31_stall_entry_o35_335_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_stall_entry_o35_335_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist31_stall_entry_o35_335_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist31_stall_entry_o35_335_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_stall_entry_o35_335_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist31_stall_entry_o35_335_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_stall_entry_o35_335_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist31_stall_entry_o35_335_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist32_stall_entry_o36_335_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_stall_entry_o36_335_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist32_stall_entry_o36_335_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_stall_entry_o36_335_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist32_stall_entry_o36_335_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist32_stall_entry_o36_335_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_stall_entry_o36_335_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist32_stall_entry_o36_335_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_stall_entry_o36_335_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist32_stall_entry_o36_335_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist33_stall_entry_o37_173_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_stall_entry_o37_173_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist33_stall_entry_o37_173_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_stall_entry_o37_173_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist33_stall_entry_o37_173_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist33_stall_entry_o37_173_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_stall_entry_o37_173_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist33_stall_entry_o37_173_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_stall_entry_o37_173_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist33_stall_entry_o37_173_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist34_stall_entry_o38_173_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_stall_entry_o38_173_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist34_stall_entry_o38_173_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_stall_entry_o38_173_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist34_stall_entry_o38_173_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist34_stall_entry_o38_173_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_stall_entry_o38_173_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist34_stall_entry_o38_173_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_stall_entry_o38_173_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist34_stall_entry_o38_173_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist35_stall_entry_o39_205_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist35_stall_entry_o39_205_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist35_stall_entry_o39_205_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist35_stall_entry_o39_205_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist35_stall_entry_o39_205_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist35_stall_entry_o39_205_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist35_stall_entry_o39_205_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist35_stall_entry_o39_205_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist35_stall_entry_o39_205_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist35_stall_entry_o39_205_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist36_stall_entry_o40_205_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_stall_entry_o40_205_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist36_stall_entry_o40_205_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_stall_entry_o40_205_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist36_stall_entry_o40_205_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist36_stall_entry_o40_205_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_stall_entry_o40_205_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist36_stall_entry_o40_205_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_stall_entry_o40_205_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist36_stall_entry_o40_205_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist37_stall_entry_o41_335_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist37_stall_entry_o41_335_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist37_stall_entry_o41_335_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist37_stall_entry_o41_335_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist37_stall_entry_o41_335_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist37_stall_entry_o41_335_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist37_stall_entry_o41_335_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist37_stall_entry_o41_335_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist37_stall_entry_o41_335_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist37_stall_entry_o41_335_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist38_stall_entry_o42_335_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist38_stall_entry_o42_335_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist38_stall_entry_o42_335_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist38_stall_entry_o42_335_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist38_stall_entry_o42_335_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist38_stall_entry_o42_335_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist38_stall_entry_o42_335_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist38_stall_entry_o42_335_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist38_stall_entry_o42_335_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist38_stall_entry_o42_335_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist39_stall_entry_o43_335_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_stall_entry_o43_335_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist39_stall_entry_o43_335_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_stall_entry_o43_335_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist39_stall_entry_o43_335_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist39_stall_entry_o43_335_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_stall_entry_o43_335_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist39_stall_entry_o43_335_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_stall_entry_o43_335_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist39_stall_entry_o43_335_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist40_stall_entry_o47_335_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_stall_entry_o47_335_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist40_stall_entry_o47_335_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_stall_entry_o47_335_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist40_stall_entry_o47_335_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist40_stall_entry_o47_335_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_stall_entry_o47_335_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist40_stall_entry_o47_335_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_stall_entry_o47_335_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist40_stall_entry_o47_335_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist41_stall_entry_o48_335_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist41_stall_entry_o48_335_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist41_stall_entry_o48_335_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist41_stall_entry_o48_335_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist41_stall_entry_o48_335_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist41_stall_entry_o48_335_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist41_stall_entry_o48_335_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist41_stall_entry_o48_335_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist41_stall_entry_o48_335_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist41_stall_entry_o48_335_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist42_stall_entry_o49_335_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist42_stall_entry_o49_335_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist42_stall_entry_o49_335_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist42_stall_entry_o49_335_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist42_stall_entry_o49_335_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist42_stall_entry_o49_335_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist42_stall_entry_o49_335_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist42_stall_entry_o49_335_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist42_stall_entry_o49_335_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist42_stall_entry_o49_335_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist43_stall_entry_o50_335_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist43_stall_entry_o50_335_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist43_stall_entry_o50_335_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist43_stall_entry_o50_335_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist43_stall_entry_o50_335_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist43_stall_entry_o50_335_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist43_stall_entry_o50_335_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist43_stall_entry_o50_335_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist43_stall_entry_o50_335_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist43_stall_entry_o50_335_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist44_stall_entry_o51_335_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist44_stall_entry_o51_335_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist44_stall_entry_o51_335_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist44_stall_entry_o51_335_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist44_stall_entry_o51_335_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist44_stall_entry_o51_335_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist44_stall_entry_o51_335_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist44_stall_entry_o51_335_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist44_stall_entry_o51_335_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist44_stall_entry_o51_335_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist45_i_acl_1416_ethash_search_q_130_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist45_i_acl_1416_ethash_search_q_130_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist45_i_acl_1416_ethash_search_q_130_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist45_i_acl_1416_ethash_search_q_130_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist45_i_acl_1416_ethash_search_q_130_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist45_i_acl_1416_ethash_search_q_130_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist45_i_acl_1416_ethash_search_q_130_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist45_i_acl_1416_ethash_search_q_130_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist45_i_acl_1416_ethash_search_q_130_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist45_i_acl_1416_ethash_search_q_130_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist46_i_acl_1415_ethash_search_q_130_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist46_i_acl_1415_ethash_search_q_130_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist46_i_acl_1415_ethash_search_q_130_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist46_i_acl_1415_ethash_search_q_130_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist46_i_acl_1415_ethash_search_q_130_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist46_i_acl_1415_ethash_search_q_130_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist46_i_acl_1415_ethash_search_q_130_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist46_i_acl_1415_ethash_search_q_130_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist46_i_acl_1415_ethash_search_q_130_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist46_i_acl_1415_ethash_search_q_130_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist47_i_acl_1414_ethash_search_q_130_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist47_i_acl_1414_ethash_search_q_130_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist47_i_acl_1414_ethash_search_q_130_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist47_i_acl_1414_ethash_search_q_130_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist47_i_acl_1414_ethash_search_q_130_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist47_i_acl_1414_ethash_search_q_130_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist47_i_acl_1414_ethash_search_q_130_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist47_i_acl_1414_ethash_search_q_130_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist47_i_acl_1414_ethash_search_q_130_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist47_i_acl_1414_ethash_search_q_130_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist48_i_acl_1413_ethash_search_q_130_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_i_acl_1413_ethash_search_q_130_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist48_i_acl_1413_ethash_search_q_130_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_i_acl_1413_ethash_search_q_130_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist48_i_acl_1413_ethash_search_q_130_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist48_i_acl_1413_ethash_search_q_130_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_i_acl_1413_ethash_search_q_130_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist48_i_acl_1413_ethash_search_q_130_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_i_acl_1413_ethash_search_q_130_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist48_i_acl_1413_ethash_search_q_130_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal bubble_select_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_c : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_sfc_c0_for_end91_ethash_search_c0_enter35_ethash_search_aunroll_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_end91_ethash_search_c0_enter35_ethash_search_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_q : STD_LOGIC_VECTOR (128 downto 0);
    signal bubble_select_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_sbar_unnamed_ethash_search36_ethash_search_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sbar_unnamed_ethash_search36_ethash_search_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_store_memdep_205_ethash_search_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_store_memdep_205_ethash_search_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (1798 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_f : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_g : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_h : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_i : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_j : STD_LOGIC_VECTOR (3 downto 0);
    signal bubble_select_stall_entry_k : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_l : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_m : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_n : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_o : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_p : STD_LOGIC_VECTOR (63 downto 0);
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
    signal bubble_select_stall_entry_ii : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_jj : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_kk : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_ll : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_mm : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_nn : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_oo : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_pp : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_qq : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_rr : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_ss : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_tt : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_uu : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_vv : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_ww : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist0_stall_entry_o4_173_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist0_stall_entry_o4_173_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist1_stall_entry_o5_12_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist1_stall_entry_o5_12_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist2_stall_entry_o5_173_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist2_stall_entry_o5_173_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist3_stall_entry_o6_335_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist3_stall_entry_o6_335_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist4_stall_entry_o7_335_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist4_stall_entry_o7_335_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist5_stall_entry_o8_335_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist5_stall_entry_o8_335_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist6_stall_entry_o9_335_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist6_stall_entry_o9_335_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist7_stall_entry_o10_173_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist7_stall_entry_o10_173_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist8_stall_entry_o10_205_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist8_stall_entry_o10_205_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist9_stall_entry_o11_173_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist9_stall_entry_o11_173_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist10_stall_entry_o12_335_fifo_q : STD_LOGIC_VECTOR (3 downto 0);
    signal bubble_select_redist10_stall_entry_o12_335_fifo_b : STD_LOGIC_VECTOR (3 downto 0);
    signal bubble_join_redist11_stall_entry_o13_335_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist11_stall_entry_o13_335_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist12_stall_entry_o16_335_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist12_stall_entry_o16_335_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist13_stall_entry_o17_335_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist13_stall_entry_o17_335_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist14_stall_entry_o18_12_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist14_stall_entry_o18_12_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist15_stall_entry_o18_173_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist15_stall_entry_o18_173_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist16_stall_entry_o19_335_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist16_stall_entry_o19_335_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist17_stall_entry_o20_335_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist17_stall_entry_o20_335_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist18_stall_entry_o21_335_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist18_stall_entry_o21_335_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist19_stall_entry_o22_335_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist19_stall_entry_o22_335_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist20_stall_entry_o23_173_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist20_stall_entry_o23_173_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist21_stall_entry_o24_173_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist21_stall_entry_o24_173_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist22_stall_entry_o25_205_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist22_stall_entry_o25_205_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist23_stall_entry_o26_205_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist23_stall_entry_o26_205_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist24_stall_entry_o27_335_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist24_stall_entry_o27_335_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist25_stall_entry_o28_335_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist25_stall_entry_o28_335_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist26_stall_entry_o29_335_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist26_stall_entry_o29_335_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist27_stall_entry_o30_335_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist27_stall_entry_o30_335_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist28_stall_entry_o32_335_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist28_stall_entry_o32_335_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist29_stall_entry_o33_335_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist29_stall_entry_o33_335_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist30_stall_entry_o34_335_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist30_stall_entry_o34_335_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist31_stall_entry_o35_335_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist31_stall_entry_o35_335_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist32_stall_entry_o36_335_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist32_stall_entry_o36_335_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist33_stall_entry_o37_173_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist33_stall_entry_o37_173_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist34_stall_entry_o38_173_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist34_stall_entry_o38_173_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist35_stall_entry_o39_205_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist35_stall_entry_o39_205_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist36_stall_entry_o40_205_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist36_stall_entry_o40_205_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist37_stall_entry_o41_335_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist37_stall_entry_o41_335_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist38_stall_entry_o42_335_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist38_stall_entry_o42_335_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist39_stall_entry_o43_335_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist39_stall_entry_o43_335_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist40_stall_entry_o47_335_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist40_stall_entry_o47_335_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist41_stall_entry_o48_335_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist41_stall_entry_o48_335_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist42_stall_entry_o49_335_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist42_stall_entry_o49_335_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist43_stall_entry_o50_335_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist43_stall_entry_o50_335_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist44_stall_entry_o51_335_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist44_stall_entry_o51_335_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist45_i_acl_1416_ethash_search_q_130_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist45_i_acl_1416_ethash_search_q_130_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist46_i_acl_1415_ethash_search_q_130_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist46_i_acl_1415_ethash_search_q_130_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist47_i_acl_1414_ethash_search_q_130_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist47_i_acl_1414_ethash_search_q_130_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist48_i_acl_1413_ethash_search_q_130_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist48_i_acl_1413_ethash_search_q_130_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_acl_1413_ethash_search_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_acl_1413_ethash_search_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_acl_1413_ethash_search_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_acl_1413_ethash_search_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_acl_1413_ethash_search_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_acl_1413_ethash_search_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_acl_1413_ethash_search_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_acl_1413_ethash_search_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_acl_1414_ethash_search_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_acl_1414_ethash_search_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_acl_1414_ethash_search_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_acl_1414_ethash_search_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_acl_1414_ethash_search_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_acl_1414_ethash_search_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_acl_1414_ethash_search_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_acl_1414_ethash_search_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_acl_1415_ethash_search_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_acl_1415_ethash_search_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_acl_1415_ethash_search_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_acl_1415_ethash_search_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_acl_1415_ethash_search_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_acl_1415_ethash_search_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_acl_1415_ethash_search_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_acl_1415_ethash_search_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_acl_1416_ethash_search_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_acl_1416_ethash_search_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_acl_1416_ethash_search_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_acl_1416_ethash_search_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_acl_1416_ethash_search_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_acl_1416_ethash_search_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_acl_1416_ethash_search_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_acl_1416_ethash_search_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sbar_unnamed_ethash_search36_ethash_search_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sbar_unnamed_ethash_search36_ethash_search_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sbar_unnamed_ethash_search36_ethash_search_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_memdep_205_ethash_search_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_memdep_205_ethash_search_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_memdep_205_ethash_search_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg18 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg18 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed18 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg19 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg19 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed19 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg20 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg20 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed20 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg21 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg21 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed21 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg22 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg22 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed22 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg23 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg23 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed23 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg24 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg24 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed24 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg25 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg25 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed25 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg26 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg26 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed26 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg27 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg27 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed27 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg28 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg28 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed28 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg29 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg29 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed29 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg30 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg30 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed30 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg31 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg31 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed31 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg32 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg32 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed32 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg33 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg33 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed33 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg34 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg34 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed34 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg35 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg35 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed35 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg36 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg36 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed36 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg37 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg37 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed37 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg38 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg38 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed38 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg39 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg39 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed39 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg40 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg40 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed40 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg41 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg41 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed41 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg42 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg42 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed42 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg43 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg43 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed43 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg44 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg44 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed44 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or18 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or19 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or20 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or21 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or22 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or23 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or24 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or25 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or26 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or27 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or28 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or29 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or30 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or31 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or32 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or33 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or34 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or35 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or36 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or37 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or38 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or39 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or40 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or41 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or42 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or43 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V18 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V19 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V20 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V21 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V22 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V23 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V24 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V25 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V26 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V27 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V28 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V29 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V30 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V31 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V32 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V33 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V34 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V35 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V36 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V37 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V38 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V39 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V40 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V41 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V42 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V43 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V44 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_o5_12_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_o5_12_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_o5_12_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_o5_12_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_o5_12_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_o5_12_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_o5_12_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_o5_12_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_o5_12_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_o5_12_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_o5_12_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_o5_12_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_stall_entry_o5_12_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_stall_entry_o5_173_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_stall_entry_o5_173_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_stall_entry_o5_173_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_stall_entry_o5_173_fifo_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_stall_entry_o5_173_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_stall_entry_o5_173_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_stall_entry_o10_173_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_stall_entry_o10_173_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_stall_entry_o10_173_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_stall_entry_o10_173_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_stall_entry_o10_173_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_stall_entry_o10_173_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_stall_entry_o10_173_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_stall_entry_o10_173_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_stall_entry_o10_173_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_stall_entry_o10_173_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_stall_entry_o10_173_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_stall_entry_o10_173_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_stall_entry_o10_173_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_stall_entry_o10_205_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_stall_entry_o10_205_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_stall_entry_o10_205_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_stall_entry_o10_205_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_stall_entry_o10_205_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_stall_entry_o10_205_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_stall_entry_o10_205_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_stall_entry_o10_205_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_stall_entry_o10_205_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_stall_entry_o10_205_fifo_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_stall_entry_o10_205_fifo_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_stall_entry_o10_205_fifo_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_stall_entry_o10_205_fifo_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_stall_entry_o10_205_fifo_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_stall_entry_o10_205_fifo_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_stall_entry_o10_205_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_stall_entry_o10_205_fifo_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_stall_entry_o10_205_fifo_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_stall_entry_o10_205_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_stall_entry_o10_205_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_stall_entry_o10_205_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_stall_entry_o10_205_fifo_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_stall_entry_o10_205_fifo_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist9_stall_entry_o11_173_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist9_stall_entry_o11_173_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist9_stall_entry_o11_173_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist9_stall_entry_o11_173_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist9_stall_entry_o11_173_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist9_stall_entry_o11_173_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist9_stall_entry_o11_173_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist9_stall_entry_o11_173_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist9_stall_entry_o11_173_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist9_stall_entry_o11_173_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist9_stall_entry_o11_173_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist9_stall_entry_o11_173_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist9_stall_entry_o11_173_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_stall_entry_o18_12_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_stall_entry_o18_12_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_stall_entry_o18_12_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_stall_entry_o18_12_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_stall_entry_o18_12_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_stall_entry_o18_12_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_stall_entry_o18_12_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_stall_entry_o18_12_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_stall_entry_o18_12_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_stall_entry_o18_12_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_stall_entry_o18_12_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_stall_entry_o18_12_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_stall_entry_o18_12_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_stall_entry_o18_173_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_stall_entry_o18_173_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_stall_entry_o18_173_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_stall_entry_o18_173_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_stall_entry_o18_173_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_stall_entry_o18_173_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_stall_entry_o18_173_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_stall_entry_o18_173_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_stall_entry_o18_173_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_stall_entry_o18_173_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_stall_entry_o18_173_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_stall_entry_o18_173_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_stall_entry_o18_173_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist22_stall_entry_o25_205_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist22_stall_entry_o25_205_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist22_stall_entry_o25_205_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist23_stall_entry_o26_205_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist23_stall_entry_o26_205_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist23_stall_entry_o26_205_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist34_stall_entry_o38_173_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist34_stall_entry_o38_173_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist34_stall_entry_o38_173_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist34_stall_entry_o38_173_fifo_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist34_stall_entry_o38_173_fifo_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist34_stall_entry_o38_173_fifo_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist34_stall_entry_o38_173_fifo_and5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist34_stall_entry_o38_173_fifo_and6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist34_stall_entry_o38_173_fifo_and7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist34_stall_entry_o38_173_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist34_stall_entry_o38_173_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist35_stall_entry_o39_205_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist35_stall_entry_o39_205_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist35_stall_entry_o39_205_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist36_stall_entry_o40_205_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist36_stall_entry_o40_205_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist36_stall_entry_o40_205_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_redist45_i_acl_1416_ethash_search_q_130_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_redist45_i_acl_1416_ethash_search_q_130_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_redist45_i_acl_1416_ethash_search_q_130_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_redist46_i_acl_1415_ethash_search_q_130_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_redist46_i_acl_1415_ethash_search_q_130_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_redist46_i_acl_1415_ethash_search_q_130_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_redist47_i_acl_1414_ethash_search_q_130_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_redist47_i_acl_1414_ethash_search_q_130_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_redist47_i_acl_1414_ethash_search_q_130_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_redist48_i_acl_1413_ethash_search_q_130_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_redist48_i_acl_1413_ethash_search_q_130_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_redist48_i_acl_1413_ethash_search_q_130_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and18 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and19 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and20 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and21 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and22 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and23 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and24 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and25 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and26 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and27 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and28 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and29 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and30 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and31 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and32 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and33 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and34 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and35 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and36 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and37 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_reg_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_reg_data_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- bubble_join_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x(BITJOIN,221)
    bubble_join_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_q <= i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4 & i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3 & i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2 & i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1 & i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0;

    -- bubble_select_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x(BITSELECT,222)
    bubble_select_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_q(0 downto 0));
    bubble_select_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_q(32 downto 1));
    bubble_select_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_q(64 downto 33));
    bubble_select_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_q(96 downto 65));
    bubble_select_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_q(128 downto 97));

    -- SE_out_redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo(STALLENABLE,544)
    -- Valid signal propagation
    SE_out_redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_V0 <= SE_out_redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_backStall <= i_sbar_unnamed_ethash_search40_ethash_search_out_stall_entry or not (SE_out_redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_and0 <= redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_valid_out;
    SE_out_redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_wireValid <= SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_V0 and SE_out_redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_and0;

    -- bubble_join_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x(BITJOIN,215)
    bubble_join_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_q <= i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_out_o_readdata_1 & i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_out_o_readdata_0;

    -- bubble_select_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x(BITSELECT,216)
    bubble_select_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_q(63 downto 0));
    bubble_select_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_q(127 downto 64));

    -- i_memcoalesce_null_load_0_toi1_intcast_ethash_search_sel_x(BITSELECT,33)@205
    i_memcoalesce_null_load_0_toi1_intcast_ethash_search_sel_x_b <= bubble_select_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_b(0 downto 0);

    -- bubble_join_redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo(BITJOIN,382)
    bubble_join_redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_q <= redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_data_out;

    -- bubble_select_redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo(BITSELECT,383)
    bubble_select_redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_q(0 downto 0));

    -- i_barrier_dep206_ethash_search(LOGICAL,54)@205
    i_barrier_dep206_ethash_search_q <= bubble_select_redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_b or i_memcoalesce_null_load_0_toi1_intcast_ethash_search_sel_x_b;

    -- i_sbar_unnamed_ethash_search40_ethash_search(BLACKBOX,61)@205
    -- in in_stall_exit@20000000
    -- out out_data_exit@335
    -- out out_stall_entry@20000000
    -- out out_valid_exit@335
    thei_sbar_unnamed_ethash_search40_ethash_search : i_sbar_unnamed_ethash_search40_ethash_search357
    PORT MAP (
        in_data_entry => i_barrier_dep206_ethash_search_q,
        in_stall_exit => SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall,
        in_valid_entry => SE_out_redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_V0,
        in_workgroup_size => in_barrier_unnamed_ethash_search40_wgs_workgroup_size,
        out_stall_entry => i_sbar_unnamed_ethash_search40_ethash_search_out_stall_entry,
        out_valid_exit => i_sbar_unnamed_ethash_search40_ethash_search_out_valid_exit,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_stall_entry(BITJOIN,231)
    bubble_join_stall_entry_q <= in_state_7_0_cast133 & in_state_6_0_cast130 & in_state_5_0_cast127 & in_state_4_0_cast124 & in_state_0_0_cast121 & in_scalarizer_3xor171 & in_scalarizer_2xor170 & in_scalarizer_1xor1201169 & in_scalarizer_199848 & in_scalarizer_199638 & in_scalarizer_199428 & in_scalarizer_11180151 & in_scalarizer_11178147 & in_scalarizer_11176143 & in_scalarizer_11174139 & in_scalarizer_1100898 & in_scalarizer_1100688 & in_scalarizer_1100478 & in_scalarizer_1100268 & in_scalarizer_1100058 & in_scalarizer_0xor1200168 & in_scalarizer_099953 & in_scalarizer_099743 & in_scalarizer_099533 & in_scalarizer_099323 & in_scalarizer_01179149 & in_scalarizer_01177145 & in_scalarizer_01175141 & in_scalarizer_01173137 & in_scalarizer_0100793 & in_scalarizer_0100583 & in_scalarizer_0100373 & in_scalarizer_0100163 & in_l_grpid_0_addr_zext160 & in_l_grpid_0_addr10 & in_l_grpid_04 & in_idxprom80_RM167 & in_i18_0908153 & in_global_id_0193 & in_fpgaindvars_iv12135 & in_cmp23_xor158 & in_cmp23156 & in_c0_exe4117 & in_c0_exe3113 & in_c0_exe2109 & in_c0_exe1104 & in_arrayidx45_RM162 & in_arrayidx36_2_RM164;

    -- bubble_select_stall_entry(BITSELECT,232)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(63 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(127 downto 64));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(128 downto 128));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(192 downto 129));
    bubble_select_stall_entry_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(256 downto 193));
    bubble_select_stall_entry_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(320 downto 257));
    bubble_select_stall_entry_h <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(321 downto 321));
    bubble_select_stall_entry_i <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(322 downto 322));
    bubble_select_stall_entry_j <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(326 downto 323));
    bubble_select_stall_entry_k <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(358 downto 327));
    bubble_select_stall_entry_l <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(390 downto 359));
    bubble_select_stall_entry_m <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(454 downto 391));
    bubble_select_stall_entry_n <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(486 downto 455));
    bubble_select_stall_entry_o <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(518 downto 487));
    bubble_select_stall_entry_p <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(582 downto 519));
    bubble_select_stall_entry_q <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(614 downto 583));
    bubble_select_stall_entry_r <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(646 downto 615));
    bubble_select_stall_entry_s <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(678 downto 647));
    bubble_select_stall_entry_t <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(710 downto 679));
    bubble_select_stall_entry_u <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(742 downto 711));
    bubble_select_stall_entry_v <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(774 downto 743));
    bubble_select_stall_entry_w <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(806 downto 775));
    bubble_select_stall_entry_x <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(838 downto 807));
    bubble_select_stall_entry_y <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(870 downto 839));
    bubble_select_stall_entry_z <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(902 downto 871));
    bubble_select_stall_entry_aa <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(934 downto 903));
    bubble_select_stall_entry_bb <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(966 downto 935));
    bubble_select_stall_entry_cc <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(998 downto 967));
    bubble_select_stall_entry_dd <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1030 downto 999));
    bubble_select_stall_entry_ee <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1062 downto 1031));
    bubble_select_stall_entry_ff <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1094 downto 1063));
    bubble_select_stall_entry_gg <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1126 downto 1095));
    bubble_select_stall_entry_hh <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1158 downto 1127));
    bubble_select_stall_entry_ii <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1190 downto 1159));
    bubble_select_stall_entry_jj <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1222 downto 1191));
    bubble_select_stall_entry_kk <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1254 downto 1223));
    bubble_select_stall_entry_ll <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1286 downto 1255));
    bubble_select_stall_entry_mm <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1318 downto 1287));
    bubble_select_stall_entry_nn <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1350 downto 1319));
    bubble_select_stall_entry_oo <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1382 downto 1351));
    bubble_select_stall_entry_pp <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1414 downto 1383));
    bubble_select_stall_entry_qq <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1446 downto 1415));
    bubble_select_stall_entry_rr <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1478 downto 1447));
    bubble_select_stall_entry_ss <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1542 downto 1479));
    bubble_select_stall_entry_tt <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1606 downto 1543));
    bubble_select_stall_entry_uu <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1670 downto 1607));
    bubble_select_stall_entry_vv <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1734 downto 1671));
    bubble_select_stall_entry_ww <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1798 downto 1735));

    -- i_arrayidx97_rm_ethash_search_ethash_search341_mult_multconst_x(CONSTANT,26)
    i_arrayidx97_rm_ethash_search_ethash_search341_mult_multconst_x_q <= "0000000000000000000000000000000000000000000000000000000000000";

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_bs1_merged_bit_select(BITSELECT,101)@0
    i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_bs1_merged_bit_select_b <= bubble_select_stall_entry_m(17 downto 0);
    i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_bs1_merged_bit_select_c <= bubble_select_stall_entry_m(63 downto 54);
    i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_bs1_merged_bit_select_d <= bubble_select_stall_entry_m(35 downto 18);
    i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_bs1_merged_bit_select_e <= bubble_select_stall_entry_m(53 downto 36);

    -- i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_im3_shift0(BITSHIFT,95)@0
    i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_im3_shift0_qint <= i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_bs1_merged_bit_select_c & "00";
    i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_im3_shift0_q <= i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_im3_shift0_qint(11 downto 0);

    -- i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_align_15(BITSHIFT,88)@0
    i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_im3_shift0_q) & "000000000000000";
    i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_align_15_q <= i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_im6_shift0(BITSHIFT,96)@0
    i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_im6_shift0_qint <= i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_bs1_merged_bit_select_d & "00";
    i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_im6_shift0_q <= i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_im6_shift0_qint(19 downto 0);

    -- i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_align_14(BITSHIFT,87)@0
    i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_align_14_q <= i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_align_14_qint(38 downto 0);

    -- i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_join_16(BITJOIN,89)@0
    i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_join_16_q <= i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_align_15_q & i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_align_14_q;

    -- i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_im9_shift0(BITSHIFT,97)@0
    i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_im9_shift0_qint <= i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_bs1_merged_bit_select_e & "00";
    i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_im9_shift0_q <= i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_im9_shift0_qint(19 downto 0);

    -- i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_align_12(BITSHIFT,85)@0
    i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_im9_shift0_q) & "000000000000000";
    i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_align_12_q <= i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_im0_shift0(BITSHIFT,94)@0
    i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_im0_shift0_qint <= i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_bs1_merged_bit_select_b & "00";
    i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_im0_shift0_q <= i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_im0_shift0_qint(19 downto 0);

    -- i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_join_13(BITJOIN,86)@0
    i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_join_13_q <= i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_im0_shift0_q);

    -- i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_result_add_0_0(ADD,90)@0
    i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_join_13_q);
    i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_join_16_q);
    i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_result_add_0_0_b));
    i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_result_add_0_0_q <= i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_result_add_0_0_o(67 downto 0);

    -- i_arrayidx97_rm_ethash_search_ethash_search341_mult_extender_x(BITJOIN,25)@0
    i_arrayidx97_rm_ethash_search_ethash_search341_mult_extender_x_q <= i_arrayidx97_rm_ethash_search_ethash_search341_mult_multconst_x_q & i_arrayidx97_rm_ethash_search_ethash_search341_mult_x_result_add_0_0_q(66 downto 0);

    -- i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x(BITSELECT,27)@0
    i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b <= i_arrayidx97_rm_ethash_search_ethash_search341_mult_extender_x_q(63 downto 0);

    -- bubble_join_i_sfc_c0_for_end91_ethash_search_c0_enter35_ethash_search_aunroll_x(BITJOIN,218)
    bubble_join_i_sfc_c0_for_end91_ethash_search_c0_enter35_ethash_search_aunroll_x_q <= i_sfc_c0_for_end91_ethash_search_c0_enter35_ethash_search_aunroll_x_out_c0_exit41_1;

    -- bubble_select_i_sfc_c0_for_end91_ethash_search_c0_enter35_ethash_search_aunroll_x(BITSELECT,219)
    bubble_select_i_sfc_c0_for_end91_ethash_search_c0_enter35_ethash_search_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end91_ethash_search_c0_enter35_ethash_search_aunroll_x_q(31 downto 0));

    -- bubble_join_i_sbar_unnamed_ethash_search36_ethash_search(BITJOIN,224)
    bubble_join_i_sbar_unnamed_ethash_search36_ethash_search_q <= i_sbar_unnamed_ethash_search36_ethash_search_out_data_exit;

    -- bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_reg(STALLFIFO,809)
    bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_reg_valid_in <= SE_out_i_sbar_unnamed_ethash_search36_ethash_search_V0;
    bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_reg_stall_in <= SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_backStall;
    bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_reg_data_in <= bubble_join_i_sbar_unnamed_ethash_search36_ethash_search_q;
    bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_reg_valid_in_bitsignaltemp <= bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_reg_valid_in(0);
    bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_reg_stall_in_bitsignaltemp <= bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_reg_stall_in(0);
    bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_reg_valid_out(0) <= bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_reg_valid_out_bitsignaltemp;
    bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_reg_stall_out(0) <= bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_reg_stall_out_bitsignaltemp;
    thebubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_reg : acl_data_fifo
    GENERIC MAP (
        DEPTH => 3,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "zl_reg"
    )
    PORT MAP (
        valid_in => bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_reg_stall_in_bitsignaltemp,
        data_in => bubble_join_i_sbar_unnamed_ethash_search36_ethash_search_q,
        valid_out => bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_reg_stall_out_bitsignaltemp,
        data_out => bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_reg_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_sbar_unnamed_ethash_search36_ethash_search(STALLENABLE,425)
    -- Valid signal propagation
    SE_out_i_sbar_unnamed_ethash_search36_ethash_search_V0 <= SE_out_i_sbar_unnamed_ethash_search36_ethash_search_wireValid;
    -- Backward Stall generation
    SE_out_i_sbar_unnamed_ethash_search36_ethash_search_backStall <= bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_reg_stall_out or not (SE_out_i_sbar_unnamed_ethash_search36_ethash_search_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_sbar_unnamed_ethash_search36_ethash_search_wireValid <= i_sbar_unnamed_ethash_search36_ethash_search_out_valid_exit;

    -- bubble_join_i_store_memdep_205_ethash_search(BITJOIN,228)
    bubble_join_i_store_memdep_205_ethash_search_q <= i_store_memdep_205_ethash_search_out_o_writeack;

    -- bubble_select_i_store_memdep_205_ethash_search(BITSELECT,229)
    bubble_select_i_store_memdep_205_ethash_search_b <= STD_LOGIC_VECTOR(bubble_join_i_store_memdep_205_ethash_search_q(0 downto 0));

    -- i_sbar_unnamed_ethash_search36_ethash_search(BLACKBOX,60)@43
    -- in in_stall_exit@20000000
    -- out out_data_exit@173
    -- out out_stall_entry@20000000
    -- out out_valid_exit@173
    thei_sbar_unnamed_ethash_search36_ethash_search : i_sbar_unnamed_ethash_search36_ethash_search344
    PORT MAP (
        in_data_entry => bubble_select_i_store_memdep_205_ethash_search_b,
        in_stall_exit => SE_out_i_sbar_unnamed_ethash_search36_ethash_search_backStall,
        in_valid_entry => SE_out_i_store_memdep_205_ethash_search_V0,
        in_workgroup_size => in_barrier_unnamed_ethash_search36_wgs_workgroup_size,
        out_data_exit => i_sbar_unnamed_ethash_search36_ethash_search_out_data_exit,
        out_stall_entry => i_sbar_unnamed_ethash_search36_ethash_search_out_stall_entry,
        out_valid_exit => i_sbar_unnamed_ethash_search36_ethash_search_out_valid_exit,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_store_memdep_205_ethash_search(STALLENABLE,429)
    -- Valid signal propagation
    SE_out_i_store_memdep_205_ethash_search_V0 <= SE_out_i_store_memdep_205_ethash_search_wireValid;
    -- Backward Stall generation
    SE_out_i_store_memdep_205_ethash_search_backStall <= i_sbar_unnamed_ethash_search36_ethash_search_out_stall_entry or not (SE_out_i_store_memdep_205_ethash_search_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_store_memdep_205_ethash_search_wireValid <= i_store_memdep_205_ethash_search_out_o_valid;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- bubble_join_redist14_stall_entry_o18_12_fifo(BITJOIN,277)
    bubble_join_redist14_stall_entry_o18_12_fifo_q <= redist14_stall_entry_o18_12_fifo_data_out;

    -- bubble_select_redist14_stall_entry_o18_12_fifo(BITSELECT,278)
    bubble_select_redist14_stall_entry_o18_12_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist14_stall_entry_o18_12_fifo_q(63 downto 0));

    -- bubble_join_redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo(BITJOIN,397)
    bubble_join_redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_q <= redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_data_out;

    -- bubble_select_redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo(BITSELECT,398)
    bubble_select_redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_q(63 downto 0));

    -- bubble_join_redist1_stall_entry_o5_12_fifo(BITJOIN,238)
    bubble_join_redist1_stall_entry_o5_12_fifo_q <= redist1_stall_entry_o5_12_fifo_data_out;

    -- bubble_select_redist1_stall_entry_o5_12_fifo(BITSELECT,239)
    bubble_select_redist1_stall_entry_o5_12_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist1_stall_entry_o5_12_fifo_q(63 downto 0));

    -- i_arrayidx97_rm_ethash_search_ethash_search341_add_x(ADD,28)@12
    i_arrayidx97_rm_ethash_search_ethash_search341_add_x_a <= STD_LOGIC_VECTOR("0" & bubble_select_redist1_stall_entry_o5_12_fifo_b);
    i_arrayidx97_rm_ethash_search_ethash_search341_add_x_b <= STD_LOGIC_VECTOR("0" & bubble_select_redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_b);
    i_arrayidx97_rm_ethash_search_ethash_search341_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx97_rm_ethash_search_ethash_search341_add_x_a) + UNSIGNED(i_arrayidx97_rm_ethash_search_ethash_search341_add_x_b));
    i_arrayidx97_rm_ethash_search_ethash_search341_add_x_q <= i_arrayidx97_rm_ethash_search_ethash_search341_add_x_o(64 downto 0);

    -- i_arrayidx97_rm_ethash_search_ethash_search341_dupName_0_trunc_sel_x(BITSELECT,22)@12
    i_arrayidx97_rm_ethash_search_ethash_search341_dupName_0_trunc_sel_x_b <= i_arrayidx97_rm_ethash_search_ethash_search341_add_x_q(63 downto 0);

    -- i_store_memdep_205_ethash_search(BLACKBOX,62)@12
    -- in in_i_stall@20000000
    -- out out_memdep_205_avm_address@20000000
    -- out out_memdep_205_avm_burstcount@20000000
    -- out out_memdep_205_avm_byteenable@20000000
    -- out out_memdep_205_avm_enable@20000000
    -- out out_memdep_205_avm_read@20000000
    -- out out_memdep_205_avm_write@20000000
    -- out out_memdep_205_avm_writedata@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@43
    -- out out_o_writeack@43
    thei_store_memdep_205_ethash_search : i_store_memdep_205_ethash_search342
    PORT MAP (
        in_flush => in_flush,
        in_i_address => i_arrayidx97_rm_ethash_search_ethash_search341_dupName_0_trunc_sel_x_b,
        in_i_bitwiseor => bubble_select_redist14_stall_entry_o18_12_fifo_b,
        in_i_predicate => GND_q,
        in_i_stall => SE_out_i_store_memdep_205_ethash_search_backStall,
        in_i_valid => SE_out_redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_V0,
        in_i_writedata => bubble_select_i_sfc_c0_for_end91_ethash_search_c0_enter35_ethash_search_aunroll_x_b,
        in_memdep_205_avm_readdata => in_memdep_205_avm_readdata,
        in_memdep_205_avm_readdatavalid => in_memdep_205_avm_readdatavalid,
        in_memdep_205_avm_waitrequest => in_memdep_205_avm_waitrequest,
        in_memdep_205_avm_writeack => in_memdep_205_avm_writeack,
        out_memdep_205_avm_address => i_store_memdep_205_ethash_search_out_memdep_205_avm_address,
        out_memdep_205_avm_burstcount => i_store_memdep_205_ethash_search_out_memdep_205_avm_burstcount,
        out_memdep_205_avm_byteenable => i_store_memdep_205_ethash_search_out_memdep_205_avm_byteenable,
        out_memdep_205_avm_enable => i_store_memdep_205_ethash_search_out_memdep_205_avm_enable,
        out_memdep_205_avm_read => i_store_memdep_205_ethash_search_out_memdep_205_avm_read,
        out_memdep_205_avm_write => i_store_memdep_205_ethash_search_out_memdep_205_avm_write,
        out_memdep_205_avm_writedata => i_store_memdep_205_ethash_search_out_memdep_205_avm_writedata,
        out_o_stall => i_store_memdep_205_ethash_search_out_o_stall,
        out_o_valid => i_store_memdep_205_ethash_search_out_o_valid,
        out_o_writeack => i_store_memdep_205_ethash_search_out_o_writeack,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist14_stall_entry_o18_12_fifo(STALLENABLE,474)
    SE_out_redist14_stall_entry_o18_12_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist14_stall_entry_o18_12_fifo_fromReg0 <= (others => '0');
            SE_out_redist14_stall_entry_o18_12_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist14_stall_entry_o18_12_fifo_fromReg0 <= SE_out_redist14_stall_entry_o18_12_fifo_toReg0;
            -- Succesor 1
            SE_out_redist14_stall_entry_o18_12_fifo_fromReg1 <= SE_out_redist14_stall_entry_o18_12_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist14_stall_entry_o18_12_fifo_consumed0 <= (not (SE_out_redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_backStall) and SE_out_redist14_stall_entry_o18_12_fifo_wireValid) or SE_out_redist14_stall_entry_o18_12_fifo_fromReg0;
    SE_out_redist14_stall_entry_o18_12_fifo_consumed1 <= (not (redist15_stall_entry_o18_173_fifo_stall_out) and SE_out_redist14_stall_entry_o18_12_fifo_wireValid) or SE_out_redist14_stall_entry_o18_12_fifo_fromReg1;
    -- Consuming
    SE_out_redist14_stall_entry_o18_12_fifo_StallValid <= SE_out_redist14_stall_entry_o18_12_fifo_backStall and SE_out_redist14_stall_entry_o18_12_fifo_wireValid;
    SE_out_redist14_stall_entry_o18_12_fifo_toReg0 <= SE_out_redist14_stall_entry_o18_12_fifo_StallValid and SE_out_redist14_stall_entry_o18_12_fifo_consumed0;
    SE_out_redist14_stall_entry_o18_12_fifo_toReg1 <= SE_out_redist14_stall_entry_o18_12_fifo_StallValid and SE_out_redist14_stall_entry_o18_12_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist14_stall_entry_o18_12_fifo_or0 <= SE_out_redist14_stall_entry_o18_12_fifo_consumed0;
    SE_out_redist14_stall_entry_o18_12_fifo_wireStall <= not (SE_out_redist14_stall_entry_o18_12_fifo_consumed1 and SE_out_redist14_stall_entry_o18_12_fifo_or0);
    SE_out_redist14_stall_entry_o18_12_fifo_backStall <= SE_out_redist14_stall_entry_o18_12_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist14_stall_entry_o18_12_fifo_V0 <= SE_out_redist14_stall_entry_o18_12_fifo_wireValid and not (SE_out_redist14_stall_entry_o18_12_fifo_fromReg0);
    SE_out_redist14_stall_entry_o18_12_fifo_V1 <= SE_out_redist14_stall_entry_o18_12_fifo_wireValid and not (SE_out_redist14_stall_entry_o18_12_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist14_stall_entry_o18_12_fifo_wireValid <= redist14_stall_entry_o18_12_fifo_valid_out;

    -- SE_out_redist1_stall_entry_o5_12_fifo(STALLENABLE,448)
    SE_out_redist1_stall_entry_o5_12_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist1_stall_entry_o5_12_fifo_fromReg0 <= (others => '0');
            SE_out_redist1_stall_entry_o5_12_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist1_stall_entry_o5_12_fifo_fromReg0 <= SE_out_redist1_stall_entry_o5_12_fifo_toReg0;
            -- Succesor 1
            SE_out_redist1_stall_entry_o5_12_fifo_fromReg1 <= SE_out_redist1_stall_entry_o5_12_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist1_stall_entry_o5_12_fifo_consumed0 <= (not (SE_out_redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_backStall) and SE_out_redist1_stall_entry_o5_12_fifo_wireValid) or SE_out_redist1_stall_entry_o5_12_fifo_fromReg0;
    SE_out_redist1_stall_entry_o5_12_fifo_consumed1 <= (not (redist2_stall_entry_o5_173_fifo_stall_out) and SE_out_redist1_stall_entry_o5_12_fifo_wireValid) or SE_out_redist1_stall_entry_o5_12_fifo_fromReg1;
    -- Consuming
    SE_out_redist1_stall_entry_o5_12_fifo_StallValid <= SE_out_redist1_stall_entry_o5_12_fifo_backStall and SE_out_redist1_stall_entry_o5_12_fifo_wireValid;
    SE_out_redist1_stall_entry_o5_12_fifo_toReg0 <= SE_out_redist1_stall_entry_o5_12_fifo_StallValid and SE_out_redist1_stall_entry_o5_12_fifo_consumed0;
    SE_out_redist1_stall_entry_o5_12_fifo_toReg1 <= SE_out_redist1_stall_entry_o5_12_fifo_StallValid and SE_out_redist1_stall_entry_o5_12_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist1_stall_entry_o5_12_fifo_or0 <= SE_out_redist1_stall_entry_o5_12_fifo_consumed0;
    SE_out_redist1_stall_entry_o5_12_fifo_wireStall <= not (SE_out_redist1_stall_entry_o5_12_fifo_consumed1 and SE_out_redist1_stall_entry_o5_12_fifo_or0);
    SE_out_redist1_stall_entry_o5_12_fifo_backStall <= SE_out_redist1_stall_entry_o5_12_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist1_stall_entry_o5_12_fifo_V0 <= SE_out_redist1_stall_entry_o5_12_fifo_wireValid and not (SE_out_redist1_stall_entry_o5_12_fifo_fromReg0);
    SE_out_redist1_stall_entry_o5_12_fifo_V1 <= SE_out_redist1_stall_entry_o5_12_fifo_wireValid and not (SE_out_redist1_stall_entry_o5_12_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist1_stall_entry_o5_12_fifo_wireValid <= redist1_stall_entry_o5_12_fifo_valid_out;

    -- SE_out_redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo(STALLENABLE,554)
    -- Valid signal propagation
    SE_out_redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_V0 <= SE_out_redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_backStall <= i_store_memdep_205_ethash_search_out_o_stall or not (SE_out_redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_and0 <= redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_valid_out;
    SE_out_redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_and1 <= SE_out_redist1_stall_entry_o5_12_fifo_V0 and SE_out_redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_and0;
    SE_out_redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_and2 <= i_sfc_c0_for_end91_ethash_search_c0_enter35_ethash_search_aunroll_x_out_o_valid and SE_out_redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_and1;
    SE_out_redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_wireValid <= SE_out_redist14_stall_entry_o18_12_fifo_V0 and SE_out_redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_and2;

    -- redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo(STALLFIFO,212)
    redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_valid_in <= SE_stall_entry_V44;
    redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_stall_in <= SE_out_redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_backStall;
    redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_data_in <= i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b;
    redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_valid_in_bitsignaltemp <= redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_valid_in(0);
    redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_stall_in_bitsignaltemp <= redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_stall_in(0);
    redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_valid_out(0) <= redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_valid_out_bitsignaltemp;
    redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_stall_out(0) <= redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_stall_out_bitsignaltemp;
    theredist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 13,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_valid_in_bitsignaltemp,
        stall_in => redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_stall_in_bitsignaltemp,
        data_in => i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b,
        valid_out => redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_valid_out_bitsignaltemp,
        stall_out => redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_stall_out_bitsignaltemp,
        data_out => redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_in_redist45_i_acl_1416_ethash_search_q_130_fifo(STALLENABLE,535)
    -- Valid signal propagation
    SE_in_redist45_i_acl_1416_ethash_search_q_130_fifo_V0 <= SE_in_redist45_i_acl_1416_ethash_search_q_130_fifo_wireValid;
    -- Backward Stall generation
    SE_in_redist45_i_acl_1416_ethash_search_q_130_fifo_backStall <= redist45_i_acl_1416_ethash_search_q_130_fifo_stall_out or not (SE_in_redist45_i_acl_1416_ethash_search_q_130_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_in_redist45_i_acl_1416_ethash_search_q_130_fifo_wireValid <= SE_i_acl_1416_ethash_search_V0;

    -- SE_in_redist46_i_acl_1415_ethash_search_q_130_fifo(STALLENABLE,537)
    -- Valid signal propagation
    SE_in_redist46_i_acl_1415_ethash_search_q_130_fifo_V0 <= SE_in_redist46_i_acl_1415_ethash_search_q_130_fifo_wireValid;
    -- Backward Stall generation
    SE_in_redist46_i_acl_1415_ethash_search_q_130_fifo_backStall <= redist46_i_acl_1415_ethash_search_q_130_fifo_stall_out or not (SE_in_redist46_i_acl_1415_ethash_search_q_130_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_in_redist46_i_acl_1415_ethash_search_q_130_fifo_wireValid <= SE_i_acl_1415_ethash_search_V0;

    -- SE_out_redist23_stall_entry_o26_205_fifo(STALLENABLE,492)
    -- Valid signal propagation
    SE_out_redist23_stall_entry_o26_205_fifo_V0 <= SE_out_redist23_stall_entry_o26_205_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist23_stall_entry_o26_205_fifo_backStall <= SE_i_acl_1415_ethash_search_backStall or not (SE_out_redist23_stall_entry_o26_205_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist23_stall_entry_o26_205_fifo_wireValid <= redist23_stall_entry_o26_205_fifo_valid_out;

    -- SE_i_acl_1415_ethash_search(STALLENABLE,419)
    -- Valid signal propagation
    SE_i_acl_1415_ethash_search_V0 <= SE_i_acl_1415_ethash_search_R_v_0;
    -- Stall signal propagation
    SE_i_acl_1415_ethash_search_s_tv_0 <= SE_in_redist46_i_acl_1415_ethash_search_q_130_fifo_backStall and SE_i_acl_1415_ethash_search_R_v_0;
    -- Backward Enable generation
    SE_i_acl_1415_ethash_search_backEN <= not (SE_i_acl_1415_ethash_search_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_acl_1415_ethash_search_and0 <= SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_V1 and SE_i_acl_1415_ethash_search_backEN;
    SE_i_acl_1415_ethash_search_and1 <= SE_out_redist8_stall_entry_o10_205_fifo_V2 and SE_i_acl_1415_ethash_search_and0;
    SE_i_acl_1415_ethash_search_v_s_0 <= SE_out_redist23_stall_entry_o26_205_fifo_V0 and SE_i_acl_1415_ethash_search_and1;
    -- Backward Stall generation
    SE_i_acl_1415_ethash_search_backStall <= not (SE_i_acl_1415_ethash_search_v_s_0);
    SE_i_acl_1415_ethash_search_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_acl_1415_ethash_search_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_acl_1415_ethash_search_backEN = "0") THEN
                SE_i_acl_1415_ethash_search_R_v_0 <= SE_i_acl_1415_ethash_search_R_v_0 and SE_i_acl_1415_ethash_search_s_tv_0;
            ELSE
                SE_i_acl_1415_ethash_search_R_v_0 <= SE_i_acl_1415_ethash_search_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_in_redist47_i_acl_1414_ethash_search_q_130_fifo(STALLENABLE,539)
    -- Valid signal propagation
    SE_in_redist47_i_acl_1414_ethash_search_q_130_fifo_V0 <= SE_in_redist47_i_acl_1414_ethash_search_q_130_fifo_wireValid;
    -- Backward Stall generation
    SE_in_redist47_i_acl_1414_ethash_search_q_130_fifo_backStall <= redist47_i_acl_1414_ethash_search_q_130_fifo_stall_out or not (SE_in_redist47_i_acl_1414_ethash_search_q_130_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_in_redist47_i_acl_1414_ethash_search_q_130_fifo_wireValid <= SE_i_acl_1414_ethash_search_V0;

    -- SE_out_redist35_stall_entry_o39_205_fifo(STALLENABLE,516)
    -- Valid signal propagation
    SE_out_redist35_stall_entry_o39_205_fifo_V0 <= SE_out_redist35_stall_entry_o39_205_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist35_stall_entry_o39_205_fifo_backStall <= SE_i_acl_1414_ethash_search_backStall or not (SE_out_redist35_stall_entry_o39_205_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist35_stall_entry_o39_205_fifo_wireValid <= redist35_stall_entry_o39_205_fifo_valid_out;

    -- SE_i_acl_1414_ethash_search(STALLENABLE,418)
    -- Valid signal propagation
    SE_i_acl_1414_ethash_search_V0 <= SE_i_acl_1414_ethash_search_R_v_0;
    -- Stall signal propagation
    SE_i_acl_1414_ethash_search_s_tv_0 <= SE_in_redist47_i_acl_1414_ethash_search_q_130_fifo_backStall and SE_i_acl_1414_ethash_search_R_v_0;
    -- Backward Enable generation
    SE_i_acl_1414_ethash_search_backEN <= not (SE_i_acl_1414_ethash_search_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_acl_1414_ethash_search_and0 <= SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_V4 and SE_i_acl_1414_ethash_search_backEN;
    SE_i_acl_1414_ethash_search_and1 <= SE_out_redist8_stall_entry_o10_205_fifo_V1 and SE_i_acl_1414_ethash_search_and0;
    SE_i_acl_1414_ethash_search_v_s_0 <= SE_out_redist35_stall_entry_o39_205_fifo_V0 and SE_i_acl_1414_ethash_search_and1;
    -- Backward Stall generation
    SE_i_acl_1414_ethash_search_backStall <= not (SE_i_acl_1414_ethash_search_v_s_0);
    SE_i_acl_1414_ethash_search_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_acl_1414_ethash_search_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_acl_1414_ethash_search_backEN = "0") THEN
                SE_i_acl_1414_ethash_search_R_v_0 <= SE_i_acl_1414_ethash_search_R_v_0 and SE_i_acl_1414_ethash_search_s_tv_0;
            ELSE
                SE_i_acl_1414_ethash_search_R_v_0 <= SE_i_acl_1414_ethash_search_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_in_redist48_i_acl_1413_ethash_search_q_130_fifo(STALLENABLE,541)
    -- Valid signal propagation
    SE_in_redist48_i_acl_1413_ethash_search_q_130_fifo_V0 <= SE_in_redist48_i_acl_1413_ethash_search_q_130_fifo_wireValid;
    -- Backward Stall generation
    SE_in_redist48_i_acl_1413_ethash_search_q_130_fifo_backStall <= redist48_i_acl_1413_ethash_search_q_130_fifo_stall_out or not (SE_in_redist48_i_acl_1413_ethash_search_q_130_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_in_redist48_i_acl_1413_ethash_search_q_130_fifo_wireValid <= SE_i_acl_1413_ethash_search_V0;

    -- SE_out_redist22_stall_entry_o25_205_fifo(STALLENABLE,490)
    -- Valid signal propagation
    SE_out_redist22_stall_entry_o25_205_fifo_V0 <= SE_out_redist22_stall_entry_o25_205_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist22_stall_entry_o25_205_fifo_backStall <= SE_i_acl_1413_ethash_search_backStall or not (SE_out_redist22_stall_entry_o25_205_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist22_stall_entry_o25_205_fifo_wireValid <= redist22_stall_entry_o25_205_fifo_valid_out;

    -- SE_i_acl_1413_ethash_search(STALLENABLE,417)
    -- Valid signal propagation
    SE_i_acl_1413_ethash_search_V0 <= SE_i_acl_1413_ethash_search_R_v_0;
    -- Stall signal propagation
    SE_i_acl_1413_ethash_search_s_tv_0 <= SE_in_redist48_i_acl_1413_ethash_search_q_130_fifo_backStall and SE_i_acl_1413_ethash_search_R_v_0;
    -- Backward Enable generation
    SE_i_acl_1413_ethash_search_backEN <= not (SE_i_acl_1413_ethash_search_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_acl_1413_ethash_search_and0 <= SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_V3 and SE_i_acl_1413_ethash_search_backEN;
    SE_i_acl_1413_ethash_search_and1 <= SE_out_redist8_stall_entry_o10_205_fifo_V0 and SE_i_acl_1413_ethash_search_and0;
    SE_i_acl_1413_ethash_search_v_s_0 <= SE_out_redist22_stall_entry_o25_205_fifo_V0 and SE_i_acl_1413_ethash_search_and1;
    -- Backward Stall generation
    SE_i_acl_1413_ethash_search_backStall <= not (SE_i_acl_1413_ethash_search_v_s_0);
    SE_i_acl_1413_ethash_search_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_acl_1413_ethash_search_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_acl_1413_ethash_search_backEN = "0") THEN
                SE_i_acl_1413_ethash_search_R_v_0 <= SE_i_acl_1413_ethash_search_R_v_0 and SE_i_acl_1413_ethash_search_s_tv_0;
            ELSE
                SE_i_acl_1413_ethash_search_R_v_0 <= SE_i_acl_1413_ethash_search_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- redist8_stall_entry_o10_205_fifo(STALLFIFO,166)
    redist8_stall_entry_o10_205_fifo_valid_in <= SE_out_redist7_stall_entry_o10_173_fifo_V1;
    redist8_stall_entry_o10_205_fifo_stall_in <= SE_out_redist8_stall_entry_o10_205_fifo_backStall;
    redist8_stall_entry_o10_205_fifo_data_in <= bubble_select_redist7_stall_entry_o10_173_fifo_b;
    redist8_stall_entry_o10_205_fifo_valid_in_bitsignaltemp <= redist8_stall_entry_o10_205_fifo_valid_in(0);
    redist8_stall_entry_o10_205_fifo_stall_in_bitsignaltemp <= redist8_stall_entry_o10_205_fifo_stall_in(0);
    redist8_stall_entry_o10_205_fifo_valid_out(0) <= redist8_stall_entry_o10_205_fifo_valid_out_bitsignaltemp;
    redist8_stall_entry_o10_205_fifo_stall_out(0) <= redist8_stall_entry_o10_205_fifo_stall_out_bitsignaltemp;
    theredist8_stall_entry_o10_205_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 33,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist8_stall_entry_o10_205_fifo_valid_in_bitsignaltemp,
        stall_in => redist8_stall_entry_o10_205_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist7_stall_entry_o10_173_fifo_b,
        valid_out => redist8_stall_entry_o10_205_fifo_valid_out_bitsignaltemp,
        stall_out => redist8_stall_entry_o10_205_fifo_stall_out_bitsignaltemp,
        data_out => redist8_stall_entry_o10_205_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist8_stall_entry_o10_205_fifo(STALLENABLE,462)
    SE_out_redist8_stall_entry_o10_205_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist8_stall_entry_o10_205_fifo_fromReg0 <= (others => '0');
            SE_out_redist8_stall_entry_o10_205_fifo_fromReg1 <= (others => '0');
            SE_out_redist8_stall_entry_o10_205_fifo_fromReg2 <= (others => '0');
            SE_out_redist8_stall_entry_o10_205_fifo_fromReg3 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist8_stall_entry_o10_205_fifo_fromReg0 <= SE_out_redist8_stall_entry_o10_205_fifo_toReg0;
            -- Succesor 1
            SE_out_redist8_stall_entry_o10_205_fifo_fromReg1 <= SE_out_redist8_stall_entry_o10_205_fifo_toReg1;
            -- Succesor 2
            SE_out_redist8_stall_entry_o10_205_fifo_fromReg2 <= SE_out_redist8_stall_entry_o10_205_fifo_toReg2;
            -- Succesor 3
            SE_out_redist8_stall_entry_o10_205_fifo_fromReg3 <= SE_out_redist8_stall_entry_o10_205_fifo_toReg3;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist8_stall_entry_o10_205_fifo_consumed0 <= (not (SE_i_acl_1413_ethash_search_backStall) and SE_out_redist8_stall_entry_o10_205_fifo_wireValid) or SE_out_redist8_stall_entry_o10_205_fifo_fromReg0;
    SE_out_redist8_stall_entry_o10_205_fifo_consumed1 <= (not (SE_i_acl_1414_ethash_search_backStall) and SE_out_redist8_stall_entry_o10_205_fifo_wireValid) or SE_out_redist8_stall_entry_o10_205_fifo_fromReg1;
    SE_out_redist8_stall_entry_o10_205_fifo_consumed2 <= (not (SE_i_acl_1415_ethash_search_backStall) and SE_out_redist8_stall_entry_o10_205_fifo_wireValid) or SE_out_redist8_stall_entry_o10_205_fifo_fromReg2;
    SE_out_redist8_stall_entry_o10_205_fifo_consumed3 <= (not (SE_i_acl_1416_ethash_search_backStall) and SE_out_redist8_stall_entry_o10_205_fifo_wireValid) or SE_out_redist8_stall_entry_o10_205_fifo_fromReg3;
    -- Consuming
    SE_out_redist8_stall_entry_o10_205_fifo_StallValid <= SE_out_redist8_stall_entry_o10_205_fifo_backStall and SE_out_redist8_stall_entry_o10_205_fifo_wireValid;
    SE_out_redist8_stall_entry_o10_205_fifo_toReg0 <= SE_out_redist8_stall_entry_o10_205_fifo_StallValid and SE_out_redist8_stall_entry_o10_205_fifo_consumed0;
    SE_out_redist8_stall_entry_o10_205_fifo_toReg1 <= SE_out_redist8_stall_entry_o10_205_fifo_StallValid and SE_out_redist8_stall_entry_o10_205_fifo_consumed1;
    SE_out_redist8_stall_entry_o10_205_fifo_toReg2 <= SE_out_redist8_stall_entry_o10_205_fifo_StallValid and SE_out_redist8_stall_entry_o10_205_fifo_consumed2;
    SE_out_redist8_stall_entry_o10_205_fifo_toReg3 <= SE_out_redist8_stall_entry_o10_205_fifo_StallValid and SE_out_redist8_stall_entry_o10_205_fifo_consumed3;
    -- Backward Stall generation
    SE_out_redist8_stall_entry_o10_205_fifo_or0 <= SE_out_redist8_stall_entry_o10_205_fifo_consumed0;
    SE_out_redist8_stall_entry_o10_205_fifo_or1 <= SE_out_redist8_stall_entry_o10_205_fifo_consumed1 and SE_out_redist8_stall_entry_o10_205_fifo_or0;
    SE_out_redist8_stall_entry_o10_205_fifo_or2 <= SE_out_redist8_stall_entry_o10_205_fifo_consumed2 and SE_out_redist8_stall_entry_o10_205_fifo_or1;
    SE_out_redist8_stall_entry_o10_205_fifo_wireStall <= not (SE_out_redist8_stall_entry_o10_205_fifo_consumed3 and SE_out_redist8_stall_entry_o10_205_fifo_or2);
    SE_out_redist8_stall_entry_o10_205_fifo_backStall <= SE_out_redist8_stall_entry_o10_205_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist8_stall_entry_o10_205_fifo_V0 <= SE_out_redist8_stall_entry_o10_205_fifo_wireValid and not (SE_out_redist8_stall_entry_o10_205_fifo_fromReg0);
    SE_out_redist8_stall_entry_o10_205_fifo_V1 <= SE_out_redist8_stall_entry_o10_205_fifo_wireValid and not (SE_out_redist8_stall_entry_o10_205_fifo_fromReg1);
    SE_out_redist8_stall_entry_o10_205_fifo_V2 <= SE_out_redist8_stall_entry_o10_205_fifo_wireValid and not (SE_out_redist8_stall_entry_o10_205_fifo_fromReg2);
    SE_out_redist8_stall_entry_o10_205_fifo_V3 <= SE_out_redist8_stall_entry_o10_205_fifo_wireValid and not (SE_out_redist8_stall_entry_o10_205_fifo_fromReg3);
    -- Computing multiple Valid(s)
    SE_out_redist8_stall_entry_o10_205_fifo_wireValid <= redist8_stall_entry_o10_205_fifo_valid_out;

    -- SE_i_acl_1416_ethash_search(STALLENABLE,420)
    -- Valid signal propagation
    SE_i_acl_1416_ethash_search_V0 <= SE_i_acl_1416_ethash_search_R_v_0;
    -- Stall signal propagation
    SE_i_acl_1416_ethash_search_s_tv_0 <= SE_in_redist45_i_acl_1416_ethash_search_q_130_fifo_backStall and SE_i_acl_1416_ethash_search_R_v_0;
    -- Backward Enable generation
    SE_i_acl_1416_ethash_search_backEN <= not (SE_i_acl_1416_ethash_search_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_acl_1416_ethash_search_and0 <= SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_V2 and SE_i_acl_1416_ethash_search_backEN;
    SE_i_acl_1416_ethash_search_and1 <= SE_out_redist8_stall_entry_o10_205_fifo_V3 and SE_i_acl_1416_ethash_search_and0;
    SE_i_acl_1416_ethash_search_v_s_0 <= SE_out_redist36_stall_entry_o40_205_fifo_V0 and SE_i_acl_1416_ethash_search_and1;
    -- Backward Stall generation
    SE_i_acl_1416_ethash_search_backStall <= not (SE_i_acl_1416_ethash_search_v_s_0);
    SE_i_acl_1416_ethash_search_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_acl_1416_ethash_search_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_acl_1416_ethash_search_backEN = "0") THEN
                SE_i_acl_1416_ethash_search_R_v_0 <= SE_i_acl_1416_ethash_search_R_v_0 and SE_i_acl_1416_ethash_search_s_tv_0;
            ELSE
                SE_i_acl_1416_ethash_search_R_v_0 <= SE_i_acl_1416_ethash_search_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_out_redist36_stall_entry_o40_205_fifo(STALLENABLE,518)
    -- Valid signal propagation
    SE_out_redist36_stall_entry_o40_205_fifo_V0 <= SE_out_redist36_stall_entry_o40_205_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist36_stall_entry_o40_205_fifo_backStall <= SE_i_acl_1416_ethash_search_backStall or not (SE_out_redist36_stall_entry_o40_205_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist36_stall_entry_o40_205_fifo_wireValid <= redist36_stall_entry_o40_205_fifo_valid_out;

    -- redist36_stall_entry_o40_205_fifo(STALLFIFO,194)
    redist36_stall_entry_o40_205_fifo_valid_in <= SE_stall_entry_V34;
    redist36_stall_entry_o40_205_fifo_stall_in <= SE_out_redist36_stall_entry_o40_205_fifo_backStall;
    redist36_stall_entry_o40_205_fifo_data_in <= bubble_select_stall_entry_ll;
    redist36_stall_entry_o40_205_fifo_valid_in_bitsignaltemp <= redist36_stall_entry_o40_205_fifo_valid_in(0);
    redist36_stall_entry_o40_205_fifo_stall_in_bitsignaltemp <= redist36_stall_entry_o40_205_fifo_stall_in(0);
    redist36_stall_entry_o40_205_fifo_valid_out(0) <= redist36_stall_entry_o40_205_fifo_valid_out_bitsignaltemp;
    redist36_stall_entry_o40_205_fifo_stall_out(0) <= redist36_stall_entry_o40_205_fifo_stall_out_bitsignaltemp;
    theredist36_stall_entry_o40_205_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 206,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist36_stall_entry_o40_205_fifo_valid_in_bitsignaltemp,
        stall_in => redist36_stall_entry_o40_205_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_ll,
        valid_out => redist36_stall_entry_o40_205_fifo_valid_out_bitsignaltemp,
        stall_out => redist36_stall_entry_o40_205_fifo_stall_out_bitsignaltemp,
        data_out => redist36_stall_entry_o40_205_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist35_stall_entry_o39_205_fifo(STALLFIFO,193)
    redist35_stall_entry_o39_205_fifo_valid_in <= SE_stall_entry_V33;
    redist35_stall_entry_o39_205_fifo_stall_in <= SE_out_redist35_stall_entry_o39_205_fifo_backStall;
    redist35_stall_entry_o39_205_fifo_data_in <= bubble_select_stall_entry_kk;
    redist35_stall_entry_o39_205_fifo_valid_in_bitsignaltemp <= redist35_stall_entry_o39_205_fifo_valid_in(0);
    redist35_stall_entry_o39_205_fifo_stall_in_bitsignaltemp <= redist35_stall_entry_o39_205_fifo_stall_in(0);
    redist35_stall_entry_o39_205_fifo_valid_out(0) <= redist35_stall_entry_o39_205_fifo_valid_out_bitsignaltemp;
    redist35_stall_entry_o39_205_fifo_stall_out(0) <= redist35_stall_entry_o39_205_fifo_stall_out_bitsignaltemp;
    theredist35_stall_entry_o39_205_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 206,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist35_stall_entry_o39_205_fifo_valid_in_bitsignaltemp,
        stall_in => redist35_stall_entry_o39_205_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_kk,
        valid_out => redist35_stall_entry_o39_205_fifo_valid_out_bitsignaltemp,
        stall_out => redist35_stall_entry_o39_205_fifo_stall_out_bitsignaltemp,
        data_out => redist35_stall_entry_o39_205_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist23_stall_entry_o26_205_fifo(STALLFIFO,181)
    redist23_stall_entry_o26_205_fifo_valid_in <= SE_stall_entry_V21;
    redist23_stall_entry_o26_205_fifo_stall_in <= SE_out_redist23_stall_entry_o26_205_fifo_backStall;
    redist23_stall_entry_o26_205_fifo_data_in <= bubble_select_stall_entry_x;
    redist23_stall_entry_o26_205_fifo_valid_in_bitsignaltemp <= redist23_stall_entry_o26_205_fifo_valid_in(0);
    redist23_stall_entry_o26_205_fifo_stall_in_bitsignaltemp <= redist23_stall_entry_o26_205_fifo_stall_in(0);
    redist23_stall_entry_o26_205_fifo_valid_out(0) <= redist23_stall_entry_o26_205_fifo_valid_out_bitsignaltemp;
    redist23_stall_entry_o26_205_fifo_stall_out(0) <= redist23_stall_entry_o26_205_fifo_stall_out_bitsignaltemp;
    theredist23_stall_entry_o26_205_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 206,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist23_stall_entry_o26_205_fifo_valid_in_bitsignaltemp,
        stall_in => redist23_stall_entry_o26_205_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_x,
        valid_out => redist23_stall_entry_o26_205_fifo_valid_out_bitsignaltemp,
        stall_out => redist23_stall_entry_o26_205_fifo_stall_out_bitsignaltemp,
        data_out => redist23_stall_entry_o26_205_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist22_stall_entry_o25_205_fifo(STALLFIFO,180)
    redist22_stall_entry_o25_205_fifo_valid_in <= SE_stall_entry_V20;
    redist22_stall_entry_o25_205_fifo_stall_in <= SE_out_redist22_stall_entry_o25_205_fifo_backStall;
    redist22_stall_entry_o25_205_fifo_data_in <= bubble_select_stall_entry_w;
    redist22_stall_entry_o25_205_fifo_valid_in_bitsignaltemp <= redist22_stall_entry_o25_205_fifo_valid_in(0);
    redist22_stall_entry_o25_205_fifo_stall_in_bitsignaltemp <= redist22_stall_entry_o25_205_fifo_stall_in(0);
    redist22_stall_entry_o25_205_fifo_valid_out(0) <= redist22_stall_entry_o25_205_fifo_valid_out_bitsignaltemp;
    redist22_stall_entry_o25_205_fifo_stall_out(0) <= redist22_stall_entry_o25_205_fifo_stall_out_bitsignaltemp;
    theredist22_stall_entry_o25_205_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 206,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist22_stall_entry_o25_205_fifo_valid_in_bitsignaltemp,
        stall_in => redist22_stall_entry_o25_205_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_w,
        valid_out => redist22_stall_entry_o25_205_fifo_valid_out_bitsignaltemp,
        stall_out => redist22_stall_entry_o25_205_fifo_stall_out_bitsignaltemp,
        data_out => redist22_stall_entry_o25_205_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist14_stall_entry_o18_12_fifo(STALLFIFO,172)
    redist14_stall_entry_o18_12_fifo_valid_in <= SE_stall_entry_V13;
    redist14_stall_entry_o18_12_fifo_stall_in <= SE_out_redist14_stall_entry_o18_12_fifo_backStall;
    redist14_stall_entry_o18_12_fifo_data_in <= bubble_select_stall_entry_p;
    redist14_stall_entry_o18_12_fifo_valid_in_bitsignaltemp <= redist14_stall_entry_o18_12_fifo_valid_in(0);
    redist14_stall_entry_o18_12_fifo_stall_in_bitsignaltemp <= redist14_stall_entry_o18_12_fifo_stall_in(0);
    redist14_stall_entry_o18_12_fifo_valid_out(0) <= redist14_stall_entry_o18_12_fifo_valid_out_bitsignaltemp;
    redist14_stall_entry_o18_12_fifo_stall_out(0) <= redist14_stall_entry_o18_12_fifo_stall_out_bitsignaltemp;
    theredist14_stall_entry_o18_12_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 13,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist14_stall_entry_o18_12_fifo_valid_in_bitsignaltemp,
        stall_in => redist14_stall_entry_o18_12_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_p,
        valid_out => redist14_stall_entry_o18_12_fifo_valid_out_bitsignaltemp,
        stall_out => redist14_stall_entry_o18_12_fifo_stall_out_bitsignaltemp,
        data_out => redist14_stall_entry_o18_12_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist9_stall_entry_o11_173_fifo(STALLFIFO,167)
    redist9_stall_entry_o11_173_fifo_valid_in <= SE_stall_entry_V8;
    redist9_stall_entry_o11_173_fifo_stall_in <= SE_out_redist9_stall_entry_o11_173_fifo_backStall;
    redist9_stall_entry_o11_173_fifo_data_in <= bubble_select_stall_entry_i;
    redist9_stall_entry_o11_173_fifo_valid_in_bitsignaltemp <= redist9_stall_entry_o11_173_fifo_valid_in(0);
    redist9_stall_entry_o11_173_fifo_stall_in_bitsignaltemp <= redist9_stall_entry_o11_173_fifo_stall_in(0);
    redist9_stall_entry_o11_173_fifo_valid_out(0) <= redist9_stall_entry_o11_173_fifo_valid_out_bitsignaltemp;
    redist9_stall_entry_o11_173_fifo_stall_out(0) <= redist9_stall_entry_o11_173_fifo_stall_out_bitsignaltemp;
    theredist9_stall_entry_o11_173_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 174,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist9_stall_entry_o11_173_fifo_valid_in_bitsignaltemp,
        stall_in => redist9_stall_entry_o11_173_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_i,
        valid_out => redist9_stall_entry_o11_173_fifo_valid_out_bitsignaltemp,
        stall_out => redist9_stall_entry_o11_173_fifo_stall_out_bitsignaltemp,
        data_out => redist9_stall_entry_o11_173_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist7_stall_entry_o10_173_fifo(STALLFIFO,165)
    redist7_stall_entry_o10_173_fifo_valid_in <= SE_stall_entry_V7;
    redist7_stall_entry_o10_173_fifo_stall_in <= SE_out_redist7_stall_entry_o10_173_fifo_backStall;
    redist7_stall_entry_o10_173_fifo_data_in <= bubble_select_stall_entry_h;
    redist7_stall_entry_o10_173_fifo_valid_in_bitsignaltemp <= redist7_stall_entry_o10_173_fifo_valid_in(0);
    redist7_stall_entry_o10_173_fifo_stall_in_bitsignaltemp <= redist7_stall_entry_o10_173_fifo_stall_in(0);
    redist7_stall_entry_o10_173_fifo_valid_out(0) <= redist7_stall_entry_o10_173_fifo_valid_out_bitsignaltemp;
    redist7_stall_entry_o10_173_fifo_stall_out(0) <= redist7_stall_entry_o10_173_fifo_stall_out_bitsignaltemp;
    theredist7_stall_entry_o10_173_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 174,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist7_stall_entry_o10_173_fifo_valid_in_bitsignaltemp,
        stall_in => redist7_stall_entry_o10_173_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_h,
        valid_out => redist7_stall_entry_o10_173_fifo_valid_out_bitsignaltemp,
        stall_out => redist7_stall_entry_o10_173_fifo_stall_out_bitsignaltemp,
        data_out => redist7_stall_entry_o10_173_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist1_stall_entry_o5_12_fifo(STALLFIFO,159)
    redist1_stall_entry_o5_12_fifo_valid_in <= SE_stall_entry_V2;
    redist1_stall_entry_o5_12_fifo_stall_in <= SE_out_redist1_stall_entry_o5_12_fifo_backStall;
    redist1_stall_entry_o5_12_fifo_data_in <= bubble_select_stall_entry_c;
    redist1_stall_entry_o5_12_fifo_valid_in_bitsignaltemp <= redist1_stall_entry_o5_12_fifo_valid_in(0);
    redist1_stall_entry_o5_12_fifo_stall_in_bitsignaltemp <= redist1_stall_entry_o5_12_fifo_stall_in(0);
    redist1_stall_entry_o5_12_fifo_valid_out(0) <= redist1_stall_entry_o5_12_fifo_valid_out_bitsignaltemp;
    redist1_stall_entry_o5_12_fifo_stall_out(0) <= redist1_stall_entry_o5_12_fifo_stall_out_bitsignaltemp;
    theredist1_stall_entry_o5_12_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 13,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist1_stall_entry_o5_12_fifo_valid_in_bitsignaltemp,
        stall_in => redist1_stall_entry_o5_12_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_c,
        valid_out => redist1_stall_entry_o5_12_fifo_valid_out_bitsignaltemp,
        stall_out => redist1_stall_entry_o5_12_fifo_stall_out_bitsignaltemp,
        data_out => redist1_stall_entry_o5_12_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- i_sfc_c0_for_end91_ethash_search_c0_enter35_ethash_search_aunroll_x(BLACKBOX,34)@0
    -- in in_i_stall@20000000
    -- out out_c0_exit41_0@12
    -- out out_c0_exit41_1@12
    -- out out_o_stall@20000000
    -- out out_o_valid@12
    thei_sfc_c0_for_end91_ethash_search_c0_enter35_ethash_search_aunroll_x : i_sfc_c0_for_end91_ethash_search_c0_enter35_ethash_search
    PORT MAP (
        in_c0_eni434_0 => GND_q,
        in_c0_eni434_1 => bubble_select_stall_entry_cc,
        in_c0_eni434_2 => bubble_select_stall_entry_pp,
        in_c0_eni434_3 => bubble_select_stall_entry_qq,
        in_c0_eni434_4 => bubble_select_stall_entry_rr,
        in_i_stall => SE_out_redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_backStall,
        in_i_valid => SE_stall_entry_V0,
        out_c0_exit41_1 => i_sfc_c0_for_end91_ethash_search_c0_enter35_ethash_search_aunroll_x_out_c0_exit41_1,
        out_o_stall => i_sfc_c0_for_end91_ethash_search_c0_enter35_ethash_search_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_for_end91_ethash_search_c0_enter35_ethash_search_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- SE_stall_entry(STALLENABLE,430)
    SE_stall_entry_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_stall_entry_fromReg0 <= (others => '0');
            SE_stall_entry_fromReg1 <= (others => '0');
            SE_stall_entry_fromReg2 <= (others => '0');
            SE_stall_entry_fromReg3 <= (others => '0');
            SE_stall_entry_fromReg4 <= (others => '0');
            SE_stall_entry_fromReg5 <= (others => '0');
            SE_stall_entry_fromReg6 <= (others => '0');
            SE_stall_entry_fromReg7 <= (others => '0');
            SE_stall_entry_fromReg8 <= (others => '0');
            SE_stall_entry_fromReg9 <= (others => '0');
            SE_stall_entry_fromReg10 <= (others => '0');
            SE_stall_entry_fromReg11 <= (others => '0');
            SE_stall_entry_fromReg12 <= (others => '0');
            SE_stall_entry_fromReg13 <= (others => '0');
            SE_stall_entry_fromReg14 <= (others => '0');
            SE_stall_entry_fromReg15 <= (others => '0');
            SE_stall_entry_fromReg16 <= (others => '0');
            SE_stall_entry_fromReg17 <= (others => '0');
            SE_stall_entry_fromReg18 <= (others => '0');
            SE_stall_entry_fromReg19 <= (others => '0');
            SE_stall_entry_fromReg20 <= (others => '0');
            SE_stall_entry_fromReg21 <= (others => '0');
            SE_stall_entry_fromReg22 <= (others => '0');
            SE_stall_entry_fromReg23 <= (others => '0');
            SE_stall_entry_fromReg24 <= (others => '0');
            SE_stall_entry_fromReg25 <= (others => '0');
            SE_stall_entry_fromReg26 <= (others => '0');
            SE_stall_entry_fromReg27 <= (others => '0');
            SE_stall_entry_fromReg28 <= (others => '0');
            SE_stall_entry_fromReg29 <= (others => '0');
            SE_stall_entry_fromReg30 <= (others => '0');
            SE_stall_entry_fromReg31 <= (others => '0');
            SE_stall_entry_fromReg32 <= (others => '0');
            SE_stall_entry_fromReg33 <= (others => '0');
            SE_stall_entry_fromReg34 <= (others => '0');
            SE_stall_entry_fromReg35 <= (others => '0');
            SE_stall_entry_fromReg36 <= (others => '0');
            SE_stall_entry_fromReg37 <= (others => '0');
            SE_stall_entry_fromReg38 <= (others => '0');
            SE_stall_entry_fromReg39 <= (others => '0');
            SE_stall_entry_fromReg40 <= (others => '0');
            SE_stall_entry_fromReg41 <= (others => '0');
            SE_stall_entry_fromReg42 <= (others => '0');
            SE_stall_entry_fromReg43 <= (others => '0');
            SE_stall_entry_fromReg44 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_stall_entry_fromReg0 <= SE_stall_entry_toReg0;
            -- Succesor 1
            SE_stall_entry_fromReg1 <= SE_stall_entry_toReg1;
            -- Succesor 2
            SE_stall_entry_fromReg2 <= SE_stall_entry_toReg2;
            -- Succesor 3
            SE_stall_entry_fromReg3 <= SE_stall_entry_toReg3;
            -- Succesor 4
            SE_stall_entry_fromReg4 <= SE_stall_entry_toReg4;
            -- Succesor 5
            SE_stall_entry_fromReg5 <= SE_stall_entry_toReg5;
            -- Succesor 6
            SE_stall_entry_fromReg6 <= SE_stall_entry_toReg6;
            -- Succesor 7
            SE_stall_entry_fromReg7 <= SE_stall_entry_toReg7;
            -- Succesor 8
            SE_stall_entry_fromReg8 <= SE_stall_entry_toReg8;
            -- Succesor 9
            SE_stall_entry_fromReg9 <= SE_stall_entry_toReg9;
            -- Succesor 10
            SE_stall_entry_fromReg10 <= SE_stall_entry_toReg10;
            -- Succesor 11
            SE_stall_entry_fromReg11 <= SE_stall_entry_toReg11;
            -- Succesor 12
            SE_stall_entry_fromReg12 <= SE_stall_entry_toReg12;
            -- Succesor 13
            SE_stall_entry_fromReg13 <= SE_stall_entry_toReg13;
            -- Succesor 14
            SE_stall_entry_fromReg14 <= SE_stall_entry_toReg14;
            -- Succesor 15
            SE_stall_entry_fromReg15 <= SE_stall_entry_toReg15;
            -- Succesor 16
            SE_stall_entry_fromReg16 <= SE_stall_entry_toReg16;
            -- Succesor 17
            SE_stall_entry_fromReg17 <= SE_stall_entry_toReg17;
            -- Succesor 18
            SE_stall_entry_fromReg18 <= SE_stall_entry_toReg18;
            -- Succesor 19
            SE_stall_entry_fromReg19 <= SE_stall_entry_toReg19;
            -- Succesor 20
            SE_stall_entry_fromReg20 <= SE_stall_entry_toReg20;
            -- Succesor 21
            SE_stall_entry_fromReg21 <= SE_stall_entry_toReg21;
            -- Succesor 22
            SE_stall_entry_fromReg22 <= SE_stall_entry_toReg22;
            -- Succesor 23
            SE_stall_entry_fromReg23 <= SE_stall_entry_toReg23;
            -- Succesor 24
            SE_stall_entry_fromReg24 <= SE_stall_entry_toReg24;
            -- Succesor 25
            SE_stall_entry_fromReg25 <= SE_stall_entry_toReg25;
            -- Succesor 26
            SE_stall_entry_fromReg26 <= SE_stall_entry_toReg26;
            -- Succesor 27
            SE_stall_entry_fromReg27 <= SE_stall_entry_toReg27;
            -- Succesor 28
            SE_stall_entry_fromReg28 <= SE_stall_entry_toReg28;
            -- Succesor 29
            SE_stall_entry_fromReg29 <= SE_stall_entry_toReg29;
            -- Succesor 30
            SE_stall_entry_fromReg30 <= SE_stall_entry_toReg30;
            -- Succesor 31
            SE_stall_entry_fromReg31 <= SE_stall_entry_toReg31;
            -- Succesor 32
            SE_stall_entry_fromReg32 <= SE_stall_entry_toReg32;
            -- Succesor 33
            SE_stall_entry_fromReg33 <= SE_stall_entry_toReg33;
            -- Succesor 34
            SE_stall_entry_fromReg34 <= SE_stall_entry_toReg34;
            -- Succesor 35
            SE_stall_entry_fromReg35 <= SE_stall_entry_toReg35;
            -- Succesor 36
            SE_stall_entry_fromReg36 <= SE_stall_entry_toReg36;
            -- Succesor 37
            SE_stall_entry_fromReg37 <= SE_stall_entry_toReg37;
            -- Succesor 38
            SE_stall_entry_fromReg38 <= SE_stall_entry_toReg38;
            -- Succesor 39
            SE_stall_entry_fromReg39 <= SE_stall_entry_toReg39;
            -- Succesor 40
            SE_stall_entry_fromReg40 <= SE_stall_entry_toReg40;
            -- Succesor 41
            SE_stall_entry_fromReg41 <= SE_stall_entry_toReg41;
            -- Succesor 42
            SE_stall_entry_fromReg42 <= SE_stall_entry_toReg42;
            -- Succesor 43
            SE_stall_entry_fromReg43 <= SE_stall_entry_toReg43;
            -- Succesor 44
            SE_stall_entry_fromReg44 <= SE_stall_entry_toReg44;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_stall_entry_consumed0 <= (not (i_sfc_c0_for_end91_ethash_search_c0_enter35_ethash_search_aunroll_x_out_o_stall) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg0;
    SE_stall_entry_consumed1 <= (not (redist0_stall_entry_o4_173_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg1;
    SE_stall_entry_consumed2 <= (not (redist1_stall_entry_o5_12_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg2;
    SE_stall_entry_consumed3 <= (not (redist3_stall_entry_o6_335_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg3;
    SE_stall_entry_consumed4 <= (not (redist4_stall_entry_o7_335_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg4;
    SE_stall_entry_consumed5 <= (not (redist5_stall_entry_o8_335_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg5;
    SE_stall_entry_consumed6 <= (not (redist6_stall_entry_o9_335_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg6;
    SE_stall_entry_consumed7 <= (not (redist7_stall_entry_o10_173_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg7;
    SE_stall_entry_consumed8 <= (not (redist9_stall_entry_o11_173_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg8;
    SE_stall_entry_consumed9 <= (not (redist10_stall_entry_o12_335_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg9;
    SE_stall_entry_consumed10 <= (not (redist11_stall_entry_o13_335_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg10;
    SE_stall_entry_consumed11 <= (not (redist12_stall_entry_o16_335_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg11;
    SE_stall_entry_consumed12 <= (not (redist13_stall_entry_o17_335_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg12;
    SE_stall_entry_consumed13 <= (not (redist14_stall_entry_o18_12_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg13;
    SE_stall_entry_consumed14 <= (not (redist16_stall_entry_o19_335_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg14;
    SE_stall_entry_consumed15 <= (not (redist17_stall_entry_o20_335_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg15;
    SE_stall_entry_consumed16 <= (not (redist18_stall_entry_o21_335_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg16;
    SE_stall_entry_consumed17 <= (not (redist19_stall_entry_o22_335_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg17;
    SE_stall_entry_consumed18 <= (not (redist20_stall_entry_o23_173_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg18;
    SE_stall_entry_consumed19 <= (not (redist21_stall_entry_o24_173_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg19;
    SE_stall_entry_consumed20 <= (not (redist22_stall_entry_o25_205_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg20;
    SE_stall_entry_consumed21 <= (not (redist23_stall_entry_o26_205_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg21;
    SE_stall_entry_consumed22 <= (not (redist24_stall_entry_o27_335_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg22;
    SE_stall_entry_consumed23 <= (not (redist25_stall_entry_o28_335_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg23;
    SE_stall_entry_consumed24 <= (not (redist26_stall_entry_o29_335_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg24;
    SE_stall_entry_consumed25 <= (not (redist27_stall_entry_o30_335_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg25;
    SE_stall_entry_consumed26 <= (not (redist28_stall_entry_o32_335_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg26;
    SE_stall_entry_consumed27 <= (not (redist29_stall_entry_o33_335_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg27;
    SE_stall_entry_consumed28 <= (not (redist30_stall_entry_o34_335_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg28;
    SE_stall_entry_consumed29 <= (not (redist31_stall_entry_o35_335_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg29;
    SE_stall_entry_consumed30 <= (not (redist32_stall_entry_o36_335_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg30;
    SE_stall_entry_consumed31 <= (not (redist33_stall_entry_o37_173_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg31;
    SE_stall_entry_consumed32 <= (not (redist34_stall_entry_o38_173_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg32;
    SE_stall_entry_consumed33 <= (not (redist35_stall_entry_o39_205_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg33;
    SE_stall_entry_consumed34 <= (not (redist36_stall_entry_o40_205_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg34;
    SE_stall_entry_consumed35 <= (not (redist37_stall_entry_o41_335_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg35;
    SE_stall_entry_consumed36 <= (not (redist38_stall_entry_o42_335_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg36;
    SE_stall_entry_consumed37 <= (not (redist39_stall_entry_o43_335_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg37;
    SE_stall_entry_consumed38 <= (not (redist40_stall_entry_o47_335_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg38;
    SE_stall_entry_consumed39 <= (not (redist41_stall_entry_o48_335_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg39;
    SE_stall_entry_consumed40 <= (not (redist42_stall_entry_o49_335_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg40;
    SE_stall_entry_consumed41 <= (not (redist43_stall_entry_o50_335_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg41;
    SE_stall_entry_consumed42 <= (not (redist44_stall_entry_o51_335_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg42;
    SE_stall_entry_consumed43 <= (not (redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg43;
    SE_stall_entry_consumed44 <= (not (redist54_i_arrayidx97_rm_ethash_search_ethash_search341_trunc_sel_x_b_12_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg44;
    -- Consuming
    SE_stall_entry_StallValid <= SE_stall_entry_backStall and SE_stall_entry_wireValid;
    SE_stall_entry_toReg0 <= SE_stall_entry_StallValid and SE_stall_entry_consumed0;
    SE_stall_entry_toReg1 <= SE_stall_entry_StallValid and SE_stall_entry_consumed1;
    SE_stall_entry_toReg2 <= SE_stall_entry_StallValid and SE_stall_entry_consumed2;
    SE_stall_entry_toReg3 <= SE_stall_entry_StallValid and SE_stall_entry_consumed3;
    SE_stall_entry_toReg4 <= SE_stall_entry_StallValid and SE_stall_entry_consumed4;
    SE_stall_entry_toReg5 <= SE_stall_entry_StallValid and SE_stall_entry_consumed5;
    SE_stall_entry_toReg6 <= SE_stall_entry_StallValid and SE_stall_entry_consumed6;
    SE_stall_entry_toReg7 <= SE_stall_entry_StallValid and SE_stall_entry_consumed7;
    SE_stall_entry_toReg8 <= SE_stall_entry_StallValid and SE_stall_entry_consumed8;
    SE_stall_entry_toReg9 <= SE_stall_entry_StallValid and SE_stall_entry_consumed9;
    SE_stall_entry_toReg10 <= SE_stall_entry_StallValid and SE_stall_entry_consumed10;
    SE_stall_entry_toReg11 <= SE_stall_entry_StallValid and SE_stall_entry_consumed11;
    SE_stall_entry_toReg12 <= SE_stall_entry_StallValid and SE_stall_entry_consumed12;
    SE_stall_entry_toReg13 <= SE_stall_entry_StallValid and SE_stall_entry_consumed13;
    SE_stall_entry_toReg14 <= SE_stall_entry_StallValid and SE_stall_entry_consumed14;
    SE_stall_entry_toReg15 <= SE_stall_entry_StallValid and SE_stall_entry_consumed15;
    SE_stall_entry_toReg16 <= SE_stall_entry_StallValid and SE_stall_entry_consumed16;
    SE_stall_entry_toReg17 <= SE_stall_entry_StallValid and SE_stall_entry_consumed17;
    SE_stall_entry_toReg18 <= SE_stall_entry_StallValid and SE_stall_entry_consumed18;
    SE_stall_entry_toReg19 <= SE_stall_entry_StallValid and SE_stall_entry_consumed19;
    SE_stall_entry_toReg20 <= SE_stall_entry_StallValid and SE_stall_entry_consumed20;
    SE_stall_entry_toReg21 <= SE_stall_entry_StallValid and SE_stall_entry_consumed21;
    SE_stall_entry_toReg22 <= SE_stall_entry_StallValid and SE_stall_entry_consumed22;
    SE_stall_entry_toReg23 <= SE_stall_entry_StallValid and SE_stall_entry_consumed23;
    SE_stall_entry_toReg24 <= SE_stall_entry_StallValid and SE_stall_entry_consumed24;
    SE_stall_entry_toReg25 <= SE_stall_entry_StallValid and SE_stall_entry_consumed25;
    SE_stall_entry_toReg26 <= SE_stall_entry_StallValid and SE_stall_entry_consumed26;
    SE_stall_entry_toReg27 <= SE_stall_entry_StallValid and SE_stall_entry_consumed27;
    SE_stall_entry_toReg28 <= SE_stall_entry_StallValid and SE_stall_entry_consumed28;
    SE_stall_entry_toReg29 <= SE_stall_entry_StallValid and SE_stall_entry_consumed29;
    SE_stall_entry_toReg30 <= SE_stall_entry_StallValid and SE_stall_entry_consumed30;
    SE_stall_entry_toReg31 <= SE_stall_entry_StallValid and SE_stall_entry_consumed31;
    SE_stall_entry_toReg32 <= SE_stall_entry_StallValid and SE_stall_entry_consumed32;
    SE_stall_entry_toReg33 <= SE_stall_entry_StallValid and SE_stall_entry_consumed33;
    SE_stall_entry_toReg34 <= SE_stall_entry_StallValid and SE_stall_entry_consumed34;
    SE_stall_entry_toReg35 <= SE_stall_entry_StallValid and SE_stall_entry_consumed35;
    SE_stall_entry_toReg36 <= SE_stall_entry_StallValid and SE_stall_entry_consumed36;
    SE_stall_entry_toReg37 <= SE_stall_entry_StallValid and SE_stall_entry_consumed37;
    SE_stall_entry_toReg38 <= SE_stall_entry_StallValid and SE_stall_entry_consumed38;
    SE_stall_entry_toReg39 <= SE_stall_entry_StallValid and SE_stall_entry_consumed39;
    SE_stall_entry_toReg40 <= SE_stall_entry_StallValid and SE_stall_entry_consumed40;
    SE_stall_entry_toReg41 <= SE_stall_entry_StallValid and SE_stall_entry_consumed41;
    SE_stall_entry_toReg42 <= SE_stall_entry_StallValid and SE_stall_entry_consumed42;
    SE_stall_entry_toReg43 <= SE_stall_entry_StallValid and SE_stall_entry_consumed43;
    SE_stall_entry_toReg44 <= SE_stall_entry_StallValid and SE_stall_entry_consumed44;
    -- Backward Stall generation
    SE_stall_entry_or0 <= SE_stall_entry_consumed0;
    SE_stall_entry_or1 <= SE_stall_entry_consumed1 and SE_stall_entry_or0;
    SE_stall_entry_or2 <= SE_stall_entry_consumed2 and SE_stall_entry_or1;
    SE_stall_entry_or3 <= SE_stall_entry_consumed3 and SE_stall_entry_or2;
    SE_stall_entry_or4 <= SE_stall_entry_consumed4 and SE_stall_entry_or3;
    SE_stall_entry_or5 <= SE_stall_entry_consumed5 and SE_stall_entry_or4;
    SE_stall_entry_or6 <= SE_stall_entry_consumed6 and SE_stall_entry_or5;
    SE_stall_entry_or7 <= SE_stall_entry_consumed7 and SE_stall_entry_or6;
    SE_stall_entry_or8 <= SE_stall_entry_consumed8 and SE_stall_entry_or7;
    SE_stall_entry_or9 <= SE_stall_entry_consumed9 and SE_stall_entry_or8;
    SE_stall_entry_or10 <= SE_stall_entry_consumed10 and SE_stall_entry_or9;
    SE_stall_entry_or11 <= SE_stall_entry_consumed11 and SE_stall_entry_or10;
    SE_stall_entry_or12 <= SE_stall_entry_consumed12 and SE_stall_entry_or11;
    SE_stall_entry_or13 <= SE_stall_entry_consumed13 and SE_stall_entry_or12;
    SE_stall_entry_or14 <= SE_stall_entry_consumed14 and SE_stall_entry_or13;
    SE_stall_entry_or15 <= SE_stall_entry_consumed15 and SE_stall_entry_or14;
    SE_stall_entry_or16 <= SE_stall_entry_consumed16 and SE_stall_entry_or15;
    SE_stall_entry_or17 <= SE_stall_entry_consumed17 and SE_stall_entry_or16;
    SE_stall_entry_or18 <= SE_stall_entry_consumed18 and SE_stall_entry_or17;
    SE_stall_entry_or19 <= SE_stall_entry_consumed19 and SE_stall_entry_or18;
    SE_stall_entry_or20 <= SE_stall_entry_consumed20 and SE_stall_entry_or19;
    SE_stall_entry_or21 <= SE_stall_entry_consumed21 and SE_stall_entry_or20;
    SE_stall_entry_or22 <= SE_stall_entry_consumed22 and SE_stall_entry_or21;
    SE_stall_entry_or23 <= SE_stall_entry_consumed23 and SE_stall_entry_or22;
    SE_stall_entry_or24 <= SE_stall_entry_consumed24 and SE_stall_entry_or23;
    SE_stall_entry_or25 <= SE_stall_entry_consumed25 and SE_stall_entry_or24;
    SE_stall_entry_or26 <= SE_stall_entry_consumed26 and SE_stall_entry_or25;
    SE_stall_entry_or27 <= SE_stall_entry_consumed27 and SE_stall_entry_or26;
    SE_stall_entry_or28 <= SE_stall_entry_consumed28 and SE_stall_entry_or27;
    SE_stall_entry_or29 <= SE_stall_entry_consumed29 and SE_stall_entry_or28;
    SE_stall_entry_or30 <= SE_stall_entry_consumed30 and SE_stall_entry_or29;
    SE_stall_entry_or31 <= SE_stall_entry_consumed31 and SE_stall_entry_or30;
    SE_stall_entry_or32 <= SE_stall_entry_consumed32 and SE_stall_entry_or31;
    SE_stall_entry_or33 <= SE_stall_entry_consumed33 and SE_stall_entry_or32;
    SE_stall_entry_or34 <= SE_stall_entry_consumed34 and SE_stall_entry_or33;
    SE_stall_entry_or35 <= SE_stall_entry_consumed35 and SE_stall_entry_or34;
    SE_stall_entry_or36 <= SE_stall_entry_consumed36 and SE_stall_entry_or35;
    SE_stall_entry_or37 <= SE_stall_entry_consumed37 and SE_stall_entry_or36;
    SE_stall_entry_or38 <= SE_stall_entry_consumed38 and SE_stall_entry_or37;
    SE_stall_entry_or39 <= SE_stall_entry_consumed39 and SE_stall_entry_or38;
    SE_stall_entry_or40 <= SE_stall_entry_consumed40 and SE_stall_entry_or39;
    SE_stall_entry_or41 <= SE_stall_entry_consumed41 and SE_stall_entry_or40;
    SE_stall_entry_or42 <= SE_stall_entry_consumed42 and SE_stall_entry_or41;
    SE_stall_entry_or43 <= SE_stall_entry_consumed43 and SE_stall_entry_or42;
    SE_stall_entry_wireStall <= not (SE_stall_entry_consumed44 and SE_stall_entry_or43);
    SE_stall_entry_backStall <= SE_stall_entry_wireStall;
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg0);
    SE_stall_entry_V1 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg1);
    SE_stall_entry_V2 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg2);
    SE_stall_entry_V3 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg3);
    SE_stall_entry_V4 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg4);
    SE_stall_entry_V5 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg5);
    SE_stall_entry_V6 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg6);
    SE_stall_entry_V7 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg7);
    SE_stall_entry_V8 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg8);
    SE_stall_entry_V9 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg9);
    SE_stall_entry_V10 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg10);
    SE_stall_entry_V11 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg11);
    SE_stall_entry_V12 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg12);
    SE_stall_entry_V13 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg13);
    SE_stall_entry_V14 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg14);
    SE_stall_entry_V15 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg15);
    SE_stall_entry_V16 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg16);
    SE_stall_entry_V17 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg17);
    SE_stall_entry_V18 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg18);
    SE_stall_entry_V19 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg19);
    SE_stall_entry_V20 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg20);
    SE_stall_entry_V21 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg21);
    SE_stall_entry_V22 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg22);
    SE_stall_entry_V23 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg23);
    SE_stall_entry_V24 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg24);
    SE_stall_entry_V25 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg25);
    SE_stall_entry_V26 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg26);
    SE_stall_entry_V27 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg27);
    SE_stall_entry_V28 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg28);
    SE_stall_entry_V29 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg29);
    SE_stall_entry_V30 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg30);
    SE_stall_entry_V31 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg31);
    SE_stall_entry_V32 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg32);
    SE_stall_entry_V33 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg33);
    SE_stall_entry_V34 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg34);
    SE_stall_entry_V35 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg35);
    SE_stall_entry_V36 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg36);
    SE_stall_entry_V37 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg37);
    SE_stall_entry_V38 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg38);
    SE_stall_entry_V39 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg39);
    SE_stall_entry_V40 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg40);
    SE_stall_entry_V41 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg41);
    SE_stall_entry_V42 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg42);
    SE_stall_entry_V43 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg43);
    SE_stall_entry_V44 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg44);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- redist3_stall_entry_o6_335_fifo(STALLFIFO,161)
    redist3_stall_entry_o6_335_fifo_valid_in <= SE_stall_entry_V3;
    redist3_stall_entry_o6_335_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist3_stall_entry_o6_335_fifo_data_in <= bubble_select_stall_entry_d;
    redist3_stall_entry_o6_335_fifo_valid_in_bitsignaltemp <= redist3_stall_entry_o6_335_fifo_valid_in(0);
    redist3_stall_entry_o6_335_fifo_stall_in_bitsignaltemp <= redist3_stall_entry_o6_335_fifo_stall_in(0);
    redist3_stall_entry_o6_335_fifo_valid_out(0) <= redist3_stall_entry_o6_335_fifo_valid_out_bitsignaltemp;
    redist3_stall_entry_o6_335_fifo_stall_out(0) <= redist3_stall_entry_o6_335_fifo_stall_out_bitsignaltemp;
    theredist3_stall_entry_o6_335_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 336,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist3_stall_entry_o6_335_fifo_valid_in_bitsignaltemp,
        stall_in => redist3_stall_entry_o6_335_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_d,
        valid_out => redist3_stall_entry_o6_335_fifo_valid_out_bitsignaltemp,
        stall_out => redist3_stall_entry_o6_335_fifo_stall_out_bitsignaltemp,
        data_out => redist3_stall_entry_o6_335_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist4_stall_entry_o7_335_fifo(STALLFIFO,162)
    redist4_stall_entry_o7_335_fifo_valid_in <= SE_stall_entry_V4;
    redist4_stall_entry_o7_335_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist4_stall_entry_o7_335_fifo_data_in <= bubble_select_stall_entry_e;
    redist4_stall_entry_o7_335_fifo_valid_in_bitsignaltemp <= redist4_stall_entry_o7_335_fifo_valid_in(0);
    redist4_stall_entry_o7_335_fifo_stall_in_bitsignaltemp <= redist4_stall_entry_o7_335_fifo_stall_in(0);
    redist4_stall_entry_o7_335_fifo_valid_out(0) <= redist4_stall_entry_o7_335_fifo_valid_out_bitsignaltemp;
    redist4_stall_entry_o7_335_fifo_stall_out(0) <= redist4_stall_entry_o7_335_fifo_stall_out_bitsignaltemp;
    theredist4_stall_entry_o7_335_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 336,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist4_stall_entry_o7_335_fifo_valid_in_bitsignaltemp,
        stall_in => redist4_stall_entry_o7_335_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_e,
        valid_out => redist4_stall_entry_o7_335_fifo_valid_out_bitsignaltemp,
        stall_out => redist4_stall_entry_o7_335_fifo_stall_out_bitsignaltemp,
        data_out => redist4_stall_entry_o7_335_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist5_stall_entry_o8_335_fifo(STALLFIFO,163)
    redist5_stall_entry_o8_335_fifo_valid_in <= SE_stall_entry_V5;
    redist5_stall_entry_o8_335_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist5_stall_entry_o8_335_fifo_data_in <= bubble_select_stall_entry_f;
    redist5_stall_entry_o8_335_fifo_valid_in_bitsignaltemp <= redist5_stall_entry_o8_335_fifo_valid_in(0);
    redist5_stall_entry_o8_335_fifo_stall_in_bitsignaltemp <= redist5_stall_entry_o8_335_fifo_stall_in(0);
    redist5_stall_entry_o8_335_fifo_valid_out(0) <= redist5_stall_entry_o8_335_fifo_valid_out_bitsignaltemp;
    redist5_stall_entry_o8_335_fifo_stall_out(0) <= redist5_stall_entry_o8_335_fifo_stall_out_bitsignaltemp;
    theredist5_stall_entry_o8_335_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 336,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist5_stall_entry_o8_335_fifo_valid_in_bitsignaltemp,
        stall_in => redist5_stall_entry_o8_335_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_f,
        valid_out => redist5_stall_entry_o8_335_fifo_valid_out_bitsignaltemp,
        stall_out => redist5_stall_entry_o8_335_fifo_stall_out_bitsignaltemp,
        data_out => redist5_stall_entry_o8_335_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist6_stall_entry_o9_335_fifo(STALLFIFO,164)
    redist6_stall_entry_o9_335_fifo_valid_in <= SE_stall_entry_V6;
    redist6_stall_entry_o9_335_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist6_stall_entry_o9_335_fifo_data_in <= bubble_select_stall_entry_g;
    redist6_stall_entry_o9_335_fifo_valid_in_bitsignaltemp <= redist6_stall_entry_o9_335_fifo_valid_in(0);
    redist6_stall_entry_o9_335_fifo_stall_in_bitsignaltemp <= redist6_stall_entry_o9_335_fifo_stall_in(0);
    redist6_stall_entry_o9_335_fifo_valid_out(0) <= redist6_stall_entry_o9_335_fifo_valid_out_bitsignaltemp;
    redist6_stall_entry_o9_335_fifo_stall_out(0) <= redist6_stall_entry_o9_335_fifo_stall_out_bitsignaltemp;
    theredist6_stall_entry_o9_335_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 336,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist6_stall_entry_o9_335_fifo_valid_in_bitsignaltemp,
        stall_in => redist6_stall_entry_o9_335_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_g,
        valid_out => redist6_stall_entry_o9_335_fifo_valid_out_bitsignaltemp,
        stall_out => redist6_stall_entry_o9_335_fifo_stall_out_bitsignaltemp,
        data_out => redist6_stall_entry_o9_335_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist10_stall_entry_o12_335_fifo(STALLFIFO,168)
    redist10_stall_entry_o12_335_fifo_valid_in <= SE_stall_entry_V9;
    redist10_stall_entry_o12_335_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist10_stall_entry_o12_335_fifo_data_in <= bubble_select_stall_entry_j;
    redist10_stall_entry_o12_335_fifo_valid_in_bitsignaltemp <= redist10_stall_entry_o12_335_fifo_valid_in(0);
    redist10_stall_entry_o12_335_fifo_stall_in_bitsignaltemp <= redist10_stall_entry_o12_335_fifo_stall_in(0);
    redist10_stall_entry_o12_335_fifo_valid_out(0) <= redist10_stall_entry_o12_335_fifo_valid_out_bitsignaltemp;
    redist10_stall_entry_o12_335_fifo_stall_out(0) <= redist10_stall_entry_o12_335_fifo_stall_out_bitsignaltemp;
    theredist10_stall_entry_o12_335_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 336,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 4,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist10_stall_entry_o12_335_fifo_valid_in_bitsignaltemp,
        stall_in => redist10_stall_entry_o12_335_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_j,
        valid_out => redist10_stall_entry_o12_335_fifo_valid_out_bitsignaltemp,
        stall_out => redist10_stall_entry_o12_335_fifo_stall_out_bitsignaltemp,
        data_out => redist10_stall_entry_o12_335_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist11_stall_entry_o13_335_fifo(STALLFIFO,169)
    redist11_stall_entry_o13_335_fifo_valid_in <= SE_stall_entry_V10;
    redist11_stall_entry_o13_335_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist11_stall_entry_o13_335_fifo_data_in <= bubble_select_stall_entry_k;
    redist11_stall_entry_o13_335_fifo_valid_in_bitsignaltemp <= redist11_stall_entry_o13_335_fifo_valid_in(0);
    redist11_stall_entry_o13_335_fifo_stall_in_bitsignaltemp <= redist11_stall_entry_o13_335_fifo_stall_in(0);
    redist11_stall_entry_o13_335_fifo_valid_out(0) <= redist11_stall_entry_o13_335_fifo_valid_out_bitsignaltemp;
    redist11_stall_entry_o13_335_fifo_stall_out(0) <= redist11_stall_entry_o13_335_fifo_stall_out_bitsignaltemp;
    theredist11_stall_entry_o13_335_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 336,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist11_stall_entry_o13_335_fifo_valid_in_bitsignaltemp,
        stall_in => redist11_stall_entry_o13_335_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_k,
        valid_out => redist11_stall_entry_o13_335_fifo_valid_out_bitsignaltemp,
        stall_out => redist11_stall_entry_o13_335_fifo_stall_out_bitsignaltemp,
        data_out => redist11_stall_entry_o13_335_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist12_stall_entry_o16_335_fifo(STALLFIFO,170)
    redist12_stall_entry_o16_335_fifo_valid_in <= SE_stall_entry_V11;
    redist12_stall_entry_o16_335_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist12_stall_entry_o16_335_fifo_data_in <= bubble_select_stall_entry_n;
    redist12_stall_entry_o16_335_fifo_valid_in_bitsignaltemp <= redist12_stall_entry_o16_335_fifo_valid_in(0);
    redist12_stall_entry_o16_335_fifo_stall_in_bitsignaltemp <= redist12_stall_entry_o16_335_fifo_stall_in(0);
    redist12_stall_entry_o16_335_fifo_valid_out(0) <= redist12_stall_entry_o16_335_fifo_valid_out_bitsignaltemp;
    redist12_stall_entry_o16_335_fifo_stall_out(0) <= redist12_stall_entry_o16_335_fifo_stall_out_bitsignaltemp;
    theredist12_stall_entry_o16_335_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 336,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist12_stall_entry_o16_335_fifo_valid_in_bitsignaltemp,
        stall_in => redist12_stall_entry_o16_335_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_n,
        valid_out => redist12_stall_entry_o16_335_fifo_valid_out_bitsignaltemp,
        stall_out => redist12_stall_entry_o16_335_fifo_stall_out_bitsignaltemp,
        data_out => redist12_stall_entry_o16_335_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist13_stall_entry_o17_335_fifo(STALLFIFO,171)
    redist13_stall_entry_o17_335_fifo_valid_in <= SE_stall_entry_V12;
    redist13_stall_entry_o17_335_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist13_stall_entry_o17_335_fifo_data_in <= bubble_select_stall_entry_o;
    redist13_stall_entry_o17_335_fifo_valid_in_bitsignaltemp <= redist13_stall_entry_o17_335_fifo_valid_in(0);
    redist13_stall_entry_o17_335_fifo_stall_in_bitsignaltemp <= redist13_stall_entry_o17_335_fifo_stall_in(0);
    redist13_stall_entry_o17_335_fifo_valid_out(0) <= redist13_stall_entry_o17_335_fifo_valid_out_bitsignaltemp;
    redist13_stall_entry_o17_335_fifo_stall_out(0) <= redist13_stall_entry_o17_335_fifo_stall_out_bitsignaltemp;
    theredist13_stall_entry_o17_335_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 336,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist13_stall_entry_o17_335_fifo_valid_in_bitsignaltemp,
        stall_in => redist13_stall_entry_o17_335_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_o,
        valid_out => redist13_stall_entry_o17_335_fifo_valid_out_bitsignaltemp,
        stall_out => redist13_stall_entry_o17_335_fifo_stall_out_bitsignaltemp,
        data_out => redist13_stall_entry_o17_335_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist16_stall_entry_o19_335_fifo(STALLFIFO,174)
    redist16_stall_entry_o19_335_fifo_valid_in <= SE_stall_entry_V14;
    redist16_stall_entry_o19_335_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist16_stall_entry_o19_335_fifo_data_in <= bubble_select_stall_entry_q;
    redist16_stall_entry_o19_335_fifo_valid_in_bitsignaltemp <= redist16_stall_entry_o19_335_fifo_valid_in(0);
    redist16_stall_entry_o19_335_fifo_stall_in_bitsignaltemp <= redist16_stall_entry_o19_335_fifo_stall_in(0);
    redist16_stall_entry_o19_335_fifo_valid_out(0) <= redist16_stall_entry_o19_335_fifo_valid_out_bitsignaltemp;
    redist16_stall_entry_o19_335_fifo_stall_out(0) <= redist16_stall_entry_o19_335_fifo_stall_out_bitsignaltemp;
    theredist16_stall_entry_o19_335_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 336,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist16_stall_entry_o19_335_fifo_valid_in_bitsignaltemp,
        stall_in => redist16_stall_entry_o19_335_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_q,
        valid_out => redist16_stall_entry_o19_335_fifo_valid_out_bitsignaltemp,
        stall_out => redist16_stall_entry_o19_335_fifo_stall_out_bitsignaltemp,
        data_out => redist16_stall_entry_o19_335_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist17_stall_entry_o20_335_fifo(STALLFIFO,175)
    redist17_stall_entry_o20_335_fifo_valid_in <= SE_stall_entry_V15;
    redist17_stall_entry_o20_335_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist17_stall_entry_o20_335_fifo_data_in <= bubble_select_stall_entry_r;
    redist17_stall_entry_o20_335_fifo_valid_in_bitsignaltemp <= redist17_stall_entry_o20_335_fifo_valid_in(0);
    redist17_stall_entry_o20_335_fifo_stall_in_bitsignaltemp <= redist17_stall_entry_o20_335_fifo_stall_in(0);
    redist17_stall_entry_o20_335_fifo_valid_out(0) <= redist17_stall_entry_o20_335_fifo_valid_out_bitsignaltemp;
    redist17_stall_entry_o20_335_fifo_stall_out(0) <= redist17_stall_entry_o20_335_fifo_stall_out_bitsignaltemp;
    theredist17_stall_entry_o20_335_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 336,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist17_stall_entry_o20_335_fifo_valid_in_bitsignaltemp,
        stall_in => redist17_stall_entry_o20_335_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_r,
        valid_out => redist17_stall_entry_o20_335_fifo_valid_out_bitsignaltemp,
        stall_out => redist17_stall_entry_o20_335_fifo_stall_out_bitsignaltemp,
        data_out => redist17_stall_entry_o20_335_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist18_stall_entry_o21_335_fifo(STALLFIFO,176)
    redist18_stall_entry_o21_335_fifo_valid_in <= SE_stall_entry_V16;
    redist18_stall_entry_o21_335_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist18_stall_entry_o21_335_fifo_data_in <= bubble_select_stall_entry_s;
    redist18_stall_entry_o21_335_fifo_valid_in_bitsignaltemp <= redist18_stall_entry_o21_335_fifo_valid_in(0);
    redist18_stall_entry_o21_335_fifo_stall_in_bitsignaltemp <= redist18_stall_entry_o21_335_fifo_stall_in(0);
    redist18_stall_entry_o21_335_fifo_valid_out(0) <= redist18_stall_entry_o21_335_fifo_valid_out_bitsignaltemp;
    redist18_stall_entry_o21_335_fifo_stall_out(0) <= redist18_stall_entry_o21_335_fifo_stall_out_bitsignaltemp;
    theredist18_stall_entry_o21_335_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 336,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist18_stall_entry_o21_335_fifo_valid_in_bitsignaltemp,
        stall_in => redist18_stall_entry_o21_335_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_s,
        valid_out => redist18_stall_entry_o21_335_fifo_valid_out_bitsignaltemp,
        stall_out => redist18_stall_entry_o21_335_fifo_stall_out_bitsignaltemp,
        data_out => redist18_stall_entry_o21_335_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist19_stall_entry_o22_335_fifo(STALLFIFO,177)
    redist19_stall_entry_o22_335_fifo_valid_in <= SE_stall_entry_V17;
    redist19_stall_entry_o22_335_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist19_stall_entry_o22_335_fifo_data_in <= bubble_select_stall_entry_t;
    redist19_stall_entry_o22_335_fifo_valid_in_bitsignaltemp <= redist19_stall_entry_o22_335_fifo_valid_in(0);
    redist19_stall_entry_o22_335_fifo_stall_in_bitsignaltemp <= redist19_stall_entry_o22_335_fifo_stall_in(0);
    redist19_stall_entry_o22_335_fifo_valid_out(0) <= redist19_stall_entry_o22_335_fifo_valid_out_bitsignaltemp;
    redist19_stall_entry_o22_335_fifo_stall_out(0) <= redist19_stall_entry_o22_335_fifo_stall_out_bitsignaltemp;
    theredist19_stall_entry_o22_335_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 336,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist19_stall_entry_o22_335_fifo_valid_in_bitsignaltemp,
        stall_in => redist19_stall_entry_o22_335_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_t,
        valid_out => redist19_stall_entry_o22_335_fifo_valid_out_bitsignaltemp,
        stall_out => redist19_stall_entry_o22_335_fifo_stall_out_bitsignaltemp,
        data_out => redist19_stall_entry_o22_335_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist24_stall_entry_o27_335_fifo(STALLFIFO,182)
    redist24_stall_entry_o27_335_fifo_valid_in <= SE_stall_entry_V22;
    redist24_stall_entry_o27_335_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist24_stall_entry_o27_335_fifo_data_in <= bubble_select_stall_entry_y;
    redist24_stall_entry_o27_335_fifo_valid_in_bitsignaltemp <= redist24_stall_entry_o27_335_fifo_valid_in(0);
    redist24_stall_entry_o27_335_fifo_stall_in_bitsignaltemp <= redist24_stall_entry_o27_335_fifo_stall_in(0);
    redist24_stall_entry_o27_335_fifo_valid_out(0) <= redist24_stall_entry_o27_335_fifo_valid_out_bitsignaltemp;
    redist24_stall_entry_o27_335_fifo_stall_out(0) <= redist24_stall_entry_o27_335_fifo_stall_out_bitsignaltemp;
    theredist24_stall_entry_o27_335_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 336,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist24_stall_entry_o27_335_fifo_valid_in_bitsignaltemp,
        stall_in => redist24_stall_entry_o27_335_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_y,
        valid_out => redist24_stall_entry_o27_335_fifo_valid_out_bitsignaltemp,
        stall_out => redist24_stall_entry_o27_335_fifo_stall_out_bitsignaltemp,
        data_out => redist24_stall_entry_o27_335_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist25_stall_entry_o28_335_fifo(STALLFIFO,183)
    redist25_stall_entry_o28_335_fifo_valid_in <= SE_stall_entry_V23;
    redist25_stall_entry_o28_335_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist25_stall_entry_o28_335_fifo_data_in <= bubble_select_stall_entry_z;
    redist25_stall_entry_o28_335_fifo_valid_in_bitsignaltemp <= redist25_stall_entry_o28_335_fifo_valid_in(0);
    redist25_stall_entry_o28_335_fifo_stall_in_bitsignaltemp <= redist25_stall_entry_o28_335_fifo_stall_in(0);
    redist25_stall_entry_o28_335_fifo_valid_out(0) <= redist25_stall_entry_o28_335_fifo_valid_out_bitsignaltemp;
    redist25_stall_entry_o28_335_fifo_stall_out(0) <= redist25_stall_entry_o28_335_fifo_stall_out_bitsignaltemp;
    theredist25_stall_entry_o28_335_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 336,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist25_stall_entry_o28_335_fifo_valid_in_bitsignaltemp,
        stall_in => redist25_stall_entry_o28_335_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_z,
        valid_out => redist25_stall_entry_o28_335_fifo_valid_out_bitsignaltemp,
        stall_out => redist25_stall_entry_o28_335_fifo_stall_out_bitsignaltemp,
        data_out => redist25_stall_entry_o28_335_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist26_stall_entry_o29_335_fifo(STALLFIFO,184)
    redist26_stall_entry_o29_335_fifo_valid_in <= SE_stall_entry_V24;
    redist26_stall_entry_o29_335_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist26_stall_entry_o29_335_fifo_data_in <= bubble_select_stall_entry_aa;
    redist26_stall_entry_o29_335_fifo_valid_in_bitsignaltemp <= redist26_stall_entry_o29_335_fifo_valid_in(0);
    redist26_stall_entry_o29_335_fifo_stall_in_bitsignaltemp <= redist26_stall_entry_o29_335_fifo_stall_in(0);
    redist26_stall_entry_o29_335_fifo_valid_out(0) <= redist26_stall_entry_o29_335_fifo_valid_out_bitsignaltemp;
    redist26_stall_entry_o29_335_fifo_stall_out(0) <= redist26_stall_entry_o29_335_fifo_stall_out_bitsignaltemp;
    theredist26_stall_entry_o29_335_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 336,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist26_stall_entry_o29_335_fifo_valid_in_bitsignaltemp,
        stall_in => redist26_stall_entry_o29_335_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_aa,
        valid_out => redist26_stall_entry_o29_335_fifo_valid_out_bitsignaltemp,
        stall_out => redist26_stall_entry_o29_335_fifo_stall_out_bitsignaltemp,
        data_out => redist26_stall_entry_o29_335_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist27_stall_entry_o30_335_fifo(STALLFIFO,185)
    redist27_stall_entry_o30_335_fifo_valid_in <= SE_stall_entry_V25;
    redist27_stall_entry_o30_335_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist27_stall_entry_o30_335_fifo_data_in <= bubble_select_stall_entry_bb;
    redist27_stall_entry_o30_335_fifo_valid_in_bitsignaltemp <= redist27_stall_entry_o30_335_fifo_valid_in(0);
    redist27_stall_entry_o30_335_fifo_stall_in_bitsignaltemp <= redist27_stall_entry_o30_335_fifo_stall_in(0);
    redist27_stall_entry_o30_335_fifo_valid_out(0) <= redist27_stall_entry_o30_335_fifo_valid_out_bitsignaltemp;
    redist27_stall_entry_o30_335_fifo_stall_out(0) <= redist27_stall_entry_o30_335_fifo_stall_out_bitsignaltemp;
    theredist27_stall_entry_o30_335_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 336,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist27_stall_entry_o30_335_fifo_valid_in_bitsignaltemp,
        stall_in => redist27_stall_entry_o30_335_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_bb,
        valid_out => redist27_stall_entry_o30_335_fifo_valid_out_bitsignaltemp,
        stall_out => redist27_stall_entry_o30_335_fifo_stall_out_bitsignaltemp,
        data_out => redist27_stall_entry_o30_335_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist28_stall_entry_o32_335_fifo(STALLFIFO,186)
    redist28_stall_entry_o32_335_fifo_valid_in <= SE_stall_entry_V26;
    redist28_stall_entry_o32_335_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist28_stall_entry_o32_335_fifo_data_in <= bubble_select_stall_entry_dd;
    redist28_stall_entry_o32_335_fifo_valid_in_bitsignaltemp <= redist28_stall_entry_o32_335_fifo_valid_in(0);
    redist28_stall_entry_o32_335_fifo_stall_in_bitsignaltemp <= redist28_stall_entry_o32_335_fifo_stall_in(0);
    redist28_stall_entry_o32_335_fifo_valid_out(0) <= redist28_stall_entry_o32_335_fifo_valid_out_bitsignaltemp;
    redist28_stall_entry_o32_335_fifo_stall_out(0) <= redist28_stall_entry_o32_335_fifo_stall_out_bitsignaltemp;
    theredist28_stall_entry_o32_335_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 336,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist28_stall_entry_o32_335_fifo_valid_in_bitsignaltemp,
        stall_in => redist28_stall_entry_o32_335_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_dd,
        valid_out => redist28_stall_entry_o32_335_fifo_valid_out_bitsignaltemp,
        stall_out => redist28_stall_entry_o32_335_fifo_stall_out_bitsignaltemp,
        data_out => redist28_stall_entry_o32_335_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist29_stall_entry_o33_335_fifo(STALLFIFO,187)
    redist29_stall_entry_o33_335_fifo_valid_in <= SE_stall_entry_V27;
    redist29_stall_entry_o33_335_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist29_stall_entry_o33_335_fifo_data_in <= bubble_select_stall_entry_ee;
    redist29_stall_entry_o33_335_fifo_valid_in_bitsignaltemp <= redist29_stall_entry_o33_335_fifo_valid_in(0);
    redist29_stall_entry_o33_335_fifo_stall_in_bitsignaltemp <= redist29_stall_entry_o33_335_fifo_stall_in(0);
    redist29_stall_entry_o33_335_fifo_valid_out(0) <= redist29_stall_entry_o33_335_fifo_valid_out_bitsignaltemp;
    redist29_stall_entry_o33_335_fifo_stall_out(0) <= redist29_stall_entry_o33_335_fifo_stall_out_bitsignaltemp;
    theredist29_stall_entry_o33_335_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 336,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist29_stall_entry_o33_335_fifo_valid_in_bitsignaltemp,
        stall_in => redist29_stall_entry_o33_335_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_ee,
        valid_out => redist29_stall_entry_o33_335_fifo_valid_out_bitsignaltemp,
        stall_out => redist29_stall_entry_o33_335_fifo_stall_out_bitsignaltemp,
        data_out => redist29_stall_entry_o33_335_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist30_stall_entry_o34_335_fifo(STALLFIFO,188)
    redist30_stall_entry_o34_335_fifo_valid_in <= SE_stall_entry_V28;
    redist30_stall_entry_o34_335_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist30_stall_entry_o34_335_fifo_data_in <= bubble_select_stall_entry_ff;
    redist30_stall_entry_o34_335_fifo_valid_in_bitsignaltemp <= redist30_stall_entry_o34_335_fifo_valid_in(0);
    redist30_stall_entry_o34_335_fifo_stall_in_bitsignaltemp <= redist30_stall_entry_o34_335_fifo_stall_in(0);
    redist30_stall_entry_o34_335_fifo_valid_out(0) <= redist30_stall_entry_o34_335_fifo_valid_out_bitsignaltemp;
    redist30_stall_entry_o34_335_fifo_stall_out(0) <= redist30_stall_entry_o34_335_fifo_stall_out_bitsignaltemp;
    theredist30_stall_entry_o34_335_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 336,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist30_stall_entry_o34_335_fifo_valid_in_bitsignaltemp,
        stall_in => redist30_stall_entry_o34_335_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_ff,
        valid_out => redist30_stall_entry_o34_335_fifo_valid_out_bitsignaltemp,
        stall_out => redist30_stall_entry_o34_335_fifo_stall_out_bitsignaltemp,
        data_out => redist30_stall_entry_o34_335_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist31_stall_entry_o35_335_fifo(STALLFIFO,189)
    redist31_stall_entry_o35_335_fifo_valid_in <= SE_stall_entry_V29;
    redist31_stall_entry_o35_335_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist31_stall_entry_o35_335_fifo_data_in <= bubble_select_stall_entry_gg;
    redist31_stall_entry_o35_335_fifo_valid_in_bitsignaltemp <= redist31_stall_entry_o35_335_fifo_valid_in(0);
    redist31_stall_entry_o35_335_fifo_stall_in_bitsignaltemp <= redist31_stall_entry_o35_335_fifo_stall_in(0);
    redist31_stall_entry_o35_335_fifo_valid_out(0) <= redist31_stall_entry_o35_335_fifo_valid_out_bitsignaltemp;
    redist31_stall_entry_o35_335_fifo_stall_out(0) <= redist31_stall_entry_o35_335_fifo_stall_out_bitsignaltemp;
    theredist31_stall_entry_o35_335_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 336,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist31_stall_entry_o35_335_fifo_valid_in_bitsignaltemp,
        stall_in => redist31_stall_entry_o35_335_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_gg,
        valid_out => redist31_stall_entry_o35_335_fifo_valid_out_bitsignaltemp,
        stall_out => redist31_stall_entry_o35_335_fifo_stall_out_bitsignaltemp,
        data_out => redist31_stall_entry_o35_335_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist32_stall_entry_o36_335_fifo(STALLFIFO,190)
    redist32_stall_entry_o36_335_fifo_valid_in <= SE_stall_entry_V30;
    redist32_stall_entry_o36_335_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist32_stall_entry_o36_335_fifo_data_in <= bubble_select_stall_entry_hh;
    redist32_stall_entry_o36_335_fifo_valid_in_bitsignaltemp <= redist32_stall_entry_o36_335_fifo_valid_in(0);
    redist32_stall_entry_o36_335_fifo_stall_in_bitsignaltemp <= redist32_stall_entry_o36_335_fifo_stall_in(0);
    redist32_stall_entry_o36_335_fifo_valid_out(0) <= redist32_stall_entry_o36_335_fifo_valid_out_bitsignaltemp;
    redist32_stall_entry_o36_335_fifo_stall_out(0) <= redist32_stall_entry_o36_335_fifo_stall_out_bitsignaltemp;
    theredist32_stall_entry_o36_335_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 336,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist32_stall_entry_o36_335_fifo_valid_in_bitsignaltemp,
        stall_in => redist32_stall_entry_o36_335_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_hh,
        valid_out => redist32_stall_entry_o36_335_fifo_valid_out_bitsignaltemp,
        stall_out => redist32_stall_entry_o36_335_fifo_stall_out_bitsignaltemp,
        data_out => redist32_stall_entry_o36_335_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist37_stall_entry_o41_335_fifo(STALLFIFO,195)
    redist37_stall_entry_o41_335_fifo_valid_in <= SE_stall_entry_V35;
    redist37_stall_entry_o41_335_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist37_stall_entry_o41_335_fifo_data_in <= bubble_select_stall_entry_mm;
    redist37_stall_entry_o41_335_fifo_valid_in_bitsignaltemp <= redist37_stall_entry_o41_335_fifo_valid_in(0);
    redist37_stall_entry_o41_335_fifo_stall_in_bitsignaltemp <= redist37_stall_entry_o41_335_fifo_stall_in(0);
    redist37_stall_entry_o41_335_fifo_valid_out(0) <= redist37_stall_entry_o41_335_fifo_valid_out_bitsignaltemp;
    redist37_stall_entry_o41_335_fifo_stall_out(0) <= redist37_stall_entry_o41_335_fifo_stall_out_bitsignaltemp;
    theredist37_stall_entry_o41_335_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 336,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist37_stall_entry_o41_335_fifo_valid_in_bitsignaltemp,
        stall_in => redist37_stall_entry_o41_335_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_mm,
        valid_out => redist37_stall_entry_o41_335_fifo_valid_out_bitsignaltemp,
        stall_out => redist37_stall_entry_o41_335_fifo_stall_out_bitsignaltemp,
        data_out => redist37_stall_entry_o41_335_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist38_stall_entry_o42_335_fifo(STALLFIFO,196)
    redist38_stall_entry_o42_335_fifo_valid_in <= SE_stall_entry_V36;
    redist38_stall_entry_o42_335_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist38_stall_entry_o42_335_fifo_data_in <= bubble_select_stall_entry_nn;
    redist38_stall_entry_o42_335_fifo_valid_in_bitsignaltemp <= redist38_stall_entry_o42_335_fifo_valid_in(0);
    redist38_stall_entry_o42_335_fifo_stall_in_bitsignaltemp <= redist38_stall_entry_o42_335_fifo_stall_in(0);
    redist38_stall_entry_o42_335_fifo_valid_out(0) <= redist38_stall_entry_o42_335_fifo_valid_out_bitsignaltemp;
    redist38_stall_entry_o42_335_fifo_stall_out(0) <= redist38_stall_entry_o42_335_fifo_stall_out_bitsignaltemp;
    theredist38_stall_entry_o42_335_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 336,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist38_stall_entry_o42_335_fifo_valid_in_bitsignaltemp,
        stall_in => redist38_stall_entry_o42_335_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_nn,
        valid_out => redist38_stall_entry_o42_335_fifo_valid_out_bitsignaltemp,
        stall_out => redist38_stall_entry_o42_335_fifo_stall_out_bitsignaltemp,
        data_out => redist38_stall_entry_o42_335_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist39_stall_entry_o43_335_fifo(STALLFIFO,197)
    redist39_stall_entry_o43_335_fifo_valid_in <= SE_stall_entry_V37;
    redist39_stall_entry_o43_335_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist39_stall_entry_o43_335_fifo_data_in <= bubble_select_stall_entry_oo;
    redist39_stall_entry_o43_335_fifo_valid_in_bitsignaltemp <= redist39_stall_entry_o43_335_fifo_valid_in(0);
    redist39_stall_entry_o43_335_fifo_stall_in_bitsignaltemp <= redist39_stall_entry_o43_335_fifo_stall_in(0);
    redist39_stall_entry_o43_335_fifo_valid_out(0) <= redist39_stall_entry_o43_335_fifo_valid_out_bitsignaltemp;
    redist39_stall_entry_o43_335_fifo_stall_out(0) <= redist39_stall_entry_o43_335_fifo_stall_out_bitsignaltemp;
    theredist39_stall_entry_o43_335_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 336,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist39_stall_entry_o43_335_fifo_valid_in_bitsignaltemp,
        stall_in => redist39_stall_entry_o43_335_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_oo,
        valid_out => redist39_stall_entry_o43_335_fifo_valid_out_bitsignaltemp,
        stall_out => redist39_stall_entry_o43_335_fifo_stall_out_bitsignaltemp,
        data_out => redist39_stall_entry_o43_335_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist40_stall_entry_o47_335_fifo(STALLFIFO,198)
    redist40_stall_entry_o47_335_fifo_valid_in <= SE_stall_entry_V38;
    redist40_stall_entry_o47_335_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist40_stall_entry_o47_335_fifo_data_in <= bubble_select_stall_entry_ss;
    redist40_stall_entry_o47_335_fifo_valid_in_bitsignaltemp <= redist40_stall_entry_o47_335_fifo_valid_in(0);
    redist40_stall_entry_o47_335_fifo_stall_in_bitsignaltemp <= redist40_stall_entry_o47_335_fifo_stall_in(0);
    redist40_stall_entry_o47_335_fifo_valid_out(0) <= redist40_stall_entry_o47_335_fifo_valid_out_bitsignaltemp;
    redist40_stall_entry_o47_335_fifo_stall_out(0) <= redist40_stall_entry_o47_335_fifo_stall_out_bitsignaltemp;
    theredist40_stall_entry_o47_335_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 336,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist40_stall_entry_o47_335_fifo_valid_in_bitsignaltemp,
        stall_in => redist40_stall_entry_o47_335_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_ss,
        valid_out => redist40_stall_entry_o47_335_fifo_valid_out_bitsignaltemp,
        stall_out => redist40_stall_entry_o47_335_fifo_stall_out_bitsignaltemp,
        data_out => redist40_stall_entry_o47_335_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist41_stall_entry_o48_335_fifo(STALLFIFO,199)
    redist41_stall_entry_o48_335_fifo_valid_in <= SE_stall_entry_V39;
    redist41_stall_entry_o48_335_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist41_stall_entry_o48_335_fifo_data_in <= bubble_select_stall_entry_tt;
    redist41_stall_entry_o48_335_fifo_valid_in_bitsignaltemp <= redist41_stall_entry_o48_335_fifo_valid_in(0);
    redist41_stall_entry_o48_335_fifo_stall_in_bitsignaltemp <= redist41_stall_entry_o48_335_fifo_stall_in(0);
    redist41_stall_entry_o48_335_fifo_valid_out(0) <= redist41_stall_entry_o48_335_fifo_valid_out_bitsignaltemp;
    redist41_stall_entry_o48_335_fifo_stall_out(0) <= redist41_stall_entry_o48_335_fifo_stall_out_bitsignaltemp;
    theredist41_stall_entry_o48_335_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 336,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist41_stall_entry_o48_335_fifo_valid_in_bitsignaltemp,
        stall_in => redist41_stall_entry_o48_335_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_tt,
        valid_out => redist41_stall_entry_o48_335_fifo_valid_out_bitsignaltemp,
        stall_out => redist41_stall_entry_o48_335_fifo_stall_out_bitsignaltemp,
        data_out => redist41_stall_entry_o48_335_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist42_stall_entry_o49_335_fifo(STALLFIFO,200)
    redist42_stall_entry_o49_335_fifo_valid_in <= SE_stall_entry_V40;
    redist42_stall_entry_o49_335_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist42_stall_entry_o49_335_fifo_data_in <= bubble_select_stall_entry_uu;
    redist42_stall_entry_o49_335_fifo_valid_in_bitsignaltemp <= redist42_stall_entry_o49_335_fifo_valid_in(0);
    redist42_stall_entry_o49_335_fifo_stall_in_bitsignaltemp <= redist42_stall_entry_o49_335_fifo_stall_in(0);
    redist42_stall_entry_o49_335_fifo_valid_out(0) <= redist42_stall_entry_o49_335_fifo_valid_out_bitsignaltemp;
    redist42_stall_entry_o49_335_fifo_stall_out(0) <= redist42_stall_entry_o49_335_fifo_stall_out_bitsignaltemp;
    theredist42_stall_entry_o49_335_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 336,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist42_stall_entry_o49_335_fifo_valid_in_bitsignaltemp,
        stall_in => redist42_stall_entry_o49_335_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_uu,
        valid_out => redist42_stall_entry_o49_335_fifo_valid_out_bitsignaltemp,
        stall_out => redist42_stall_entry_o49_335_fifo_stall_out_bitsignaltemp,
        data_out => redist42_stall_entry_o49_335_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist43_stall_entry_o50_335_fifo(STALLFIFO,201)
    redist43_stall_entry_o50_335_fifo_valid_in <= SE_stall_entry_V41;
    redist43_stall_entry_o50_335_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist43_stall_entry_o50_335_fifo_data_in <= bubble_select_stall_entry_vv;
    redist43_stall_entry_o50_335_fifo_valid_in_bitsignaltemp <= redist43_stall_entry_o50_335_fifo_valid_in(0);
    redist43_stall_entry_o50_335_fifo_stall_in_bitsignaltemp <= redist43_stall_entry_o50_335_fifo_stall_in(0);
    redist43_stall_entry_o50_335_fifo_valid_out(0) <= redist43_stall_entry_o50_335_fifo_valid_out_bitsignaltemp;
    redist43_stall_entry_o50_335_fifo_stall_out(0) <= redist43_stall_entry_o50_335_fifo_stall_out_bitsignaltemp;
    theredist43_stall_entry_o50_335_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 336,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist43_stall_entry_o50_335_fifo_valid_in_bitsignaltemp,
        stall_in => redist43_stall_entry_o50_335_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_vv,
        valid_out => redist43_stall_entry_o50_335_fifo_valid_out_bitsignaltemp,
        stall_out => redist43_stall_entry_o50_335_fifo_stall_out_bitsignaltemp,
        data_out => redist43_stall_entry_o50_335_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist44_stall_entry_o51_335_fifo(STALLFIFO,202)
    redist44_stall_entry_o51_335_fifo_valid_in <= SE_stall_entry_V42;
    redist44_stall_entry_o51_335_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist44_stall_entry_o51_335_fifo_data_in <= bubble_select_stall_entry_ww;
    redist44_stall_entry_o51_335_fifo_valid_in_bitsignaltemp <= redist44_stall_entry_o51_335_fifo_valid_in(0);
    redist44_stall_entry_o51_335_fifo_stall_in_bitsignaltemp <= redist44_stall_entry_o51_335_fifo_stall_in(0);
    redist44_stall_entry_o51_335_fifo_valid_out(0) <= redist44_stall_entry_o51_335_fifo_valid_out_bitsignaltemp;
    redist44_stall_entry_o51_335_fifo_stall_out(0) <= redist44_stall_entry_o51_335_fifo_stall_out_bitsignaltemp;
    theredist44_stall_entry_o51_335_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 336,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist44_stall_entry_o51_335_fifo_valid_in_bitsignaltemp,
        stall_in => redist44_stall_entry_o51_335_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_ww,
        valid_out => redist44_stall_entry_o51_335_fifo_valid_out_bitsignaltemp,
        stall_out => redist44_stall_entry_o51_335_fifo_stall_out_bitsignaltemp,
        data_out => redist44_stall_entry_o51_335_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- i_unnamed_ethash_search360_unnamed_ethash_search41_select_1_x(BITSELECT,37)@205
    i_unnamed_ethash_search360_unnamed_ethash_search41_select_1_x_b <= bubble_select_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_b(63 downto 32);

    -- bubble_join_redist36_stall_entry_o40_205_fifo(BITJOIN,343)
    bubble_join_redist36_stall_entry_o40_205_fifo_q <= redist36_stall_entry_o40_205_fifo_data_out;

    -- bubble_select_redist36_stall_entry_o40_205_fifo(BITSELECT,344)
    bubble_select_redist36_stall_entry_o40_205_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist36_stall_entry_o40_205_fifo_q(31 downto 0));

    -- bubble_join_redist8_stall_entry_o10_205_fifo(BITJOIN,259)
    bubble_join_redist8_stall_entry_o10_205_fifo_q <= redist8_stall_entry_o10_205_fifo_data_out;

    -- bubble_select_redist8_stall_entry_o10_205_fifo(BITSELECT,260)
    bubble_select_redist8_stall_entry_o10_205_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist8_stall_entry_o10_205_fifo_q(0 downto 0));

    -- i_acl_1416_ethash_search(MUX,53)@205 + 1
    i_acl_1416_ethash_search_s <= bubble_select_redist8_stall_entry_o10_205_fifo_b;
    i_acl_1416_ethash_search_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_1416_ethash_search_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_acl_1416_ethash_search_backEN = "1") THEN
                CASE (i_acl_1416_ethash_search_s) IS
                    WHEN "0" => i_acl_1416_ethash_search_q <= bubble_select_redist36_stall_entry_o40_205_fifo_b;
                    WHEN "1" => i_acl_1416_ethash_search_q <= i_unnamed_ethash_search360_unnamed_ethash_search41_select_1_x_b;
                    WHEN OTHERS => i_acl_1416_ethash_search_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- redist45_i_acl_1416_ethash_search_q_130_fifo(STALLFIFO,203)
    redist45_i_acl_1416_ethash_search_q_130_fifo_valid_in <= SE_in_redist45_i_acl_1416_ethash_search_q_130_fifo_V0;
    redist45_i_acl_1416_ethash_search_q_130_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist45_i_acl_1416_ethash_search_q_130_fifo_data_in <= i_acl_1416_ethash_search_q;
    redist45_i_acl_1416_ethash_search_q_130_fifo_valid_in_bitsignaltemp <= redist45_i_acl_1416_ethash_search_q_130_fifo_valid_in(0);
    redist45_i_acl_1416_ethash_search_q_130_fifo_stall_in_bitsignaltemp <= redist45_i_acl_1416_ethash_search_q_130_fifo_stall_in(0);
    redist45_i_acl_1416_ethash_search_q_130_fifo_valid_out(0) <= redist45_i_acl_1416_ethash_search_q_130_fifo_valid_out_bitsignaltemp;
    redist45_i_acl_1416_ethash_search_q_130_fifo_stall_out(0) <= redist45_i_acl_1416_ethash_search_q_130_fifo_stall_out_bitsignaltemp;
    theredist45_i_acl_1416_ethash_search_q_130_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 130,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist45_i_acl_1416_ethash_search_q_130_fifo_valid_in_bitsignaltemp,
        stall_in => redist45_i_acl_1416_ethash_search_q_130_fifo_stall_in_bitsignaltemp,
        data_in => i_acl_1416_ethash_search_q,
        valid_out => redist45_i_acl_1416_ethash_search_q_130_fifo_valid_out_bitsignaltemp,
        stall_out => redist45_i_acl_1416_ethash_search_q_130_fifo_stall_out_bitsignaltemp,
        data_out => redist45_i_acl_1416_ethash_search_q_130_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- i_unnamed_ethash_search360_unnamed_ethash_search41_select_0_x(BITSELECT,36)@205
    i_unnamed_ethash_search360_unnamed_ethash_search41_select_0_x_b <= bubble_select_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_b(31 downto 0);

    -- bubble_join_redist23_stall_entry_o26_205_fifo(BITJOIN,304)
    bubble_join_redist23_stall_entry_o26_205_fifo_q <= redist23_stall_entry_o26_205_fifo_data_out;

    -- bubble_select_redist23_stall_entry_o26_205_fifo(BITSELECT,305)
    bubble_select_redist23_stall_entry_o26_205_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist23_stall_entry_o26_205_fifo_q(31 downto 0));

    -- i_acl_1415_ethash_search(MUX,52)@205 + 1
    i_acl_1415_ethash_search_s <= bubble_select_redist8_stall_entry_o10_205_fifo_b;
    i_acl_1415_ethash_search_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_1415_ethash_search_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_acl_1415_ethash_search_backEN = "1") THEN
                CASE (i_acl_1415_ethash_search_s) IS
                    WHEN "0" => i_acl_1415_ethash_search_q <= bubble_select_redist23_stall_entry_o26_205_fifo_b;
                    WHEN "1" => i_acl_1415_ethash_search_q <= i_unnamed_ethash_search360_unnamed_ethash_search41_select_0_x_b;
                    WHEN OTHERS => i_acl_1415_ethash_search_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- redist46_i_acl_1415_ethash_search_q_130_fifo(STALLFIFO,204)
    redist46_i_acl_1415_ethash_search_q_130_fifo_valid_in <= SE_in_redist46_i_acl_1415_ethash_search_q_130_fifo_V0;
    redist46_i_acl_1415_ethash_search_q_130_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist46_i_acl_1415_ethash_search_q_130_fifo_data_in <= i_acl_1415_ethash_search_q;
    redist46_i_acl_1415_ethash_search_q_130_fifo_valid_in_bitsignaltemp <= redist46_i_acl_1415_ethash_search_q_130_fifo_valid_in(0);
    redist46_i_acl_1415_ethash_search_q_130_fifo_stall_in_bitsignaltemp <= redist46_i_acl_1415_ethash_search_q_130_fifo_stall_in(0);
    redist46_i_acl_1415_ethash_search_q_130_fifo_valid_out(0) <= redist46_i_acl_1415_ethash_search_q_130_fifo_valid_out_bitsignaltemp;
    redist46_i_acl_1415_ethash_search_q_130_fifo_stall_out(0) <= redist46_i_acl_1415_ethash_search_q_130_fifo_stall_out_bitsignaltemp;
    theredist46_i_acl_1415_ethash_search_q_130_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 130,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist46_i_acl_1415_ethash_search_q_130_fifo_valid_in_bitsignaltemp,
        stall_in => redist46_i_acl_1415_ethash_search_q_130_fifo_stall_in_bitsignaltemp,
        data_in => i_acl_1415_ethash_search_q,
        valid_out => redist46_i_acl_1415_ethash_search_q_130_fifo_valid_out_bitsignaltemp,
        stall_out => redist46_i_acl_1415_ethash_search_q_130_fifo_stall_out_bitsignaltemp,
        data_out => redist46_i_acl_1415_ethash_search_q_130_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- i_unnamed_ethash_search362_unnamed_ethash_search42_select_0_x_merged_bit_select(BITSELECT,100)@205
    i_unnamed_ethash_search362_unnamed_ethash_search42_select_0_x_merged_bit_select_b <= bubble_select_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_c(31 downto 0);
    i_unnamed_ethash_search362_unnamed_ethash_search42_select_0_x_merged_bit_select_c <= bubble_select_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_c(63 downto 32);

    -- bubble_join_redist35_stall_entry_o39_205_fifo(BITJOIN,340)
    bubble_join_redist35_stall_entry_o39_205_fifo_q <= redist35_stall_entry_o39_205_fifo_data_out;

    -- bubble_select_redist35_stall_entry_o39_205_fifo(BITSELECT,341)
    bubble_select_redist35_stall_entry_o39_205_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist35_stall_entry_o39_205_fifo_q(31 downto 0));

    -- i_acl_1414_ethash_search(MUX,51)@205 + 1
    i_acl_1414_ethash_search_s <= bubble_select_redist8_stall_entry_o10_205_fifo_b;
    i_acl_1414_ethash_search_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_1414_ethash_search_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_acl_1414_ethash_search_backEN = "1") THEN
                CASE (i_acl_1414_ethash_search_s) IS
                    WHEN "0" => i_acl_1414_ethash_search_q <= bubble_select_redist35_stall_entry_o39_205_fifo_b;
                    WHEN "1" => i_acl_1414_ethash_search_q <= i_unnamed_ethash_search362_unnamed_ethash_search42_select_0_x_merged_bit_select_c;
                    WHEN OTHERS => i_acl_1414_ethash_search_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- redist47_i_acl_1414_ethash_search_q_130_fifo(STALLFIFO,205)
    redist47_i_acl_1414_ethash_search_q_130_fifo_valid_in <= SE_in_redist47_i_acl_1414_ethash_search_q_130_fifo_V0;
    redist47_i_acl_1414_ethash_search_q_130_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist47_i_acl_1414_ethash_search_q_130_fifo_data_in <= i_acl_1414_ethash_search_q;
    redist47_i_acl_1414_ethash_search_q_130_fifo_valid_in_bitsignaltemp <= redist47_i_acl_1414_ethash_search_q_130_fifo_valid_in(0);
    redist47_i_acl_1414_ethash_search_q_130_fifo_stall_in_bitsignaltemp <= redist47_i_acl_1414_ethash_search_q_130_fifo_stall_in(0);
    redist47_i_acl_1414_ethash_search_q_130_fifo_valid_out(0) <= redist47_i_acl_1414_ethash_search_q_130_fifo_valid_out_bitsignaltemp;
    redist47_i_acl_1414_ethash_search_q_130_fifo_stall_out(0) <= redist47_i_acl_1414_ethash_search_q_130_fifo_stall_out_bitsignaltemp;
    theredist47_i_acl_1414_ethash_search_q_130_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 130,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist47_i_acl_1414_ethash_search_q_130_fifo_valid_in_bitsignaltemp,
        stall_in => redist47_i_acl_1414_ethash_search_q_130_fifo_stall_in_bitsignaltemp,
        data_in => i_acl_1414_ethash_search_q,
        valid_out => redist47_i_acl_1414_ethash_search_q_130_fifo_valid_out_bitsignaltemp,
        stall_out => redist47_i_acl_1414_ethash_search_q_130_fifo_stall_out_bitsignaltemp,
        data_out => redist47_i_acl_1414_ethash_search_q_130_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_redist22_stall_entry_o25_205_fifo(BITJOIN,301)
    bubble_join_redist22_stall_entry_o25_205_fifo_q <= redist22_stall_entry_o25_205_fifo_data_out;

    -- bubble_select_redist22_stall_entry_o25_205_fifo(BITSELECT,302)
    bubble_select_redist22_stall_entry_o25_205_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist22_stall_entry_o25_205_fifo_q(31 downto 0));

    -- i_acl_1413_ethash_search(MUX,50)@205 + 1
    i_acl_1413_ethash_search_s <= bubble_select_redist8_stall_entry_o10_205_fifo_b;
    i_acl_1413_ethash_search_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_1413_ethash_search_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_acl_1413_ethash_search_backEN = "1") THEN
                CASE (i_acl_1413_ethash_search_s) IS
                    WHEN "0" => i_acl_1413_ethash_search_q <= bubble_select_redist22_stall_entry_o25_205_fifo_b;
                    WHEN "1" => i_acl_1413_ethash_search_q <= i_unnamed_ethash_search362_unnamed_ethash_search42_select_0_x_merged_bit_select_b;
                    WHEN OTHERS => i_acl_1413_ethash_search_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- redist48_i_acl_1413_ethash_search_q_130_fifo(STALLFIFO,206)
    redist48_i_acl_1413_ethash_search_q_130_fifo_valid_in <= SE_in_redist48_i_acl_1413_ethash_search_q_130_fifo_V0;
    redist48_i_acl_1413_ethash_search_q_130_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist48_i_acl_1413_ethash_search_q_130_fifo_data_in <= i_acl_1413_ethash_search_q;
    redist48_i_acl_1413_ethash_search_q_130_fifo_valid_in_bitsignaltemp <= redist48_i_acl_1413_ethash_search_q_130_fifo_valid_in(0);
    redist48_i_acl_1413_ethash_search_q_130_fifo_stall_in_bitsignaltemp <= redist48_i_acl_1413_ethash_search_q_130_fifo_stall_in(0);
    redist48_i_acl_1413_ethash_search_q_130_fifo_valid_out(0) <= redist48_i_acl_1413_ethash_search_q_130_fifo_valid_out_bitsignaltemp;
    redist48_i_acl_1413_ethash_search_q_130_fifo_stall_out(0) <= redist48_i_acl_1413_ethash_search_q_130_fifo_stall_out_bitsignaltemp;
    theredist48_i_acl_1413_ethash_search_q_130_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 130,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist48_i_acl_1413_ethash_search_q_130_fifo_valid_in_bitsignaltemp,
        stall_in => redist48_i_acl_1413_ethash_search_q_130_fifo_stall_in_bitsignaltemp,
        data_in => i_acl_1413_ethash_search_q,
        valid_out => redist48_i_acl_1413_ethash_search_q_130_fifo_valid_out_bitsignaltemp,
        stall_out => redist48_i_acl_1413_ethash_search_q_130_fifo_stall_out_bitsignaltemp,
        data_out => redist48_i_acl_1413_ethash_search_q_130_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- c_i32_1gr(CONSTANT,43)
    c_i32_1gr_q <= "00000000000000000000000000000001";

    -- i_inc123_ethash_search(ADD,57)@0
    i_inc123_ethash_search_a <= STD_LOGIC_VECTOR("0" & bubble_select_stall_entry_l);
    i_inc123_ethash_search_b <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_inc123_ethash_search_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc123_ethash_search_a) + UNSIGNED(i_inc123_ethash_search_b));
    i_inc123_ethash_search_q <= i_inc123_ethash_search_o(32 downto 0);

    -- bgTrunc_i_inc123_ethash_search_sel_x(BITSELECT,3)@0
    bgTrunc_i_inc123_ethash_search_sel_x_b <= i_inc123_ethash_search_q(31 downto 0);

    -- redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo(STALLFIFO,213)
    redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_valid_in <= SE_stall_entry_V43;
    redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_data_in <= bgTrunc_i_inc123_ethash_search_sel_x_b;
    redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_valid_in_bitsignaltemp <= redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_valid_in(0);
    redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_stall_in_bitsignaltemp <= redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_stall_in(0);
    redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_valid_out(0) <= redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_valid_out_bitsignaltemp;
    redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_stall_out(0) <= redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_stall_out_bitsignaltemp;
    theredist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 336,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_valid_in_bitsignaltemp,
        stall_in => redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_stall_in_bitsignaltemp,
        data_in => bgTrunc_i_inc123_ethash_search_sel_x_b,
        valid_out => redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_valid_out_bitsignaltemp,
        stall_out => redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_stall_out_bitsignaltemp,
        data_out => redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo(STALLENABLE,556)
    -- Valid signal propagation
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_V0 <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall <= in_stall_in or not (SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and0 <= redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_valid_out;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and1 <= redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and0;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and2 <= redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and1;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and3 <= redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and2;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and4 <= redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and3;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and5 <= redist48_i_acl_1413_ethash_search_q_130_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and4;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and6 <= redist47_i_acl_1414_ethash_search_q_130_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and5;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and7 <= redist46_i_acl_1415_ethash_search_q_130_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and6;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and8 <= redist45_i_acl_1416_ethash_search_q_130_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and7;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and9 <= redist44_stall_entry_o51_335_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and8;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and10 <= redist43_stall_entry_o50_335_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and9;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and11 <= redist42_stall_entry_o49_335_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and10;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and12 <= redist41_stall_entry_o48_335_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and11;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and13 <= redist40_stall_entry_o47_335_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and12;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and14 <= redist39_stall_entry_o43_335_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and13;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and15 <= redist38_stall_entry_o42_335_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and14;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and16 <= redist37_stall_entry_o41_335_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and15;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and17 <= redist32_stall_entry_o36_335_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and16;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and18 <= redist31_stall_entry_o35_335_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and17;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and19 <= redist30_stall_entry_o34_335_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and18;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and20 <= redist29_stall_entry_o33_335_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and19;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and21 <= redist28_stall_entry_o32_335_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and20;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and22 <= redist27_stall_entry_o30_335_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and21;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and23 <= redist26_stall_entry_o29_335_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and22;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and24 <= redist25_stall_entry_o28_335_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and23;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and25 <= redist24_stall_entry_o27_335_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and24;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and26 <= redist19_stall_entry_o22_335_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and25;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and27 <= redist18_stall_entry_o21_335_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and26;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and28 <= redist17_stall_entry_o20_335_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and27;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and29 <= redist16_stall_entry_o19_335_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and28;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and30 <= redist13_stall_entry_o17_335_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and29;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and31 <= redist12_stall_entry_o16_335_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and30;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and32 <= redist11_stall_entry_o13_335_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and31;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and33 <= redist10_stall_entry_o12_335_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and32;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and34 <= redist6_stall_entry_o9_335_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and33;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and35 <= redist5_stall_entry_o8_335_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and34;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and36 <= redist4_stall_entry_o7_335_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and35;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and37 <= redist3_stall_entry_o6_335_fifo_valid_out and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and36;
    SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_wireValid <= i_sbar_unnamed_ethash_search40_ethash_search_out_valid_exit and SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_and37;

    -- redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo(STALLFIFO,211)
    redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo_valid_in <= SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_V4;
    redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo_data_in <= bubble_select_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_f;
    redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo_valid_in_bitsignaltemp <= redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo_valid_in(0);
    redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo_stall_in_bitsignaltemp <= redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo_stall_in(0);
    redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo_valid_out(0) <= redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo_valid_out_bitsignaltemp;
    redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo_stall_out(0) <= redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo_stall_out_bitsignaltemp;
    theredist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 155,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo_valid_in_bitsignaltemp,
        stall_in => redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_f,
        valid_out => redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo_valid_out_bitsignaltemp,
        stall_out => redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo_stall_out_bitsignaltemp,
        data_out => redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo(STALLFIFO,210)
    redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo_valid_in <= SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_V3;
    redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo_data_in <= bubble_select_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_e;
    redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo_valid_in_bitsignaltemp <= redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo_valid_in(0);
    redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo_stall_in_bitsignaltemp <= redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo_stall_in(0);
    redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo_valid_out(0) <= redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo_valid_out_bitsignaltemp;
    redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo_stall_out(0) <= redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo_stall_out_bitsignaltemp;
    theredist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 155,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo_valid_in_bitsignaltemp,
        stall_in => redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_e,
        valid_out => redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo_valid_out_bitsignaltemp,
        stall_out => redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo_stall_out_bitsignaltemp,
        data_out => redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo(STALLFIFO,209)
    redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo_valid_in <= SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_V2;
    redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo_data_in <= bubble_select_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_d;
    redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo_valid_in_bitsignaltemp <= redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo_valid_in(0);
    redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo_stall_in_bitsignaltemp <= redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo_stall_in(0);
    redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo_valid_out(0) <= redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo_valid_out_bitsignaltemp;
    redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo_stall_out(0) <= redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo_stall_out_bitsignaltemp;
    theredist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 155,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo_valid_in_bitsignaltemp,
        stall_in => redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_d,
        valid_out => redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo_valid_out_bitsignaltemp,
        stall_out => redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo_stall_out_bitsignaltemp,
        data_out => redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo(STALLFIFO,208)
    redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo_valid_in <= SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_V1;
    redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo_stall_in <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_backStall;
    redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo_data_in <= bubble_select_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_c;
    redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo_valid_in_bitsignaltemp <= redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo_valid_in(0);
    redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo_stall_in_bitsignaltemp <= redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo_stall_in(0);
    redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo_valid_out(0) <= redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo_valid_out_bitsignaltemp;
    redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo_stall_out(0) <= redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo_stall_out_bitsignaltemp;
    theredist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 155,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo_valid_in_bitsignaltemp,
        stall_in => redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_c,
        valid_out => redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo_valid_out_bitsignaltemp,
        stall_out => redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo_stall_out_bitsignaltemp,
        data_out => redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo(STALLFIFO,207)
    redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_valid_in <= SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_V0;
    redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_stall_in <= SE_out_redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_backStall;
    redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_data_in <= bubble_select_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_b;
    redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_valid_in_bitsignaltemp <= redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_valid_in(0);
    redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_stall_in_bitsignaltemp <= redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_stall_in(0);
    redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_valid_out(0) <= redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_valid_out_bitsignaltemp;
    redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_stall_out(0) <= redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_stall_out_bitsignaltemp;
    theredist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 25,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_valid_in_bitsignaltemp,
        stall_in => redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_b,
        valid_out => redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_valid_out_bitsignaltemp,
        stall_out => redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_stall_out_bitsignaltemp,
        data_out => redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x(STALLENABLE,414)
    SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_fromReg0 <= (others => '0');
            SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_fromReg1 <= (others => '0');
            SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_fromReg2 <= (others => '0');
            SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_fromReg3 <= (others => '0');
            SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_fromReg4 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_fromReg0 <= SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_fromReg1 <= SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_toReg1;
            -- Succesor 2
            SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_fromReg2 <= SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_toReg2;
            -- Succesor 3
            SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_fromReg3 <= SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_toReg3;
            -- Succesor 4
            SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_fromReg4 <= SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_toReg4;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_consumed0 <= (not (redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_stall_out) and SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_wireValid) or SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_fromReg0;
    SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_consumed1 <= (not (redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo_stall_out) and SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_wireValid) or SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_fromReg1;
    SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_consumed2 <= (not (redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo_stall_out) and SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_wireValid) or SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_fromReg2;
    SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_consumed3 <= (not (redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo_stall_out) and SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_wireValid) or SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_fromReg3;
    SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_consumed4 <= (not (redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo_stall_out) and SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_wireValid) or SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_fromReg4;
    -- Consuming
    SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_StallValid <= SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_backStall and SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_wireValid;
    SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_toReg0 <= SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_StallValid and SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_consumed0;
    SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_toReg1 <= SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_StallValid and SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_consumed1;
    SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_toReg2 <= SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_StallValid and SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_consumed2;
    SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_toReg3 <= SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_StallValid and SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_consumed3;
    SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_toReg4 <= SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_StallValid and SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_consumed4;
    -- Backward Stall generation
    SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_or0 <= SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_consumed0;
    SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_or1 <= SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_consumed1 and SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_or0;
    SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_or2 <= SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_consumed2 and SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_or1;
    SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_or3 <= SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_consumed3 and SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_or2;
    SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_wireStall <= not (SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_consumed4 and SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_or3);
    SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_backStall <= SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_V0 <= SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_wireValid and not (SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_fromReg0);
    SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_V1 <= SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_wireValid and not (SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_fromReg1);
    SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_V2 <= SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_wireValid and not (SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_fromReg2);
    SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_V3 <= SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_wireValid and not (SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_fromReg3);
    SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_V4 <= SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_wireValid and not (SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_fromReg4);
    -- Computing multiple Valid(s)
    SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_wireValid <= i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_o_valid;

    -- bubble_join_redist34_stall_entry_o38_173_fifo(BITJOIN,337)
    bubble_join_redist34_stall_entry_o38_173_fifo_q <= redist34_stall_entry_o38_173_fifo_data_out;

    -- bubble_select_redist34_stall_entry_o38_173_fifo(BITSELECT,338)
    bubble_select_redist34_stall_entry_o38_173_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist34_stall_entry_o38_173_fifo_q(31 downto 0));

    -- bubble_join_redist21_stall_entry_o24_173_fifo(BITJOIN,298)
    bubble_join_redist21_stall_entry_o24_173_fifo_q <= redist21_stall_entry_o24_173_fifo_data_out;

    -- bubble_select_redist21_stall_entry_o24_173_fifo(BITSELECT,299)
    bubble_select_redist21_stall_entry_o24_173_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist21_stall_entry_o24_173_fifo_q(31 downto 0));

    -- bubble_join_redist33_stall_entry_o37_173_fifo(BITJOIN,334)
    bubble_join_redist33_stall_entry_o37_173_fifo_q <= redist33_stall_entry_o37_173_fifo_data_out;

    -- bubble_select_redist33_stall_entry_o37_173_fifo(BITSELECT,335)
    bubble_select_redist33_stall_entry_o37_173_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist33_stall_entry_o37_173_fifo_q(31 downto 0));

    -- bubble_join_redist20_stall_entry_o23_173_fifo(BITJOIN,295)
    bubble_join_redist20_stall_entry_o23_173_fifo_q <= redist20_stall_entry_o23_173_fifo_data_out;

    -- bubble_select_redist20_stall_entry_o23_173_fifo(BITSELECT,296)
    bubble_select_redist20_stall_entry_o23_173_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist20_stall_entry_o23_173_fifo_q(31 downto 0));

    -- bubble_join_redist7_stall_entry_o10_173_fifo(BITJOIN,256)
    bubble_join_redist7_stall_entry_o10_173_fifo_q <= redist7_stall_entry_o10_173_fifo_data_out;

    -- bubble_select_redist7_stall_entry_o10_173_fifo(BITSELECT,257)
    bubble_select_redist7_stall_entry_o10_173_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist7_stall_entry_o10_173_fifo_q(0 downto 0));

    -- bubble_join_redist0_stall_entry_o4_173_fifo(BITJOIN,235)
    bubble_join_redist0_stall_entry_o4_173_fifo_q <= redist0_stall_entry_o4_173_fifo_data_out;

    -- bubble_select_redist0_stall_entry_o4_173_fifo(BITSELECT,236)
    bubble_select_redist0_stall_entry_o4_173_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist0_stall_entry_o4_173_fifo_q(63 downto 0));

    -- i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x(BLACKBOX,35)@173
    -- in in_i_stall@20000000
    -- out out_c1_exit_0@181
    -- out out_c1_exit_1@181
    -- out out_c1_exit_2@181
    -- out out_c1_exit_3@181
    -- out out_c1_exit_4@181
    -- out out_memcoalesce_null_load_016_avm_address@20000000
    -- out out_memcoalesce_null_load_016_avm_burstcount@20000000
    -- out out_memcoalesce_null_load_016_avm_byteenable@20000000
    -- out out_memcoalesce_null_load_016_avm_enable@20000000
    -- out out_memcoalesce_null_load_016_avm_read@20000000
    -- out out_memcoalesce_null_load_016_avm_write@20000000
    -- out out_memcoalesce_null_load_016_avm_writedata@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@181
    thei_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x : i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search
    PORT MAP (
        in_unnamed_ethash_search37_0 => bubble_select_i_sbar_unnamed_ethash_search36_ethash_search_b,
        in_unnamed_ethash_search37_1 => bubble_select_redist0_stall_entry_o4_173_fifo_b,
        in_unnamed_ethash_search37_2 => bubble_select_redist9_stall_entry_o11_173_fifo_b,
        in_unnamed_ethash_search37_3 => bubble_select_redist15_stall_entry_o18_173_fifo_b,
        in_unnamed_ethash_search37_4 => bubble_select_redist7_stall_entry_o10_173_fifo_b,
        in_unnamed_ethash_search37_5 => bubble_select_redist20_stall_entry_o23_173_fifo_b,
        in_unnamed_ethash_search37_6 => bubble_select_redist33_stall_entry_o37_173_fifo_b,
        in_unnamed_ethash_search37_7 => bubble_select_redist21_stall_entry_o24_173_fifo_b,
        in_unnamed_ethash_search37_8 => bubble_select_redist34_stall_entry_o38_173_fifo_b,
        in_flush => in_flush,
        in_i_stall => SE_out_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_backStall,
        in_i_valid => SE_out_redist34_stall_entry_o38_173_fifo_V0,
        in_memcoalesce_null_load_016_avm_readdata => in_memcoalesce_null_load_016_avm_readdata,
        in_memcoalesce_null_load_016_avm_readdatavalid => in_memcoalesce_null_load_016_avm_readdatavalid,
        in_memcoalesce_null_load_016_avm_waitrequest => in_memcoalesce_null_load_016_avm_waitrequest,
        in_memcoalesce_null_load_016_avm_writeack => in_memcoalesce_null_load_016_avm_writeack,
        out_c1_exit_0 => i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0,
        out_c1_exit_1 => i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1,
        out_c1_exit_2 => i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2,
        out_c1_exit_3 => i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3,
        out_c1_exit_4 => i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4,
        out_memcoalesce_null_load_016_avm_address => i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_address,
        out_memcoalesce_null_load_016_avm_burstcount => i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_burstcount,
        out_memcoalesce_null_load_016_avm_byteenable => i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_byteenable,
        out_memcoalesce_null_load_016_avm_enable => i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_enable,
        out_memcoalesce_null_load_016_avm_read => i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_read,
        out_memcoalesce_null_load_016_avm_write => i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_write,
        out_memcoalesce_null_load_016_avm_writedata => i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_writedata,
        out_o_stall => i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist7_stall_entry_o10_173_fifo(STALLENABLE,460)
    SE_out_redist7_stall_entry_o10_173_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist7_stall_entry_o10_173_fifo_fromReg0 <= (others => '0');
            SE_out_redist7_stall_entry_o10_173_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist7_stall_entry_o10_173_fifo_fromReg0 <= SE_out_redist7_stall_entry_o10_173_fifo_toReg0;
            -- Succesor 1
            SE_out_redist7_stall_entry_o10_173_fifo_fromReg1 <= SE_out_redist7_stall_entry_o10_173_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist7_stall_entry_o10_173_fifo_consumed0 <= (not (SE_out_redist34_stall_entry_o38_173_fifo_backStall) and SE_out_redist7_stall_entry_o10_173_fifo_wireValid) or SE_out_redist7_stall_entry_o10_173_fifo_fromReg0;
    SE_out_redist7_stall_entry_o10_173_fifo_consumed1 <= (not (redist8_stall_entry_o10_205_fifo_stall_out) and SE_out_redist7_stall_entry_o10_173_fifo_wireValid) or SE_out_redist7_stall_entry_o10_173_fifo_fromReg1;
    -- Consuming
    SE_out_redist7_stall_entry_o10_173_fifo_StallValid <= SE_out_redist7_stall_entry_o10_173_fifo_backStall and SE_out_redist7_stall_entry_o10_173_fifo_wireValid;
    SE_out_redist7_stall_entry_o10_173_fifo_toReg0 <= SE_out_redist7_stall_entry_o10_173_fifo_StallValid and SE_out_redist7_stall_entry_o10_173_fifo_consumed0;
    SE_out_redist7_stall_entry_o10_173_fifo_toReg1 <= SE_out_redist7_stall_entry_o10_173_fifo_StallValid and SE_out_redist7_stall_entry_o10_173_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist7_stall_entry_o10_173_fifo_or0 <= SE_out_redist7_stall_entry_o10_173_fifo_consumed0;
    SE_out_redist7_stall_entry_o10_173_fifo_wireStall <= not (SE_out_redist7_stall_entry_o10_173_fifo_consumed1 and SE_out_redist7_stall_entry_o10_173_fifo_or0);
    SE_out_redist7_stall_entry_o10_173_fifo_backStall <= SE_out_redist7_stall_entry_o10_173_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist7_stall_entry_o10_173_fifo_V0 <= SE_out_redist7_stall_entry_o10_173_fifo_wireValid and not (SE_out_redist7_stall_entry_o10_173_fifo_fromReg0);
    SE_out_redist7_stall_entry_o10_173_fifo_V1 <= SE_out_redist7_stall_entry_o10_173_fifo_wireValid and not (SE_out_redist7_stall_entry_o10_173_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist7_stall_entry_o10_173_fifo_wireValid <= redist7_stall_entry_o10_173_fifo_valid_out;

    -- redist0_stall_entry_o4_173_fifo(STALLFIFO,158)
    redist0_stall_entry_o4_173_fifo_valid_in <= SE_stall_entry_V1;
    redist0_stall_entry_o4_173_fifo_stall_in <= SE_out_redist34_stall_entry_o38_173_fifo_backStall;
    redist0_stall_entry_o4_173_fifo_data_in <= bubble_select_stall_entry_b;
    redist0_stall_entry_o4_173_fifo_valid_in_bitsignaltemp <= redist0_stall_entry_o4_173_fifo_valid_in(0);
    redist0_stall_entry_o4_173_fifo_stall_in_bitsignaltemp <= redist0_stall_entry_o4_173_fifo_stall_in(0);
    redist0_stall_entry_o4_173_fifo_valid_out(0) <= redist0_stall_entry_o4_173_fifo_valid_out_bitsignaltemp;
    redist0_stall_entry_o4_173_fifo_stall_out(0) <= redist0_stall_entry_o4_173_fifo_stall_out_bitsignaltemp;
    theredist0_stall_entry_o4_173_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 174,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist0_stall_entry_o4_173_fifo_valid_in_bitsignaltemp,
        stall_in => redist0_stall_entry_o4_173_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_b,
        valid_out => redist0_stall_entry_o4_173_fifo_valid_out_bitsignaltemp,
        stall_out => redist0_stall_entry_o4_173_fifo_stall_out_bitsignaltemp,
        data_out => redist0_stall_entry_o4_173_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist20_stall_entry_o23_173_fifo(STALLFIFO,178)
    redist20_stall_entry_o23_173_fifo_valid_in <= SE_stall_entry_V18;
    redist20_stall_entry_o23_173_fifo_stall_in <= SE_out_redist34_stall_entry_o38_173_fifo_backStall;
    redist20_stall_entry_o23_173_fifo_data_in <= bubble_select_stall_entry_u;
    redist20_stall_entry_o23_173_fifo_valid_in_bitsignaltemp <= redist20_stall_entry_o23_173_fifo_valid_in(0);
    redist20_stall_entry_o23_173_fifo_stall_in_bitsignaltemp <= redist20_stall_entry_o23_173_fifo_stall_in(0);
    redist20_stall_entry_o23_173_fifo_valid_out(0) <= redist20_stall_entry_o23_173_fifo_valid_out_bitsignaltemp;
    redist20_stall_entry_o23_173_fifo_stall_out(0) <= redist20_stall_entry_o23_173_fifo_stall_out_bitsignaltemp;
    theredist20_stall_entry_o23_173_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 174,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist20_stall_entry_o23_173_fifo_valid_in_bitsignaltemp,
        stall_in => redist20_stall_entry_o23_173_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_u,
        valid_out => redist20_stall_entry_o23_173_fifo_valid_out_bitsignaltemp,
        stall_out => redist20_stall_entry_o23_173_fifo_stall_out_bitsignaltemp,
        data_out => redist20_stall_entry_o23_173_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist21_stall_entry_o24_173_fifo(STALLFIFO,179)
    redist21_stall_entry_o24_173_fifo_valid_in <= SE_stall_entry_V19;
    redist21_stall_entry_o24_173_fifo_stall_in <= SE_out_redist34_stall_entry_o38_173_fifo_backStall;
    redist21_stall_entry_o24_173_fifo_data_in <= bubble_select_stall_entry_v;
    redist21_stall_entry_o24_173_fifo_valid_in_bitsignaltemp <= redist21_stall_entry_o24_173_fifo_valid_in(0);
    redist21_stall_entry_o24_173_fifo_stall_in_bitsignaltemp <= redist21_stall_entry_o24_173_fifo_stall_in(0);
    redist21_stall_entry_o24_173_fifo_valid_out(0) <= redist21_stall_entry_o24_173_fifo_valid_out_bitsignaltemp;
    redist21_stall_entry_o24_173_fifo_stall_out(0) <= redist21_stall_entry_o24_173_fifo_stall_out_bitsignaltemp;
    theredist21_stall_entry_o24_173_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 174,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist21_stall_entry_o24_173_fifo_valid_in_bitsignaltemp,
        stall_in => redist21_stall_entry_o24_173_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_v,
        valid_out => redist21_stall_entry_o24_173_fifo_valid_out_bitsignaltemp,
        stall_out => redist21_stall_entry_o24_173_fifo_stall_out_bitsignaltemp,
        data_out => redist21_stall_entry_o24_173_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist33_stall_entry_o37_173_fifo(STALLFIFO,191)
    redist33_stall_entry_o37_173_fifo_valid_in <= SE_stall_entry_V31;
    redist33_stall_entry_o37_173_fifo_stall_in <= SE_out_redist34_stall_entry_o38_173_fifo_backStall;
    redist33_stall_entry_o37_173_fifo_data_in <= bubble_select_stall_entry_ii;
    redist33_stall_entry_o37_173_fifo_valid_in_bitsignaltemp <= redist33_stall_entry_o37_173_fifo_valid_in(0);
    redist33_stall_entry_o37_173_fifo_stall_in_bitsignaltemp <= redist33_stall_entry_o37_173_fifo_stall_in(0);
    redist33_stall_entry_o37_173_fifo_valid_out(0) <= redist33_stall_entry_o37_173_fifo_valid_out_bitsignaltemp;
    redist33_stall_entry_o37_173_fifo_stall_out(0) <= redist33_stall_entry_o37_173_fifo_stall_out_bitsignaltemp;
    theredist33_stall_entry_o37_173_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 174,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist33_stall_entry_o37_173_fifo_valid_in_bitsignaltemp,
        stall_in => redist33_stall_entry_o37_173_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_ii,
        valid_out => redist33_stall_entry_o37_173_fifo_valid_out_bitsignaltemp,
        stall_out => redist33_stall_entry_o37_173_fifo_stall_out_bitsignaltemp,
        data_out => redist33_stall_entry_o37_173_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist34_stall_entry_o38_173_fifo(STALLFIFO,192)
    redist34_stall_entry_o38_173_fifo_valid_in <= SE_stall_entry_V32;
    redist34_stall_entry_o38_173_fifo_stall_in <= SE_out_redist34_stall_entry_o38_173_fifo_backStall;
    redist34_stall_entry_o38_173_fifo_data_in <= bubble_select_stall_entry_jj;
    redist34_stall_entry_o38_173_fifo_valid_in_bitsignaltemp <= redist34_stall_entry_o38_173_fifo_valid_in(0);
    redist34_stall_entry_o38_173_fifo_stall_in_bitsignaltemp <= redist34_stall_entry_o38_173_fifo_stall_in(0);
    redist34_stall_entry_o38_173_fifo_valid_out(0) <= redist34_stall_entry_o38_173_fifo_valid_out_bitsignaltemp;
    redist34_stall_entry_o38_173_fifo_stall_out(0) <= redist34_stall_entry_o38_173_fifo_stall_out_bitsignaltemp;
    theredist34_stall_entry_o38_173_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 174,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist34_stall_entry_o38_173_fifo_valid_in_bitsignaltemp,
        stall_in => redist34_stall_entry_o38_173_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_jj,
        valid_out => redist34_stall_entry_o38_173_fifo_valid_out_bitsignaltemp,
        stall_out => redist34_stall_entry_o38_173_fifo_stall_out_bitsignaltemp,
        data_out => redist34_stall_entry_o38_173_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist34_stall_entry_o38_173_fifo(STALLENABLE,514)
    -- Valid signal propagation
    SE_out_redist34_stall_entry_o38_173_fifo_V0 <= SE_out_redist34_stall_entry_o38_173_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist34_stall_entry_o38_173_fifo_backStall <= i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_o_stall or not (SE_out_redist34_stall_entry_o38_173_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist34_stall_entry_o38_173_fifo_and0 <= redist34_stall_entry_o38_173_fifo_valid_out;
    SE_out_redist34_stall_entry_o38_173_fifo_and1 <= redist33_stall_entry_o37_173_fifo_valid_out and SE_out_redist34_stall_entry_o38_173_fifo_and0;
    SE_out_redist34_stall_entry_o38_173_fifo_and2 <= redist21_stall_entry_o24_173_fifo_valid_out and SE_out_redist34_stall_entry_o38_173_fifo_and1;
    SE_out_redist34_stall_entry_o38_173_fifo_and3 <= redist20_stall_entry_o23_173_fifo_valid_out and SE_out_redist34_stall_entry_o38_173_fifo_and2;
    SE_out_redist34_stall_entry_o38_173_fifo_and4 <= redist0_stall_entry_o4_173_fifo_valid_out and SE_out_redist34_stall_entry_o38_173_fifo_and3;
    SE_out_redist34_stall_entry_o38_173_fifo_and5 <= SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_V1 and SE_out_redist34_stall_entry_o38_173_fifo_and4;
    SE_out_redist34_stall_entry_o38_173_fifo_and6 <= SE_out_redist7_stall_entry_o10_173_fifo_V0 and SE_out_redist34_stall_entry_o38_173_fifo_and5;
    SE_out_redist34_stall_entry_o38_173_fifo_and7 <= SE_out_redist9_stall_entry_o11_173_fifo_V1 and SE_out_redist34_stall_entry_o38_173_fifo_and6;
    SE_out_redist34_stall_entry_o38_173_fifo_wireValid <= SE_out_redist15_stall_entry_o18_173_fifo_V1 and SE_out_redist34_stall_entry_o38_173_fifo_and7;

    -- redist15_stall_entry_o18_173_fifo(STALLFIFO,173)
    redist15_stall_entry_o18_173_fifo_valid_in <= SE_out_redist14_stall_entry_o18_12_fifo_V1;
    redist15_stall_entry_o18_173_fifo_stall_in <= SE_out_redist15_stall_entry_o18_173_fifo_backStall;
    redist15_stall_entry_o18_173_fifo_data_in <= bubble_select_redist14_stall_entry_o18_12_fifo_b;
    redist15_stall_entry_o18_173_fifo_valid_in_bitsignaltemp <= redist15_stall_entry_o18_173_fifo_valid_in(0);
    redist15_stall_entry_o18_173_fifo_stall_in_bitsignaltemp <= redist15_stall_entry_o18_173_fifo_stall_in(0);
    redist15_stall_entry_o18_173_fifo_valid_out(0) <= redist15_stall_entry_o18_173_fifo_valid_out_bitsignaltemp;
    redist15_stall_entry_o18_173_fifo_stall_out(0) <= redist15_stall_entry_o18_173_fifo_stall_out_bitsignaltemp;
    theredist15_stall_entry_o18_173_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 162,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist15_stall_entry_o18_173_fifo_valid_in_bitsignaltemp,
        stall_in => redist15_stall_entry_o18_173_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist14_stall_entry_o18_12_fifo_b,
        valid_out => redist15_stall_entry_o18_173_fifo_valid_out_bitsignaltemp,
        stall_out => redist15_stall_entry_o18_173_fifo_stall_out_bitsignaltemp,
        data_out => redist15_stall_entry_o18_173_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist15_stall_entry_o18_173_fifo(STALLENABLE,476)
    SE_out_redist15_stall_entry_o18_173_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist15_stall_entry_o18_173_fifo_fromReg0 <= (others => '0');
            SE_out_redist15_stall_entry_o18_173_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist15_stall_entry_o18_173_fifo_fromReg0 <= SE_out_redist15_stall_entry_o18_173_fifo_toReg0;
            -- Succesor 1
            SE_out_redist15_stall_entry_o18_173_fifo_fromReg1 <= SE_out_redist15_stall_entry_o18_173_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist15_stall_entry_o18_173_fifo_consumed0 <= (not (SE_out_redist2_stall_entry_o5_173_fifo_backStall) and SE_out_redist15_stall_entry_o18_173_fifo_wireValid) or SE_out_redist15_stall_entry_o18_173_fifo_fromReg0;
    SE_out_redist15_stall_entry_o18_173_fifo_consumed1 <= (not (SE_out_redist34_stall_entry_o38_173_fifo_backStall) and SE_out_redist15_stall_entry_o18_173_fifo_wireValid) or SE_out_redist15_stall_entry_o18_173_fifo_fromReg1;
    -- Consuming
    SE_out_redist15_stall_entry_o18_173_fifo_StallValid <= SE_out_redist15_stall_entry_o18_173_fifo_backStall and SE_out_redist15_stall_entry_o18_173_fifo_wireValid;
    SE_out_redist15_stall_entry_o18_173_fifo_toReg0 <= SE_out_redist15_stall_entry_o18_173_fifo_StallValid and SE_out_redist15_stall_entry_o18_173_fifo_consumed0;
    SE_out_redist15_stall_entry_o18_173_fifo_toReg1 <= SE_out_redist15_stall_entry_o18_173_fifo_StallValid and SE_out_redist15_stall_entry_o18_173_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist15_stall_entry_o18_173_fifo_or0 <= SE_out_redist15_stall_entry_o18_173_fifo_consumed0;
    SE_out_redist15_stall_entry_o18_173_fifo_wireStall <= not (SE_out_redist15_stall_entry_o18_173_fifo_consumed1 and SE_out_redist15_stall_entry_o18_173_fifo_or0);
    SE_out_redist15_stall_entry_o18_173_fifo_backStall <= SE_out_redist15_stall_entry_o18_173_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist15_stall_entry_o18_173_fifo_V0 <= SE_out_redist15_stall_entry_o18_173_fifo_wireValid and not (SE_out_redist15_stall_entry_o18_173_fifo_fromReg0);
    SE_out_redist15_stall_entry_o18_173_fifo_V1 <= SE_out_redist15_stall_entry_o18_173_fifo_wireValid and not (SE_out_redist15_stall_entry_o18_173_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist15_stall_entry_o18_173_fifo_wireValid <= redist15_stall_entry_o18_173_fifo_valid_out;

    -- SE_out_redist9_stall_entry_o11_173_fifo(STALLENABLE,464)
    SE_out_redist9_stall_entry_o11_173_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist9_stall_entry_o11_173_fifo_fromReg0 <= (others => '0');
            SE_out_redist9_stall_entry_o11_173_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist9_stall_entry_o11_173_fifo_fromReg0 <= SE_out_redist9_stall_entry_o11_173_fifo_toReg0;
            -- Succesor 1
            SE_out_redist9_stall_entry_o11_173_fifo_fromReg1 <= SE_out_redist9_stall_entry_o11_173_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist9_stall_entry_o11_173_fifo_consumed0 <= (not (SE_out_redist2_stall_entry_o5_173_fifo_backStall) and SE_out_redist9_stall_entry_o11_173_fifo_wireValid) or SE_out_redist9_stall_entry_o11_173_fifo_fromReg0;
    SE_out_redist9_stall_entry_o11_173_fifo_consumed1 <= (not (SE_out_redist34_stall_entry_o38_173_fifo_backStall) and SE_out_redist9_stall_entry_o11_173_fifo_wireValid) or SE_out_redist9_stall_entry_o11_173_fifo_fromReg1;
    -- Consuming
    SE_out_redist9_stall_entry_o11_173_fifo_StallValid <= SE_out_redist9_stall_entry_o11_173_fifo_backStall and SE_out_redist9_stall_entry_o11_173_fifo_wireValid;
    SE_out_redist9_stall_entry_o11_173_fifo_toReg0 <= SE_out_redist9_stall_entry_o11_173_fifo_StallValid and SE_out_redist9_stall_entry_o11_173_fifo_consumed0;
    SE_out_redist9_stall_entry_o11_173_fifo_toReg1 <= SE_out_redist9_stall_entry_o11_173_fifo_StallValid and SE_out_redist9_stall_entry_o11_173_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist9_stall_entry_o11_173_fifo_or0 <= SE_out_redist9_stall_entry_o11_173_fifo_consumed0;
    SE_out_redist9_stall_entry_o11_173_fifo_wireStall <= not (SE_out_redist9_stall_entry_o11_173_fifo_consumed1 and SE_out_redist9_stall_entry_o11_173_fifo_or0);
    SE_out_redist9_stall_entry_o11_173_fifo_backStall <= SE_out_redist9_stall_entry_o11_173_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist9_stall_entry_o11_173_fifo_V0 <= SE_out_redist9_stall_entry_o11_173_fifo_wireValid and not (SE_out_redist9_stall_entry_o11_173_fifo_fromReg0);
    SE_out_redist9_stall_entry_o11_173_fifo_V1 <= SE_out_redist9_stall_entry_o11_173_fifo_wireValid and not (SE_out_redist9_stall_entry_o11_173_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist9_stall_entry_o11_173_fifo_wireValid <= redist9_stall_entry_o11_173_fifo_valid_out;

    -- SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data(STALLENABLE,570)
    SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_fromReg0 <= (others => '0');
            SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_fromReg0 <= SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_toReg0;
            -- Succesor 1
            SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_fromReg1 <= SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_consumed0 <= (not (SE_out_redist2_stall_entry_o5_173_fifo_backStall) and SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_wireValid) or SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_fromReg0;
    SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_consumed1 <= (not (SE_out_redist34_stall_entry_o38_173_fifo_backStall) and SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_wireValid) or SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_fromReg1;
    -- Consuming
    SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_StallValid <= SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_backStall and SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_wireValid;
    SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_toReg0 <= SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_StallValid and SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_consumed0;
    SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_toReg1 <= SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_StallValid and SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_consumed1;
    -- Backward Stall generation
    SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_or0 <= SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_consumed0;
    SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_wireStall <= not (SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_consumed1 and SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_or0);
    SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_backStall <= SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_wireStall;
    -- Valid signal propagation
    SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_V0 <= SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_wireValid and not (SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_fromReg0);
    SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_V1 <= SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_wireValid and not (SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_wireValid <= bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_reg_valid_out;

    -- redist2_stall_entry_o5_173_fifo(STALLFIFO,160)
    redist2_stall_entry_o5_173_fifo_valid_in <= SE_out_redist1_stall_entry_o5_12_fifo_V1;
    redist2_stall_entry_o5_173_fifo_stall_in <= SE_out_redist2_stall_entry_o5_173_fifo_backStall;
    redist2_stall_entry_o5_173_fifo_data_in <= bubble_select_redist1_stall_entry_o5_12_fifo_b;
    redist2_stall_entry_o5_173_fifo_valid_in_bitsignaltemp <= redist2_stall_entry_o5_173_fifo_valid_in(0);
    redist2_stall_entry_o5_173_fifo_stall_in_bitsignaltemp <= redist2_stall_entry_o5_173_fifo_stall_in(0);
    redist2_stall_entry_o5_173_fifo_valid_out(0) <= redist2_stall_entry_o5_173_fifo_valid_out_bitsignaltemp;
    redist2_stall_entry_o5_173_fifo_stall_out(0) <= redist2_stall_entry_o5_173_fifo_stall_out_bitsignaltemp;
    theredist2_stall_entry_o5_173_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 162,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist2_stall_entry_o5_173_fifo_valid_in_bitsignaltemp,
        stall_in => redist2_stall_entry_o5_173_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist1_stall_entry_o5_12_fifo_b,
        valid_out => redist2_stall_entry_o5_173_fifo_valid_out_bitsignaltemp,
        stall_out => redist2_stall_entry_o5_173_fifo_stall_out_bitsignaltemp,
        data_out => redist2_stall_entry_o5_173_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist2_stall_entry_o5_173_fifo(STALLENABLE,450)
    -- Valid signal propagation
    SE_out_redist2_stall_entry_o5_173_fifo_V0 <= SE_out_redist2_stall_entry_o5_173_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist2_stall_entry_o5_173_fifo_backStall <= i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_out_o_stall or not (SE_out_redist2_stall_entry_o5_173_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist2_stall_entry_o5_173_fifo_and0 <= redist2_stall_entry_o5_173_fifo_valid_out;
    SE_out_redist2_stall_entry_o5_173_fifo_and1 <= SE_out_bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_V0 and SE_out_redist2_stall_entry_o5_173_fifo_and0;
    SE_out_redist2_stall_entry_o5_173_fifo_and2 <= SE_out_redist9_stall_entry_o11_173_fifo_V0 and SE_out_redist2_stall_entry_o5_173_fifo_and1;
    SE_out_redist2_stall_entry_o5_173_fifo_wireValid <= SE_out_redist15_stall_entry_o18_173_fifo_V0 and SE_out_redist2_stall_entry_o5_173_fifo_and2;

    -- SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x(STALLENABLE,409)
    SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_fromReg0 <= (others => '0');
            SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_fromReg1 <= (others => '0');
            SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_fromReg2 <= (others => '0');
            SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_fromReg3 <= (others => '0');
            SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_fromReg4 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_fromReg0 <= SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_fromReg1 <= SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_toReg1;
            -- Succesor 2
            SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_fromReg2 <= SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_toReg2;
            -- Succesor 3
            SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_fromReg3 <= SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_toReg3;
            -- Succesor 4
            SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_fromReg4 <= SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_toReg4;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_consumed0 <= (not (SE_out_redist49_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_0_24_fifo_backStall) and SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_wireValid) or SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_fromReg0;
    SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_consumed1 <= (not (SE_i_acl_1415_ethash_search_backStall) and SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_wireValid) or SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_fromReg1;
    SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_consumed2 <= (not (SE_i_acl_1416_ethash_search_backStall) and SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_wireValid) or SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_fromReg2;
    SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_consumed3 <= (not (SE_i_acl_1413_ethash_search_backStall) and SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_wireValid) or SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_fromReg3;
    SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_consumed4 <= (not (SE_i_acl_1414_ethash_search_backStall) and SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_wireValid) or SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_fromReg4;
    -- Consuming
    SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_StallValid <= SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_backStall and SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_wireValid;
    SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_toReg0 <= SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_StallValid and SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_consumed0;
    SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_toReg1 <= SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_StallValid and SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_consumed1;
    SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_toReg2 <= SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_StallValid and SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_consumed2;
    SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_toReg3 <= SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_StallValid and SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_consumed3;
    SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_toReg4 <= SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_StallValid and SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_consumed4;
    -- Backward Stall generation
    SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_or0 <= SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_consumed0;
    SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_or1 <= SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_consumed1 and SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_or0;
    SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_or2 <= SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_consumed2 and SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_or1;
    SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_or3 <= SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_consumed3 and SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_or2;
    SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_wireStall <= not (SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_consumed4 and SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_or3);
    SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_backStall <= SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_V0 <= SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_wireValid and not (SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_fromReg0);
    SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_V1 <= SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_wireValid and not (SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_fromReg1);
    SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_V2 <= SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_wireValid and not (SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_fromReg2);
    SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_V3 <= SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_wireValid and not (SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_fromReg3);
    SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_V4 <= SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_wireValid and not (SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_fromReg4);
    -- Computing multiple Valid(s)
    SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_wireValid <= i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_out_o_valid;

    -- bubble_join_redist9_stall_entry_o11_173_fifo(BITJOIN,262)
    bubble_join_redist9_stall_entry_o11_173_fifo_q <= redist9_stall_entry_o11_173_fifo_data_out;

    -- bubble_select_redist9_stall_entry_o11_173_fifo(BITSELECT,263)
    bubble_select_redist9_stall_entry_o11_173_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist9_stall_entry_o11_173_fifo_q(0 downto 0));

    -- bubble_select_i_sbar_unnamed_ethash_search36_ethash_search(BITSELECT,225)
    bubble_select_i_sbar_unnamed_ethash_search36_ethash_search_b <= STD_LOGIC_VECTOR(bubble_out_i_sbar_unnamed_ethash_search36_ethash_search_data_reg_data_out(0 downto 0));

    -- bubble_join_redist15_stall_entry_o18_173_fifo(BITJOIN,280)
    bubble_join_redist15_stall_entry_o18_173_fifo_q <= redist15_stall_entry_o18_173_fifo_data_out;

    -- bubble_select_redist15_stall_entry_o18_173_fifo(BITSELECT,281)
    bubble_select_redist15_stall_entry_o18_173_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist15_stall_entry_o18_173_fifo_q(63 downto 0));

    -- bubble_join_redist2_stall_entry_o5_173_fifo(BITJOIN,241)
    bubble_join_redist2_stall_entry_o5_173_fifo_q <= redist2_stall_entry_o5_173_fifo_data_out;

    -- bubble_select_redist2_stall_entry_o5_173_fifo(BITSELECT,242)
    bubble_select_redist2_stall_entry_o5_173_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist2_stall_entry_o5_173_fifo_q(63 downto 0));

    -- i_load_memcoalesce_null_load_0_ethash_search_aunroll_x(BLACKBOX,32)@173
    -- in in_i_stall@20000000
    -- out out_o_readdata_0@205
    -- out out_o_readdata_1@205
    -- out out_memcoalesce_null_load_0_avm_address@20000000
    -- out out_memcoalesce_null_load_0_avm_burstcount@20000000
    -- out out_memcoalesce_null_load_0_avm_byteenable@20000000
    -- out out_memcoalesce_null_load_0_avm_enable@20000000
    -- out out_memcoalesce_null_load_0_avm_read@20000000
    -- out out_memcoalesce_null_load_0_avm_write@20000000
    -- out out_memcoalesce_null_load_0_avm_writedata@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@205
    thei_load_memcoalesce_null_load_0_ethash_search_aunroll_x : i_load_memcoalesce_null_load_0_ethash_search346
    PORT MAP (
        in_flush => in_flush,
        in_i_address => bubble_select_redist2_stall_entry_o5_173_fifo_b,
        in_i_bitwiseor => bubble_select_redist15_stall_entry_o18_173_fifo_b,
        in_i_dependence => bubble_select_i_sbar_unnamed_ethash_search36_ethash_search_b,
        in_i_predicate => bubble_select_redist9_stall_entry_o11_173_fifo_b,
        in_i_stall => SE_out_i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_backStall,
        in_i_valid => SE_out_redist2_stall_entry_o5_173_fifo_V0,
        in_memcoalesce_null_load_0_avm_readdata => in_memcoalesce_null_load_0_avm_readdata,
        in_memcoalesce_null_load_0_avm_readdatavalid => in_memcoalesce_null_load_0_avm_readdatavalid,
        in_memcoalesce_null_load_0_avm_waitrequest => in_memcoalesce_null_load_0_avm_waitrequest,
        in_memcoalesce_null_load_0_avm_writeack => in_memcoalesce_null_load_0_avm_writeack,
        out_o_readdata_0 => i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_out_o_readdata_0,
        out_o_readdata_1 => i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_out_o_readdata_1,
        out_memcoalesce_null_load_0_avm_address => i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_out_memcoalesce_null_load_0_avm_address,
        out_memcoalesce_null_load_0_avm_burstcount => i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_out_memcoalesce_null_load_0_avm_burstcount,
        out_memcoalesce_null_load_0_avm_byteenable => i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_out_memcoalesce_null_load_0_avm_byteenable,
        out_memcoalesce_null_load_0_avm_enable => i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_out_memcoalesce_null_load_0_avm_enable,
        out_memcoalesce_null_load_0_avm_read => i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_out_memcoalesce_null_load_0_avm_read,
        out_memcoalesce_null_load_0_avm_write => i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_out_memcoalesce_null_load_0_avm_write,
        out_memcoalesce_null_load_0_avm_writedata => i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_out_memcoalesce_null_load_0_avm_writedata,
        out_o_stall => i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_out_o_stall,
        out_o_valid => i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_ext_sig_sync_out_x(GPOUT,5)
    out_memcoalesce_null_load_0_avm_address <= i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_out_memcoalesce_null_load_0_avm_address;
    out_memcoalesce_null_load_0_avm_enable <= i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_out_memcoalesce_null_load_0_avm_enable;
    out_memcoalesce_null_load_0_avm_read <= i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_out_memcoalesce_null_load_0_avm_read;
    out_memcoalesce_null_load_0_avm_write <= i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_out_memcoalesce_null_load_0_avm_write;
    out_memcoalesce_null_load_0_avm_writedata <= i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_out_memcoalesce_null_load_0_avm_writedata;
    out_memcoalesce_null_load_0_avm_byteenable <= i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_out_memcoalesce_null_load_0_avm_byteenable;
    out_memcoalesce_null_load_0_avm_burstcount <= i_load_memcoalesce_null_load_0_ethash_search_aunroll_x_out_memcoalesce_null_load_0_avm_burstcount;

    -- bubble_join_redist44_stall_entry_o51_335_fifo(BITJOIN,367)
    bubble_join_redist44_stall_entry_o51_335_fifo_q <= redist44_stall_entry_o51_335_fifo_data_out;

    -- bubble_select_redist44_stall_entry_o51_335_fifo(BITSELECT,368)
    bubble_select_redist44_stall_entry_o51_335_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist44_stall_entry_o51_335_fifo_q(63 downto 0));

    -- bubble_join_redist43_stall_entry_o50_335_fifo(BITJOIN,364)
    bubble_join_redist43_stall_entry_o50_335_fifo_q <= redist43_stall_entry_o50_335_fifo_data_out;

    -- bubble_select_redist43_stall_entry_o50_335_fifo(BITSELECT,365)
    bubble_select_redist43_stall_entry_o50_335_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist43_stall_entry_o50_335_fifo_q(63 downto 0));

    -- bubble_join_redist42_stall_entry_o49_335_fifo(BITJOIN,361)
    bubble_join_redist42_stall_entry_o49_335_fifo_q <= redist42_stall_entry_o49_335_fifo_data_out;

    -- bubble_select_redist42_stall_entry_o49_335_fifo(BITSELECT,362)
    bubble_select_redist42_stall_entry_o49_335_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist42_stall_entry_o49_335_fifo_q(63 downto 0));

    -- bubble_join_redist41_stall_entry_o48_335_fifo(BITJOIN,358)
    bubble_join_redist41_stall_entry_o48_335_fifo_q <= redist41_stall_entry_o48_335_fifo_data_out;

    -- bubble_select_redist41_stall_entry_o48_335_fifo(BITSELECT,359)
    bubble_select_redist41_stall_entry_o48_335_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist41_stall_entry_o48_335_fifo_q(63 downto 0));

    -- bubble_join_redist40_stall_entry_o47_335_fifo(BITJOIN,355)
    bubble_join_redist40_stall_entry_o47_335_fifo_q <= redist40_stall_entry_o47_335_fifo_data_out;

    -- bubble_select_redist40_stall_entry_o47_335_fifo(BITSELECT,356)
    bubble_select_redist40_stall_entry_o47_335_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist40_stall_entry_o47_335_fifo_q(63 downto 0));

    -- bubble_join_redist39_stall_entry_o43_335_fifo(BITJOIN,352)
    bubble_join_redist39_stall_entry_o43_335_fifo_q <= redist39_stall_entry_o43_335_fifo_data_out;

    -- bubble_select_redist39_stall_entry_o43_335_fifo(BITSELECT,353)
    bubble_select_redist39_stall_entry_o43_335_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist39_stall_entry_o43_335_fifo_q(31 downto 0));

    -- bubble_join_redist38_stall_entry_o42_335_fifo(BITJOIN,349)
    bubble_join_redist38_stall_entry_o42_335_fifo_q <= redist38_stall_entry_o42_335_fifo_data_out;

    -- bubble_select_redist38_stall_entry_o42_335_fifo(BITSELECT,350)
    bubble_select_redist38_stall_entry_o42_335_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist38_stall_entry_o42_335_fifo_q(31 downto 0));

    -- bubble_join_redist37_stall_entry_o41_335_fifo(BITJOIN,346)
    bubble_join_redist37_stall_entry_o41_335_fifo_q <= redist37_stall_entry_o41_335_fifo_data_out;

    -- bubble_select_redist37_stall_entry_o41_335_fifo(BITSELECT,347)
    bubble_select_redist37_stall_entry_o41_335_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist37_stall_entry_o41_335_fifo_q(31 downto 0));

    -- bubble_join_redist32_stall_entry_o36_335_fifo(BITJOIN,331)
    bubble_join_redist32_stall_entry_o36_335_fifo_q <= redist32_stall_entry_o36_335_fifo_data_out;

    -- bubble_select_redist32_stall_entry_o36_335_fifo(BITSELECT,332)
    bubble_select_redist32_stall_entry_o36_335_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist32_stall_entry_o36_335_fifo_q(31 downto 0));

    -- bubble_join_redist31_stall_entry_o35_335_fifo(BITJOIN,328)
    bubble_join_redist31_stall_entry_o35_335_fifo_q <= redist31_stall_entry_o35_335_fifo_data_out;

    -- bubble_select_redist31_stall_entry_o35_335_fifo(BITSELECT,329)
    bubble_select_redist31_stall_entry_o35_335_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist31_stall_entry_o35_335_fifo_q(31 downto 0));

    -- bubble_join_redist30_stall_entry_o34_335_fifo(BITJOIN,325)
    bubble_join_redist30_stall_entry_o34_335_fifo_q <= redist30_stall_entry_o34_335_fifo_data_out;

    -- bubble_select_redist30_stall_entry_o34_335_fifo(BITSELECT,326)
    bubble_select_redist30_stall_entry_o34_335_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist30_stall_entry_o34_335_fifo_q(31 downto 0));

    -- bubble_join_redist29_stall_entry_o33_335_fifo(BITJOIN,322)
    bubble_join_redist29_stall_entry_o33_335_fifo_q <= redist29_stall_entry_o33_335_fifo_data_out;

    -- bubble_select_redist29_stall_entry_o33_335_fifo(BITSELECT,323)
    bubble_select_redist29_stall_entry_o33_335_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist29_stall_entry_o33_335_fifo_q(31 downto 0));

    -- bubble_join_redist28_stall_entry_o32_335_fifo(BITJOIN,319)
    bubble_join_redist28_stall_entry_o32_335_fifo_q <= redist28_stall_entry_o32_335_fifo_data_out;

    -- bubble_select_redist28_stall_entry_o32_335_fifo(BITSELECT,320)
    bubble_select_redist28_stall_entry_o32_335_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist28_stall_entry_o32_335_fifo_q(31 downto 0));

    -- bubble_join_redist27_stall_entry_o30_335_fifo(BITJOIN,316)
    bubble_join_redist27_stall_entry_o30_335_fifo_q <= redist27_stall_entry_o30_335_fifo_data_out;

    -- bubble_select_redist27_stall_entry_o30_335_fifo(BITSELECT,317)
    bubble_select_redist27_stall_entry_o30_335_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist27_stall_entry_o30_335_fifo_q(31 downto 0));

    -- bubble_join_redist26_stall_entry_o29_335_fifo(BITJOIN,313)
    bubble_join_redist26_stall_entry_o29_335_fifo_q <= redist26_stall_entry_o29_335_fifo_data_out;

    -- bubble_select_redist26_stall_entry_o29_335_fifo(BITSELECT,314)
    bubble_select_redist26_stall_entry_o29_335_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist26_stall_entry_o29_335_fifo_q(31 downto 0));

    -- bubble_join_redist25_stall_entry_o28_335_fifo(BITJOIN,310)
    bubble_join_redist25_stall_entry_o28_335_fifo_q <= redist25_stall_entry_o28_335_fifo_data_out;

    -- bubble_select_redist25_stall_entry_o28_335_fifo(BITSELECT,311)
    bubble_select_redist25_stall_entry_o28_335_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist25_stall_entry_o28_335_fifo_q(31 downto 0));

    -- bubble_join_redist24_stall_entry_o27_335_fifo(BITJOIN,307)
    bubble_join_redist24_stall_entry_o27_335_fifo_q <= redist24_stall_entry_o27_335_fifo_data_out;

    -- bubble_select_redist24_stall_entry_o27_335_fifo(BITSELECT,308)
    bubble_select_redist24_stall_entry_o27_335_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist24_stall_entry_o27_335_fifo_q(31 downto 0));

    -- bubble_join_redist19_stall_entry_o22_335_fifo(BITJOIN,292)
    bubble_join_redist19_stall_entry_o22_335_fifo_q <= redist19_stall_entry_o22_335_fifo_data_out;

    -- bubble_select_redist19_stall_entry_o22_335_fifo(BITSELECT,293)
    bubble_select_redist19_stall_entry_o22_335_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist19_stall_entry_o22_335_fifo_q(31 downto 0));

    -- bubble_join_redist18_stall_entry_o21_335_fifo(BITJOIN,289)
    bubble_join_redist18_stall_entry_o21_335_fifo_q <= redist18_stall_entry_o21_335_fifo_data_out;

    -- bubble_select_redist18_stall_entry_o21_335_fifo(BITSELECT,290)
    bubble_select_redist18_stall_entry_o21_335_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist18_stall_entry_o21_335_fifo_q(31 downto 0));

    -- bubble_join_redist17_stall_entry_o20_335_fifo(BITJOIN,286)
    bubble_join_redist17_stall_entry_o20_335_fifo_q <= redist17_stall_entry_o20_335_fifo_data_out;

    -- bubble_select_redist17_stall_entry_o20_335_fifo(BITSELECT,287)
    bubble_select_redist17_stall_entry_o20_335_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist17_stall_entry_o20_335_fifo_q(31 downto 0));

    -- bubble_join_redist16_stall_entry_o19_335_fifo(BITJOIN,283)
    bubble_join_redist16_stall_entry_o19_335_fifo_q <= redist16_stall_entry_o19_335_fifo_data_out;

    -- bubble_select_redist16_stall_entry_o19_335_fifo(BITSELECT,284)
    bubble_select_redist16_stall_entry_o19_335_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist16_stall_entry_o19_335_fifo_q(31 downto 0));

    -- bubble_join_redist13_stall_entry_o17_335_fifo(BITJOIN,274)
    bubble_join_redist13_stall_entry_o17_335_fifo_q <= redist13_stall_entry_o17_335_fifo_data_out;

    -- bubble_select_redist13_stall_entry_o17_335_fifo(BITSELECT,275)
    bubble_select_redist13_stall_entry_o17_335_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist13_stall_entry_o17_335_fifo_q(31 downto 0));

    -- bubble_join_redist12_stall_entry_o16_335_fifo(BITJOIN,271)
    bubble_join_redist12_stall_entry_o16_335_fifo_q <= redist12_stall_entry_o16_335_fifo_data_out;

    -- bubble_select_redist12_stall_entry_o16_335_fifo(BITSELECT,272)
    bubble_select_redist12_stall_entry_o16_335_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist12_stall_entry_o16_335_fifo_q(31 downto 0));

    -- bubble_join_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo(BITJOIN,400)
    bubble_join_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_q <= redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_data_out;

    -- bubble_select_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo(BITSELECT,401)
    bubble_select_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_q(31 downto 0));

    -- bubble_join_redist11_stall_entry_o13_335_fifo(BITJOIN,268)
    bubble_join_redist11_stall_entry_o13_335_fifo_q <= redist11_stall_entry_o13_335_fifo_data_out;

    -- bubble_select_redist11_stall_entry_o13_335_fifo(BITSELECT,269)
    bubble_select_redist11_stall_entry_o13_335_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist11_stall_entry_o13_335_fifo_q(31 downto 0));

    -- c_i4_1gr(CONSTANT,45)
    c_i4_1gr_q <= "1111";

    -- bubble_join_redist10_stall_entry_o12_335_fifo(BITJOIN,265)
    bubble_join_redist10_stall_entry_o12_335_fifo_q <= redist10_stall_entry_o12_335_fifo_data_out;

    -- bubble_select_redist10_stall_entry_o12_335_fifo(BITSELECT,266)
    bubble_select_redist10_stall_entry_o12_335_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist10_stall_entry_o12_335_fifo_q(3 downto 0));

    -- i_fpgaindvars_iv_next13_ethash_search(ADD,56)@335
    i_fpgaindvars_iv_next13_ethash_search_a <= STD_LOGIC_VECTOR("0" & bubble_select_redist10_stall_entry_o12_335_fifo_b);
    i_fpgaindvars_iv_next13_ethash_search_b <= STD_LOGIC_VECTOR("0" & c_i4_1gr_q);
    i_fpgaindvars_iv_next13_ethash_search_o <= STD_LOGIC_VECTOR(UNSIGNED(i_fpgaindvars_iv_next13_ethash_search_a) + UNSIGNED(i_fpgaindvars_iv_next13_ethash_search_b));
    i_fpgaindvars_iv_next13_ethash_search_q <= i_fpgaindvars_iv_next13_ethash_search_o(4 downto 0);

    -- bgTrunc_i_fpgaindvars_iv_next13_ethash_search_sel_x(BITSELECT,2)@335
    bgTrunc_i_fpgaindvars_iv_next13_ethash_search_sel_x_b <= i_fpgaindvars_iv_next13_ethash_search_q(3 downto 0);

    -- i_exitcond14_ethash_search_cmp_sign(LOGICAL,98)@335
    i_exitcond14_ethash_search_cmp_sign_q <= STD_LOGIC_VECTOR(bubble_select_redist10_stall_entry_o12_335_fifo_b(3 downto 3));

    -- bubble_join_redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo(BITJOIN,394)
    bubble_join_redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo_q <= redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo_data_out;

    -- bubble_select_redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo(BITSELECT,395)
    bubble_select_redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo_q(31 downto 0));

    -- bubble_join_redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo(BITJOIN,391)
    bubble_join_redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo_q <= redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo_data_out;

    -- bubble_select_redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo(BITSELECT,392)
    bubble_select_redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo_q(31 downto 0));

    -- bubble_join_redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo(BITJOIN,388)
    bubble_join_redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo_q <= redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo_data_out;

    -- bubble_select_redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo(BITSELECT,389)
    bubble_select_redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo_q(31 downto 0));

    -- bubble_join_redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo(BITJOIN,385)
    bubble_join_redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo_q <= redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo_data_out;

    -- bubble_select_redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo(BITSELECT,386)
    bubble_select_redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo_q(31 downto 0));

    -- bubble_join_redist6_stall_entry_o9_335_fifo(BITJOIN,253)
    bubble_join_redist6_stall_entry_o9_335_fifo_q <= redist6_stall_entry_o9_335_fifo_data_out;

    -- bubble_select_redist6_stall_entry_o9_335_fifo(BITSELECT,254)
    bubble_select_redist6_stall_entry_o9_335_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist6_stall_entry_o9_335_fifo_q(63 downto 0));

    -- bubble_join_redist5_stall_entry_o8_335_fifo(BITJOIN,250)
    bubble_join_redist5_stall_entry_o8_335_fifo_q <= redist5_stall_entry_o8_335_fifo_data_out;

    -- bubble_select_redist5_stall_entry_o8_335_fifo(BITSELECT,251)
    bubble_select_redist5_stall_entry_o8_335_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist5_stall_entry_o8_335_fifo_q(63 downto 0));

    -- bubble_join_redist4_stall_entry_o7_335_fifo(BITJOIN,247)
    bubble_join_redist4_stall_entry_o7_335_fifo_q <= redist4_stall_entry_o7_335_fifo_data_out;

    -- bubble_select_redist4_stall_entry_o7_335_fifo(BITSELECT,248)
    bubble_select_redist4_stall_entry_o7_335_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist4_stall_entry_o7_335_fifo_q(63 downto 0));

    -- bubble_join_redist3_stall_entry_o6_335_fifo(BITJOIN,244)
    bubble_join_redist3_stall_entry_o6_335_fifo_q <= redist3_stall_entry_o6_335_fifo_data_out;

    -- bubble_select_redist3_stall_entry_o6_335_fifo(BITSELECT,245)
    bubble_select_redist3_stall_entry_o6_335_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist3_stall_entry_o6_335_fifo_q(0 downto 0));

    -- bubble_join_redist45_i_acl_1416_ethash_search_q_130_fifo(BITJOIN,370)
    bubble_join_redist45_i_acl_1416_ethash_search_q_130_fifo_q <= redist45_i_acl_1416_ethash_search_q_130_fifo_data_out;

    -- bubble_select_redist45_i_acl_1416_ethash_search_q_130_fifo(BITSELECT,371)
    bubble_select_redist45_i_acl_1416_ethash_search_q_130_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist45_i_acl_1416_ethash_search_q_130_fifo_q(31 downto 0));

    -- bubble_join_redist46_i_acl_1415_ethash_search_q_130_fifo(BITJOIN,373)
    bubble_join_redist46_i_acl_1415_ethash_search_q_130_fifo_q <= redist46_i_acl_1415_ethash_search_q_130_fifo_data_out;

    -- bubble_select_redist46_i_acl_1415_ethash_search_q_130_fifo(BITSELECT,374)
    bubble_select_redist46_i_acl_1415_ethash_search_q_130_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist46_i_acl_1415_ethash_search_q_130_fifo_q(31 downto 0));

    -- bubble_join_redist47_i_acl_1414_ethash_search_q_130_fifo(BITJOIN,376)
    bubble_join_redist47_i_acl_1414_ethash_search_q_130_fifo_q <= redist47_i_acl_1414_ethash_search_q_130_fifo_data_out;

    -- bubble_select_redist47_i_acl_1414_ethash_search_q_130_fifo(BITSELECT,377)
    bubble_select_redist47_i_acl_1414_ethash_search_q_130_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist47_i_acl_1414_ethash_search_q_130_fifo_q(31 downto 0));

    -- bubble_join_redist48_i_acl_1413_ethash_search_q_130_fifo(BITJOIN,379)
    bubble_join_redist48_i_acl_1413_ethash_search_q_130_fifo_q <= redist48_i_acl_1413_ethash_search_q_130_fifo_data_out;

    -- bubble_select_redist48_i_acl_1413_ethash_search_q_130_fifo(BITSELECT,380)
    bubble_select_redist48_i_acl_1413_ethash_search_q_130_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist48_i_acl_1413_ethash_search_q_130_fifo_q(31 downto 0));

    -- dupName_0_sync_out_x(GPOUT,9)@335
    out_acl_1413 <= bubble_select_redist48_i_acl_1413_ethash_search_q_130_fifo_b;
    out_acl_1414 <= bubble_select_redist47_i_acl_1414_ethash_search_q_130_fifo_b;
    out_acl_1415 <= bubble_select_redist46_i_acl_1415_ethash_search_q_130_fifo_b;
    out_acl_1416 <= bubble_select_redist45_i_acl_1416_ethash_search_q_130_fifo_b;
    out_c0_exe1104 <= bubble_select_redist3_stall_entry_o6_335_fifo_b;
    out_c0_exe2109 <= bubble_select_redist4_stall_entry_o7_335_fifo_b;
    out_c0_exe3113 <= bubble_select_redist5_stall_entry_o8_335_fifo_b;
    out_c0_exe4117 <= bubble_select_redist6_stall_entry_o9_335_fifo_b;
    out_c1_exe1 <= bubble_select_redist50_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_1_154_fifo_b;
    out_c1_exe2 <= bubble_select_redist51_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_2_154_fifo_b;
    out_c1_exe3 <= bubble_select_redist52_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_3_154_fifo_b;
    out_c1_exe4 <= bubble_select_redist53_i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_c1_exit_4_154_fifo_b;
    out_exitcond14 <= i_exitcond14_ethash_search_cmp_sign_q;
    out_fpgaindvars_iv_next13 <= bgTrunc_i_fpgaindvars_iv_next13_ethash_search_sel_x_b;
    out_global_id_0193 <= bubble_select_redist11_stall_entry_o13_335_fifo_b;
    out_inc123 <= bubble_select_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_b;
    out_l_grpid_04 <= bubble_select_redist12_stall_entry_o16_335_fifo_b;
    out_l_grpid_0_addr10 <= bubble_select_redist13_stall_entry_o17_335_fifo_b;
    out_scalarizer_0100163 <= bubble_select_redist16_stall_entry_o19_335_fifo_b;
    out_scalarizer_0100373 <= bubble_select_redist17_stall_entry_o20_335_fifo_b;
    out_scalarizer_0100583 <= bubble_select_redist18_stall_entry_o21_335_fifo_b;
    out_scalarizer_0100793 <= bubble_select_redist19_stall_entry_o22_335_fifo_b;
    out_scalarizer_099323 <= bubble_select_redist24_stall_entry_o27_335_fifo_b;
    out_scalarizer_099533 <= bubble_select_redist25_stall_entry_o28_335_fifo_b;
    out_scalarizer_099743 <= bubble_select_redist26_stall_entry_o29_335_fifo_b;
    out_scalarizer_099953 <= bubble_select_redist27_stall_entry_o30_335_fifo_b;
    out_scalarizer_1100058 <= bubble_select_redist28_stall_entry_o32_335_fifo_b;
    out_scalarizer_1100268 <= bubble_select_redist29_stall_entry_o33_335_fifo_b;
    out_scalarizer_1100478 <= bubble_select_redist30_stall_entry_o34_335_fifo_b;
    out_scalarizer_1100688 <= bubble_select_redist31_stall_entry_o35_335_fifo_b;
    out_scalarizer_1100898 <= bubble_select_redist32_stall_entry_o36_335_fifo_b;
    out_scalarizer_199428 <= bubble_select_redist37_stall_entry_o41_335_fifo_b;
    out_scalarizer_199638 <= bubble_select_redist38_stall_entry_o42_335_fifo_b;
    out_scalarizer_199848 <= bubble_select_redist39_stall_entry_o43_335_fifo_b;
    out_state_0_0_cast121 <= bubble_select_redist40_stall_entry_o47_335_fifo_b;
    out_state_4_0_cast124 <= bubble_select_redist41_stall_entry_o48_335_fifo_b;
    out_state_5_0_cast127 <= bubble_select_redist42_stall_entry_o49_335_fifo_b;
    out_state_6_0_cast130 <= bubble_select_redist43_stall_entry_o50_335_fifo_b;
    out_state_7_0_cast133 <= bubble_select_redist44_stall_entry_o51_335_fifo_b;
    out_valid_out <= SE_out_redist55_bgTrunc_i_inc123_ethash_search_sel_x_b_335_fifo_V0;

    -- dupName_1_ext_sig_sync_out_x(GPOUT,11)
    out_memcoalesce_null_load_016_avm_address <= i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_address;
    out_memcoalesce_null_load_016_avm_enable <= i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_enable;
    out_memcoalesce_null_load_016_avm_read <= i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_read;
    out_memcoalesce_null_load_016_avm_write <= i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_write;
    out_memcoalesce_null_load_016_avm_writedata <= i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_writedata;
    out_memcoalesce_null_load_016_avm_byteenable <= i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_byteenable;
    out_memcoalesce_null_load_016_avm_burstcount <= i_sfc_c1_for_end91_ethash_search_c1_enter_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_burstcount;

    -- ext_sig_sync_out(GPOUT,49)
    out_memdep_205_avm_address <= i_store_memdep_205_ethash_search_out_memdep_205_avm_address;
    out_memdep_205_avm_enable <= i_store_memdep_205_ethash_search_out_memdep_205_avm_enable;
    out_memdep_205_avm_read <= i_store_memdep_205_ethash_search_out_memdep_205_avm_read;
    out_memdep_205_avm_write <= i_store_memdep_205_ethash_search_out_memdep_205_avm_write;
    out_memdep_205_avm_writedata <= i_store_memdep_205_ethash_search_out_memdep_205_avm_writedata;
    out_memdep_205_avm_byteenable <= i_store_memdep_205_ethash_search_out_memdep_205_avm_byteenable;
    out_memdep_205_avm_burstcount <= i_store_memdep_205_ethash_search_out_memdep_205_avm_burstcount;

    -- sync_out(GPOUT,72)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
