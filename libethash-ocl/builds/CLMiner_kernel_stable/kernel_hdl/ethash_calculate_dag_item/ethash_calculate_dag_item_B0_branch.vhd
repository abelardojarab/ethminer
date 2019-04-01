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

-- VHDL created from ethash_calculate_dag_item_B0_branch
-- VHDL created on Mon Apr  1 13:52:59 2019


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

entity ethash_calculate_dag_item_B0_branch is
    port (
        in_acl_01361 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_01370 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_01379 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_01385 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_01387 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_11362 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_11371 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_11380 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_11386 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_11388 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_hw_wg_id : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_reduction_ethash_calculate_dag_item_4_compressed : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_acl_01361 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_01370 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_01379 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_01385 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_01387 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_11362 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_11371 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_11380 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_11386 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_11388 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_hw_wg_id : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_reduction_ethash_calculate_dag_item_4_compressed : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end ethash_calculate_dag_item_B0_branch;

architecture normal of ethash_calculate_dag_item_B0_branch is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- out_acl_01361(GPOUT,17)
    out_acl_01361 <= in_acl_01361;

    -- out_acl_01370(GPOUT,18)
    out_acl_01370 <= in_acl_01370;

    -- out_acl_01379(GPOUT,19)
    out_acl_01379 <= in_acl_01379;

    -- out_acl_01385(GPOUT,20)
    out_acl_01385 <= in_acl_01385;

    -- out_acl_01387(GPOUT,21)
    out_acl_01387 <= in_acl_01387;

    -- out_acl_11362(GPOUT,22)
    out_acl_11362 <= in_acl_11362;

    -- out_acl_11371(GPOUT,23)
    out_acl_11371 <= in_acl_11371;

    -- out_acl_11380(GPOUT,24)
    out_acl_11380 <= in_acl_11380;

    -- out_acl_11386(GPOUT,25)
    out_acl_11386 <= in_acl_11386;

    -- out_acl_11388(GPOUT,26)
    out_acl_11388 <= in_acl_11388;

    -- out_acl_hw_wg_id(GPOUT,27)
    out_acl_hw_wg_id <= in_acl_hw_wg_id;

    -- out_c0_exe1(GPOUT,28)
    out_c0_exe1 <= in_c0_exe1;

    -- out_reduction_ethash_calculate_dag_item_4_compressed(GPOUT,29)
    out_reduction_ethash_calculate_dag_item_4_compressed <= in_reduction_ethash_calculate_dag_item_4_compressed;

    -- stall_out(LOGICAL,32)
    stall_out_q <= in_valid_in and in_stall_in_0;

    -- out_stall_out(GPOUT,30)
    out_stall_out <= stall_out_q;

    -- out_valid_out_0(GPOUT,31)
    out_valid_out_0 <= in_valid_in;

END normal;
