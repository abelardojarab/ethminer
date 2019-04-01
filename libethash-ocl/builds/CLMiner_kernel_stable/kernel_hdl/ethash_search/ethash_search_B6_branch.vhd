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

-- VHDL created from ethash_search_B6_branch
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

entity ethash_search_B6_branch is
    port (
        in_c0_exe1103 : in std_logic_vector(0 downto 0);  -- ufix1
        in_global_id_0192 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_03 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100162 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100372 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100582 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_0100792 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099322 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099532 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099742 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_099952 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100057 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100267 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100477 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100687 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_1100897 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199427 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199637 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_199847 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_state_10_2_cast : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_11_2_cast : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_8_2_cast : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_9_2_cast : in std_logic_vector(63 downto 0);  -- ufix64
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
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
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_state_10_2_cast : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_11_2_cast : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_8_2_cast : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_9_2_cast : out std_logic_vector(63 downto 0);  -- ufix64
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end ethash_search_B6_branch;

architecture normal of ethash_search_B6_branch is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- out_c0_exe1103(GPOUT,27)
    out_c0_exe1103 <= in_c0_exe1103;

    -- out_global_id_0192(GPOUT,28)
    out_global_id_0192 <= in_global_id_0192;

    -- out_l_grpid_03(GPOUT,29)
    out_l_grpid_03 <= in_l_grpid_03;

    -- out_scalarizer_0100162(GPOUT,30)
    out_scalarizer_0100162 <= in_scalarizer_0100162;

    -- out_scalarizer_0100372(GPOUT,31)
    out_scalarizer_0100372 <= in_scalarizer_0100372;

    -- out_scalarizer_0100582(GPOUT,32)
    out_scalarizer_0100582 <= in_scalarizer_0100582;

    -- out_scalarizer_0100792(GPOUT,33)
    out_scalarizer_0100792 <= in_scalarizer_0100792;

    -- out_scalarizer_099322(GPOUT,34)
    out_scalarizer_099322 <= in_scalarizer_099322;

    -- out_scalarizer_099532(GPOUT,35)
    out_scalarizer_099532 <= in_scalarizer_099532;

    -- out_scalarizer_099742(GPOUT,36)
    out_scalarizer_099742 <= in_scalarizer_099742;

    -- out_scalarizer_099952(GPOUT,37)
    out_scalarizer_099952 <= in_scalarizer_099952;

    -- out_scalarizer_1100057(GPOUT,38)
    out_scalarizer_1100057 <= in_scalarizer_1100057;

    -- out_scalarizer_1100267(GPOUT,39)
    out_scalarizer_1100267 <= in_scalarizer_1100267;

    -- out_scalarizer_1100477(GPOUT,40)
    out_scalarizer_1100477 <= in_scalarizer_1100477;

    -- out_scalarizer_1100687(GPOUT,41)
    out_scalarizer_1100687 <= in_scalarizer_1100687;

    -- out_scalarizer_1100897(GPOUT,42)
    out_scalarizer_1100897 <= in_scalarizer_1100897;

    -- out_scalarizer_199427(GPOUT,43)
    out_scalarizer_199427 <= in_scalarizer_199427;

    -- out_scalarizer_199637(GPOUT,44)
    out_scalarizer_199637 <= in_scalarizer_199637;

    -- out_scalarizer_199847(GPOUT,45)
    out_scalarizer_199847 <= in_scalarizer_199847;

    -- stall_out(LOGICAL,52)
    stall_out_q <= in_valid_in and in_stall_in_0;

    -- out_stall_out(GPOUT,46)
    out_stall_out <= stall_out_q;

    -- out_state_10_2_cast(GPOUT,47)
    out_state_10_2_cast <= in_state_10_2_cast;

    -- out_state_11_2_cast(GPOUT,48)
    out_state_11_2_cast <= in_state_11_2_cast;

    -- out_state_8_2_cast(GPOUT,49)
    out_state_8_2_cast <= in_state_8_2_cast;

    -- out_state_9_2_cast(GPOUT,50)
    out_state_9_2_cast <= in_state_9_2_cast;

    -- out_valid_out_0(GPOUT,51)
    out_valid_out_0 <= in_valid_in;

END normal;
