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

-- VHDL created from bb_ethash_search_B4
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

entity bb_ethash_search_B4 is
    port (
        in_mix_pm_2_in_0_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mix_pm_2_in_0_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mix_pm_2_in_0_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mix_pm_2_in_0_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mix_pm_2_in_1_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mix_pm_2_in_1_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mix_pm_2_in_1_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mix_pm_2_in_1_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_a_1907_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_a_1907_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_and_RM155_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_and_RM155_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arraydecay51_RM166_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arraydecay51_RM166_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx36_2_RM165_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx36_2_RM165_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx45_RM163_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx45_RM163_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_barrier_unnamed_ethash_search33_wgs_workgroup_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1105_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe1105_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2110_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe2110_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe3114_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe3114_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe4118_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe4118_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_cmp23157_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_cmp23157_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_cmp23_xor159_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_cmp23_xor159_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_encoder_ethash_search_B4_merge_priority_encoder_workgroup_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_fpgaindvars_iv12136_0 : in std_logic_vector(3 downto 0);  -- ufix4
        in_fpgaindvars_iv12136_1 : in std_logic_vector(3 downto 0);  -- ufix4
        in_fpgaindvars_iv6_0 : in std_logic_vector(2 downto 0);  -- ufix3
        in_fpgaindvars_iv6_1 : in std_logic_vector(2 downto 0);  -- ufix3
        in_fpgaindvars_iv9_0 : in std_logic_vector(4 downto 0);  -- ufix5
        in_fpgaindvars_iv9_1 : in std_logic_vector(4 downto 0);  -- ufix5
        in_g_dag : in std_logic_vector(63 downto 0);  -- ufix64
        in_g_output : in std_logic_vector(63 downto 0);  -- ufix64
        in_global_id_0194_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_global_id_0194_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i18_0908154_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i18_0908154_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i66_2906_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i66_2906_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_05_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_05_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr11_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr11_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr_zext161_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_l_grpid_0_addr_zext161_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_memdep_204_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memdep_204_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_204_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_204_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_scalarizer_0100164_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100164_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100374_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100374_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100584_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100584_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100794_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100794_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01173138_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01173138_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01175142_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01175142_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01177146_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01177146_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01179150_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01179150_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099324_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099324_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099534_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099534_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099744_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099744_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099954_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099954_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100059_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100059_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100269_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100269_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100479_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100479_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100689_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100689_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100899_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100899_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11174140_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11174140_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11176144_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11176144_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11178148_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11178148_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11180152_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11180152_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199429_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199429_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199639_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199639_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199849_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199849_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_state_0_0_cast122_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_0_0_cast122_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_4_0_cast125_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_4_0_cast125_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_5_0_cast128_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_5_0_cast128_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_6_0_cast131_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_6_0_cast131_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_7_0_cast134_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_7_0_cast134_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_target : in std_logic_vector(63 downto 0);  -- ufix64
        in_unnamed_ethash_search32_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_unnamed_ethash_search32_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_unnamed_ethash_search34_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_unnamed_ethash_search34_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search34_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search34_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search35_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_unnamed_ethash_search35_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search35_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search35_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_xor_i679_3_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_xor_i679_3_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_xor_i679_3_2 : out std_logic_vector(31 downto 0);  -- ufix32
        out_xor_i679_3_3 : out std_logic_vector(31 downto 0);  -- ufix32
        out_a_1907_LC_OuterPHI : out std_logic_vector(31 downto 0);  -- ufix32
        out_and_RM155 : out std_logic_vector(31 downto 0);  -- ufix32
        out_arraydecay51_RM166 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx36_2_RM165 : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx45_RM163 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe1105 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe2110 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe3114 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe4118 : out std_logic_vector(63 downto 0);  -- ufix64
        out_cmp23157 : out std_logic_vector(0 downto 0);  -- ufix1
        out_cmp23_xor159 : out std_logic_vector(0 downto 0);  -- ufix1
        out_fpgaindvars_iv12136 : out std_logic_vector(3 downto 0);  -- ufix4
        out_fpgaindvars_iv6_LC_InnerPHI : out std_logic_vector(2 downto 0);  -- ufix3
        out_fpgaindvars_iv9_LC_OuterPHI : out std_logic_vector(4 downto 0);  -- ufix5
        out_global_id_0194 : out std_logic_vector(31 downto 0);  -- ufix32
        out_i18_0908154 : out std_logic_vector(31 downto 0);  -- ufix32
        out_i66_2906_LC_InnerPHI : out std_logic_vector(31 downto 0);  -- ufix32
        out_idxprom80_RM : out std_logic_vector(63 downto 0);  -- ufix64
        out_l_grpid_05 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0_addr11 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0_addr_zext161 : out std_logic_vector(63 downto 0);  -- ufix64
        out_memdep_204_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_204_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_204_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_memdep_204_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_204_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_204_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_204_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_scalarizer_0100164 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0100374 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0100584 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0100794 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01173138 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01175142 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01177146 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01179150 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099324 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099534 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099744 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099954 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0xor1200 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100059 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100269 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100479 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100689 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100899 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11174140 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11176144 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11178148 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11180152 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_199429 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_199639 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_199849 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1xor1201 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_2xor : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_3xor : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_state_0_0_cast122 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_4_0_cast125 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_5_0_cast128 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_6_0_cast131 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_7_0_cast134 : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_ethash_search32 : out std_logic_vector(31 downto 0);  -- ufix32
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
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_ethash_search_B4;

architecture normal of bb_ethash_search_B4 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component ethash_search_B4_branch is
        port (
            in_xor_i679_3_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_xor_i679_3_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_xor_i679_3_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_xor_i679_3_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_a_1907_LC_OuterPHI : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_and_RM155 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arraydecay51_RM166 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx36_2_RM165 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx45_RM163 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe1105 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2110 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe3114 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe4118 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_cmp23157 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_cmp23_xor159 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_for_end91_LC_COND : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_fpgaindvars_iv12136 : in std_logic_vector(3 downto 0);  -- Fixed Point
            in_fpgaindvars_iv6_LC_InnerPHI : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_fpgaindvars_iv9_LC_OuterPHI : in std_logic_vector(4 downto 0);  -- Fixed Point
            in_global_id_0194 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i18_0908154 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i66_2906_LC_InnerPHI : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_idxprom80_RM : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_l_grpid_05 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr_zext161 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_scalarizer_0100164 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100374 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100584 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100794 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01173138 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01175142 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01177146 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01179150 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099324 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099534 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099744 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099954 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0xor1200 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100059 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100269 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100479 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100689 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100899 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11174140 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11176144 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11178148 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11180152 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199429 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199639 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199849 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1xor1201 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_2xor : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_3xor : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_state_0_0_cast122 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_4_0_cast125 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_5_0_cast128 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_6_0_cast131 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_7_0_cast134 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_unnamed_ethash_search32 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_state_0_0_cast122 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_4_0_cast125 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_5_0_cast128 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_6_0_cast131 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_7_0_cast134 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_unnamed_ethash_search32 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component ethash_search_B4_merge is
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
            in_fpgaindvars_iv12136_0 : in std_logic_vector(3 downto 0);  -- Fixed Point
            in_fpgaindvars_iv12136_1 : in std_logic_vector(3 downto 0);  -- Fixed Point
            in_fpgaindvars_iv6_0 : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_fpgaindvars_iv6_1 : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_fpgaindvars_iv9_0 : in std_logic_vector(4 downto 0);  -- Fixed Point
            in_fpgaindvars_iv9_1 : in std_logic_vector(4 downto 0);  -- Fixed Point
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
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            in_unnamed_ethash_search32_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_unnamed_ethash_search32_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_mix_pm_2_in_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_mix_pm_2_in_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_mix_pm_2_in_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_mix_pm_2_in_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_a_1907 : out std_logic_vector(31 downto 0);  -- Fixed Point
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
            out_fpgaindvars_iv6 : out std_logic_vector(2 downto 0);  -- Fixed Point
            out_fpgaindvars_iv9 : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_global_id_0194 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_i18_0908154 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_i66_2906 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_05 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr_zext161 : out std_logic_vector(63 downto 0);  -- Fixed Point
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
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_state_0_0_cast122 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_4_0_cast125 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_5_0_cast128 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_6_0_cast131 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_7_0_cast134 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_unnamed_ethash_search32 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_search_B4_stall_region is
        port (
            in_mix_pm_2_in_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mix_pm_2_in_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mix_pm_2_in_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mix_pm_2_in_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_a_1907 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_and_RM155 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arraydecay51_RM166 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx36_2_RM165 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx45_RM163 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_barrier_unnamed_ethash_search33_wgs_workgroup_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1105 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2110 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe3114 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe4118 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_cmp23157 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_cmp23_xor159 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_fpgaindvars_iv12136 : in std_logic_vector(3 downto 0);  -- Fixed Point
            in_fpgaindvars_iv6 : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_fpgaindvars_iv9 : in std_logic_vector(4 downto 0);  -- Fixed Point
            in_g_dag : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_global_id_0194 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i18_0908154 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i66_2906 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_05 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr_zext161 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_memdep_204_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memdep_204_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_204_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_204_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_scalarizer_0100164 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100374 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100584 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100794 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01173138 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01175142 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01177146 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01179150 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099324 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099534 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099744 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099954 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100059 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100269 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100479 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100689 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100899 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11174140 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11176144 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11178148 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11180152 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199429 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199639 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199849 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_state_0_0_cast122 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_4_0_cast125 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_5_0_cast128 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_6_0_cast131 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_7_0_cast134 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_unnamed_ethash_search32 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_unnamed_ethash_search34_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_unnamed_ethash_search34_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search34_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search34_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search35_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_unnamed_ethash_search35_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search35_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search35_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_for_end91_LC_COND : out std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component dupName_0_loop_capacity_FIFO_2u1i4agm0676j6e6x6s6u0qc0xgbuoz is
        port (
            in_data_in : in std_logic_vector(1934 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(1934 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal dupName_0_0_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_1_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_2_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_3_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_primWireOut_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_1_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_1_primWireOut_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_2_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_2_primWireOut_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_3_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_4_data_out_select_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_5_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_6_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_7_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_8_data_out_select_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_9_data_out_select_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_10_data_out_select_x_b : STD_LOGIC_VECTOR (3 downto 0);
    signal dupName_11_data_out_select_x_b : STD_LOGIC_VECTOR (2 downto 0);
    signal dupName_12_data_out_select_x_b : STD_LOGIC_VECTOR (4 downto 0);
    signal dupName_13_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_14_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_15_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_16_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_17_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_18_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_19_data_out_select_x_b : STD_LOGIC_VECTOR (127 downto 0);
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
    signal dupName_32_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_33_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_34_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_35_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_36_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_37_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_38_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_39_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_40_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_41_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_42_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_43_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_44_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_45_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_46_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_47_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_48_data_out_select_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_49_data_out_select_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_xor_i679_3_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_xor_i679_3_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_xor_i679_3_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_xor_i679_3_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_a_1907_LC_OuterPHI : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_and_RM155 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_arraydecay51_RM166 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_arrayidx36_2_RM165 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_arrayidx45_RM163 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_c0_exe1105 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_c0_exe2110 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_c0_exe3114 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_c0_exe4118 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_cmp23157 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_cmp23_xor159 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_fpgaindvars_iv12136 : STD_LOGIC_VECTOR (3 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_fpgaindvars_iv6_LC_InnerPHI : STD_LOGIC_VECTOR (2 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_fpgaindvars_iv9_LC_OuterPHI : STD_LOGIC_VECTOR (4 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_global_id_0194 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_i18_0908154 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_i66_2906_LC_InnerPHI : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_idxprom80_RM : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_l_grpid_05 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_l_grpid_0_addr11 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_l_grpid_0_addr_zext161 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_scalarizer_0100164 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_scalarizer_0100374 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_scalarizer_0100584 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_scalarizer_0100794 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_scalarizer_01173138 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_scalarizer_01175142 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_scalarizer_01177146 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_scalarizer_01179150 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_scalarizer_099324 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_scalarizer_099534 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_scalarizer_099744 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_scalarizer_099954 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_scalarizer_0xor1200 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_scalarizer_1100059 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_scalarizer_1100269 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_scalarizer_1100479 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_scalarizer_1100689 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_scalarizer_1100899 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_scalarizer_11174140 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_scalarizer_11176144 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_scalarizer_11178148 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_scalarizer_11180152 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_scalarizer_199429 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_scalarizer_199639 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_scalarizer_199849 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_scalarizer_1xor1201 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_scalarizer_2xor : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_scalarizer_3xor : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_state_0_0_cast122 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_state_4_0_cast125 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_state_5_0_cast128 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_state_6_0_cast131 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_state_7_0_cast134 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_unnamed_ethash_search32 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B4_branch_vunroll_x_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_mix_pm_2_in_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_mix_pm_2_in_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_mix_pm_2_in_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_mix_pm_2_in_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_a_1907 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_and_RM155 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_arraydecay51_RM166 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_arrayidx36_2_RM165 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_arrayidx45_RM163 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_c0_exe1105 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_c0_exe2110 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_c0_exe3114 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_c0_exe4118 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_cmp23157 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_cmp23_xor159 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_fpgaindvars_iv12136 : STD_LOGIC_VECTOR (3 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_fpgaindvars_iv6 : STD_LOGIC_VECTOR (2 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_fpgaindvars_iv9 : STD_LOGIC_VECTOR (4 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_global_id_0194 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_i18_0908154 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_i66_2906 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_l_grpid_05 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_l_grpid_0_addr11 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_l_grpid_0_addr_zext161 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_scalarizer_0100164 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_scalarizer_0100374 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_scalarizer_0100584 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_scalarizer_0100794 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_scalarizer_01173138 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_scalarizer_01175142 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_scalarizer_01177146 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_scalarizer_01179150 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_scalarizer_099324 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_scalarizer_099534 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_scalarizer_099744 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_scalarizer_099954 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_scalarizer_1100059 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_scalarizer_1100269 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_scalarizer_1100479 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_scalarizer_1100689 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_scalarizer_1100899 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_scalarizer_11174140 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_scalarizer_11176144 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_scalarizer_11178148 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_scalarizer_11180152 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_scalarizer_199429 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_scalarizer_199639 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_scalarizer_199849 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_state_0_0_cast122 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_state_4_0_cast125 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_state_5_0_cast128 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_state_6_0_cast131 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_state_7_0_cast134 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_unnamed_ethash_search32 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_vunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal num0_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num10_cast_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal num11_cast_x_b : STD_LOGIC_VECTOR (3 downto 0);
    signal num12_cast_x_b : STD_LOGIC_VECTOR (2 downto 0);
    signal num13_cast_x_b : STD_LOGIC_VECTOR (4 downto 0);
    signal num14_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num15_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num16_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num17_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num18_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num19_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num1_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num20_join_x_q : STD_LOGIC_VECTOR (127 downto 0);
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
    signal num33_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num34_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num35_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num36_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num37_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num38_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num39_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num3_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num40_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num41_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num42_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num43_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num44_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num45_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num46_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num47_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num48_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num49_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num4_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num50_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal num5_cast_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal num6_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num7_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num8_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal num9_cast_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal aggregateWireOut_join_q : STD_LOGIC_VECTOR (1934 downto 0);
    signal bb_ethash_search_B4_stall_region_out_xor_i679_3_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_xor_i679_3_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_xor_i679_3_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_xor_i679_3_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_a_1907_LC_OuterPHI : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_and_RM155 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_arraydecay51_RM166 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_stall_region_out_arrayidx36_2_RM165 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_stall_region_out_arrayidx45_RM163 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_stall_region_out_c0_exe1105 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_stall_region_out_c0_exe2110 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_stall_region_out_c0_exe3114 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_stall_region_out_c0_exe4118 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_stall_region_out_cmp23157 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_stall_region_out_cmp23_xor159 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_stall_region_out_for_end91_LC_COND : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_stall_region_out_fpgaindvars_iv12136 : STD_LOGIC_VECTOR (3 downto 0);
    signal bb_ethash_search_B4_stall_region_out_fpgaindvars_iv6_LC_InnerPHI : STD_LOGIC_VECTOR (2 downto 0);
    signal bb_ethash_search_B4_stall_region_out_fpgaindvars_iv9_LC_OuterPHI : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_ethash_search_B4_stall_region_out_global_id_0194 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_i18_0908154 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_i66_2906_LC_InnerPHI : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_idxprom80_RM : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_stall_region_out_l_grpid_05 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_l_grpid_0_addr11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_l_grpid_0_addr_zext161 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_stall_region_out_memdep_204_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_memdep_204_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_stall_region_out_memdep_204_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_ethash_search_B4_stall_region_out_memdep_204_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_stall_region_out_memdep_204_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_stall_region_out_memdep_204_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_stall_region_out_memdep_204_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_ethash_search_B4_stall_region_out_scalarizer_0100164 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_scalarizer_0100374 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_scalarizer_0100584 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_scalarizer_0100794 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_scalarizer_01173138 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_scalarizer_01175142 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_scalarizer_01177146 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_scalarizer_01179150 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_scalarizer_099324 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_scalarizer_099534 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_scalarizer_099744 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_scalarizer_099954 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_scalarizer_0xor1200 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_scalarizer_1100059 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_scalarizer_1100269 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_scalarizer_1100479 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_scalarizer_1100689 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_scalarizer_1100899 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_scalarizer_11174140 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_scalarizer_11176144 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_scalarizer_11178148 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_scalarizer_11180152 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_scalarizer_199429 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_scalarizer_199639 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_scalarizer_199849 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_scalarizer_1xor1201 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_scalarizer_2xor : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_scalarizer_3xor : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_stall_region_out_state_0_0_cast122 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_stall_region_out_state_4_0_cast125 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_stall_region_out_state_5_0_cast128 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_stall_region_out_state_6_0_cast131 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_stall_region_out_state_7_0_cast134 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_stall_region_out_unnamed_ethash_search32 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_unnamed_ethash_search34_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B4_stall_region_out_unnamed_ethash_search34_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_stall_region_out_unnamed_ethash_search34_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_ethash_search_B4_stall_region_out_unnamed_ethash_search34_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_stall_region_out_unnamed_ethash_search34_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_stall_region_out_unnamed_ethash_search34_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_stall_region_out_unnamed_ethash_search34_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_ethash_search_B4_stall_region_out_unnamed_ethash_search35_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal bb_ethash_search_B4_stall_region_out_unnamed_ethash_search35_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_ethash_search_B4_stall_region_out_unnamed_ethash_search35_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B4_stall_region_out_unnamed_ethash_search35_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_stall_region_out_unnamed_ethash_search35_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_stall_region_out_unnamed_ethash_search35_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B4_stall_region_out_unnamed_ethash_search35_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal bb_ethash_search_B4_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal data_out_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal loop_capacity_FIFO_out_data_out : STD_LOGIC_VECTOR (1934 downto 0);
    signal loop_capacity_FIFO_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_capacity_FIFO_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal primWireOut_select_b : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- ethash_search_B4_merge_vunroll_x(BLACKBOX,60)
    theethash_search_B4_merge_vunroll_x : ethash_search_B4_merge
    PORT MAP (
        in_mix_pm_2_in_0_0 => in_mix_pm_2_in_0_0,
        in_mix_pm_2_in_0_1 => in_mix_pm_2_in_0_1,
        in_mix_pm_2_in_0_2 => in_mix_pm_2_in_0_2,
        in_mix_pm_2_in_0_3 => in_mix_pm_2_in_0_3,
        in_mix_pm_2_in_1_0 => in_mix_pm_2_in_1_0,
        in_mix_pm_2_in_1_1 => in_mix_pm_2_in_1_1,
        in_mix_pm_2_in_1_2 => in_mix_pm_2_in_1_2,
        in_mix_pm_2_in_1_3 => in_mix_pm_2_in_1_3,
        in_a_1907_0 => in_a_1907_0,
        in_a_1907_1 => in_a_1907_1,
        in_and_RM155_0 => in_and_RM155_0,
        in_and_RM155_1 => in_and_RM155_1,
        in_arraydecay51_RM166_0 => in_arraydecay51_RM166_0,
        in_arraydecay51_RM166_1 => in_arraydecay51_RM166_1,
        in_arrayidx36_2_RM165_0 => in_arrayidx36_2_RM165_0,
        in_arrayidx36_2_RM165_1 => in_arrayidx36_2_RM165_1,
        in_arrayidx45_RM163_0 => in_arrayidx45_RM163_0,
        in_arrayidx45_RM163_1 => in_arrayidx45_RM163_1,
        in_c0_exe1105_0 => in_c0_exe1105_0,
        in_c0_exe1105_1 => in_c0_exe1105_1,
        in_c0_exe2110_0 => in_c0_exe2110_0,
        in_c0_exe2110_1 => in_c0_exe2110_1,
        in_c0_exe3114_0 => in_c0_exe3114_0,
        in_c0_exe3114_1 => in_c0_exe3114_1,
        in_c0_exe4118_0 => in_c0_exe4118_0,
        in_c0_exe4118_1 => in_c0_exe4118_1,
        in_cmp23157_0 => in_cmp23157_0,
        in_cmp23157_1 => in_cmp23157_1,
        in_cmp23_xor159_0 => in_cmp23_xor159_0,
        in_cmp23_xor159_1 => in_cmp23_xor159_1,
        in_encoder_ethash_search_B4_merge_priority_encoder_workgroup_size => in_encoder_ethash_search_B4_merge_priority_encoder_workgroup_size,
        in_fpgaindvars_iv12136_0 => in_fpgaindvars_iv12136_0,
        in_fpgaindvars_iv12136_1 => in_fpgaindvars_iv12136_1,
        in_fpgaindvars_iv6_0 => in_fpgaindvars_iv6_0,
        in_fpgaindvars_iv6_1 => in_fpgaindvars_iv6_1,
        in_fpgaindvars_iv9_0 => in_fpgaindvars_iv9_0,
        in_fpgaindvars_iv9_1 => in_fpgaindvars_iv9_1,
        in_global_id_0194_0 => in_global_id_0194_0,
        in_global_id_0194_1 => in_global_id_0194_1,
        in_i18_0908154_0 => in_i18_0908154_0,
        in_i18_0908154_1 => in_i18_0908154_1,
        in_i66_2906_0 => in_i66_2906_0,
        in_i66_2906_1 => in_i66_2906_1,
        in_l_grpid_05_0 => in_l_grpid_05_0,
        in_l_grpid_05_1 => in_l_grpid_05_1,
        in_l_grpid_0_addr11_0 => in_l_grpid_0_addr11_0,
        in_l_grpid_0_addr11_1 => in_l_grpid_0_addr11_1,
        in_l_grpid_0_addr_zext161_0 => in_l_grpid_0_addr_zext161_0,
        in_l_grpid_0_addr_zext161_1 => in_l_grpid_0_addr_zext161_1,
        in_scalarizer_0100164_0 => in_scalarizer_0100164_0,
        in_scalarizer_0100164_1 => in_scalarizer_0100164_1,
        in_scalarizer_0100374_0 => in_scalarizer_0100374_0,
        in_scalarizer_0100374_1 => in_scalarizer_0100374_1,
        in_scalarizer_0100584_0 => in_scalarizer_0100584_0,
        in_scalarizer_0100584_1 => in_scalarizer_0100584_1,
        in_scalarizer_0100794_0 => in_scalarizer_0100794_0,
        in_scalarizer_0100794_1 => in_scalarizer_0100794_1,
        in_scalarizer_01173138_0 => in_scalarizer_01173138_0,
        in_scalarizer_01173138_1 => in_scalarizer_01173138_1,
        in_scalarizer_01175142_0 => in_scalarizer_01175142_0,
        in_scalarizer_01175142_1 => in_scalarizer_01175142_1,
        in_scalarizer_01177146_0 => in_scalarizer_01177146_0,
        in_scalarizer_01177146_1 => in_scalarizer_01177146_1,
        in_scalarizer_01179150_0 => in_scalarizer_01179150_0,
        in_scalarizer_01179150_1 => in_scalarizer_01179150_1,
        in_scalarizer_099324_0 => in_scalarizer_099324_0,
        in_scalarizer_099324_1 => in_scalarizer_099324_1,
        in_scalarizer_099534_0 => in_scalarizer_099534_0,
        in_scalarizer_099534_1 => in_scalarizer_099534_1,
        in_scalarizer_099744_0 => in_scalarizer_099744_0,
        in_scalarizer_099744_1 => in_scalarizer_099744_1,
        in_scalarizer_099954_0 => in_scalarizer_099954_0,
        in_scalarizer_099954_1 => in_scalarizer_099954_1,
        in_scalarizer_1100059_0 => in_scalarizer_1100059_0,
        in_scalarizer_1100059_1 => in_scalarizer_1100059_1,
        in_scalarizer_1100269_0 => in_scalarizer_1100269_0,
        in_scalarizer_1100269_1 => in_scalarizer_1100269_1,
        in_scalarizer_1100479_0 => in_scalarizer_1100479_0,
        in_scalarizer_1100479_1 => in_scalarizer_1100479_1,
        in_scalarizer_1100689_0 => in_scalarizer_1100689_0,
        in_scalarizer_1100689_1 => in_scalarizer_1100689_1,
        in_scalarizer_1100899_0 => in_scalarizer_1100899_0,
        in_scalarizer_1100899_1 => in_scalarizer_1100899_1,
        in_scalarizer_11174140_0 => in_scalarizer_11174140_0,
        in_scalarizer_11174140_1 => in_scalarizer_11174140_1,
        in_scalarizer_11176144_0 => in_scalarizer_11176144_0,
        in_scalarizer_11176144_1 => in_scalarizer_11176144_1,
        in_scalarizer_11178148_0 => in_scalarizer_11178148_0,
        in_scalarizer_11178148_1 => in_scalarizer_11178148_1,
        in_scalarizer_11180152_0 => in_scalarizer_11180152_0,
        in_scalarizer_11180152_1 => in_scalarizer_11180152_1,
        in_scalarizer_199429_0 => in_scalarizer_199429_0,
        in_scalarizer_199429_1 => in_scalarizer_199429_1,
        in_scalarizer_199639_0 => in_scalarizer_199639_0,
        in_scalarizer_199639_1 => in_scalarizer_199639_1,
        in_scalarizer_199849_0 => in_scalarizer_199849_0,
        in_scalarizer_199849_1 => in_scalarizer_199849_1,
        in_stall_in => loop_capacity_FIFO_out_stall_out,
        in_state_0_0_cast122_0 => in_state_0_0_cast122_0,
        in_state_0_0_cast122_1 => in_state_0_0_cast122_1,
        in_state_4_0_cast125_0 => in_state_4_0_cast125_0,
        in_state_4_0_cast125_1 => in_state_4_0_cast125_1,
        in_state_5_0_cast128_0 => in_state_5_0_cast128_0,
        in_state_5_0_cast128_1 => in_state_5_0_cast128_1,
        in_state_6_0_cast131_0 => in_state_6_0_cast131_0,
        in_state_6_0_cast131_1 => in_state_6_0_cast131_1,
        in_state_7_0_cast134_0 => in_state_7_0_cast134_0,
        in_state_7_0_cast134_1 => in_state_7_0_cast134_1,
        in_unnamed_ethash_search32_0 => in_unnamed_ethash_search32_0,
        in_unnamed_ethash_search32_1 => in_unnamed_ethash_search32_1,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        out_mix_pm_2_in_0 => ethash_search_B4_merge_vunroll_x_out_mix_pm_2_in_0,
        out_mix_pm_2_in_1 => ethash_search_B4_merge_vunroll_x_out_mix_pm_2_in_1,
        out_mix_pm_2_in_2 => ethash_search_B4_merge_vunroll_x_out_mix_pm_2_in_2,
        out_mix_pm_2_in_3 => ethash_search_B4_merge_vunroll_x_out_mix_pm_2_in_3,
        out_a_1907 => ethash_search_B4_merge_vunroll_x_out_a_1907,
        out_and_RM155 => ethash_search_B4_merge_vunroll_x_out_and_RM155,
        out_arraydecay51_RM166 => ethash_search_B4_merge_vunroll_x_out_arraydecay51_RM166,
        out_arrayidx36_2_RM165 => ethash_search_B4_merge_vunroll_x_out_arrayidx36_2_RM165,
        out_arrayidx45_RM163 => ethash_search_B4_merge_vunroll_x_out_arrayidx45_RM163,
        out_c0_exe1105 => ethash_search_B4_merge_vunroll_x_out_c0_exe1105,
        out_c0_exe2110 => ethash_search_B4_merge_vunroll_x_out_c0_exe2110,
        out_c0_exe3114 => ethash_search_B4_merge_vunroll_x_out_c0_exe3114,
        out_c0_exe4118 => ethash_search_B4_merge_vunroll_x_out_c0_exe4118,
        out_cmp23157 => ethash_search_B4_merge_vunroll_x_out_cmp23157,
        out_cmp23_xor159 => ethash_search_B4_merge_vunroll_x_out_cmp23_xor159,
        out_fpgaindvars_iv12136 => ethash_search_B4_merge_vunroll_x_out_fpgaindvars_iv12136,
        out_fpgaindvars_iv6 => ethash_search_B4_merge_vunroll_x_out_fpgaindvars_iv6,
        out_fpgaindvars_iv9 => ethash_search_B4_merge_vunroll_x_out_fpgaindvars_iv9,
        out_global_id_0194 => ethash_search_B4_merge_vunroll_x_out_global_id_0194,
        out_i18_0908154 => ethash_search_B4_merge_vunroll_x_out_i18_0908154,
        out_i66_2906 => ethash_search_B4_merge_vunroll_x_out_i66_2906,
        out_l_grpid_05 => ethash_search_B4_merge_vunroll_x_out_l_grpid_05,
        out_l_grpid_0_addr11 => ethash_search_B4_merge_vunroll_x_out_l_grpid_0_addr11,
        out_l_grpid_0_addr_zext161 => ethash_search_B4_merge_vunroll_x_out_l_grpid_0_addr_zext161,
        out_scalarizer_0100164 => ethash_search_B4_merge_vunroll_x_out_scalarizer_0100164,
        out_scalarizer_0100374 => ethash_search_B4_merge_vunroll_x_out_scalarizer_0100374,
        out_scalarizer_0100584 => ethash_search_B4_merge_vunroll_x_out_scalarizer_0100584,
        out_scalarizer_0100794 => ethash_search_B4_merge_vunroll_x_out_scalarizer_0100794,
        out_scalarizer_01173138 => ethash_search_B4_merge_vunroll_x_out_scalarizer_01173138,
        out_scalarizer_01175142 => ethash_search_B4_merge_vunroll_x_out_scalarizer_01175142,
        out_scalarizer_01177146 => ethash_search_B4_merge_vunroll_x_out_scalarizer_01177146,
        out_scalarizer_01179150 => ethash_search_B4_merge_vunroll_x_out_scalarizer_01179150,
        out_scalarizer_099324 => ethash_search_B4_merge_vunroll_x_out_scalarizer_099324,
        out_scalarizer_099534 => ethash_search_B4_merge_vunroll_x_out_scalarizer_099534,
        out_scalarizer_099744 => ethash_search_B4_merge_vunroll_x_out_scalarizer_099744,
        out_scalarizer_099954 => ethash_search_B4_merge_vunroll_x_out_scalarizer_099954,
        out_scalarizer_1100059 => ethash_search_B4_merge_vunroll_x_out_scalarizer_1100059,
        out_scalarizer_1100269 => ethash_search_B4_merge_vunroll_x_out_scalarizer_1100269,
        out_scalarizer_1100479 => ethash_search_B4_merge_vunroll_x_out_scalarizer_1100479,
        out_scalarizer_1100689 => ethash_search_B4_merge_vunroll_x_out_scalarizer_1100689,
        out_scalarizer_1100899 => ethash_search_B4_merge_vunroll_x_out_scalarizer_1100899,
        out_scalarizer_11174140 => ethash_search_B4_merge_vunroll_x_out_scalarizer_11174140,
        out_scalarizer_11176144 => ethash_search_B4_merge_vunroll_x_out_scalarizer_11176144,
        out_scalarizer_11178148 => ethash_search_B4_merge_vunroll_x_out_scalarizer_11178148,
        out_scalarizer_11180152 => ethash_search_B4_merge_vunroll_x_out_scalarizer_11180152,
        out_scalarizer_199429 => ethash_search_B4_merge_vunroll_x_out_scalarizer_199429,
        out_scalarizer_199639 => ethash_search_B4_merge_vunroll_x_out_scalarizer_199639,
        out_scalarizer_199849 => ethash_search_B4_merge_vunroll_x_out_scalarizer_199849,
        out_stall_out_0 => ethash_search_B4_merge_vunroll_x_out_stall_out_0,
        out_stall_out_1 => ethash_search_B4_merge_vunroll_x_out_stall_out_1,
        out_state_0_0_cast122 => ethash_search_B4_merge_vunroll_x_out_state_0_0_cast122,
        out_state_4_0_cast125 => ethash_search_B4_merge_vunroll_x_out_state_4_0_cast125,
        out_state_5_0_cast128 => ethash_search_B4_merge_vunroll_x_out_state_5_0_cast128,
        out_state_6_0_cast131 => ethash_search_B4_merge_vunroll_x_out_state_6_0_cast131,
        out_state_7_0_cast134 => ethash_search_B4_merge_vunroll_x_out_state_7_0_cast134,
        out_unnamed_ethash_search32 => ethash_search_B4_merge_vunroll_x_out_unnamed_ethash_search32,
        out_valid_out => ethash_search_B4_merge_vunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- num50_cast_x(BITSELECT,320)
    num50_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_unnamed_ethash_search32(31 downto 0);

    -- num49_cast_x(BITSELECT,318)
    num49_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_state_7_0_cast134(63 downto 0);

    -- num48_cast_x(BITSELECT,317)
    num48_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_state_6_0_cast131(63 downto 0);

    -- num47_cast_x(BITSELECT,316)
    num47_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_state_5_0_cast128(63 downto 0);

    -- num46_cast_x(BITSELECT,315)
    num46_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_state_4_0_cast125(63 downto 0);

    -- num45_cast_x(BITSELECT,314)
    num45_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_state_0_0_cast122(63 downto 0);

    -- num44_cast_x(BITSELECT,313)
    num44_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_scalarizer_199849(31 downto 0);

    -- num43_cast_x(BITSELECT,312)
    num43_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_scalarizer_199639(31 downto 0);

    -- num42_cast_x(BITSELECT,311)
    num42_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_scalarizer_199429(31 downto 0);

    -- num41_cast_x(BITSELECT,310)
    num41_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_scalarizer_11180152(31 downto 0);

    -- num40_cast_x(BITSELECT,309)
    num40_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_scalarizer_11178148(31 downto 0);

    -- num39_cast_x(BITSELECT,307)
    num39_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_scalarizer_11176144(31 downto 0);

    -- num38_cast_x(BITSELECT,306)
    num38_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_scalarizer_11174140(31 downto 0);

    -- num37_cast_x(BITSELECT,305)
    num37_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_scalarizer_1100899(31 downto 0);

    -- num36_cast_x(BITSELECT,304)
    num36_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_scalarizer_1100689(31 downto 0);

    -- num35_cast_x(BITSELECT,303)
    num35_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_scalarizer_1100479(31 downto 0);

    -- num34_cast_x(BITSELECT,302)
    num34_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_scalarizer_1100269(31 downto 0);

    -- num33_cast_x(BITSELECT,301)
    num33_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_scalarizer_1100059(31 downto 0);

    -- num32_cast_x(BITSELECT,300)
    num32_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_scalarizer_099954(31 downto 0);

    -- num31_cast_x(BITSELECT,299)
    num31_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_scalarizer_099744(31 downto 0);

    -- num30_cast_x(BITSELECT,298)
    num30_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_scalarizer_099534(31 downto 0);

    -- num29_cast_x(BITSELECT,296)
    num29_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_scalarizer_099324(31 downto 0);

    -- num28_cast_x(BITSELECT,295)
    num28_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_scalarizer_01179150(31 downto 0);

    -- num27_cast_x(BITSELECT,294)
    num27_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_scalarizer_01177146(31 downto 0);

    -- num26_cast_x(BITSELECT,293)
    num26_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_scalarizer_01175142(31 downto 0);

    -- num25_cast_x(BITSELECT,292)
    num25_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_scalarizer_01173138(31 downto 0);

    -- num24_cast_x(BITSELECT,291)
    num24_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_scalarizer_0100794(31 downto 0);

    -- num23_cast_x(BITSELECT,290)
    num23_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_scalarizer_0100584(31 downto 0);

    -- num22_cast_x(BITSELECT,289)
    num22_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_scalarizer_0100374(31 downto 0);

    -- num21_cast_x(BITSELECT,288)
    num21_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_scalarizer_0100164(31 downto 0);

    -- dupName_0_3_cast_x(BITSELECT,5)
    dupName_0_3_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_mix_pm_2_in_3(31 downto 0);

    -- dupName_0_2_cast_x(BITSELECT,4)
    dupName_0_2_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_mix_pm_2_in_2(31 downto 0);

    -- dupName_0_1_cast_x(BITSELECT,3)
    dupName_0_1_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_mix_pm_2_in_1(31 downto 0);

    -- dupName_0_0_cast_x(BITSELECT,2)
    dupName_0_0_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_mix_pm_2_in_0(31 downto 0);

    -- num20_join_x(BITJOIN,287)
    num20_join_x_q <= dupName_0_3_cast_x_b & dupName_0_2_cast_x_b & dupName_0_1_cast_x_b & dupName_0_0_cast_x_b;

    -- num19_cast_x(BITSELECT,285)
    num19_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_l_grpid_0_addr_zext161(63 downto 0);

    -- num18_cast_x(BITSELECT,284)
    num18_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_l_grpid_0_addr11(31 downto 0);

    -- num17_cast_x(BITSELECT,283)
    num17_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_l_grpid_05(31 downto 0);

    -- num16_cast_x(BITSELECT,282)
    num16_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_i66_2906(31 downto 0);

    -- num15_cast_x(BITSELECT,281)
    num15_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_i18_0908154(31 downto 0);

    -- num14_cast_x(BITSELECT,280)
    num14_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_global_id_0194(31 downto 0);

    -- num13_cast_x(BITSELECT,279)
    num13_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_fpgaindvars_iv9(4 downto 0);

    -- num12_cast_x(BITSELECT,278)
    num12_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_fpgaindvars_iv6(2 downto 0);

    -- num11_cast_x(BITSELECT,277)
    num11_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_fpgaindvars_iv12136(3 downto 0);

    -- num10_cast_x(BITSELECT,276)
    num10_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_cmp23_xor159(0 downto 0);

    -- num9_cast_x(BITSELECT,325)
    num9_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_cmp23157(0 downto 0);

    -- num8_cast_x(BITSELECT,324)
    num8_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_c0_exe4118(63 downto 0);

    -- num7_cast_x(BITSELECT,323)
    num7_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_c0_exe3114(63 downto 0);

    -- num6_cast_x(BITSELECT,322)
    num6_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_c0_exe2110(63 downto 0);

    -- num5_cast_x(BITSELECT,321)
    num5_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_c0_exe1105(0 downto 0);

    -- num4_cast_x(BITSELECT,319)
    num4_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_arrayidx45_RM163(63 downto 0);

    -- num3_cast_x(BITSELECT,308)
    num3_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_arrayidx36_2_RM165(63 downto 0);

    -- num2_cast_x(BITSELECT,297)
    num2_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_arraydecay51_RM166(63 downto 0);

    -- num1_cast_x(BITSELECT,286)
    num1_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_and_RM155(31 downto 0);

    -- num0_cast_x(BITSELECT,275)
    num0_cast_x_b <= ethash_search_B4_merge_vunroll_x_out_a_1907(31 downto 0);

    -- aggregateWireOut_join(BITJOIN,326)
    aggregateWireOut_join_q <= num50_cast_x_b & num49_cast_x_b & num48_cast_x_b & num47_cast_x_b & num46_cast_x_b & num45_cast_x_b & num44_cast_x_b & num43_cast_x_b & num42_cast_x_b & num41_cast_x_b & num40_cast_x_b & num39_cast_x_b & num38_cast_x_b & num37_cast_x_b & num36_cast_x_b & num35_cast_x_b & num34_cast_x_b & num33_cast_x_b & num32_cast_x_b & num31_cast_x_b & num30_cast_x_b & num29_cast_x_b & num28_cast_x_b & num27_cast_x_b & num26_cast_x_b & num25_cast_x_b & num24_cast_x_b & num23_cast_x_b & num22_cast_x_b & num21_cast_x_b & num20_join_x_q & num19_cast_x_b & num18_cast_x_b & num17_cast_x_b & num16_cast_x_b & num15_cast_x_b & num14_cast_x_b & num13_cast_x_b & num12_cast_x_b & num11_cast_x_b & num10_cast_x_b & num9_cast_x_b & num8_cast_x_b & num7_cast_x_b & num6_cast_x_b & num5_cast_x_b & num4_cast_x_b & num3_cast_x_b & num2_cast_x_b & num1_cast_x_b & num0_cast_x_b;

    -- loop_capacity_FIFO(BLACKBOX,329)
    theloop_capacity_FIFO : dupName_0_loop_capacity_FIFO_2u1i4agm0676j6e6x6s6u0qc0xgbuoz
    PORT MAP (
        in_data_in => aggregateWireOut_join_q,
        in_stall_in => bb_ethash_search_B4_stall_region_out_stall_out,
        in_valid_in => ethash_search_B4_merge_vunroll_x_out_valid_out,
        out_data_out => loop_capacity_FIFO_out_data_out,
        out_stall_out => loop_capacity_FIFO_out_stall_out,
        out_valid_out => loop_capacity_FIFO_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- dupName_49_data_out_select_x(BITSELECT,58)
    dupName_49_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1934 downto 1903);

    -- dupName_48_data_out_select_x(BITSELECT,57)
    dupName_48_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1902 downto 1839);

    -- dupName_47_data_out_select_x(BITSELECT,56)
    dupName_47_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1838 downto 1775);

    -- dupName_46_data_out_select_x(BITSELECT,55)
    dupName_46_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1774 downto 1711);

    -- dupName_45_data_out_select_x(BITSELECT,54)
    dupName_45_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1710 downto 1647);

    -- dupName_44_data_out_select_x(BITSELECT,53)
    dupName_44_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1646 downto 1583);

    -- dupName_43_data_out_select_x(BITSELECT,52)
    dupName_43_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1582 downto 1551);

    -- dupName_42_data_out_select_x(BITSELECT,51)
    dupName_42_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1550 downto 1519);

    -- dupName_41_data_out_select_x(BITSELECT,50)
    dupName_41_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1518 downto 1487);

    -- dupName_40_data_out_select_x(BITSELECT,49)
    dupName_40_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1486 downto 1455);

    -- dupName_39_data_out_select_x(BITSELECT,48)
    dupName_39_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1454 downto 1423);

    -- dupName_38_data_out_select_x(BITSELECT,47)
    dupName_38_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1422 downto 1391);

    -- dupName_37_data_out_select_x(BITSELECT,46)
    dupName_37_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1390 downto 1359);

    -- dupName_36_data_out_select_x(BITSELECT,45)
    dupName_36_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1358 downto 1327);

    -- dupName_35_data_out_select_x(BITSELECT,44)
    dupName_35_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1326 downto 1295);

    -- dupName_34_data_out_select_x(BITSELECT,43)
    dupName_34_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1294 downto 1263);

    -- dupName_33_data_out_select_x(BITSELECT,42)
    dupName_33_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1262 downto 1231);

    -- dupName_32_data_out_select_x(BITSELECT,41)
    dupName_32_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1230 downto 1199);

    -- dupName_31_data_out_select_x(BITSELECT,40)
    dupName_31_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1198 downto 1167);

    -- dupName_30_data_out_select_x(BITSELECT,39)
    dupName_30_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1166 downto 1135);

    -- dupName_29_data_out_select_x(BITSELECT,38)
    dupName_29_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1134 downto 1103);

    -- dupName_28_data_out_select_x(BITSELECT,37)
    dupName_28_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1102 downto 1071);

    -- dupName_27_data_out_select_x(BITSELECT,36)
    dupName_27_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1070 downto 1039);

    -- dupName_26_data_out_select_x(BITSELECT,35)
    dupName_26_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1038 downto 1007);

    -- dupName_25_data_out_select_x(BITSELECT,34)
    dupName_25_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(1006 downto 975);

    -- dupName_24_data_out_select_x(BITSELECT,33)
    dupName_24_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(974 downto 943);

    -- dupName_23_data_out_select_x(BITSELECT,32)
    dupName_23_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(942 downto 911);

    -- dupName_22_data_out_select_x(BITSELECT,31)
    dupName_22_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(910 downto 879);

    -- dupName_21_data_out_select_x(BITSELECT,30)
    dupName_21_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(878 downto 847);

    -- dupName_20_data_out_select_x(BITSELECT,29)
    dupName_20_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(846 downto 815);

    -- dupName_18_data_out_select_x(BITSELECT,27)
    dupName_18_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(686 downto 623);

    -- dupName_17_data_out_select_x(BITSELECT,26)
    dupName_17_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(622 downto 591);

    -- dupName_16_data_out_select_x(BITSELECT,25)
    dupName_16_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(590 downto 559);

    -- dupName_15_data_out_select_x(BITSELECT,24)
    dupName_15_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(558 downto 527);

    -- dupName_14_data_out_select_x(BITSELECT,23)
    dupName_14_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(526 downto 495);

    -- dupName_13_data_out_select_x(BITSELECT,22)
    dupName_13_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(494 downto 463);

    -- dupName_12_data_out_select_x(BITSELECT,21)
    dupName_12_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(462 downto 458);

    -- dupName_11_data_out_select_x(BITSELECT,20)
    dupName_11_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(457 downto 455);

    -- dupName_10_data_out_select_x(BITSELECT,19)
    dupName_10_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(454 downto 451);

    -- dupName_9_data_out_select_x(BITSELECT,18)
    dupName_9_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(450 downto 450);

    -- dupName_8_data_out_select_x(BITSELECT,17)
    dupName_8_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(449 downto 449);

    -- dupName_7_data_out_select_x(BITSELECT,16)
    dupName_7_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(448 downto 385);

    -- dupName_6_data_out_select_x(BITSELECT,15)
    dupName_6_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(384 downto 321);

    -- dupName_5_data_out_select_x(BITSELECT,14)
    dupName_5_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(320 downto 257);

    -- dupName_4_data_out_select_x(BITSELECT,13)
    dupName_4_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(256 downto 256);

    -- dupName_3_data_out_select_x(BITSELECT,12)
    dupName_3_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(255 downto 192);

    -- dupName_2_data_out_select_x(BITSELECT,10)
    dupName_2_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(191 downto 128);

    -- dupName_1_data_out_select_x(BITSELECT,8)
    dupName_1_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(127 downto 64);

    -- dupName_0_data_out_select_x(BITSELECT,6)
    dupName_0_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(63 downto 32);

    -- data_out_select(BITSELECT,328)
    data_out_select_b <= loop_capacity_FIFO_out_data_out(31 downto 0);

    -- dupName_19_data_out_select_x(BITSELECT,28)
    dupName_19_data_out_select_x_b <= loop_capacity_FIFO_out_data_out(814 downto 687);

    -- dupName_2_primWireOut_select_x(BITSELECT,11)
    dupName_2_primWireOut_select_x_b <= dupName_19_data_out_select_x_b(127 downto 96);

    -- dupName_1_primWireOut_select_x(BITSELECT,9)
    dupName_1_primWireOut_select_x_b <= dupName_19_data_out_select_x_b(95 downto 64);

    -- dupName_0_primWireOut_select_x(BITSELECT,7)
    dupName_0_primWireOut_select_x_b <= dupName_19_data_out_select_x_b(63 downto 32);

    -- primWireOut_select(BITSELECT,330)
    primWireOut_select_b <= dupName_19_data_out_select_x_b(31 downto 0);

    -- bb_ethash_search_B4_stall_region(BLACKBOX,327)
    thebb_ethash_search_B4_stall_region : bb_ethash_search_B4_stall_region
    PORT MAP (
        in_mix_pm_2_in_0 => primWireOut_select_b,
        in_mix_pm_2_in_1 => dupName_0_primWireOut_select_x_b,
        in_mix_pm_2_in_2 => dupName_1_primWireOut_select_x_b,
        in_mix_pm_2_in_3 => dupName_2_primWireOut_select_x_b,
        in_a_1907 => data_out_select_b,
        in_and_RM155 => dupName_0_data_out_select_x_b,
        in_arraydecay51_RM166 => dupName_1_data_out_select_x_b,
        in_arrayidx36_2_RM165 => dupName_2_data_out_select_x_b,
        in_arrayidx45_RM163 => dupName_3_data_out_select_x_b,
        in_barrier_unnamed_ethash_search33_wgs_workgroup_size => in_barrier_unnamed_ethash_search33_wgs_workgroup_size,
        in_c0_exe1105 => dupName_4_data_out_select_x_b,
        in_c0_exe2110 => dupName_5_data_out_select_x_b,
        in_c0_exe3114 => dupName_6_data_out_select_x_b,
        in_c0_exe4118 => dupName_7_data_out_select_x_b,
        in_cmp23157 => dupName_8_data_out_select_x_b,
        in_cmp23_xor159 => dupName_9_data_out_select_x_b,
        in_flush => in_flush,
        in_fpgaindvars_iv12136 => dupName_10_data_out_select_x_b,
        in_fpgaindvars_iv6 => dupName_11_data_out_select_x_b,
        in_fpgaindvars_iv9 => dupName_12_data_out_select_x_b,
        in_g_dag => in_g_dag,
        in_global_id_0194 => dupName_13_data_out_select_x_b,
        in_i18_0908154 => dupName_14_data_out_select_x_b,
        in_i66_2906 => dupName_15_data_out_select_x_b,
        in_l_grpid_05 => dupName_16_data_out_select_x_b,
        in_l_grpid_0_addr11 => dupName_17_data_out_select_x_b,
        in_l_grpid_0_addr_zext161 => dupName_18_data_out_select_x_b,
        in_memdep_204_avm_readdata => in_memdep_204_avm_readdata,
        in_memdep_204_avm_readdatavalid => in_memdep_204_avm_readdatavalid,
        in_memdep_204_avm_waitrequest => in_memdep_204_avm_waitrequest,
        in_memdep_204_avm_writeack => in_memdep_204_avm_writeack,
        in_scalarizer_0100164 => dupName_20_data_out_select_x_b,
        in_scalarizer_0100374 => dupName_21_data_out_select_x_b,
        in_scalarizer_0100584 => dupName_22_data_out_select_x_b,
        in_scalarizer_0100794 => dupName_23_data_out_select_x_b,
        in_scalarizer_01173138 => dupName_24_data_out_select_x_b,
        in_scalarizer_01175142 => dupName_25_data_out_select_x_b,
        in_scalarizer_01177146 => dupName_26_data_out_select_x_b,
        in_scalarizer_01179150 => dupName_27_data_out_select_x_b,
        in_scalarizer_099324 => dupName_28_data_out_select_x_b,
        in_scalarizer_099534 => dupName_29_data_out_select_x_b,
        in_scalarizer_099744 => dupName_30_data_out_select_x_b,
        in_scalarizer_099954 => dupName_31_data_out_select_x_b,
        in_scalarizer_1100059 => dupName_32_data_out_select_x_b,
        in_scalarizer_1100269 => dupName_33_data_out_select_x_b,
        in_scalarizer_1100479 => dupName_34_data_out_select_x_b,
        in_scalarizer_1100689 => dupName_35_data_out_select_x_b,
        in_scalarizer_1100899 => dupName_36_data_out_select_x_b,
        in_scalarizer_11174140 => dupName_37_data_out_select_x_b,
        in_scalarizer_11176144 => dupName_38_data_out_select_x_b,
        in_scalarizer_11178148 => dupName_39_data_out_select_x_b,
        in_scalarizer_11180152 => dupName_40_data_out_select_x_b,
        in_scalarizer_199429 => dupName_41_data_out_select_x_b,
        in_scalarizer_199639 => dupName_42_data_out_select_x_b,
        in_scalarizer_199849 => dupName_43_data_out_select_x_b,
        in_stall_in => ethash_search_B4_branch_vunroll_x_out_stall_out,
        in_state_0_0_cast122 => dupName_44_data_out_select_x_b,
        in_state_4_0_cast125 => dupName_45_data_out_select_x_b,
        in_state_5_0_cast128 => dupName_46_data_out_select_x_b,
        in_state_6_0_cast131 => dupName_47_data_out_select_x_b,
        in_state_7_0_cast134 => dupName_48_data_out_select_x_b,
        in_unnamed_ethash_search32 => dupName_49_data_out_select_x_b,
        in_unnamed_ethash_search34_avm_readdata => in_unnamed_ethash_search34_avm_readdata,
        in_unnamed_ethash_search34_avm_readdatavalid => in_unnamed_ethash_search34_avm_readdatavalid,
        in_unnamed_ethash_search34_avm_waitrequest => in_unnamed_ethash_search34_avm_waitrequest,
        in_unnamed_ethash_search34_avm_writeack => in_unnamed_ethash_search34_avm_writeack,
        in_unnamed_ethash_search35_avm_readdata => in_unnamed_ethash_search35_avm_readdata,
        in_unnamed_ethash_search35_avm_readdatavalid => in_unnamed_ethash_search35_avm_readdatavalid,
        in_unnamed_ethash_search35_avm_waitrequest => in_unnamed_ethash_search35_avm_waitrequest,
        in_unnamed_ethash_search35_avm_writeack => in_unnamed_ethash_search35_avm_writeack,
        in_valid_in => loop_capacity_FIFO_out_valid_out,
        out_xor_i679_3_0 => bb_ethash_search_B4_stall_region_out_xor_i679_3_0,
        out_xor_i679_3_1 => bb_ethash_search_B4_stall_region_out_xor_i679_3_1,
        out_xor_i679_3_2 => bb_ethash_search_B4_stall_region_out_xor_i679_3_2,
        out_xor_i679_3_3 => bb_ethash_search_B4_stall_region_out_xor_i679_3_3,
        out_a_1907_LC_OuterPHI => bb_ethash_search_B4_stall_region_out_a_1907_LC_OuterPHI,
        out_and_RM155 => bb_ethash_search_B4_stall_region_out_and_RM155,
        out_arraydecay51_RM166 => bb_ethash_search_B4_stall_region_out_arraydecay51_RM166,
        out_arrayidx36_2_RM165 => bb_ethash_search_B4_stall_region_out_arrayidx36_2_RM165,
        out_arrayidx45_RM163 => bb_ethash_search_B4_stall_region_out_arrayidx45_RM163,
        out_c0_exe1105 => bb_ethash_search_B4_stall_region_out_c0_exe1105,
        out_c0_exe2110 => bb_ethash_search_B4_stall_region_out_c0_exe2110,
        out_c0_exe3114 => bb_ethash_search_B4_stall_region_out_c0_exe3114,
        out_c0_exe4118 => bb_ethash_search_B4_stall_region_out_c0_exe4118,
        out_cmp23157 => bb_ethash_search_B4_stall_region_out_cmp23157,
        out_cmp23_xor159 => bb_ethash_search_B4_stall_region_out_cmp23_xor159,
        out_for_end91_LC_COND => bb_ethash_search_B4_stall_region_out_for_end91_LC_COND,
        out_fpgaindvars_iv12136 => bb_ethash_search_B4_stall_region_out_fpgaindvars_iv12136,
        out_fpgaindvars_iv6_LC_InnerPHI => bb_ethash_search_B4_stall_region_out_fpgaindvars_iv6_LC_InnerPHI,
        out_fpgaindvars_iv9_LC_OuterPHI => bb_ethash_search_B4_stall_region_out_fpgaindvars_iv9_LC_OuterPHI,
        out_global_id_0194 => bb_ethash_search_B4_stall_region_out_global_id_0194,
        out_i18_0908154 => bb_ethash_search_B4_stall_region_out_i18_0908154,
        out_i66_2906_LC_InnerPHI => bb_ethash_search_B4_stall_region_out_i66_2906_LC_InnerPHI,
        out_idxprom80_RM => bb_ethash_search_B4_stall_region_out_idxprom80_RM,
        out_l_grpid_05 => bb_ethash_search_B4_stall_region_out_l_grpid_05,
        out_l_grpid_0_addr11 => bb_ethash_search_B4_stall_region_out_l_grpid_0_addr11,
        out_l_grpid_0_addr_zext161 => bb_ethash_search_B4_stall_region_out_l_grpid_0_addr_zext161,
        out_memdep_204_avm_address => bb_ethash_search_B4_stall_region_out_memdep_204_avm_address,
        out_memdep_204_avm_burstcount => bb_ethash_search_B4_stall_region_out_memdep_204_avm_burstcount,
        out_memdep_204_avm_byteenable => bb_ethash_search_B4_stall_region_out_memdep_204_avm_byteenable,
        out_memdep_204_avm_enable => bb_ethash_search_B4_stall_region_out_memdep_204_avm_enable,
        out_memdep_204_avm_read => bb_ethash_search_B4_stall_region_out_memdep_204_avm_read,
        out_memdep_204_avm_write => bb_ethash_search_B4_stall_region_out_memdep_204_avm_write,
        out_memdep_204_avm_writedata => bb_ethash_search_B4_stall_region_out_memdep_204_avm_writedata,
        out_scalarizer_0100164 => bb_ethash_search_B4_stall_region_out_scalarizer_0100164,
        out_scalarizer_0100374 => bb_ethash_search_B4_stall_region_out_scalarizer_0100374,
        out_scalarizer_0100584 => bb_ethash_search_B4_stall_region_out_scalarizer_0100584,
        out_scalarizer_0100794 => bb_ethash_search_B4_stall_region_out_scalarizer_0100794,
        out_scalarizer_01173138 => bb_ethash_search_B4_stall_region_out_scalarizer_01173138,
        out_scalarizer_01175142 => bb_ethash_search_B4_stall_region_out_scalarizer_01175142,
        out_scalarizer_01177146 => bb_ethash_search_B4_stall_region_out_scalarizer_01177146,
        out_scalarizer_01179150 => bb_ethash_search_B4_stall_region_out_scalarizer_01179150,
        out_scalarizer_099324 => bb_ethash_search_B4_stall_region_out_scalarizer_099324,
        out_scalarizer_099534 => bb_ethash_search_B4_stall_region_out_scalarizer_099534,
        out_scalarizer_099744 => bb_ethash_search_B4_stall_region_out_scalarizer_099744,
        out_scalarizer_099954 => bb_ethash_search_B4_stall_region_out_scalarizer_099954,
        out_scalarizer_0xor1200 => bb_ethash_search_B4_stall_region_out_scalarizer_0xor1200,
        out_scalarizer_1100059 => bb_ethash_search_B4_stall_region_out_scalarizer_1100059,
        out_scalarizer_1100269 => bb_ethash_search_B4_stall_region_out_scalarizer_1100269,
        out_scalarizer_1100479 => bb_ethash_search_B4_stall_region_out_scalarizer_1100479,
        out_scalarizer_1100689 => bb_ethash_search_B4_stall_region_out_scalarizer_1100689,
        out_scalarizer_1100899 => bb_ethash_search_B4_stall_region_out_scalarizer_1100899,
        out_scalarizer_11174140 => bb_ethash_search_B4_stall_region_out_scalarizer_11174140,
        out_scalarizer_11176144 => bb_ethash_search_B4_stall_region_out_scalarizer_11176144,
        out_scalarizer_11178148 => bb_ethash_search_B4_stall_region_out_scalarizer_11178148,
        out_scalarizer_11180152 => bb_ethash_search_B4_stall_region_out_scalarizer_11180152,
        out_scalarizer_199429 => bb_ethash_search_B4_stall_region_out_scalarizer_199429,
        out_scalarizer_199639 => bb_ethash_search_B4_stall_region_out_scalarizer_199639,
        out_scalarizer_199849 => bb_ethash_search_B4_stall_region_out_scalarizer_199849,
        out_scalarizer_1xor1201 => bb_ethash_search_B4_stall_region_out_scalarizer_1xor1201,
        out_scalarizer_2xor => bb_ethash_search_B4_stall_region_out_scalarizer_2xor,
        out_scalarizer_3xor => bb_ethash_search_B4_stall_region_out_scalarizer_3xor,
        out_stall_out => bb_ethash_search_B4_stall_region_out_stall_out,
        out_state_0_0_cast122 => bb_ethash_search_B4_stall_region_out_state_0_0_cast122,
        out_state_4_0_cast125 => bb_ethash_search_B4_stall_region_out_state_4_0_cast125,
        out_state_5_0_cast128 => bb_ethash_search_B4_stall_region_out_state_5_0_cast128,
        out_state_6_0_cast131 => bb_ethash_search_B4_stall_region_out_state_6_0_cast131,
        out_state_7_0_cast134 => bb_ethash_search_B4_stall_region_out_state_7_0_cast134,
        out_unnamed_ethash_search32 => bb_ethash_search_B4_stall_region_out_unnamed_ethash_search32,
        out_unnamed_ethash_search34_avm_address => bb_ethash_search_B4_stall_region_out_unnamed_ethash_search34_avm_address,
        out_unnamed_ethash_search34_avm_burstcount => bb_ethash_search_B4_stall_region_out_unnamed_ethash_search34_avm_burstcount,
        out_unnamed_ethash_search34_avm_byteenable => bb_ethash_search_B4_stall_region_out_unnamed_ethash_search34_avm_byteenable,
        out_unnamed_ethash_search34_avm_enable => bb_ethash_search_B4_stall_region_out_unnamed_ethash_search34_avm_enable,
        out_unnamed_ethash_search34_avm_read => bb_ethash_search_B4_stall_region_out_unnamed_ethash_search34_avm_read,
        out_unnamed_ethash_search34_avm_write => bb_ethash_search_B4_stall_region_out_unnamed_ethash_search34_avm_write,
        out_unnamed_ethash_search34_avm_writedata => bb_ethash_search_B4_stall_region_out_unnamed_ethash_search34_avm_writedata,
        out_unnamed_ethash_search35_avm_address => bb_ethash_search_B4_stall_region_out_unnamed_ethash_search35_avm_address,
        out_unnamed_ethash_search35_avm_burstcount => bb_ethash_search_B4_stall_region_out_unnamed_ethash_search35_avm_burstcount,
        out_unnamed_ethash_search35_avm_byteenable => bb_ethash_search_B4_stall_region_out_unnamed_ethash_search35_avm_byteenable,
        out_unnamed_ethash_search35_avm_enable => bb_ethash_search_B4_stall_region_out_unnamed_ethash_search35_avm_enable,
        out_unnamed_ethash_search35_avm_read => bb_ethash_search_B4_stall_region_out_unnamed_ethash_search35_avm_read,
        out_unnamed_ethash_search35_avm_write => bb_ethash_search_B4_stall_region_out_unnamed_ethash_search35_avm_write,
        out_unnamed_ethash_search35_avm_writedata => bb_ethash_search_B4_stall_region_out_unnamed_ethash_search35_avm_writedata,
        out_valid_out => bb_ethash_search_B4_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- ethash_search_B4_branch_vunroll_x(BLACKBOX,59)
    theethash_search_B4_branch_vunroll_x : ethash_search_B4_branch
    PORT MAP (
        in_xor_i679_3_0 => bb_ethash_search_B4_stall_region_out_xor_i679_3_0,
        in_xor_i679_3_1 => bb_ethash_search_B4_stall_region_out_xor_i679_3_1,
        in_xor_i679_3_2 => bb_ethash_search_B4_stall_region_out_xor_i679_3_2,
        in_xor_i679_3_3 => bb_ethash_search_B4_stall_region_out_xor_i679_3_3,
        in_a_1907_LC_OuterPHI => bb_ethash_search_B4_stall_region_out_a_1907_LC_OuterPHI,
        in_and_RM155 => bb_ethash_search_B4_stall_region_out_and_RM155,
        in_arraydecay51_RM166 => bb_ethash_search_B4_stall_region_out_arraydecay51_RM166,
        in_arrayidx36_2_RM165 => bb_ethash_search_B4_stall_region_out_arrayidx36_2_RM165,
        in_arrayidx45_RM163 => bb_ethash_search_B4_stall_region_out_arrayidx45_RM163,
        in_c0_exe1105 => bb_ethash_search_B4_stall_region_out_c0_exe1105,
        in_c0_exe2110 => bb_ethash_search_B4_stall_region_out_c0_exe2110,
        in_c0_exe3114 => bb_ethash_search_B4_stall_region_out_c0_exe3114,
        in_c0_exe4118 => bb_ethash_search_B4_stall_region_out_c0_exe4118,
        in_cmp23157 => bb_ethash_search_B4_stall_region_out_cmp23157,
        in_cmp23_xor159 => bb_ethash_search_B4_stall_region_out_cmp23_xor159,
        in_for_end91_LC_COND => bb_ethash_search_B4_stall_region_out_for_end91_LC_COND,
        in_fpgaindvars_iv12136 => bb_ethash_search_B4_stall_region_out_fpgaindvars_iv12136,
        in_fpgaindvars_iv6_LC_InnerPHI => bb_ethash_search_B4_stall_region_out_fpgaindvars_iv6_LC_InnerPHI,
        in_fpgaindvars_iv9_LC_OuterPHI => bb_ethash_search_B4_stall_region_out_fpgaindvars_iv9_LC_OuterPHI,
        in_global_id_0194 => bb_ethash_search_B4_stall_region_out_global_id_0194,
        in_i18_0908154 => bb_ethash_search_B4_stall_region_out_i18_0908154,
        in_i66_2906_LC_InnerPHI => bb_ethash_search_B4_stall_region_out_i66_2906_LC_InnerPHI,
        in_idxprom80_RM => bb_ethash_search_B4_stall_region_out_idxprom80_RM,
        in_l_grpid_05 => bb_ethash_search_B4_stall_region_out_l_grpid_05,
        in_l_grpid_0_addr11 => bb_ethash_search_B4_stall_region_out_l_grpid_0_addr11,
        in_l_grpid_0_addr_zext161 => bb_ethash_search_B4_stall_region_out_l_grpid_0_addr_zext161,
        in_scalarizer_0100164 => bb_ethash_search_B4_stall_region_out_scalarizer_0100164,
        in_scalarizer_0100374 => bb_ethash_search_B4_stall_region_out_scalarizer_0100374,
        in_scalarizer_0100584 => bb_ethash_search_B4_stall_region_out_scalarizer_0100584,
        in_scalarizer_0100794 => bb_ethash_search_B4_stall_region_out_scalarizer_0100794,
        in_scalarizer_01173138 => bb_ethash_search_B4_stall_region_out_scalarizer_01173138,
        in_scalarizer_01175142 => bb_ethash_search_B4_stall_region_out_scalarizer_01175142,
        in_scalarizer_01177146 => bb_ethash_search_B4_stall_region_out_scalarizer_01177146,
        in_scalarizer_01179150 => bb_ethash_search_B4_stall_region_out_scalarizer_01179150,
        in_scalarizer_099324 => bb_ethash_search_B4_stall_region_out_scalarizer_099324,
        in_scalarizer_099534 => bb_ethash_search_B4_stall_region_out_scalarizer_099534,
        in_scalarizer_099744 => bb_ethash_search_B4_stall_region_out_scalarizer_099744,
        in_scalarizer_099954 => bb_ethash_search_B4_stall_region_out_scalarizer_099954,
        in_scalarizer_0xor1200 => bb_ethash_search_B4_stall_region_out_scalarizer_0xor1200,
        in_scalarizer_1100059 => bb_ethash_search_B4_stall_region_out_scalarizer_1100059,
        in_scalarizer_1100269 => bb_ethash_search_B4_stall_region_out_scalarizer_1100269,
        in_scalarizer_1100479 => bb_ethash_search_B4_stall_region_out_scalarizer_1100479,
        in_scalarizer_1100689 => bb_ethash_search_B4_stall_region_out_scalarizer_1100689,
        in_scalarizer_1100899 => bb_ethash_search_B4_stall_region_out_scalarizer_1100899,
        in_scalarizer_11174140 => bb_ethash_search_B4_stall_region_out_scalarizer_11174140,
        in_scalarizer_11176144 => bb_ethash_search_B4_stall_region_out_scalarizer_11176144,
        in_scalarizer_11178148 => bb_ethash_search_B4_stall_region_out_scalarizer_11178148,
        in_scalarizer_11180152 => bb_ethash_search_B4_stall_region_out_scalarizer_11180152,
        in_scalarizer_199429 => bb_ethash_search_B4_stall_region_out_scalarizer_199429,
        in_scalarizer_199639 => bb_ethash_search_B4_stall_region_out_scalarizer_199639,
        in_scalarizer_199849 => bb_ethash_search_B4_stall_region_out_scalarizer_199849,
        in_scalarizer_1xor1201 => bb_ethash_search_B4_stall_region_out_scalarizer_1xor1201,
        in_scalarizer_2xor => bb_ethash_search_B4_stall_region_out_scalarizer_2xor,
        in_scalarizer_3xor => bb_ethash_search_B4_stall_region_out_scalarizer_3xor,
        in_stall_in_0 => in_stall_in_0,
        in_stall_in_1 => in_stall_in_1,
        in_state_0_0_cast122 => bb_ethash_search_B4_stall_region_out_state_0_0_cast122,
        in_state_4_0_cast125 => bb_ethash_search_B4_stall_region_out_state_4_0_cast125,
        in_state_5_0_cast128 => bb_ethash_search_B4_stall_region_out_state_5_0_cast128,
        in_state_6_0_cast131 => bb_ethash_search_B4_stall_region_out_state_6_0_cast131,
        in_state_7_0_cast134 => bb_ethash_search_B4_stall_region_out_state_7_0_cast134,
        in_unnamed_ethash_search32 => bb_ethash_search_B4_stall_region_out_unnamed_ethash_search32,
        in_valid_in => bb_ethash_search_B4_stall_region_out_valid_out,
        out_xor_i679_3_0 => ethash_search_B4_branch_vunroll_x_out_xor_i679_3_0,
        out_xor_i679_3_1 => ethash_search_B4_branch_vunroll_x_out_xor_i679_3_1,
        out_xor_i679_3_2 => ethash_search_B4_branch_vunroll_x_out_xor_i679_3_2,
        out_xor_i679_3_3 => ethash_search_B4_branch_vunroll_x_out_xor_i679_3_3,
        out_a_1907_LC_OuterPHI => ethash_search_B4_branch_vunroll_x_out_a_1907_LC_OuterPHI,
        out_and_RM155 => ethash_search_B4_branch_vunroll_x_out_and_RM155,
        out_arraydecay51_RM166 => ethash_search_B4_branch_vunroll_x_out_arraydecay51_RM166,
        out_arrayidx36_2_RM165 => ethash_search_B4_branch_vunroll_x_out_arrayidx36_2_RM165,
        out_arrayidx45_RM163 => ethash_search_B4_branch_vunroll_x_out_arrayidx45_RM163,
        out_c0_exe1105 => ethash_search_B4_branch_vunroll_x_out_c0_exe1105,
        out_c0_exe2110 => ethash_search_B4_branch_vunroll_x_out_c0_exe2110,
        out_c0_exe3114 => ethash_search_B4_branch_vunroll_x_out_c0_exe3114,
        out_c0_exe4118 => ethash_search_B4_branch_vunroll_x_out_c0_exe4118,
        out_cmp23157 => ethash_search_B4_branch_vunroll_x_out_cmp23157,
        out_cmp23_xor159 => ethash_search_B4_branch_vunroll_x_out_cmp23_xor159,
        out_fpgaindvars_iv12136 => ethash_search_B4_branch_vunroll_x_out_fpgaindvars_iv12136,
        out_fpgaindvars_iv6_LC_InnerPHI => ethash_search_B4_branch_vunroll_x_out_fpgaindvars_iv6_LC_InnerPHI,
        out_fpgaindvars_iv9_LC_OuterPHI => ethash_search_B4_branch_vunroll_x_out_fpgaindvars_iv9_LC_OuterPHI,
        out_global_id_0194 => ethash_search_B4_branch_vunroll_x_out_global_id_0194,
        out_i18_0908154 => ethash_search_B4_branch_vunroll_x_out_i18_0908154,
        out_i66_2906_LC_InnerPHI => ethash_search_B4_branch_vunroll_x_out_i66_2906_LC_InnerPHI,
        out_idxprom80_RM => ethash_search_B4_branch_vunroll_x_out_idxprom80_RM,
        out_l_grpid_05 => ethash_search_B4_branch_vunroll_x_out_l_grpid_05,
        out_l_grpid_0_addr11 => ethash_search_B4_branch_vunroll_x_out_l_grpid_0_addr11,
        out_l_grpid_0_addr_zext161 => ethash_search_B4_branch_vunroll_x_out_l_grpid_0_addr_zext161,
        out_scalarizer_0100164 => ethash_search_B4_branch_vunroll_x_out_scalarizer_0100164,
        out_scalarizer_0100374 => ethash_search_B4_branch_vunroll_x_out_scalarizer_0100374,
        out_scalarizer_0100584 => ethash_search_B4_branch_vunroll_x_out_scalarizer_0100584,
        out_scalarizer_0100794 => ethash_search_B4_branch_vunroll_x_out_scalarizer_0100794,
        out_scalarizer_01173138 => ethash_search_B4_branch_vunroll_x_out_scalarizer_01173138,
        out_scalarizer_01175142 => ethash_search_B4_branch_vunroll_x_out_scalarizer_01175142,
        out_scalarizer_01177146 => ethash_search_B4_branch_vunroll_x_out_scalarizer_01177146,
        out_scalarizer_01179150 => ethash_search_B4_branch_vunroll_x_out_scalarizer_01179150,
        out_scalarizer_099324 => ethash_search_B4_branch_vunroll_x_out_scalarizer_099324,
        out_scalarizer_099534 => ethash_search_B4_branch_vunroll_x_out_scalarizer_099534,
        out_scalarizer_099744 => ethash_search_B4_branch_vunroll_x_out_scalarizer_099744,
        out_scalarizer_099954 => ethash_search_B4_branch_vunroll_x_out_scalarizer_099954,
        out_scalarizer_0xor1200 => ethash_search_B4_branch_vunroll_x_out_scalarizer_0xor1200,
        out_scalarizer_1100059 => ethash_search_B4_branch_vunroll_x_out_scalarizer_1100059,
        out_scalarizer_1100269 => ethash_search_B4_branch_vunroll_x_out_scalarizer_1100269,
        out_scalarizer_1100479 => ethash_search_B4_branch_vunroll_x_out_scalarizer_1100479,
        out_scalarizer_1100689 => ethash_search_B4_branch_vunroll_x_out_scalarizer_1100689,
        out_scalarizer_1100899 => ethash_search_B4_branch_vunroll_x_out_scalarizer_1100899,
        out_scalarizer_11174140 => ethash_search_B4_branch_vunroll_x_out_scalarizer_11174140,
        out_scalarizer_11176144 => ethash_search_B4_branch_vunroll_x_out_scalarizer_11176144,
        out_scalarizer_11178148 => ethash_search_B4_branch_vunroll_x_out_scalarizer_11178148,
        out_scalarizer_11180152 => ethash_search_B4_branch_vunroll_x_out_scalarizer_11180152,
        out_scalarizer_199429 => ethash_search_B4_branch_vunroll_x_out_scalarizer_199429,
        out_scalarizer_199639 => ethash_search_B4_branch_vunroll_x_out_scalarizer_199639,
        out_scalarizer_199849 => ethash_search_B4_branch_vunroll_x_out_scalarizer_199849,
        out_scalarizer_1xor1201 => ethash_search_B4_branch_vunroll_x_out_scalarizer_1xor1201,
        out_scalarizer_2xor => ethash_search_B4_branch_vunroll_x_out_scalarizer_2xor,
        out_scalarizer_3xor => ethash_search_B4_branch_vunroll_x_out_scalarizer_3xor,
        out_stall_out => ethash_search_B4_branch_vunroll_x_out_stall_out,
        out_state_0_0_cast122 => ethash_search_B4_branch_vunroll_x_out_state_0_0_cast122,
        out_state_4_0_cast125 => ethash_search_B4_branch_vunroll_x_out_state_4_0_cast125,
        out_state_5_0_cast128 => ethash_search_B4_branch_vunroll_x_out_state_5_0_cast128,
        out_state_6_0_cast131 => ethash_search_B4_branch_vunroll_x_out_state_6_0_cast131,
        out_state_7_0_cast134 => ethash_search_B4_branch_vunroll_x_out_state_7_0_cast134,
        out_unnamed_ethash_search32 => ethash_search_B4_branch_vunroll_x_out_unnamed_ethash_search32,
        out_valid_out_0 => ethash_search_B4_branch_vunroll_x_out_valid_out_0,
        out_valid_out_1 => ethash_search_B4_branch_vunroll_x_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_xor_i679_3_0(GPOUT,191)
    out_xor_i679_3_0 <= ethash_search_B4_branch_vunroll_x_out_xor_i679_3_0;

    -- out_xor_i679_3_1(GPOUT,192)
    out_xor_i679_3_1 <= ethash_search_B4_branch_vunroll_x_out_xor_i679_3_1;

    -- out_xor_i679_3_2(GPOUT,193)
    out_xor_i679_3_2 <= ethash_search_B4_branch_vunroll_x_out_xor_i679_3_2;

    -- out_xor_i679_3_3(GPOUT,194)
    out_xor_i679_3_3 <= ethash_search_B4_branch_vunroll_x_out_xor_i679_3_3;

    -- out_a_1907_LC_OuterPHI(GPOUT,195)
    out_a_1907_LC_OuterPHI <= ethash_search_B4_branch_vunroll_x_out_a_1907_LC_OuterPHI;

    -- out_and_RM155(GPOUT,196)
    out_and_RM155 <= ethash_search_B4_branch_vunroll_x_out_and_RM155;

    -- out_arraydecay51_RM166(GPOUT,197)
    out_arraydecay51_RM166 <= ethash_search_B4_branch_vunroll_x_out_arraydecay51_RM166;

    -- out_arrayidx36_2_RM165(GPOUT,198)
    out_arrayidx36_2_RM165 <= ethash_search_B4_branch_vunroll_x_out_arrayidx36_2_RM165;

    -- out_arrayidx45_RM163(GPOUT,199)
    out_arrayidx45_RM163 <= ethash_search_B4_branch_vunroll_x_out_arrayidx45_RM163;

    -- out_c0_exe1105(GPOUT,200)
    out_c0_exe1105 <= ethash_search_B4_branch_vunroll_x_out_c0_exe1105;

    -- out_c0_exe2110(GPOUT,201)
    out_c0_exe2110 <= ethash_search_B4_branch_vunroll_x_out_c0_exe2110;

    -- out_c0_exe3114(GPOUT,202)
    out_c0_exe3114 <= ethash_search_B4_branch_vunroll_x_out_c0_exe3114;

    -- out_c0_exe4118(GPOUT,203)
    out_c0_exe4118 <= ethash_search_B4_branch_vunroll_x_out_c0_exe4118;

    -- out_cmp23157(GPOUT,204)
    out_cmp23157 <= ethash_search_B4_branch_vunroll_x_out_cmp23157;

    -- out_cmp23_xor159(GPOUT,205)
    out_cmp23_xor159 <= ethash_search_B4_branch_vunroll_x_out_cmp23_xor159;

    -- out_fpgaindvars_iv12136(GPOUT,206)
    out_fpgaindvars_iv12136 <= ethash_search_B4_branch_vunroll_x_out_fpgaindvars_iv12136;

    -- out_fpgaindvars_iv6_LC_InnerPHI(GPOUT,207)
    out_fpgaindvars_iv6_LC_InnerPHI <= ethash_search_B4_branch_vunroll_x_out_fpgaindvars_iv6_LC_InnerPHI;

    -- out_fpgaindvars_iv9_LC_OuterPHI(GPOUT,208)
    out_fpgaindvars_iv9_LC_OuterPHI <= ethash_search_B4_branch_vunroll_x_out_fpgaindvars_iv9_LC_OuterPHI;

    -- out_global_id_0194(GPOUT,209)
    out_global_id_0194 <= ethash_search_B4_branch_vunroll_x_out_global_id_0194;

    -- out_i18_0908154(GPOUT,210)
    out_i18_0908154 <= ethash_search_B4_branch_vunroll_x_out_i18_0908154;

    -- out_i66_2906_LC_InnerPHI(GPOUT,211)
    out_i66_2906_LC_InnerPHI <= ethash_search_B4_branch_vunroll_x_out_i66_2906_LC_InnerPHI;

    -- out_idxprom80_RM(GPOUT,212)
    out_idxprom80_RM <= ethash_search_B4_branch_vunroll_x_out_idxprom80_RM;

    -- out_l_grpid_05(GPOUT,213)
    out_l_grpid_05 <= ethash_search_B4_branch_vunroll_x_out_l_grpid_05;

    -- out_l_grpid_0_addr11(GPOUT,214)
    out_l_grpid_0_addr11 <= ethash_search_B4_branch_vunroll_x_out_l_grpid_0_addr11;

    -- out_l_grpid_0_addr_zext161(GPOUT,215)
    out_l_grpid_0_addr_zext161 <= ethash_search_B4_branch_vunroll_x_out_l_grpid_0_addr_zext161;

    -- out_memdep_204_avm_address(GPOUT,216)
    out_memdep_204_avm_address <= bb_ethash_search_B4_stall_region_out_memdep_204_avm_address;

    -- out_memdep_204_avm_burstcount(GPOUT,217)
    out_memdep_204_avm_burstcount <= bb_ethash_search_B4_stall_region_out_memdep_204_avm_burstcount;

    -- out_memdep_204_avm_byteenable(GPOUT,218)
    out_memdep_204_avm_byteenable <= bb_ethash_search_B4_stall_region_out_memdep_204_avm_byteenable;

    -- out_memdep_204_avm_enable(GPOUT,219)
    out_memdep_204_avm_enable <= bb_ethash_search_B4_stall_region_out_memdep_204_avm_enable;

    -- out_memdep_204_avm_read(GPOUT,220)
    out_memdep_204_avm_read <= bb_ethash_search_B4_stall_region_out_memdep_204_avm_read;

    -- out_memdep_204_avm_write(GPOUT,221)
    out_memdep_204_avm_write <= bb_ethash_search_B4_stall_region_out_memdep_204_avm_write;

    -- out_memdep_204_avm_writedata(GPOUT,222)
    out_memdep_204_avm_writedata <= bb_ethash_search_B4_stall_region_out_memdep_204_avm_writedata;

    -- out_scalarizer_0100164(GPOUT,223)
    out_scalarizer_0100164 <= ethash_search_B4_branch_vunroll_x_out_scalarizer_0100164;

    -- out_scalarizer_0100374(GPOUT,224)
    out_scalarizer_0100374 <= ethash_search_B4_branch_vunroll_x_out_scalarizer_0100374;

    -- out_scalarizer_0100584(GPOUT,225)
    out_scalarizer_0100584 <= ethash_search_B4_branch_vunroll_x_out_scalarizer_0100584;

    -- out_scalarizer_0100794(GPOUT,226)
    out_scalarizer_0100794 <= ethash_search_B4_branch_vunroll_x_out_scalarizer_0100794;

    -- out_scalarizer_01173138(GPOUT,227)
    out_scalarizer_01173138 <= ethash_search_B4_branch_vunroll_x_out_scalarizer_01173138;

    -- out_scalarizer_01175142(GPOUT,228)
    out_scalarizer_01175142 <= ethash_search_B4_branch_vunroll_x_out_scalarizer_01175142;

    -- out_scalarizer_01177146(GPOUT,229)
    out_scalarizer_01177146 <= ethash_search_B4_branch_vunroll_x_out_scalarizer_01177146;

    -- out_scalarizer_01179150(GPOUT,230)
    out_scalarizer_01179150 <= ethash_search_B4_branch_vunroll_x_out_scalarizer_01179150;

    -- out_scalarizer_099324(GPOUT,231)
    out_scalarizer_099324 <= ethash_search_B4_branch_vunroll_x_out_scalarizer_099324;

    -- out_scalarizer_099534(GPOUT,232)
    out_scalarizer_099534 <= ethash_search_B4_branch_vunroll_x_out_scalarizer_099534;

    -- out_scalarizer_099744(GPOUT,233)
    out_scalarizer_099744 <= ethash_search_B4_branch_vunroll_x_out_scalarizer_099744;

    -- out_scalarizer_099954(GPOUT,234)
    out_scalarizer_099954 <= ethash_search_B4_branch_vunroll_x_out_scalarizer_099954;

    -- out_scalarizer_0xor1200(GPOUT,235)
    out_scalarizer_0xor1200 <= ethash_search_B4_branch_vunroll_x_out_scalarizer_0xor1200;

    -- out_scalarizer_1100059(GPOUT,236)
    out_scalarizer_1100059 <= ethash_search_B4_branch_vunroll_x_out_scalarizer_1100059;

    -- out_scalarizer_1100269(GPOUT,237)
    out_scalarizer_1100269 <= ethash_search_B4_branch_vunroll_x_out_scalarizer_1100269;

    -- out_scalarizer_1100479(GPOUT,238)
    out_scalarizer_1100479 <= ethash_search_B4_branch_vunroll_x_out_scalarizer_1100479;

    -- out_scalarizer_1100689(GPOUT,239)
    out_scalarizer_1100689 <= ethash_search_B4_branch_vunroll_x_out_scalarizer_1100689;

    -- out_scalarizer_1100899(GPOUT,240)
    out_scalarizer_1100899 <= ethash_search_B4_branch_vunroll_x_out_scalarizer_1100899;

    -- out_scalarizer_11174140(GPOUT,241)
    out_scalarizer_11174140 <= ethash_search_B4_branch_vunroll_x_out_scalarizer_11174140;

    -- out_scalarizer_11176144(GPOUT,242)
    out_scalarizer_11176144 <= ethash_search_B4_branch_vunroll_x_out_scalarizer_11176144;

    -- out_scalarizer_11178148(GPOUT,243)
    out_scalarizer_11178148 <= ethash_search_B4_branch_vunroll_x_out_scalarizer_11178148;

    -- out_scalarizer_11180152(GPOUT,244)
    out_scalarizer_11180152 <= ethash_search_B4_branch_vunroll_x_out_scalarizer_11180152;

    -- out_scalarizer_199429(GPOUT,245)
    out_scalarizer_199429 <= ethash_search_B4_branch_vunroll_x_out_scalarizer_199429;

    -- out_scalarizer_199639(GPOUT,246)
    out_scalarizer_199639 <= ethash_search_B4_branch_vunroll_x_out_scalarizer_199639;

    -- out_scalarizer_199849(GPOUT,247)
    out_scalarizer_199849 <= ethash_search_B4_branch_vunroll_x_out_scalarizer_199849;

    -- out_scalarizer_1xor1201(GPOUT,248)
    out_scalarizer_1xor1201 <= ethash_search_B4_branch_vunroll_x_out_scalarizer_1xor1201;

    -- out_scalarizer_2xor(GPOUT,249)
    out_scalarizer_2xor <= ethash_search_B4_branch_vunroll_x_out_scalarizer_2xor;

    -- out_scalarizer_3xor(GPOUT,250)
    out_scalarizer_3xor <= ethash_search_B4_branch_vunroll_x_out_scalarizer_3xor;

    -- out_stall_out_0(GPOUT,251)
    out_stall_out_0 <= ethash_search_B4_merge_vunroll_x_out_stall_out_0;

    -- out_stall_out_1(GPOUT,252)
    out_stall_out_1 <= ethash_search_B4_merge_vunroll_x_out_stall_out_1;

    -- out_state_0_0_cast122(GPOUT,253)
    out_state_0_0_cast122 <= ethash_search_B4_branch_vunroll_x_out_state_0_0_cast122;

    -- out_state_4_0_cast125(GPOUT,254)
    out_state_4_0_cast125 <= ethash_search_B4_branch_vunroll_x_out_state_4_0_cast125;

    -- out_state_5_0_cast128(GPOUT,255)
    out_state_5_0_cast128 <= ethash_search_B4_branch_vunroll_x_out_state_5_0_cast128;

    -- out_state_6_0_cast131(GPOUT,256)
    out_state_6_0_cast131 <= ethash_search_B4_branch_vunroll_x_out_state_6_0_cast131;

    -- out_state_7_0_cast134(GPOUT,257)
    out_state_7_0_cast134 <= ethash_search_B4_branch_vunroll_x_out_state_7_0_cast134;

    -- out_unnamed_ethash_search32(GPOUT,258)
    out_unnamed_ethash_search32 <= ethash_search_B4_branch_vunroll_x_out_unnamed_ethash_search32;

    -- out_unnamed_ethash_search34_avm_address(GPOUT,259)
    out_unnamed_ethash_search34_avm_address <= bb_ethash_search_B4_stall_region_out_unnamed_ethash_search34_avm_address;

    -- out_unnamed_ethash_search34_avm_burstcount(GPOUT,260)
    out_unnamed_ethash_search34_avm_burstcount <= bb_ethash_search_B4_stall_region_out_unnamed_ethash_search34_avm_burstcount;

    -- out_unnamed_ethash_search34_avm_byteenable(GPOUT,261)
    out_unnamed_ethash_search34_avm_byteenable <= bb_ethash_search_B4_stall_region_out_unnamed_ethash_search34_avm_byteenable;

    -- out_unnamed_ethash_search34_avm_enable(GPOUT,262)
    out_unnamed_ethash_search34_avm_enable <= bb_ethash_search_B4_stall_region_out_unnamed_ethash_search34_avm_enable;

    -- out_unnamed_ethash_search34_avm_read(GPOUT,263)
    out_unnamed_ethash_search34_avm_read <= bb_ethash_search_B4_stall_region_out_unnamed_ethash_search34_avm_read;

    -- out_unnamed_ethash_search34_avm_write(GPOUT,264)
    out_unnamed_ethash_search34_avm_write <= bb_ethash_search_B4_stall_region_out_unnamed_ethash_search34_avm_write;

    -- out_unnamed_ethash_search34_avm_writedata(GPOUT,265)
    out_unnamed_ethash_search34_avm_writedata <= bb_ethash_search_B4_stall_region_out_unnamed_ethash_search34_avm_writedata;

    -- out_unnamed_ethash_search35_avm_address(GPOUT,266)
    out_unnamed_ethash_search35_avm_address <= bb_ethash_search_B4_stall_region_out_unnamed_ethash_search35_avm_address;

    -- out_unnamed_ethash_search35_avm_burstcount(GPOUT,267)
    out_unnamed_ethash_search35_avm_burstcount <= bb_ethash_search_B4_stall_region_out_unnamed_ethash_search35_avm_burstcount;

    -- out_unnamed_ethash_search35_avm_byteenable(GPOUT,268)
    out_unnamed_ethash_search35_avm_byteenable <= bb_ethash_search_B4_stall_region_out_unnamed_ethash_search35_avm_byteenable;

    -- out_unnamed_ethash_search35_avm_enable(GPOUT,269)
    out_unnamed_ethash_search35_avm_enable <= bb_ethash_search_B4_stall_region_out_unnamed_ethash_search35_avm_enable;

    -- out_unnamed_ethash_search35_avm_read(GPOUT,270)
    out_unnamed_ethash_search35_avm_read <= bb_ethash_search_B4_stall_region_out_unnamed_ethash_search35_avm_read;

    -- out_unnamed_ethash_search35_avm_write(GPOUT,271)
    out_unnamed_ethash_search35_avm_write <= bb_ethash_search_B4_stall_region_out_unnamed_ethash_search35_avm_write;

    -- out_unnamed_ethash_search35_avm_writedata(GPOUT,272)
    out_unnamed_ethash_search35_avm_writedata <= bb_ethash_search_B4_stall_region_out_unnamed_ethash_search35_avm_writedata;

    -- out_valid_out_0(GPOUT,273)
    out_valid_out_0 <= ethash_search_B4_branch_vunroll_x_out_valid_out_0;

    -- out_valid_out_1(GPOUT,274)
    out_valid_out_1 <= ethash_search_B4_branch_vunroll_x_out_valid_out_1;

END normal;
