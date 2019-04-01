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

-- VHDL created from ethash_search_B8_merge
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

entity ethash_search_B8_merge is
    port (
        in_global_id_0190_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_01_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01232188_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11233189_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_state_10_2_cast184_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_11_2_cast186_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_8_2_cast180_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_9_2_cast182_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_global_id_0190 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_01 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_01232188 : out std_logic_vector(31 downto 0);  -- ufix32
        out_scalarizer_11233189 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_state_10_2_cast184 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_11_2_cast186 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_8_2_cast180 : out std_logic_vector(63 downto 0);  -- ufix64
        out_state_9_2_cast182 : out std_logic_vector(63 downto 0);  -- ufix64
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end ethash_search_B8_merge;

architecture normal of ethash_search_B8_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- out_global_id_0190(GPOUT,12)
    out_global_id_0190 <= in_global_id_0190_0;

    -- out_l_grpid_01(GPOUT,13)
    out_l_grpid_01 <= in_l_grpid_01_0;

    -- out_scalarizer_01232188(GPOUT,14)
    out_scalarizer_01232188 <= in_scalarizer_01232188_0;

    -- out_scalarizer_11233189(GPOUT,15)
    out_scalarizer_11233189 <= in_scalarizer_11233189_0;

    -- stall_out(LOGICAL,22)
    stall_out_q <= in_valid_in_0 and in_stall_in;

    -- out_stall_out_0(GPOUT,16)
    out_stall_out_0 <= stall_out_q;

    -- out_state_10_2_cast184(GPOUT,17)
    out_state_10_2_cast184 <= in_state_10_2_cast184_0;

    -- out_state_11_2_cast186(GPOUT,18)
    out_state_11_2_cast186 <= in_state_11_2_cast186_0;

    -- out_state_8_2_cast180(GPOUT,19)
    out_state_8_2_cast180 <= in_state_8_2_cast180_0;

    -- out_state_9_2_cast182(GPOUT,20)
    out_state_9_2_cast182 <= in_state_9_2_cast182_0;

    -- out_valid_out(GPOUT,21)
    out_valid_out <= in_valid_in_0;

END normal;
