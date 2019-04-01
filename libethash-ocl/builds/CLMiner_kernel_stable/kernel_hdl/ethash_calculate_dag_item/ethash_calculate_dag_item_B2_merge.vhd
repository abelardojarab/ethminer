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

-- VHDL created from ethash_calculate_dag_item_B2_merge
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

entity ethash_calculate_dag_item_B2_merge is
    port (
        in_c0_exit1118_0_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit1118_0_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit1118_0_2 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit1118_0_3 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_c0_exit1118_0_4 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit1118_0_5 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_c0_exit1118_0_6 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_7 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_8 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_9 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_10 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_11 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_12 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_13 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_14 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_15 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_16 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_17 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_18 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_19 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_20 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_21 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_22 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_23 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_24 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_25 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_26 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_27 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_28 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_29 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_30 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_31 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_32 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_33 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_34 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_35 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_36 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_37 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_38 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_39 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_40 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_41 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_42 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_43 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_44 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_45 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_46 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_47 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_48 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_49 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_0_50 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_hw_wg_id42_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe11222_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe115_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe21327_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_dag_node_pm_017_0 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit1118_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit1118_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit1118_2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit1118_3 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_c0_exit1118_4 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit1118_5 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_c0_exit1118_6 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_7 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_8 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_9 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_10 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_11 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_12 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_13 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_14 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_15 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_16 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_17 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_18 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_19 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_20 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_21 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_22 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_23 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_24 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_25 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_26 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_27 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_28 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_29 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_30 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_31 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_32 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_33 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_34 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_35 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_36 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_37 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_38 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_39 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_40 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_41 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_42 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_43 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_44 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_45 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_46 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_47 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_48 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_49 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit1118_50 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_hw_wg_id42 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe11222 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe115 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe21327 : out std_logic_vector(0 downto 0);  -- ufix1
        out_dag_node_pm_017 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end ethash_calculate_dag_item_B2_merge;

architecture normal of ethash_calculate_dag_item_B2_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- out_c0_exit1118_0(GPOUT,60)
    out_c0_exit1118_0 <= in_c0_exit1118_0_0;

    -- out_c0_exit1118_1(GPOUT,61)
    out_c0_exit1118_1 <= in_c0_exit1118_0_1;

    -- out_c0_exit1118_2(GPOUT,62)
    out_c0_exit1118_2 <= in_c0_exit1118_0_2;

    -- out_c0_exit1118_3(GPOUT,63)
    out_c0_exit1118_3 <= in_c0_exit1118_0_3;

    -- out_c0_exit1118_4(GPOUT,64)
    out_c0_exit1118_4 <= in_c0_exit1118_0_4;

    -- out_c0_exit1118_5(GPOUT,65)
    out_c0_exit1118_5 <= in_c0_exit1118_0_5;

    -- out_c0_exit1118_6(GPOUT,66)
    out_c0_exit1118_6 <= in_c0_exit1118_0_6;

    -- out_c0_exit1118_7(GPOUT,67)
    out_c0_exit1118_7 <= in_c0_exit1118_0_7;

    -- out_c0_exit1118_8(GPOUT,68)
    out_c0_exit1118_8 <= in_c0_exit1118_0_8;

    -- out_c0_exit1118_9(GPOUT,69)
    out_c0_exit1118_9 <= in_c0_exit1118_0_9;

    -- out_c0_exit1118_10(GPOUT,70)
    out_c0_exit1118_10 <= in_c0_exit1118_0_10;

    -- out_c0_exit1118_11(GPOUT,71)
    out_c0_exit1118_11 <= in_c0_exit1118_0_11;

    -- out_c0_exit1118_12(GPOUT,72)
    out_c0_exit1118_12 <= in_c0_exit1118_0_12;

    -- out_c0_exit1118_13(GPOUT,73)
    out_c0_exit1118_13 <= in_c0_exit1118_0_13;

    -- out_c0_exit1118_14(GPOUT,74)
    out_c0_exit1118_14 <= in_c0_exit1118_0_14;

    -- out_c0_exit1118_15(GPOUT,75)
    out_c0_exit1118_15 <= in_c0_exit1118_0_15;

    -- out_c0_exit1118_16(GPOUT,76)
    out_c0_exit1118_16 <= in_c0_exit1118_0_16;

    -- out_c0_exit1118_17(GPOUT,77)
    out_c0_exit1118_17 <= in_c0_exit1118_0_17;

    -- out_c0_exit1118_18(GPOUT,78)
    out_c0_exit1118_18 <= in_c0_exit1118_0_18;

    -- out_c0_exit1118_19(GPOUT,79)
    out_c0_exit1118_19 <= in_c0_exit1118_0_19;

    -- out_c0_exit1118_20(GPOUT,80)
    out_c0_exit1118_20 <= in_c0_exit1118_0_20;

    -- out_c0_exit1118_21(GPOUT,81)
    out_c0_exit1118_21 <= in_c0_exit1118_0_21;

    -- out_c0_exit1118_22(GPOUT,82)
    out_c0_exit1118_22 <= in_c0_exit1118_0_22;

    -- out_c0_exit1118_23(GPOUT,83)
    out_c0_exit1118_23 <= in_c0_exit1118_0_23;

    -- out_c0_exit1118_24(GPOUT,84)
    out_c0_exit1118_24 <= in_c0_exit1118_0_24;

    -- out_c0_exit1118_25(GPOUT,85)
    out_c0_exit1118_25 <= in_c0_exit1118_0_25;

    -- out_c0_exit1118_26(GPOUT,86)
    out_c0_exit1118_26 <= in_c0_exit1118_0_26;

    -- out_c0_exit1118_27(GPOUT,87)
    out_c0_exit1118_27 <= in_c0_exit1118_0_27;

    -- out_c0_exit1118_28(GPOUT,88)
    out_c0_exit1118_28 <= in_c0_exit1118_0_28;

    -- out_c0_exit1118_29(GPOUT,89)
    out_c0_exit1118_29 <= in_c0_exit1118_0_29;

    -- out_c0_exit1118_30(GPOUT,90)
    out_c0_exit1118_30 <= in_c0_exit1118_0_30;

    -- out_c0_exit1118_31(GPOUT,91)
    out_c0_exit1118_31 <= in_c0_exit1118_0_31;

    -- out_c0_exit1118_32(GPOUT,92)
    out_c0_exit1118_32 <= in_c0_exit1118_0_32;

    -- out_c0_exit1118_33(GPOUT,93)
    out_c0_exit1118_33 <= in_c0_exit1118_0_33;

    -- out_c0_exit1118_34(GPOUT,94)
    out_c0_exit1118_34 <= in_c0_exit1118_0_34;

    -- out_c0_exit1118_35(GPOUT,95)
    out_c0_exit1118_35 <= in_c0_exit1118_0_35;

    -- out_c0_exit1118_36(GPOUT,96)
    out_c0_exit1118_36 <= in_c0_exit1118_0_36;

    -- out_c0_exit1118_37(GPOUT,97)
    out_c0_exit1118_37 <= in_c0_exit1118_0_37;

    -- out_c0_exit1118_38(GPOUT,98)
    out_c0_exit1118_38 <= in_c0_exit1118_0_38;

    -- out_c0_exit1118_39(GPOUT,99)
    out_c0_exit1118_39 <= in_c0_exit1118_0_39;

    -- out_c0_exit1118_40(GPOUT,100)
    out_c0_exit1118_40 <= in_c0_exit1118_0_40;

    -- out_c0_exit1118_41(GPOUT,101)
    out_c0_exit1118_41 <= in_c0_exit1118_0_41;

    -- out_c0_exit1118_42(GPOUT,102)
    out_c0_exit1118_42 <= in_c0_exit1118_0_42;

    -- out_c0_exit1118_43(GPOUT,103)
    out_c0_exit1118_43 <= in_c0_exit1118_0_43;

    -- out_c0_exit1118_44(GPOUT,104)
    out_c0_exit1118_44 <= in_c0_exit1118_0_44;

    -- out_c0_exit1118_45(GPOUT,105)
    out_c0_exit1118_45 <= in_c0_exit1118_0_45;

    -- out_c0_exit1118_46(GPOUT,106)
    out_c0_exit1118_46 <= in_c0_exit1118_0_46;

    -- out_c0_exit1118_47(GPOUT,107)
    out_c0_exit1118_47 <= in_c0_exit1118_0_47;

    -- out_c0_exit1118_48(GPOUT,108)
    out_c0_exit1118_48 <= in_c0_exit1118_0_48;

    -- out_c0_exit1118_49(GPOUT,109)
    out_c0_exit1118_49 <= in_c0_exit1118_0_49;

    -- out_c0_exit1118_50(GPOUT,110)
    out_c0_exit1118_50 <= in_c0_exit1118_0_50;

    -- out_acl_hw_wg_id42(GPOUT,111)
    out_acl_hw_wg_id42 <= in_acl_hw_wg_id42_0;

    -- out_c0_exe11222(GPOUT,112)
    out_c0_exe11222 <= in_c0_exe11222_0;

    -- out_c0_exe115(GPOUT,113)
    out_c0_exe115 <= in_c0_exe115_0;

    -- out_c0_exe21327(GPOUT,114)
    out_c0_exe21327 <= in_c0_exe21327_0;

    -- out_dag_node_pm_017(GPOUT,115)
    out_dag_node_pm_017 <= in_dag_node_pm_017_0;

    -- stall_out(LOGICAL,118)
    stall_out_q <= in_valid_in_0 and in_stall_in;

    -- out_stall_out_0(GPOUT,116)
    out_stall_out_0 <= stall_out_q;

    -- out_valid_out(GPOUT,117)
    out_valid_out <= in_valid_in_0;

END normal;
