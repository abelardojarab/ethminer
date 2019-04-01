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

-- VHDL created from ethash_search_B4_merge
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

entity ethash_search_B4_merge is
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
        in_fpgaindvars_iv12136_0 : in std_logic_vector(3 downto 0);  -- ufix4
        in_fpgaindvars_iv12136_1 : in std_logic_vector(3 downto 0);  -- ufix4
        in_fpgaindvars_iv6_0 : in std_logic_vector(2 downto 0);  -- ufix3
        in_fpgaindvars_iv6_1 : in std_logic_vector(2 downto 0);  -- ufix3
        in_fpgaindvars_iv9_0 : in std_logic_vector(4 downto 0);  -- ufix5
        in_fpgaindvars_iv9_1 : in std_logic_vector(4 downto 0);  -- ufix5
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
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
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
        in_unnamed_ethash_search32_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_unnamed_ethash_search32_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_mix_pm_2_in_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_mix_pm_2_in_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_mix_pm_2_in_2 : out std_logic_vector(31 downto 0);  -- ufix32
        out_mix_pm_2_in_3 : out std_logic_vector(31 downto 0);  -- ufix32
        out_a_1907 : out std_logic_vector(31 downto 0);  -- ufix32
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
        out_fpgaindvars_iv6 : out std_logic_vector(2 downto 0);  -- ufix3
        out_fpgaindvars_iv9 : out std_logic_vector(4 downto 0);  -- ufix5
        out_global_id_0194 : out std_logic_vector(31 downto 0);  -- ufix32
        out_i18_0908154 : out std_logic_vector(31 downto 0);  -- ufix32
        out_i66_2906 : out std_logic_vector(31 downto 0);  -- ufix32
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
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_state_0_0_cast122 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_4_0_cast125 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_5_0_cast128 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_6_0_cast131 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_7_0_cast134 : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_ethash_search32 : out std_logic_vector(31 downto 0);  -- ufix32
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end ethash_search_B4_merge;

architecture normal of ethash_search_B4_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component dupName_1_priority_encoder_26ui0676j636g6u0qc0xajz is
        port (
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_workgroup_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_select : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mix_pm_2_in_mux_0_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal mix_pm_2_in_mux_0_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal mix_pm_2_in_mux_1_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal mix_pm_2_in_mux_1_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal mix_pm_2_in_mux_2_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal mix_pm_2_in_mux_2_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal mix_pm_2_in_mux_3_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal mix_pm_2_in_mux_3_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal a_1907_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal a_1907_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal and_RM155_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal and_RM155_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal arraydecay51_RM166_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arraydecay51_RM166_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx36_2_RM165_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx36_2_RM165_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx45_RM163_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx45_RM163_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe1105_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe1105_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe2110_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe2110_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe3114_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe3114_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe4118_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe4118_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal cmp23157_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal cmp23157_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cmp23_xor159_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal cmp23_xor159_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fpgaindvars_iv12136_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fpgaindvars_iv12136_mux_q : STD_LOGIC_VECTOR (3 downto 0);
    signal fpgaindvars_iv6_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fpgaindvars_iv6_mux_q : STD_LOGIC_VECTOR (2 downto 0);
    signal fpgaindvars_iv9_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fpgaindvars_iv9_mux_q : STD_LOGIC_VECTOR (4 downto 0);
    signal global_id_0194_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal global_id_0194_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i18_0908154_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i18_0908154_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i66_2906_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i66_2906_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal l_grpid_05_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal l_grpid_05_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal l_grpid_0_addr11_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal l_grpid_0_addr11_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal l_grpid_0_addr_zext161_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal l_grpid_0_addr_zext161_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal not_select_q : STD_LOGIC_VECTOR (0 downto 0);
    signal priority_encoder_out_o_select : STD_LOGIC_VECTOR (0 downto 0);
    signal priority_encoder_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_0100164_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_0100164_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_0100374_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_0100374_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_0100584_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_0100584_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_0100794_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_0100794_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01173138_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01173138_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01175142_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01175142_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01177146_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01177146_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_01179150_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_01179150_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_099324_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_099324_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_099534_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_099534_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_099744_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_099744_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_099954_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_099954_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_1100059_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_1100059_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_1100269_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_1100269_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_1100479_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_1100479_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_1100689_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_1100689_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_1100899_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_1100899_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11174140_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11174140_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11176144_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11176144_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11178148_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11178148_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_11180152_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_11180152_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_199429_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_199429_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_199639_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_199639_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal scalarizer_199849_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal scalarizer_199849_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal stall_out_0_specific_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_out_1_specific_q : STD_LOGIC_VECTOR (0 downto 0);
    signal state_0_0_cast122_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal state_0_0_cast122_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal state_4_0_cast125_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal state_4_0_cast125_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal state_5_0_cast128_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal state_5_0_cast128_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal state_6_0_cast131_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal state_6_0_cast131_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal state_7_0_cast134_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal state_7_0_cast134_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal unnamed_ethash_search32_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_ethash_search32_mux_q : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- priority_encoder(BLACKBOX,196)
    thepriority_encoder : dupName_1_priority_encoder_26ui0676j636g6u0qc0xajz
    PORT MAP (
        in_i_stall => in_stall_in,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        in_workgroup_size => in_encoder_ethash_search_B4_merge_priority_encoder_workgroup_size,
        out_o_select => priority_encoder_out_o_select,
        out_o_valid => priority_encoder_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- mix_pm_2_in_mux_0_x(MUX,114)
    mix_pm_2_in_mux_0_x_s <= priority_encoder_out_o_select;
    mix_pm_2_in_mux_0_x_combproc: PROCESS (mix_pm_2_in_mux_0_x_s, in_mix_pm_2_in_0_0, in_mix_pm_2_in_1_0)
    BEGIN
        CASE (mix_pm_2_in_mux_0_x_s) IS
            WHEN "0" => mix_pm_2_in_mux_0_x_q <= in_mix_pm_2_in_0_0;
            WHEN "1" => mix_pm_2_in_mux_0_x_q <= in_mix_pm_2_in_1_0;
            WHEN OTHERS => mix_pm_2_in_mux_0_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_mix_pm_2_in_0(GPOUT,118)
    out_mix_pm_2_in_0 <= mix_pm_2_in_mux_0_x_q;

    -- mix_pm_2_in_mux_1_x(MUX,115)
    mix_pm_2_in_mux_1_x_s <= priority_encoder_out_o_select;
    mix_pm_2_in_mux_1_x_combproc: PROCESS (mix_pm_2_in_mux_1_x_s, in_mix_pm_2_in_0_1, in_mix_pm_2_in_1_1)
    BEGIN
        CASE (mix_pm_2_in_mux_1_x_s) IS
            WHEN "0" => mix_pm_2_in_mux_1_x_q <= in_mix_pm_2_in_0_1;
            WHEN "1" => mix_pm_2_in_mux_1_x_q <= in_mix_pm_2_in_1_1;
            WHEN OTHERS => mix_pm_2_in_mux_1_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_mix_pm_2_in_1(GPOUT,119)
    out_mix_pm_2_in_1 <= mix_pm_2_in_mux_1_x_q;

    -- mix_pm_2_in_mux_2_x(MUX,116)
    mix_pm_2_in_mux_2_x_s <= priority_encoder_out_o_select;
    mix_pm_2_in_mux_2_x_combproc: PROCESS (mix_pm_2_in_mux_2_x_s, in_mix_pm_2_in_0_2, in_mix_pm_2_in_1_2)
    BEGIN
        CASE (mix_pm_2_in_mux_2_x_s) IS
            WHEN "0" => mix_pm_2_in_mux_2_x_q <= in_mix_pm_2_in_0_2;
            WHEN "1" => mix_pm_2_in_mux_2_x_q <= in_mix_pm_2_in_1_2;
            WHEN OTHERS => mix_pm_2_in_mux_2_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_mix_pm_2_in_2(GPOUT,120)
    out_mix_pm_2_in_2 <= mix_pm_2_in_mux_2_x_q;

    -- mix_pm_2_in_mux_3_x(MUX,117)
    mix_pm_2_in_mux_3_x_s <= priority_encoder_out_o_select;
    mix_pm_2_in_mux_3_x_combproc: PROCESS (mix_pm_2_in_mux_3_x_s, in_mix_pm_2_in_0_3, in_mix_pm_2_in_1_3)
    BEGIN
        CASE (mix_pm_2_in_mux_3_x_s) IS
            WHEN "0" => mix_pm_2_in_mux_3_x_q <= in_mix_pm_2_in_0_3;
            WHEN "1" => mix_pm_2_in_mux_3_x_q <= in_mix_pm_2_in_1_3;
            WHEN OTHERS => mix_pm_2_in_mux_3_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_mix_pm_2_in_3(GPOUT,121)
    out_mix_pm_2_in_3 <= mix_pm_2_in_mux_3_x_q;

    -- a_1907_mux(MUX,175)
    a_1907_mux_s <= priority_encoder_out_o_select;
    a_1907_mux_combproc: PROCESS (a_1907_mux_s, in_a_1907_0, in_a_1907_1)
    BEGIN
        CASE (a_1907_mux_s) IS
            WHEN "0" => a_1907_mux_q <= in_a_1907_0;
            WHEN "1" => a_1907_mux_q <= in_a_1907_1;
            WHEN OTHERS => a_1907_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_a_1907(GPOUT,122)
    out_a_1907 <= a_1907_mux_q;

    -- and_RM155_mux(MUX,176)
    and_RM155_mux_s <= priority_encoder_out_o_select;
    and_RM155_mux_combproc: PROCESS (and_RM155_mux_s, in_and_RM155_0, in_and_RM155_1)
    BEGIN
        CASE (and_RM155_mux_s) IS
            WHEN "0" => and_RM155_mux_q <= in_and_RM155_0;
            WHEN "1" => and_RM155_mux_q <= in_and_RM155_1;
            WHEN OTHERS => and_RM155_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_and_RM155(GPOUT,123)
    out_and_RM155 <= and_RM155_mux_q;

    -- arraydecay51_RM166_mux(MUX,177)
    arraydecay51_RM166_mux_s <= priority_encoder_out_o_select;
    arraydecay51_RM166_mux_combproc: PROCESS (arraydecay51_RM166_mux_s, in_arraydecay51_RM166_0, in_arraydecay51_RM166_1)
    BEGIN
        CASE (arraydecay51_RM166_mux_s) IS
            WHEN "0" => arraydecay51_RM166_mux_q <= in_arraydecay51_RM166_0;
            WHEN "1" => arraydecay51_RM166_mux_q <= in_arraydecay51_RM166_1;
            WHEN OTHERS => arraydecay51_RM166_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arraydecay51_RM166(GPOUT,124)
    out_arraydecay51_RM166 <= arraydecay51_RM166_mux_q;

    -- arrayidx36_2_RM165_mux(MUX,178)
    arrayidx36_2_RM165_mux_s <= priority_encoder_out_o_select;
    arrayidx36_2_RM165_mux_combproc: PROCESS (arrayidx36_2_RM165_mux_s, in_arrayidx36_2_RM165_0, in_arrayidx36_2_RM165_1)
    BEGIN
        CASE (arrayidx36_2_RM165_mux_s) IS
            WHEN "0" => arrayidx36_2_RM165_mux_q <= in_arrayidx36_2_RM165_0;
            WHEN "1" => arrayidx36_2_RM165_mux_q <= in_arrayidx36_2_RM165_1;
            WHEN OTHERS => arrayidx36_2_RM165_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx36_2_RM165(GPOUT,125)
    out_arrayidx36_2_RM165 <= arrayidx36_2_RM165_mux_q;

    -- arrayidx45_RM163_mux(MUX,179)
    arrayidx45_RM163_mux_s <= priority_encoder_out_o_select;
    arrayidx45_RM163_mux_combproc: PROCESS (arrayidx45_RM163_mux_s, in_arrayidx45_RM163_0, in_arrayidx45_RM163_1)
    BEGIN
        CASE (arrayidx45_RM163_mux_s) IS
            WHEN "0" => arrayidx45_RM163_mux_q <= in_arrayidx45_RM163_0;
            WHEN "1" => arrayidx45_RM163_mux_q <= in_arrayidx45_RM163_1;
            WHEN OTHERS => arrayidx45_RM163_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx45_RM163(GPOUT,126)
    out_arrayidx45_RM163 <= arrayidx45_RM163_mux_q;

    -- c0_exe1105_mux(MUX,180)
    c0_exe1105_mux_s <= priority_encoder_out_o_select;
    c0_exe1105_mux_combproc: PROCESS (c0_exe1105_mux_s, in_c0_exe1105_0, in_c0_exe1105_1)
    BEGIN
        CASE (c0_exe1105_mux_s) IS
            WHEN "0" => c0_exe1105_mux_q <= in_c0_exe1105_0;
            WHEN "1" => c0_exe1105_mux_q <= in_c0_exe1105_1;
            WHEN OTHERS => c0_exe1105_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe1105(GPOUT,127)
    out_c0_exe1105 <= c0_exe1105_mux_q;

    -- c0_exe2110_mux(MUX,181)
    c0_exe2110_mux_s <= priority_encoder_out_o_select;
    c0_exe2110_mux_combproc: PROCESS (c0_exe2110_mux_s, in_c0_exe2110_0, in_c0_exe2110_1)
    BEGIN
        CASE (c0_exe2110_mux_s) IS
            WHEN "0" => c0_exe2110_mux_q <= in_c0_exe2110_0;
            WHEN "1" => c0_exe2110_mux_q <= in_c0_exe2110_1;
            WHEN OTHERS => c0_exe2110_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe2110(GPOUT,128)
    out_c0_exe2110 <= c0_exe2110_mux_q;

    -- c0_exe3114_mux(MUX,182)
    c0_exe3114_mux_s <= priority_encoder_out_o_select;
    c0_exe3114_mux_combproc: PROCESS (c0_exe3114_mux_s, in_c0_exe3114_0, in_c0_exe3114_1)
    BEGIN
        CASE (c0_exe3114_mux_s) IS
            WHEN "0" => c0_exe3114_mux_q <= in_c0_exe3114_0;
            WHEN "1" => c0_exe3114_mux_q <= in_c0_exe3114_1;
            WHEN OTHERS => c0_exe3114_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe3114(GPOUT,129)
    out_c0_exe3114 <= c0_exe3114_mux_q;

    -- c0_exe4118_mux(MUX,183)
    c0_exe4118_mux_s <= priority_encoder_out_o_select;
    c0_exe4118_mux_combproc: PROCESS (c0_exe4118_mux_s, in_c0_exe4118_0, in_c0_exe4118_1)
    BEGIN
        CASE (c0_exe4118_mux_s) IS
            WHEN "0" => c0_exe4118_mux_q <= in_c0_exe4118_0;
            WHEN "1" => c0_exe4118_mux_q <= in_c0_exe4118_1;
            WHEN OTHERS => c0_exe4118_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe4118(GPOUT,130)
    out_c0_exe4118 <= c0_exe4118_mux_q;

    -- cmp23157_mux(MUX,184)
    cmp23157_mux_s <= priority_encoder_out_o_select;
    cmp23157_mux_combproc: PROCESS (cmp23157_mux_s, in_cmp23157_0, in_cmp23157_1)
    BEGIN
        CASE (cmp23157_mux_s) IS
            WHEN "0" => cmp23157_mux_q <= in_cmp23157_0;
            WHEN "1" => cmp23157_mux_q <= in_cmp23157_1;
            WHEN OTHERS => cmp23157_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_cmp23157(GPOUT,131)
    out_cmp23157 <= cmp23157_mux_q;

    -- cmp23_xor159_mux(MUX,185)
    cmp23_xor159_mux_s <= priority_encoder_out_o_select;
    cmp23_xor159_mux_combproc: PROCESS (cmp23_xor159_mux_s, in_cmp23_xor159_0, in_cmp23_xor159_1)
    BEGIN
        CASE (cmp23_xor159_mux_s) IS
            WHEN "0" => cmp23_xor159_mux_q <= in_cmp23_xor159_0;
            WHEN "1" => cmp23_xor159_mux_q <= in_cmp23_xor159_1;
            WHEN OTHERS => cmp23_xor159_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_cmp23_xor159(GPOUT,132)
    out_cmp23_xor159 <= cmp23_xor159_mux_q;

    -- fpgaindvars_iv12136_mux(MUX,186)
    fpgaindvars_iv12136_mux_s <= priority_encoder_out_o_select;
    fpgaindvars_iv12136_mux_combproc: PROCESS (fpgaindvars_iv12136_mux_s, in_fpgaindvars_iv12136_0, in_fpgaindvars_iv12136_1)
    BEGIN
        CASE (fpgaindvars_iv12136_mux_s) IS
            WHEN "0" => fpgaindvars_iv12136_mux_q <= in_fpgaindvars_iv12136_0;
            WHEN "1" => fpgaindvars_iv12136_mux_q <= in_fpgaindvars_iv12136_1;
            WHEN OTHERS => fpgaindvars_iv12136_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_fpgaindvars_iv12136(GPOUT,133)
    out_fpgaindvars_iv12136 <= fpgaindvars_iv12136_mux_q;

    -- fpgaindvars_iv6_mux(MUX,187)
    fpgaindvars_iv6_mux_s <= priority_encoder_out_o_select;
    fpgaindvars_iv6_mux_combproc: PROCESS (fpgaindvars_iv6_mux_s, in_fpgaindvars_iv6_0, in_fpgaindvars_iv6_1)
    BEGIN
        CASE (fpgaindvars_iv6_mux_s) IS
            WHEN "0" => fpgaindvars_iv6_mux_q <= in_fpgaindvars_iv6_0;
            WHEN "1" => fpgaindvars_iv6_mux_q <= in_fpgaindvars_iv6_1;
            WHEN OTHERS => fpgaindvars_iv6_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_fpgaindvars_iv6(GPOUT,134)
    out_fpgaindvars_iv6 <= fpgaindvars_iv6_mux_q;

    -- fpgaindvars_iv9_mux(MUX,188)
    fpgaindvars_iv9_mux_s <= priority_encoder_out_o_select;
    fpgaindvars_iv9_mux_combproc: PROCESS (fpgaindvars_iv9_mux_s, in_fpgaindvars_iv9_0, in_fpgaindvars_iv9_1)
    BEGIN
        CASE (fpgaindvars_iv9_mux_s) IS
            WHEN "0" => fpgaindvars_iv9_mux_q <= in_fpgaindvars_iv9_0;
            WHEN "1" => fpgaindvars_iv9_mux_q <= in_fpgaindvars_iv9_1;
            WHEN OTHERS => fpgaindvars_iv9_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_fpgaindvars_iv9(GPOUT,135)
    out_fpgaindvars_iv9 <= fpgaindvars_iv9_mux_q;

    -- global_id_0194_mux(MUX,189)
    global_id_0194_mux_s <= priority_encoder_out_o_select;
    global_id_0194_mux_combproc: PROCESS (global_id_0194_mux_s, in_global_id_0194_0, in_global_id_0194_1)
    BEGIN
        CASE (global_id_0194_mux_s) IS
            WHEN "0" => global_id_0194_mux_q <= in_global_id_0194_0;
            WHEN "1" => global_id_0194_mux_q <= in_global_id_0194_1;
            WHEN OTHERS => global_id_0194_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_global_id_0194(GPOUT,136)
    out_global_id_0194 <= global_id_0194_mux_q;

    -- i18_0908154_mux(MUX,190)
    i18_0908154_mux_s <= priority_encoder_out_o_select;
    i18_0908154_mux_combproc: PROCESS (i18_0908154_mux_s, in_i18_0908154_0, in_i18_0908154_1)
    BEGIN
        CASE (i18_0908154_mux_s) IS
            WHEN "0" => i18_0908154_mux_q <= in_i18_0908154_0;
            WHEN "1" => i18_0908154_mux_q <= in_i18_0908154_1;
            WHEN OTHERS => i18_0908154_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_i18_0908154(GPOUT,137)
    out_i18_0908154 <= i18_0908154_mux_q;

    -- i66_2906_mux(MUX,191)
    i66_2906_mux_s <= priority_encoder_out_o_select;
    i66_2906_mux_combproc: PROCESS (i66_2906_mux_s, in_i66_2906_0, in_i66_2906_1)
    BEGIN
        CASE (i66_2906_mux_s) IS
            WHEN "0" => i66_2906_mux_q <= in_i66_2906_0;
            WHEN "1" => i66_2906_mux_q <= in_i66_2906_1;
            WHEN OTHERS => i66_2906_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_i66_2906(GPOUT,138)
    out_i66_2906 <= i66_2906_mux_q;

    -- l_grpid_05_mux(MUX,192)
    l_grpid_05_mux_s <= priority_encoder_out_o_select;
    l_grpid_05_mux_combproc: PROCESS (l_grpid_05_mux_s, in_l_grpid_05_0, in_l_grpid_05_1)
    BEGIN
        CASE (l_grpid_05_mux_s) IS
            WHEN "0" => l_grpid_05_mux_q <= in_l_grpid_05_0;
            WHEN "1" => l_grpid_05_mux_q <= in_l_grpid_05_1;
            WHEN OTHERS => l_grpid_05_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_l_grpid_05(GPOUT,139)
    out_l_grpid_05 <= l_grpid_05_mux_q;

    -- l_grpid_0_addr11_mux(MUX,193)
    l_grpid_0_addr11_mux_s <= priority_encoder_out_o_select;
    l_grpid_0_addr11_mux_combproc: PROCESS (l_grpid_0_addr11_mux_s, in_l_grpid_0_addr11_0, in_l_grpid_0_addr11_1)
    BEGIN
        CASE (l_grpid_0_addr11_mux_s) IS
            WHEN "0" => l_grpid_0_addr11_mux_q <= in_l_grpid_0_addr11_0;
            WHEN "1" => l_grpid_0_addr11_mux_q <= in_l_grpid_0_addr11_1;
            WHEN OTHERS => l_grpid_0_addr11_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_l_grpid_0_addr11(GPOUT,140)
    out_l_grpid_0_addr11 <= l_grpid_0_addr11_mux_q;

    -- l_grpid_0_addr_zext161_mux(MUX,194)
    l_grpid_0_addr_zext161_mux_s <= priority_encoder_out_o_select;
    l_grpid_0_addr_zext161_mux_combproc: PROCESS (l_grpid_0_addr_zext161_mux_s, in_l_grpid_0_addr_zext161_0, in_l_grpid_0_addr_zext161_1)
    BEGIN
        CASE (l_grpid_0_addr_zext161_mux_s) IS
            WHEN "0" => l_grpid_0_addr_zext161_mux_q <= in_l_grpid_0_addr_zext161_0;
            WHEN "1" => l_grpid_0_addr_zext161_mux_q <= in_l_grpid_0_addr_zext161_1;
            WHEN OTHERS => l_grpid_0_addr_zext161_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_l_grpid_0_addr_zext161(GPOUT,141)
    out_l_grpid_0_addr_zext161 <= l_grpid_0_addr_zext161_mux_q;

    -- scalarizer_0100164_mux(MUX,197)
    scalarizer_0100164_mux_s <= priority_encoder_out_o_select;
    scalarizer_0100164_mux_combproc: PROCESS (scalarizer_0100164_mux_s, in_scalarizer_0100164_0, in_scalarizer_0100164_1)
    BEGIN
        CASE (scalarizer_0100164_mux_s) IS
            WHEN "0" => scalarizer_0100164_mux_q <= in_scalarizer_0100164_0;
            WHEN "1" => scalarizer_0100164_mux_q <= in_scalarizer_0100164_1;
            WHEN OTHERS => scalarizer_0100164_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_0100164(GPOUT,142)
    out_scalarizer_0100164 <= scalarizer_0100164_mux_q;

    -- scalarizer_0100374_mux(MUX,198)
    scalarizer_0100374_mux_s <= priority_encoder_out_o_select;
    scalarizer_0100374_mux_combproc: PROCESS (scalarizer_0100374_mux_s, in_scalarizer_0100374_0, in_scalarizer_0100374_1)
    BEGIN
        CASE (scalarizer_0100374_mux_s) IS
            WHEN "0" => scalarizer_0100374_mux_q <= in_scalarizer_0100374_0;
            WHEN "1" => scalarizer_0100374_mux_q <= in_scalarizer_0100374_1;
            WHEN OTHERS => scalarizer_0100374_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_0100374(GPOUT,143)
    out_scalarizer_0100374 <= scalarizer_0100374_mux_q;

    -- scalarizer_0100584_mux(MUX,199)
    scalarizer_0100584_mux_s <= priority_encoder_out_o_select;
    scalarizer_0100584_mux_combproc: PROCESS (scalarizer_0100584_mux_s, in_scalarizer_0100584_0, in_scalarizer_0100584_1)
    BEGIN
        CASE (scalarizer_0100584_mux_s) IS
            WHEN "0" => scalarizer_0100584_mux_q <= in_scalarizer_0100584_0;
            WHEN "1" => scalarizer_0100584_mux_q <= in_scalarizer_0100584_1;
            WHEN OTHERS => scalarizer_0100584_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_0100584(GPOUT,144)
    out_scalarizer_0100584 <= scalarizer_0100584_mux_q;

    -- scalarizer_0100794_mux(MUX,200)
    scalarizer_0100794_mux_s <= priority_encoder_out_o_select;
    scalarizer_0100794_mux_combproc: PROCESS (scalarizer_0100794_mux_s, in_scalarizer_0100794_0, in_scalarizer_0100794_1)
    BEGIN
        CASE (scalarizer_0100794_mux_s) IS
            WHEN "0" => scalarizer_0100794_mux_q <= in_scalarizer_0100794_0;
            WHEN "1" => scalarizer_0100794_mux_q <= in_scalarizer_0100794_1;
            WHEN OTHERS => scalarizer_0100794_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_0100794(GPOUT,145)
    out_scalarizer_0100794 <= scalarizer_0100794_mux_q;

    -- scalarizer_01173138_mux(MUX,201)
    scalarizer_01173138_mux_s <= priority_encoder_out_o_select;
    scalarizer_01173138_mux_combproc: PROCESS (scalarizer_01173138_mux_s, in_scalarizer_01173138_0, in_scalarizer_01173138_1)
    BEGIN
        CASE (scalarizer_01173138_mux_s) IS
            WHEN "0" => scalarizer_01173138_mux_q <= in_scalarizer_01173138_0;
            WHEN "1" => scalarizer_01173138_mux_q <= in_scalarizer_01173138_1;
            WHEN OTHERS => scalarizer_01173138_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01173138(GPOUT,146)
    out_scalarizer_01173138 <= scalarizer_01173138_mux_q;

    -- scalarizer_01175142_mux(MUX,202)
    scalarizer_01175142_mux_s <= priority_encoder_out_o_select;
    scalarizer_01175142_mux_combproc: PROCESS (scalarizer_01175142_mux_s, in_scalarizer_01175142_0, in_scalarizer_01175142_1)
    BEGIN
        CASE (scalarizer_01175142_mux_s) IS
            WHEN "0" => scalarizer_01175142_mux_q <= in_scalarizer_01175142_0;
            WHEN "1" => scalarizer_01175142_mux_q <= in_scalarizer_01175142_1;
            WHEN OTHERS => scalarizer_01175142_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01175142(GPOUT,147)
    out_scalarizer_01175142 <= scalarizer_01175142_mux_q;

    -- scalarizer_01177146_mux(MUX,203)
    scalarizer_01177146_mux_s <= priority_encoder_out_o_select;
    scalarizer_01177146_mux_combproc: PROCESS (scalarizer_01177146_mux_s, in_scalarizer_01177146_0, in_scalarizer_01177146_1)
    BEGIN
        CASE (scalarizer_01177146_mux_s) IS
            WHEN "0" => scalarizer_01177146_mux_q <= in_scalarizer_01177146_0;
            WHEN "1" => scalarizer_01177146_mux_q <= in_scalarizer_01177146_1;
            WHEN OTHERS => scalarizer_01177146_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01177146(GPOUT,148)
    out_scalarizer_01177146 <= scalarizer_01177146_mux_q;

    -- scalarizer_01179150_mux(MUX,204)
    scalarizer_01179150_mux_s <= priority_encoder_out_o_select;
    scalarizer_01179150_mux_combproc: PROCESS (scalarizer_01179150_mux_s, in_scalarizer_01179150_0, in_scalarizer_01179150_1)
    BEGIN
        CASE (scalarizer_01179150_mux_s) IS
            WHEN "0" => scalarizer_01179150_mux_q <= in_scalarizer_01179150_0;
            WHEN "1" => scalarizer_01179150_mux_q <= in_scalarizer_01179150_1;
            WHEN OTHERS => scalarizer_01179150_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_01179150(GPOUT,149)
    out_scalarizer_01179150 <= scalarizer_01179150_mux_q;

    -- scalarizer_099324_mux(MUX,205)
    scalarizer_099324_mux_s <= priority_encoder_out_o_select;
    scalarizer_099324_mux_combproc: PROCESS (scalarizer_099324_mux_s, in_scalarizer_099324_0, in_scalarizer_099324_1)
    BEGIN
        CASE (scalarizer_099324_mux_s) IS
            WHEN "0" => scalarizer_099324_mux_q <= in_scalarizer_099324_0;
            WHEN "1" => scalarizer_099324_mux_q <= in_scalarizer_099324_1;
            WHEN OTHERS => scalarizer_099324_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_099324(GPOUT,150)
    out_scalarizer_099324 <= scalarizer_099324_mux_q;

    -- scalarizer_099534_mux(MUX,206)
    scalarizer_099534_mux_s <= priority_encoder_out_o_select;
    scalarizer_099534_mux_combproc: PROCESS (scalarizer_099534_mux_s, in_scalarizer_099534_0, in_scalarizer_099534_1)
    BEGIN
        CASE (scalarizer_099534_mux_s) IS
            WHEN "0" => scalarizer_099534_mux_q <= in_scalarizer_099534_0;
            WHEN "1" => scalarizer_099534_mux_q <= in_scalarizer_099534_1;
            WHEN OTHERS => scalarizer_099534_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_099534(GPOUT,151)
    out_scalarizer_099534 <= scalarizer_099534_mux_q;

    -- scalarizer_099744_mux(MUX,207)
    scalarizer_099744_mux_s <= priority_encoder_out_o_select;
    scalarizer_099744_mux_combproc: PROCESS (scalarizer_099744_mux_s, in_scalarizer_099744_0, in_scalarizer_099744_1)
    BEGIN
        CASE (scalarizer_099744_mux_s) IS
            WHEN "0" => scalarizer_099744_mux_q <= in_scalarizer_099744_0;
            WHEN "1" => scalarizer_099744_mux_q <= in_scalarizer_099744_1;
            WHEN OTHERS => scalarizer_099744_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_099744(GPOUT,152)
    out_scalarizer_099744 <= scalarizer_099744_mux_q;

    -- scalarizer_099954_mux(MUX,208)
    scalarizer_099954_mux_s <= priority_encoder_out_o_select;
    scalarizer_099954_mux_combproc: PROCESS (scalarizer_099954_mux_s, in_scalarizer_099954_0, in_scalarizer_099954_1)
    BEGIN
        CASE (scalarizer_099954_mux_s) IS
            WHEN "0" => scalarizer_099954_mux_q <= in_scalarizer_099954_0;
            WHEN "1" => scalarizer_099954_mux_q <= in_scalarizer_099954_1;
            WHEN OTHERS => scalarizer_099954_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_099954(GPOUT,153)
    out_scalarizer_099954 <= scalarizer_099954_mux_q;

    -- scalarizer_1100059_mux(MUX,209)
    scalarizer_1100059_mux_s <= priority_encoder_out_o_select;
    scalarizer_1100059_mux_combproc: PROCESS (scalarizer_1100059_mux_s, in_scalarizer_1100059_0, in_scalarizer_1100059_1)
    BEGIN
        CASE (scalarizer_1100059_mux_s) IS
            WHEN "0" => scalarizer_1100059_mux_q <= in_scalarizer_1100059_0;
            WHEN "1" => scalarizer_1100059_mux_q <= in_scalarizer_1100059_1;
            WHEN OTHERS => scalarizer_1100059_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_1100059(GPOUT,154)
    out_scalarizer_1100059 <= scalarizer_1100059_mux_q;

    -- scalarizer_1100269_mux(MUX,210)
    scalarizer_1100269_mux_s <= priority_encoder_out_o_select;
    scalarizer_1100269_mux_combproc: PROCESS (scalarizer_1100269_mux_s, in_scalarizer_1100269_0, in_scalarizer_1100269_1)
    BEGIN
        CASE (scalarizer_1100269_mux_s) IS
            WHEN "0" => scalarizer_1100269_mux_q <= in_scalarizer_1100269_0;
            WHEN "1" => scalarizer_1100269_mux_q <= in_scalarizer_1100269_1;
            WHEN OTHERS => scalarizer_1100269_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_1100269(GPOUT,155)
    out_scalarizer_1100269 <= scalarizer_1100269_mux_q;

    -- scalarizer_1100479_mux(MUX,211)
    scalarizer_1100479_mux_s <= priority_encoder_out_o_select;
    scalarizer_1100479_mux_combproc: PROCESS (scalarizer_1100479_mux_s, in_scalarizer_1100479_0, in_scalarizer_1100479_1)
    BEGIN
        CASE (scalarizer_1100479_mux_s) IS
            WHEN "0" => scalarizer_1100479_mux_q <= in_scalarizer_1100479_0;
            WHEN "1" => scalarizer_1100479_mux_q <= in_scalarizer_1100479_1;
            WHEN OTHERS => scalarizer_1100479_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_1100479(GPOUT,156)
    out_scalarizer_1100479 <= scalarizer_1100479_mux_q;

    -- scalarizer_1100689_mux(MUX,212)
    scalarizer_1100689_mux_s <= priority_encoder_out_o_select;
    scalarizer_1100689_mux_combproc: PROCESS (scalarizer_1100689_mux_s, in_scalarizer_1100689_0, in_scalarizer_1100689_1)
    BEGIN
        CASE (scalarizer_1100689_mux_s) IS
            WHEN "0" => scalarizer_1100689_mux_q <= in_scalarizer_1100689_0;
            WHEN "1" => scalarizer_1100689_mux_q <= in_scalarizer_1100689_1;
            WHEN OTHERS => scalarizer_1100689_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_1100689(GPOUT,157)
    out_scalarizer_1100689 <= scalarizer_1100689_mux_q;

    -- scalarizer_1100899_mux(MUX,213)
    scalarizer_1100899_mux_s <= priority_encoder_out_o_select;
    scalarizer_1100899_mux_combproc: PROCESS (scalarizer_1100899_mux_s, in_scalarizer_1100899_0, in_scalarizer_1100899_1)
    BEGIN
        CASE (scalarizer_1100899_mux_s) IS
            WHEN "0" => scalarizer_1100899_mux_q <= in_scalarizer_1100899_0;
            WHEN "1" => scalarizer_1100899_mux_q <= in_scalarizer_1100899_1;
            WHEN OTHERS => scalarizer_1100899_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_1100899(GPOUT,158)
    out_scalarizer_1100899 <= scalarizer_1100899_mux_q;

    -- scalarizer_11174140_mux(MUX,214)
    scalarizer_11174140_mux_s <= priority_encoder_out_o_select;
    scalarizer_11174140_mux_combproc: PROCESS (scalarizer_11174140_mux_s, in_scalarizer_11174140_0, in_scalarizer_11174140_1)
    BEGIN
        CASE (scalarizer_11174140_mux_s) IS
            WHEN "0" => scalarizer_11174140_mux_q <= in_scalarizer_11174140_0;
            WHEN "1" => scalarizer_11174140_mux_q <= in_scalarizer_11174140_1;
            WHEN OTHERS => scalarizer_11174140_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11174140(GPOUT,159)
    out_scalarizer_11174140 <= scalarizer_11174140_mux_q;

    -- scalarizer_11176144_mux(MUX,215)
    scalarizer_11176144_mux_s <= priority_encoder_out_o_select;
    scalarizer_11176144_mux_combproc: PROCESS (scalarizer_11176144_mux_s, in_scalarizer_11176144_0, in_scalarizer_11176144_1)
    BEGIN
        CASE (scalarizer_11176144_mux_s) IS
            WHEN "0" => scalarizer_11176144_mux_q <= in_scalarizer_11176144_0;
            WHEN "1" => scalarizer_11176144_mux_q <= in_scalarizer_11176144_1;
            WHEN OTHERS => scalarizer_11176144_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11176144(GPOUT,160)
    out_scalarizer_11176144 <= scalarizer_11176144_mux_q;

    -- scalarizer_11178148_mux(MUX,216)
    scalarizer_11178148_mux_s <= priority_encoder_out_o_select;
    scalarizer_11178148_mux_combproc: PROCESS (scalarizer_11178148_mux_s, in_scalarizer_11178148_0, in_scalarizer_11178148_1)
    BEGIN
        CASE (scalarizer_11178148_mux_s) IS
            WHEN "0" => scalarizer_11178148_mux_q <= in_scalarizer_11178148_0;
            WHEN "1" => scalarizer_11178148_mux_q <= in_scalarizer_11178148_1;
            WHEN OTHERS => scalarizer_11178148_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11178148(GPOUT,161)
    out_scalarizer_11178148 <= scalarizer_11178148_mux_q;

    -- scalarizer_11180152_mux(MUX,217)
    scalarizer_11180152_mux_s <= priority_encoder_out_o_select;
    scalarizer_11180152_mux_combproc: PROCESS (scalarizer_11180152_mux_s, in_scalarizer_11180152_0, in_scalarizer_11180152_1)
    BEGIN
        CASE (scalarizer_11180152_mux_s) IS
            WHEN "0" => scalarizer_11180152_mux_q <= in_scalarizer_11180152_0;
            WHEN "1" => scalarizer_11180152_mux_q <= in_scalarizer_11180152_1;
            WHEN OTHERS => scalarizer_11180152_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_11180152(GPOUT,162)
    out_scalarizer_11180152 <= scalarizer_11180152_mux_q;

    -- scalarizer_199429_mux(MUX,218)
    scalarizer_199429_mux_s <= priority_encoder_out_o_select;
    scalarizer_199429_mux_combproc: PROCESS (scalarizer_199429_mux_s, in_scalarizer_199429_0, in_scalarizer_199429_1)
    BEGIN
        CASE (scalarizer_199429_mux_s) IS
            WHEN "0" => scalarizer_199429_mux_q <= in_scalarizer_199429_0;
            WHEN "1" => scalarizer_199429_mux_q <= in_scalarizer_199429_1;
            WHEN OTHERS => scalarizer_199429_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_199429(GPOUT,163)
    out_scalarizer_199429 <= scalarizer_199429_mux_q;

    -- scalarizer_199639_mux(MUX,219)
    scalarizer_199639_mux_s <= priority_encoder_out_o_select;
    scalarizer_199639_mux_combproc: PROCESS (scalarizer_199639_mux_s, in_scalarizer_199639_0, in_scalarizer_199639_1)
    BEGIN
        CASE (scalarizer_199639_mux_s) IS
            WHEN "0" => scalarizer_199639_mux_q <= in_scalarizer_199639_0;
            WHEN "1" => scalarizer_199639_mux_q <= in_scalarizer_199639_1;
            WHEN OTHERS => scalarizer_199639_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_199639(GPOUT,164)
    out_scalarizer_199639 <= scalarizer_199639_mux_q;

    -- scalarizer_199849_mux(MUX,220)
    scalarizer_199849_mux_s <= priority_encoder_out_o_select;
    scalarizer_199849_mux_combproc: PROCESS (scalarizer_199849_mux_s, in_scalarizer_199849_0, in_scalarizer_199849_1)
    BEGIN
        CASE (scalarizer_199849_mux_s) IS
            WHEN "0" => scalarizer_199849_mux_q <= in_scalarizer_199849_0;
            WHEN "1" => scalarizer_199849_mux_q <= in_scalarizer_199849_1;
            WHEN OTHERS => scalarizer_199849_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_scalarizer_199849(GPOUT,165)
    out_scalarizer_199849 <= scalarizer_199849_mux_q;

    -- stall_out_0_specific(LOGICAL,221)
    stall_out_0_specific_q <= in_stall_in or priority_encoder_out_o_select;

    -- out_stall_out_0(GPOUT,166)
    out_stall_out_0 <= stall_out_0_specific_q;

    -- not_select(LOGICAL,195)
    not_select_q <= not (priority_encoder_out_o_select);

    -- stall_out_1_specific(LOGICAL,222)
    stall_out_1_specific_q <= in_stall_in or not_select_q;

    -- out_stall_out_1(GPOUT,167)
    out_stall_out_1 <= stall_out_1_specific_q;

    -- state_0_0_cast122_mux(MUX,223)
    state_0_0_cast122_mux_s <= priority_encoder_out_o_select;
    state_0_0_cast122_mux_combproc: PROCESS (state_0_0_cast122_mux_s, in_state_0_0_cast122_0, in_state_0_0_cast122_1)
    BEGIN
        CASE (state_0_0_cast122_mux_s) IS
            WHEN "0" => state_0_0_cast122_mux_q <= in_state_0_0_cast122_0;
            WHEN "1" => state_0_0_cast122_mux_q <= in_state_0_0_cast122_1;
            WHEN OTHERS => state_0_0_cast122_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_state_0_0_cast122(GPOUT,168)
    out_state_0_0_cast122 <= state_0_0_cast122_mux_q;

    -- state_4_0_cast125_mux(MUX,224)
    state_4_0_cast125_mux_s <= priority_encoder_out_o_select;
    state_4_0_cast125_mux_combproc: PROCESS (state_4_0_cast125_mux_s, in_state_4_0_cast125_0, in_state_4_0_cast125_1)
    BEGIN
        CASE (state_4_0_cast125_mux_s) IS
            WHEN "0" => state_4_0_cast125_mux_q <= in_state_4_0_cast125_0;
            WHEN "1" => state_4_0_cast125_mux_q <= in_state_4_0_cast125_1;
            WHEN OTHERS => state_4_0_cast125_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_state_4_0_cast125(GPOUT,169)
    out_state_4_0_cast125 <= state_4_0_cast125_mux_q;

    -- state_5_0_cast128_mux(MUX,225)
    state_5_0_cast128_mux_s <= priority_encoder_out_o_select;
    state_5_0_cast128_mux_combproc: PROCESS (state_5_0_cast128_mux_s, in_state_5_0_cast128_0, in_state_5_0_cast128_1)
    BEGIN
        CASE (state_5_0_cast128_mux_s) IS
            WHEN "0" => state_5_0_cast128_mux_q <= in_state_5_0_cast128_0;
            WHEN "1" => state_5_0_cast128_mux_q <= in_state_5_0_cast128_1;
            WHEN OTHERS => state_5_0_cast128_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_state_5_0_cast128(GPOUT,170)
    out_state_5_0_cast128 <= state_5_0_cast128_mux_q;

    -- state_6_0_cast131_mux(MUX,226)
    state_6_0_cast131_mux_s <= priority_encoder_out_o_select;
    state_6_0_cast131_mux_combproc: PROCESS (state_6_0_cast131_mux_s, in_state_6_0_cast131_0, in_state_6_0_cast131_1)
    BEGIN
        CASE (state_6_0_cast131_mux_s) IS
            WHEN "0" => state_6_0_cast131_mux_q <= in_state_6_0_cast131_0;
            WHEN "1" => state_6_0_cast131_mux_q <= in_state_6_0_cast131_1;
            WHEN OTHERS => state_6_0_cast131_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_state_6_0_cast131(GPOUT,171)
    out_state_6_0_cast131 <= state_6_0_cast131_mux_q;

    -- state_7_0_cast134_mux(MUX,227)
    state_7_0_cast134_mux_s <= priority_encoder_out_o_select;
    state_7_0_cast134_mux_combproc: PROCESS (state_7_0_cast134_mux_s, in_state_7_0_cast134_0, in_state_7_0_cast134_1)
    BEGIN
        CASE (state_7_0_cast134_mux_s) IS
            WHEN "0" => state_7_0_cast134_mux_q <= in_state_7_0_cast134_0;
            WHEN "1" => state_7_0_cast134_mux_q <= in_state_7_0_cast134_1;
            WHEN OTHERS => state_7_0_cast134_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_state_7_0_cast134(GPOUT,172)
    out_state_7_0_cast134 <= state_7_0_cast134_mux_q;

    -- unnamed_ethash_search32_mux(MUX,228)
    unnamed_ethash_search32_mux_s <= priority_encoder_out_o_select;
    unnamed_ethash_search32_mux_combproc: PROCESS (unnamed_ethash_search32_mux_s, in_unnamed_ethash_search32_0, in_unnamed_ethash_search32_1)
    BEGIN
        CASE (unnamed_ethash_search32_mux_s) IS
            WHEN "0" => unnamed_ethash_search32_mux_q <= in_unnamed_ethash_search32_0;
            WHEN "1" => unnamed_ethash_search32_mux_q <= in_unnamed_ethash_search32_1;
            WHEN OTHERS => unnamed_ethash_search32_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_unnamed_ethash_search32(GPOUT,173)
    out_unnamed_ethash_search32 <= unnamed_ethash_search32_mux_q;

    -- out_valid_out(GPOUT,174)
    out_valid_out <= priority_encoder_out_o_valid;

END normal;
