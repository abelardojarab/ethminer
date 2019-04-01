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

-- VHDL created from ethash_search_B0_branch
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

entity ethash_search_B0_branch is
    port (
        in_acl_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_0979 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_0981 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_0983 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_0985 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_1980 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_1982 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_1984 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_1986 : in std_logic_vector(31 downto 0);  -- ufix32
        in_add : in std_logic_vector(63 downto 0);  -- ufix64
        in_global_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_0_addr : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_acl_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_0979 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_0981 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_0983 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_0985 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_1980 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_1982 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_1984 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_1986 : out std_logic_vector(31 downto 0);  -- ufix32
        out_add : out std_logic_vector(63 downto 0);  -- ufix64
        out_global_id_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0_addr : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end ethash_search_B0_branch;

architecture normal of ethash_search_B0_branch is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- out_acl_0(GPOUT,18)
    out_acl_0 <= in_acl_0;

    -- out_acl_0979(GPOUT,19)
    out_acl_0979 <= in_acl_0979;

    -- out_acl_0981(GPOUT,20)
    out_acl_0981 <= in_acl_0981;

    -- out_acl_0983(GPOUT,21)
    out_acl_0983 <= in_acl_0983;

    -- out_acl_0985(GPOUT,22)
    out_acl_0985 <= in_acl_0985;

    -- out_acl_1(GPOUT,23)
    out_acl_1 <= in_acl_1;

    -- out_acl_1980(GPOUT,24)
    out_acl_1980 <= in_acl_1980;

    -- out_acl_1982(GPOUT,25)
    out_acl_1982 <= in_acl_1982;

    -- out_acl_1984(GPOUT,26)
    out_acl_1984 <= in_acl_1984;

    -- out_acl_1986(GPOUT,27)
    out_acl_1986 <= in_acl_1986;

    -- out_add(GPOUT,28)
    out_add <= in_add;

    -- out_global_id_0(GPOUT,29)
    out_global_id_0 <= in_global_id_0;

    -- out_l_grpid_0(GPOUT,30)
    out_l_grpid_0 <= in_l_grpid_0;

    -- out_l_grpid_0_addr(GPOUT,31)
    out_l_grpid_0_addr <= in_l_grpid_0_addr;

    -- stall_out(LOGICAL,34)
    stall_out_q <= in_valid_in and in_stall_in_0;

    -- out_stall_out(GPOUT,32)
    out_stall_out <= stall_out_q;

    -- out_valid_out_0(GPOUT,33)
    out_valid_out_0 <= in_valid_in;

END normal;
