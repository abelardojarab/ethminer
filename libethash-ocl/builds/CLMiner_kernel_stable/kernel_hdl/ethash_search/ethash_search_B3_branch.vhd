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

-- VHDL created from ethash_search_B3_branch
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

entity ethash_search_B3_branch is
    port (
        in_unnamed_ethash_search27_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_unnamed_ethash_search27_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_unnamed_ethash_search27_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_unnamed_ethash_search27_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_and_RM : in std_logic_vector(31 downto 0);  -- ufix32
        in_arraydecay51_RM : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx36_2_RM : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx45_RM : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe1106 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2108 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe3112 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe4116 : in std_logic_vector(63 downto 0);  -- ufix64
        in_cmp23 : in std_logic_vector(0 downto 0);  -- ufix1
        in_cmp23_xor : in std_logic_vector(0 downto 0);  -- ufix1
        in_fpgaindvars_iv12 : in std_logic_vector(3 downto 0);  -- ufix4
        in_global_id_0195 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i18_0908 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_06 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr9 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr_zext : in std_logic_vector(63 downto 0);  -- ufix64
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
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_state_0_0_cast120 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_4_0_cast123 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_5_0_cast126 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_6_0_cast129 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_7_0_cast132 : in std_logic_vector(63 downto 0);  -- ufix64
        in_unnamed_ethash_search28 : in std_logic_vector(31 downto 0);  -- ufix32
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
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
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_state_0_0_cast120 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_4_0_cast123 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_5_0_cast126 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_6_0_cast129 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_7_0_cast132 : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_ethash_search28 : out std_logic_vector(31 downto 0);  -- ufix32
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end ethash_search_B3_branch;

architecture normal of ethash_search_B3_branch is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- out_unnamed_ethash_search27_0(GPOUT,54)
    out_unnamed_ethash_search27_0 <= in_unnamed_ethash_search27_0;

    -- out_unnamed_ethash_search27_1(GPOUT,55)
    out_unnamed_ethash_search27_1 <= in_unnamed_ethash_search27_1;

    -- out_unnamed_ethash_search27_2(GPOUT,56)
    out_unnamed_ethash_search27_2 <= in_unnamed_ethash_search27_2;

    -- out_unnamed_ethash_search27_3(GPOUT,57)
    out_unnamed_ethash_search27_3 <= in_unnamed_ethash_search27_3;

    -- out_and_RM(GPOUT,58)
    out_and_RM <= in_and_RM;

    -- out_arraydecay51_RM(GPOUT,59)
    out_arraydecay51_RM <= in_arraydecay51_RM;

    -- out_arrayidx36_2_RM(GPOUT,60)
    out_arrayidx36_2_RM <= in_arrayidx36_2_RM;

    -- out_arrayidx45_RM(GPOUT,61)
    out_arrayidx45_RM <= in_arrayidx45_RM;

    -- out_c0_exe1106(GPOUT,62)
    out_c0_exe1106 <= in_c0_exe1106;

    -- out_c0_exe2108(GPOUT,63)
    out_c0_exe2108 <= in_c0_exe2108;

    -- out_c0_exe3112(GPOUT,64)
    out_c0_exe3112 <= in_c0_exe3112;

    -- out_c0_exe4116(GPOUT,65)
    out_c0_exe4116 <= in_c0_exe4116;

    -- out_cmp23(GPOUT,66)
    out_cmp23 <= in_cmp23;

    -- out_cmp23_xor(GPOUT,67)
    out_cmp23_xor <= in_cmp23_xor;

    -- out_fpgaindvars_iv12(GPOUT,68)
    out_fpgaindvars_iv12 <= in_fpgaindvars_iv12;

    -- out_global_id_0195(GPOUT,69)
    out_global_id_0195 <= in_global_id_0195;

    -- out_i18_0908(GPOUT,70)
    out_i18_0908 <= in_i18_0908;

    -- out_l_grpid_06(GPOUT,71)
    out_l_grpid_06 <= in_l_grpid_06;

    -- out_l_grpid_0_addr9(GPOUT,72)
    out_l_grpid_0_addr9 <= in_l_grpid_0_addr9;

    -- out_l_grpid_0_addr_zext(GPOUT,73)
    out_l_grpid_0_addr_zext <= in_l_grpid_0_addr_zext;

    -- out_scalarizer_0100165(GPOUT,74)
    out_scalarizer_0100165 <= in_scalarizer_0100165;

    -- out_scalarizer_0100375(GPOUT,75)
    out_scalarizer_0100375 <= in_scalarizer_0100375;

    -- out_scalarizer_0100585(GPOUT,76)
    out_scalarizer_0100585 <= in_scalarizer_0100585;

    -- out_scalarizer_0100795(GPOUT,77)
    out_scalarizer_0100795 <= in_scalarizer_0100795;

    -- out_scalarizer_01173(GPOUT,78)
    out_scalarizer_01173 <= in_scalarizer_01173;

    -- out_scalarizer_01175(GPOUT,79)
    out_scalarizer_01175 <= in_scalarizer_01175;

    -- out_scalarizer_01177(GPOUT,80)
    out_scalarizer_01177 <= in_scalarizer_01177;

    -- out_scalarizer_01179(GPOUT,81)
    out_scalarizer_01179 <= in_scalarizer_01179;

    -- out_scalarizer_099325(GPOUT,82)
    out_scalarizer_099325 <= in_scalarizer_099325;

    -- out_scalarizer_099535(GPOUT,83)
    out_scalarizer_099535 <= in_scalarizer_099535;

    -- out_scalarizer_099745(GPOUT,84)
    out_scalarizer_099745 <= in_scalarizer_099745;

    -- out_scalarizer_099955(GPOUT,85)
    out_scalarizer_099955 <= in_scalarizer_099955;

    -- out_scalarizer_1100060(GPOUT,86)
    out_scalarizer_1100060 <= in_scalarizer_1100060;

    -- out_scalarizer_1100270(GPOUT,87)
    out_scalarizer_1100270 <= in_scalarizer_1100270;

    -- out_scalarizer_1100480(GPOUT,88)
    out_scalarizer_1100480 <= in_scalarizer_1100480;

    -- out_scalarizer_1100690(GPOUT,89)
    out_scalarizer_1100690 <= in_scalarizer_1100690;

    -- out_scalarizer_11008100(GPOUT,90)
    out_scalarizer_11008100 <= in_scalarizer_11008100;

    -- out_scalarizer_11174(GPOUT,91)
    out_scalarizer_11174 <= in_scalarizer_11174;

    -- out_scalarizer_11176(GPOUT,92)
    out_scalarizer_11176 <= in_scalarizer_11176;

    -- out_scalarizer_11178(GPOUT,93)
    out_scalarizer_11178 <= in_scalarizer_11178;

    -- out_scalarizer_11180(GPOUT,94)
    out_scalarizer_11180 <= in_scalarizer_11180;

    -- out_scalarizer_199430(GPOUT,95)
    out_scalarizer_199430 <= in_scalarizer_199430;

    -- out_scalarizer_199640(GPOUT,96)
    out_scalarizer_199640 <= in_scalarizer_199640;

    -- out_scalarizer_199850(GPOUT,97)
    out_scalarizer_199850 <= in_scalarizer_199850;

    -- stall_out(LOGICAL,106)
    stall_out_q <= in_valid_in and in_stall_in_0;

    -- out_stall_out(GPOUT,98)
    out_stall_out <= stall_out_q;

    -- out_state_0_0_cast120(GPOUT,99)
    out_state_0_0_cast120 <= in_state_0_0_cast120;

    -- out_state_4_0_cast123(GPOUT,100)
    out_state_4_0_cast123 <= in_state_4_0_cast123;

    -- out_state_5_0_cast126(GPOUT,101)
    out_state_5_0_cast126 <= in_state_5_0_cast126;

    -- out_state_6_0_cast129(GPOUT,102)
    out_state_6_0_cast129 <= in_state_6_0_cast129;

    -- out_state_7_0_cast132(GPOUT,103)
    out_state_7_0_cast132 <= in_state_7_0_cast132;

    -- out_unnamed_ethash_search28(GPOUT,104)
    out_unnamed_ethash_search28 <= in_unnamed_ethash_search28;

    -- out_valid_out_0(GPOUT,105)
    out_valid_out_0 <= in_valid_in;

END normal;
