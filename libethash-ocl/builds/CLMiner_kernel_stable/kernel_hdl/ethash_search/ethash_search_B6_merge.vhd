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

-- VHDL created from ethash_search_B6_merge
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

entity ethash_search_B6_merge is
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
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_acl_1413178 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_1414179 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_1415176 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_1416177 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe1103 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe1172 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe2173 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe3174 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe4175 : out std_logic_vector(31 downto 0);  -- ufix32
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
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end ethash_search_B6_merge;

architecture normal of ethash_search_B6_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- out_acl_1413178(GPOUT,31)
    out_acl_1413178 <= in_acl_1413178_0;

    -- out_acl_1414179(GPOUT,32)
    out_acl_1414179 <= in_acl_1414179_0;

    -- out_acl_1415176(GPOUT,33)
    out_acl_1415176 <= in_acl_1415176_0;

    -- out_acl_1416177(GPOUT,34)
    out_acl_1416177 <= in_acl_1416177_0;

    -- out_c0_exe1103(GPOUT,35)
    out_c0_exe1103 <= in_c0_exe1103_0;

    -- out_c1_exe1172(GPOUT,36)
    out_c1_exe1172 <= in_c1_exe1172_0;

    -- out_c1_exe2173(GPOUT,37)
    out_c1_exe2173 <= in_c1_exe2173_0;

    -- out_c1_exe3174(GPOUT,38)
    out_c1_exe3174 <= in_c1_exe3174_0;

    -- out_c1_exe4175(GPOUT,39)
    out_c1_exe4175 <= in_c1_exe4175_0;

    -- out_global_id_0192(GPOUT,40)
    out_global_id_0192 <= in_global_id_0192_0;

    -- out_l_grpid_03(GPOUT,41)
    out_l_grpid_03 <= in_l_grpid_03_0;

    -- out_scalarizer_0100162(GPOUT,42)
    out_scalarizer_0100162 <= in_scalarizer_0100162_0;

    -- out_scalarizer_0100372(GPOUT,43)
    out_scalarizer_0100372 <= in_scalarizer_0100372_0;

    -- out_scalarizer_0100582(GPOUT,44)
    out_scalarizer_0100582 <= in_scalarizer_0100582_0;

    -- out_scalarizer_0100792(GPOUT,45)
    out_scalarizer_0100792 <= in_scalarizer_0100792_0;

    -- out_scalarizer_099322(GPOUT,46)
    out_scalarizer_099322 <= in_scalarizer_099322_0;

    -- out_scalarizer_099532(GPOUT,47)
    out_scalarizer_099532 <= in_scalarizer_099532_0;

    -- out_scalarizer_099742(GPOUT,48)
    out_scalarizer_099742 <= in_scalarizer_099742_0;

    -- out_scalarizer_099952(GPOUT,49)
    out_scalarizer_099952 <= in_scalarizer_099952_0;

    -- out_scalarizer_1100057(GPOUT,50)
    out_scalarizer_1100057 <= in_scalarizer_1100057_0;

    -- out_scalarizer_1100267(GPOUT,51)
    out_scalarizer_1100267 <= in_scalarizer_1100267_0;

    -- out_scalarizer_1100477(GPOUT,52)
    out_scalarizer_1100477 <= in_scalarizer_1100477_0;

    -- out_scalarizer_1100687(GPOUT,53)
    out_scalarizer_1100687 <= in_scalarizer_1100687_0;

    -- out_scalarizer_1100897(GPOUT,54)
    out_scalarizer_1100897 <= in_scalarizer_1100897_0;

    -- out_scalarizer_199427(GPOUT,55)
    out_scalarizer_199427 <= in_scalarizer_199427_0;

    -- out_scalarizer_199637(GPOUT,56)
    out_scalarizer_199637 <= in_scalarizer_199637_0;

    -- out_scalarizer_199847(GPOUT,57)
    out_scalarizer_199847 <= in_scalarizer_199847_0;

    -- stall_out(LOGICAL,60)
    stall_out_q <= in_valid_in_0 and in_stall_in;

    -- out_stall_out_0(GPOUT,58)
    out_stall_out_0 <= stall_out_q;

    -- out_valid_out(GPOUT,59)
    out_valid_out <= in_valid_in_0;

END normal;
