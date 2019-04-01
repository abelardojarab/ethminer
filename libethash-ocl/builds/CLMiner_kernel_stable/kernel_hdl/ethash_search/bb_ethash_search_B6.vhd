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

-- VHDL created from bb_ethash_search_B6
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

entity bb_ethash_search_B6 is
    port (
        in_acl_1413178_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_1414179_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_1415176_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_1416177_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1103_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe1172_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe2173_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe3174_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe4175_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_g_output : in std_logic_vector(63 downto 0);  -- ufix64
        in_global_id_0192_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_03_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100162_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100372_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100582_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100792_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099322_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099532_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099742_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099952_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100057_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100267_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100477_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100687_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100897_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199427_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199637_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199847_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_target : in std_logic_vector(63 downto 0);  -- ufix64
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe1103 : out std_logic_vector(0 downto 0);  -- ufix1
        out_global_id_0192 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_03 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0100162 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0100372 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0100582 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_0100792 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099322 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099532 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099742 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_099952 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100057 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100267 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100477 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100687 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_1100897 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_199427 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_199637 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_199847 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_state_10_2_cast : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_11_2_cast : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_8_2_cast : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_9_2_cast : out std_logic_vector(63 downto 0);  -- ufix64
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_ethash_search_B6;

architecture normal of bb_ethash_search_B6 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_ethash_search_B6_stall_region is
        port (
            in_acl_1413178 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_1414179 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_1415176 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_1416177 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1103 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe1172 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe2173 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe3174 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe4175 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_id_0192 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_03 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100162 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100372 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100582 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100792 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099322 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099532 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099742 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099952 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100057 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100267 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100477 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100687 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100897 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199427 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199637 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199847 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_state_10_2_cast : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_11_2_cast : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_8_2_cast : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_9_2_cast : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component ethash_search_B6_branch is
        port (
            in_c0_exe1103 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_global_id_0192 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_03 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100162 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100372 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100582 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_0100792 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099322 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099532 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099742 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_099952 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100057 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100267 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100477 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100687 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_1100897 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199427 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199637 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_199847 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_state_10_2_cast : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_11_2_cast : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_8_2_cast : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_9_2_cast : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_state_10_2_cast : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_11_2_cast : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_8_2_cast : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_9_2_cast : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component ethash_search_B6_merge is
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
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_1413178 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_1414179 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_1415176 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_1416177 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1103 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe1172 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe2173 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe3174 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe4175 : out std_logic_vector(31 downto 0);  -- Fixed Point
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
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_ethash_search_B6_stall_region_out_c0_exe1103 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B6_stall_region_out_global_id_0192 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_stall_region_out_l_grpid_03 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_stall_region_out_scalarizer_0100162 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_stall_region_out_scalarizer_0100372 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_stall_region_out_scalarizer_0100582 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_stall_region_out_scalarizer_0100792 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_stall_region_out_scalarizer_099322 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_stall_region_out_scalarizer_099532 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_stall_region_out_scalarizer_099742 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_stall_region_out_scalarizer_099952 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_stall_region_out_scalarizer_1100057 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_stall_region_out_scalarizer_1100267 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_stall_region_out_scalarizer_1100477 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_stall_region_out_scalarizer_1100687 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_stall_region_out_scalarizer_1100897 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_stall_region_out_scalarizer_199427 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_stall_region_out_scalarizer_199637 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_stall_region_out_scalarizer_199847 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B6_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B6_stall_region_out_state_10_2_cast : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B6_stall_region_out_state_11_2_cast : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B6_stall_region_out_state_8_2_cast : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B6_stall_region_out_state_9_2_cast : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B6_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B6_branch_out_c0_exe1103 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B6_branch_out_global_id_0192 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_branch_out_l_grpid_03 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_branch_out_scalarizer_0100162 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_branch_out_scalarizer_0100372 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_branch_out_scalarizer_0100582 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_branch_out_scalarizer_0100792 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_branch_out_scalarizer_099322 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_branch_out_scalarizer_099532 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_branch_out_scalarizer_099742 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_branch_out_scalarizer_099952 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_branch_out_scalarizer_1100057 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_branch_out_scalarizer_1100267 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_branch_out_scalarizer_1100477 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_branch_out_scalarizer_1100687 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_branch_out_scalarizer_1100897 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_branch_out_scalarizer_199427 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_branch_out_scalarizer_199637 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_branch_out_scalarizer_199847 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B6_branch_out_state_10_2_cast : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B6_branch_out_state_11_2_cast : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B6_branch_out_state_8_2_cast : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B6_branch_out_state_9_2_cast : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B6_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B6_merge_out_acl_1413178 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_merge_out_acl_1414179 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_merge_out_acl_1415176 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_merge_out_acl_1416177 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_merge_out_c0_exe1103 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B6_merge_out_c1_exe1172 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_merge_out_c1_exe2173 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_merge_out_c1_exe3174 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_merge_out_c1_exe4175 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_merge_out_global_id_0192 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_merge_out_l_grpid_03 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_merge_out_scalarizer_0100162 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_merge_out_scalarizer_0100372 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_merge_out_scalarizer_0100582 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_merge_out_scalarizer_0100792 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_merge_out_scalarizer_099322 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_merge_out_scalarizer_099532 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_merge_out_scalarizer_099742 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_merge_out_scalarizer_099952 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_merge_out_scalarizer_1100057 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_merge_out_scalarizer_1100267 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_merge_out_scalarizer_1100477 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_merge_out_scalarizer_1100687 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_merge_out_scalarizer_1100897 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_merge_out_scalarizer_199427 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_merge_out_scalarizer_199637 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_merge_out_scalarizer_199847 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B6_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B6_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- ethash_search_B6_merge(BLACKBOX,4)
    theethash_search_B6_merge : ethash_search_B6_merge
    PORT MAP (
        in_acl_1413178_0 => in_acl_1413178_0,
        in_acl_1414179_0 => in_acl_1414179_0,
        in_acl_1415176_0 => in_acl_1415176_0,
        in_acl_1416177_0 => in_acl_1416177_0,
        in_c0_exe1103_0 => in_c0_exe1103_0,
        in_c1_exe1172_0 => in_c1_exe1172_0,
        in_c1_exe2173_0 => in_c1_exe2173_0,
        in_c1_exe3174_0 => in_c1_exe3174_0,
        in_c1_exe4175_0 => in_c1_exe4175_0,
        in_global_id_0192_0 => in_global_id_0192_0,
        in_l_grpid_03_0 => in_l_grpid_03_0,
        in_scalarizer_0100162_0 => in_scalarizer_0100162_0,
        in_scalarizer_0100372_0 => in_scalarizer_0100372_0,
        in_scalarizer_0100582_0 => in_scalarizer_0100582_0,
        in_scalarizer_0100792_0 => in_scalarizer_0100792_0,
        in_scalarizer_099322_0 => in_scalarizer_099322_0,
        in_scalarizer_099532_0 => in_scalarizer_099532_0,
        in_scalarizer_099742_0 => in_scalarizer_099742_0,
        in_scalarizer_099952_0 => in_scalarizer_099952_0,
        in_scalarizer_1100057_0 => in_scalarizer_1100057_0,
        in_scalarizer_1100267_0 => in_scalarizer_1100267_0,
        in_scalarizer_1100477_0 => in_scalarizer_1100477_0,
        in_scalarizer_1100687_0 => in_scalarizer_1100687_0,
        in_scalarizer_1100897_0 => in_scalarizer_1100897_0,
        in_scalarizer_199427_0 => in_scalarizer_199427_0,
        in_scalarizer_199637_0 => in_scalarizer_199637_0,
        in_scalarizer_199847_0 => in_scalarizer_199847_0,
        in_stall_in => bb_ethash_search_B6_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        out_acl_1413178 => ethash_search_B6_merge_out_acl_1413178,
        out_acl_1414179 => ethash_search_B6_merge_out_acl_1414179,
        out_acl_1415176 => ethash_search_B6_merge_out_acl_1415176,
        out_acl_1416177 => ethash_search_B6_merge_out_acl_1416177,
        out_c0_exe1103 => ethash_search_B6_merge_out_c0_exe1103,
        out_c1_exe1172 => ethash_search_B6_merge_out_c1_exe1172,
        out_c1_exe2173 => ethash_search_B6_merge_out_c1_exe2173,
        out_c1_exe3174 => ethash_search_B6_merge_out_c1_exe3174,
        out_c1_exe4175 => ethash_search_B6_merge_out_c1_exe4175,
        out_global_id_0192 => ethash_search_B6_merge_out_global_id_0192,
        out_l_grpid_03 => ethash_search_B6_merge_out_l_grpid_03,
        out_scalarizer_0100162 => ethash_search_B6_merge_out_scalarizer_0100162,
        out_scalarizer_0100372 => ethash_search_B6_merge_out_scalarizer_0100372,
        out_scalarizer_0100582 => ethash_search_B6_merge_out_scalarizer_0100582,
        out_scalarizer_0100792 => ethash_search_B6_merge_out_scalarizer_0100792,
        out_scalarizer_099322 => ethash_search_B6_merge_out_scalarizer_099322,
        out_scalarizer_099532 => ethash_search_B6_merge_out_scalarizer_099532,
        out_scalarizer_099742 => ethash_search_B6_merge_out_scalarizer_099742,
        out_scalarizer_099952 => ethash_search_B6_merge_out_scalarizer_099952,
        out_scalarizer_1100057 => ethash_search_B6_merge_out_scalarizer_1100057,
        out_scalarizer_1100267 => ethash_search_B6_merge_out_scalarizer_1100267,
        out_scalarizer_1100477 => ethash_search_B6_merge_out_scalarizer_1100477,
        out_scalarizer_1100687 => ethash_search_B6_merge_out_scalarizer_1100687,
        out_scalarizer_1100897 => ethash_search_B6_merge_out_scalarizer_1100897,
        out_scalarizer_199427 => ethash_search_B6_merge_out_scalarizer_199427,
        out_scalarizer_199637 => ethash_search_B6_merge_out_scalarizer_199637,
        out_scalarizer_199847 => ethash_search_B6_merge_out_scalarizer_199847,
        out_stall_out_0 => ethash_search_B6_merge_out_stall_out_0,
        out_valid_out => ethash_search_B6_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_search_B6_stall_region(BLACKBOX,2)
    thebb_ethash_search_B6_stall_region : bb_ethash_search_B6_stall_region
    PORT MAP (
        in_acl_1413178 => ethash_search_B6_merge_out_acl_1413178,
        in_acl_1414179 => ethash_search_B6_merge_out_acl_1414179,
        in_acl_1415176 => ethash_search_B6_merge_out_acl_1415176,
        in_acl_1416177 => ethash_search_B6_merge_out_acl_1416177,
        in_c0_exe1103 => ethash_search_B6_merge_out_c0_exe1103,
        in_c1_exe1172 => ethash_search_B6_merge_out_c1_exe1172,
        in_c1_exe2173 => ethash_search_B6_merge_out_c1_exe2173,
        in_c1_exe3174 => ethash_search_B6_merge_out_c1_exe3174,
        in_c1_exe4175 => ethash_search_B6_merge_out_c1_exe4175,
        in_global_id_0192 => ethash_search_B6_merge_out_global_id_0192,
        in_l_grpid_03 => ethash_search_B6_merge_out_l_grpid_03,
        in_scalarizer_0100162 => ethash_search_B6_merge_out_scalarizer_0100162,
        in_scalarizer_0100372 => ethash_search_B6_merge_out_scalarizer_0100372,
        in_scalarizer_0100582 => ethash_search_B6_merge_out_scalarizer_0100582,
        in_scalarizer_0100792 => ethash_search_B6_merge_out_scalarizer_0100792,
        in_scalarizer_099322 => ethash_search_B6_merge_out_scalarizer_099322,
        in_scalarizer_099532 => ethash_search_B6_merge_out_scalarizer_099532,
        in_scalarizer_099742 => ethash_search_B6_merge_out_scalarizer_099742,
        in_scalarizer_099952 => ethash_search_B6_merge_out_scalarizer_099952,
        in_scalarizer_1100057 => ethash_search_B6_merge_out_scalarizer_1100057,
        in_scalarizer_1100267 => ethash_search_B6_merge_out_scalarizer_1100267,
        in_scalarizer_1100477 => ethash_search_B6_merge_out_scalarizer_1100477,
        in_scalarizer_1100687 => ethash_search_B6_merge_out_scalarizer_1100687,
        in_scalarizer_1100897 => ethash_search_B6_merge_out_scalarizer_1100897,
        in_scalarizer_199427 => ethash_search_B6_merge_out_scalarizer_199427,
        in_scalarizer_199637 => ethash_search_B6_merge_out_scalarizer_199637,
        in_scalarizer_199847 => ethash_search_B6_merge_out_scalarizer_199847,
        in_stall_in => ethash_search_B6_branch_out_stall_out,
        in_valid_in => ethash_search_B6_merge_out_valid_out,
        out_c0_exe1103 => bb_ethash_search_B6_stall_region_out_c0_exe1103,
        out_global_id_0192 => bb_ethash_search_B6_stall_region_out_global_id_0192,
        out_l_grpid_03 => bb_ethash_search_B6_stall_region_out_l_grpid_03,
        out_scalarizer_0100162 => bb_ethash_search_B6_stall_region_out_scalarizer_0100162,
        out_scalarizer_0100372 => bb_ethash_search_B6_stall_region_out_scalarizer_0100372,
        out_scalarizer_0100582 => bb_ethash_search_B6_stall_region_out_scalarizer_0100582,
        out_scalarizer_0100792 => bb_ethash_search_B6_stall_region_out_scalarizer_0100792,
        out_scalarizer_099322 => bb_ethash_search_B6_stall_region_out_scalarizer_099322,
        out_scalarizer_099532 => bb_ethash_search_B6_stall_region_out_scalarizer_099532,
        out_scalarizer_099742 => bb_ethash_search_B6_stall_region_out_scalarizer_099742,
        out_scalarizer_099952 => bb_ethash_search_B6_stall_region_out_scalarizer_099952,
        out_scalarizer_1100057 => bb_ethash_search_B6_stall_region_out_scalarizer_1100057,
        out_scalarizer_1100267 => bb_ethash_search_B6_stall_region_out_scalarizer_1100267,
        out_scalarizer_1100477 => bb_ethash_search_B6_stall_region_out_scalarizer_1100477,
        out_scalarizer_1100687 => bb_ethash_search_B6_stall_region_out_scalarizer_1100687,
        out_scalarizer_1100897 => bb_ethash_search_B6_stall_region_out_scalarizer_1100897,
        out_scalarizer_199427 => bb_ethash_search_B6_stall_region_out_scalarizer_199427,
        out_scalarizer_199637 => bb_ethash_search_B6_stall_region_out_scalarizer_199637,
        out_scalarizer_199847 => bb_ethash_search_B6_stall_region_out_scalarizer_199847,
        out_stall_out => bb_ethash_search_B6_stall_region_out_stall_out,
        out_state_10_2_cast => bb_ethash_search_B6_stall_region_out_state_10_2_cast,
        out_state_11_2_cast => bb_ethash_search_B6_stall_region_out_state_11_2_cast,
        out_state_8_2_cast => bb_ethash_search_B6_stall_region_out_state_8_2_cast,
        out_state_9_2_cast => bb_ethash_search_B6_stall_region_out_state_9_2_cast,
        out_valid_out => bb_ethash_search_B6_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- ethash_search_B6_branch(BLACKBOX,3)
    theethash_search_B6_branch : ethash_search_B6_branch
    PORT MAP (
        in_c0_exe1103 => bb_ethash_search_B6_stall_region_out_c0_exe1103,
        in_global_id_0192 => bb_ethash_search_B6_stall_region_out_global_id_0192,
        in_l_grpid_03 => bb_ethash_search_B6_stall_region_out_l_grpid_03,
        in_scalarizer_0100162 => bb_ethash_search_B6_stall_region_out_scalarizer_0100162,
        in_scalarizer_0100372 => bb_ethash_search_B6_stall_region_out_scalarizer_0100372,
        in_scalarizer_0100582 => bb_ethash_search_B6_stall_region_out_scalarizer_0100582,
        in_scalarizer_0100792 => bb_ethash_search_B6_stall_region_out_scalarizer_0100792,
        in_scalarizer_099322 => bb_ethash_search_B6_stall_region_out_scalarizer_099322,
        in_scalarizer_099532 => bb_ethash_search_B6_stall_region_out_scalarizer_099532,
        in_scalarizer_099742 => bb_ethash_search_B6_stall_region_out_scalarizer_099742,
        in_scalarizer_099952 => bb_ethash_search_B6_stall_region_out_scalarizer_099952,
        in_scalarizer_1100057 => bb_ethash_search_B6_stall_region_out_scalarizer_1100057,
        in_scalarizer_1100267 => bb_ethash_search_B6_stall_region_out_scalarizer_1100267,
        in_scalarizer_1100477 => bb_ethash_search_B6_stall_region_out_scalarizer_1100477,
        in_scalarizer_1100687 => bb_ethash_search_B6_stall_region_out_scalarizer_1100687,
        in_scalarizer_1100897 => bb_ethash_search_B6_stall_region_out_scalarizer_1100897,
        in_scalarizer_199427 => bb_ethash_search_B6_stall_region_out_scalarizer_199427,
        in_scalarizer_199637 => bb_ethash_search_B6_stall_region_out_scalarizer_199637,
        in_scalarizer_199847 => bb_ethash_search_B6_stall_region_out_scalarizer_199847,
        in_stall_in_0 => in_stall_in_0,
        in_state_10_2_cast => bb_ethash_search_B6_stall_region_out_state_10_2_cast,
        in_state_11_2_cast => bb_ethash_search_B6_stall_region_out_state_11_2_cast,
        in_state_8_2_cast => bb_ethash_search_B6_stall_region_out_state_8_2_cast,
        in_state_9_2_cast => bb_ethash_search_B6_stall_region_out_state_9_2_cast,
        in_valid_in => bb_ethash_search_B6_stall_region_out_valid_out,
        out_c0_exe1103 => ethash_search_B6_branch_out_c0_exe1103,
        out_global_id_0192 => ethash_search_B6_branch_out_global_id_0192,
        out_l_grpid_03 => ethash_search_B6_branch_out_l_grpid_03,
        out_scalarizer_0100162 => ethash_search_B6_branch_out_scalarizer_0100162,
        out_scalarizer_0100372 => ethash_search_B6_branch_out_scalarizer_0100372,
        out_scalarizer_0100582 => ethash_search_B6_branch_out_scalarizer_0100582,
        out_scalarizer_0100792 => ethash_search_B6_branch_out_scalarizer_0100792,
        out_scalarizer_099322 => ethash_search_B6_branch_out_scalarizer_099322,
        out_scalarizer_099532 => ethash_search_B6_branch_out_scalarizer_099532,
        out_scalarizer_099742 => ethash_search_B6_branch_out_scalarizer_099742,
        out_scalarizer_099952 => ethash_search_B6_branch_out_scalarizer_099952,
        out_scalarizer_1100057 => ethash_search_B6_branch_out_scalarizer_1100057,
        out_scalarizer_1100267 => ethash_search_B6_branch_out_scalarizer_1100267,
        out_scalarizer_1100477 => ethash_search_B6_branch_out_scalarizer_1100477,
        out_scalarizer_1100687 => ethash_search_B6_branch_out_scalarizer_1100687,
        out_scalarizer_1100897 => ethash_search_B6_branch_out_scalarizer_1100897,
        out_scalarizer_199427 => ethash_search_B6_branch_out_scalarizer_199427,
        out_scalarizer_199637 => ethash_search_B6_branch_out_scalarizer_199637,
        out_scalarizer_199847 => ethash_search_B6_branch_out_scalarizer_199847,
        out_stall_out => ethash_search_B6_branch_out_stall_out,
        out_state_10_2_cast => ethash_search_B6_branch_out_state_10_2_cast,
        out_state_11_2_cast => ethash_search_B6_branch_out_state_11_2_cast,
        out_state_8_2_cast => ethash_search_B6_branch_out_state_8_2_cast,
        out_state_9_2_cast => ethash_search_B6_branch_out_state_9_2_cast,
        out_valid_out_0 => ethash_search_B6_branch_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- out_c0_exe1103(GPOUT,36)
    out_c0_exe1103 <= ethash_search_B6_branch_out_c0_exe1103;

    -- out_global_id_0192(GPOUT,37)
    out_global_id_0192 <= ethash_search_B6_branch_out_global_id_0192;

    -- out_l_grpid_03(GPOUT,38)
    out_l_grpid_03 <= ethash_search_B6_branch_out_l_grpid_03;

    -- out_scalarizer_0100162(GPOUT,39)
    out_scalarizer_0100162 <= ethash_search_B6_branch_out_scalarizer_0100162;

    -- out_scalarizer_0100372(GPOUT,40)
    out_scalarizer_0100372 <= ethash_search_B6_branch_out_scalarizer_0100372;

    -- out_scalarizer_0100582(GPOUT,41)
    out_scalarizer_0100582 <= ethash_search_B6_branch_out_scalarizer_0100582;

    -- out_scalarizer_0100792(GPOUT,42)
    out_scalarizer_0100792 <= ethash_search_B6_branch_out_scalarizer_0100792;

    -- out_scalarizer_099322(GPOUT,43)
    out_scalarizer_099322 <= ethash_search_B6_branch_out_scalarizer_099322;

    -- out_scalarizer_099532(GPOUT,44)
    out_scalarizer_099532 <= ethash_search_B6_branch_out_scalarizer_099532;

    -- out_scalarizer_099742(GPOUT,45)
    out_scalarizer_099742 <= ethash_search_B6_branch_out_scalarizer_099742;

    -- out_scalarizer_099952(GPOUT,46)
    out_scalarizer_099952 <= ethash_search_B6_branch_out_scalarizer_099952;

    -- out_scalarizer_1100057(GPOUT,47)
    out_scalarizer_1100057 <= ethash_search_B6_branch_out_scalarizer_1100057;

    -- out_scalarizer_1100267(GPOUT,48)
    out_scalarizer_1100267 <= ethash_search_B6_branch_out_scalarizer_1100267;

    -- out_scalarizer_1100477(GPOUT,49)
    out_scalarizer_1100477 <= ethash_search_B6_branch_out_scalarizer_1100477;

    -- out_scalarizer_1100687(GPOUT,50)
    out_scalarizer_1100687 <= ethash_search_B6_branch_out_scalarizer_1100687;

    -- out_scalarizer_1100897(GPOUT,51)
    out_scalarizer_1100897 <= ethash_search_B6_branch_out_scalarizer_1100897;

    -- out_scalarizer_199427(GPOUT,52)
    out_scalarizer_199427 <= ethash_search_B6_branch_out_scalarizer_199427;

    -- out_scalarizer_199637(GPOUT,53)
    out_scalarizer_199637 <= ethash_search_B6_branch_out_scalarizer_199637;

    -- out_scalarizer_199847(GPOUT,54)
    out_scalarizer_199847 <= ethash_search_B6_branch_out_scalarizer_199847;

    -- out_stall_out_0(GPOUT,55)
    out_stall_out_0 <= ethash_search_B6_merge_out_stall_out_0;

    -- out_state_10_2_cast(GPOUT,56)
    out_state_10_2_cast <= ethash_search_B6_branch_out_state_10_2_cast;

    -- out_state_11_2_cast(GPOUT,57)
    out_state_11_2_cast <= ethash_search_B6_branch_out_state_11_2_cast;

    -- out_state_8_2_cast(GPOUT,58)
    out_state_8_2_cast <= ethash_search_B6_branch_out_state_8_2_cast;

    -- out_state_9_2_cast(GPOUT,59)
    out_state_9_2_cast <= ethash_search_B6_branch_out_state_9_2_cast;

    -- out_valid_out_0(GPOUT,60)
    out_valid_out_0 <= ethash_search_B6_branch_out_valid_out_0;

END normal;
