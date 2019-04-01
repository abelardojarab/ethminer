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

-- VHDL created from ethash_calculate_dag_item_B4_merge
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

entity ethash_calculate_dag_item_B4_merge is
    port (
        in_c1_exit28_0_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit28_0_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_0_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_0_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_0_4 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_0_5 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_0_6 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_0_7 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_0_8 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_0_9 : in std_logic_vector(127 downto 0);  -- ufix128
        in_c1_exit28_0_10 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_0_11 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_0_12 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_0_13 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_0_14 : in std_logic_vector(127 downto 0);  -- ufix128
        in_c1_exit28_0_15 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_0_16 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_0_17 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_0_18 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_0_19 : in std_logic_vector(127 downto 0);  -- ufix128
        in_c1_exit28_0_20 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_acl_hw_wg_id40_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe11220_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe113_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe21325_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe1031_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe1132_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe129_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe1533_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe1634_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe2035_0 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_c1_exe230_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit28_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit28_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit28_2 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit28_3 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit28_4 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit28_5 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit28_6 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit28_7 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit28_8 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit28_9 : out std_logic_vector(127 downto 0);  -- ufix128
        out_c1_exit28_10 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit28_11 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit28_12 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit28_13 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit28_14 : out std_logic_vector(127 downto 0);  -- ufix128
        out_c1_exit28_15 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit28_16 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit28_17 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit28_18 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit28_19 : out std_logic_vector(127 downto 0);  -- ufix128
        out_c1_exit28_20 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_acl_hw_wg_id40 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe11220 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe113 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe21325 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe1031 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe1132 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe129 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe1533 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe1634 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe2035 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_c1_exe230 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end ethash_calculate_dag_item_B4_merge;

architecture normal of ethash_calculate_dag_item_B4_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- out_c1_exit28_0(GPOUT,36)
    out_c1_exit28_0 <= in_c1_exit28_0_0;

    -- out_c1_exit28_1(GPOUT,37)
    out_c1_exit28_1 <= in_c1_exit28_0_1;

    -- out_c1_exit28_2(GPOUT,38)
    out_c1_exit28_2 <= in_c1_exit28_0_2;

    -- out_c1_exit28_3(GPOUT,39)
    out_c1_exit28_3 <= in_c1_exit28_0_3;

    -- out_c1_exit28_4(GPOUT,40)
    out_c1_exit28_4 <= in_c1_exit28_0_4;

    -- out_c1_exit28_5(GPOUT,41)
    out_c1_exit28_5 <= in_c1_exit28_0_5;

    -- out_c1_exit28_6(GPOUT,42)
    out_c1_exit28_6 <= in_c1_exit28_0_6;

    -- out_c1_exit28_7(GPOUT,43)
    out_c1_exit28_7 <= in_c1_exit28_0_7;

    -- out_c1_exit28_8(GPOUT,44)
    out_c1_exit28_8 <= in_c1_exit28_0_8;

    -- out_c1_exit28_9(GPOUT,45)
    out_c1_exit28_9 <= in_c1_exit28_0_9;

    -- out_c1_exit28_10(GPOUT,46)
    out_c1_exit28_10 <= in_c1_exit28_0_10;

    -- out_c1_exit28_11(GPOUT,47)
    out_c1_exit28_11 <= in_c1_exit28_0_11;

    -- out_c1_exit28_12(GPOUT,48)
    out_c1_exit28_12 <= in_c1_exit28_0_12;

    -- out_c1_exit28_13(GPOUT,49)
    out_c1_exit28_13 <= in_c1_exit28_0_13;

    -- out_c1_exit28_14(GPOUT,50)
    out_c1_exit28_14 <= in_c1_exit28_0_14;

    -- out_c1_exit28_15(GPOUT,51)
    out_c1_exit28_15 <= in_c1_exit28_0_15;

    -- out_c1_exit28_16(GPOUT,52)
    out_c1_exit28_16 <= in_c1_exit28_0_16;

    -- out_c1_exit28_17(GPOUT,53)
    out_c1_exit28_17 <= in_c1_exit28_0_17;

    -- out_c1_exit28_18(GPOUT,54)
    out_c1_exit28_18 <= in_c1_exit28_0_18;

    -- out_c1_exit28_19(GPOUT,55)
    out_c1_exit28_19 <= in_c1_exit28_0_19;

    -- out_c1_exit28_20(GPOUT,56)
    out_c1_exit28_20 <= in_c1_exit28_0_20;

    -- out_acl_hw_wg_id40(GPOUT,57)
    out_acl_hw_wg_id40 <= in_acl_hw_wg_id40_0;

    -- out_c0_exe11220(GPOUT,58)
    out_c0_exe11220 <= in_c0_exe11220_0;

    -- out_c0_exe113(GPOUT,59)
    out_c0_exe113 <= in_c0_exe113_0;

    -- out_c0_exe21325(GPOUT,60)
    out_c0_exe21325 <= in_c0_exe21325_0;

    -- out_c1_exe1031(GPOUT,61)
    out_c1_exe1031 <= in_c1_exe1031_0;

    -- out_c1_exe1132(GPOUT,62)
    out_c1_exe1132 <= in_c1_exe1132_0;

    -- out_c1_exe129(GPOUT,63)
    out_c1_exe129 <= in_c1_exe129_0;

    -- out_c1_exe1533(GPOUT,64)
    out_c1_exe1533 <= in_c1_exe1533_0;

    -- out_c1_exe1634(GPOUT,65)
    out_c1_exe1634 <= in_c1_exe1634_0;

    -- out_c1_exe2035(GPOUT,66)
    out_c1_exe2035 <= in_c1_exe2035_0;

    -- out_c1_exe230(GPOUT,67)
    out_c1_exe230 <= in_c1_exe230_0;

    -- stall_out(LOGICAL,70)
    stall_out_q <= in_valid_in_0 and in_stall_in;

    -- out_stall_out_0(GPOUT,68)
    out_stall_out_0 <= stall_out_q;

    -- out_valid_out(GPOUT,69)
    out_valid_out <= in_valid_in_0;

END normal;
