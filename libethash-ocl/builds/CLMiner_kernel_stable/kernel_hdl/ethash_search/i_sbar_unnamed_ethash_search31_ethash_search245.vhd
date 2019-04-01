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

-- VHDL created from i_sbar_unnamed_ethash_search31_ethash_search245
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

entity i_sbar_unnamed_ethash_search31_ethash_search245 is
    port (
        in_data_entry : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_entry : in std_logic_vector(0 downto 0);  -- ufix1
        out_data_exit : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_exit : out std_logic_vector(0 downto 0);  -- ufix1
        in_workgroup_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_exit : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_entry : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sbar_unnamed_ethash_search31_ethash_search245;

architecture normal of i_sbar_unnamed_ethash_search31_ethash_search245 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component acl_barrier_simple_with_stallout is
        generic (
            DATA_WIDTH : INTEGER := 8;
            DEPTH : INTEGER := 128;
            WORKGROUP_SIZE_BITS : INTEGER := 8
        );
        port (
            data_entry : in std_logic_vector(7 downto 0);
            stall_exit : in std_logic;
            valid_entry : in std_logic;
            workgroup_size : in std_logic_vector(7 downto 0);
            data_exit : out std_logic_vector(7 downto 0);
            stall_entry : out std_logic;
            valid_exit : out std_logic;
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal adapt_scalar_trunc_in : STD_LOGIC_VECTOR (0 downto 0);
    signal adapt_scalar_trunc_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c_i7_0gr_q : STD_LOGIC_VECTOR (6 downto 0);
    signal element_extension_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sbar_unnamed_ethash_search31_ethash_search246_data_entry : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sbar_unnamed_ethash_search31_ethash_search246_stall_exit : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sbar_unnamed_ethash_search31_ethash_search246_stall_exit_bitsignaltemp : std_logic;
    signal i_sbar_unnamed_ethash_search31_ethash_search246_valid_entry : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sbar_unnamed_ethash_search31_ethash_search246_valid_entry_bitsignaltemp : std_logic;
    signal i_sbar_unnamed_ethash_search31_ethash_search246_workgroup_size : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sbar_unnamed_ethash_search31_ethash_search246_data_exit : STD_LOGIC_VECTOR (7 downto 0);
    signal i_sbar_unnamed_ethash_search31_ethash_search246_stall_entry : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sbar_unnamed_ethash_search31_ethash_search246_stall_entry_bitsignaltemp : std_logic;
    signal i_sbar_unnamed_ethash_search31_ethash_search246_valid_exit : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sbar_unnamed_ethash_search31_ethash_search246_valid_exit_bitsignaltemp : std_logic;
    signal wgs_trunc_in : STD_LOGIC_VECTOR (7 downto 0);
    signal wgs_trunc_q : STD_LOGIC_VECTOR (7 downto 0);

begin


    -- wgs_trunc(ROUND,11)
    wgs_trunc_in <= in_workgroup_size(7 downto 0);
    wgs_trunc_q <= wgs_trunc_in(7 downto 0);

    -- c_i7_0gr(CONSTANT,5)
    c_i7_0gr_q <= "0000000";

    -- element_extension(BITJOIN,6)
    element_extension_q <= c_i7_0gr_q & in_data_entry;

    -- i_sbar_unnamed_ethash_search31_ethash_search246(EXTIFACE,7)
    i_sbar_unnamed_ethash_search31_ethash_search246_data_entry <= element_extension_q;
    i_sbar_unnamed_ethash_search31_ethash_search246_stall_exit <= in_stall_exit;
    i_sbar_unnamed_ethash_search31_ethash_search246_valid_entry <= in_valid_entry;
    i_sbar_unnamed_ethash_search31_ethash_search246_workgroup_size <= wgs_trunc_q;
    i_sbar_unnamed_ethash_search31_ethash_search246_stall_exit_bitsignaltemp <= i_sbar_unnamed_ethash_search31_ethash_search246_stall_exit(0);
    i_sbar_unnamed_ethash_search31_ethash_search246_valid_entry_bitsignaltemp <= i_sbar_unnamed_ethash_search31_ethash_search246_valid_entry(0);
    i_sbar_unnamed_ethash_search31_ethash_search246_stall_entry(0) <= i_sbar_unnamed_ethash_search31_ethash_search246_stall_entry_bitsignaltemp;
    i_sbar_unnamed_ethash_search31_ethash_search246_valid_exit(0) <= i_sbar_unnamed_ethash_search31_ethash_search246_valid_exit_bitsignaltemp;
    thei_sbar_unnamed_ethash_search31_ethash_search246 : acl_barrier_simple_with_stallout
    GENERIC MAP (
        DATA_WIDTH => 8,
        DEPTH => 128,
        WORKGROUP_SIZE_BITS => 8
    )
    PORT MAP (
        data_entry => element_extension_q,
        stall_exit => i_sbar_unnamed_ethash_search31_ethash_search246_stall_exit_bitsignaltemp,
        valid_entry => i_sbar_unnamed_ethash_search31_ethash_search246_valid_entry_bitsignaltemp,
        workgroup_size => wgs_trunc_q,
        data_exit => i_sbar_unnamed_ethash_search31_ethash_search246_data_exit,
        stall_entry => i_sbar_unnamed_ethash_search31_ethash_search246_stall_entry_bitsignaltemp,
        valid_exit => i_sbar_unnamed_ethash_search31_ethash_search246_valid_exit_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- adapt_scalar_trunc(ROUND,4)
    adapt_scalar_trunc_in <= i_sbar_unnamed_ethash_search31_ethash_search246_data_exit(0 downto 0);
    adapt_scalar_trunc_q <= adapt_scalar_trunc_in(0 downto 0);

    -- dupName_0_sync_out_x(GPOUT,3)@485
    out_data_exit <= adapt_scalar_trunc_q;
    out_valid_exit <= i_sbar_unnamed_ethash_search31_ethash_search246_valid_exit;

    -- sync_out(GPOUT,10)@20000000
    out_stall_entry <= i_sbar_unnamed_ethash_search31_ethash_search246_stall_entry;

END normal;
