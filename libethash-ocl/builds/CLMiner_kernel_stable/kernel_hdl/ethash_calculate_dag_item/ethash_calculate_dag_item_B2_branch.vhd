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

-- VHDL created from ethash_calculate_dag_item_B2_branch
-- VHDL created on Mon Apr  1 13:52:57 2019


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

entity ethash_calculate_dag_item_B2_branch is
    port (
        in_acl_hw_wg_id42 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe11222 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe115 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe21327 : in std_logic_vector(0 downto 0);  -- ufix1
        in_dag_node_pm_017 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_pre693_pml_t_bitcast_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_pre693_pml_t_bitcast_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_pre693_pml_t_bitcast_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_pre693_pml_t_bitcast_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_pre694_pml_t_bitcast_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_pre694_pml_t_bitcast_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_pre694_pml_t_bitcast_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_pre694_pml_t_bitcast_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_pre695_pml_t_bitcast_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_pre695_pml_t_bitcast_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_pre695_pml_t_bitcast_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_pre695_pml_t_bitcast_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_pre_pml_t_bitcast_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_pre_pml_t_bitcast_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_pre_pml_t_bitcast_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_pre_pml_t_bitcast_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_acl_hw_wg_id42 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe11222 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe115 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe21327 : out std_logic_vector(0 downto 0);  -- ufix1
        out_dag_node_pm_017 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_pre693_pml_t_bitcast_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_pre693_pml_t_bitcast_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_pre693_pml_t_bitcast_2 : out std_logic_vector(31 downto 0);  -- ufix32
        out_pre693_pml_t_bitcast_3 : out std_logic_vector(31 downto 0);  -- ufix32
        out_pre694_pml_t_bitcast_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_pre694_pml_t_bitcast_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_pre694_pml_t_bitcast_2 : out std_logic_vector(31 downto 0);  -- ufix32
        out_pre694_pml_t_bitcast_3 : out std_logic_vector(31 downto 0);  -- ufix32
        out_pre695_pml_t_bitcast_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_pre695_pml_t_bitcast_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_pre695_pml_t_bitcast_2 : out std_logic_vector(31 downto 0);  -- ufix32
        out_pre695_pml_t_bitcast_3 : out std_logic_vector(31 downto 0);  -- ufix32
        out_pre_pml_t_bitcast_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_pre_pml_t_bitcast_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_pre_pml_t_bitcast_2 : out std_logic_vector(31 downto 0);  -- ufix32
        out_pre_pml_t_bitcast_3 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end ethash_calculate_dag_item_B2_branch;

architecture normal of ethash_calculate_dag_item_B2_branch is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- out_acl_hw_wg_id42(GPOUT,25)
    out_acl_hw_wg_id42 <= in_acl_hw_wg_id42;

    -- out_c0_exe11222(GPOUT,26)
    out_c0_exe11222 <= in_c0_exe11222;

    -- out_c0_exe115(GPOUT,27)
    out_c0_exe115 <= in_c0_exe115;

    -- out_c0_exe21327(GPOUT,28)
    out_c0_exe21327 <= in_c0_exe21327;

    -- out_dag_node_pm_017(GPOUT,29)
    out_dag_node_pm_017 <= in_dag_node_pm_017;

    -- out_pre693_pml_t_bitcast_0(GPOUT,30)
    out_pre693_pml_t_bitcast_0 <= in_pre693_pml_t_bitcast_0;

    -- out_pre693_pml_t_bitcast_1(GPOUT,31)
    out_pre693_pml_t_bitcast_1 <= in_pre693_pml_t_bitcast_1;

    -- out_pre693_pml_t_bitcast_2(GPOUT,32)
    out_pre693_pml_t_bitcast_2 <= in_pre693_pml_t_bitcast_2;

    -- out_pre693_pml_t_bitcast_3(GPOUT,33)
    out_pre693_pml_t_bitcast_3 <= in_pre693_pml_t_bitcast_3;

    -- out_pre694_pml_t_bitcast_0(GPOUT,34)
    out_pre694_pml_t_bitcast_0 <= in_pre694_pml_t_bitcast_0;

    -- out_pre694_pml_t_bitcast_1(GPOUT,35)
    out_pre694_pml_t_bitcast_1 <= in_pre694_pml_t_bitcast_1;

    -- out_pre694_pml_t_bitcast_2(GPOUT,36)
    out_pre694_pml_t_bitcast_2 <= in_pre694_pml_t_bitcast_2;

    -- out_pre694_pml_t_bitcast_3(GPOUT,37)
    out_pre694_pml_t_bitcast_3 <= in_pre694_pml_t_bitcast_3;

    -- out_pre695_pml_t_bitcast_0(GPOUT,38)
    out_pre695_pml_t_bitcast_0 <= in_pre695_pml_t_bitcast_0;

    -- out_pre695_pml_t_bitcast_1(GPOUT,39)
    out_pre695_pml_t_bitcast_1 <= in_pre695_pml_t_bitcast_1;

    -- out_pre695_pml_t_bitcast_2(GPOUT,40)
    out_pre695_pml_t_bitcast_2 <= in_pre695_pml_t_bitcast_2;

    -- out_pre695_pml_t_bitcast_3(GPOUT,41)
    out_pre695_pml_t_bitcast_3 <= in_pre695_pml_t_bitcast_3;

    -- out_pre_pml_t_bitcast_0(GPOUT,42)
    out_pre_pml_t_bitcast_0 <= in_pre_pml_t_bitcast_0;

    -- out_pre_pml_t_bitcast_1(GPOUT,43)
    out_pre_pml_t_bitcast_1 <= in_pre_pml_t_bitcast_1;

    -- out_pre_pml_t_bitcast_2(GPOUT,44)
    out_pre_pml_t_bitcast_2 <= in_pre_pml_t_bitcast_2;

    -- out_pre_pml_t_bitcast_3(GPOUT,45)
    out_pre_pml_t_bitcast_3 <= in_pre_pml_t_bitcast_3;

    -- stall_out(LOGICAL,48)
    stall_out_q <= in_valid_in and in_stall_in_0;

    -- out_stall_out(GPOUT,46)
    out_stall_out <= stall_out_q;

    -- out_valid_out_0(GPOUT,47)
    out_valid_out_0 <= in_valid_in;

END normal;
