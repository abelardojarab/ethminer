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

-- VHDL created from bb_ethash_search_B4_stall_region
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

entity bb_ethash_search_B4_stall_region is
    port (
        in_a_1907 : in std_logic_vector(31 downto 0);  -- ufix32
        in_and_RM155 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arraydecay51_RM166 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx36_2_RM165 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx45_RM163 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe1105 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2110 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe3114 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe4118 : in std_logic_vector(63 downto 0);  -- ufix64
        in_cmp23157 : in std_logic_vector(0 downto 0);  -- ufix1
        in_cmp23_xor159 : in std_logic_vector(0 downto 0);  -- ufix1
        in_fpgaindvars_iv12136 : in std_logic_vector(3 downto 0);  -- ufix4
        in_fpgaindvars_iv6 : in std_logic_vector(2 downto 0);  -- ufix3
        in_fpgaindvars_iv9 : in std_logic_vector(4 downto 0);  -- ufix5
        in_global_id_0194 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i18_0908154 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i66_2906 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_05 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr11 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr_zext161 : in std_logic_vector(63 downto 0);  -- ufix64
        in_mix_pm_2_in_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mix_pm_2_in_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mix_pm_2_in_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mix_pm_2_in_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100164 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100374 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100584 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100794 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01173138 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01175142 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01177146 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01179150 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099324 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099534 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099744 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099954 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100059 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100269 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100479 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100689 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100899 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11174140 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11176144 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11178148 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11180152 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199429 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199639 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199849 : in std_logic_vector(31 downto 0);  -- ufix32
        in_state_0_0_cast122 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_4_0_cast125 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_5_0_cast128 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_6_0_cast131 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_7_0_cast134 : in std_logic_vector(63 downto 0);  -- ufix64
        in_unnamed_ethash_search32 : in std_logic_vector(31 downto 0);  -- ufix32
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
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
        out_for_end91_LC_COND : out std_logic_vector(0 downto 0);  -- ufix1
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
        out_state_0_0_cast122 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_4_0_cast125 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_5_0_cast128 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_6_0_cast131 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_7_0_cast134 : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_ethash_search32 : out std_logic_vector(31 downto 0);  -- ufix32
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_xor_i679_3_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_xor_i679_3_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_xor_i679_3_2 : out std_logic_vector(31 downto 0);  -- ufix32
        out_xor_i679_3_3 : out std_logic_vector(31 downto 0);  -- ufix32
        in_barrier_unnamed_ethash_search33_wgs_workgroup_size : in std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_ethash_search34_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_ethash_search34_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search34_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search34_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search34_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_unnamed_ethash_search34_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_unnamed_ethash_search34_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        in_g_dag : in std_logic_vector(63 downto 0);  -- ufix64
        in_unnamed_ethash_search34_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_unnamed_ethash_search34_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search34_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search34_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search35_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        out_unnamed_ethash_search35_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search35_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search35_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search35_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_unnamed_ethash_search35_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_ethash_search35_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_unnamed_ethash_search35_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_unnamed_ethash_search35_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search35_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search35_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_204_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memdep_204_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_204_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_204_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_204_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_204_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_204_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_204_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_204_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_memdep_204_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_memdep_204_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_ethash_search_B4_stall_region;

architecture normal of bb_ethash_search_B4_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component ethash_search_B4_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(4 downto 0);  -- Fixed Point
            in_data_in_0_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_1_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_2 : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_data_in_2_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_3_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
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
            in_data_in_23 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_24 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_25 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_26 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_27 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_28 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_29 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_30 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_31 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_32 : in std_logic_vector(3 downto 0);  -- Fixed Point
            in_data_in_33 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_34 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_35 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_36 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_37 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_38 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_39 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_40 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_41 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_42 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_43 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_44 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_45 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_46 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_47 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_48 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_49 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_50 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_data_out_0_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_1_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_2 : out std_logic_vector(2 downto 0);  -- Fixed Point
            out_data_out_2_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_3_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
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
            out_data_out_23 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_24 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_25 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_26 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_27 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_28 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_29 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_30 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_31 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_32 : out std_logic_vector(3 downto 0);  -- Fixed Point
            out_data_out_33 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_34 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_35 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_36 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_37 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_38 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_39 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_40 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_41 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_42 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_43 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_44 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_45 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_46 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_47 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_48 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_49 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_50 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c0_for_body61_ethash_search_c0_enter23_ethash_search is
        port (
            in_c0_eni422_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni422_0_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni422_1_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni422_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni422_2_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni422_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni422_3_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni422_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit29_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit29_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_unnamed_ethash_search35_ethash_search335 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search35_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_unnamed_ethash_search35_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search35_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search35_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_readdata_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_readdata_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_readdata_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search35_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_unnamed_ethash_search35_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_ethash_search35_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_unnamed_ethash_search35_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search35_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search35_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search35_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_unnamed_ethash_search34_ethash_search332 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_bitwiseor : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search34_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_unnamed_ethash_search34_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search34_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search34_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search34_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_ethash_search34_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search34_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_unnamed_ethash_search34_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search34_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search34_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search34_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sbar_unnamed_ethash_search33_ethash_search330 is
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


    component i_store_memdep_204_ethash_search328 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_bitwiseor : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_writedata : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memdep_204_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memdep_204_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_204_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_204_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_204_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_204_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_204_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_memdep_204_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_204_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_204_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_204_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_writeack : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_g_dag_sync_buffer_ethash_search249 is
        port (
            in_buffer_in : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
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































































    component acl_valid_fifo_counter is
        generic (
            DEPTH : INTEGER := 0;
            ASYNC_RESET : INTEGER := 1;
            STRICT_DEPTH : INTEGER := 0;
            ALLOW_FULL_WRITE : INTEGER := 0
        );
        port (
            clock : in std_logic;
            resetn : in std_logic;
            valid_in : in std_logic;
            stall_in : in std_logic;
            valid_out : out std_logic;
            stall_out : out std_logic;
            full : out std_logic
        );
    end component;











    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (4 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (2 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_3_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32 : STD_LOGIC_VECTOR (3 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B4_merge_reg_aunroll_vunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body61_ethash_search_c0_enter23_ethash_search_aunroll_vunroll_x_out_c0_exit29_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_body61_ethash_search_c0_enter23_ethash_search_aunroll_vunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body61_ethash_search_c0_enter23_ethash_search_aunroll_vunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bgTrunc_i_add90_ethash_search_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_fpgaindvars_iv9_lc_outerphi_ethash_search_sel_x_b : STD_LOGIC_VECTOR (4 downto 0);
    signal bgTrunc_i_fpgaindvars_iv_next7_ethash_search_sel_x_b : STD_LOGIC_VECTOR (2 downto 0);
    signal bgTrunc_i_inc87_ethash_search_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_1_c_i32_0gr_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_multconst_x_q : STD_LOGIC_VECTOR (58 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_dupName_1_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_dupName_2_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_dupName_0_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_dupName_0_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_dupName_0_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_dupName_0_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_mult_multconst_x_q : STD_LOGIC_VECTOR (55 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_idxprom80_rm_ethash_search_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_idxprom81_ethash_search_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_o_readdata_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_o_readdata_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_o_readdata_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_o_readdata_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_unnamed_ethash_search35_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_unnamed_ethash_search35_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_unnamed_ethash_search35_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_unnamed_ethash_search35_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_unnamed_ethash_search35_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_unnamed_ethash_search35_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_unnamed_ethash_search35_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal i_scalarizer_0mul_ethash_search_extender_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_scalarizer_0mul_ethash_search_multconst_x_q : STD_LOGIC_VECTOR (6 downto 0);
    signal i_scalarizer_1mul_ethash_search_extender_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_scalarizer_2mul_ethash_search_extender_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_scalarizer_3mul_ethash_search_extender_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_unnamed_ethash_search325_sel_x_b : STD_LOGIC_VECTOR (4 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_4gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_7gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i3_1gr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal c_i3_2gr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal c_i5_1gr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal i_a_1907_lc_outerphi_ethash_search_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_a_1907_lc_outerphi_ethash_search_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add90_ethash_search_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add90_ethash_search_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add90_ethash_search_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add90_ethash_search_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_cmp64_xor_ethash_search_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond11_ethash_search_a : STD_LOGIC_VECTOR (6 downto 0);
    signal i_exitcond11_ethash_search_b : STD_LOGIC_VECTOR (6 downto 0);
    signal i_exitcond11_ethash_search_o : STD_LOGIC_VECTOR (6 downto 0);
    signal i_exitcond11_ethash_search_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond8_neg_ethash_search_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_for_end91_lc_cond_ethash_search_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_fpgaindvars_iv6_lc_innerphi_ethash_search_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_fpgaindvars_iv6_lc_innerphi_ethash_search_q : STD_LOGIC_VECTOR (2 downto 0);
    signal i_fpgaindvars_iv9_lc_outerphi_ethash_search_a : STD_LOGIC_VECTOR (5 downto 0);
    signal i_fpgaindvars_iv9_lc_outerphi_ethash_search_b : STD_LOGIC_VECTOR (5 downto 0);
    signal i_fpgaindvars_iv9_lc_outerphi_ethash_search_o : STD_LOGIC_VECTOR (5 downto 0);
    signal i_fpgaindvars_iv9_lc_outerphi_ethash_search_q : STD_LOGIC_VECTOR (5 downto 0);
    signal i_fpgaindvars_iv_next7_ethash_search_a : STD_LOGIC_VECTOR (3 downto 0);
    signal i_fpgaindvars_iv_next7_ethash_search_b : STD_LOGIC_VECTOR (3 downto 0);
    signal i_fpgaindvars_iv_next7_ethash_search_o : STD_LOGIC_VECTOR (3 downto 0);
    signal i_fpgaindvars_iv_next7_ethash_search_q : STD_LOGIC_VECTOR (3 downto 0);
    signal i_i66_2906_lc_innerphi_ethash_search_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_i66_2906_lc_innerphi_ethash_search_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_idxprom80_rm_ethash_search_vt_const_63_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_idxprom80_rm_ethash_search_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_idxprom80_rm_ethash_search_vt_select_2_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_idxprom81_ethash_search_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_idxprom81_ethash_search_vt_select_31_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_inc87_ethash_search_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc87_ethash_search_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc87_ethash_search_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc87_ethash_search_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_load_unnamed_ethash_search34_ethash_search_out_o_readdata : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_ethash_search34_ethash_search_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_ethash_search34_ethash_search_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_ethash_search34_ethash_search_out_unnamed_ethash_search34_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_ethash_search34_ethash_search_out_unnamed_ethash_search34_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_ethash_search34_ethash_search_out_unnamed_ethash_search34_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_unnamed_ethash_search34_ethash_search_out_unnamed_ethash_search34_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_ethash_search34_ethash_search_out_unnamed_ethash_search34_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_ethash_search34_ethash_search_out_unnamed_ethash_search34_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_ethash_search34_ethash_search_out_unnamed_ethash_search34_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal i_sbar_unnamed_ethash_search33_ethash_search_out_data_exit : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sbar_unnamed_ethash_search33_ethash_search_out_stall_entry : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sbar_unnamed_ethash_search33_ethash_search_out_valid_exit : STD_LOGIC_VECTOR (0 downto 0);
    signal i_scalarizer_0xor1200_ethash_search_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_scalarizer_1xor1201_ethash_search_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_scalarizer_2xor_ethash_search_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_scalarizer_3xor_ethash_search_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_shr62_ethash_search_vt_const_31_q : STD_LOGIC_VECTOR (1 downto 0);
    signal i_shr62_ethash_search_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_shr62_ethash_search_vt_select_29_b : STD_LOGIC_VECTOR (29 downto 0);
    signal i_store_memdep_204_ethash_search_out_memdep_204_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_store_memdep_204_ethash_search_out_memdep_204_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_204_ethash_search_out_memdep_204_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal i_store_memdep_204_ethash_search_out_memdep_204_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_204_ethash_search_out_memdep_204_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_204_ethash_search_out_memdep_204_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_204_ethash_search_out_memdep_204_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal i_store_memdep_204_ethash_search_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_204_ethash_search_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_204_ethash_search_out_o_writeack : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_g_dag_sync_buffer_ethash_search_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_g_dag_sync_buffer_ethash_search_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_g_dag_sync_buffer_ethash_search_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_ethash_search324_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_ethash_search326_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_ethash_search326_vt_const_31_q : STD_LOGIC_VECTOR (28 downto 0);
    signal i_unnamed_ethash_search326_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_ethash_search326_vt_select_2_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_join_13_q : STD_LOGIC_VECTOR (58 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_align_14_q : STD_LOGIC_VECTOR (40 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_align_14_qint : STD_LOGIC_VECTOR (40 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_join_16_q : STD_LOGIC_VECTOR (68 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (69 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (69 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (69 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (69 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_mult_x_join_13_q : STD_LOGIC_VECTOR (61 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_mult_x_align_14_q : STD_LOGIC_VECTOR (43 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_mult_x_align_14_qint : STD_LOGIC_VECTOR (43 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_mult_x_join_16_q : STD_LOGIC_VECTOR (71 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (72 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (72 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (72 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (72 downto 0);
    signal xMSB_uid196_i_fpgaindvars_iv6_lobit_ethash_search_ethash_search254_shift_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal seMsb_to2_uid198_in : STD_LOGIC_VECTOR (1 downto 0);
    signal seMsb_to2_uid198_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0Idx1Rng2_uid199_i_fpgaindvars_iv6_lobit_ethash_search_ethash_search254_shift_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx1_uid200_i_fpgaindvars_iv6_lobit_ethash_search_ethash_search254_shift_x_q : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage0_uid202_i_fpgaindvars_iv6_lobit_ethash_search_ethash_search254_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid202_i_fpgaindvars_iv6_lobit_ethash_search_ethash_search254_shift_x_q : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage0Idx1Rng2_uid207_i_shr62_ethash_search_ethash_search252_shift_x_b : STD_LOGIC_VECTOR (29 downto 0);
    signal rightShiftStage0Idx1_uid209_i_shr62_ethash_search_ethash_search252_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_scalarizer_0mul_ethash_search_bs1_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_scalarizer_0mul_ethash_search_bs1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_scalarizer_0mul_ethash_search_bs4_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_scalarizer_0mul_ethash_search_bs7_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_scalarizer_0mul_ethash_search_bs7_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_scalarizer_0mul_ethash_search_bjA8_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_scalarizer_0mul_ethash_search_bs11_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_scalarizer_0mul_ethash_search_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_scalarizer_0mul_ethash_search_align_14_q : STD_LOGIC_VECTOR (51 downto 0);
    signal i_scalarizer_0mul_ethash_search_align_14_qint : STD_LOGIC_VECTOR (51 downto 0);
    signal i_scalarizer_0mul_ethash_search_result_add_0_0_a : STD_LOGIC_VECTOR (59 downto 0);
    signal i_scalarizer_0mul_ethash_search_result_add_0_0_b : STD_LOGIC_VECTOR (59 downto 0);
    signal i_scalarizer_0mul_ethash_search_result_add_0_0_o : STD_LOGIC_VECTOR (59 downto 0);
    signal i_scalarizer_0mul_ethash_search_result_add_0_0_q : STD_LOGIC_VECTOR (58 downto 0);
    signal i_scalarizer_1mul_ethash_search_bs1_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_scalarizer_1mul_ethash_search_bs1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_scalarizer_1mul_ethash_search_bs4_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_scalarizer_1mul_ethash_search_bs7_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_scalarizer_1mul_ethash_search_bs7_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_scalarizer_1mul_ethash_search_bjA8_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_scalarizer_1mul_ethash_search_bs11_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_scalarizer_1mul_ethash_search_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_scalarizer_1mul_ethash_search_align_14_q : STD_LOGIC_VECTOR (51 downto 0);
    signal i_scalarizer_1mul_ethash_search_align_14_qint : STD_LOGIC_VECTOR (51 downto 0);
    signal i_scalarizer_1mul_ethash_search_result_add_0_0_a : STD_LOGIC_VECTOR (59 downto 0);
    signal i_scalarizer_1mul_ethash_search_result_add_0_0_b : STD_LOGIC_VECTOR (59 downto 0);
    signal i_scalarizer_1mul_ethash_search_result_add_0_0_o : STD_LOGIC_VECTOR (59 downto 0);
    signal i_scalarizer_1mul_ethash_search_result_add_0_0_q : STD_LOGIC_VECTOR (58 downto 0);
    signal i_scalarizer_2mul_ethash_search_bs1_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_scalarizer_2mul_ethash_search_bs1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_scalarizer_2mul_ethash_search_bs4_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_scalarizer_2mul_ethash_search_bs7_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_scalarizer_2mul_ethash_search_bs7_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_scalarizer_2mul_ethash_search_bjA8_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_scalarizer_2mul_ethash_search_bs11_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_scalarizer_2mul_ethash_search_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_scalarizer_2mul_ethash_search_align_14_q : STD_LOGIC_VECTOR (51 downto 0);
    signal i_scalarizer_2mul_ethash_search_align_14_qint : STD_LOGIC_VECTOR (51 downto 0);
    signal i_scalarizer_2mul_ethash_search_result_add_0_0_a : STD_LOGIC_VECTOR (59 downto 0);
    signal i_scalarizer_2mul_ethash_search_result_add_0_0_b : STD_LOGIC_VECTOR (59 downto 0);
    signal i_scalarizer_2mul_ethash_search_result_add_0_0_o : STD_LOGIC_VECTOR (59 downto 0);
    signal i_scalarizer_2mul_ethash_search_result_add_0_0_q : STD_LOGIC_VECTOR (58 downto 0);
    signal i_scalarizer_3mul_ethash_search_bs1_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_scalarizer_3mul_ethash_search_bs1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_scalarizer_3mul_ethash_search_bs4_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_scalarizer_3mul_ethash_search_bs7_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_scalarizer_3mul_ethash_search_bs7_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_scalarizer_3mul_ethash_search_bjA8_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_scalarizer_3mul_ethash_search_bs11_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_scalarizer_3mul_ethash_search_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_scalarizer_3mul_ethash_search_align_14_q : STD_LOGIC_VECTOR (51 downto 0);
    signal i_scalarizer_3mul_ethash_search_align_14_qint : STD_LOGIC_VECTOR (51 downto 0);
    signal i_scalarizer_3mul_ethash_search_result_add_0_0_a : STD_LOGIC_VECTOR (59 downto 0);
    signal i_scalarizer_3mul_ethash_search_result_add_0_0_b : STD_LOGIC_VECTOR (59 downto 0);
    signal i_scalarizer_3mul_ethash_search_result_add_0_0_o : STD_LOGIC_VECTOR (59 downto 0);
    signal i_scalarizer_3mul_ethash_search_result_add_0_0_q : STD_LOGIC_VECTOR (58 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (13 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (24 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (24 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (16 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (16 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (24 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (24 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (24 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (24 downto 0);
    signal i_scalarizer_0mul_ethash_search_im10_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_scalarizer_0mul_ethash_search_im10_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_scalarizer_1mul_ethash_search_im10_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_scalarizer_1mul_ethash_search_im10_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_scalarizer_2mul_ethash_search_im10_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_scalarizer_2mul_ethash_search_im10_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_scalarizer_3mul_ethash_search_im10_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_scalarizer_3mul_ethash_search_im10_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_exitcond8_ethash_search_cmp_sign_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_scalarizer_0mul_ethash_search_im0_cma_reset : std_logic;
    type i_scalarizer_0mul_ethash_search_im0_cma_a0type is array(NATURAL range <>) of UNSIGNED(17 downto 0);
    signal i_scalarizer_0mul_ethash_search_im0_cma_a0 : i_scalarizer_0mul_ethash_search_im0_cma_a0type(0 to 0);
    attribute preserve : boolean;
    attribute preserve of i_scalarizer_0mul_ethash_search_im0_cma_a0 : signal is true;
    attribute altera_attribute of i_scalarizer_0mul_ethash_search_im0_cma_a0 : signal is "-name allow_synch_ctrl_usage off";
    signal i_scalarizer_0mul_ethash_search_im0_cma_a1 : i_scalarizer_0mul_ethash_search_im0_cma_a0type(0 to 0);
    attribute preserve of i_scalarizer_0mul_ethash_search_im0_cma_a1 : signal is true;
    attribute altera_attribute of i_scalarizer_0mul_ethash_search_im0_cma_a1 : signal is "-name allow_synch_ctrl_usage off";
    type i_scalarizer_0mul_ethash_search_im0_cma_c0type is array(NATURAL range <>) of UNSIGNED(2 downto 0);
    signal i_scalarizer_0mul_ethash_search_im0_cma_c0 : i_scalarizer_0mul_ethash_search_im0_cma_c0type(0 to 0);
    attribute preserve of i_scalarizer_0mul_ethash_search_im0_cma_c0 : signal is true;
    attribute altera_attribute of i_scalarizer_0mul_ethash_search_im0_cma_c0 : signal is "-name allow_synch_ctrl_usage off";
    signal i_scalarizer_0mul_ethash_search_im0_cma_c1 : i_scalarizer_0mul_ethash_search_im0_cma_c0type(0 to 0);
    attribute preserve of i_scalarizer_0mul_ethash_search_im0_cma_c1 : signal is true;
    attribute altera_attribute of i_scalarizer_0mul_ethash_search_im0_cma_c1 : signal is "-name allow_synch_ctrl_usage off";
    signal i_scalarizer_0mul_ethash_search_im0_cma_r : i_scalarizer_0mul_ethash_search_im0_cma_a0type(0 to 0);
    type i_scalarizer_0mul_ethash_search_im0_cma_ptype is array(NATURAL range <>) of UNSIGNED(35 downto 0);
    signal i_scalarizer_0mul_ethash_search_im0_cma_p : i_scalarizer_0mul_ethash_search_im0_cma_ptype(0 to 0);
    signal i_scalarizer_0mul_ethash_search_im0_cma_u : i_scalarizer_0mul_ethash_search_im0_cma_ptype(0 to 0);
    signal i_scalarizer_0mul_ethash_search_im0_cma_w : i_scalarizer_0mul_ethash_search_im0_cma_ptype(0 to 0);
    signal i_scalarizer_0mul_ethash_search_im0_cma_x : i_scalarizer_0mul_ethash_search_im0_cma_ptype(0 to 0);
    signal i_scalarizer_0mul_ethash_search_im0_cma_y : i_scalarizer_0mul_ethash_search_im0_cma_ptype(0 to 0);
    signal i_scalarizer_0mul_ethash_search_im0_cma_k0 : i_scalarizer_0mul_ethash_search_im0_cma_a0type(0 to 7) := (
        0 => TO_UNSIGNED(403,18),
        others => (others => '0'));
    signal i_scalarizer_0mul_ethash_search_im0_cma_s : i_scalarizer_0mul_ethash_search_im0_cma_ptype(0 to 0);
    signal i_scalarizer_0mul_ethash_search_im0_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal i_scalarizer_0mul_ethash_search_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_scalarizer_0mul_ethash_search_im0_cma_ena0 : std_logic;
    signal i_scalarizer_0mul_ethash_search_im0_cma_ena1 : std_logic;
    signal i_scalarizer_0mul_ethash_search_im0_cma_ena2 : std_logic;
    signal i_scalarizer_1mul_ethash_search_im0_cma_reset : std_logic;
    signal i_scalarizer_1mul_ethash_search_im0_cma_a0 : i_scalarizer_0mul_ethash_search_im0_cma_a0type(0 to 0);
    attribute preserve of i_scalarizer_1mul_ethash_search_im0_cma_a0 : signal is true;
    attribute altera_attribute of i_scalarizer_1mul_ethash_search_im0_cma_a0 : signal is "-name allow_synch_ctrl_usage off";
    signal i_scalarizer_1mul_ethash_search_im0_cma_a1 : i_scalarizer_0mul_ethash_search_im0_cma_a0type(0 to 0);
    attribute preserve of i_scalarizer_1mul_ethash_search_im0_cma_a1 : signal is true;
    attribute altera_attribute of i_scalarizer_1mul_ethash_search_im0_cma_a1 : signal is "-name allow_synch_ctrl_usage off";
    signal i_scalarizer_1mul_ethash_search_im0_cma_c0 : i_scalarizer_0mul_ethash_search_im0_cma_c0type(0 to 0);
    attribute preserve of i_scalarizer_1mul_ethash_search_im0_cma_c0 : signal is true;
    attribute altera_attribute of i_scalarizer_1mul_ethash_search_im0_cma_c0 : signal is "-name allow_synch_ctrl_usage off";
    signal i_scalarizer_1mul_ethash_search_im0_cma_c1 : i_scalarizer_0mul_ethash_search_im0_cma_c0type(0 to 0);
    attribute preserve of i_scalarizer_1mul_ethash_search_im0_cma_c1 : signal is true;
    attribute altera_attribute of i_scalarizer_1mul_ethash_search_im0_cma_c1 : signal is "-name allow_synch_ctrl_usage off";
    signal i_scalarizer_1mul_ethash_search_im0_cma_r : i_scalarizer_0mul_ethash_search_im0_cma_a0type(0 to 0);
    signal i_scalarizer_1mul_ethash_search_im0_cma_p : i_scalarizer_0mul_ethash_search_im0_cma_ptype(0 to 0);
    signal i_scalarizer_1mul_ethash_search_im0_cma_u : i_scalarizer_0mul_ethash_search_im0_cma_ptype(0 to 0);
    signal i_scalarizer_1mul_ethash_search_im0_cma_w : i_scalarizer_0mul_ethash_search_im0_cma_ptype(0 to 0);
    signal i_scalarizer_1mul_ethash_search_im0_cma_x : i_scalarizer_0mul_ethash_search_im0_cma_ptype(0 to 0);
    signal i_scalarizer_1mul_ethash_search_im0_cma_y : i_scalarizer_0mul_ethash_search_im0_cma_ptype(0 to 0);
    signal i_scalarizer_1mul_ethash_search_im0_cma_k0 : i_scalarizer_0mul_ethash_search_im0_cma_a0type(0 to 7) := (
        0 => TO_UNSIGNED(403,18),
        others => (others => '0'));
    signal i_scalarizer_1mul_ethash_search_im0_cma_s : i_scalarizer_0mul_ethash_search_im0_cma_ptype(0 to 0);
    signal i_scalarizer_1mul_ethash_search_im0_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal i_scalarizer_1mul_ethash_search_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_scalarizer_1mul_ethash_search_im0_cma_ena0 : std_logic;
    signal i_scalarizer_1mul_ethash_search_im0_cma_ena1 : std_logic;
    signal i_scalarizer_1mul_ethash_search_im0_cma_ena2 : std_logic;
    signal i_scalarizer_2mul_ethash_search_im0_cma_reset : std_logic;
    signal i_scalarizer_2mul_ethash_search_im0_cma_a0 : i_scalarizer_0mul_ethash_search_im0_cma_a0type(0 to 0);
    attribute preserve of i_scalarizer_2mul_ethash_search_im0_cma_a0 : signal is true;
    attribute altera_attribute of i_scalarizer_2mul_ethash_search_im0_cma_a0 : signal is "-name allow_synch_ctrl_usage off";
    signal i_scalarizer_2mul_ethash_search_im0_cma_a1 : i_scalarizer_0mul_ethash_search_im0_cma_a0type(0 to 0);
    attribute preserve of i_scalarizer_2mul_ethash_search_im0_cma_a1 : signal is true;
    attribute altera_attribute of i_scalarizer_2mul_ethash_search_im0_cma_a1 : signal is "-name allow_synch_ctrl_usage off";
    signal i_scalarizer_2mul_ethash_search_im0_cma_c0 : i_scalarizer_0mul_ethash_search_im0_cma_c0type(0 to 0);
    attribute preserve of i_scalarizer_2mul_ethash_search_im0_cma_c0 : signal is true;
    attribute altera_attribute of i_scalarizer_2mul_ethash_search_im0_cma_c0 : signal is "-name allow_synch_ctrl_usage off";
    signal i_scalarizer_2mul_ethash_search_im0_cma_c1 : i_scalarizer_0mul_ethash_search_im0_cma_c0type(0 to 0);
    attribute preserve of i_scalarizer_2mul_ethash_search_im0_cma_c1 : signal is true;
    attribute altera_attribute of i_scalarizer_2mul_ethash_search_im0_cma_c1 : signal is "-name allow_synch_ctrl_usage off";
    signal i_scalarizer_2mul_ethash_search_im0_cma_r : i_scalarizer_0mul_ethash_search_im0_cma_a0type(0 to 0);
    signal i_scalarizer_2mul_ethash_search_im0_cma_p : i_scalarizer_0mul_ethash_search_im0_cma_ptype(0 to 0);
    signal i_scalarizer_2mul_ethash_search_im0_cma_u : i_scalarizer_0mul_ethash_search_im0_cma_ptype(0 to 0);
    signal i_scalarizer_2mul_ethash_search_im0_cma_w : i_scalarizer_0mul_ethash_search_im0_cma_ptype(0 to 0);
    signal i_scalarizer_2mul_ethash_search_im0_cma_x : i_scalarizer_0mul_ethash_search_im0_cma_ptype(0 to 0);
    signal i_scalarizer_2mul_ethash_search_im0_cma_y : i_scalarizer_0mul_ethash_search_im0_cma_ptype(0 to 0);
    signal i_scalarizer_2mul_ethash_search_im0_cma_k0 : i_scalarizer_0mul_ethash_search_im0_cma_a0type(0 to 7) := (
        0 => TO_UNSIGNED(403,18),
        others => (others => '0'));
    signal i_scalarizer_2mul_ethash_search_im0_cma_s : i_scalarizer_0mul_ethash_search_im0_cma_ptype(0 to 0);
    signal i_scalarizer_2mul_ethash_search_im0_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal i_scalarizer_2mul_ethash_search_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_scalarizer_2mul_ethash_search_im0_cma_ena0 : std_logic;
    signal i_scalarizer_2mul_ethash_search_im0_cma_ena1 : std_logic;
    signal i_scalarizer_2mul_ethash_search_im0_cma_ena2 : std_logic;
    signal i_scalarizer_3mul_ethash_search_im0_cma_reset : std_logic;
    signal i_scalarizer_3mul_ethash_search_im0_cma_a0 : i_scalarizer_0mul_ethash_search_im0_cma_a0type(0 to 0);
    attribute preserve of i_scalarizer_3mul_ethash_search_im0_cma_a0 : signal is true;
    attribute altera_attribute of i_scalarizer_3mul_ethash_search_im0_cma_a0 : signal is "-name allow_synch_ctrl_usage off";
    signal i_scalarizer_3mul_ethash_search_im0_cma_a1 : i_scalarizer_0mul_ethash_search_im0_cma_a0type(0 to 0);
    attribute preserve of i_scalarizer_3mul_ethash_search_im0_cma_a1 : signal is true;
    attribute altera_attribute of i_scalarizer_3mul_ethash_search_im0_cma_a1 : signal is "-name allow_synch_ctrl_usage off";
    signal i_scalarizer_3mul_ethash_search_im0_cma_c0 : i_scalarizer_0mul_ethash_search_im0_cma_c0type(0 to 0);
    attribute preserve of i_scalarizer_3mul_ethash_search_im0_cma_c0 : signal is true;
    attribute altera_attribute of i_scalarizer_3mul_ethash_search_im0_cma_c0 : signal is "-name allow_synch_ctrl_usage off";
    signal i_scalarizer_3mul_ethash_search_im0_cma_c1 : i_scalarizer_0mul_ethash_search_im0_cma_c0type(0 to 0);
    attribute preserve of i_scalarizer_3mul_ethash_search_im0_cma_c1 : signal is true;
    attribute altera_attribute of i_scalarizer_3mul_ethash_search_im0_cma_c1 : signal is "-name allow_synch_ctrl_usage off";
    signal i_scalarizer_3mul_ethash_search_im0_cma_r : i_scalarizer_0mul_ethash_search_im0_cma_a0type(0 to 0);
    signal i_scalarizer_3mul_ethash_search_im0_cma_p : i_scalarizer_0mul_ethash_search_im0_cma_ptype(0 to 0);
    signal i_scalarizer_3mul_ethash_search_im0_cma_u : i_scalarizer_0mul_ethash_search_im0_cma_ptype(0 to 0);
    signal i_scalarizer_3mul_ethash_search_im0_cma_w : i_scalarizer_0mul_ethash_search_im0_cma_ptype(0 to 0);
    signal i_scalarizer_3mul_ethash_search_im0_cma_x : i_scalarizer_0mul_ethash_search_im0_cma_ptype(0 to 0);
    signal i_scalarizer_3mul_ethash_search_im0_cma_y : i_scalarizer_0mul_ethash_search_im0_cma_ptype(0 to 0);
    signal i_scalarizer_3mul_ethash_search_im0_cma_k0 : i_scalarizer_0mul_ethash_search_im0_cma_a0type(0 to 7) := (
        0 => TO_UNSIGNED(403,18),
        others => (others => '0'));
    signal i_scalarizer_3mul_ethash_search_im0_cma_s : i_scalarizer_0mul_ethash_search_im0_cma_ptype(0 to 0);
    signal i_scalarizer_3mul_ethash_search_im0_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal i_scalarizer_3mul_ethash_search_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_scalarizer_3mul_ethash_search_im0_cma_ena0 : std_logic;
    signal i_scalarizer_3mul_ethash_search_im0_cma_ena1 : std_logic;
    signal i_scalarizer_3mul_ethash_search_im0_cma_ena2 : std_logic;
    signal i_scalarizer_0mul_ethash_search_ma3_cma_reset : std_logic;
    type i_scalarizer_0mul_ethash_search_ma3_cma_a0type is array(NATURAL range <>) of SIGNED(18 downto 0);
    signal i_scalarizer_0mul_ethash_search_ma3_cma_a0 : i_scalarizer_0mul_ethash_search_ma3_cma_a0type(0 to 1);
    attribute preserve of i_scalarizer_0mul_ethash_search_ma3_cma_a0 : signal is true;
    attribute altera_attribute of i_scalarizer_0mul_ethash_search_ma3_cma_a0 : signal is "-name allow_synch_ctrl_usage off";
    signal i_scalarizer_0mul_ethash_search_ma3_cma_a1 : i_scalarizer_0mul_ethash_search_ma3_cma_a0type(0 to 1);
    attribute preserve of i_scalarizer_0mul_ethash_search_ma3_cma_a1 : signal is true;
    attribute altera_attribute of i_scalarizer_0mul_ethash_search_ma3_cma_a1 : signal is "-name allow_synch_ctrl_usage off";
    type i_scalarizer_0mul_ethash_search_ma3_cma_c0type is array(NATURAL range <>) of UNSIGNED(13 downto 0);
    signal i_scalarizer_0mul_ethash_search_ma3_cma_c0 : i_scalarizer_0mul_ethash_search_ma3_cma_c0type(0 to 1);
    attribute preserve of i_scalarizer_0mul_ethash_search_ma3_cma_c0 : signal is true;
    attribute altera_attribute of i_scalarizer_0mul_ethash_search_ma3_cma_c0 : signal is "-name allow_synch_ctrl_usage off";
    signal i_scalarizer_0mul_ethash_search_ma3_cma_c1 : i_scalarizer_0mul_ethash_search_ma3_cma_c0type(0 to 1);
    attribute preserve of i_scalarizer_0mul_ethash_search_ma3_cma_c1 : signal is true;
    attribute altera_attribute of i_scalarizer_0mul_ethash_search_ma3_cma_c1 : signal is "-name allow_synch_ctrl_usage off";
    type i_scalarizer_0mul_ethash_search_ma3_cma_rtype is array(NATURAL range <>) of SIGNED(14 downto 0);
    signal i_scalarizer_0mul_ethash_search_ma3_cma_r : i_scalarizer_0mul_ethash_search_ma3_cma_rtype(0 to 1);
    type i_scalarizer_0mul_ethash_search_ma3_cma_ptype is array(NATURAL range <>) of SIGNED(33 downto 0);
    signal i_scalarizer_0mul_ethash_search_ma3_cma_p : i_scalarizer_0mul_ethash_search_ma3_cma_ptype(0 to 1);
    type i_scalarizer_0mul_ethash_search_ma3_cma_utype is array(NATURAL range <>) of SIGNED(34 downto 0);
    signal i_scalarizer_0mul_ethash_search_ma3_cma_u : i_scalarizer_0mul_ethash_search_ma3_cma_utype(0 to 1);
    signal i_scalarizer_0mul_ethash_search_ma3_cma_w : i_scalarizer_0mul_ethash_search_ma3_cma_utype(0 to 0);
    signal i_scalarizer_0mul_ethash_search_ma3_cma_x : i_scalarizer_0mul_ethash_search_ma3_cma_utype(0 to 0);
    signal i_scalarizer_0mul_ethash_search_ma3_cma_y : i_scalarizer_0mul_ethash_search_ma3_cma_utype(0 to 0);
    signal i_scalarizer_0mul_ethash_search_ma3_cma_s : i_scalarizer_0mul_ethash_search_ma3_cma_utype(0 to 0);
    signal i_scalarizer_0mul_ethash_search_ma3_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal i_scalarizer_0mul_ethash_search_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_scalarizer_0mul_ethash_search_ma3_cma_ena0 : std_logic;
    signal i_scalarizer_0mul_ethash_search_ma3_cma_ena1 : std_logic;
    signal i_scalarizer_0mul_ethash_search_ma3_cma_ena2 : std_logic;
    signal i_scalarizer_1mul_ethash_search_ma3_cma_reset : std_logic;
    signal i_scalarizer_1mul_ethash_search_ma3_cma_a0 : i_scalarizer_0mul_ethash_search_ma3_cma_a0type(0 to 1);
    attribute preserve of i_scalarizer_1mul_ethash_search_ma3_cma_a0 : signal is true;
    attribute altera_attribute of i_scalarizer_1mul_ethash_search_ma3_cma_a0 : signal is "-name allow_synch_ctrl_usage off";
    signal i_scalarizer_1mul_ethash_search_ma3_cma_a1 : i_scalarizer_0mul_ethash_search_ma3_cma_a0type(0 to 1);
    attribute preserve of i_scalarizer_1mul_ethash_search_ma3_cma_a1 : signal is true;
    attribute altera_attribute of i_scalarizer_1mul_ethash_search_ma3_cma_a1 : signal is "-name allow_synch_ctrl_usage off";
    signal i_scalarizer_1mul_ethash_search_ma3_cma_c0 : i_scalarizer_0mul_ethash_search_ma3_cma_c0type(0 to 1);
    attribute preserve of i_scalarizer_1mul_ethash_search_ma3_cma_c0 : signal is true;
    attribute altera_attribute of i_scalarizer_1mul_ethash_search_ma3_cma_c0 : signal is "-name allow_synch_ctrl_usage off";
    signal i_scalarizer_1mul_ethash_search_ma3_cma_c1 : i_scalarizer_0mul_ethash_search_ma3_cma_c0type(0 to 1);
    attribute preserve of i_scalarizer_1mul_ethash_search_ma3_cma_c1 : signal is true;
    attribute altera_attribute of i_scalarizer_1mul_ethash_search_ma3_cma_c1 : signal is "-name allow_synch_ctrl_usage off";
    signal i_scalarizer_1mul_ethash_search_ma3_cma_r : i_scalarizer_0mul_ethash_search_ma3_cma_rtype(0 to 1);
    signal i_scalarizer_1mul_ethash_search_ma3_cma_p : i_scalarizer_0mul_ethash_search_ma3_cma_ptype(0 to 1);
    signal i_scalarizer_1mul_ethash_search_ma3_cma_u : i_scalarizer_0mul_ethash_search_ma3_cma_utype(0 to 1);
    signal i_scalarizer_1mul_ethash_search_ma3_cma_w : i_scalarizer_0mul_ethash_search_ma3_cma_utype(0 to 0);
    signal i_scalarizer_1mul_ethash_search_ma3_cma_x : i_scalarizer_0mul_ethash_search_ma3_cma_utype(0 to 0);
    signal i_scalarizer_1mul_ethash_search_ma3_cma_y : i_scalarizer_0mul_ethash_search_ma3_cma_utype(0 to 0);
    signal i_scalarizer_1mul_ethash_search_ma3_cma_s : i_scalarizer_0mul_ethash_search_ma3_cma_utype(0 to 0);
    signal i_scalarizer_1mul_ethash_search_ma3_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal i_scalarizer_1mul_ethash_search_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_scalarizer_1mul_ethash_search_ma3_cma_ena0 : std_logic;
    signal i_scalarizer_1mul_ethash_search_ma3_cma_ena1 : std_logic;
    signal i_scalarizer_1mul_ethash_search_ma3_cma_ena2 : std_logic;
    signal i_scalarizer_2mul_ethash_search_ma3_cma_reset : std_logic;
    signal i_scalarizer_2mul_ethash_search_ma3_cma_a0 : i_scalarizer_0mul_ethash_search_ma3_cma_a0type(0 to 1);
    attribute preserve of i_scalarizer_2mul_ethash_search_ma3_cma_a0 : signal is true;
    attribute altera_attribute of i_scalarizer_2mul_ethash_search_ma3_cma_a0 : signal is "-name allow_synch_ctrl_usage off";
    signal i_scalarizer_2mul_ethash_search_ma3_cma_a1 : i_scalarizer_0mul_ethash_search_ma3_cma_a0type(0 to 1);
    attribute preserve of i_scalarizer_2mul_ethash_search_ma3_cma_a1 : signal is true;
    attribute altera_attribute of i_scalarizer_2mul_ethash_search_ma3_cma_a1 : signal is "-name allow_synch_ctrl_usage off";
    signal i_scalarizer_2mul_ethash_search_ma3_cma_c0 : i_scalarizer_0mul_ethash_search_ma3_cma_c0type(0 to 1);
    attribute preserve of i_scalarizer_2mul_ethash_search_ma3_cma_c0 : signal is true;
    attribute altera_attribute of i_scalarizer_2mul_ethash_search_ma3_cma_c0 : signal is "-name allow_synch_ctrl_usage off";
    signal i_scalarizer_2mul_ethash_search_ma3_cma_c1 : i_scalarizer_0mul_ethash_search_ma3_cma_c0type(0 to 1);
    attribute preserve of i_scalarizer_2mul_ethash_search_ma3_cma_c1 : signal is true;
    attribute altera_attribute of i_scalarizer_2mul_ethash_search_ma3_cma_c1 : signal is "-name allow_synch_ctrl_usage off";
    signal i_scalarizer_2mul_ethash_search_ma3_cma_r : i_scalarizer_0mul_ethash_search_ma3_cma_rtype(0 to 1);
    signal i_scalarizer_2mul_ethash_search_ma3_cma_p : i_scalarizer_0mul_ethash_search_ma3_cma_ptype(0 to 1);
    signal i_scalarizer_2mul_ethash_search_ma3_cma_u : i_scalarizer_0mul_ethash_search_ma3_cma_utype(0 to 1);
    signal i_scalarizer_2mul_ethash_search_ma3_cma_w : i_scalarizer_0mul_ethash_search_ma3_cma_utype(0 to 0);
    signal i_scalarizer_2mul_ethash_search_ma3_cma_x : i_scalarizer_0mul_ethash_search_ma3_cma_utype(0 to 0);
    signal i_scalarizer_2mul_ethash_search_ma3_cma_y : i_scalarizer_0mul_ethash_search_ma3_cma_utype(0 to 0);
    signal i_scalarizer_2mul_ethash_search_ma3_cma_s : i_scalarizer_0mul_ethash_search_ma3_cma_utype(0 to 0);
    signal i_scalarizer_2mul_ethash_search_ma3_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal i_scalarizer_2mul_ethash_search_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_scalarizer_2mul_ethash_search_ma3_cma_ena0 : std_logic;
    signal i_scalarizer_2mul_ethash_search_ma3_cma_ena1 : std_logic;
    signal i_scalarizer_2mul_ethash_search_ma3_cma_ena2 : std_logic;
    signal i_scalarizer_3mul_ethash_search_ma3_cma_reset : std_logic;
    signal i_scalarizer_3mul_ethash_search_ma3_cma_a0 : i_scalarizer_0mul_ethash_search_ma3_cma_a0type(0 to 1);
    attribute preserve of i_scalarizer_3mul_ethash_search_ma3_cma_a0 : signal is true;
    attribute altera_attribute of i_scalarizer_3mul_ethash_search_ma3_cma_a0 : signal is "-name allow_synch_ctrl_usage off";
    signal i_scalarizer_3mul_ethash_search_ma3_cma_a1 : i_scalarizer_0mul_ethash_search_ma3_cma_a0type(0 to 1);
    attribute preserve of i_scalarizer_3mul_ethash_search_ma3_cma_a1 : signal is true;
    attribute altera_attribute of i_scalarizer_3mul_ethash_search_ma3_cma_a1 : signal is "-name allow_synch_ctrl_usage off";
    signal i_scalarizer_3mul_ethash_search_ma3_cma_c0 : i_scalarizer_0mul_ethash_search_ma3_cma_c0type(0 to 1);
    attribute preserve of i_scalarizer_3mul_ethash_search_ma3_cma_c0 : signal is true;
    attribute altera_attribute of i_scalarizer_3mul_ethash_search_ma3_cma_c0 : signal is "-name allow_synch_ctrl_usage off";
    signal i_scalarizer_3mul_ethash_search_ma3_cma_c1 : i_scalarizer_0mul_ethash_search_ma3_cma_c0type(0 to 1);
    attribute preserve of i_scalarizer_3mul_ethash_search_ma3_cma_c1 : signal is true;
    attribute altera_attribute of i_scalarizer_3mul_ethash_search_ma3_cma_c1 : signal is "-name allow_synch_ctrl_usage off";
    signal i_scalarizer_3mul_ethash_search_ma3_cma_r : i_scalarizer_0mul_ethash_search_ma3_cma_rtype(0 to 1);
    signal i_scalarizer_3mul_ethash_search_ma3_cma_p : i_scalarizer_0mul_ethash_search_ma3_cma_ptype(0 to 1);
    signal i_scalarizer_3mul_ethash_search_ma3_cma_u : i_scalarizer_0mul_ethash_search_ma3_cma_utype(0 to 1);
    signal i_scalarizer_3mul_ethash_search_ma3_cma_w : i_scalarizer_0mul_ethash_search_ma3_cma_utype(0 to 0);
    signal i_scalarizer_3mul_ethash_search_ma3_cma_x : i_scalarizer_0mul_ethash_search_ma3_cma_utype(0 to 0);
    signal i_scalarizer_3mul_ethash_search_ma3_cma_y : i_scalarizer_0mul_ethash_search_ma3_cma_utype(0 to 0);
    signal i_scalarizer_3mul_ethash_search_ma3_cma_s : i_scalarizer_0mul_ethash_search_ma3_cma_utype(0 to 0);
    signal i_scalarizer_3mul_ethash_search_ma3_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal i_scalarizer_3mul_ethash_search_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_scalarizer_3mul_ethash_search_ma3_cma_ena0 : std_logic;
    signal i_scalarizer_3mul_ethash_search_ma3_cma_ena1 : std_logic;
    signal i_scalarizer_3mul_ethash_search_ma3_cma_ena2 : std_logic;
    signal i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx84_ethash_search_ethash_search334_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal i_scalarizer_0mul_ethash_search_bjB6_q_const_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_scalarizer_0mul_ethash_search_bs2_merged_bit_select_c_const_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist1_i_scalarizer_2mul_ethash_search_bs11_b_3_0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist1_i_scalarizer_2mul_ethash_search_bs11_b_3_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist1_i_scalarizer_2mul_ethash_search_bs11_b_3_2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist2_i_scalarizer_1mul_ethash_search_bs11_b_3_0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist2_i_scalarizer_1mul_ethash_search_bs11_b_3_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist2_i_scalarizer_1mul_ethash_search_bs11_b_3_2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist3_i_scalarizer_0mul_ethash_search_bs11_b_3_0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist3_i_scalarizer_0mul_ethash_search_bs11_b_3_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist3_i_scalarizer_0mul_ethash_search_bs11_b_3_2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist5_i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_data_in : STD_LOGIC_VECTOR (4 downto 0);
    signal redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_data_out : STD_LOGIC_VECTOR (4 downto 0);
    signal redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_data_in : STD_LOGIC_VECTOR (2 downto 0);
    signal redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_data_out : STD_LOGIC_VECTOR (2 downto 0);
    signal redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo_data_in : STD_LOGIC_VECTOR (3 downto 0);
    signal redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo_data_out : STD_LOGIC_VECTOR (3 downto 0);
    signal redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q : STD_LOGIC_VECTOR (1934 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_b : STD_LOGIC_VECTOR (4 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_f : STD_LOGIC_VECTOR (2 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_h : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_i : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_j : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_k : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_l : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_m : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_n : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_o : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_p : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_r : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_s : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_t : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_u : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_v : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_w : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_x : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_y : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_z : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_aa : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_bb : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_cc : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_dd : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_ee : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_ff : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_gg : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_hh : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_ii : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_jj : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_kk : STD_LOGIC_VECTOR (3 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_ll : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_mm : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_nn : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_oo : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_pp : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_qq : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_rr : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_ss : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_tt : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_uu : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_vv : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_ww : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_xx : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_yy : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_zz : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_sfc_c0_for_body61_ethash_search_c0_enter23_ethash_search_aunroll_vunroll_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_body61_ethash_search_c0_enter23_ethash_search_aunroll_vunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_load_unnamed_ethash_search35_ethash_search_vunroll_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal bubble_select_i_load_unnamed_ethash_search35_ethash_search_vunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_unnamed_ethash_search35_ethash_search_vunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_unnamed_ethash_search35_ethash_search_vunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_unnamed_ethash_search35_ethash_search_vunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_load_unnamed_ethash_search34_ethash_search_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_unnamed_ethash_search34_ethash_search_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_sbar_unnamed_ethash_search33_ethash_search_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sbar_unnamed_ethash_search33_ethash_search_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_store_memdep_204_ethash_search_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_store_memdep_204_ethash_search_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_syncbuf_g_dag_sync_buffer_ethash_search_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_g_dag_sync_buffer_ethash_search_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_stall_entry_vunroll_q : STD_LOGIC_VECTOR (1934 downto 0);
    signal bubble_select_stall_entry_vunroll_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vunroll_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vunroll_d : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_vunroll_e : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_vunroll_f : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_vunroll_g : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_vunroll_h : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_vunroll_i : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_vunroll_j : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_vunroll_k : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_vunroll_l : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_vunroll_m : STD_LOGIC_VECTOR (3 downto 0);
    signal bubble_select_stall_entry_vunroll_n : STD_LOGIC_VECTOR (2 downto 0);
    signal bubble_select_stall_entry_vunroll_o : STD_LOGIC_VECTOR (4 downto 0);
    signal bubble_select_stall_entry_vunroll_p : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vunroll_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vunroll_r : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vunroll_s : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vunroll_t : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vunroll_u : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_vunroll_v : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vunroll_w : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vunroll_x : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vunroll_y : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vunroll_z : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vunroll_aa : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vunroll_bb : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vunroll_cc : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vunroll_dd : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vunroll_ee : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vunroll_ff : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vunroll_gg : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vunroll_hh : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vunroll_ii : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vunroll_jj : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vunroll_kk : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vunroll_ll : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vunroll_mm : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vunroll_nn : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vunroll_oo : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vunroll_pp : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vunroll_qq : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vunroll_rr : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vunroll_ss : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vunroll_tt : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vunroll_uu : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vunroll_vv : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vunroll_ww : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_vunroll_xx : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_vunroll_yy : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_vunroll_zz : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_vunroll_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_vunroll_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_vunroll_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_scalarizer_0mul_ethash_search_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal bubble_select_i_scalarizer_0mul_ethash_search_im0_cma_b : STD_LOGIC_VECTOR (35 downto 0);
    signal bubble_join_i_scalarizer_1mul_ethash_search_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal bubble_select_i_scalarizer_1mul_ethash_search_im0_cma_b : STD_LOGIC_VECTOR (35 downto 0);
    signal bubble_join_i_scalarizer_2mul_ethash_search_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal bubble_select_i_scalarizer_2mul_ethash_search_im0_cma_b : STD_LOGIC_VECTOR (35 downto 0);
    signal bubble_join_i_scalarizer_3mul_ethash_search_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal bubble_select_i_scalarizer_3mul_ethash_search_im0_cma_b : STD_LOGIC_VECTOR (35 downto 0);
    signal bubble_join_i_scalarizer_0mul_ethash_search_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal bubble_select_i_scalarizer_0mul_ethash_search_ma3_cma_b : STD_LOGIC_VECTOR (33 downto 0);
    signal bubble_join_i_scalarizer_1mul_ethash_search_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal bubble_select_i_scalarizer_1mul_ethash_search_ma3_cma_b : STD_LOGIC_VECTOR (33 downto 0);
    signal bubble_join_i_scalarizer_2mul_ethash_search_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal bubble_select_i_scalarizer_2mul_ethash_search_ma3_cma_b : STD_LOGIC_VECTOR (33 downto 0);
    signal bubble_join_i_scalarizer_3mul_ethash_search_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal bubble_select_i_scalarizer_3mul_ethash_search_ma3_cma_b : STD_LOGIC_VECTOR (33 downto 0);
    signal bubble_join_redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_q : STD_LOGIC_VECTOR (4 downto 0);
    signal bubble_select_redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_b : STD_LOGIC_VECTOR (4 downto 0);
    signal bubble_join_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_q : STD_LOGIC_VECTOR (2 downto 0);
    signal bubble_select_redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_b : STD_LOGIC_VECTOR (2 downto 0);
    signal bubble_join_redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo_q : STD_LOGIC_VECTOR (3 downto 0);
    signal bubble_select_redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo_b : STD_LOGIC_VECTOR (3 downto 0);
    signal bubble_join_redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg18 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg18 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed18 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg19 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg19 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed19 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg20 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg20 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed20 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg21 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg21 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed21 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg22 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg22 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed22 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg23 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg23 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed23 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg24 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg24 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed24 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg25 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg25 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed25 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg26 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg26 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed26 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg27 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg27 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed27 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg28 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg28 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed28 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg29 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg29 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed29 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg30 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg30 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed30 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg31 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg31 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed31 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg32 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg32 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed32 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg33 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg33 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed33 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg34 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg34 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed34 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg35 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg35 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed35 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg36 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg36 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed36 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg37 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg37 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed37 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg38 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg38 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed38 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg39 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg39 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed39 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg40 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg40 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed40 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg41 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg41 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed41 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg42 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg42 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed42 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg43 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg43 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed43 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg44 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg44 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed44 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg45 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg45 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed45 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg46 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg46 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed46 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg47 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg47 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed47 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg48 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg48 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed48 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg49 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg49 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed49 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg50 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg50 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed50 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg51 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg51 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed51 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg52 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg52 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed52 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg53 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg53 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed53 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or18 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or19 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or20 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or21 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or22 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or23 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or24 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or25 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or26 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or27 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or28 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or29 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or30 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or31 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or32 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or33 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or34 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or35 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or36 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or37 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or38 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or39 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or40 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or41 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or42 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or43 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or44 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or45 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or46 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or47 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or48 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or49 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or50 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or51 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or52 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V18 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V19 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V20 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V21 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V22 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V23 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V24 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V25 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V26 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V27 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V28 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V29 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V30 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V31 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V32 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V33 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V34 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V35 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V36 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V37 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V38 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V39 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V40 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V41 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V42 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V43 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V44 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V45 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V46 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V47 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V48 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V49 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V50 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V51 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V52 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V53 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_extender_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_extender_x_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_extender_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_extender_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_ethash_search34_ethash_search_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_ethash_search34_ethash_search_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_ethash_search34_ethash_search_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_ethash_search34_ethash_search_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sbar_unnamed_ethash_search33_ethash_search_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sbar_unnamed_ethash_search33_ethash_search_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sbar_unnamed_ethash_search33_ethash_search_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_memdep_204_ethash_search_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_memdep_204_ethash_search_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_memdep_204_ethash_search_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_vunroll_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_vunroll_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_vunroll_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scalarizer_0mul_ethash_search_im0_cma_R_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scalarizer_0mul_ethash_search_im0_cma_R_s_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scalarizer_0mul_ethash_search_im0_cma_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scalarizer_0mul_ethash_search_im0_cma_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scalarizer_0mul_ethash_search_im0_cma_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scalarizer_0mul_ethash_search_im0_cma_s_tv_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scalarizer_0mul_ethash_search_im0_cma_s_tv_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scalarizer_0mul_ethash_search_im0_cma_s_tv_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scalarizer_0mul_ethash_search_im0_cma_s_tv_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scalarizer_0mul_ethash_search_im0_cma_s_tv_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scalarizer_0mul_ethash_search_im0_cma_s_tv_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scalarizer_0mul_ethash_search_im0_cma_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scalarizer_0mul_ethash_search_im0_cma_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scalarizer_0mul_ethash_search_im0_cma_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scalarizer_0mul_ethash_search_im0_cma_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scalarizer_0mul_ethash_search_im0_cma_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scalarizer_0mul_ethash_search_im0_cma_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scalarizer_0mul_ethash_search_im0_cma_or5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scalarizer_0mul_ethash_search_im0_cma_or6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scalarizer_0mul_ethash_search_im0_cma_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scalarizer_0mul_ethash_search_im0_cma_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scalarizer_0mul_ethash_search_im0_cma_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scalarizer_0mul_ethash_search_im0_cma_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scalarizer_0mul_ethash_search_im0_cma_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scalarizer_0mul_ethash_search_im0_cma_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scalarizer_0mul_ethash_search_im0_cma_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scalarizer_0mul_ethash_search_im0_cma_V6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scalarizer_0mul_ethash_search_im0_cma_V7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_R_v_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_R_v_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_s_tv_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_s_tv_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist5_i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist5_i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist5_i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist5_i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist5_i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist5_i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and18 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and19 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and20 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and21 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and22 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and23 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and24 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and25 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and26 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and27 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and28 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and29 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and30 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and31 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and32 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and33 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and34 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and35 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and36 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and37 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and38 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and39 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and40 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and41 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and42 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and43 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and44 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and45 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and46 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and47 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and48 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and49 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and50 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and51 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and52 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and53 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and54 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_reg_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_reg_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_scalarizer_0mul_ethash_search_im0_cma_data_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_scalarizer_0mul_ethash_search_im0_cma_data_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_scalarizer_0mul_ethash_search_im0_cma_data_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_scalarizer_0mul_ethash_search_im0_cma_data_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_scalarizer_0mul_ethash_search_im0_cma_data_reg_data_in : STD_LOGIC_VECTOR (35 downto 0);
    signal bubble_out_i_scalarizer_0mul_ethash_search_im0_cma_data_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_scalarizer_0mul_ethash_search_im0_cma_data_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_scalarizer_0mul_ethash_search_im0_cma_data_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_scalarizer_0mul_ethash_search_im0_cma_data_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_scalarizer_0mul_ethash_search_im0_cma_data_reg_data_out : STD_LOGIC_VECTOR (35 downto 0);
    signal bubble_out_i_scalarizer_1mul_ethash_search_im0_cma_data_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_scalarizer_1mul_ethash_search_im0_cma_data_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_scalarizer_1mul_ethash_search_im0_cma_data_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_scalarizer_1mul_ethash_search_im0_cma_data_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_scalarizer_1mul_ethash_search_im0_cma_data_reg_data_in : STD_LOGIC_VECTOR (35 downto 0);
    signal bubble_out_i_scalarizer_1mul_ethash_search_im0_cma_data_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_scalarizer_1mul_ethash_search_im0_cma_data_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_scalarizer_1mul_ethash_search_im0_cma_data_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_scalarizer_1mul_ethash_search_im0_cma_data_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_scalarizer_1mul_ethash_search_im0_cma_data_reg_data_out : STD_LOGIC_VECTOR (35 downto 0);
    signal bubble_out_i_scalarizer_2mul_ethash_search_im0_cma_data_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_scalarizer_2mul_ethash_search_im0_cma_data_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_scalarizer_2mul_ethash_search_im0_cma_data_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_scalarizer_2mul_ethash_search_im0_cma_data_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_scalarizer_2mul_ethash_search_im0_cma_data_reg_data_in : STD_LOGIC_VECTOR (35 downto 0);
    signal bubble_out_i_scalarizer_2mul_ethash_search_im0_cma_data_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_scalarizer_2mul_ethash_search_im0_cma_data_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_scalarizer_2mul_ethash_search_im0_cma_data_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_scalarizer_2mul_ethash_search_im0_cma_data_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_scalarizer_2mul_ethash_search_im0_cma_data_reg_data_out : STD_LOGIC_VECTOR (35 downto 0);
    signal bubble_out_i_scalarizer_3mul_ethash_search_im0_cma_data_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_scalarizer_3mul_ethash_search_im0_cma_data_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_scalarizer_3mul_ethash_search_im0_cma_data_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_scalarizer_3mul_ethash_search_im0_cma_data_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_scalarizer_3mul_ethash_search_im0_cma_data_reg_data_in : STD_LOGIC_VECTOR (35 downto 0);
    signal bubble_out_i_scalarizer_3mul_ethash_search_im0_cma_data_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_scalarizer_3mul_ethash_search_im0_cma_data_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_scalarizer_3mul_ethash_search_im0_cma_data_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_scalarizer_3mul_ethash_search_im0_cma_data_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_scalarizer_3mul_ethash_search_im0_cma_data_reg_data_out : STD_LOGIC_VECTOR (35 downto 0);
    signal bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_reg_data_in : STD_LOGIC_VECTOR (33 downto 0);
    signal bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_reg_data_out : STD_LOGIC_VECTOR (33 downto 0);
    signal bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_reg_data_in : STD_LOGIC_VECTOR (33 downto 0);
    signal bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_reg_data_out : STD_LOGIC_VECTOR (33 downto 0);
    signal bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_reg_data_in : STD_LOGIC_VECTOR (33 downto 0);
    signal bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_reg_data_out : STD_LOGIC_VECTOR (33 downto 0);
    signal bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_reg_data_in : STD_LOGIC_VECTOR (33 downto 0);
    signal bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_reg_data_out : STD_LOGIC_VECTOR (33 downto 0);

begin


    -- i_idxprom80_rm_ethash_search_vt_const_63(CONSTANT,114)
    i_idxprom80_rm_ethash_search_vt_const_63_q <= "0000000000000000000000000000000000000000000000000000000000000";

    -- SE_stall_entry_vunroll(STALLENABLE,1000)
    -- Valid signal propagation
    SE_stall_entry_vunroll_V0 <= SE_stall_entry_vunroll_wireValid;
    -- Backward Stall generation
    SE_stall_entry_vunroll_backStall <= ethash_search_B4_merge_reg_aunroll_vunroll_x_out_stall_out or not (SE_stall_entry_vunroll_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_vunroll_wireValid <= in_valid_in;

    -- bubble_join_stall_entry_vunroll(BITJOIN,725)
    bubble_join_stall_entry_vunroll_q <= in_unnamed_ethash_search32 & in_state_7_0_cast134 & in_state_6_0_cast131 & in_state_5_0_cast128 & in_state_4_0_cast125 & in_state_0_0_cast122 & in_scalarizer_199849 & in_scalarizer_199639 & in_scalarizer_199429 & in_scalarizer_11180152 & in_scalarizer_11178148 & in_scalarizer_11176144 & in_scalarizer_11174140 & in_scalarizer_1100899 & in_scalarizer_1100689 & in_scalarizer_1100479 & in_scalarizer_1100269 & in_scalarizer_1100059 & in_scalarizer_099954 & in_scalarizer_099744 & in_scalarizer_099534 & in_scalarizer_099324 & in_scalarizer_01179150 & in_scalarizer_01177146 & in_scalarizer_01175142 & in_scalarizer_01173138 & in_scalarizer_0100794 & in_scalarizer_0100584 & in_scalarizer_0100374 & in_scalarizer_0100164 & in_mix_pm_2_in_3 & in_mix_pm_2_in_2 & in_mix_pm_2_in_1 & in_mix_pm_2_in_0 & in_l_grpid_0_addr_zext161 & in_l_grpid_0_addr11 & in_l_grpid_05 & in_i66_2906 & in_i18_0908154 & in_global_id_0194 & in_fpgaindvars_iv9 & in_fpgaindvars_iv6 & in_fpgaindvars_iv12136 & in_cmp23_xor159 & in_cmp23157 & in_c0_exe4118 & in_c0_exe3114 & in_c0_exe2110 & in_c0_exe1105 & in_arrayidx45_RM163 & in_arrayidx36_2_RM165 & in_arraydecay51_RM166 & in_and_RM155 & in_a_1907;

    -- bubble_select_stall_entry_vunroll(BITSELECT,726)
    bubble_select_stall_entry_vunroll_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(31 downto 0));
    bubble_select_stall_entry_vunroll_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(63 downto 32));
    bubble_select_stall_entry_vunroll_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(127 downto 64));
    bubble_select_stall_entry_vunroll_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(191 downto 128));
    bubble_select_stall_entry_vunroll_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(255 downto 192));
    bubble_select_stall_entry_vunroll_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(256 downto 256));
    bubble_select_stall_entry_vunroll_h <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(320 downto 257));
    bubble_select_stall_entry_vunroll_i <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(384 downto 321));
    bubble_select_stall_entry_vunroll_j <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(448 downto 385));
    bubble_select_stall_entry_vunroll_k <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(449 downto 449));
    bubble_select_stall_entry_vunroll_l <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(450 downto 450));
    bubble_select_stall_entry_vunroll_m <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(454 downto 451));
    bubble_select_stall_entry_vunroll_n <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(457 downto 455));
    bubble_select_stall_entry_vunroll_o <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(462 downto 458));
    bubble_select_stall_entry_vunroll_p <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(494 downto 463));
    bubble_select_stall_entry_vunroll_q <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(526 downto 495));
    bubble_select_stall_entry_vunroll_r <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(558 downto 527));
    bubble_select_stall_entry_vunroll_s <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(590 downto 559));
    bubble_select_stall_entry_vunroll_t <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(622 downto 591));
    bubble_select_stall_entry_vunroll_u <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(686 downto 623));
    bubble_select_stall_entry_vunroll_v <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(718 downto 687));
    bubble_select_stall_entry_vunroll_w <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(750 downto 719));
    bubble_select_stall_entry_vunroll_x <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(782 downto 751));
    bubble_select_stall_entry_vunroll_y <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(814 downto 783));
    bubble_select_stall_entry_vunroll_z <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(846 downto 815));
    bubble_select_stall_entry_vunroll_aa <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(878 downto 847));
    bubble_select_stall_entry_vunroll_bb <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(910 downto 879));
    bubble_select_stall_entry_vunroll_cc <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(942 downto 911));
    bubble_select_stall_entry_vunroll_dd <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(974 downto 943));
    bubble_select_stall_entry_vunroll_ee <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(1006 downto 975));
    bubble_select_stall_entry_vunroll_ff <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(1038 downto 1007));
    bubble_select_stall_entry_vunroll_gg <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(1070 downto 1039));
    bubble_select_stall_entry_vunroll_hh <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(1102 downto 1071));
    bubble_select_stall_entry_vunroll_ii <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(1134 downto 1103));
    bubble_select_stall_entry_vunroll_jj <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(1166 downto 1135));
    bubble_select_stall_entry_vunroll_kk <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(1198 downto 1167));
    bubble_select_stall_entry_vunroll_ll <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(1230 downto 1199));
    bubble_select_stall_entry_vunroll_mm <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(1262 downto 1231));
    bubble_select_stall_entry_vunroll_nn <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(1294 downto 1263));
    bubble_select_stall_entry_vunroll_oo <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(1326 downto 1295));
    bubble_select_stall_entry_vunroll_pp <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(1358 downto 1327));
    bubble_select_stall_entry_vunroll_qq <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(1390 downto 1359));
    bubble_select_stall_entry_vunroll_rr <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(1422 downto 1391));
    bubble_select_stall_entry_vunroll_ss <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(1454 downto 1423));
    bubble_select_stall_entry_vunroll_tt <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(1486 downto 1455));
    bubble_select_stall_entry_vunroll_uu <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(1518 downto 1487));
    bubble_select_stall_entry_vunroll_vv <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(1550 downto 1519));
    bubble_select_stall_entry_vunroll_ww <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(1582 downto 1551));
    bubble_select_stall_entry_vunroll_xx <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(1646 downto 1583));
    bubble_select_stall_entry_vunroll_yy <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(1710 downto 1647));
    bubble_select_stall_entry_vunroll_zz <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(1774 downto 1711));
    bubble_select_stall_entry_vunroll_1 <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(1838 downto 1775));
    bubble_select_stall_entry_vunroll_2 <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(1902 downto 1839));
    bubble_select_stall_entry_vunroll_3 <= STD_LOGIC_VECTOR(bubble_join_stall_entry_vunroll_q(1934 downto 1903));

    -- ethash_search_B4_merge_reg_aunroll_vunroll_x(BLACKBOX,4)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_data_out_0_3@1
    -- out out_data_out_1@1
    -- out out_data_out_1_3@1
    -- out out_data_out_2@1
    -- out out_data_out_2_3@1
    -- out out_data_out_3_3@1
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
    -- out out_data_out_38@1
    -- out out_data_out_39@1
    -- out out_data_out_40@1
    -- out out_data_out_41@1
    -- out out_data_out_42@1
    -- out out_data_out_43@1
    -- out out_data_out_44@1
    -- out out_data_out_45@1
    -- out out_data_out_46@1
    -- out out_data_out_47@1
    -- out out_data_out_48@1
    -- out out_data_out_49@1
    -- out out_data_out_50@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    theethash_search_B4_merge_reg_aunroll_vunroll_x : ethash_search_B4_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_vunroll_o,
        in_data_in_0_3 => bubble_select_stall_entry_vunroll_v,
        in_data_in_1 => bubble_select_stall_entry_vunroll_b,
        in_data_in_1_3 => bubble_select_stall_entry_vunroll_w,
        in_data_in_2 => bubble_select_stall_entry_vunroll_n,
        in_data_in_2_3 => bubble_select_stall_entry_vunroll_x,
        in_data_in_3_3 => bubble_select_stall_entry_vunroll_y,
        in_data_in_4 => bubble_select_stall_entry_vunroll_r,
        in_data_in_5 => bubble_select_stall_entry_vunroll_s,
        in_data_in_6 => bubble_select_stall_entry_vunroll_t,
        in_data_in_7 => bubble_select_stall_entry_vunroll_hh,
        in_data_in_8 => bubble_select_stall_entry_vunroll_uu,
        in_data_in_9 => bubble_select_stall_entry_vunroll_ii,
        in_data_in_10 => bubble_select_stall_entry_vunroll_vv,
        in_data_in_11 => bubble_select_stall_entry_vunroll_jj,
        in_data_in_12 => bubble_select_stall_entry_vunroll_ww,
        in_data_in_13 => bubble_select_stall_entry_vunroll_kk,
        in_data_in_14 => bubble_select_stall_entry_vunroll_ll,
        in_data_in_15 => bubble_select_stall_entry_vunroll_z,
        in_data_in_16 => bubble_select_stall_entry_vunroll_mm,
        in_data_in_17 => bubble_select_stall_entry_vunroll_aa,
        in_data_in_18 => bubble_select_stall_entry_vunroll_nn,
        in_data_in_19 => bubble_select_stall_entry_vunroll_bb,
        in_data_in_20 => bubble_select_stall_entry_vunroll_oo,
        in_data_in_21 => bubble_select_stall_entry_vunroll_cc,
        in_data_in_22 => bubble_select_stall_entry_vunroll_pp,
        in_data_in_23 => bubble_select_stall_entry_vunroll_g,
        in_data_in_24 => bubble_select_stall_entry_vunroll_h,
        in_data_in_25 => bubble_select_stall_entry_vunroll_i,
        in_data_in_26 => bubble_select_stall_entry_vunroll_j,
        in_data_in_27 => bubble_select_stall_entry_vunroll_xx,
        in_data_in_28 => bubble_select_stall_entry_vunroll_yy,
        in_data_in_29 => bubble_select_stall_entry_vunroll_zz,
        in_data_in_30 => bubble_select_stall_entry_vunroll_1,
        in_data_in_31 => bubble_select_stall_entry_vunroll_2,
        in_data_in_32 => bubble_select_stall_entry_vunroll_m,
        in_data_in_33 => bubble_select_stall_entry_vunroll_dd,
        in_data_in_34 => bubble_select_stall_entry_vunroll_qq,
        in_data_in_35 => bubble_select_stall_entry_vunroll_ee,
        in_data_in_36 => bubble_select_stall_entry_vunroll_rr,
        in_data_in_37 => bubble_select_stall_entry_vunroll_ff,
        in_data_in_38 => bubble_select_stall_entry_vunroll_ss,
        in_data_in_39 => bubble_select_stall_entry_vunroll_gg,
        in_data_in_40 => bubble_select_stall_entry_vunroll_tt,
        in_data_in_41 => bubble_select_stall_entry_vunroll_q,
        in_data_in_42 => bubble_select_stall_entry_vunroll_c,
        in_data_in_43 => bubble_select_stall_entry_vunroll_k,
        in_data_in_44 => bubble_select_stall_entry_vunroll_l,
        in_data_in_45 => bubble_select_stall_entry_vunroll_u,
        in_data_in_46 => bubble_select_stall_entry_vunroll_f,
        in_data_in_47 => bubble_select_stall_entry_vunroll_e,
        in_data_in_48 => bubble_select_stall_entry_vunroll_d,
        in_data_in_49 => bubble_select_stall_entry_vunroll_3,
        in_data_in_50 => bubble_select_stall_entry_vunroll_p,
        in_stall_in => SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_backStall,
        in_valid_in => SE_stall_entry_vunroll_V0,
        out_data_out_0 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0,
        out_data_out_0_3 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_3,
        out_data_out_1 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1,
        out_data_out_1_3 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_3,
        out_data_out_2 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2,
        out_data_out_2_3 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_3,
        out_data_out_3_3 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_3_3,
        out_data_out_4 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_4,
        out_data_out_5 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5,
        out_data_out_6 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6,
        out_data_out_7 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7,
        out_data_out_8 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8,
        out_data_out_9 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9,
        out_data_out_10 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10,
        out_data_out_11 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11,
        out_data_out_12 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12,
        out_data_out_13 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13,
        out_data_out_14 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14,
        out_data_out_15 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15,
        out_data_out_16 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16,
        out_data_out_17 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17,
        out_data_out_18 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18,
        out_data_out_19 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19,
        out_data_out_20 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20,
        out_data_out_21 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21,
        out_data_out_22 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22,
        out_data_out_23 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23,
        out_data_out_24 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24,
        out_data_out_25 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25,
        out_data_out_26 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26,
        out_data_out_27 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27,
        out_data_out_28 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28,
        out_data_out_29 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29,
        out_data_out_30 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30,
        out_data_out_31 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31,
        out_data_out_32 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32,
        out_data_out_33 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33,
        out_data_out_34 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34,
        out_data_out_35 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35,
        out_data_out_36 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36,
        out_data_out_37 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37,
        out_data_out_38 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38,
        out_data_out_39 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39,
        out_data_out_40 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40,
        out_data_out_41 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41,
        out_data_out_42 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42,
        out_data_out_43 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43,
        out_data_out_44 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44,
        out_data_out_45 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45,
        out_data_out_46 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46,
        out_data_out_47 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47,
        out_data_out_48 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48,
        out_data_out_49 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49,
        out_data_out_50 => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50,
        out_stall_out => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_stall_out,
        out_valid_out => ethash_search_B4_merge_reg_aunroll_vunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x(BITJOIN,702)
    bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q <= ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_4 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_3_3 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_3 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_3 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_3 & ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0;

    -- bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x(BITSELECT,703)
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(4 downto 0));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(36 downto 5));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(68 downto 37));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(100 downto 69));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(103 downto 101));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(135 downto 104));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(167 downto 136));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(199 downto 168));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_j <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(231 downto 200));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_k <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(263 downto 232));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_l <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(295 downto 264));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_m <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(327 downto 296));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_n <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(359 downto 328));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_o <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(391 downto 360));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_p <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(423 downto 392));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_q <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(455 downto 424));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_r <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(487 downto 456));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_s <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(519 downto 488));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_t <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(551 downto 520));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_u <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(583 downto 552));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_v <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(615 downto 584));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_w <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(647 downto 616));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_x <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(679 downto 648));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_y <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(711 downto 680));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_z <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(743 downto 712));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_aa <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(775 downto 744));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_bb <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(776 downto 776));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_cc <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(840 downto 777));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_dd <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(904 downto 841));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_ee <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(968 downto 905));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_ff <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(1032 downto 969));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_gg <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(1096 downto 1033));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_hh <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(1160 downto 1097));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_ii <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(1224 downto 1161));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_jj <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(1288 downto 1225));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_kk <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(1292 downto 1289));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_ll <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(1324 downto 1293));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_mm <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(1356 downto 1325));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_nn <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(1388 downto 1357));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_oo <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(1420 downto 1389));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_pp <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(1452 downto 1421));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_qq <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(1484 downto 1453));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_rr <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(1516 downto 1485));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_ss <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(1548 downto 1517));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_tt <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(1580 downto 1549));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_uu <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(1612 downto 1581));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_vv <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(1613 downto 1613));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_ww <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(1614 downto 1614));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_xx <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(1678 downto 1615));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_yy <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(1742 downto 1679));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_zz <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(1806 downto 1743));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_1 <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(1870 downto 1807));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_2 <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(1902 downto 1871));
    bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_3 <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B4_merge_reg_aunroll_vunroll_x_q(1934 downto 1903));

    -- bubble_join_i_sfc_c0_for_body61_ethash_search_c0_enter23_ethash_search_aunroll_vunroll_x(BITJOIN,706)
    bubble_join_i_sfc_c0_for_body61_ethash_search_c0_enter23_ethash_search_aunroll_vunroll_x_q <= i_sfc_c0_for_body61_ethash_search_c0_enter23_ethash_search_aunroll_vunroll_x_out_c0_exit29_1;

    -- bubble_select_i_sfc_c0_for_body61_ethash_search_c0_enter23_ethash_search_aunroll_vunroll_x(BITSELECT,707)
    bubble_select_i_sfc_c0_for_body61_ethash_search_c0_enter23_ethash_search_aunroll_vunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body61_ethash_search_c0_enter23_ethash_search_aunroll_vunroll_x_q(31 downto 0));

    -- bubble_join_i_sbar_unnamed_ethash_search33_ethash_search(BITJOIN,716)
    bubble_join_i_sbar_unnamed_ethash_search33_ethash_search_q <= i_sbar_unnamed_ethash_search33_ethash_search_out_data_exit;

    -- SE_i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_extender_x(STALLENABLE,950)
    -- Valid signal propagation
    SE_i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_extender_x_V0 <= SE_i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_extender_x_wireValid;
    -- Backward Stall generation
    SE_i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_extender_x_backStall <= i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_o_stall or not (SE_i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_extender_x_wireValid);
    -- Computing multiple Valid(s)
    SE_i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_extender_x_and0 <= SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_V2;
    SE_i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_extender_x_wireValid <= SE_redist5_i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b_1_0_V0 and SE_i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_extender_x_and0;

    -- SE_redist5_i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b_1_0(STALLENABLE,1091)
    -- Valid signal propagation
    SE_redist5_i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b_1_0_V0 <= SE_redist5_i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b_1_0_R_v_0;
    -- Stall signal propagation
    SE_redist5_i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b_1_0_s_tv_0 <= SE_i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_extender_x_backStall and SE_redist5_i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b_1_0_R_v_0;
    -- Backward Enable generation
    SE_redist5_i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b_1_0_backEN <= not (SE_redist5_i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b_1_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist5_i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b_1_0_v_s_0 <= SE_redist5_i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b_1_0_backEN and SE_out_i_load_unnamed_ethash_search34_ethash_search_V0;
    -- Backward Stall generation
    SE_redist5_i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b_1_0_backStall <= not (SE_redist5_i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b_1_0_v_s_0);
    SE_redist5_i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist5_i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b_1_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist5_i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist5_i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b_1_0_R_v_0 <= SE_redist5_i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b_1_0_R_v_0 and SE_redist5_i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist5_i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b_1_0_R_v_0 <= SE_redist5_i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_out_bubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1(STALLENABLE,1219)
    -- Valid signal propagation
    SE_out_bubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1_V0 <= SE_out_bubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1_backStall <= i_syncbuf_g_dag_sync_buffer_ethash_search_out_stall_out or not (SE_out_bubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1_wireValid <= bubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1_reg_valid_out;

    -- i_syncbuf_g_dag_sync_buffer_ethash_search(BLACKBOX,136)@231
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_g_dag_sync_buffer_ethash_search : i_syncbuf_g_dag_sync_buffer_ethash_search249
    PORT MAP (
        in_buffer_in => in_g_dag,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_load_unnamed_ethash_search34_ethash_search_backStall,
        in_valid_in => SE_out_bubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1_V0,
        out_buffer_out => i_syncbuf_g_dag_sync_buffer_ethash_search_out_buffer_out,
        out_stall_out => i_syncbuf_g_dag_sync_buffer_ethash_search_out_stall_out,
        out_valid_out => i_syncbuf_g_dag_sync_buffer_ethash_search_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_load_unnamed_ethash_search34_ethash_search(STALLENABLE,983)
    -- Valid signal propagation
    SE_out_i_load_unnamed_ethash_search34_ethash_search_V0 <= SE_out_i_load_unnamed_ethash_search34_ethash_search_wireValid;
    -- Backward Stall generation
    SE_out_i_load_unnamed_ethash_search34_ethash_search_backStall <= SE_redist5_i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b_1_0_backStall or not (SE_out_i_load_unnamed_ethash_search34_ethash_search_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_load_unnamed_ethash_search34_ethash_search_and0 <= i_load_unnamed_ethash_search34_ethash_search_out_o_valid;
    SE_out_i_load_unnamed_ethash_search34_ethash_search_wireValid <= i_syncbuf_g_dag_sync_buffer_ethash_search_out_valid_out and SE_out_i_load_unnamed_ethash_search34_ethash_search_and0;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- bubble_select_i_sbar_unnamed_ethash_search33_ethash_search(BITSELECT,717)
    bubble_select_i_sbar_unnamed_ethash_search33_ethash_search_b <= STD_LOGIC_VECTOR(bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_reg_data_out(0 downto 0));

    -- redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo(STALLFIFO,691)
    redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_valid_in <= SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_V1;
    redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_stall_in <= SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_backStall;
    redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_data_in <= bubble_select_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_b;
    redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_valid_in_bitsignaltemp <= redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_valid_in(0);
    redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_stall_in_bitsignaltemp <= redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_stall_in(0);
    redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_valid_out(0) <= redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_valid_out_bitsignaltemp;
    redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_stall_out(0) <= redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_stall_out_bitsignaltemp;
    theredist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 162,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_valid_in_bitsignaltemp,
        stall_in => redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_b,
        valid_out => redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_valid_out_bitsignaltemp,
        stall_out => redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_stall_out_bitsignaltemp,
        data_out => redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo(BITJOIN,909)
    bubble_join_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_q <= redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_data_out;

    -- bubble_select_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo(BITSELECT,910)
    bubble_select_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_q(63 downto 0));

    -- redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo(STALLFIFO,696)
    redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_valid_in <= SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_V1;
    redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_stall_in <= SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_backStall;
    redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_data_in <= bubble_select_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_b;
    redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_valid_in_bitsignaltemp <= redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_valid_in(0);
    redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_stall_in_bitsignaltemp <= redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_stall_in(0);
    redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_valid_out(0) <= redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_valid_out_bitsignaltemp;
    redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_stall_out(0) <= redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_stall_out_bitsignaltemp;
    theredist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 162,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_valid_in_bitsignaltemp,
        stall_in => redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_b,
        valid_out => redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_valid_out_bitsignaltemp,
        stall_out => redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_stall_out_bitsignaltemp,
        data_out => redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo(BITJOIN,924)
    bubble_join_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_q <= redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_data_out;

    -- bubble_select_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo(BITSELECT,925)
    bubble_select_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_q(63 downto 0));

    -- i_load_unnamed_ethash_search34_ethash_search(BLACKBOX,122)@199
    -- in in_i_stall@20000000
    -- out out_o_readdata@231
    -- out out_o_stall@20000000
    -- out out_o_valid@231
    -- out out_unnamed_ethash_search34_avm_address@20000000
    -- out out_unnamed_ethash_search34_avm_burstcount@20000000
    -- out out_unnamed_ethash_search34_avm_byteenable@20000000
    -- out out_unnamed_ethash_search34_avm_enable@20000000
    -- out out_unnamed_ethash_search34_avm_read@20000000
    -- out out_unnamed_ethash_search34_avm_write@20000000
    -- out out_unnamed_ethash_search34_avm_writedata@20000000
    thei_load_unnamed_ethash_search34_ethash_search : i_load_unnamed_ethash_search34_ethash_search332
    PORT MAP (
        in_flush => in_flush,
        in_i_address => bubble_select_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_b,
        in_i_bitwiseor => bubble_select_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_b,
        in_i_dependence => bubble_select_i_sbar_unnamed_ethash_search33_ethash_search_b,
        in_i_predicate => GND_q,
        in_i_stall => SE_out_i_load_unnamed_ethash_search34_ethash_search_backStall,
        in_i_valid => SE_out_bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_V0,
        in_unnamed_ethash_search34_avm_readdata => in_unnamed_ethash_search34_avm_readdata,
        in_unnamed_ethash_search34_avm_readdatavalid => in_unnamed_ethash_search34_avm_readdatavalid,
        in_unnamed_ethash_search34_avm_waitrequest => in_unnamed_ethash_search34_avm_waitrequest,
        in_unnamed_ethash_search34_avm_writeack => in_unnamed_ethash_search34_avm_writeack,
        out_o_readdata => i_load_unnamed_ethash_search34_ethash_search_out_o_readdata,
        out_o_stall => i_load_unnamed_ethash_search34_ethash_search_out_o_stall,
        out_o_valid => i_load_unnamed_ethash_search34_ethash_search_out_o_valid,
        out_unnamed_ethash_search34_avm_address => i_load_unnamed_ethash_search34_ethash_search_out_unnamed_ethash_search34_avm_address,
        out_unnamed_ethash_search34_avm_burstcount => i_load_unnamed_ethash_search34_ethash_search_out_unnamed_ethash_search34_avm_burstcount,
        out_unnamed_ethash_search34_avm_byteenable => i_load_unnamed_ethash_search34_ethash_search_out_unnamed_ethash_search34_avm_byteenable,
        out_unnamed_ethash_search34_avm_enable => i_load_unnamed_ethash_search34_ethash_search_out_unnamed_ethash_search34_avm_enable,
        out_unnamed_ethash_search34_avm_read => i_load_unnamed_ethash_search34_ethash_search_out_unnamed_ethash_search34_avm_read,
        out_unnamed_ethash_search34_avm_write => i_load_unnamed_ethash_search34_ethash_search_out_unnamed_ethash_search34_avm_write,
        out_unnamed_ethash_search34_avm_writedata => i_load_unnamed_ethash_search34_ethash_search_out_unnamed_ethash_search34_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo(STALLENABLE,1205)
    SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_fromReg0 <= (others => '0');
            SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_fromReg0 <= SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_toReg0;
            -- Succesor 1
            SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_fromReg1 <= SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_consumed0 <= (not (SE_out_bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_backStall) and SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_wireValid) or SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_fromReg0;
    SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_consumed1 <= (not (redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo_stall_out) and SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_wireValid) or SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_fromReg1;
    -- Consuming
    SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_StallValid <= SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_backStall and SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_wireValid;
    SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_toReg0 <= SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_StallValid and SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_consumed0;
    SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_toReg1 <= SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_StallValid and SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_or0 <= SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_consumed0;
    SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_wireStall <= not (SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_consumed1 and SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_or0);
    SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_backStall <= SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_V0 <= SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_wireValid and not (SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_fromReg0);
    SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_V1 <= SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_wireValid and not (SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_wireValid <= redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_valid_out;

    -- SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo(STALLENABLE,1195)
    SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_fromReg0 <= (others => '0');
            SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_fromReg0 <= SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_toReg0;
            -- Succesor 1
            SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_fromReg1 <= SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_consumed0 <= (not (SE_out_bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_backStall) and SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_wireValid) or SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_fromReg0;
    SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_consumed1 <= (not (redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo_stall_out) and SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_wireValid) or SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_fromReg1;
    -- Consuming
    SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_StallValid <= SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_backStall and SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_wireValid;
    SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_toReg0 <= SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_StallValid and SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_consumed0;
    SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_toReg1 <= SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_StallValid and SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_or0 <= SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_consumed0;
    SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_wireStall <= not (SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_consumed1 and SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_or0);
    SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_backStall <= SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_V0 <= SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_wireValid and not (SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_fromReg0);
    SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_V1 <= SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_wireValid and not (SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_wireValid <= redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_valid_out;

    -- SE_out_bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data(STALLENABLE,1235)
    -- Valid signal propagation
    SE_out_bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_V0 <= SE_out_bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_backStall <= i_load_unnamed_ethash_search34_ethash_search_out_o_stall or not (SE_out_bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_and0 <= bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_reg_valid_out;
    SE_out_bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_and1 <= SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_V0 and SE_out_bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_and0;
    SE_out_bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_wireValid <= SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_V0 and SE_out_bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_and1;

    -- bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_reg(STALLFIFO,1533)
    bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_reg_valid_in <= SE_out_i_sbar_unnamed_ethash_search33_ethash_search_V0;
    bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_reg_stall_in <= SE_out_bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_backStall;
    bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_reg_data_in <= bubble_join_i_sbar_unnamed_ethash_search33_ethash_search_q;
    bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_reg_valid_in_bitsignaltemp <= bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_reg_valid_in(0);
    bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_reg_stall_in_bitsignaltemp <= bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_reg_stall_in(0);
    bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_reg_valid_out(0) <= bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_reg_valid_out_bitsignaltemp;
    bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_reg_stall_out(0) <= bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_reg_stall_out_bitsignaltemp;
    thebubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_reg : acl_data_fifo
    GENERIC MAP (
        DEPTH => 3,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "zl_reg"
    )
    PORT MAP (
        valid_in => bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_reg_stall_in_bitsignaltemp,
        data_in => bubble_join_i_sbar_unnamed_ethash_search33_ethash_search_q,
        valid_out => bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_reg_stall_out_bitsignaltemp,
        data_out => bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_reg_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_sbar_unnamed_ethash_search33_ethash_search(STALLENABLE,985)
    -- Valid signal propagation
    SE_out_i_sbar_unnamed_ethash_search33_ethash_search_V0 <= SE_out_i_sbar_unnamed_ethash_search33_ethash_search_wireValid;
    -- Backward Stall generation
    SE_out_i_sbar_unnamed_ethash_search33_ethash_search_backStall <= bubble_out_i_sbar_unnamed_ethash_search33_ethash_search_data_reg_stall_out or not (SE_out_i_sbar_unnamed_ethash_search33_ethash_search_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_sbar_unnamed_ethash_search33_ethash_search_wireValid <= i_sbar_unnamed_ethash_search33_ethash_search_out_valid_exit;

    -- bubble_join_i_store_memdep_204_ethash_search(BITJOIN,719)
    bubble_join_i_store_memdep_204_ethash_search_q <= i_store_memdep_204_ethash_search_out_o_writeack;

    -- bubble_select_i_store_memdep_204_ethash_search(BITSELECT,720)
    bubble_select_i_store_memdep_204_ethash_search_b <= STD_LOGIC_VECTOR(bubble_join_i_store_memdep_204_ethash_search_q(0 downto 0));

    -- i_sbar_unnamed_ethash_search33_ethash_search(BLACKBOX,123)@69
    -- in in_stall_exit@20000000
    -- out out_data_exit@199
    -- out out_stall_entry@20000000
    -- out out_valid_exit@199
    thei_sbar_unnamed_ethash_search33_ethash_search : i_sbar_unnamed_ethash_search33_ethash_search330
    PORT MAP (
        in_data_entry => bubble_select_i_store_memdep_204_ethash_search_b,
        in_stall_exit => SE_out_i_sbar_unnamed_ethash_search33_ethash_search_backStall,
        in_valid_entry => SE_out_i_store_memdep_204_ethash_search_V0,
        in_workgroup_size => in_barrier_unnamed_ethash_search33_wgs_workgroup_size,
        out_data_exit => i_sbar_unnamed_ethash_search33_ethash_search_out_data_exit,
        out_stall_entry => i_sbar_unnamed_ethash_search33_ethash_search_out_stall_entry,
        out_valid_exit => i_sbar_unnamed_ethash_search33_ethash_search_out_valid_exit,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_store_memdep_204_ethash_search(STALLENABLE,993)
    -- Valid signal propagation
    SE_out_i_store_memdep_204_ethash_search_V0 <= SE_out_i_store_memdep_204_ethash_search_wireValid;
    -- Backward Stall generation
    SE_out_i_store_memdep_204_ethash_search_backStall <= i_sbar_unnamed_ethash_search33_ethash_search_out_stall_entry or not (SE_out_i_store_memdep_204_ethash_search_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_store_memdep_204_ethash_search_wireValid <= i_store_memdep_204_ethash_search_out_o_valid;

    -- dupName_1_c_i32_0gr_x(CONSTANT,22)
    dupName_1_c_i32_0gr_x_q <= "00000000000000000000000000000000";

    -- i_unnamed_ethash_search326_vt_const_31(CONSTANT,141)
    i_unnamed_ethash_search326_vt_const_31_q <= "00000000000000000000000000000";

    -- c_i32_7gr(CONSTANT,93)
    c_i32_7gr_q <= "00000000000000000000000000000111";

    -- bubble_join_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo(BITJOIN,933)
    bubble_join_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_q <= redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_data_out;

    -- bubble_select_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo(BITSELECT,934)
    bubble_select_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_q(31 downto 0));

    -- i_shr62_ethash_search_vt_const_31(CONSTANT,132)
    i_shr62_ethash_search_vt_const_31_q <= "00";

    -- rightShiftStage0Idx1Rng2_uid207_i_shr62_ethash_search_ethash_search252_shift_x(BITSELECT,206)@38
    rightShiftStage0Idx1Rng2_uid207_i_shr62_ethash_search_ethash_search252_shift_x_b <= bubble_select_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_b(31 downto 2);

    -- rightShiftStage0Idx1_uid209_i_shr62_ethash_search_ethash_search252_shift_x(BITJOIN,208)@38
    rightShiftStage0Idx1_uid209_i_shr62_ethash_search_ethash_search252_shift_x_q <= i_shr62_ethash_search_vt_const_31_q & rightShiftStage0Idx1Rng2_uid207_i_shr62_ethash_search_ethash_search252_shift_x_b;

    -- bubble_join_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo(BITJOIN,774)
    bubble_join_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_q <= redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_data_out;

    -- bubble_select_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo(BITSELECT,775)
    bubble_select_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_q(31 downto 0));

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x(MUX,210)@38
    rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x_s <= VCC_q;
    rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x_combproc: PROCESS (rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x_s, bubble_select_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_b, rightShiftStage0Idx1_uid209_i_shr62_ethash_search_ethash_search252_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x_s) IS
            WHEN "0" => rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x_q <= bubble_select_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_b;
            WHEN "1" => rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x_q <= rightShiftStage0Idx1_uid209_i_shr62_ethash_search_ethash_search252_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_shr62_ethash_search_vt_select_29(BITSELECT,134)@38
    i_shr62_ethash_search_vt_select_29_b <= rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x_q(29 downto 0);

    -- i_shr62_ethash_search_vt_join(BITJOIN,133)@38
    i_shr62_ethash_search_vt_join_q <= i_shr62_ethash_search_vt_const_31_q & i_shr62_ethash_search_vt_select_29_b;

    -- i_unnamed_ethash_search324(LOGICAL,137)@38
    i_unnamed_ethash_search324_q <= i_shr62_ethash_search_vt_join_q xor bubble_select_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_b;

    -- i_unnamed_ethash_search326(LOGICAL,140)@38
    i_unnamed_ethash_search326_q <= i_unnamed_ethash_search324_q and c_i32_7gr_q;

    -- i_unnamed_ethash_search326_vt_select_2(BITSELECT,143)@38
    i_unnamed_ethash_search326_vt_select_2_b <= i_unnamed_ethash_search326_q(2 downto 0);

    -- i_unnamed_ethash_search326_vt_join(BITJOIN,142)@38
    i_unnamed_ethash_search326_vt_join_q <= i_unnamed_ethash_search326_vt_const_31_q & i_unnamed_ethash_search326_vt_select_2_b;

    -- i_cmp64_xor_ethash_search(LOGICAL,104)@38
    i_cmp64_xor_ethash_search_q <= "1" WHEN i_unnamed_ethash_search326_vt_join_q /= dupName_1_c_i32_0gr_x_q ELSE "0";

    -- bubble_join_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo(BITJOIN,906)
    bubble_join_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_q <= redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_data_out;

    -- bubble_select_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo(BITSELECT,907)
    bubble_select_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_q(63 downto 0));

    -- bubble_join_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo(BITJOIN,921)
    bubble_join_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_q <= redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_data_out;

    -- bubble_select_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo(BITSELECT,922)
    bubble_select_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_q(63 downto 0));

    -- i_store_memdep_204_ethash_search(BLACKBOX,135)@38
    -- in in_i_stall@20000000
    -- out out_memdep_204_avm_address@20000000
    -- out out_memdep_204_avm_burstcount@20000000
    -- out out_memdep_204_avm_byteenable@20000000
    -- out out_memdep_204_avm_enable@20000000
    -- out out_memdep_204_avm_read@20000000
    -- out out_memdep_204_avm_write@20000000
    -- out out_memdep_204_avm_writedata@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@69
    -- out out_o_writeack@69
    thei_store_memdep_204_ethash_search : i_store_memdep_204_ethash_search328
    PORT MAP (
        in_flush => in_flush,
        in_i_address => bubble_select_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_b,
        in_i_bitwiseor => bubble_select_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_b,
        in_i_predicate => i_cmp64_xor_ethash_search_q,
        in_i_stall => SE_out_i_store_memdep_204_ethash_search_backStall,
        in_i_valid => SE_rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x_V0,
        in_i_writedata => bubble_select_i_sfc_c0_for_body61_ethash_search_c0_enter23_ethash_search_aunroll_vunroll_x_b,
        in_memdep_204_avm_readdata => in_memdep_204_avm_readdata,
        in_memdep_204_avm_readdatavalid => in_memdep_204_avm_readdatavalid,
        in_memdep_204_avm_waitrequest => in_memdep_204_avm_waitrequest,
        in_memdep_204_avm_writeack => in_memdep_204_avm_writeack,
        out_memdep_204_avm_address => i_store_memdep_204_ethash_search_out_memdep_204_avm_address,
        out_memdep_204_avm_burstcount => i_store_memdep_204_ethash_search_out_memdep_204_avm_burstcount,
        out_memdep_204_avm_byteenable => i_store_memdep_204_ethash_search_out_memdep_204_avm_byteenable,
        out_memdep_204_avm_enable => i_store_memdep_204_ethash_search_out_memdep_204_avm_enable,
        out_memdep_204_avm_read => i_store_memdep_204_ethash_search_out_memdep_204_avm_read,
        out_memdep_204_avm_write => i_store_memdep_204_ethash_search_out_memdep_204_avm_write,
        out_memdep_204_avm_writedata => i_store_memdep_204_ethash_search_out_memdep_204_avm_writedata,
        out_o_stall => i_store_memdep_204_ethash_search_out_o_stall,
        out_o_valid => i_store_memdep_204_ethash_search_out_o_valid,
        out_o_writeack => i_store_memdep_204_ethash_search_out_o_writeack,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo(STALLENABLE,1203)
    SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_fromReg0 <= (others => '0');
            SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_fromReg0 <= SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_toReg0;
            -- Succesor 1
            SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_fromReg1 <= SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_consumed0 <= (not (SE_rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x_backStall) and SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_wireValid) or SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_fromReg0;
    SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_consumed1 <= (not (redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_stall_out) and SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_wireValid) or SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_fromReg1;
    -- Consuming
    SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_StallValid <= SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_backStall and SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_wireValid;
    SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_toReg0 <= SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_StallValid and SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_consumed0;
    SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_toReg1 <= SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_StallValid and SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_or0 <= SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_consumed0;
    SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_wireStall <= not (SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_consumed1 and SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_or0);
    SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_backStall <= SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_V0 <= SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_wireValid and not (SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_fromReg0);
    SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_V1 <= SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_wireValid and not (SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_wireValid <= redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_valid_out;

    -- SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo(STALLENABLE,1193)
    SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_fromReg0 <= (others => '0');
            SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_fromReg0 <= SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_toReg0;
            -- Succesor 1
            SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_fromReg1 <= SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_consumed0 <= (not (SE_rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x_backStall) and SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_wireValid) or SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_fromReg0;
    SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_consumed1 <= (not (redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_stall_out) and SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_wireValid) or SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_fromReg1;
    -- Consuming
    SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_StallValid <= SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_backStall and SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_wireValid;
    SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_toReg0 <= SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_StallValid and SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_consumed0;
    SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_toReg1 <= SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_StallValid and SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_or0 <= SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_consumed0;
    SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_wireStall <= not (SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_consumed1 and SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_or0);
    SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_backStall <= SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_V0 <= SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_wireValid and not (SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_fromReg0);
    SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_V1 <= SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_wireValid and not (SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_wireValid <= redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_valid_out;

    -- SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo(STALLENABLE,1105)
    SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_fromReg0 <= (others => '0');
            SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_fromReg0 <= SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_toReg0;
            -- Succesor 1
            SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_fromReg1 <= SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_consumed0 <= (not (redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_stall_out) and SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_wireValid) or SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_fromReg0;
    SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_consumed1 <= (not (SE_rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x_backStall) and SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_wireValid) or SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_fromReg1;
    -- Consuming
    SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_StallValid <= SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_backStall and SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_wireValid;
    SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_toReg0 <= SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_StallValid and SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_consumed0;
    SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_toReg1 <= SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_StallValid and SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_or0 <= SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_consumed0;
    SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_wireStall <= not (SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_consumed1 and SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_or0);
    SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_backStall <= SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_V0 <= SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_wireValid and not (SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_fromReg0);
    SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_V1 <= SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_wireValid and not (SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_wireValid <= redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_valid_out;

    -- SE_rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x(STALLENABLE,1021)
    -- Valid signal propagation
    SE_rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x_V0 <= SE_rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x_wireValid;
    -- Backward Stall generation
    SE_rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x_backStall <= i_store_memdep_204_ethash_search_out_o_stall or not (SE_rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x_wireValid);
    -- Computing multiple Valid(s)
    SE_rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x_and0 <= SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_V1;
    SE_rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x_and1 <= SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_V0 and SE_rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x_and0;
    SE_rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x_and2 <= i_sfc_c0_for_body61_ethash_search_c0_enter23_ethash_search_aunroll_vunroll_x_out_o_valid and SE_rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x_and1;
    SE_rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x_and3 <= SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_V0 and SE_rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x_and2;
    SE_rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x_wireValid <= SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_V0 and SE_rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x_and3;

    -- SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo(STALLENABLE,1211)
    SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_fromReg0 <= (others => '0');
            SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_fromReg0 <= SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_toReg0;
            -- Succesor 1
            SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_fromReg1 <= SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_consumed0 <= (not (SE_rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x_backStall) and SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_wireValid) or SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_fromReg0;
    SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_consumed1 <= (not (redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_stall_out) and SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_wireValid) or SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_fromReg1;
    -- Consuming
    SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_StallValid <= SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_backStall and SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_wireValid;
    SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_toReg0 <= SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_StallValid and SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_consumed0;
    SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_toReg1 <= SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_StallValid and SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_or0 <= SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_consumed0;
    SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_wireStall <= not (SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_consumed1 and SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_or0);
    SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_backStall <= SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_V0 <= SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_wireValid and not (SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_fromReg0);
    SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_V1 <= SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_wireValid and not (SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_wireValid <= redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_valid_out;

    -- redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo(STALLFIFO,699)
    redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V52;
    redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_stall_in <= SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_backStall;
    redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_3;
    redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_valid_in_bitsignaltemp <= redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_valid_in(0);
    redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_stall_in_bitsignaltemp <= redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_stall_in(0);
    redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_valid_out(0) <= redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_valid_out_bitsignaltemp;
    redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_stall_out(0) <= redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_stall_out_bitsignaltemp;
    theredist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 38,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_valid_in_bitsignaltemp,
        stall_in => redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_3,
        valid_out => redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_valid_out_bitsignaltemp,
        stall_out => redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_stall_out_bitsignaltemp,
        data_out => redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo(STALLFIFO,695)
    redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V50;
    redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_stall_in <= SE_out_redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_backStall;
    redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_1;
    redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_valid_in_bitsignaltemp <= redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_valid_in(0);
    redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_stall_in_bitsignaltemp <= redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_stall_in(0);
    redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_valid_out(0) <= redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_valid_out_bitsignaltemp;
    redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_stall_out(0) <= redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_stall_out_bitsignaltemp;
    theredist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 38,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_valid_in_bitsignaltemp,
        stall_in => redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_1,
        valid_out => redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_valid_out_bitsignaltemp,
        stall_out => redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_stall_out_bitsignaltemp,
        data_out => redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo(STALLFIFO,690)
    redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V47;
    redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_stall_in <= SE_out_redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_backStall;
    redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_xx;
    redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_valid_in_bitsignaltemp <= redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_valid_in(0);
    redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_stall_in_bitsignaltemp <= redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_stall_in(0);
    redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_valid_out(0) <= redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_valid_out_bitsignaltemp;
    redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_stall_out(0) <= redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_stall_out_bitsignaltemp;
    theredist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 38,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_valid_in_bitsignaltemp,
        stall_in => redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_xx,
        valid_out => redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_valid_out_bitsignaltemp,
        stall_out => redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_stall_out_bitsignaltemp,
        data_out => redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo(STALLFIFO,646)
    redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V5;
    redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_stall_in <= SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_backStall;
    redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_d;
    redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_valid_in_bitsignaltemp <= redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_valid_in(0);
    redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_stall_in_bitsignaltemp <= redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_stall_in(0);
    redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_valid_out(0) <= redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_valid_out_bitsignaltemp;
    redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_stall_out(0) <= redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_stall_out_bitsignaltemp;
    theredist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 38,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_valid_in_bitsignaltemp,
        stall_in => redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_d,
        valid_out => redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_valid_out_bitsignaltemp,
        stall_out => redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_stall_out_bitsignaltemp,
        data_out => redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- i_scalarizer_0mul_ethash_search_bs1(BITSELECT,223)@1
    i_scalarizer_0mul_ethash_search_bs1_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_c(17 downto 0);
    i_scalarizer_0mul_ethash_search_bs1_b <= i_scalarizer_0mul_ethash_search_bs1_in(17 downto 0);

    -- i_scalarizer_0mul_ethash_search_im0_cma(CHAINMULTADD,545)@1 + 3
    i_scalarizer_0mul_ethash_search_im0_cma_reset <= not (resetn);
    i_scalarizer_0mul_ethash_search_im0_cma_ena0 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_backEN(0);
    i_scalarizer_0mul_ethash_search_im0_cma_ena1 <= i_scalarizer_0mul_ethash_search_im0_cma_ena0;
    i_scalarizer_0mul_ethash_search_im0_cma_ena2 <= i_scalarizer_0mul_ethash_search_im0_cma_ena0;
    -- altera synthesis_off
    i_scalarizer_0mul_ethash_search_im0_cma_k0 <= (
        0 => TO_UNSIGNED(403,18),
        others => (others => '0'));
    -- altera synthesis_on
    i_scalarizer_0mul_ethash_search_im0_cma_r(0) <= i_scalarizer_0mul_ethash_search_im0_cma_k0(TO_INTEGER(i_scalarizer_0mul_ethash_search_im0_cma_c1(0)));
    i_scalarizer_0mul_ethash_search_im0_cma_p(0) <= i_scalarizer_0mul_ethash_search_im0_cma_a1(0) * i_scalarizer_0mul_ethash_search_im0_cma_r(0);
    i_scalarizer_0mul_ethash_search_im0_cma_u(0) <= RESIZE(i_scalarizer_0mul_ethash_search_im0_cma_p(0),36);
    i_scalarizer_0mul_ethash_search_im0_cma_w(0) <= i_scalarizer_0mul_ethash_search_im0_cma_u(0);
    i_scalarizer_0mul_ethash_search_im0_cma_x(0) <= i_scalarizer_0mul_ethash_search_im0_cma_w(0);
    i_scalarizer_0mul_ethash_search_im0_cma_y(0) <= i_scalarizer_0mul_ethash_search_im0_cma_x(0);
    i_scalarizer_0mul_ethash_search_im0_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_scalarizer_0mul_ethash_search_im0_cma_a0 <= (others => (others => '0'));
            i_scalarizer_0mul_ethash_search_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_scalarizer_0mul_ethash_search_im0_cma_ena0 = '1') THEN
                i_scalarizer_0mul_ethash_search_im0_cma_a0(0) <= RESIZE(UNSIGNED(i_scalarizer_0mul_ethash_search_bs1_b),18);
                i_scalarizer_0mul_ethash_search_im0_cma_c0(0) <= RESIZE(UNSIGNED(GND_q),3);
            END IF;
        END IF;
    END PROCESS;
    i_scalarizer_0mul_ethash_search_im0_cma_chainmultadd_pipe: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_scalarizer_0mul_ethash_search_im0_cma_a1 <= (others => (others => '0'));
            i_scalarizer_0mul_ethash_search_im0_cma_c1 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_scalarizer_0mul_ethash_search_im0_cma_ena2 = '1') THEN
                i_scalarizer_0mul_ethash_search_im0_cma_a1 <= i_scalarizer_0mul_ethash_search_im0_cma_a0;
                i_scalarizer_0mul_ethash_search_im0_cma_c1 <= i_scalarizer_0mul_ethash_search_im0_cma_c0;
            END IF;
        END IF;
    END PROCESS;
    i_scalarizer_0mul_ethash_search_im0_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_scalarizer_0mul_ethash_search_im0_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_scalarizer_0mul_ethash_search_im0_cma_ena1 = '1') THEN
                i_scalarizer_0mul_ethash_search_im0_cma_s(0) <= i_scalarizer_0mul_ethash_search_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_scalarizer_0mul_ethash_search_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_scalarizer_0mul_ethash_search_im0_cma_s(0)(35 downto 0)), xout => i_scalarizer_0mul_ethash_search_im0_cma_qq, ena => SE_i_scalarizer_0mul_ethash_search_im0_cma_backEN(0), clk => clock, aclr => resetn );
    i_scalarizer_0mul_ethash_search_im0_cma_q <= STD_LOGIC_VECTOR(i_scalarizer_0mul_ethash_search_im0_cma_qq(35 downto 0));

    -- bubble_join_i_scalarizer_0mul_ethash_search_im0_cma(BITJOIN,729)
    bubble_join_i_scalarizer_0mul_ethash_search_im0_cma_q <= i_scalarizer_0mul_ethash_search_im0_cma_q;

    -- bubble_out_i_scalarizer_0mul_ethash_search_im0_cma_data_reg(STALLFIFO,1534)
    bubble_out_i_scalarizer_0mul_ethash_search_im0_cma_data_reg_valid_in <= SE_i_scalarizer_0mul_ethash_search_im0_cma_V0;
    bubble_out_i_scalarizer_0mul_ethash_search_im0_cma_data_reg_stall_in <= SE_out_bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_backStall;
    bubble_out_i_scalarizer_0mul_ethash_search_im0_cma_data_reg_data_in <= bubble_join_i_scalarizer_0mul_ethash_search_im0_cma_q;
    bubble_out_i_scalarizer_0mul_ethash_search_im0_cma_data_reg_valid_in_bitsignaltemp <= bubble_out_i_scalarizer_0mul_ethash_search_im0_cma_data_reg_valid_in(0);
    bubble_out_i_scalarizer_0mul_ethash_search_im0_cma_data_reg_stall_in_bitsignaltemp <= bubble_out_i_scalarizer_0mul_ethash_search_im0_cma_data_reg_stall_in(0);
    bubble_out_i_scalarizer_0mul_ethash_search_im0_cma_data_reg_valid_out(0) <= bubble_out_i_scalarizer_0mul_ethash_search_im0_cma_data_reg_valid_out_bitsignaltemp;
    bubble_out_i_scalarizer_0mul_ethash_search_im0_cma_data_reg_stall_out(0) <= bubble_out_i_scalarizer_0mul_ethash_search_im0_cma_data_reg_stall_out_bitsignaltemp;
    thebubble_out_i_scalarizer_0mul_ethash_search_im0_cma_data_reg : acl_data_fifo
    GENERIC MAP (
        DEPTH => 3,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 36,
        IMPL => "zl_reg"
    )
    PORT MAP (
        valid_in => bubble_out_i_scalarizer_0mul_ethash_search_im0_cma_data_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_scalarizer_0mul_ethash_search_im0_cma_data_reg_stall_in_bitsignaltemp,
        data_in => bubble_join_i_scalarizer_0mul_ethash_search_im0_cma_q,
        valid_out => bubble_out_i_scalarizer_0mul_ethash_search_im0_cma_data_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_scalarizer_0mul_ethash_search_im0_cma_data_reg_stall_out_bitsignaltemp,
        data_out => bubble_out_i_scalarizer_0mul_ethash_search_im0_cma_data_reg_data_out,
        clock => clock,
        resetn => resetn
    );

    -- i_scalarizer_0mul_ethash_search_bs4(BITSELECT,226)@1
    i_scalarizer_0mul_ethash_search_bs4_b <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_c(31 downto 18));

    -- i_scalarizer_0mul_ethash_search_bjB6_q_const(CONSTANT,557)
    i_scalarizer_0mul_ethash_search_bjB6_q_const_q <= "0000000000110010011";

    -- i_scalarizer_0mul_ethash_search_bs2_merged_bit_select_c_const(CONSTANT,558)
    i_scalarizer_0mul_ethash_search_bs2_merged_bit_select_c_const_q <= "1000000";

    -- i_scalarizer_0mul_ethash_search_bs7(BITSELECT,229)@1
    i_scalarizer_0mul_ethash_search_bs7_in <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_c(17 downto 0));
    i_scalarizer_0mul_ethash_search_bs7_b <= STD_LOGIC_VECTOR(i_scalarizer_0mul_ethash_search_bs7_in(17 downto 0));

    -- i_scalarizer_0mul_ethash_search_bjA8(BITJOIN,230)@1
    i_scalarizer_0mul_ethash_search_bjA8_q <= GND_q & i_scalarizer_0mul_ethash_search_bs7_b;

    -- i_scalarizer_0mul_ethash_search_ma3_cma(CHAINMULTADD,549)@1 + 3
    i_scalarizer_0mul_ethash_search_ma3_cma_reset <= not (resetn);
    i_scalarizer_0mul_ethash_search_ma3_cma_ena0 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_backEN(0);
    i_scalarizer_0mul_ethash_search_ma3_cma_ena1 <= i_scalarizer_0mul_ethash_search_ma3_cma_ena0;
    i_scalarizer_0mul_ethash_search_ma3_cma_ena2 <= i_scalarizer_0mul_ethash_search_ma3_cma_ena0;
    i_scalarizer_0mul_ethash_search_ma3_cma_r(0) <= SIGNED(RESIZE(i_scalarizer_0mul_ethash_search_ma3_cma_c1(0),15));
    i_scalarizer_0mul_ethash_search_ma3_cma_r(1) <= SIGNED(RESIZE(i_scalarizer_0mul_ethash_search_ma3_cma_c1(1),15));
    i_scalarizer_0mul_ethash_search_ma3_cma_p(0) <= i_scalarizer_0mul_ethash_search_ma3_cma_a1(0) * i_scalarizer_0mul_ethash_search_ma3_cma_r(0);
    i_scalarizer_0mul_ethash_search_ma3_cma_p(1) <= i_scalarizer_0mul_ethash_search_ma3_cma_a1(1) * i_scalarizer_0mul_ethash_search_ma3_cma_r(1);
    i_scalarizer_0mul_ethash_search_ma3_cma_u(0) <= RESIZE(i_scalarizer_0mul_ethash_search_ma3_cma_p(0),35);
    i_scalarizer_0mul_ethash_search_ma3_cma_u(1) <= RESIZE(i_scalarizer_0mul_ethash_search_ma3_cma_p(1),35);
    i_scalarizer_0mul_ethash_search_ma3_cma_w(0) <= i_scalarizer_0mul_ethash_search_ma3_cma_u(0) + i_scalarizer_0mul_ethash_search_ma3_cma_u(1);
    i_scalarizer_0mul_ethash_search_ma3_cma_x(0) <= i_scalarizer_0mul_ethash_search_ma3_cma_w(0);
    i_scalarizer_0mul_ethash_search_ma3_cma_y(0) <= i_scalarizer_0mul_ethash_search_ma3_cma_x(0);
    i_scalarizer_0mul_ethash_search_ma3_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_scalarizer_0mul_ethash_search_ma3_cma_a0 <= (others => (others => '0'));
            i_scalarizer_0mul_ethash_search_ma3_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_scalarizer_0mul_ethash_search_ma3_cma_ena0 = '1') THEN
                i_scalarizer_0mul_ethash_search_ma3_cma_a0(0) <= RESIZE(SIGNED(i_scalarizer_0mul_ethash_search_bjA8_q),19);
                i_scalarizer_0mul_ethash_search_ma3_cma_a0(1) <= RESIZE(SIGNED(i_scalarizer_0mul_ethash_search_bjB6_q_const_q),19);
                i_scalarizer_0mul_ethash_search_ma3_cma_c0(0) <= RESIZE(UNSIGNED(i_scalarizer_0mul_ethash_search_bs2_merged_bit_select_c_const_q),14);
                i_scalarizer_0mul_ethash_search_ma3_cma_c0(1) <= RESIZE(UNSIGNED(i_scalarizer_0mul_ethash_search_bs4_b),14);
            END IF;
        END IF;
    END PROCESS;
    i_scalarizer_0mul_ethash_search_ma3_cma_chainmultadd_pipe: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_scalarizer_0mul_ethash_search_ma3_cma_a1 <= (others => (others => '0'));
            i_scalarizer_0mul_ethash_search_ma3_cma_c1 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_scalarizer_0mul_ethash_search_ma3_cma_ena2 = '1') THEN
                i_scalarizer_0mul_ethash_search_ma3_cma_a1 <= i_scalarizer_0mul_ethash_search_ma3_cma_a0;
                i_scalarizer_0mul_ethash_search_ma3_cma_c1 <= i_scalarizer_0mul_ethash_search_ma3_cma_c0;
            END IF;
        END IF;
    END PROCESS;
    i_scalarizer_0mul_ethash_search_ma3_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_scalarizer_0mul_ethash_search_ma3_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_scalarizer_0mul_ethash_search_ma3_cma_ena1 = '1') THEN
                i_scalarizer_0mul_ethash_search_ma3_cma_s(0) <= i_scalarizer_0mul_ethash_search_ma3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_scalarizer_0mul_ethash_search_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_scalarizer_0mul_ethash_search_ma3_cma_s(0)(33 downto 0)), xout => i_scalarizer_0mul_ethash_search_ma3_cma_qq, ena => SE_i_scalarizer_0mul_ethash_search_im0_cma_backEN(0), clk => clock, aclr => resetn );
    i_scalarizer_0mul_ethash_search_ma3_cma_q <= STD_LOGIC_VECTOR(i_scalarizer_0mul_ethash_search_ma3_cma_qq(33 downto 0));

    -- bubble_join_i_scalarizer_0mul_ethash_search_ma3_cma(BITJOIN,741)
    bubble_join_i_scalarizer_0mul_ethash_search_ma3_cma_q <= i_scalarizer_0mul_ethash_search_ma3_cma_q;

    -- bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_reg(STALLFIFO,1538)
    bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_reg_valid_in <= SE_i_scalarizer_0mul_ethash_search_im0_cma_V4;
    bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_reg_stall_in <= SE_out_bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_backStall;
    bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_reg_data_in <= bubble_join_i_scalarizer_0mul_ethash_search_ma3_cma_q;
    bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_reg_valid_in_bitsignaltemp <= bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_reg_valid_in(0);
    bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_reg_stall_in_bitsignaltemp <= bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_reg_stall_in(0);
    bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_reg_valid_out(0) <= bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_reg_valid_out_bitsignaltemp;
    bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_reg_stall_out(0) <= bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_reg_stall_out_bitsignaltemp;
    thebubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_reg : acl_data_fifo
    GENERIC MAP (
        DEPTH => 3,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 34,
        IMPL => "zl_reg"
    )
    PORT MAP (
        valid_in => bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_reg_stall_in_bitsignaltemp,
        data_in => bubble_join_i_scalarizer_0mul_ethash_search_ma3_cma_q,
        valid_out => bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_reg_stall_out_bitsignaltemp,
        data_out => bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_reg_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data(STALLENABLE,1269)
    -- Valid signal propagation
    SE_out_bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_V0 <= SE_out_bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_backStall <= redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo_stall_out or not (SE_out_bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_and0 <= bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_reg_valid_out;
    SE_out_bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_and1 <= bubble_out_i_scalarizer_0mul_ethash_search_im0_cma_data_reg_valid_out and SE_out_bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_and0;
    SE_out_bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_wireValid <= SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_V3 and SE_out_bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_and1;

    -- i_scalarizer_1mul_ethash_search_bs1(BITSELECT,240)@1
    i_scalarizer_1mul_ethash_search_bs1_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_e(17 downto 0);
    i_scalarizer_1mul_ethash_search_bs1_b <= i_scalarizer_1mul_ethash_search_bs1_in(17 downto 0);

    -- i_scalarizer_1mul_ethash_search_im0_cma(CHAINMULTADD,546)@1 + 3
    i_scalarizer_1mul_ethash_search_im0_cma_reset <= not (resetn);
    i_scalarizer_1mul_ethash_search_im0_cma_ena0 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_backEN(0);
    i_scalarizer_1mul_ethash_search_im0_cma_ena1 <= i_scalarizer_1mul_ethash_search_im0_cma_ena0;
    i_scalarizer_1mul_ethash_search_im0_cma_ena2 <= i_scalarizer_1mul_ethash_search_im0_cma_ena0;
    -- altera synthesis_off
    i_scalarizer_1mul_ethash_search_im0_cma_k0 <= (
        0 => TO_UNSIGNED(403,18),
        others => (others => '0'));
    -- altera synthesis_on
    i_scalarizer_1mul_ethash_search_im0_cma_r(0) <= i_scalarizer_1mul_ethash_search_im0_cma_k0(TO_INTEGER(i_scalarizer_1mul_ethash_search_im0_cma_c1(0)));
    i_scalarizer_1mul_ethash_search_im0_cma_p(0) <= i_scalarizer_1mul_ethash_search_im0_cma_a1(0) * i_scalarizer_1mul_ethash_search_im0_cma_r(0);
    i_scalarizer_1mul_ethash_search_im0_cma_u(0) <= RESIZE(i_scalarizer_1mul_ethash_search_im0_cma_p(0),36);
    i_scalarizer_1mul_ethash_search_im0_cma_w(0) <= i_scalarizer_1mul_ethash_search_im0_cma_u(0);
    i_scalarizer_1mul_ethash_search_im0_cma_x(0) <= i_scalarizer_1mul_ethash_search_im0_cma_w(0);
    i_scalarizer_1mul_ethash_search_im0_cma_y(0) <= i_scalarizer_1mul_ethash_search_im0_cma_x(0);
    i_scalarizer_1mul_ethash_search_im0_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_scalarizer_1mul_ethash_search_im0_cma_a0 <= (others => (others => '0'));
            i_scalarizer_1mul_ethash_search_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_scalarizer_1mul_ethash_search_im0_cma_ena0 = '1') THEN
                i_scalarizer_1mul_ethash_search_im0_cma_a0(0) <= RESIZE(UNSIGNED(i_scalarizer_1mul_ethash_search_bs1_b),18);
                i_scalarizer_1mul_ethash_search_im0_cma_c0(0) <= RESIZE(UNSIGNED(GND_q),3);
            END IF;
        END IF;
    END PROCESS;
    i_scalarizer_1mul_ethash_search_im0_cma_chainmultadd_pipe: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_scalarizer_1mul_ethash_search_im0_cma_a1 <= (others => (others => '0'));
            i_scalarizer_1mul_ethash_search_im0_cma_c1 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_scalarizer_1mul_ethash_search_im0_cma_ena2 = '1') THEN
                i_scalarizer_1mul_ethash_search_im0_cma_a1 <= i_scalarizer_1mul_ethash_search_im0_cma_a0;
                i_scalarizer_1mul_ethash_search_im0_cma_c1 <= i_scalarizer_1mul_ethash_search_im0_cma_c0;
            END IF;
        END IF;
    END PROCESS;
    i_scalarizer_1mul_ethash_search_im0_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_scalarizer_1mul_ethash_search_im0_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_scalarizer_1mul_ethash_search_im0_cma_ena1 = '1') THEN
                i_scalarizer_1mul_ethash_search_im0_cma_s(0) <= i_scalarizer_1mul_ethash_search_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_scalarizer_1mul_ethash_search_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_scalarizer_1mul_ethash_search_im0_cma_s(0)(35 downto 0)), xout => i_scalarizer_1mul_ethash_search_im0_cma_qq, ena => SE_i_scalarizer_0mul_ethash_search_im0_cma_backEN(0), clk => clock, aclr => resetn );
    i_scalarizer_1mul_ethash_search_im0_cma_q <= STD_LOGIC_VECTOR(i_scalarizer_1mul_ethash_search_im0_cma_qq(35 downto 0));

    -- bubble_join_i_scalarizer_1mul_ethash_search_im0_cma(BITJOIN,732)
    bubble_join_i_scalarizer_1mul_ethash_search_im0_cma_q <= i_scalarizer_1mul_ethash_search_im0_cma_q;

    -- bubble_out_i_scalarizer_1mul_ethash_search_im0_cma_data_reg(STALLFIFO,1535)
    bubble_out_i_scalarizer_1mul_ethash_search_im0_cma_data_reg_valid_in <= SE_i_scalarizer_0mul_ethash_search_im0_cma_V1;
    bubble_out_i_scalarizer_1mul_ethash_search_im0_cma_data_reg_stall_in <= SE_out_bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_backStall;
    bubble_out_i_scalarizer_1mul_ethash_search_im0_cma_data_reg_data_in <= bubble_join_i_scalarizer_1mul_ethash_search_im0_cma_q;
    bubble_out_i_scalarizer_1mul_ethash_search_im0_cma_data_reg_valid_in_bitsignaltemp <= bubble_out_i_scalarizer_1mul_ethash_search_im0_cma_data_reg_valid_in(0);
    bubble_out_i_scalarizer_1mul_ethash_search_im0_cma_data_reg_stall_in_bitsignaltemp <= bubble_out_i_scalarizer_1mul_ethash_search_im0_cma_data_reg_stall_in(0);
    bubble_out_i_scalarizer_1mul_ethash_search_im0_cma_data_reg_valid_out(0) <= bubble_out_i_scalarizer_1mul_ethash_search_im0_cma_data_reg_valid_out_bitsignaltemp;
    bubble_out_i_scalarizer_1mul_ethash_search_im0_cma_data_reg_stall_out(0) <= bubble_out_i_scalarizer_1mul_ethash_search_im0_cma_data_reg_stall_out_bitsignaltemp;
    thebubble_out_i_scalarizer_1mul_ethash_search_im0_cma_data_reg : acl_data_fifo
    GENERIC MAP (
        DEPTH => 3,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 36,
        IMPL => "zl_reg"
    )
    PORT MAP (
        valid_in => bubble_out_i_scalarizer_1mul_ethash_search_im0_cma_data_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_scalarizer_1mul_ethash_search_im0_cma_data_reg_stall_in_bitsignaltemp,
        data_in => bubble_join_i_scalarizer_1mul_ethash_search_im0_cma_q,
        valid_out => bubble_out_i_scalarizer_1mul_ethash_search_im0_cma_data_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_scalarizer_1mul_ethash_search_im0_cma_data_reg_stall_out_bitsignaltemp,
        data_out => bubble_out_i_scalarizer_1mul_ethash_search_im0_cma_data_reg_data_out,
        clock => clock,
        resetn => resetn
    );

    -- i_scalarizer_1mul_ethash_search_bs4(BITSELECT,243)@1
    i_scalarizer_1mul_ethash_search_bs4_b <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_e(31 downto 18));

    -- i_scalarizer_1mul_ethash_search_bs7(BITSELECT,246)@1
    i_scalarizer_1mul_ethash_search_bs7_in <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_e(17 downto 0));
    i_scalarizer_1mul_ethash_search_bs7_b <= STD_LOGIC_VECTOR(i_scalarizer_1mul_ethash_search_bs7_in(17 downto 0));

    -- i_scalarizer_1mul_ethash_search_bjA8(BITJOIN,247)@1
    i_scalarizer_1mul_ethash_search_bjA8_q <= GND_q & i_scalarizer_1mul_ethash_search_bs7_b;

    -- i_scalarizer_1mul_ethash_search_ma3_cma(CHAINMULTADD,550)@1 + 3
    i_scalarizer_1mul_ethash_search_ma3_cma_reset <= not (resetn);
    i_scalarizer_1mul_ethash_search_ma3_cma_ena0 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_backEN(0);
    i_scalarizer_1mul_ethash_search_ma3_cma_ena1 <= i_scalarizer_1mul_ethash_search_ma3_cma_ena0;
    i_scalarizer_1mul_ethash_search_ma3_cma_ena2 <= i_scalarizer_1mul_ethash_search_ma3_cma_ena0;
    i_scalarizer_1mul_ethash_search_ma3_cma_r(0) <= SIGNED(RESIZE(i_scalarizer_1mul_ethash_search_ma3_cma_c1(0),15));
    i_scalarizer_1mul_ethash_search_ma3_cma_r(1) <= SIGNED(RESIZE(i_scalarizer_1mul_ethash_search_ma3_cma_c1(1),15));
    i_scalarizer_1mul_ethash_search_ma3_cma_p(0) <= i_scalarizer_1mul_ethash_search_ma3_cma_a1(0) * i_scalarizer_1mul_ethash_search_ma3_cma_r(0);
    i_scalarizer_1mul_ethash_search_ma3_cma_p(1) <= i_scalarizer_1mul_ethash_search_ma3_cma_a1(1) * i_scalarizer_1mul_ethash_search_ma3_cma_r(1);
    i_scalarizer_1mul_ethash_search_ma3_cma_u(0) <= RESIZE(i_scalarizer_1mul_ethash_search_ma3_cma_p(0),35);
    i_scalarizer_1mul_ethash_search_ma3_cma_u(1) <= RESIZE(i_scalarizer_1mul_ethash_search_ma3_cma_p(1),35);
    i_scalarizer_1mul_ethash_search_ma3_cma_w(0) <= i_scalarizer_1mul_ethash_search_ma3_cma_u(0) + i_scalarizer_1mul_ethash_search_ma3_cma_u(1);
    i_scalarizer_1mul_ethash_search_ma3_cma_x(0) <= i_scalarizer_1mul_ethash_search_ma3_cma_w(0);
    i_scalarizer_1mul_ethash_search_ma3_cma_y(0) <= i_scalarizer_1mul_ethash_search_ma3_cma_x(0);
    i_scalarizer_1mul_ethash_search_ma3_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_scalarizer_1mul_ethash_search_ma3_cma_a0 <= (others => (others => '0'));
            i_scalarizer_1mul_ethash_search_ma3_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_scalarizer_1mul_ethash_search_ma3_cma_ena0 = '1') THEN
                i_scalarizer_1mul_ethash_search_ma3_cma_a0(0) <= RESIZE(SIGNED(i_scalarizer_1mul_ethash_search_bjA8_q),19);
                i_scalarizer_1mul_ethash_search_ma3_cma_a0(1) <= RESIZE(SIGNED(i_scalarizer_0mul_ethash_search_bjB6_q_const_q),19);
                i_scalarizer_1mul_ethash_search_ma3_cma_c0(0) <= RESIZE(UNSIGNED(i_scalarizer_0mul_ethash_search_bs2_merged_bit_select_c_const_q),14);
                i_scalarizer_1mul_ethash_search_ma3_cma_c0(1) <= RESIZE(UNSIGNED(i_scalarizer_1mul_ethash_search_bs4_b),14);
            END IF;
        END IF;
    END PROCESS;
    i_scalarizer_1mul_ethash_search_ma3_cma_chainmultadd_pipe: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_scalarizer_1mul_ethash_search_ma3_cma_a1 <= (others => (others => '0'));
            i_scalarizer_1mul_ethash_search_ma3_cma_c1 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_scalarizer_1mul_ethash_search_ma3_cma_ena2 = '1') THEN
                i_scalarizer_1mul_ethash_search_ma3_cma_a1 <= i_scalarizer_1mul_ethash_search_ma3_cma_a0;
                i_scalarizer_1mul_ethash_search_ma3_cma_c1 <= i_scalarizer_1mul_ethash_search_ma3_cma_c0;
            END IF;
        END IF;
    END PROCESS;
    i_scalarizer_1mul_ethash_search_ma3_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_scalarizer_1mul_ethash_search_ma3_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_scalarizer_1mul_ethash_search_ma3_cma_ena1 = '1') THEN
                i_scalarizer_1mul_ethash_search_ma3_cma_s(0) <= i_scalarizer_1mul_ethash_search_ma3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_scalarizer_1mul_ethash_search_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_scalarizer_1mul_ethash_search_ma3_cma_s(0)(33 downto 0)), xout => i_scalarizer_1mul_ethash_search_ma3_cma_qq, ena => SE_i_scalarizer_0mul_ethash_search_im0_cma_backEN(0), clk => clock, aclr => resetn );
    i_scalarizer_1mul_ethash_search_ma3_cma_q <= STD_LOGIC_VECTOR(i_scalarizer_1mul_ethash_search_ma3_cma_qq(33 downto 0));

    -- bubble_join_i_scalarizer_1mul_ethash_search_ma3_cma(BITJOIN,744)
    bubble_join_i_scalarizer_1mul_ethash_search_ma3_cma_q <= i_scalarizer_1mul_ethash_search_ma3_cma_q;

    -- bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_reg(STALLFIFO,1539)
    bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_reg_valid_in <= SE_i_scalarizer_0mul_ethash_search_im0_cma_V5;
    bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_reg_stall_in <= SE_out_bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_backStall;
    bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_reg_data_in <= bubble_join_i_scalarizer_1mul_ethash_search_ma3_cma_q;
    bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_reg_valid_in_bitsignaltemp <= bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_reg_valid_in(0);
    bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_reg_stall_in_bitsignaltemp <= bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_reg_stall_in(0);
    bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_reg_valid_out(0) <= bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_reg_valid_out_bitsignaltemp;
    bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_reg_stall_out(0) <= bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_reg_stall_out_bitsignaltemp;
    thebubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_reg : acl_data_fifo
    GENERIC MAP (
        DEPTH => 3,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 34,
        IMPL => "zl_reg"
    )
    PORT MAP (
        valid_in => bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_reg_stall_in_bitsignaltemp,
        data_in => bubble_join_i_scalarizer_1mul_ethash_search_ma3_cma_q,
        valid_out => bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_reg_stall_out_bitsignaltemp,
        data_out => bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_reg_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data(STALLENABLE,1273)
    -- Valid signal propagation
    SE_out_bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_V0 <= SE_out_bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_backStall <= redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo_stall_out or not (SE_out_bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_and0 <= bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_reg_valid_out;
    SE_out_bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_and1 <= bubble_out_i_scalarizer_1mul_ethash_search_im0_cma_data_reg_valid_out and SE_out_bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_and0;
    SE_out_bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_wireValid <= SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_V2 and SE_out_bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_and1;

    -- i_scalarizer_2mul_ethash_search_bs1(BITSELECT,257)@1
    i_scalarizer_2mul_ethash_search_bs1_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_g(17 downto 0);
    i_scalarizer_2mul_ethash_search_bs1_b <= i_scalarizer_2mul_ethash_search_bs1_in(17 downto 0);

    -- i_scalarizer_2mul_ethash_search_im0_cma(CHAINMULTADD,547)@1 + 3
    i_scalarizer_2mul_ethash_search_im0_cma_reset <= not (resetn);
    i_scalarizer_2mul_ethash_search_im0_cma_ena0 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_backEN(0);
    i_scalarizer_2mul_ethash_search_im0_cma_ena1 <= i_scalarizer_2mul_ethash_search_im0_cma_ena0;
    i_scalarizer_2mul_ethash_search_im0_cma_ena2 <= i_scalarizer_2mul_ethash_search_im0_cma_ena0;
    -- altera synthesis_off
    i_scalarizer_2mul_ethash_search_im0_cma_k0 <= (
        0 => TO_UNSIGNED(403,18),
        others => (others => '0'));
    -- altera synthesis_on
    i_scalarizer_2mul_ethash_search_im0_cma_r(0) <= i_scalarizer_2mul_ethash_search_im0_cma_k0(TO_INTEGER(i_scalarizer_2mul_ethash_search_im0_cma_c1(0)));
    i_scalarizer_2mul_ethash_search_im0_cma_p(0) <= i_scalarizer_2mul_ethash_search_im0_cma_a1(0) * i_scalarizer_2mul_ethash_search_im0_cma_r(0);
    i_scalarizer_2mul_ethash_search_im0_cma_u(0) <= RESIZE(i_scalarizer_2mul_ethash_search_im0_cma_p(0),36);
    i_scalarizer_2mul_ethash_search_im0_cma_w(0) <= i_scalarizer_2mul_ethash_search_im0_cma_u(0);
    i_scalarizer_2mul_ethash_search_im0_cma_x(0) <= i_scalarizer_2mul_ethash_search_im0_cma_w(0);
    i_scalarizer_2mul_ethash_search_im0_cma_y(0) <= i_scalarizer_2mul_ethash_search_im0_cma_x(0);
    i_scalarizer_2mul_ethash_search_im0_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_scalarizer_2mul_ethash_search_im0_cma_a0 <= (others => (others => '0'));
            i_scalarizer_2mul_ethash_search_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_scalarizer_2mul_ethash_search_im0_cma_ena0 = '1') THEN
                i_scalarizer_2mul_ethash_search_im0_cma_a0(0) <= RESIZE(UNSIGNED(i_scalarizer_2mul_ethash_search_bs1_b),18);
                i_scalarizer_2mul_ethash_search_im0_cma_c0(0) <= RESIZE(UNSIGNED(GND_q),3);
            END IF;
        END IF;
    END PROCESS;
    i_scalarizer_2mul_ethash_search_im0_cma_chainmultadd_pipe: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_scalarizer_2mul_ethash_search_im0_cma_a1 <= (others => (others => '0'));
            i_scalarizer_2mul_ethash_search_im0_cma_c1 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_scalarizer_2mul_ethash_search_im0_cma_ena2 = '1') THEN
                i_scalarizer_2mul_ethash_search_im0_cma_a1 <= i_scalarizer_2mul_ethash_search_im0_cma_a0;
                i_scalarizer_2mul_ethash_search_im0_cma_c1 <= i_scalarizer_2mul_ethash_search_im0_cma_c0;
            END IF;
        END IF;
    END PROCESS;
    i_scalarizer_2mul_ethash_search_im0_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_scalarizer_2mul_ethash_search_im0_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_scalarizer_2mul_ethash_search_im0_cma_ena1 = '1') THEN
                i_scalarizer_2mul_ethash_search_im0_cma_s(0) <= i_scalarizer_2mul_ethash_search_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_scalarizer_2mul_ethash_search_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_scalarizer_2mul_ethash_search_im0_cma_s(0)(35 downto 0)), xout => i_scalarizer_2mul_ethash_search_im0_cma_qq, ena => SE_i_scalarizer_0mul_ethash_search_im0_cma_backEN(0), clk => clock, aclr => resetn );
    i_scalarizer_2mul_ethash_search_im0_cma_q <= STD_LOGIC_VECTOR(i_scalarizer_2mul_ethash_search_im0_cma_qq(35 downto 0));

    -- bubble_join_i_scalarizer_2mul_ethash_search_im0_cma(BITJOIN,735)
    bubble_join_i_scalarizer_2mul_ethash_search_im0_cma_q <= i_scalarizer_2mul_ethash_search_im0_cma_q;

    -- bubble_out_i_scalarizer_2mul_ethash_search_im0_cma_data_reg(STALLFIFO,1536)
    bubble_out_i_scalarizer_2mul_ethash_search_im0_cma_data_reg_valid_in <= SE_i_scalarizer_0mul_ethash_search_im0_cma_V2;
    bubble_out_i_scalarizer_2mul_ethash_search_im0_cma_data_reg_stall_in <= SE_out_bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_backStall;
    bubble_out_i_scalarizer_2mul_ethash_search_im0_cma_data_reg_data_in <= bubble_join_i_scalarizer_2mul_ethash_search_im0_cma_q;
    bubble_out_i_scalarizer_2mul_ethash_search_im0_cma_data_reg_valid_in_bitsignaltemp <= bubble_out_i_scalarizer_2mul_ethash_search_im0_cma_data_reg_valid_in(0);
    bubble_out_i_scalarizer_2mul_ethash_search_im0_cma_data_reg_stall_in_bitsignaltemp <= bubble_out_i_scalarizer_2mul_ethash_search_im0_cma_data_reg_stall_in(0);
    bubble_out_i_scalarizer_2mul_ethash_search_im0_cma_data_reg_valid_out(0) <= bubble_out_i_scalarizer_2mul_ethash_search_im0_cma_data_reg_valid_out_bitsignaltemp;
    bubble_out_i_scalarizer_2mul_ethash_search_im0_cma_data_reg_stall_out(0) <= bubble_out_i_scalarizer_2mul_ethash_search_im0_cma_data_reg_stall_out_bitsignaltemp;
    thebubble_out_i_scalarizer_2mul_ethash_search_im0_cma_data_reg : acl_data_fifo
    GENERIC MAP (
        DEPTH => 3,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 36,
        IMPL => "zl_reg"
    )
    PORT MAP (
        valid_in => bubble_out_i_scalarizer_2mul_ethash_search_im0_cma_data_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_scalarizer_2mul_ethash_search_im0_cma_data_reg_stall_in_bitsignaltemp,
        data_in => bubble_join_i_scalarizer_2mul_ethash_search_im0_cma_q,
        valid_out => bubble_out_i_scalarizer_2mul_ethash_search_im0_cma_data_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_scalarizer_2mul_ethash_search_im0_cma_data_reg_stall_out_bitsignaltemp,
        data_out => bubble_out_i_scalarizer_2mul_ethash_search_im0_cma_data_reg_data_out,
        clock => clock,
        resetn => resetn
    );

    -- i_scalarizer_2mul_ethash_search_bs4(BITSELECT,260)@1
    i_scalarizer_2mul_ethash_search_bs4_b <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_g(31 downto 18));

    -- i_scalarizer_2mul_ethash_search_bs7(BITSELECT,263)@1
    i_scalarizer_2mul_ethash_search_bs7_in <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_g(17 downto 0));
    i_scalarizer_2mul_ethash_search_bs7_b <= STD_LOGIC_VECTOR(i_scalarizer_2mul_ethash_search_bs7_in(17 downto 0));

    -- i_scalarizer_2mul_ethash_search_bjA8(BITJOIN,264)@1
    i_scalarizer_2mul_ethash_search_bjA8_q <= GND_q & i_scalarizer_2mul_ethash_search_bs7_b;

    -- i_scalarizer_2mul_ethash_search_ma3_cma(CHAINMULTADD,551)@1 + 3
    i_scalarizer_2mul_ethash_search_ma3_cma_reset <= not (resetn);
    i_scalarizer_2mul_ethash_search_ma3_cma_ena0 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_backEN(0);
    i_scalarizer_2mul_ethash_search_ma3_cma_ena1 <= i_scalarizer_2mul_ethash_search_ma3_cma_ena0;
    i_scalarizer_2mul_ethash_search_ma3_cma_ena2 <= i_scalarizer_2mul_ethash_search_ma3_cma_ena0;
    i_scalarizer_2mul_ethash_search_ma3_cma_r(0) <= SIGNED(RESIZE(i_scalarizer_2mul_ethash_search_ma3_cma_c1(0),15));
    i_scalarizer_2mul_ethash_search_ma3_cma_r(1) <= SIGNED(RESIZE(i_scalarizer_2mul_ethash_search_ma3_cma_c1(1),15));
    i_scalarizer_2mul_ethash_search_ma3_cma_p(0) <= i_scalarizer_2mul_ethash_search_ma3_cma_a1(0) * i_scalarizer_2mul_ethash_search_ma3_cma_r(0);
    i_scalarizer_2mul_ethash_search_ma3_cma_p(1) <= i_scalarizer_2mul_ethash_search_ma3_cma_a1(1) * i_scalarizer_2mul_ethash_search_ma3_cma_r(1);
    i_scalarizer_2mul_ethash_search_ma3_cma_u(0) <= RESIZE(i_scalarizer_2mul_ethash_search_ma3_cma_p(0),35);
    i_scalarizer_2mul_ethash_search_ma3_cma_u(1) <= RESIZE(i_scalarizer_2mul_ethash_search_ma3_cma_p(1),35);
    i_scalarizer_2mul_ethash_search_ma3_cma_w(0) <= i_scalarizer_2mul_ethash_search_ma3_cma_u(0) + i_scalarizer_2mul_ethash_search_ma3_cma_u(1);
    i_scalarizer_2mul_ethash_search_ma3_cma_x(0) <= i_scalarizer_2mul_ethash_search_ma3_cma_w(0);
    i_scalarizer_2mul_ethash_search_ma3_cma_y(0) <= i_scalarizer_2mul_ethash_search_ma3_cma_x(0);
    i_scalarizer_2mul_ethash_search_ma3_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_scalarizer_2mul_ethash_search_ma3_cma_a0 <= (others => (others => '0'));
            i_scalarizer_2mul_ethash_search_ma3_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_scalarizer_2mul_ethash_search_ma3_cma_ena0 = '1') THEN
                i_scalarizer_2mul_ethash_search_ma3_cma_a0(0) <= RESIZE(SIGNED(i_scalarizer_2mul_ethash_search_bjA8_q),19);
                i_scalarizer_2mul_ethash_search_ma3_cma_a0(1) <= RESIZE(SIGNED(i_scalarizer_0mul_ethash_search_bjB6_q_const_q),19);
                i_scalarizer_2mul_ethash_search_ma3_cma_c0(0) <= RESIZE(UNSIGNED(i_scalarizer_0mul_ethash_search_bs2_merged_bit_select_c_const_q),14);
                i_scalarizer_2mul_ethash_search_ma3_cma_c0(1) <= RESIZE(UNSIGNED(i_scalarizer_2mul_ethash_search_bs4_b),14);
            END IF;
        END IF;
    END PROCESS;
    i_scalarizer_2mul_ethash_search_ma3_cma_chainmultadd_pipe: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_scalarizer_2mul_ethash_search_ma3_cma_a1 <= (others => (others => '0'));
            i_scalarizer_2mul_ethash_search_ma3_cma_c1 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_scalarizer_2mul_ethash_search_ma3_cma_ena2 = '1') THEN
                i_scalarizer_2mul_ethash_search_ma3_cma_a1 <= i_scalarizer_2mul_ethash_search_ma3_cma_a0;
                i_scalarizer_2mul_ethash_search_ma3_cma_c1 <= i_scalarizer_2mul_ethash_search_ma3_cma_c0;
            END IF;
        END IF;
    END PROCESS;
    i_scalarizer_2mul_ethash_search_ma3_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_scalarizer_2mul_ethash_search_ma3_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_scalarizer_2mul_ethash_search_ma3_cma_ena1 = '1') THEN
                i_scalarizer_2mul_ethash_search_ma3_cma_s(0) <= i_scalarizer_2mul_ethash_search_ma3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_scalarizer_2mul_ethash_search_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_scalarizer_2mul_ethash_search_ma3_cma_s(0)(33 downto 0)), xout => i_scalarizer_2mul_ethash_search_ma3_cma_qq, ena => SE_i_scalarizer_0mul_ethash_search_im0_cma_backEN(0), clk => clock, aclr => resetn );
    i_scalarizer_2mul_ethash_search_ma3_cma_q <= STD_LOGIC_VECTOR(i_scalarizer_2mul_ethash_search_ma3_cma_qq(33 downto 0));

    -- bubble_join_i_scalarizer_2mul_ethash_search_ma3_cma(BITJOIN,747)
    bubble_join_i_scalarizer_2mul_ethash_search_ma3_cma_q <= i_scalarizer_2mul_ethash_search_ma3_cma_q;

    -- bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_reg(STALLFIFO,1540)
    bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_reg_valid_in <= SE_i_scalarizer_0mul_ethash_search_im0_cma_V6;
    bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_reg_stall_in <= SE_out_bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_backStall;
    bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_reg_data_in <= bubble_join_i_scalarizer_2mul_ethash_search_ma3_cma_q;
    bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_reg_valid_in_bitsignaltemp <= bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_reg_valid_in(0);
    bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_reg_stall_in_bitsignaltemp <= bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_reg_stall_in(0);
    bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_reg_valid_out(0) <= bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_reg_valid_out_bitsignaltemp;
    bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_reg_stall_out(0) <= bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_reg_stall_out_bitsignaltemp;
    thebubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_reg : acl_data_fifo
    GENERIC MAP (
        DEPTH => 3,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 34,
        IMPL => "zl_reg"
    )
    PORT MAP (
        valid_in => bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_reg_stall_in_bitsignaltemp,
        data_in => bubble_join_i_scalarizer_2mul_ethash_search_ma3_cma_q,
        valid_out => bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_reg_stall_out_bitsignaltemp,
        data_out => bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_reg_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data(STALLENABLE,1277)
    -- Valid signal propagation
    SE_out_bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_V0 <= SE_out_bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_backStall <= redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo_stall_out or not (SE_out_bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_and0 <= bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_reg_valid_out;
    SE_out_bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_and1 <= bubble_out_i_scalarizer_2mul_ethash_search_im0_cma_data_reg_valid_out and SE_out_bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_and0;
    SE_out_bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_wireValid <= SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_V1 and SE_out_bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_and1;

    -- i_scalarizer_3mul_ethash_search_bs1(BITSELECT,274)@1
    i_scalarizer_3mul_ethash_search_bs1_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_h(17 downto 0);
    i_scalarizer_3mul_ethash_search_bs1_b <= i_scalarizer_3mul_ethash_search_bs1_in(17 downto 0);

    -- i_scalarizer_3mul_ethash_search_im0_cma(CHAINMULTADD,548)@1 + 3
    i_scalarizer_3mul_ethash_search_im0_cma_reset <= not (resetn);
    i_scalarizer_3mul_ethash_search_im0_cma_ena0 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_backEN(0);
    i_scalarizer_3mul_ethash_search_im0_cma_ena1 <= i_scalarizer_3mul_ethash_search_im0_cma_ena0;
    i_scalarizer_3mul_ethash_search_im0_cma_ena2 <= i_scalarizer_3mul_ethash_search_im0_cma_ena0;
    -- altera synthesis_off
    i_scalarizer_3mul_ethash_search_im0_cma_k0 <= (
        0 => TO_UNSIGNED(403,18),
        others => (others => '0'));
    -- altera synthesis_on
    i_scalarizer_3mul_ethash_search_im0_cma_r(0) <= i_scalarizer_3mul_ethash_search_im0_cma_k0(TO_INTEGER(i_scalarizer_3mul_ethash_search_im0_cma_c1(0)));
    i_scalarizer_3mul_ethash_search_im0_cma_p(0) <= i_scalarizer_3mul_ethash_search_im0_cma_a1(0) * i_scalarizer_3mul_ethash_search_im0_cma_r(0);
    i_scalarizer_3mul_ethash_search_im0_cma_u(0) <= RESIZE(i_scalarizer_3mul_ethash_search_im0_cma_p(0),36);
    i_scalarizer_3mul_ethash_search_im0_cma_w(0) <= i_scalarizer_3mul_ethash_search_im0_cma_u(0);
    i_scalarizer_3mul_ethash_search_im0_cma_x(0) <= i_scalarizer_3mul_ethash_search_im0_cma_w(0);
    i_scalarizer_3mul_ethash_search_im0_cma_y(0) <= i_scalarizer_3mul_ethash_search_im0_cma_x(0);
    i_scalarizer_3mul_ethash_search_im0_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_scalarizer_3mul_ethash_search_im0_cma_a0 <= (others => (others => '0'));
            i_scalarizer_3mul_ethash_search_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_scalarizer_3mul_ethash_search_im0_cma_ena0 = '1') THEN
                i_scalarizer_3mul_ethash_search_im0_cma_a0(0) <= RESIZE(UNSIGNED(i_scalarizer_3mul_ethash_search_bs1_b),18);
                i_scalarizer_3mul_ethash_search_im0_cma_c0(0) <= RESIZE(UNSIGNED(GND_q),3);
            END IF;
        END IF;
    END PROCESS;
    i_scalarizer_3mul_ethash_search_im0_cma_chainmultadd_pipe: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_scalarizer_3mul_ethash_search_im0_cma_a1 <= (others => (others => '0'));
            i_scalarizer_3mul_ethash_search_im0_cma_c1 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_scalarizer_3mul_ethash_search_im0_cma_ena2 = '1') THEN
                i_scalarizer_3mul_ethash_search_im0_cma_a1 <= i_scalarizer_3mul_ethash_search_im0_cma_a0;
                i_scalarizer_3mul_ethash_search_im0_cma_c1 <= i_scalarizer_3mul_ethash_search_im0_cma_c0;
            END IF;
        END IF;
    END PROCESS;
    i_scalarizer_3mul_ethash_search_im0_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_scalarizer_3mul_ethash_search_im0_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_scalarizer_3mul_ethash_search_im0_cma_ena1 = '1') THEN
                i_scalarizer_3mul_ethash_search_im0_cma_s(0) <= i_scalarizer_3mul_ethash_search_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_scalarizer_3mul_ethash_search_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_scalarizer_3mul_ethash_search_im0_cma_s(0)(35 downto 0)), xout => i_scalarizer_3mul_ethash_search_im0_cma_qq, ena => SE_i_scalarizer_0mul_ethash_search_im0_cma_backEN(0), clk => clock, aclr => resetn );
    i_scalarizer_3mul_ethash_search_im0_cma_q <= STD_LOGIC_VECTOR(i_scalarizer_3mul_ethash_search_im0_cma_qq(35 downto 0));

    -- bubble_join_i_scalarizer_3mul_ethash_search_im0_cma(BITJOIN,738)
    bubble_join_i_scalarizer_3mul_ethash_search_im0_cma_q <= i_scalarizer_3mul_ethash_search_im0_cma_q;

    -- bubble_out_i_scalarizer_3mul_ethash_search_im0_cma_data_reg(STALLFIFO,1537)
    bubble_out_i_scalarizer_3mul_ethash_search_im0_cma_data_reg_valid_in <= SE_i_scalarizer_0mul_ethash_search_im0_cma_V3;
    bubble_out_i_scalarizer_3mul_ethash_search_im0_cma_data_reg_stall_in <= SE_out_bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_backStall;
    bubble_out_i_scalarizer_3mul_ethash_search_im0_cma_data_reg_data_in <= bubble_join_i_scalarizer_3mul_ethash_search_im0_cma_q;
    bubble_out_i_scalarizer_3mul_ethash_search_im0_cma_data_reg_valid_in_bitsignaltemp <= bubble_out_i_scalarizer_3mul_ethash_search_im0_cma_data_reg_valid_in(0);
    bubble_out_i_scalarizer_3mul_ethash_search_im0_cma_data_reg_stall_in_bitsignaltemp <= bubble_out_i_scalarizer_3mul_ethash_search_im0_cma_data_reg_stall_in(0);
    bubble_out_i_scalarizer_3mul_ethash_search_im0_cma_data_reg_valid_out(0) <= bubble_out_i_scalarizer_3mul_ethash_search_im0_cma_data_reg_valid_out_bitsignaltemp;
    bubble_out_i_scalarizer_3mul_ethash_search_im0_cma_data_reg_stall_out(0) <= bubble_out_i_scalarizer_3mul_ethash_search_im0_cma_data_reg_stall_out_bitsignaltemp;
    thebubble_out_i_scalarizer_3mul_ethash_search_im0_cma_data_reg : acl_data_fifo
    GENERIC MAP (
        DEPTH => 3,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 36,
        IMPL => "zl_reg"
    )
    PORT MAP (
        valid_in => bubble_out_i_scalarizer_3mul_ethash_search_im0_cma_data_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_scalarizer_3mul_ethash_search_im0_cma_data_reg_stall_in_bitsignaltemp,
        data_in => bubble_join_i_scalarizer_3mul_ethash_search_im0_cma_q,
        valid_out => bubble_out_i_scalarizer_3mul_ethash_search_im0_cma_data_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_scalarizer_3mul_ethash_search_im0_cma_data_reg_stall_out_bitsignaltemp,
        data_out => bubble_out_i_scalarizer_3mul_ethash_search_im0_cma_data_reg_data_out,
        clock => clock,
        resetn => resetn
    );

    -- i_scalarizer_3mul_ethash_search_bs4(BITSELECT,277)@1
    i_scalarizer_3mul_ethash_search_bs4_b <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_h(31 downto 18));

    -- i_scalarizer_3mul_ethash_search_bs7(BITSELECT,280)@1
    i_scalarizer_3mul_ethash_search_bs7_in <= STD_LOGIC_VECTOR(bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_h(17 downto 0));
    i_scalarizer_3mul_ethash_search_bs7_b <= STD_LOGIC_VECTOR(i_scalarizer_3mul_ethash_search_bs7_in(17 downto 0));

    -- i_scalarizer_3mul_ethash_search_bjA8(BITJOIN,281)@1
    i_scalarizer_3mul_ethash_search_bjA8_q <= GND_q & i_scalarizer_3mul_ethash_search_bs7_b;

    -- i_scalarizer_3mul_ethash_search_ma3_cma(CHAINMULTADD,552)@1 + 3
    i_scalarizer_3mul_ethash_search_ma3_cma_reset <= not (resetn);
    i_scalarizer_3mul_ethash_search_ma3_cma_ena0 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_backEN(0);
    i_scalarizer_3mul_ethash_search_ma3_cma_ena1 <= i_scalarizer_3mul_ethash_search_ma3_cma_ena0;
    i_scalarizer_3mul_ethash_search_ma3_cma_ena2 <= i_scalarizer_3mul_ethash_search_ma3_cma_ena0;
    i_scalarizer_3mul_ethash_search_ma3_cma_r(0) <= SIGNED(RESIZE(i_scalarizer_3mul_ethash_search_ma3_cma_c1(0),15));
    i_scalarizer_3mul_ethash_search_ma3_cma_r(1) <= SIGNED(RESIZE(i_scalarizer_3mul_ethash_search_ma3_cma_c1(1),15));
    i_scalarizer_3mul_ethash_search_ma3_cma_p(0) <= i_scalarizer_3mul_ethash_search_ma3_cma_a1(0) * i_scalarizer_3mul_ethash_search_ma3_cma_r(0);
    i_scalarizer_3mul_ethash_search_ma3_cma_p(1) <= i_scalarizer_3mul_ethash_search_ma3_cma_a1(1) * i_scalarizer_3mul_ethash_search_ma3_cma_r(1);
    i_scalarizer_3mul_ethash_search_ma3_cma_u(0) <= RESIZE(i_scalarizer_3mul_ethash_search_ma3_cma_p(0),35);
    i_scalarizer_3mul_ethash_search_ma3_cma_u(1) <= RESIZE(i_scalarizer_3mul_ethash_search_ma3_cma_p(1),35);
    i_scalarizer_3mul_ethash_search_ma3_cma_w(0) <= i_scalarizer_3mul_ethash_search_ma3_cma_u(0) + i_scalarizer_3mul_ethash_search_ma3_cma_u(1);
    i_scalarizer_3mul_ethash_search_ma3_cma_x(0) <= i_scalarizer_3mul_ethash_search_ma3_cma_w(0);
    i_scalarizer_3mul_ethash_search_ma3_cma_y(0) <= i_scalarizer_3mul_ethash_search_ma3_cma_x(0);
    i_scalarizer_3mul_ethash_search_ma3_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_scalarizer_3mul_ethash_search_ma3_cma_a0 <= (others => (others => '0'));
            i_scalarizer_3mul_ethash_search_ma3_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_scalarizer_3mul_ethash_search_ma3_cma_ena0 = '1') THEN
                i_scalarizer_3mul_ethash_search_ma3_cma_a0(0) <= RESIZE(SIGNED(i_scalarizer_3mul_ethash_search_bjA8_q),19);
                i_scalarizer_3mul_ethash_search_ma3_cma_a0(1) <= RESIZE(SIGNED(i_scalarizer_0mul_ethash_search_bjB6_q_const_q),19);
                i_scalarizer_3mul_ethash_search_ma3_cma_c0(0) <= RESIZE(UNSIGNED(i_scalarizer_0mul_ethash_search_bs2_merged_bit_select_c_const_q),14);
                i_scalarizer_3mul_ethash_search_ma3_cma_c0(1) <= RESIZE(UNSIGNED(i_scalarizer_3mul_ethash_search_bs4_b),14);
            END IF;
        END IF;
    END PROCESS;
    i_scalarizer_3mul_ethash_search_ma3_cma_chainmultadd_pipe: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_scalarizer_3mul_ethash_search_ma3_cma_a1 <= (others => (others => '0'));
            i_scalarizer_3mul_ethash_search_ma3_cma_c1 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_scalarizer_3mul_ethash_search_ma3_cma_ena2 = '1') THEN
                i_scalarizer_3mul_ethash_search_ma3_cma_a1 <= i_scalarizer_3mul_ethash_search_ma3_cma_a0;
                i_scalarizer_3mul_ethash_search_ma3_cma_c1 <= i_scalarizer_3mul_ethash_search_ma3_cma_c0;
            END IF;
        END IF;
    END PROCESS;
    i_scalarizer_3mul_ethash_search_ma3_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_scalarizer_3mul_ethash_search_ma3_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_scalarizer_3mul_ethash_search_ma3_cma_ena1 = '1') THEN
                i_scalarizer_3mul_ethash_search_ma3_cma_s(0) <= i_scalarizer_3mul_ethash_search_ma3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_scalarizer_3mul_ethash_search_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_scalarizer_3mul_ethash_search_ma3_cma_s(0)(33 downto 0)), xout => i_scalarizer_3mul_ethash_search_ma3_cma_qq, ena => SE_i_scalarizer_0mul_ethash_search_im0_cma_backEN(0), clk => clock, aclr => resetn );
    i_scalarizer_3mul_ethash_search_ma3_cma_q <= STD_LOGIC_VECTOR(i_scalarizer_3mul_ethash_search_ma3_cma_qq(33 downto 0));

    -- bubble_join_i_scalarizer_3mul_ethash_search_ma3_cma(BITJOIN,750)
    bubble_join_i_scalarizer_3mul_ethash_search_ma3_cma_q <= i_scalarizer_3mul_ethash_search_ma3_cma_q;

    -- bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_reg(STALLFIFO,1541)
    bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_reg_valid_in <= SE_i_scalarizer_0mul_ethash_search_im0_cma_V7;
    bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_reg_stall_in <= SE_out_bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_backStall;
    bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_reg_data_in <= bubble_join_i_scalarizer_3mul_ethash_search_ma3_cma_q;
    bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_reg_valid_in_bitsignaltemp <= bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_reg_valid_in(0);
    bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_reg_stall_in_bitsignaltemp <= bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_reg_stall_in(0);
    bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_reg_valid_out(0) <= bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_reg_valid_out_bitsignaltemp;
    bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_reg_stall_out(0) <= bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_reg_stall_out_bitsignaltemp;
    thebubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_reg : acl_data_fifo
    GENERIC MAP (
        DEPTH => 3,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 34,
        IMPL => "zl_reg"
    )
    PORT MAP (
        valid_in => bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_reg_stall_in_bitsignaltemp,
        data_in => bubble_join_i_scalarizer_3mul_ethash_search_ma3_cma_q,
        valid_out => bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_reg_stall_out_bitsignaltemp,
        data_out => bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_reg_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data(STALLENABLE,1281)
    -- Valid signal propagation
    SE_out_bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_V0 <= SE_out_bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_backStall <= redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo_stall_out or not (SE_out_bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_and0 <= bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_reg_valid_out;
    SE_out_bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_and1 <= bubble_out_i_scalarizer_3mul_ethash_search_im0_cma_data_reg_valid_out and SE_out_bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_and0;
    SE_out_bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_wireValid <= SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_V0 and SE_out_bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_and1;

    -- SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2(STALLENABLE,1079)
    -- Valid signal propagation
    SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_V0 <= SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_R_v_0;
    SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_V1 <= SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_R_v_1;
    SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_V2 <= SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_R_v_2;
    SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_V3 <= SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_R_v_3;
    -- Stall signal propagation
    SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_s_tv_0 <= SE_out_bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_backStall and SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_R_v_0;
    SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_s_tv_1 <= SE_out_bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_backStall and SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_R_v_1;
    SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_s_tv_2 <= SE_out_bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_backStall and SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_R_v_2;
    SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_s_tv_3 <= SE_out_bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_backStall and SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_R_v_3;
    -- Backward Enable generation
    SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_or0 <= SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_s_tv_0;
    SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_or1 <= SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_s_tv_1 or SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_or0;
    SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_or2 <= SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_s_tv_2 or SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_or1;
    SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_backEN <= not (SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_s_tv_3 or SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_or2);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_v_s_0 <= SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_backEN and SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1_V0;
    -- Backward Stall generation
    SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_backStall <= not (SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_v_s_0);
    SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_R_v_0 <= (others => '0');
            SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_R_v_1 <= (others => '0');
            SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_R_v_2 <= (others => '0');
            SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_R_v_3 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_backEN = "0") THEN
                SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_R_v_0 <= SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_R_v_0 and SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_s_tv_0;
            ELSE
                SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_R_v_0 <= SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_v_s_0;
            END IF;

            IF (SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_backEN = "0") THEN
                SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_R_v_1 <= SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_R_v_1 and SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_s_tv_1;
            ELSE
                SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_R_v_1 <= SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_v_s_0;
            END IF;

            IF (SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_backEN = "0") THEN
                SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_R_v_2 <= SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_R_v_2 and SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_s_tv_2;
            ELSE
                SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_R_v_2 <= SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_v_s_0;
            END IF;

            IF (SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_backEN = "0") THEN
                SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_R_v_3 <= SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_R_v_3 and SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_s_tv_3;
            ELSE
                SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_R_v_3 <= SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1(STALLENABLE,1078)
    -- Valid signal propagation
    SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1_V0 <= SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1_R_v_0;
    -- Stall signal propagation
    SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1_s_tv_0 <= SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_backStall and SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1_R_v_0;
    -- Backward Enable generation
    SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1_backEN <= not (SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1_v_s_0 <= SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1_backEN and SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0_V0;
    -- Backward Stall generation
    SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1_backStall <= not (SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1_v_s_0);
    SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1_backEN = "0") THEN
                SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1_R_v_0 <= SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1_R_v_0 and SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1_s_tv_0;
            ELSE
                SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1_R_v_0 <= SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0(STALLENABLE,1077)
    -- Valid signal propagation
    SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0_V0 <= SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0_R_v_0;
    -- Stall signal propagation
    SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0_s_tv_0 <= SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1_backStall and SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0_R_v_0;
    -- Backward Enable generation
    SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0_backEN <= not (SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0_v_s_0 <= SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0_backEN and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V3;
    -- Backward Stall generation
    SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0_backStall <= not (SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0_v_s_0);
    SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0_backEN = "0") THEN
                SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0_R_v_0 <= SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0_R_v_0 and SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0_s_tv_0;
            ELSE
                SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0_R_v_0 <= SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_i_scalarizer_0mul_ethash_search_im0_cma(STALLENABLE,1067)
    -- Valid signal propagation
    SE_i_scalarizer_0mul_ethash_search_im0_cma_V0 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_0;
    SE_i_scalarizer_0mul_ethash_search_im0_cma_V1 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_1;
    SE_i_scalarizer_0mul_ethash_search_im0_cma_V2 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_2;
    SE_i_scalarizer_0mul_ethash_search_im0_cma_V3 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_3;
    SE_i_scalarizer_0mul_ethash_search_im0_cma_V4 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_4;
    SE_i_scalarizer_0mul_ethash_search_im0_cma_V5 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_5;
    SE_i_scalarizer_0mul_ethash_search_im0_cma_V6 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_6;
    SE_i_scalarizer_0mul_ethash_search_im0_cma_V7 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_7;
    -- Stall signal propagation
    SE_i_scalarizer_0mul_ethash_search_im0_cma_s_tv_0 <= bubble_out_i_scalarizer_0mul_ethash_search_im0_cma_data_reg_stall_out and SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_0;
    SE_i_scalarizer_0mul_ethash_search_im0_cma_s_tv_1 <= bubble_out_i_scalarizer_1mul_ethash_search_im0_cma_data_reg_stall_out and SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_1;
    SE_i_scalarizer_0mul_ethash_search_im0_cma_s_tv_2 <= bubble_out_i_scalarizer_2mul_ethash_search_im0_cma_data_reg_stall_out and SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_2;
    SE_i_scalarizer_0mul_ethash_search_im0_cma_s_tv_3 <= bubble_out_i_scalarizer_3mul_ethash_search_im0_cma_data_reg_stall_out and SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_3;
    SE_i_scalarizer_0mul_ethash_search_im0_cma_s_tv_4 <= bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_reg_stall_out and SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_4;
    SE_i_scalarizer_0mul_ethash_search_im0_cma_s_tv_5 <= bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_reg_stall_out and SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_5;
    SE_i_scalarizer_0mul_ethash_search_im0_cma_s_tv_6 <= bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_reg_stall_out and SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_6;
    SE_i_scalarizer_0mul_ethash_search_im0_cma_s_tv_7 <= bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_reg_stall_out and SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_7;
    -- Backward Enable generation
    SE_i_scalarizer_0mul_ethash_search_im0_cma_or0 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_s_tv_0;
    SE_i_scalarizer_0mul_ethash_search_im0_cma_or1 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_s_tv_1 or SE_i_scalarizer_0mul_ethash_search_im0_cma_or0;
    SE_i_scalarizer_0mul_ethash_search_im0_cma_or2 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_s_tv_2 or SE_i_scalarizer_0mul_ethash_search_im0_cma_or1;
    SE_i_scalarizer_0mul_ethash_search_im0_cma_or3 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_s_tv_3 or SE_i_scalarizer_0mul_ethash_search_im0_cma_or2;
    SE_i_scalarizer_0mul_ethash_search_im0_cma_or4 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_s_tv_4 or SE_i_scalarizer_0mul_ethash_search_im0_cma_or3;
    SE_i_scalarizer_0mul_ethash_search_im0_cma_or5 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_s_tv_5 or SE_i_scalarizer_0mul_ethash_search_im0_cma_or4;
    SE_i_scalarizer_0mul_ethash_search_im0_cma_or6 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_s_tv_6 or SE_i_scalarizer_0mul_ethash_search_im0_cma_or5;
    SE_i_scalarizer_0mul_ethash_search_im0_cma_backEN <= not (SE_i_scalarizer_0mul_ethash_search_im0_cma_s_tv_7 or SE_i_scalarizer_0mul_ethash_search_im0_cma_or6);
    -- Determine whether to write valid data into the first register stage
    SE_i_scalarizer_0mul_ethash_search_im0_cma_v_s_0 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_backEN and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V2;
    -- Backward Stall generation
    SE_i_scalarizer_0mul_ethash_search_im0_cma_backStall <= not (SE_i_scalarizer_0mul_ethash_search_im0_cma_v_s_0);
    SE_i_scalarizer_0mul_ethash_search_im0_cma_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_scalarizer_0mul_ethash_search_im0_cma_R_s_0 <= (others => '0');
            SE_i_scalarizer_0mul_ethash_search_im0_cma_R_s_1 <= (others => '0');
            SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_0 <= (others => '0');
            SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_1 <= (others => '0');
            SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_2 <= (others => '0');
            SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_3 <= (others => '0');
            SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_4 <= (others => '0');
            SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_5 <= (others => '0');
            SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_6 <= (others => '0');
            SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_7 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_scalarizer_0mul_ethash_search_im0_cma_backEN = "1") THEN
                SE_i_scalarizer_0mul_ethash_search_im0_cma_R_s_0 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_v_s_0;
            END IF;

            IF (SE_i_scalarizer_0mul_ethash_search_im0_cma_backEN = "1") THEN
                SE_i_scalarizer_0mul_ethash_search_im0_cma_R_s_1 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_R_s_0;
            END IF;

            IF (SE_i_scalarizer_0mul_ethash_search_im0_cma_backEN = "0") THEN
                SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_0 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_0 and SE_i_scalarizer_0mul_ethash_search_im0_cma_s_tv_0;
            ELSE
                SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_0 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_R_s_1;
            END IF;

            IF (SE_i_scalarizer_0mul_ethash_search_im0_cma_backEN = "0") THEN
                SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_1 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_1 and SE_i_scalarizer_0mul_ethash_search_im0_cma_s_tv_1;
            ELSE
                SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_1 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_R_s_1;
            END IF;

            IF (SE_i_scalarizer_0mul_ethash_search_im0_cma_backEN = "0") THEN
                SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_2 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_2 and SE_i_scalarizer_0mul_ethash_search_im0_cma_s_tv_2;
            ELSE
                SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_2 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_R_s_1;
            END IF;

            IF (SE_i_scalarizer_0mul_ethash_search_im0_cma_backEN = "0") THEN
                SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_3 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_3 and SE_i_scalarizer_0mul_ethash_search_im0_cma_s_tv_3;
            ELSE
                SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_3 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_R_s_1;
            END IF;

            IF (SE_i_scalarizer_0mul_ethash_search_im0_cma_backEN = "0") THEN
                SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_4 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_4 and SE_i_scalarizer_0mul_ethash_search_im0_cma_s_tv_4;
            ELSE
                SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_4 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_R_s_1;
            END IF;

            IF (SE_i_scalarizer_0mul_ethash_search_im0_cma_backEN = "0") THEN
                SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_5 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_5 and SE_i_scalarizer_0mul_ethash_search_im0_cma_s_tv_5;
            ELSE
                SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_5 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_R_s_1;
            END IF;

            IF (SE_i_scalarizer_0mul_ethash_search_im0_cma_backEN = "0") THEN
                SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_6 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_6 and SE_i_scalarizer_0mul_ethash_search_im0_cma_s_tv_6;
            ELSE
                SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_6 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_R_s_1;
            END IF;

            IF (SE_i_scalarizer_0mul_ethash_search_im0_cma_backEN = "0") THEN
                SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_7 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_7 and SE_i_scalarizer_0mul_ethash_search_im0_cma_s_tv_7;
            ELSE
                SE_i_scalarizer_0mul_ethash_search_im0_cma_R_v_7 <= SE_i_scalarizer_0mul_ethash_search_im0_cma_R_s_1;
            END IF;

        END IF;
    END PROCESS;

    -- i_sfc_c0_for_body61_ethash_search_c0_enter23_ethash_search_aunroll_vunroll_x(BLACKBOX,5)@1
    -- in in_i_stall@20000000
    -- out out_c0_exit29_0@38
    -- out out_c0_exit29_1@38
    -- out out_o_stall@20000000
    -- out out_o_valid@38
    thei_sfc_c0_for_body61_ethash_search_c0_enter23_ethash_search_aunroll_vunroll_x : i_sfc_c0_for_body61_ethash_search_c0_enter23_ethash_search
    PORT MAP (
        in_c0_eni422_0 => GND_q,
        in_c0_eni422_0_1 => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_c,
        in_c0_eni422_1_1 => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_e,
        in_c0_eni422_2 => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_i,
        in_c0_eni422_2_1 => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_g,
        in_c0_eni422_3 => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_d,
        in_c0_eni422_3_1 => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_h,
        in_c0_eni422_4 => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_2,
        in_i_stall => SE_rightShiftStage0_uid211_i_shr62_ethash_search_ethash_search252_shift_x_backStall,
        in_i_valid => SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V1,
        out_c0_exit29_1 => i_sfc_c0_for_body61_ethash_search_c0_enter23_ethash_search_aunroll_vunroll_x_out_c0_exit29_1,
        out_o_stall => i_sfc_c0_for_body61_ethash_search_c0_enter23_ethash_search_aunroll_vunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_for_body61_ethash_search_c0_enter23_ethash_search_aunroll_vunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1_reg(STALLFIFO,1532)
    bubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1_reg_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V0;
    bubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1_reg_stall_in <= SE_out_bubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1_backStall;
    bubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1_reg_valid_in_bitsignaltemp <= bubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1_reg_valid_in(0);
    bubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1_reg_stall_in_bitsignaltemp <= bubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1_reg_stall_in(0);
    bubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1_reg_valid_out(0) <= bubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1_reg_valid_out_bitsignaltemp;
    bubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1_reg_stall_out(0) <= bubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1_reg_stall_out_bitsignaltemp;
    thebubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 231,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x(STALLENABLE,939)
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg0 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg1 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg2 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg3 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg4 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg5 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg6 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg7 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg8 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg9 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg10 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg11 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg12 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg13 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg14 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg15 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg16 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg17 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg18 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg19 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg20 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg21 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg22 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg23 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg24 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg25 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg26 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg27 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg28 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg29 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg30 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg31 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg32 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg33 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg34 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg35 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg36 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg37 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg38 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg39 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg40 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg41 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg42 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg43 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg44 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg45 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg46 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg47 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg48 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg49 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg50 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg51 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg52 <= (others => '0');
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg53 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg0 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg0;
            -- Succesor 1
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg1 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg1;
            -- Succesor 2
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg2 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg2;
            -- Succesor 3
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg3 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg3;
            -- Succesor 4
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg4 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg4;
            -- Succesor 5
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg5 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg5;
            -- Succesor 6
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg6 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg6;
            -- Succesor 7
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg7 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg7;
            -- Succesor 8
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg8 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg8;
            -- Succesor 9
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg9 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg9;
            -- Succesor 10
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg10 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg10;
            -- Succesor 11
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg11 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg11;
            -- Succesor 12
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg12 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg12;
            -- Succesor 13
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg13 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg13;
            -- Succesor 14
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg14 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg14;
            -- Succesor 15
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg15 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg15;
            -- Succesor 16
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg16 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg16;
            -- Succesor 17
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg17 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg17;
            -- Succesor 18
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg18 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg18;
            -- Succesor 19
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg19 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg19;
            -- Succesor 20
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg20 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg20;
            -- Succesor 21
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg21 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg21;
            -- Succesor 22
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg22 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg22;
            -- Succesor 23
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg23 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg23;
            -- Succesor 24
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg24 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg24;
            -- Succesor 25
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg25 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg25;
            -- Succesor 26
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg26 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg26;
            -- Succesor 27
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg27 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg27;
            -- Succesor 28
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg28 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg28;
            -- Succesor 29
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg29 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg29;
            -- Succesor 30
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg30 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg30;
            -- Succesor 31
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg31 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg31;
            -- Succesor 32
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg32 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg32;
            -- Succesor 33
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg33 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg33;
            -- Succesor 34
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg34 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg34;
            -- Succesor 35
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg35 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg35;
            -- Succesor 36
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg36 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg36;
            -- Succesor 37
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg37 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg37;
            -- Succesor 38
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg38 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg38;
            -- Succesor 39
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg39 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg39;
            -- Succesor 40
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg40 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg40;
            -- Succesor 41
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg41 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg41;
            -- Succesor 42
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg42 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg42;
            -- Succesor 43
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg43 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg43;
            -- Succesor 44
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg44 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg44;
            -- Succesor 45
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg45 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg45;
            -- Succesor 46
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg46 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg46;
            -- Succesor 47
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg47 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg47;
            -- Succesor 48
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg48 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg48;
            -- Succesor 49
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg49 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg49;
            -- Succesor 50
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg50 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg50;
            -- Succesor 51
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg51 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg51;
            -- Succesor 52
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg52 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg52;
            -- Succesor 53
            SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg53 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg53;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed0 <= (not (bubble_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_1_reg_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg0;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed1 <= (not (i_sfc_c0_for_body61_ethash_search_c0_enter23_ethash_search_aunroll_vunroll_x_out_o_stall) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg1;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed2 <= (not (SE_i_scalarizer_0mul_ethash_search_im0_cma_backStall) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg2;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed3 <= (not (SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0_backStall) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg3;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed4 <= (not (redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg4;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed5 <= (not (redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg5;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed6 <= (not (redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg6;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed7 <= (not (redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg7;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed8 <= (not (redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg8;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed9 <= (not (redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg9;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed10 <= (not (redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg10;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed11 <= (not (redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg11;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed12 <= (not (redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg12;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed13 <= (not (redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg13;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed14 <= (not (redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg14;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed15 <= (not (redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg15;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed16 <= (not (redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg16;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed17 <= (not (redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg17;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed18 <= (not (redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg18;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed19 <= (not (redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg19;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed20 <= (not (redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg20;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed21 <= (not (redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg21;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed22 <= (not (redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg22;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed23 <= (not (redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg23;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed24 <= (not (redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg24;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed25 <= (not (redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg25;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed26 <= (not (redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg26;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed27 <= (not (redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg27;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed28 <= (not (redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg28;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed29 <= (not (redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg29;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed30 <= (not (redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg30;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed31 <= (not (redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg31;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed32 <= (not (redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg32;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed33 <= (not (redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg33;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed34 <= (not (redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg34;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed35 <= (not (redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg35;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed36 <= (not (redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg36;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed37 <= (not (redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg37;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed38 <= (not (redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg38;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed39 <= (not (redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg39;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed40 <= (not (redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg40;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed41 <= (not (redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg41;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed42 <= (not (redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg42;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed43 <= (not (redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg43;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed44 <= (not (redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg44;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed45 <= (not (redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg45;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed46 <= (not (redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg46;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed47 <= (not (redist56_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_37_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg47;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed48 <= (not (redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg48;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed49 <= (not (redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg49;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed50 <= (not (redist61_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_37_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg50;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed51 <= (not (redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg51;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed52 <= (not (redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg52;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed53 <= (not (redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo_stall_out) and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid) or SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg53;
    -- Consuming
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_backStall and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg0 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed0;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg1 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed1;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg2 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed2;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg3 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed3;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg4 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed4;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg5 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed5;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg6 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed6;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg7 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed7;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg8 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed8;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg9 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed9;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg10 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed10;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg11 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed11;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg12 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed12;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg13 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed13;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg14 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed14;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg15 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed15;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg16 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed16;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg17 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed17;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg18 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed18;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg19 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed19;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg20 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed20;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg21 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed21;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg22 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed22;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg23 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed23;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg24 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed24;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg25 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed25;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg26 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed26;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg27 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed27;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg28 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed28;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg29 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed29;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg30 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed30;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg31 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed31;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg32 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed32;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg33 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed33;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg34 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed34;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg35 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed35;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg36 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed36;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg37 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed37;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg38 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed38;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg39 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed39;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg40 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed40;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg41 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed41;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg42 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed42;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg43 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed43;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg44 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed44;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg45 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed45;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg46 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed46;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg47 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed47;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg48 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed48;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg49 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed49;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg50 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed50;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg51 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed51;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg52 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed52;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_toReg53 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_StallValid and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed53;
    -- Backward Stall generation
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or0 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed0;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or1 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed1 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or0;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or2 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed2 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or1;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or3 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed3 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or2;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or4 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed4 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or3;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or5 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed5 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or4;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or6 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed6 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or5;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or7 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed7 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or6;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or8 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed8 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or7;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or9 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed9 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or8;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or10 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed10 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or9;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or11 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed11 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or10;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or12 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed12 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or11;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or13 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed13 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or12;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or14 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed14 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or13;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or15 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed15 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or14;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or16 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed16 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or15;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or17 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed17 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or16;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or18 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed18 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or17;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or19 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed19 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or18;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or20 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed20 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or19;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or21 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed21 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or20;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or22 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed22 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or21;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or23 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed23 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or22;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or24 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed24 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or23;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or25 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed25 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or24;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or26 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed26 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or25;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or27 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed27 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or26;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or28 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed28 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or27;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or29 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed29 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or28;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or30 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed30 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or29;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or31 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed31 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or30;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or32 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed32 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or31;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or33 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed33 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or32;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or34 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed34 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or33;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or35 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed35 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or34;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or36 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed36 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or35;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or37 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed37 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or36;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or38 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed38 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or37;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or39 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed39 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or38;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or40 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed40 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or39;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or41 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed41 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or40;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or42 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed42 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or41;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or43 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed43 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or42;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or44 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed44 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or43;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or45 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed45 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or44;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or46 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed46 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or45;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or47 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed47 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or46;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or48 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed48 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or47;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or49 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed49 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or48;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or50 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed50 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or49;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or51 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed51 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or50;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or52 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed52 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or51;
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireStall <= not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_consumed53 and SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_or52);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_backStall <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V0 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg0);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V1 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg1);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V2 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg2);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V3 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg3);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V4 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg4);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V5 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg5);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V6 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg6);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V7 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg7);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V8 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg8);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V9 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg9);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V10 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg10);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V11 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg11);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V12 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg12);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V13 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg13);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V14 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg14);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V15 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg15);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V16 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg16);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V17 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg17);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V18 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg18);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V19 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg19);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V20 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg20);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V21 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg21);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V22 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg22);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V23 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg23);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V24 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg24);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V25 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg25);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V26 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg26);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V27 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg27);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V28 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg28);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V29 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg29);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V30 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg30);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V31 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg31);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V32 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg32);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V33 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg33);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V34 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg34);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V35 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg35);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V36 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg36);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V37 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg37);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V38 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg38);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V39 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg39);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V40 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg40);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V41 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg41);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V42 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg42);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V43 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg43);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V44 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg44);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V45 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg45);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V46 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg46);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V47 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg47);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V48 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg48);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V49 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg49);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V50 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg50);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V51 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg51);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V52 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg52);
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V53 <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid and not (SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_fromReg53);
    -- Computing multiple Valid(s)
    SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_wireValid <= ethash_search_B4_merge_reg_aunroll_vunroll_x_out_valid_out;

    -- redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo(STALLFIFO,686)
    redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V44;
    redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_stall_in <= SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_backStall;
    redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_uu;
    redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_valid_in_bitsignaltemp <= redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_valid_in(0);
    redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_stall_in_bitsignaltemp <= redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_stall_in(0);
    redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_valid_out(0) <= redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_valid_out_bitsignaltemp;
    redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_stall_out(0) <= redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_stall_out_bitsignaltemp;
    theredist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 232,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_valid_in_bitsignaltemp,
        stall_in => redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_uu,
        valid_out => redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_valid_out_bitsignaltemp,
        stall_out => redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_stall_out_bitsignaltemp,
        data_out => redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo(BITJOIN,894)
    bubble_join_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_q <= redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_data_out;

    -- bubble_select_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo(BITSELECT,895)
    bubble_select_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_q(31 downto 0));

    -- i_idxprom80_rm_ethash_search_sel_x(BITSELECT,63)@232
    i_idxprom80_rm_ethash_search_sel_x_b <= std_logic_vector(resize(unsigned(bubble_select_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_b(31 downto 0)), 64));

    -- i_idxprom80_rm_ethash_search_vt_select_2(BITSELECT,116)@232
    i_idxprom80_rm_ethash_search_vt_select_2_b <= i_idxprom80_rm_ethash_search_sel_x_b(2 downto 0);

    -- i_idxprom80_rm_ethash_search_vt_join(BITJOIN,115)@232
    i_idxprom80_rm_ethash_search_vt_join_q <= i_idxprom80_rm_ethash_search_vt_const_63_q & i_idxprom80_rm_ethash_search_vt_select_2_b;

    -- SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo(STALLENABLE,1185)
    SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_fromReg0 <= (others => '0');
            SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_fromReg1 <= (others => '0');
            SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_fromReg2 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_fromReg0 <= SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_toReg0;
            -- Succesor 1
            SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_fromReg1 <= SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_toReg1;
            -- Succesor 2
            SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_fromReg2 <= SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_toReg2;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_consumed0 <= (not (redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo_stall_out) and SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_wireValid) or SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_fromReg0;
    SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_consumed1 <= (not (redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo_stall_out) and SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_wireValid) or SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_fromReg1;
    SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_consumed2 <= (not (SE_i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_extender_x_backStall) and SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_wireValid) or SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_fromReg2;
    -- Consuming
    SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_StallValid <= SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_backStall and SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_wireValid;
    SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_toReg0 <= SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_StallValid and SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_consumed0;
    SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_toReg1 <= SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_StallValid and SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_consumed1;
    SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_toReg2 <= SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_StallValid and SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_consumed2;
    -- Backward Stall generation
    SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_or0 <= SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_consumed0;
    SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_or1 <= SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_consumed1 and SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_or0;
    SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_wireStall <= not (SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_consumed2 and SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_or1);
    SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_backStall <= SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_V0 <= SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_wireValid and not (SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_fromReg0);
    SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_V1 <= SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_wireValid and not (SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_fromReg1);
    SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_V2 <= SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_wireValid and not (SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_fromReg2);
    -- Computing multiple Valid(s)
    SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_wireValid <= redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_valid_out;

    -- redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo(STALLFIFO,638)
    redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo_valid_in <= SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_V1;
    redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo_data_in <= i_idxprom80_rm_ethash_search_vt_join_q;
    redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo_valid_in_bitsignaltemp <= redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo_valid_in(0);
    redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo_stall_in_bitsignaltemp <= redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo_stall_in(0);
    redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo_valid_out(0) <= redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo_valid_out_bitsignaltemp;
    redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo_stall_out(0) <= redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo_stall_out_bitsignaltemp;
    theredist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 154,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo_valid_in_bitsignaltemp,
        stall_in => redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo_stall_in_bitsignaltemp,
        data_in => i_idxprom80_rm_ethash_search_vt_join_q,
        valid_out => redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo_valid_out_bitsignaltemp,
        stall_out => redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo_stall_out_bitsignaltemp,
        data_out => redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- i_scalarizer_0mul_ethash_search_multconst_x(CONSTANT,67)
    i_scalarizer_0mul_ethash_search_multconst_x_q <= "0000000";

    -- bubble_select_i_scalarizer_3mul_ethash_search_ma3_cma(BITSELECT,751)
    bubble_select_i_scalarizer_3mul_ethash_search_ma3_cma_b <= STD_LOGIC_VECTOR(bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_reg_data_out(33 downto 0));

    -- i_scalarizer_3mul_ethash_search_align_14(BITSHIFT,287)@4
    i_scalarizer_3mul_ethash_search_align_14_qint <= bubble_select_i_scalarizer_3mul_ethash_search_ma3_cma_b & "000000000000000000";
    i_scalarizer_3mul_ethash_search_align_14_q <= i_scalarizer_3mul_ethash_search_align_14_qint(51 downto 0);

    -- i_scalarizer_3mul_ethash_search_bs11(BITSELECT,284)@1
    i_scalarizer_3mul_ethash_search_bs11_b <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_h(31 downto 18);

    -- redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0(REG,626)
    redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0_q <= "00000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0_backEN = "1") THEN
                redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0_q <= STD_LOGIC_VECTOR(i_scalarizer_3mul_ethash_search_bs11_b);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1(REG,627)
    redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1_q <= "00000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1_backEN = "1") THEN
                redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1_q <= STD_LOGIC_VECTOR(redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2(REG,628)
    redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_q <= "00000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_backEN = "1") THEN
                redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_q <= STD_LOGIC_VECTOR(redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- i_scalarizer_3mul_ethash_search_im10_shift0(BITSHIFT,378)@4
    i_scalarizer_3mul_ethash_search_im10_shift0_qint <= redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_q & "000000";
    i_scalarizer_3mul_ethash_search_im10_shift0_q <= i_scalarizer_3mul_ethash_search_im10_shift0_qint(19 downto 0);

    -- bubble_select_i_scalarizer_3mul_ethash_search_im0_cma(BITSELECT,739)
    bubble_select_i_scalarizer_3mul_ethash_search_im0_cma_b <= STD_LOGIC_VECTOR(bubble_out_i_scalarizer_3mul_ethash_search_im0_cma_data_reg_data_out(35 downto 0));

    -- i_scalarizer_3mul_ethash_search_join_13(BITJOIN,286)@4
    i_scalarizer_3mul_ethash_search_join_13_q <= STD_LOGIC_VECTOR("0" & i_scalarizer_3mul_ethash_search_im10_shift0_q) & bubble_select_i_scalarizer_3mul_ethash_search_im0_cma_b;

    -- i_scalarizer_3mul_ethash_search_result_add_0_0(ADD,289)@4
    i_scalarizer_3mul_ethash_search_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & i_scalarizer_3mul_ethash_search_join_13_q));
    i_scalarizer_3mul_ethash_search_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((59 downto 52 => i_scalarizer_3mul_ethash_search_align_14_q(51)) & i_scalarizer_3mul_ethash_search_align_14_q));
    i_scalarizer_3mul_ethash_search_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(i_scalarizer_3mul_ethash_search_result_add_0_0_a) + SIGNED(i_scalarizer_3mul_ethash_search_result_add_0_0_b));
    i_scalarizer_3mul_ethash_search_result_add_0_0_q <= i_scalarizer_3mul_ethash_search_result_add_0_0_o(58 downto 0);

    -- i_scalarizer_3mul_ethash_search_extender_x(BITJOIN,72)@4
    i_scalarizer_3mul_ethash_search_extender_x_q <= i_scalarizer_0mul_ethash_search_multconst_x_q & i_scalarizer_3mul_ethash_search_result_add_0_0_q(56 downto 0);

    -- bgTrunc_i_scalarizer_3mul_ethash_search_sel_x(BITSELECT,13)@4
    bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b <= i_scalarizer_3mul_ethash_search_extender_x_q(31 downto 0);

    -- redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo(STALLFIFO,640)
    redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo_valid_in <= SE_out_bubble_out_i_scalarizer_3mul_ethash_search_ma3_cma_data_V0;
    redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo_data_in <= bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b;
    redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo_valid_in_bitsignaltemp <= redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo_valid_in(0);
    redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo_stall_in_bitsignaltemp <= redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo_stall_in(0);
    redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo_valid_out(0) <= redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo_valid_out_bitsignaltemp;
    redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo_stall_out(0) <= redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo_stall_out_bitsignaltemp;
    theredist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 382,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo_valid_in_bitsignaltemp,
        stall_in => redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo_stall_in_bitsignaltemp,
        data_in => bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b,
        valid_out => redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo_valid_out_bitsignaltemp,
        stall_out => redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo_stall_out_bitsignaltemp,
        data_out => redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_select_i_scalarizer_2mul_ethash_search_ma3_cma(BITSELECT,748)
    bubble_select_i_scalarizer_2mul_ethash_search_ma3_cma_b <= STD_LOGIC_VECTOR(bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_reg_data_out(33 downto 0));

    -- i_scalarizer_2mul_ethash_search_align_14(BITSHIFT,270)@4
    i_scalarizer_2mul_ethash_search_align_14_qint <= bubble_select_i_scalarizer_2mul_ethash_search_ma3_cma_b & "000000000000000000";
    i_scalarizer_2mul_ethash_search_align_14_q <= i_scalarizer_2mul_ethash_search_align_14_qint(51 downto 0);

    -- i_scalarizer_2mul_ethash_search_bs11(BITSELECT,267)@1
    i_scalarizer_2mul_ethash_search_bs11_b <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_g(31 downto 18);

    -- redist1_i_scalarizer_2mul_ethash_search_bs11_b_3_0(REG,629)
    redist1_i_scalarizer_2mul_ethash_search_bs11_b_3_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_scalarizer_2mul_ethash_search_bs11_b_3_0_q <= "00000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0_backEN = "1") THEN
                redist1_i_scalarizer_2mul_ethash_search_bs11_b_3_0_q <= STD_LOGIC_VECTOR(i_scalarizer_2mul_ethash_search_bs11_b);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_i_scalarizer_2mul_ethash_search_bs11_b_3_1(REG,630)
    redist1_i_scalarizer_2mul_ethash_search_bs11_b_3_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_scalarizer_2mul_ethash_search_bs11_b_3_1_q <= "00000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1_backEN = "1") THEN
                redist1_i_scalarizer_2mul_ethash_search_bs11_b_3_1_q <= STD_LOGIC_VECTOR(redist1_i_scalarizer_2mul_ethash_search_bs11_b_3_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_i_scalarizer_2mul_ethash_search_bs11_b_3_2(REG,631)
    redist1_i_scalarizer_2mul_ethash_search_bs11_b_3_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_scalarizer_2mul_ethash_search_bs11_b_3_2_q <= "00000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_backEN = "1") THEN
                redist1_i_scalarizer_2mul_ethash_search_bs11_b_3_2_q <= STD_LOGIC_VECTOR(redist1_i_scalarizer_2mul_ethash_search_bs11_b_3_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- i_scalarizer_2mul_ethash_search_im10_shift0(BITSHIFT,358)@4
    i_scalarizer_2mul_ethash_search_im10_shift0_qint <= redist1_i_scalarizer_2mul_ethash_search_bs11_b_3_2_q & "000000";
    i_scalarizer_2mul_ethash_search_im10_shift0_q <= i_scalarizer_2mul_ethash_search_im10_shift0_qint(19 downto 0);

    -- bubble_select_i_scalarizer_2mul_ethash_search_im0_cma(BITSELECT,736)
    bubble_select_i_scalarizer_2mul_ethash_search_im0_cma_b <= STD_LOGIC_VECTOR(bubble_out_i_scalarizer_2mul_ethash_search_im0_cma_data_reg_data_out(35 downto 0));

    -- i_scalarizer_2mul_ethash_search_join_13(BITJOIN,269)@4
    i_scalarizer_2mul_ethash_search_join_13_q <= STD_LOGIC_VECTOR("0" & i_scalarizer_2mul_ethash_search_im10_shift0_q) & bubble_select_i_scalarizer_2mul_ethash_search_im0_cma_b;

    -- i_scalarizer_2mul_ethash_search_result_add_0_0(ADD,272)@4
    i_scalarizer_2mul_ethash_search_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & i_scalarizer_2mul_ethash_search_join_13_q));
    i_scalarizer_2mul_ethash_search_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((59 downto 52 => i_scalarizer_2mul_ethash_search_align_14_q(51)) & i_scalarizer_2mul_ethash_search_align_14_q));
    i_scalarizer_2mul_ethash_search_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(i_scalarizer_2mul_ethash_search_result_add_0_0_a) + SIGNED(i_scalarizer_2mul_ethash_search_result_add_0_0_b));
    i_scalarizer_2mul_ethash_search_result_add_0_0_q <= i_scalarizer_2mul_ethash_search_result_add_0_0_o(58 downto 0);

    -- i_scalarizer_2mul_ethash_search_extender_x(BITJOIN,70)@4
    i_scalarizer_2mul_ethash_search_extender_x_q <= i_scalarizer_0mul_ethash_search_multconst_x_q & i_scalarizer_2mul_ethash_search_result_add_0_0_q(56 downto 0);

    -- bgTrunc_i_scalarizer_2mul_ethash_search_sel_x(BITSELECT,12)@4
    bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b <= i_scalarizer_2mul_ethash_search_extender_x_q(31 downto 0);

    -- redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo(STALLFIFO,641)
    redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo_valid_in <= SE_out_bubble_out_i_scalarizer_2mul_ethash_search_ma3_cma_data_V0;
    redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo_data_in <= bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b;
    redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo_valid_in_bitsignaltemp <= redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo_valid_in(0);
    redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo_stall_in_bitsignaltemp <= redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo_stall_in(0);
    redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo_valid_out(0) <= redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo_valid_out_bitsignaltemp;
    redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo_stall_out(0) <= redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo_stall_out_bitsignaltemp;
    theredist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 382,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo_valid_in_bitsignaltemp,
        stall_in => redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo_stall_in_bitsignaltemp,
        data_in => bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b,
        valid_out => redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo_valid_out_bitsignaltemp,
        stall_out => redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo_stall_out_bitsignaltemp,
        data_out => redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_select_i_scalarizer_1mul_ethash_search_ma3_cma(BITSELECT,745)
    bubble_select_i_scalarizer_1mul_ethash_search_ma3_cma_b <= STD_LOGIC_VECTOR(bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_reg_data_out(33 downto 0));

    -- i_scalarizer_1mul_ethash_search_align_14(BITSHIFT,253)@4
    i_scalarizer_1mul_ethash_search_align_14_qint <= bubble_select_i_scalarizer_1mul_ethash_search_ma3_cma_b & "000000000000000000";
    i_scalarizer_1mul_ethash_search_align_14_q <= i_scalarizer_1mul_ethash_search_align_14_qint(51 downto 0);

    -- i_scalarizer_1mul_ethash_search_bs11(BITSELECT,250)@1
    i_scalarizer_1mul_ethash_search_bs11_b <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_e(31 downto 18);

    -- redist2_i_scalarizer_1mul_ethash_search_bs11_b_3_0(REG,632)
    redist2_i_scalarizer_1mul_ethash_search_bs11_b_3_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_scalarizer_1mul_ethash_search_bs11_b_3_0_q <= "00000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0_backEN = "1") THEN
                redist2_i_scalarizer_1mul_ethash_search_bs11_b_3_0_q <= STD_LOGIC_VECTOR(i_scalarizer_1mul_ethash_search_bs11_b);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_i_scalarizer_1mul_ethash_search_bs11_b_3_1(REG,633)
    redist2_i_scalarizer_1mul_ethash_search_bs11_b_3_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_scalarizer_1mul_ethash_search_bs11_b_3_1_q <= "00000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1_backEN = "1") THEN
                redist2_i_scalarizer_1mul_ethash_search_bs11_b_3_1_q <= STD_LOGIC_VECTOR(redist2_i_scalarizer_1mul_ethash_search_bs11_b_3_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_i_scalarizer_1mul_ethash_search_bs11_b_3_2(REG,634)
    redist2_i_scalarizer_1mul_ethash_search_bs11_b_3_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_scalarizer_1mul_ethash_search_bs11_b_3_2_q <= "00000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_backEN = "1") THEN
                redist2_i_scalarizer_1mul_ethash_search_bs11_b_3_2_q <= STD_LOGIC_VECTOR(redist2_i_scalarizer_1mul_ethash_search_bs11_b_3_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- i_scalarizer_1mul_ethash_search_im10_shift0(BITSHIFT,338)@4
    i_scalarizer_1mul_ethash_search_im10_shift0_qint <= redist2_i_scalarizer_1mul_ethash_search_bs11_b_3_2_q & "000000";
    i_scalarizer_1mul_ethash_search_im10_shift0_q <= i_scalarizer_1mul_ethash_search_im10_shift0_qint(19 downto 0);

    -- bubble_select_i_scalarizer_1mul_ethash_search_im0_cma(BITSELECT,733)
    bubble_select_i_scalarizer_1mul_ethash_search_im0_cma_b <= STD_LOGIC_VECTOR(bubble_out_i_scalarizer_1mul_ethash_search_im0_cma_data_reg_data_out(35 downto 0));

    -- i_scalarizer_1mul_ethash_search_join_13(BITJOIN,252)@4
    i_scalarizer_1mul_ethash_search_join_13_q <= STD_LOGIC_VECTOR("0" & i_scalarizer_1mul_ethash_search_im10_shift0_q) & bubble_select_i_scalarizer_1mul_ethash_search_im0_cma_b;

    -- i_scalarizer_1mul_ethash_search_result_add_0_0(ADD,255)@4
    i_scalarizer_1mul_ethash_search_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & i_scalarizer_1mul_ethash_search_join_13_q));
    i_scalarizer_1mul_ethash_search_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((59 downto 52 => i_scalarizer_1mul_ethash_search_align_14_q(51)) & i_scalarizer_1mul_ethash_search_align_14_q));
    i_scalarizer_1mul_ethash_search_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(i_scalarizer_1mul_ethash_search_result_add_0_0_a) + SIGNED(i_scalarizer_1mul_ethash_search_result_add_0_0_b));
    i_scalarizer_1mul_ethash_search_result_add_0_0_q <= i_scalarizer_1mul_ethash_search_result_add_0_0_o(58 downto 0);

    -- i_scalarizer_1mul_ethash_search_extender_x(BITJOIN,68)@4
    i_scalarizer_1mul_ethash_search_extender_x_q <= i_scalarizer_0mul_ethash_search_multconst_x_q & i_scalarizer_1mul_ethash_search_result_add_0_0_q(56 downto 0);

    -- bgTrunc_i_scalarizer_1mul_ethash_search_sel_x(BITSELECT,11)@4
    bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b <= i_scalarizer_1mul_ethash_search_extender_x_q(31 downto 0);

    -- redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo(STALLFIFO,642)
    redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo_valid_in <= SE_out_bubble_out_i_scalarizer_1mul_ethash_search_ma3_cma_data_V0;
    redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo_data_in <= bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b;
    redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo_valid_in_bitsignaltemp <= redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo_valid_in(0);
    redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo_stall_in_bitsignaltemp <= redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo_stall_in(0);
    redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo_valid_out(0) <= redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo_valid_out_bitsignaltemp;
    redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo_stall_out(0) <= redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo_stall_out_bitsignaltemp;
    theredist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 382,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo_valid_in_bitsignaltemp,
        stall_in => redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo_stall_in_bitsignaltemp,
        data_in => bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b,
        valid_out => redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo_valid_out_bitsignaltemp,
        stall_out => redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo_stall_out_bitsignaltemp,
        data_out => redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_select_i_scalarizer_0mul_ethash_search_ma3_cma(BITSELECT,742)
    bubble_select_i_scalarizer_0mul_ethash_search_ma3_cma_b <= STD_LOGIC_VECTOR(bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_reg_data_out(33 downto 0));

    -- i_scalarizer_0mul_ethash_search_align_14(BITSHIFT,236)@4
    i_scalarizer_0mul_ethash_search_align_14_qint <= bubble_select_i_scalarizer_0mul_ethash_search_ma3_cma_b & "000000000000000000";
    i_scalarizer_0mul_ethash_search_align_14_q <= i_scalarizer_0mul_ethash_search_align_14_qint(51 downto 0);

    -- i_scalarizer_0mul_ethash_search_bs11(BITSELECT,233)@1
    i_scalarizer_0mul_ethash_search_bs11_b <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_c(31 downto 18);

    -- redist3_i_scalarizer_0mul_ethash_search_bs11_b_3_0(REG,635)
    redist3_i_scalarizer_0mul_ethash_search_bs11_b_3_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_i_scalarizer_0mul_ethash_search_bs11_b_3_0_q <= "00000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_0_backEN = "1") THEN
                redist3_i_scalarizer_0mul_ethash_search_bs11_b_3_0_q <= STD_LOGIC_VECTOR(i_scalarizer_0mul_ethash_search_bs11_b);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_i_scalarizer_0mul_ethash_search_bs11_b_3_1(REG,636)
    redist3_i_scalarizer_0mul_ethash_search_bs11_b_3_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_i_scalarizer_0mul_ethash_search_bs11_b_3_1_q <= "00000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_1_backEN = "1") THEN
                redist3_i_scalarizer_0mul_ethash_search_bs11_b_3_1_q <= STD_LOGIC_VECTOR(redist3_i_scalarizer_0mul_ethash_search_bs11_b_3_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_i_scalarizer_0mul_ethash_search_bs11_b_3_2(REG,637)
    redist3_i_scalarizer_0mul_ethash_search_bs11_b_3_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_i_scalarizer_0mul_ethash_search_bs11_b_3_2_q <= "00000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_scalarizer_3mul_ethash_search_bs11_b_3_2_backEN = "1") THEN
                redist3_i_scalarizer_0mul_ethash_search_bs11_b_3_2_q <= STD_LOGIC_VECTOR(redist3_i_scalarizer_0mul_ethash_search_bs11_b_3_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- i_scalarizer_0mul_ethash_search_im10_shift0(BITSHIFT,318)@4
    i_scalarizer_0mul_ethash_search_im10_shift0_qint <= redist3_i_scalarizer_0mul_ethash_search_bs11_b_3_2_q & "000000";
    i_scalarizer_0mul_ethash_search_im10_shift0_q <= i_scalarizer_0mul_ethash_search_im10_shift0_qint(19 downto 0);

    -- bubble_select_i_scalarizer_0mul_ethash_search_im0_cma(BITSELECT,730)
    bubble_select_i_scalarizer_0mul_ethash_search_im0_cma_b <= STD_LOGIC_VECTOR(bubble_out_i_scalarizer_0mul_ethash_search_im0_cma_data_reg_data_out(35 downto 0));

    -- i_scalarizer_0mul_ethash_search_join_13(BITJOIN,235)@4
    i_scalarizer_0mul_ethash_search_join_13_q <= STD_LOGIC_VECTOR("0" & i_scalarizer_0mul_ethash_search_im10_shift0_q) & bubble_select_i_scalarizer_0mul_ethash_search_im0_cma_b;

    -- i_scalarizer_0mul_ethash_search_result_add_0_0(ADD,238)@4
    i_scalarizer_0mul_ethash_search_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & i_scalarizer_0mul_ethash_search_join_13_q));
    i_scalarizer_0mul_ethash_search_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((59 downto 52 => i_scalarizer_0mul_ethash_search_align_14_q(51)) & i_scalarizer_0mul_ethash_search_align_14_q));
    i_scalarizer_0mul_ethash_search_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(i_scalarizer_0mul_ethash_search_result_add_0_0_a) + SIGNED(i_scalarizer_0mul_ethash_search_result_add_0_0_b));
    i_scalarizer_0mul_ethash_search_result_add_0_0_q <= i_scalarizer_0mul_ethash_search_result_add_0_0_o(58 downto 0);

    -- i_scalarizer_0mul_ethash_search_extender_x(BITJOIN,66)@4
    i_scalarizer_0mul_ethash_search_extender_x_q <= i_scalarizer_0mul_ethash_search_multconst_x_q & i_scalarizer_0mul_ethash_search_result_add_0_0_q(56 downto 0);

    -- bgTrunc_i_scalarizer_0mul_ethash_search_sel_x(BITSELECT,10)@4
    bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b <= i_scalarizer_0mul_ethash_search_extender_x_q(31 downto 0);

    -- redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo(STALLFIFO,643)
    redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo_valid_in <= SE_out_bubble_out_i_scalarizer_0mul_ethash_search_ma3_cma_data_V0;
    redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo_data_in <= bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b;
    redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo_valid_in_bitsignaltemp <= redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo_valid_in(0);
    redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo_stall_in_bitsignaltemp <= redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo_stall_in(0);
    redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo_valid_out(0) <= redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo_valid_out_bitsignaltemp;
    redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo_stall_out(0) <= redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo_stall_out_bitsignaltemp;
    theredist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 382,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo_valid_in_bitsignaltemp,
        stall_in => redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo_stall_in_bitsignaltemp,
        data_in => bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b,
        valid_out => redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo_valid_out_bitsignaltemp,
        stall_out => redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo_stall_out_bitsignaltemp,
        data_out => redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_multconst_x(CONSTANT,38)
    i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_multconst_x_q <= "00000000000000000000000000000000000000000000000000000000000";

    -- i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_bs1_merged_bit_select(BITSELECT,554)@232
    i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_bs1_merged_bit_select_b <= i_idxprom80_rm_ethash_search_vt_join_q(17 downto 0);
    i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_bs1_merged_bit_select_c <= i_idxprom80_rm_ethash_search_vt_join_q(63 downto 54);
    i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_bs1_merged_bit_select_d <= i_idxprom80_rm_ethash_search_vt_join_q(35 downto 18);
    i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_bs1_merged_bit_select_e <= i_idxprom80_rm_ethash_search_vt_join_q(53 downto 36);

    -- i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_im3_shift0(BITSHIFT,292)@232
    i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_im3_shift0_qint <= i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_bs1_merged_bit_select_c & "0000";
    i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_im3_shift0_q <= i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_im3_shift0_qint(13 downto 0);

    -- i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_align_15(BITSHIFT,173)@232
    i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_im3_shift0_q) & "0000000000000";
    i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_align_15_q <= i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_im6_shift0(BITSHIFT,293)@232
    i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_im6_shift0_qint <= i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_bs1_merged_bit_select_d & "0000";
    i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_im6_shift0_q <= i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_im6_shift0_qint(21 downto 0);

    -- i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_align_14(BITSHIFT,172)@232
    i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_align_14_q <= i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_align_14_qint(40 downto 0);

    -- i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_join_16(BITJOIN,174)@232
    i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_join_16_q <= i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_align_15_q & i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_align_14_q;

    -- i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_im9_shift0(BITSHIFT,294)@232
    i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_im9_shift0_qint <= i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_bs1_merged_bit_select_e & "0000";
    i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_im9_shift0_q <= i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_im9_shift0_qint(21 downto 0);

    -- i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_align_12(BITSHIFT,170)@232
    i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_im9_shift0_q) & "0000000000000";
    i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_align_12_q <= i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_im0_shift0(BITSHIFT,291)@232
    i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_im0_shift0_qint <= i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_bs1_merged_bit_select_b & "0000";
    i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_im0_shift0_q <= i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_im0_shift0_qint(21 downto 0);

    -- i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_join_13(BITJOIN,171)@232
    i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_join_13_q <= i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_im0_shift0_q);

    -- i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_result_add_0_0(ADD,175)@232
    i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_join_13_q);
    i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_join_16_q);
    i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_result_add_0_0_b));
    i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_result_add_0_0_q <= i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_result_add_0_0_o(69 downto 0);

    -- i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_extender_x(BITJOIN,37)@232
    i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_extender_x_q <= i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_multconst_x_q & i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_x_result_add_0_0_q(68 downto 0);

    -- i_arrayidx84_ethash_search_ethash_search334_dupName_1_trunc_sel_x(BITSELECT,40)@232
    i_arrayidx84_ethash_search_ethash_search334_dupName_1_trunc_sel_x_b <= i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_extender_x_q(63 downto 0);

    -- i_arrayidx84_ethash_search_ethash_search334_mult_multconst_x(CONSTANT,50)
    i_arrayidx84_ethash_search_ethash_search334_mult_multconst_x_q <= "00000000000000000000000000000000000000000000000000000000";

    -- bubble_join_i_load_unnamed_ethash_search34_ethash_search(BITJOIN,713)
    bubble_join_i_load_unnamed_ethash_search34_ethash_search_q <= i_load_unnamed_ethash_search34_ethash_search_out_o_readdata;

    -- bubble_select_i_load_unnamed_ethash_search34_ethash_search(BITSELECT,714)
    bubble_select_i_load_unnamed_ethash_search34_ethash_search_b <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_ethash_search34_ethash_search_q(31 downto 0));

    -- i_idxprom81_ethash_search_sel_x(BITSELECT,64)@231
    i_idxprom81_ethash_search_sel_x_b <= std_logic_vector(resize(unsigned(bubble_select_i_load_unnamed_ethash_search34_ethash_search_b(31 downto 0)), 64));

    -- i_idxprom81_ethash_search_vt_select_31(BITSELECT,120)@231
    i_idxprom81_ethash_search_vt_select_31_b <= i_idxprom81_ethash_search_sel_x_b(31 downto 0);

    -- i_idxprom81_ethash_search_vt_join(BITJOIN,119)@231
    i_idxprom81_ethash_search_vt_join_q <= dupName_1_c_i32_0gr_x_q & i_idxprom81_ethash_search_vt_select_31_b;

    -- i_arrayidx84_ethash_search_ethash_search334_mult_x_bs1_merged_bit_select(BITSELECT,555)@231
    i_arrayidx84_ethash_search_ethash_search334_mult_x_bs1_merged_bit_select_b <= i_idxprom81_ethash_search_vt_join_q(17 downto 0);
    i_arrayidx84_ethash_search_ethash_search334_mult_x_bs1_merged_bit_select_c <= i_idxprom81_ethash_search_vt_join_q(63 downto 54);
    i_arrayidx84_ethash_search_ethash_search334_mult_x_bs1_merged_bit_select_d <= i_idxprom81_ethash_search_vt_join_q(35 downto 18);
    i_arrayidx84_ethash_search_ethash_search334_mult_x_bs1_merged_bit_select_e <= i_idxprom81_ethash_search_vt_join_q(53 downto 36);

    -- i_arrayidx84_ethash_search_ethash_search334_mult_x_im3_shift0(BITSHIFT,296)@231
    i_arrayidx84_ethash_search_ethash_search334_mult_x_im3_shift0_qint <= i_arrayidx84_ethash_search_ethash_search334_mult_x_bs1_merged_bit_select_c & "0000000";
    i_arrayidx84_ethash_search_ethash_search334_mult_x_im3_shift0_q <= i_arrayidx84_ethash_search_ethash_search334_mult_x_im3_shift0_qint(16 downto 0);

    -- i_arrayidx84_ethash_search_ethash_search334_mult_x_align_15(BITSHIFT,191)@231
    i_arrayidx84_ethash_search_ethash_search334_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx84_ethash_search_ethash_search334_mult_x_im3_shift0_q) & "0000000000";
    i_arrayidx84_ethash_search_ethash_search334_mult_x_align_15_q <= i_arrayidx84_ethash_search_ethash_search334_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx84_ethash_search_ethash_search334_mult_x_im6_shift0(BITSHIFT,297)@231
    i_arrayidx84_ethash_search_ethash_search334_mult_x_im6_shift0_qint <= i_arrayidx84_ethash_search_ethash_search334_mult_x_bs1_merged_bit_select_d & "0000000";
    i_arrayidx84_ethash_search_ethash_search334_mult_x_im6_shift0_q <= i_arrayidx84_ethash_search_ethash_search334_mult_x_im6_shift0_qint(24 downto 0);

    -- i_arrayidx84_ethash_search_ethash_search334_mult_x_align_14(BITSHIFT,190)@231
    i_arrayidx84_ethash_search_ethash_search334_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx84_ethash_search_ethash_search334_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx84_ethash_search_ethash_search334_mult_x_align_14_q <= i_arrayidx84_ethash_search_ethash_search334_mult_x_align_14_qint(43 downto 0);

    -- i_arrayidx84_ethash_search_ethash_search334_mult_x_join_16(BITJOIN,192)@231
    i_arrayidx84_ethash_search_ethash_search334_mult_x_join_16_q <= i_arrayidx84_ethash_search_ethash_search334_mult_x_align_15_q & i_arrayidx84_ethash_search_ethash_search334_mult_x_align_14_q;

    -- i_arrayidx84_ethash_search_ethash_search334_mult_x_im9_shift0(BITSHIFT,298)@231
    i_arrayidx84_ethash_search_ethash_search334_mult_x_im9_shift0_qint <= i_arrayidx84_ethash_search_ethash_search334_mult_x_bs1_merged_bit_select_e & "0000000";
    i_arrayidx84_ethash_search_ethash_search334_mult_x_im9_shift0_q <= i_arrayidx84_ethash_search_ethash_search334_mult_x_im9_shift0_qint(24 downto 0);

    -- i_arrayidx84_ethash_search_ethash_search334_mult_x_align_12(BITSHIFT,188)@231
    i_arrayidx84_ethash_search_ethash_search334_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx84_ethash_search_ethash_search334_mult_x_im9_shift0_q) & "0000000000";
    i_arrayidx84_ethash_search_ethash_search334_mult_x_align_12_q <= i_arrayidx84_ethash_search_ethash_search334_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx84_ethash_search_ethash_search334_mult_x_im0_shift0(BITSHIFT,295)@231
    i_arrayidx84_ethash_search_ethash_search334_mult_x_im0_shift0_qint <= i_arrayidx84_ethash_search_ethash_search334_mult_x_bs1_merged_bit_select_b & "0000000";
    i_arrayidx84_ethash_search_ethash_search334_mult_x_im0_shift0_q <= i_arrayidx84_ethash_search_ethash_search334_mult_x_im0_shift0_qint(24 downto 0);

    -- i_arrayidx84_ethash_search_ethash_search334_mult_x_join_13(BITJOIN,189)@231
    i_arrayidx84_ethash_search_ethash_search334_mult_x_join_13_q <= i_arrayidx84_ethash_search_ethash_search334_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx84_ethash_search_ethash_search334_mult_x_im0_shift0_q);

    -- i_arrayidx84_ethash_search_ethash_search334_mult_x_result_add_0_0(ADD,193)@231
    i_arrayidx84_ethash_search_ethash_search334_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx84_ethash_search_ethash_search334_mult_x_join_13_q);
    i_arrayidx84_ethash_search_ethash_search334_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx84_ethash_search_ethash_search334_mult_x_join_16_q);
    i_arrayidx84_ethash_search_ethash_search334_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx84_ethash_search_ethash_search334_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx84_ethash_search_ethash_search334_mult_x_result_add_0_0_b));
    i_arrayidx84_ethash_search_ethash_search334_mult_x_result_add_0_0_q <= i_arrayidx84_ethash_search_ethash_search334_mult_x_result_add_0_0_o(72 downto 0);

    -- i_arrayidx84_ethash_search_ethash_search334_mult_extender_x(BITJOIN,49)@231
    i_arrayidx84_ethash_search_ethash_search334_mult_extender_x_q <= i_arrayidx84_ethash_search_ethash_search334_mult_multconst_x_q & i_arrayidx84_ethash_search_ethash_search334_mult_x_result_add_0_0_q(71 downto 0);

    -- i_arrayidx84_ethash_search_ethash_search334_trunc_sel_x(BITSELECT,51)@231
    i_arrayidx84_ethash_search_ethash_search334_trunc_sel_x_b <= i_arrayidx84_ethash_search_ethash_search334_mult_extender_x_q(63 downto 0);

    -- bubble_join_i_syncbuf_g_dag_sync_buffer_ethash_search(BITJOIN,722)
    bubble_join_i_syncbuf_g_dag_sync_buffer_ethash_search_q <= i_syncbuf_g_dag_sync_buffer_ethash_search_out_buffer_out;

    -- bubble_select_i_syncbuf_g_dag_sync_buffer_ethash_search(BITSELECT,723)
    bubble_select_i_syncbuf_g_dag_sync_buffer_ethash_search_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_g_dag_sync_buffer_ethash_search_q(63 downto 0));

    -- i_arrayidx84_ethash_search_ethash_search334_add_x(ADD,52)@231
    i_arrayidx84_ethash_search_ethash_search334_add_x_a <= STD_LOGIC_VECTOR("0" & bubble_select_i_syncbuf_g_dag_sync_buffer_ethash_search_b);
    i_arrayidx84_ethash_search_ethash_search334_add_x_b <= STD_LOGIC_VECTOR("0" & i_arrayidx84_ethash_search_ethash_search334_trunc_sel_x_b);
    i_arrayidx84_ethash_search_ethash_search334_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx84_ethash_search_ethash_search334_add_x_a) + UNSIGNED(i_arrayidx84_ethash_search_ethash_search334_add_x_b));
    i_arrayidx84_ethash_search_ethash_search334_add_x_q <= i_arrayidx84_ethash_search_ethash_search334_add_x_o(64 downto 0);

    -- i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x(BITSELECT,39)@231
    i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b <= i_arrayidx84_ethash_search_ethash_search334_add_x_q(63 downto 0);

    -- redist5_i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b_1_0(REG,639)
    redist5_i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist5_i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b_1_0_backEN = "1") THEN
                redist5_i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- i_arrayidx84_ethash_search_ethash_search334_dupName_0_add_x(ADD,44)@232
    i_arrayidx84_ethash_search_ethash_search334_dupName_0_add_x_a <= STD_LOGIC_VECTOR("0" & redist5_i_arrayidx84_ethash_search_ethash_search334_dupName_0_trunc_sel_x_b_1_0_q);
    i_arrayidx84_ethash_search_ethash_search334_dupName_0_add_x_b <= STD_LOGIC_VECTOR("0" & i_arrayidx84_ethash_search_ethash_search334_dupName_1_trunc_sel_x_b);
    i_arrayidx84_ethash_search_ethash_search334_dupName_0_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx84_ethash_search_ethash_search334_dupName_0_add_x_a) + UNSIGNED(i_arrayidx84_ethash_search_ethash_search334_dupName_0_add_x_b));
    i_arrayidx84_ethash_search_ethash_search334_dupName_0_add_x_q <= i_arrayidx84_ethash_search_ethash_search334_dupName_0_add_x_o(64 downto 0);

    -- i_arrayidx84_ethash_search_ethash_search334_dupName_2_trunc_sel_x(BITSELECT,41)@232
    i_arrayidx84_ethash_search_ethash_search334_dupName_2_trunc_sel_x_b <= i_arrayidx84_ethash_search_ethash_search334_dupName_0_add_x_q(63 downto 0);

    -- i_load_unnamed_ethash_search35_ethash_search_vunroll_x(BLACKBOX,65)@232
    -- in in_i_stall@20000000
    -- out out_o_readdata_0@385
    -- out out_o_readdata_1@385
    -- out out_o_readdata_2@385
    -- out out_o_readdata_3@385
    -- out out_o_stall@20000000
    -- out out_o_valid@385
    -- out out_unnamed_ethash_search35_avm_address@20000000
    -- out out_unnamed_ethash_search35_avm_burstcount@20000000
    -- out out_unnamed_ethash_search35_avm_byteenable@20000000
    -- out out_unnamed_ethash_search35_avm_enable@20000000
    -- out out_unnamed_ethash_search35_avm_read@20000000
    -- out out_unnamed_ethash_search35_avm_write@20000000
    -- out out_unnamed_ethash_search35_avm_writedata@20000000
    thei_load_unnamed_ethash_search35_ethash_search_vunroll_x : i_load_unnamed_ethash_search35_ethash_search335
    PORT MAP (
        in_flush => in_flush,
        in_i_address => i_arrayidx84_ethash_search_ethash_search334_dupName_2_trunc_sel_x_b,
        in_i_predicate => GND_q,
        in_i_stall => SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall,
        in_i_valid => SE_i_arrayidx84_ethash_search_ethash_search334_dupName_0_mult_extender_x_V0,
        in_unnamed_ethash_search35_avm_readdata => in_unnamed_ethash_search35_avm_readdata,
        in_unnamed_ethash_search35_avm_readdatavalid => in_unnamed_ethash_search35_avm_readdatavalid,
        in_unnamed_ethash_search35_avm_waitrequest => in_unnamed_ethash_search35_avm_waitrequest,
        in_unnamed_ethash_search35_avm_writeack => in_unnamed_ethash_search35_avm_writeack,
        out_o_readdata_0 => i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_o_readdata_0,
        out_o_readdata_1 => i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_o_readdata_1,
        out_o_readdata_2 => i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_o_readdata_2,
        out_o_readdata_3 => i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_o_readdata_3,
        out_o_stall => i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_o_stall,
        out_o_valid => i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_o_valid,
        out_unnamed_ethash_search35_avm_address => i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_unnamed_ethash_search35_avm_address,
        out_unnamed_ethash_search35_avm_burstcount => i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_unnamed_ethash_search35_avm_burstcount,
        out_unnamed_ethash_search35_avm_byteenable => i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_unnamed_ethash_search35_avm_byteenable,
        out_unnamed_ethash_search35_avm_enable => i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_unnamed_ethash_search35_avm_enable,
        out_unnamed_ethash_search35_avm_read => i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_unnamed_ethash_search35_avm_read,
        out_unnamed_ethash_search35_avm_write => i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_unnamed_ethash_search35_avm_write,
        out_unnamed_ethash_search35_avm_writedata => i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_unnamed_ethash_search35_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- c_i32_1gr(CONSTANT,90)
    c_i32_1gr_q <= "00000000000000000000000000000001";

    -- i_inc87_ethash_search(ADD,121)@1
    i_inc87_ethash_search_a <= STD_LOGIC_VECTOR("0" & bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_i);
    i_inc87_ethash_search_b <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_inc87_ethash_search_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc87_ethash_search_a) + UNSIGNED(i_inc87_ethash_search_b));
    i_inc87_ethash_search_q <= i_inc87_ethash_search_o(32 downto 0);

    -- bgTrunc_i_inc87_ethash_search_sel_x(BITSELECT,9)@1
    bgTrunc_i_inc87_ethash_search_sel_x_b <= i_inc87_ethash_search_q(31 downto 0);

    -- redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo(STALLFIFO,644)
    redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V53;
    redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo_data_in <= bgTrunc_i_inc87_ethash_search_sel_x_b;
    redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo_valid_in_bitsignaltemp <= redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo_valid_in(0);
    redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo_stall_in_bitsignaltemp <= redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo_stall_in(0);
    redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo_valid_out(0) <= redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo_valid_out_bitsignaltemp;
    redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo_stall_out(0) <= redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo_stall_out_bitsignaltemp;
    theredist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo_stall_in_bitsignaltemp,
        data_in => bgTrunc_i_inc87_ethash_search_sel_x_b,
        valid_out => redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo_stall_out_bitsignaltemp,
        data_out => redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo(STALLFIFO,645)
    redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V4;
    redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_b;
    redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_valid_in_bitsignaltemp <= redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_valid_in(0);
    redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_stall_in_bitsignaltemp <= redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_stall_in(0);
    redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_valid_out(0) <= redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_valid_out_bitsignaltemp;
    redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_stall_out(0) <= redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_stall_out_bitsignaltemp;
    theredist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 5,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_b,
        valid_out => redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_stall_out_bitsignaltemp,
        data_out => redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo(STALLFIFO,647)
    redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_valid_in <= SE_out_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_V0;
    redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_data_in <= bubble_select_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_b;
    redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_valid_in_bitsignaltemp <= redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_valid_in(0);
    redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_stall_in_bitsignaltemp <= redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_stall_in(0);
    redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_valid_out(0) <= redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_valid_out_bitsignaltemp;
    redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_stall_out(0) <= redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_stall_out_bitsignaltemp;
    theredist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 348,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist12_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_37_fifo_b,
        valid_out => redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_stall_out_bitsignaltemp,
        data_out => redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo(STALLFIFO,648)
    redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V6;
    redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_f;
    redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_valid_in_bitsignaltemp <= redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_valid_in(0);
    redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_stall_in_bitsignaltemp <= redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_stall_in(0);
    redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_valid_out(0) <= redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_valid_out_bitsignaltemp;
    redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_stall_out(0) <= redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_stall_out_bitsignaltemp;
    theredist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 3,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_f,
        valid_out => redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_stall_out_bitsignaltemp,
        data_out => redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo(STALLFIFO,649)
    redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V7;
    redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_j;
    redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo_valid_in_bitsignaltemp <= redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo_valid_in(0);
    redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo_stall_in_bitsignaltemp <= redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo_stall_in(0);
    redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo_valid_out(0) <= redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo_valid_out_bitsignaltemp;
    redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo_stall_out(0) <= redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo_stall_out_bitsignaltemp;
    theredist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_j,
        valid_out => redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo_stall_out_bitsignaltemp,
        data_out => redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo(STALLFIFO,650)
    redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V8;
    redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_k;
    redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo_valid_in_bitsignaltemp <= redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo_valid_in(0);
    redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo_stall_in_bitsignaltemp <= redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo_stall_in(0);
    redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo_valid_out(0) <= redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo_valid_out_bitsignaltemp;
    redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo_stall_out(0) <= redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo_stall_out_bitsignaltemp;
    theredist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_k,
        valid_out => redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo_stall_out_bitsignaltemp,
        data_out => redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo(STALLFIFO,651)
    redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V9;
    redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_l;
    redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo_valid_in_bitsignaltemp <= redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo_valid_in(0);
    redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo_stall_in_bitsignaltemp <= redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo_stall_in(0);
    redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo_valid_out(0) <= redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo_valid_out_bitsignaltemp;
    redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo_stall_out(0) <= redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo_stall_out_bitsignaltemp;
    theredist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_l,
        valid_out => redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo_stall_out_bitsignaltemp,
        data_out => redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo(STALLFIFO,652)
    redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V10;
    redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_m;
    redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo_valid_in_bitsignaltemp <= redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo_valid_in(0);
    redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo_stall_in_bitsignaltemp <= redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo_stall_in(0);
    redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo_valid_out(0) <= redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo_valid_out_bitsignaltemp;
    redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo_stall_out(0) <= redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo_stall_out_bitsignaltemp;
    theredist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_m,
        valid_out => redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo_stall_out_bitsignaltemp,
        data_out => redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo(STALLFIFO,653)
    redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V11;
    redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_n;
    redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo_valid_in_bitsignaltemp <= redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo_valid_in(0);
    redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo_stall_in_bitsignaltemp <= redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo_stall_in(0);
    redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo_valid_out(0) <= redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo_valid_out_bitsignaltemp;
    redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo_stall_out(0) <= redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo_stall_out_bitsignaltemp;
    theredist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_n,
        valid_out => redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo_stall_out_bitsignaltemp,
        data_out => redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo(STALLFIFO,654)
    redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V12;
    redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_o;
    redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo_valid_in_bitsignaltemp <= redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo_valid_in(0);
    redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo_stall_in_bitsignaltemp <= redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo_stall_in(0);
    redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo_valid_out(0) <= redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo_valid_out_bitsignaltemp;
    redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo_stall_out(0) <= redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo_stall_out_bitsignaltemp;
    theredist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_o,
        valid_out => redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo_stall_out_bitsignaltemp,
        data_out => redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo(STALLFIFO,655)
    redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V13;
    redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_p;
    redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo_valid_in_bitsignaltemp <= redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo_valid_in(0);
    redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo_stall_in_bitsignaltemp <= redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo_stall_in(0);
    redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo_valid_out(0) <= redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo_valid_out_bitsignaltemp;
    redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo_stall_out(0) <= redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo_stall_out_bitsignaltemp;
    theredist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_p,
        valid_out => redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo_stall_out_bitsignaltemp,
        data_out => redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo(STALLFIFO,656)
    redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V14;
    redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_q;
    redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo_valid_in_bitsignaltemp <= redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo_valid_in(0);
    redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo_stall_in_bitsignaltemp <= redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo_stall_in(0);
    redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo_valid_out(0) <= redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo_valid_out_bitsignaltemp;
    redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo_stall_out(0) <= redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo_stall_out_bitsignaltemp;
    theredist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_q,
        valid_out => redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo_stall_out_bitsignaltemp,
        data_out => redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo(STALLFIFO,657)
    redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V15;
    redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_r;
    redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo_valid_in_bitsignaltemp <= redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo_valid_in(0);
    redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo_stall_in_bitsignaltemp <= redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo_stall_in(0);
    redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo_valid_out(0) <= redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo_valid_out_bitsignaltemp;
    redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo_stall_out(0) <= redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo_stall_out_bitsignaltemp;
    theredist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_r,
        valid_out => redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo_stall_out_bitsignaltemp,
        data_out => redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo(STALLFIFO,658)
    redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V16;
    redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_s;
    redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo_valid_in_bitsignaltemp <= redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo_valid_in(0);
    redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo_stall_in_bitsignaltemp <= redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo_stall_in(0);
    redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo_valid_out(0) <= redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo_valid_out_bitsignaltemp;
    redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo_stall_out(0) <= redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo_stall_out_bitsignaltemp;
    theredist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_s,
        valid_out => redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo_stall_out_bitsignaltemp,
        data_out => redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo(STALLFIFO,659)
    redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V17;
    redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_t;
    redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo_valid_in_bitsignaltemp <= redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo_valid_in(0);
    redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo_stall_in_bitsignaltemp <= redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo_stall_in(0);
    redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo_valid_out(0) <= redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo_valid_out_bitsignaltemp;
    redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo_stall_out(0) <= redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo_stall_out_bitsignaltemp;
    theredist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_t,
        valid_out => redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo_stall_out_bitsignaltemp,
        data_out => redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo(STALLFIFO,660)
    redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V18;
    redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_u;
    redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo_valid_in_bitsignaltemp <= redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo_valid_in(0);
    redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo_stall_in_bitsignaltemp <= redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo_stall_in(0);
    redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo_valid_out(0) <= redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo_valid_out_bitsignaltemp;
    redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo_stall_out(0) <= redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo_stall_out_bitsignaltemp;
    theredist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_u,
        valid_out => redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo_stall_out_bitsignaltemp,
        data_out => redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo(STALLFIFO,661)
    redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V19;
    redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_v;
    redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo_valid_in_bitsignaltemp <= redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo_valid_in(0);
    redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo_stall_in_bitsignaltemp <= redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo_stall_in(0);
    redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo_valid_out(0) <= redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo_valid_out_bitsignaltemp;
    redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo_stall_out(0) <= redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo_stall_out_bitsignaltemp;
    theredist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_v,
        valid_out => redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo_stall_out_bitsignaltemp,
        data_out => redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo(STALLFIFO,662)
    redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V20;
    redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_w;
    redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo_valid_in_bitsignaltemp <= redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo_valid_in(0);
    redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo_stall_in_bitsignaltemp <= redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo_stall_in(0);
    redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo_valid_out(0) <= redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo_valid_out_bitsignaltemp;
    redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo_stall_out(0) <= redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo_stall_out_bitsignaltemp;
    theredist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_w,
        valid_out => redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo_stall_out_bitsignaltemp,
        data_out => redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo(STALLFIFO,663)
    redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V21;
    redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_x;
    redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo_valid_in_bitsignaltemp <= redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo_valid_in(0);
    redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo_stall_in_bitsignaltemp <= redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo_stall_in(0);
    redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo_valid_out(0) <= redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo_valid_out_bitsignaltemp;
    redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo_stall_out(0) <= redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo_stall_out_bitsignaltemp;
    theredist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_x,
        valid_out => redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo_stall_out_bitsignaltemp,
        data_out => redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo(STALLFIFO,664)
    redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V22;
    redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_y;
    redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo_valid_in_bitsignaltemp <= redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo_valid_in(0);
    redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo_stall_in_bitsignaltemp <= redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo_stall_in(0);
    redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo_valid_out(0) <= redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo_valid_out_bitsignaltemp;
    redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo_stall_out(0) <= redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo_stall_out_bitsignaltemp;
    theredist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_y,
        valid_out => redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo_stall_out_bitsignaltemp,
        data_out => redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo(STALLFIFO,665)
    redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V23;
    redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_z;
    redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo_valid_in_bitsignaltemp <= redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo_valid_in(0);
    redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo_stall_in_bitsignaltemp <= redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo_stall_in(0);
    redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo_valid_out(0) <= redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo_valid_out_bitsignaltemp;
    redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo_stall_out(0) <= redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo_stall_out_bitsignaltemp;
    theredist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_z,
        valid_out => redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo_stall_out_bitsignaltemp,
        data_out => redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo(STALLFIFO,666)
    redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V24;
    redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_aa;
    redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo_valid_in_bitsignaltemp <= redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo_valid_in(0);
    redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo_stall_in_bitsignaltemp <= redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo_stall_in(0);
    redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo_valid_out(0) <= redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo_valid_out_bitsignaltemp;
    redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo_stall_out(0) <= redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo_stall_out_bitsignaltemp;
    theredist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_aa,
        valid_out => redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo_stall_out_bitsignaltemp,
        data_out => redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo(STALLFIFO,667)
    redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V25;
    redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_bb;
    redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo_valid_in_bitsignaltemp <= redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo_valid_in(0);
    redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo_stall_in_bitsignaltemp <= redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo_stall_in(0);
    redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo_valid_out(0) <= redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo_valid_out_bitsignaltemp;
    redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo_stall_out(0) <= redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo_stall_out_bitsignaltemp;
    theredist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_bb,
        valid_out => redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo_stall_out_bitsignaltemp,
        data_out => redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo(STALLFIFO,668)
    redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V26;
    redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_cc;
    redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo_valid_in_bitsignaltemp <= redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo_valid_in(0);
    redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo_stall_in_bitsignaltemp <= redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo_stall_in(0);
    redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo_valid_out(0) <= redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo_valid_out_bitsignaltemp;
    redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo_stall_out(0) <= redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo_stall_out_bitsignaltemp;
    theredist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_cc,
        valid_out => redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo_stall_out_bitsignaltemp,
        data_out => redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo(STALLFIFO,669)
    redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V27;
    redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_dd;
    redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo_valid_in_bitsignaltemp <= redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo_valid_in(0);
    redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo_stall_in_bitsignaltemp <= redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo_stall_in(0);
    redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo_valid_out(0) <= redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo_valid_out_bitsignaltemp;
    redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo_stall_out(0) <= redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo_stall_out_bitsignaltemp;
    theredist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_dd,
        valid_out => redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo_stall_out_bitsignaltemp,
        data_out => redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo(STALLFIFO,670)
    redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V28;
    redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_ee;
    redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo_valid_in_bitsignaltemp <= redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo_valid_in(0);
    redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo_stall_in_bitsignaltemp <= redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo_stall_in(0);
    redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo_valid_out(0) <= redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo_valid_out_bitsignaltemp;
    redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo_stall_out(0) <= redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo_stall_out_bitsignaltemp;
    theredist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_ee,
        valid_out => redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo_stall_out_bitsignaltemp,
        data_out => redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo(STALLFIFO,671)
    redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V29;
    redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_ff;
    redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo_valid_in_bitsignaltemp <= redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo_valid_in(0);
    redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo_stall_in_bitsignaltemp <= redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo_stall_in(0);
    redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo_valid_out(0) <= redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo_valid_out_bitsignaltemp;
    redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo_stall_out(0) <= redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo_stall_out_bitsignaltemp;
    theredist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_ff,
        valid_out => redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo_stall_out_bitsignaltemp,
        data_out => redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo(STALLFIFO,672)
    redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V30;
    redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_gg;
    redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo_valid_in_bitsignaltemp <= redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo_valid_in(0);
    redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo_stall_in_bitsignaltemp <= redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo_stall_in(0);
    redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo_valid_out(0) <= redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo_valid_out_bitsignaltemp;
    redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo_stall_out(0) <= redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo_stall_out_bitsignaltemp;
    theredist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_gg,
        valid_out => redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo_stall_out_bitsignaltemp,
        data_out => redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo(STALLFIFO,673)
    redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V31;
    redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_hh;
    redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo_valid_in_bitsignaltemp <= redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo_valid_in(0);
    redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo_stall_in_bitsignaltemp <= redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo_stall_in(0);
    redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo_valid_out(0) <= redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo_valid_out_bitsignaltemp;
    redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo_stall_out(0) <= redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo_stall_out_bitsignaltemp;
    theredist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_hh,
        valid_out => redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo_stall_out_bitsignaltemp,
        data_out => redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo(STALLFIFO,674)
    redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V32;
    redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_ii;
    redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo_valid_in_bitsignaltemp <= redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo_valid_in(0);
    redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo_stall_in_bitsignaltemp <= redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo_stall_in(0);
    redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo_valid_out(0) <= redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo_valid_out_bitsignaltemp;
    redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo_stall_out(0) <= redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo_stall_out_bitsignaltemp;
    theredist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_ii,
        valid_out => redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo_stall_out_bitsignaltemp,
        data_out => redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo(STALLFIFO,675)
    redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V33;
    redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_jj;
    redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo_valid_in_bitsignaltemp <= redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo_valid_in(0);
    redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo_stall_in_bitsignaltemp <= redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo_stall_in(0);
    redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo_valid_out(0) <= redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo_valid_out_bitsignaltemp;
    redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo_stall_out(0) <= redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo_stall_out_bitsignaltemp;
    theredist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_jj,
        valid_out => redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo_stall_out_bitsignaltemp,
        data_out => redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo(STALLFIFO,676)
    redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V34;
    redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_kk;
    redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo_valid_in_bitsignaltemp <= redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo_valid_in(0);
    redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo_stall_in_bitsignaltemp <= redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo_stall_in(0);
    redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo_valid_out(0) <= redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo_valid_out_bitsignaltemp;
    redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo_stall_out(0) <= redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo_stall_out_bitsignaltemp;
    theredist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 4,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_kk,
        valid_out => redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo_stall_out_bitsignaltemp,
        data_out => redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo(STALLFIFO,677)
    redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V35;
    redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_ll;
    redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo_valid_in_bitsignaltemp <= redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo_valid_in(0);
    redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo_stall_in_bitsignaltemp <= redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo_stall_in(0);
    redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo_valid_out(0) <= redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo_valid_out_bitsignaltemp;
    redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo_stall_out(0) <= redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo_stall_out_bitsignaltemp;
    theredist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_ll,
        valid_out => redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo_stall_out_bitsignaltemp,
        data_out => redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo(STALLFIFO,678)
    redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V36;
    redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_mm;
    redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo_valid_in_bitsignaltemp <= redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo_valid_in(0);
    redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo_stall_in_bitsignaltemp <= redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo_stall_in(0);
    redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo_valid_out(0) <= redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo_valid_out_bitsignaltemp;
    redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo_stall_out(0) <= redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo_stall_out_bitsignaltemp;
    theredist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_mm,
        valid_out => redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo_stall_out_bitsignaltemp,
        data_out => redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo(STALLFIFO,679)
    redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V37;
    redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_nn;
    redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo_valid_in_bitsignaltemp <= redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo_valid_in(0);
    redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo_stall_in_bitsignaltemp <= redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo_stall_in(0);
    redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo_valid_out(0) <= redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo_valid_out_bitsignaltemp;
    redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo_stall_out(0) <= redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo_stall_out_bitsignaltemp;
    theredist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_nn,
        valid_out => redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo_stall_out_bitsignaltemp,
        data_out => redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo(STALLFIFO,680)
    redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V38;
    redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_oo;
    redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo_valid_in_bitsignaltemp <= redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo_valid_in(0);
    redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo_stall_in_bitsignaltemp <= redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo_stall_in(0);
    redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo_valid_out(0) <= redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo_valid_out_bitsignaltemp;
    redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo_stall_out(0) <= redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo_stall_out_bitsignaltemp;
    theredist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_oo,
        valid_out => redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo_stall_out_bitsignaltemp,
        data_out => redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo(STALLFIFO,681)
    redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V39;
    redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_pp;
    redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo_valid_in_bitsignaltemp <= redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo_valid_in(0);
    redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo_stall_in_bitsignaltemp <= redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo_stall_in(0);
    redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo_valid_out(0) <= redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo_valid_out_bitsignaltemp;
    redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo_stall_out(0) <= redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo_stall_out_bitsignaltemp;
    theredist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_pp,
        valid_out => redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo_stall_out_bitsignaltemp,
        data_out => redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo(STALLFIFO,682)
    redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V40;
    redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_qq;
    redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo_valid_in_bitsignaltemp <= redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo_valid_in(0);
    redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo_stall_in_bitsignaltemp <= redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo_stall_in(0);
    redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo_valid_out(0) <= redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo_valid_out_bitsignaltemp;
    redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo_stall_out(0) <= redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo_stall_out_bitsignaltemp;
    theredist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_qq,
        valid_out => redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo_stall_out_bitsignaltemp,
        data_out => redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo(STALLFIFO,683)
    redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V41;
    redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_rr;
    redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo_valid_in_bitsignaltemp <= redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo_valid_in(0);
    redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo_stall_in_bitsignaltemp <= redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo_stall_in(0);
    redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo_valid_out(0) <= redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo_valid_out_bitsignaltemp;
    redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo_stall_out(0) <= redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo_stall_out_bitsignaltemp;
    theredist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_rr,
        valid_out => redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo_stall_out_bitsignaltemp,
        data_out => redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo(STALLFIFO,684)
    redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V42;
    redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_ss;
    redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo_valid_in_bitsignaltemp <= redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo_valid_in(0);
    redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo_stall_in_bitsignaltemp <= redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo_stall_in(0);
    redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo_valid_out(0) <= redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo_valid_out_bitsignaltemp;
    redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo_stall_out(0) <= redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo_stall_out_bitsignaltemp;
    theredist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_ss,
        valid_out => redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo_stall_out_bitsignaltemp,
        data_out => redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo(STALLFIFO,685)
    redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V43;
    redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_tt;
    redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo_valid_in_bitsignaltemp <= redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo_valid_in(0);
    redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo_stall_in_bitsignaltemp <= redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo_stall_in(0);
    redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo_valid_out(0) <= redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo_valid_out_bitsignaltemp;
    redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo_stall_out(0) <= redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo_stall_out_bitsignaltemp;
    theredist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_tt,
        valid_out => redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo_stall_out_bitsignaltemp,
        data_out => redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo(STALLFIFO,687)
    redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo_valid_in <= SE_out_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_V0;
    redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo_data_in <= bubble_select_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_b;
    redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo_valid_in_bitsignaltemp <= redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo_valid_in(0);
    redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo_stall_in_bitsignaltemp <= redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo_stall_in(0);
    redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo_valid_out(0) <= redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo_valid_out_bitsignaltemp;
    redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo_stall_out(0) <= redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo_stall_out_bitsignaltemp;
    theredist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 154,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist52_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_231_fifo_b,
        valid_out => redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo_stall_out_bitsignaltemp,
        data_out => redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo(STALLFIFO,688)
    redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V45;
    redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_vv;
    redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo_valid_in_bitsignaltemp <= redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo_valid_in(0);
    redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo_stall_in_bitsignaltemp <= redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo_stall_in(0);
    redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo_valid_out(0) <= redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo_valid_out_bitsignaltemp;
    redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo_stall_out(0) <= redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo_stall_out_bitsignaltemp;
    theredist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_vv,
        valid_out => redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo_stall_out_bitsignaltemp,
        data_out => redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo(STALLFIFO,689)
    redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V46;
    redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_ww;
    redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo_valid_in_bitsignaltemp <= redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo_valid_in(0);
    redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo_stall_in_bitsignaltemp <= redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo_stall_in(0);
    redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo_valid_out(0) <= redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo_valid_out_bitsignaltemp;
    redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo_stall_out(0) <= redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo_stall_out_bitsignaltemp;
    theredist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_ww,
        valid_out => redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo_stall_out_bitsignaltemp,
        data_out => redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo(STALLFIFO,692)
    redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo_valid_in <= SE_out_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_V1;
    redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo_data_in <= bubble_select_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_b;
    redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo_valid_in_bitsignaltemp <= redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo_valid_in(0);
    redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo_stall_in_bitsignaltemp <= redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo_stall_in(0);
    redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo_valid_out(0) <= redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo_valid_out_bitsignaltemp;
    redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo_stall_out(0) <= redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo_stall_out_bitsignaltemp;
    theredist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 187,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist57_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_198_fifo_b,
        valid_out => redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo_stall_out_bitsignaltemp,
        data_out => redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo(STALLFIFO,693)
    redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V48;
    redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_yy;
    redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo_valid_in_bitsignaltemp <= redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo_valid_in(0);
    redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo_stall_in_bitsignaltemp <= redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo_stall_in(0);
    redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo_valid_out(0) <= redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo_valid_out_bitsignaltemp;
    redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo_stall_out(0) <= redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo_stall_out_bitsignaltemp;
    theredist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_yy,
        valid_out => redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo_stall_out_bitsignaltemp,
        data_out => redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo(STALLFIFO,694)
    redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V49;
    redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_zz;
    redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo_valid_in_bitsignaltemp <= redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo_valid_in(0);
    redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo_stall_in_bitsignaltemp <= redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo_stall_in(0);
    redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo_valid_out(0) <= redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo_valid_out_bitsignaltemp;
    redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo_stall_out(0) <= redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo_stall_out_bitsignaltemp;
    theredist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_zz,
        valid_out => redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo_stall_out_bitsignaltemp,
        data_out => redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo(STALLFIFO,697)
    redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo_valid_in <= SE_out_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_V1;
    redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo_data_in <= bubble_select_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_b;
    redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo_valid_in_bitsignaltemp <= redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo_valid_in(0);
    redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo_stall_in_bitsignaltemp <= redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo_stall_in(0);
    redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo_valid_out(0) <= redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo_valid_out_bitsignaltemp;
    redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo_stall_out(0) <= redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo_stall_out_bitsignaltemp;
    theredist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 187,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist62_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_198_fifo_b,
        valid_out => redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo_stall_out_bitsignaltemp,
        data_out => redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo(STALLFIFO,698)
    redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo_valid_in <= SE_out_ethash_search_B4_merge_reg_aunroll_vunroll_x_V51;
    redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo_data_in <= bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_2;
    redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo_valid_in_bitsignaltemp <= redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo_valid_in(0);
    redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo_stall_in_bitsignaltemp <= redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo_stall_in(0);
    redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo_valid_out(0) <= redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo_valid_out_bitsignaltemp;
    redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo_stall_out(0) <= redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo_stall_out_bitsignaltemp;
    theredist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 385,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B4_merge_reg_aunroll_vunroll_x_2,
        valid_out => redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo_stall_out_bitsignaltemp,
        data_out => redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo(STALLFIFO,700)
    redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_valid_in <= SE_out_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_V1;
    redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_stall_in <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall;
    redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_data_in <= bubble_select_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_b;
    redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_valid_in_bitsignaltemp <= redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_valid_in(0);
    redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_stall_in_bitsignaltemp <= redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_stall_in(0);
    redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_valid_out(0) <= redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_valid_out_bitsignaltemp;
    redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_stall_out(0) <= redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_stall_out_bitsignaltemp;
    theredist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 348,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_valid_in_bitsignaltemp,
        stall_in => redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist65_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_37_fifo_b,
        valid_out => redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_valid_out_bitsignaltemp,
        stall_out => redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_stall_out_bitsignaltemp,
        data_out => redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo(STALLENABLE,1213)
    -- Valid signal propagation
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_V0 <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_backStall <= in_stall_in or not (SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and0 <= redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_valid_out;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and1 <= redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and0;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and2 <= redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and1;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and3 <= redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and2;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and4 <= redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and3;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and5 <= redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and4;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and6 <= redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and5;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and7 <= redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and6;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and8 <= redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and7;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and9 <= redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and8;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and10 <= redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and9;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and11 <= redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and10;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and12 <= redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and11;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and13 <= redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and12;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and14 <= redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and13;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and15 <= redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and14;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and16 <= redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and15;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and17 <= redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and16;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and18 <= redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and17;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and19 <= redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and18;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and20 <= redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and19;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and21 <= redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and20;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and22 <= redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and21;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and23 <= redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and22;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and24 <= redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and23;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and25 <= redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and24;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and26 <= redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and25;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and27 <= redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and26;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and28 <= redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and27;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and29 <= redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and28;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and30 <= redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and29;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and31 <= redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and30;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and32 <= redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and31;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and33 <= redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and32;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and34 <= redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and33;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and35 <= redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and34;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and36 <= redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and35;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and37 <= redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and36;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and38 <= redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and37;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and39 <= redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and38;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and40 <= redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and39;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and41 <= redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and40;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and42 <= redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and41;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and43 <= redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and42;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and44 <= redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and43;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and45 <= redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and44;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and46 <= redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and45;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and47 <= redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and46;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and48 <= redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and47;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and49 <= redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and48;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and50 <= i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_o_valid and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and49;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and51 <= redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and50;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and52 <= redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and51;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and53 <= redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and52;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and54 <= redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and53;
    SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_wireValid <= redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo_valid_out and SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_and54;

    -- bubble_join_redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo(BITJOIN,930)
    bubble_join_redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo_q <= redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo_data_out;

    -- bubble_select_redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo(BITSELECT,931)
    bubble_select_redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo_q(31 downto 0));

    -- bubble_join_redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo(BITJOIN,861)
    bubble_join_redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo_q <= redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo_data_out;

    -- bubble_select_redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo(BITSELECT,862)
    bubble_select_redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo_q(63 downto 0));

    -- bubble_join_redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo(BITJOIN,858)
    bubble_join_redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo_q <= redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo_data_out;

    -- bubble_select_redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo(BITSELECT,859)
    bubble_select_redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo_q(63 downto 0));

    -- bubble_join_redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo(BITJOIN,855)
    bubble_join_redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo_q <= redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo_data_out;

    -- bubble_select_redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo(BITSELECT,856)
    bubble_select_redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo_q(63 downto 0));

    -- bubble_join_redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo(BITJOIN,852)
    bubble_join_redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo_q <= redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo_data_out;

    -- bubble_select_redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo(BITSELECT,853)
    bubble_select_redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo_q(63 downto 0));

    -- bubble_join_redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo(BITJOIN,849)
    bubble_join_redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo_q <= redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo_data_out;

    -- bubble_select_redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo(BITSELECT,850)
    bubble_select_redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo_q(63 downto 0));

    -- bubble_join_i_load_unnamed_ethash_search35_ethash_search_vunroll_x(BITJOIN,709)
    bubble_join_i_load_unnamed_ethash_search35_ethash_search_vunroll_x_q <= i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_o_readdata_3 & i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_o_readdata_2 & i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_o_readdata_1 & i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_o_readdata_0;

    -- bubble_select_i_load_unnamed_ethash_search35_ethash_search_vunroll_x(BITSELECT,710)
    bubble_select_i_load_unnamed_ethash_search35_ethash_search_vunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_ethash_search35_ethash_search_vunroll_x_q(31 downto 0));
    bubble_select_i_load_unnamed_ethash_search35_ethash_search_vunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_ethash_search35_ethash_search_vunroll_x_q(63 downto 32));
    bubble_select_i_load_unnamed_ethash_search35_ethash_search_vunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_ethash_search35_ethash_search_vunroll_x_q(95 downto 64));
    bubble_select_i_load_unnamed_ethash_search35_ethash_search_vunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_ethash_search35_ethash_search_vunroll_x_q(127 downto 96));

    -- bubble_join_redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo(BITJOIN,756)
    bubble_join_redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo_q <= redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo_data_out;

    -- bubble_select_redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo(BITSELECT,757)
    bubble_select_redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo_q(31 downto 0));

    -- i_scalarizer_3xor_ethash_search(LOGICAL,131)@385
    i_scalarizer_3xor_ethash_search_q <= bubble_select_redist6_bgTrunc_i_scalarizer_3mul_ethash_search_sel_x_b_381_fifo_b xor bubble_select_i_load_unnamed_ethash_search35_ethash_search_vunroll_x_e;

    -- bubble_join_redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo(BITJOIN,759)
    bubble_join_redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo_q <= redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo_data_out;

    -- bubble_select_redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo(BITSELECT,760)
    bubble_select_redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo_q(31 downto 0));

    -- i_scalarizer_2xor_ethash_search(LOGICAL,129)@385
    i_scalarizer_2xor_ethash_search_q <= bubble_select_redist7_bgTrunc_i_scalarizer_2mul_ethash_search_sel_x_b_381_fifo_b xor bubble_select_i_load_unnamed_ethash_search35_ethash_search_vunroll_x_d;

    -- bubble_join_redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo(BITJOIN,762)
    bubble_join_redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo_q <= redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo_data_out;

    -- bubble_select_redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo(BITSELECT,763)
    bubble_select_redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo_q(31 downto 0));

    -- i_scalarizer_1xor1201_ethash_search(LOGICAL,127)@385
    i_scalarizer_1xor1201_ethash_search_q <= bubble_select_redist8_bgTrunc_i_scalarizer_1mul_ethash_search_sel_x_b_381_fifo_b xor bubble_select_i_load_unnamed_ethash_search35_ethash_search_vunroll_x_c;

    -- bubble_join_redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo(BITJOIN,804)
    bubble_join_redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo_q <= redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo_data_out;

    -- bubble_select_redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo(BITSELECT,805)
    bubble_select_redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo_q(31 downto 0));

    -- bubble_join_redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo(BITJOIN,798)
    bubble_join_redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo_q <= redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo_data_out;

    -- bubble_select_redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo(BITSELECT,799)
    bubble_select_redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo_q(31 downto 0));

    -- bubble_join_redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo(BITJOIN,792)
    bubble_join_redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo_q <= redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo_data_out;

    -- bubble_select_redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo(BITSELECT,793)
    bubble_select_redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo_q(31 downto 0));

    -- bubble_join_redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo(BITJOIN,888)
    bubble_join_redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo_q <= redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo_data_out;

    -- bubble_select_redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo(BITSELECT,889)
    bubble_select_redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo_q(31 downto 0));

    -- bubble_join_redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo(BITJOIN,882)
    bubble_join_redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo_q <= redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo_data_out;

    -- bubble_select_redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo(BITSELECT,883)
    bubble_select_redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo_q(31 downto 0));

    -- bubble_join_redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo(BITJOIN,876)
    bubble_join_redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo_q <= redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo_data_out;

    -- bubble_select_redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo(BITSELECT,877)
    bubble_select_redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo_q(31 downto 0));

    -- bubble_join_redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo(BITJOIN,870)
    bubble_join_redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo_q <= redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo_data_out;

    -- bubble_select_redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo(BITSELECT,871)
    bubble_select_redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo_q(31 downto 0));

    -- bubble_join_redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo(BITJOIN,834)
    bubble_join_redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo_q <= redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo_data_out;

    -- bubble_select_redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo(BITSELECT,835)
    bubble_select_redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo_q(31 downto 0));

    -- bubble_join_redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo(BITJOIN,828)
    bubble_join_redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo_q <= redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo_data_out;

    -- bubble_select_redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo(BITSELECT,829)
    bubble_select_redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo_q(31 downto 0));

    -- bubble_join_redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo(BITJOIN,822)
    bubble_join_redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo_q <= redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo_data_out;

    -- bubble_select_redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo(BITSELECT,823)
    bubble_select_redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo_q(31 downto 0));

    -- bubble_join_redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo(BITJOIN,816)
    bubble_join_redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo_q <= redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo_data_out;

    -- bubble_select_redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo(BITSELECT,817)
    bubble_select_redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo_q(31 downto 0));

    -- bubble_join_redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo(BITJOIN,810)
    bubble_join_redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo_q <= redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo_data_out;

    -- bubble_select_redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo(BITSELECT,811)
    bubble_select_redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo_q(31 downto 0));

    -- bubble_join_redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo(BITJOIN,765)
    bubble_join_redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo_q <= redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo_data_out;

    -- bubble_select_redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo(BITSELECT,766)
    bubble_select_redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo_q(31 downto 0));

    -- i_scalarizer_0xor1200_ethash_search(LOGICAL,125)@385
    i_scalarizer_0xor1200_ethash_search_q <= bubble_select_redist9_bgTrunc_i_scalarizer_0mul_ethash_search_sel_x_b_381_fifo_b xor bubble_select_i_load_unnamed_ethash_search35_ethash_search_vunroll_x_b;

    -- bubble_join_redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo(BITJOIN,807)
    bubble_join_redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo_q <= redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo_data_out;

    -- bubble_select_redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo(BITSELECT,808)
    bubble_select_redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo_q(31 downto 0));

    -- bubble_join_redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo(BITJOIN,801)
    bubble_join_redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo_q <= redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo_data_out;

    -- bubble_select_redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo(BITSELECT,802)
    bubble_select_redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo_q(31 downto 0));

    -- bubble_join_redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo(BITJOIN,795)
    bubble_join_redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo_q <= redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo_data_out;

    -- bubble_select_redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo(BITSELECT,796)
    bubble_select_redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo_q(31 downto 0));

    -- bubble_join_redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo(BITJOIN,789)
    bubble_join_redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo_q <= redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo_data_out;

    -- bubble_select_redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo(BITSELECT,790)
    bubble_select_redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo_q(31 downto 0));

    -- bubble_join_redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo(BITJOIN,885)
    bubble_join_redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo_q <= redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo_data_out;

    -- bubble_select_redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo(BITSELECT,886)
    bubble_select_redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo_q(31 downto 0));

    -- bubble_join_redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo(BITJOIN,879)
    bubble_join_redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo_q <= redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo_data_out;

    -- bubble_select_redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo(BITSELECT,880)
    bubble_select_redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo_q(31 downto 0));

    -- bubble_join_redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo(BITJOIN,873)
    bubble_join_redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo_q <= redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo_data_out;

    -- bubble_select_redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo(BITSELECT,874)
    bubble_select_redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo_q(31 downto 0));

    -- bubble_join_redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo(BITJOIN,867)
    bubble_join_redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo_q <= redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo_data_out;

    -- bubble_select_redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo(BITSELECT,868)
    bubble_select_redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo_q(31 downto 0));

    -- bubble_join_redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo(BITJOIN,831)
    bubble_join_redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo_q <= redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo_data_out;

    -- bubble_select_redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo(BITSELECT,832)
    bubble_select_redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo_q(31 downto 0));

    -- bubble_join_redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo(BITJOIN,825)
    bubble_join_redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo_q <= redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo_data_out;

    -- bubble_select_redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo(BITSELECT,826)
    bubble_select_redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo_q(31 downto 0));

    -- bubble_join_redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo(BITJOIN,819)
    bubble_join_redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo_q <= redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo_data_out;

    -- bubble_select_redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo(BITSELECT,820)
    bubble_select_redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo_q(31 downto 0));

    -- bubble_join_redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo(BITJOIN,813)
    bubble_join_redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo_q <= redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo_data_out;

    -- bubble_select_redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo(BITSELECT,814)
    bubble_select_redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo_q(31 downto 0));

    -- bubble_join_redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo(BITJOIN,912)
    bubble_join_redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo_q <= redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo_data_out;

    -- bubble_select_redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo(BITSELECT,913)
    bubble_select_redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo_q(63 downto 0));

    -- bubble_join_redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo(BITJOIN,786)
    bubble_join_redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo_q <= redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo_data_out;

    -- bubble_select_redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo(BITSELECT,787)
    bubble_select_redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo_q(31 downto 0));

    -- bubble_join_redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo(BITJOIN,783)
    bubble_join_redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo_q <= redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo_data_out;

    -- bubble_select_redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo(BITSELECT,784)
    bubble_select_redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo_q(31 downto 0));

    -- bubble_join_redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo(BITJOIN,753)
    bubble_join_redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo_q <= redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo_data_out;

    -- bubble_select_redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo(BITSELECT,754)
    bubble_select_redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo_q(63 downto 0));

    -- bubble_join_redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo(BITJOIN,768)
    bubble_join_redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo_q <= redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo_data_out;

    -- bubble_select_redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo(BITSELECT,769)
    bubble_select_redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo_q(31 downto 0));

    -- bubble_join_redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo(BITJOIN,780)
    bubble_join_redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_q <= redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_data_out;

    -- bubble_select_redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo(BITSELECT,781)
    bubble_select_redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_q(2 downto 0));

    -- i_exitcond8_ethash_search_cmp_sign(LOGICAL,383)@385
    i_exitcond8_ethash_search_cmp_sign_q <= STD_LOGIC_VECTOR(bubble_select_redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_b(2 downto 2));

    -- i_i66_2906_lc_innerphi_ethash_search(MUX,112)@385
    i_i66_2906_lc_innerphi_ethash_search_s <= i_exitcond8_ethash_search_cmp_sign_q;
    i_i66_2906_lc_innerphi_ethash_search_combproc: PROCESS (i_i66_2906_lc_innerphi_ethash_search_s, bubble_select_redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo_b, dupName_1_c_i32_0gr_x_q)
    BEGIN
        CASE (i_i66_2906_lc_innerphi_ethash_search_s) IS
            WHEN "0" => i_i66_2906_lc_innerphi_ethash_search_q <= bubble_select_redist10_bgTrunc_i_inc87_ethash_search_sel_x_b_384_fifo_b;
            WHEN "1" => i_i66_2906_lc_innerphi_ethash_search_q <= dupName_1_c_i32_0gr_x_q;
            WHEN OTHERS => i_i66_2906_lc_innerphi_ethash_search_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- bubble_join_redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo(BITJOIN,891)
    bubble_join_redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo_q <= redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo_data_out;

    -- bubble_select_redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo(BITSELECT,892)
    bubble_select_redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo_q(31 downto 0));

    -- bubble_join_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo(BITJOIN,936)
    bubble_join_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_q <= redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_data_out;

    -- bubble_select_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo(BITSELECT,937)
    bubble_select_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_q(31 downto 0));

    -- xMSB_uid196_i_fpgaindvars_iv6_lobit_ethash_search_ethash_search254_shift_x(BITSELECT,195)@385
    xMSB_uid196_i_fpgaindvars_iv6_lobit_ethash_search_ethash_search254_shift_x_b <= STD_LOGIC_VECTOR(bubble_select_redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_b(2 downto 2));

    -- seMsb_to2_uid198(BITSELECT,197)@385
    seMsb_to2_uid198_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((1 downto 1 => xMSB_uid196_i_fpgaindvars_iv6_lobit_ethash_search_ethash_search254_shift_x_b(0)) & xMSB_uid196_i_fpgaindvars_iv6_lobit_ethash_search_ethash_search254_shift_x_b));
    seMsb_to2_uid198_b <= STD_LOGIC_VECTOR(seMsb_to2_uid198_in(1 downto 0));

    -- rightShiftStage0Idx1Rng2_uid199_i_fpgaindvars_iv6_lobit_ethash_search_ethash_search254_shift_x(BITSELECT,198)@385
    rightShiftStage0Idx1Rng2_uid199_i_fpgaindvars_iv6_lobit_ethash_search_ethash_search254_shift_x_b <= bubble_select_redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_b(2 downto 2);

    -- rightShiftStage0Idx1_uid200_i_fpgaindvars_iv6_lobit_ethash_search_ethash_search254_shift_x(BITJOIN,199)@385
    rightShiftStage0Idx1_uid200_i_fpgaindvars_iv6_lobit_ethash_search_ethash_search254_shift_x_q <= seMsb_to2_uid198_b & rightShiftStage0Idx1Rng2_uid199_i_fpgaindvars_iv6_lobit_ethash_search_ethash_search254_shift_x_b;

    -- rightShiftStage0_uid202_i_fpgaindvars_iv6_lobit_ethash_search_ethash_search254_shift_x(MUX,201)@385
    rightShiftStage0_uid202_i_fpgaindvars_iv6_lobit_ethash_search_ethash_search254_shift_x_s <= VCC_q;
    rightShiftStage0_uid202_i_fpgaindvars_iv6_lobit_ethash_search_ethash_search254_shift_x_combproc: PROCESS (rightShiftStage0_uid202_i_fpgaindvars_iv6_lobit_ethash_search_ethash_search254_shift_x_s, bubble_select_redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_b, rightShiftStage0Idx1_uid200_i_fpgaindvars_iv6_lobit_ethash_search_ethash_search254_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid202_i_fpgaindvars_iv6_lobit_ethash_search_ethash_search254_shift_x_s) IS
            WHEN "0" => rightShiftStage0_uid202_i_fpgaindvars_iv6_lobit_ethash_search_ethash_search254_shift_x_q <= bubble_select_redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_b;
            WHEN "1" => rightShiftStage0_uid202_i_fpgaindvars_iv6_lobit_ethash_search_ethash_search254_shift_x_q <= rightShiftStage0Idx1_uid200_i_fpgaindvars_iv6_lobit_ethash_search_ethash_search254_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid202_i_fpgaindvars_iv6_lobit_ethash_search_ethash_search254_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_unnamed_ethash_search325_sel_x(BITSELECT,78)@385
    i_unnamed_ethash_search325_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(rightShiftStage0_uid202_i_fpgaindvars_iv6_lobit_ethash_search_ethash_search254_shift_x_q(2 downto 0)), 5)));

    -- bubble_join_redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo(BITJOIN,771)
    bubble_join_redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_q <= redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_data_out;

    -- bubble_select_redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo(BITSELECT,772)
    bubble_select_redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_q(4 downto 0));

    -- i_fpgaindvars_iv9_lc_outerphi_ethash_search(ADD,110)@385
    i_fpgaindvars_iv9_lc_outerphi_ethash_search_a <= STD_LOGIC_VECTOR("0" & bubble_select_redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_b);
    i_fpgaindvars_iv9_lc_outerphi_ethash_search_b <= STD_LOGIC_VECTOR("0" & i_unnamed_ethash_search325_sel_x_b);
    i_fpgaindvars_iv9_lc_outerphi_ethash_search_o <= STD_LOGIC_VECTOR(UNSIGNED(i_fpgaindvars_iv9_lc_outerphi_ethash_search_a) + UNSIGNED(i_fpgaindvars_iv9_lc_outerphi_ethash_search_b));
    i_fpgaindvars_iv9_lc_outerphi_ethash_search_q <= i_fpgaindvars_iv9_lc_outerphi_ethash_search_o(5 downto 0);

    -- bgTrunc_i_fpgaindvars_iv9_lc_outerphi_ethash_search_sel_x(BITSELECT,7)@385
    bgTrunc_i_fpgaindvars_iv9_lc_outerphi_ethash_search_sel_x_b <= i_fpgaindvars_iv9_lc_outerphi_ethash_search_q(4 downto 0);

    -- c_i3_2gr(CONSTANT,96)
    c_i3_2gr_q <= "010";

    -- c_i3_1gr(CONSTANT,95)
    c_i3_1gr_q <= "111";

    -- i_fpgaindvars_iv_next7_ethash_search(ADD,111)@385
    i_fpgaindvars_iv_next7_ethash_search_a <= STD_LOGIC_VECTOR("0" & bubble_select_redist14_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_2_384_fifo_b);
    i_fpgaindvars_iv_next7_ethash_search_b <= STD_LOGIC_VECTOR("0" & c_i3_1gr_q);
    i_fpgaindvars_iv_next7_ethash_search_o <= STD_LOGIC_VECTOR(UNSIGNED(i_fpgaindvars_iv_next7_ethash_search_a) + UNSIGNED(i_fpgaindvars_iv_next7_ethash_search_b));
    i_fpgaindvars_iv_next7_ethash_search_q <= i_fpgaindvars_iv_next7_ethash_search_o(3 downto 0);

    -- bgTrunc_i_fpgaindvars_iv_next7_ethash_search_sel_x(BITSELECT,8)@385
    bgTrunc_i_fpgaindvars_iv_next7_ethash_search_sel_x_b <= i_fpgaindvars_iv_next7_ethash_search_q(2 downto 0);

    -- i_fpgaindvars_iv6_lc_innerphi_ethash_search(MUX,109)@385
    i_fpgaindvars_iv6_lc_innerphi_ethash_search_s <= i_exitcond8_ethash_search_cmp_sign_q;
    i_fpgaindvars_iv6_lc_innerphi_ethash_search_combproc: PROCESS (i_fpgaindvars_iv6_lc_innerphi_ethash_search_s, bgTrunc_i_fpgaindvars_iv_next7_ethash_search_sel_x_b, c_i3_2gr_q)
    BEGIN
        CASE (i_fpgaindvars_iv6_lc_innerphi_ethash_search_s) IS
            WHEN "0" => i_fpgaindvars_iv6_lc_innerphi_ethash_search_q <= bgTrunc_i_fpgaindvars_iv_next7_ethash_search_sel_x_b;
            WHEN "1" => i_fpgaindvars_iv6_lc_innerphi_ethash_search_q <= c_i3_2gr_q;
            WHEN OTHERS => i_fpgaindvars_iv6_lc_innerphi_ethash_search_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- bubble_join_redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo(BITJOIN,864)
    bubble_join_redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo_q <= redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo_data_out;

    -- bubble_select_redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo(BITSELECT,865)
    bubble_select_redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo_q(3 downto 0));

    -- i_exitcond8_neg_ethash_search(LOGICAL,107)@385
    i_exitcond8_neg_ethash_search_q <= i_exitcond8_ethash_search_cmp_sign_q xor VCC_q;

    -- c_i5_1gr(CONSTANT,97)
    c_i5_1gr_q <= "11111";

    -- i_exitcond11_ethash_search(COMPARE,105)@385
    i_exitcond11_ethash_search_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((6 downto 5 => c_i5_1gr_q(4)) & c_i5_1gr_q));
    i_exitcond11_ethash_search_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((6 downto 5 => bubble_select_redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_b(4)) & bubble_select_redist11_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_0_384_fifo_b));
    i_exitcond11_ethash_search_o <= STD_LOGIC_VECTOR(SIGNED(i_exitcond11_ethash_search_a) - SIGNED(i_exitcond11_ethash_search_b));
    i_exitcond11_ethash_search_c(0) <= i_exitcond11_ethash_search_o(6);

    -- i_for_end91_lc_cond_ethash_search(LOGICAL,108)@385
    i_for_end91_lc_cond_ethash_search_q <= i_exitcond11_ethash_search_c or i_exitcond8_neg_ethash_search_q;

    -- bubble_join_redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo(BITJOIN,903)
    bubble_join_redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo_q <= redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo_data_out;

    -- bubble_select_redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo(BITSELECT,904)
    bubble_select_redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo_q(0 downto 0));

    -- bubble_join_redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo(BITJOIN,900)
    bubble_join_redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo_q <= redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo_data_out;

    -- bubble_select_redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo(BITSELECT,901)
    bubble_select_redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo_q(0 downto 0));

    -- bubble_join_redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo(BITJOIN,846)
    bubble_join_redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo_q <= redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo_data_out;

    -- bubble_select_redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo(BITSELECT,847)
    bubble_select_redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo_q(63 downto 0));

    -- bubble_join_redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo(BITJOIN,843)
    bubble_join_redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo_q <= redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo_data_out;

    -- bubble_select_redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo(BITSELECT,844)
    bubble_select_redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo_q(63 downto 0));

    -- bubble_join_redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo(BITJOIN,840)
    bubble_join_redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo_q <= redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo_data_out;

    -- bubble_select_redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo(BITSELECT,841)
    bubble_select_redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo_q(63 downto 0));

    -- bubble_join_redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo(BITJOIN,837)
    bubble_join_redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo_q <= redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo_data_out;

    -- bubble_select_redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo(BITSELECT,838)
    bubble_select_redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo_q(0 downto 0));

    -- bubble_join_redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo(BITJOIN,915)
    bubble_join_redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo_q <= redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo_data_out;

    -- bubble_select_redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo(BITSELECT,916)
    bubble_select_redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo_q(63 downto 0));

    -- bubble_join_redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo(BITJOIN,918)
    bubble_join_redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo_q <= redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo_data_out;

    -- bubble_select_redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo(BITSELECT,919)
    bubble_select_redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo_q(63 downto 0));

    -- bubble_join_redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo(BITJOIN,927)
    bubble_join_redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo_q <= redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo_data_out;

    -- bubble_select_redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo(BITSELECT,928)
    bubble_select_redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo_q(63 downto 0));

    -- bubble_join_redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo(BITJOIN,897)
    bubble_join_redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo_q <= redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo_data_out;

    -- bubble_select_redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo(BITSELECT,898)
    bubble_select_redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo_q(31 downto 0));

    -- c_i32_4gr(CONSTANT,92)
    c_i32_4gr_q <= "00000000000000000000000000000100";

    -- i_add90_ethash_search(ADD,103)@385
    i_add90_ethash_search_a <= STD_LOGIC_VECTOR("0" & bubble_select_redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_b);
    i_add90_ethash_search_b <= STD_LOGIC_VECTOR("0" & c_i32_4gr_q);
    i_add90_ethash_search_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add90_ethash_search_a) + UNSIGNED(i_add90_ethash_search_b));
    i_add90_ethash_search_q <= i_add90_ethash_search_o(32 downto 0);

    -- bgTrunc_i_add90_ethash_search_sel_x(BITSELECT,6)@385
    bgTrunc_i_add90_ethash_search_sel_x_b <= i_add90_ethash_search_q(31 downto 0);

    -- bubble_join_redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo(BITJOIN,777)
    bubble_join_redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_q <= redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_data_out;

    -- bubble_select_redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo(BITSELECT,778)
    bubble_select_redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_q(31 downto 0));

    -- i_a_1907_lc_outerphi_ethash_search(MUX,102)@385
    i_a_1907_lc_outerphi_ethash_search_s <= i_exitcond8_ethash_search_cmp_sign_q;
    i_a_1907_lc_outerphi_ethash_search_combproc: PROCESS (i_a_1907_lc_outerphi_ethash_search_s, bubble_select_redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_b, bgTrunc_i_add90_ethash_search_sel_x_b)
    BEGIN
        CASE (i_a_1907_lc_outerphi_ethash_search_s) IS
            WHEN "0" => i_a_1907_lc_outerphi_ethash_search_q <= bubble_select_redist13_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_1_384_fifo_b;
            WHEN "1" => i_a_1907_lc_outerphi_ethash_search_q <= bgTrunc_i_add90_ethash_search_sel_x_b;
            WHEN OTHERS => i_a_1907_lc_outerphi_ethash_search_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- dupName_0_sync_out_vunroll_x(GPOUT,3)@385
    out_a_1907_LC_OuterPHI <= i_a_1907_lc_outerphi_ethash_search_q;
    out_and_RM155 <= bubble_select_redist53_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_42_384_fifo_b;
    out_arraydecay51_RM166 <= bubble_select_redist63_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_48_384_fifo_b;
    out_arrayidx36_2_RM165 <= bubble_select_redist60_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_47_384_fifo_b;
    out_arrayidx45_RM163 <= bubble_select_redist59_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_46_384_fifo_b;
    out_c0_exe1105 <= bubble_select_redist33_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_23_384_fifo_b;
    out_c0_exe2110 <= bubble_select_redist34_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_24_384_fifo_b;
    out_c0_exe3114 <= bubble_select_redist35_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_25_384_fifo_b;
    out_c0_exe4118 <= bubble_select_redist36_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_26_384_fifo_b;
    out_cmp23157 <= bubble_select_redist54_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_43_384_fifo_b;
    out_cmp23_xor159 <= bubble_select_redist55_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_44_384_fifo_b;
    out_for_end91_LC_COND <= i_for_end91_lc_cond_ethash_search_q;
    out_fpgaindvars_iv12136 <= bubble_select_redist42_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_32_384_fifo_b;
    out_fpgaindvars_iv6_LC_InnerPHI <= i_fpgaindvars_iv6_lc_innerphi_ethash_search_q;
    out_fpgaindvars_iv9_LC_OuterPHI <= bgTrunc_i_fpgaindvars_iv9_lc_outerphi_ethash_search_sel_x_b;
    out_global_id_0194 <= bubble_select_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_b;
    out_i18_0908154 <= bubble_select_redist51_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_41_384_fifo_b;
    out_i66_2906_LC_InnerPHI <= i_i66_2906_lc_innerphi_ethash_search_q;
    out_idxprom80_RM <= bubble_select_redist4_i_idxprom80_rm_ethash_search_vt_join_q_153_fifo_b;
    out_l_grpid_05 <= bubble_select_redist15_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_5_384_fifo_b;
    out_l_grpid_0_addr11 <= bubble_select_redist16_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_6_384_fifo_b;
    out_l_grpid_0_addr_zext161 <= bubble_select_redist58_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_45_384_fifo_b;
    out_scalarizer_0100164 <= bubble_select_redist25_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_15_384_fifo_b;
    out_scalarizer_0100374 <= bubble_select_redist27_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_17_384_fifo_b;
    out_scalarizer_0100584 <= bubble_select_redist29_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_19_384_fifo_b;
    out_scalarizer_0100794 <= bubble_select_redist31_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_21_384_fifo_b;
    out_scalarizer_01173138 <= bubble_select_redist43_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_33_384_fifo_b;
    out_scalarizer_01175142 <= bubble_select_redist45_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_35_384_fifo_b;
    out_scalarizer_01177146 <= bubble_select_redist47_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_37_384_fifo_b;
    out_scalarizer_01179150 <= bubble_select_redist49_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_39_384_fifo_b;
    out_scalarizer_099324 <= bubble_select_redist17_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_7_384_fifo_b;
    out_scalarizer_099534 <= bubble_select_redist19_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_9_384_fifo_b;
    out_scalarizer_099744 <= bubble_select_redist21_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_11_384_fifo_b;
    out_scalarizer_099954 <= bubble_select_redist23_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_13_384_fifo_b;
    out_scalarizer_0xor1200 <= i_scalarizer_0xor1200_ethash_search_q;
    out_scalarizer_1100059 <= bubble_select_redist24_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_14_384_fifo_b;
    out_scalarizer_1100269 <= bubble_select_redist26_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_16_384_fifo_b;
    out_scalarizer_1100479 <= bubble_select_redist28_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_18_384_fifo_b;
    out_scalarizer_1100689 <= bubble_select_redist30_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_20_384_fifo_b;
    out_scalarizer_1100899 <= bubble_select_redist32_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_22_384_fifo_b;
    out_scalarizer_11174140 <= bubble_select_redist44_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_34_384_fifo_b;
    out_scalarizer_11176144 <= bubble_select_redist46_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_36_384_fifo_b;
    out_scalarizer_11178148 <= bubble_select_redist48_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_38_384_fifo_b;
    out_scalarizer_11180152 <= bubble_select_redist50_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_40_384_fifo_b;
    out_scalarizer_199429 <= bubble_select_redist18_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_8_384_fifo_b;
    out_scalarizer_199639 <= bubble_select_redist20_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_10_384_fifo_b;
    out_scalarizer_199849 <= bubble_select_redist22_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_12_384_fifo_b;
    out_scalarizer_1xor1201 <= i_scalarizer_1xor1201_ethash_search_q;
    out_scalarizer_2xor <= i_scalarizer_2xor_ethash_search_q;
    out_scalarizer_3xor <= i_scalarizer_3xor_ethash_search_q;
    out_state_0_0_cast122 <= bubble_select_redist37_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_27_384_fifo_b;
    out_state_4_0_cast125 <= bubble_select_redist38_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_28_384_fifo_b;
    out_state_5_0_cast128 <= bubble_select_redist39_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_29_384_fifo_b;
    out_state_6_0_cast131 <= bubble_select_redist40_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_30_384_fifo_b;
    out_state_7_0_cast134 <= bubble_select_redist41_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_31_384_fifo_b;
    out_unnamed_ethash_search32 <= bubble_select_redist64_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_49_384_fifo_b;
    out_valid_out <= SE_out_redist66_ethash_search_B4_merge_reg_aunroll_vunroll_x_out_data_out_50_384_fifo_V0;
    out_xor_i679_3_0 <= i_scalarizer_0xor1200_ethash_search_q;
    out_xor_i679_3_1 <= i_scalarizer_1xor1201_ethash_search_q;
    out_xor_i679_3_2 <= i_scalarizer_2xor_ethash_search_q;
    out_xor_i679_3_3 <= i_scalarizer_3xor_ethash_search_q;

    -- dupName_0_ext_sig_sync_out_x(GPOUT,17)
    out_unnamed_ethash_search34_avm_address <= i_load_unnamed_ethash_search34_ethash_search_out_unnamed_ethash_search34_avm_address;
    out_unnamed_ethash_search34_avm_enable <= i_load_unnamed_ethash_search34_ethash_search_out_unnamed_ethash_search34_avm_enable;
    out_unnamed_ethash_search34_avm_read <= i_load_unnamed_ethash_search34_ethash_search_out_unnamed_ethash_search34_avm_read;
    out_unnamed_ethash_search34_avm_write <= i_load_unnamed_ethash_search34_ethash_search_out_unnamed_ethash_search34_avm_write;
    out_unnamed_ethash_search34_avm_writedata <= i_load_unnamed_ethash_search34_ethash_search_out_unnamed_ethash_search34_avm_writedata;
    out_unnamed_ethash_search34_avm_byteenable <= i_load_unnamed_ethash_search34_ethash_search_out_unnamed_ethash_search34_avm_byteenable;
    out_unnamed_ethash_search34_avm_burstcount <= i_load_unnamed_ethash_search34_ethash_search_out_unnamed_ethash_search34_avm_burstcount;

    -- dupName_1_ext_sig_sync_out_x(GPOUT,24)
    out_unnamed_ethash_search35_avm_address <= i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_unnamed_ethash_search35_avm_address;
    out_unnamed_ethash_search35_avm_enable <= i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_unnamed_ethash_search35_avm_enable;
    out_unnamed_ethash_search35_avm_read <= i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_unnamed_ethash_search35_avm_read;
    out_unnamed_ethash_search35_avm_write <= i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_unnamed_ethash_search35_avm_write;
    out_unnamed_ethash_search35_avm_writedata <= i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_unnamed_ethash_search35_avm_writedata;
    out_unnamed_ethash_search35_avm_byteenable <= i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_unnamed_ethash_search35_avm_byteenable;
    out_unnamed_ethash_search35_avm_burstcount <= i_load_unnamed_ethash_search35_ethash_search_vunroll_x_out_unnamed_ethash_search35_avm_burstcount;

    -- ext_sig_sync_out(GPOUT,101)
    out_memdep_204_avm_address <= i_store_memdep_204_ethash_search_out_memdep_204_avm_address;
    out_memdep_204_avm_enable <= i_store_memdep_204_ethash_search_out_memdep_204_avm_enable;
    out_memdep_204_avm_read <= i_store_memdep_204_ethash_search_out_memdep_204_avm_read;
    out_memdep_204_avm_write <= i_store_memdep_204_ethash_search_out_memdep_204_avm_write;
    out_memdep_204_avm_writedata <= i_store_memdep_204_ethash_search_out_memdep_204_avm_writedata;
    out_memdep_204_avm_byteenable <= i_store_memdep_204_ethash_search_out_memdep_204_avm_byteenable;
    out_memdep_204_avm_burstcount <= i_store_memdep_204_ethash_search_out_memdep_204_avm_burstcount;

    -- sync_out(GPOUT,157)@0
    out_stall_out <= SE_stall_entry_vunroll_backStall;

END normal;
