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

-- VHDL created from ethash_calculate_dag_item_B4_branch
-- VHDL created on Mon Apr  1 13:52:58 2019


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

entity ethash_calculate_dag_item_B4_branch is
    port (
        in_acl_01644 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_01646 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_01648 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_11645 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_11647 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_11649 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_hw_wg_id40 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe11220 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe113 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe21325 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe1031 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe1132 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe129 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe1533 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe1634 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe230 : in std_logic_vector(31 downto 0);  -- ufix32
        in_pms_cs1241_pms_vs_pms_vm_pms_d : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_acl_01644 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_01646 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_01648 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_11645 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_11647 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_11649 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_hw_wg_id40 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe11220 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe113 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe21325 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe1031 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe1132 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe129 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe1533 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe1634 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe230 : out std_logic_vector(31 downto 0);  -- ufix32
        out_pms_cs1241_pms_vs_pms_vm_pms_d : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end ethash_calculate_dag_item_B4_branch;

architecture normal of ethash_calculate_dag_item_B4_branch is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- out_acl_01644(GPOUT,21)
    out_acl_01644 <= in_acl_01644;

    -- out_acl_01646(GPOUT,22)
    out_acl_01646 <= in_acl_01646;

    -- out_acl_01648(GPOUT,23)
    out_acl_01648 <= in_acl_01648;

    -- out_acl_11645(GPOUT,24)
    out_acl_11645 <= in_acl_11645;

    -- out_acl_11647(GPOUT,25)
    out_acl_11647 <= in_acl_11647;

    -- out_acl_11649(GPOUT,26)
    out_acl_11649 <= in_acl_11649;

    -- out_acl_hw_wg_id40(GPOUT,27)
    out_acl_hw_wg_id40 <= in_acl_hw_wg_id40;

    -- out_c0_exe11220(GPOUT,28)
    out_c0_exe11220 <= in_c0_exe11220;

    -- out_c0_exe113(GPOUT,29)
    out_c0_exe113 <= in_c0_exe113;

    -- out_c0_exe21325(GPOUT,30)
    out_c0_exe21325 <= in_c0_exe21325;

    -- out_c1_exe1031(GPOUT,31)
    out_c1_exe1031 <= in_c1_exe1031;

    -- out_c1_exe1132(GPOUT,32)
    out_c1_exe1132 <= in_c1_exe1132;

    -- out_c1_exe129(GPOUT,33)
    out_c1_exe129 <= in_c1_exe129;

    -- out_c1_exe1533(GPOUT,34)
    out_c1_exe1533 <= in_c1_exe1533;

    -- out_c1_exe1634(GPOUT,35)
    out_c1_exe1634 <= in_c1_exe1634;

    -- out_c1_exe230(GPOUT,36)
    out_c1_exe230 <= in_c1_exe230;

    -- out_pms_cs1241_pms_vs_pms_vm_pms_d(GPOUT,37)
    out_pms_cs1241_pms_vs_pms_vm_pms_d <= in_pms_cs1241_pms_vs_pms_vm_pms_d;

    -- stall_out(LOGICAL,40)
    stall_out_q <= in_valid_in and in_stall_in_0;

    -- out_stall_out(GPOUT,38)
    out_stall_out <= stall_out_q;

    -- out_valid_out_0(GPOUT,39)
    out_valid_out_0 <= in_valid_in;

END normal;
