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

-- VHDL created from bb_ethash_calculate_dag_item_B6
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

entity bb_ethash_calculate_dag_item_B6 is
    port (
        in_c0_exit16937_0_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit16937_0_1 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_c0_exit16937_0_2 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit16937_0_3 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_c0_exit16937_0_4 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_5 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_6 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_7 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_8 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_9 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_10 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_11 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_12 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_13 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_14 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_15 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_16 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_17 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_18 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_19 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_20 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_21 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_22 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_23 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_24 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_25 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_26 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_27 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_28 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_29 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_30 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_31 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_32 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_33 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_34 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_35 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_36 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_37 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_38 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_39 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_40 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_41 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_42 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_43 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_44 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_45 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_46 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_47 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_48 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_49 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_0_50 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_hw_wg_id38_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe110_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe21323_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_dag_node_pm_236_0 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_g_dag : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_calculate_dag_item15_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_unnamed_ethash_calculate_dag_item15_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_calculate_dag_item15_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_calculate_dag_item15_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_acl_hw_wg_id38 : out std_logic_vector(31 downto 0);  -- ufix32
        out_lsu_unnamed_ethash_calculate_dag_item15_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_calculate_dag_item15_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        out_unnamed_ethash_calculate_dag_item15_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_ethash_calculate_dag_item15_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_ethash_calculate_dag_item15_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_calculate_dag_item15_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_calculate_dag_item15_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_calculate_dag_item15_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_ethash_calculate_dag_item_B6;

architecture normal of bb_ethash_calculate_dag_item_B6 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component ethash_calculate_dag_item_B6_merge is
        port (
            in_c0_exit16937_0_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit16937_0_1 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_c0_exit16937_0_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit16937_0_3 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_c0_exit16937_0_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_14 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_17 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_18 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_19 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_20 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_21 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_22 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_23 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_24 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_25 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_26 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_27 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_28 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_29 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_30 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_31 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_32 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_33 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_34 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_35 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_36 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_37 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_38 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_39 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_40 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_41 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_42 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_43 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_44 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_45 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_46 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_47 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_48 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_49 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_0_50 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_hw_wg_id38_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe110_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe21323_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dag_node_pm_236_0 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit16937_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit16937_1 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_c0_exit16937_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit16937_3 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_c0_exit16937_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_19 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_20 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_21 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_22 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_23 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_25 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_26 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_27 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_28 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_29 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_30 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_31 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_32 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_33 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_34 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_35 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_36 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_37 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_38 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_39 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_40 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_41 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_42 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_43 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_44 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_45 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_46 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_47 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_48 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_49 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit16937_50 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_hw_wg_id38 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe110 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe21323 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_dag_node_pm_236 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_calculate_dag_item_B6_stall_region is
        port (
            in_c0_exit16937_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit16937_1 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_c0_exit16937_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit16937_3 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_c0_exit16937_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_14 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_17 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_18 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_19 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_20 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_21 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_22 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_23 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_24 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_25 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_26 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_27 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_28 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_29 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_30 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_31 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_32 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_33 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_34 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_35 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_36 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_37 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_38 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_39 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_40 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_41 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_42 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_43 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_44 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_45 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_46 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_47 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_48 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_49 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit16937_50 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_hw_wg_id38 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe110 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe21323 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dag_node_pm_236 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_g_dag : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_calculate_dag_item15_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_unnamed_ethash_calculate_dag_item15_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_calculate_dag_item15_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_calculate_dag_item15_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_hw_wg_id38 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_lsu_unnamed_ethash_calculate_dag_item15_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_calculate_dag_item15_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_unnamed_ethash_calculate_dag_item15_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_ethash_calculate_dag_item15_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_unnamed_ethash_calculate_dag_item15_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_calculate_dag_item15_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_calculate_dag_item15_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_calculate_dag_item15_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component ethash_calculate_dag_item_B6_branch is
        port (
            in_acl_hw_wg_id38 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_hw_wg_id38 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_1 : STD_LOGIC_VECTOR (1663 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_3 : STD_LOGIC_VECTOR (1663 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_19 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_20 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_21 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_22 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_23 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_24 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_25 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_26 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_27 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_28 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_29 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_30 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_31 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_32 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_33 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_34 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_35 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_36 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_37 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_38 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_39 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_40 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_41 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_42 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_43 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_44 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_45 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_46 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_47 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_48 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_49 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_50 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_acl_hw_wg_id38 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exe110 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exe21323 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_dag_node_pm_236 : STD_LOGIC_VECTOR (1663 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B6_merge_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B6_stall_region_out_acl_hw_wg_id38 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B6_stall_region_out_lsu_unnamed_ethash_calculate_dag_item15_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B6_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B6_stall_region_out_unnamed_ethash_calculate_dag_item15_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal bb_ethash_calculate_dag_item_B6_stall_region_out_unnamed_ethash_calculate_dag_item15_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_ethash_calculate_dag_item_B6_stall_region_out_unnamed_ethash_calculate_dag_item15_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_calculate_dag_item_B6_stall_region_out_unnamed_ethash_calculate_dag_item15_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B6_stall_region_out_unnamed_ethash_calculate_dag_item15_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B6_stall_region_out_unnamed_ethash_calculate_dag_item15_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B6_stall_region_out_unnamed_ethash_calculate_dag_item15_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal bb_ethash_calculate_dag_item_B6_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B6_branch_out_acl_hw_wg_id38 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B6_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B6_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- ethash_calculate_dag_item_B6_merge_aunroll_x(BLACKBOX,2)
    theethash_calculate_dag_item_B6_merge_aunroll_x : ethash_calculate_dag_item_B6_merge
    PORT MAP (
        in_c0_exit16937_0_0 => in_c0_exit16937_0_0,
        in_c0_exit16937_0_1 => in_c0_exit16937_0_1,
        in_c0_exit16937_0_2 => in_c0_exit16937_0_2,
        in_c0_exit16937_0_3 => in_c0_exit16937_0_3,
        in_c0_exit16937_0_4 => in_c0_exit16937_0_4,
        in_c0_exit16937_0_5 => in_c0_exit16937_0_5,
        in_c0_exit16937_0_6 => in_c0_exit16937_0_6,
        in_c0_exit16937_0_7 => in_c0_exit16937_0_7,
        in_c0_exit16937_0_8 => in_c0_exit16937_0_8,
        in_c0_exit16937_0_9 => in_c0_exit16937_0_9,
        in_c0_exit16937_0_10 => in_c0_exit16937_0_10,
        in_c0_exit16937_0_11 => in_c0_exit16937_0_11,
        in_c0_exit16937_0_12 => in_c0_exit16937_0_12,
        in_c0_exit16937_0_13 => in_c0_exit16937_0_13,
        in_c0_exit16937_0_14 => in_c0_exit16937_0_14,
        in_c0_exit16937_0_15 => in_c0_exit16937_0_15,
        in_c0_exit16937_0_16 => in_c0_exit16937_0_16,
        in_c0_exit16937_0_17 => in_c0_exit16937_0_17,
        in_c0_exit16937_0_18 => in_c0_exit16937_0_18,
        in_c0_exit16937_0_19 => in_c0_exit16937_0_19,
        in_c0_exit16937_0_20 => in_c0_exit16937_0_20,
        in_c0_exit16937_0_21 => in_c0_exit16937_0_21,
        in_c0_exit16937_0_22 => in_c0_exit16937_0_22,
        in_c0_exit16937_0_23 => in_c0_exit16937_0_23,
        in_c0_exit16937_0_24 => in_c0_exit16937_0_24,
        in_c0_exit16937_0_25 => in_c0_exit16937_0_25,
        in_c0_exit16937_0_26 => in_c0_exit16937_0_26,
        in_c0_exit16937_0_27 => in_c0_exit16937_0_27,
        in_c0_exit16937_0_28 => in_c0_exit16937_0_28,
        in_c0_exit16937_0_29 => in_c0_exit16937_0_29,
        in_c0_exit16937_0_30 => in_c0_exit16937_0_30,
        in_c0_exit16937_0_31 => in_c0_exit16937_0_31,
        in_c0_exit16937_0_32 => in_c0_exit16937_0_32,
        in_c0_exit16937_0_33 => in_c0_exit16937_0_33,
        in_c0_exit16937_0_34 => in_c0_exit16937_0_34,
        in_c0_exit16937_0_35 => in_c0_exit16937_0_35,
        in_c0_exit16937_0_36 => in_c0_exit16937_0_36,
        in_c0_exit16937_0_37 => in_c0_exit16937_0_37,
        in_c0_exit16937_0_38 => in_c0_exit16937_0_38,
        in_c0_exit16937_0_39 => in_c0_exit16937_0_39,
        in_c0_exit16937_0_40 => in_c0_exit16937_0_40,
        in_c0_exit16937_0_41 => in_c0_exit16937_0_41,
        in_c0_exit16937_0_42 => in_c0_exit16937_0_42,
        in_c0_exit16937_0_43 => in_c0_exit16937_0_43,
        in_c0_exit16937_0_44 => in_c0_exit16937_0_44,
        in_c0_exit16937_0_45 => in_c0_exit16937_0_45,
        in_c0_exit16937_0_46 => in_c0_exit16937_0_46,
        in_c0_exit16937_0_47 => in_c0_exit16937_0_47,
        in_c0_exit16937_0_48 => in_c0_exit16937_0_48,
        in_c0_exit16937_0_49 => in_c0_exit16937_0_49,
        in_c0_exit16937_0_50 => in_c0_exit16937_0_50,
        in_acl_hw_wg_id38_0 => in_acl_hw_wg_id38_0,
        in_c0_exe110_0 => in_c0_exe110_0,
        in_c0_exe21323_0 => in_c0_exe21323_0,
        in_dag_node_pm_236_0 => in_dag_node_pm_236_0,
        in_stall_in => bb_ethash_calculate_dag_item_B6_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        out_c0_exit16937_0 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_0,
        out_c0_exit16937_1 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_1,
        out_c0_exit16937_2 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_2,
        out_c0_exit16937_3 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_3,
        out_c0_exit16937_4 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_4,
        out_c0_exit16937_5 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_5,
        out_c0_exit16937_6 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_6,
        out_c0_exit16937_7 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_7,
        out_c0_exit16937_8 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_8,
        out_c0_exit16937_9 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_9,
        out_c0_exit16937_10 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_10,
        out_c0_exit16937_11 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_11,
        out_c0_exit16937_12 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_12,
        out_c0_exit16937_13 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_13,
        out_c0_exit16937_14 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_14,
        out_c0_exit16937_15 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_15,
        out_c0_exit16937_16 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_16,
        out_c0_exit16937_17 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_17,
        out_c0_exit16937_18 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_18,
        out_c0_exit16937_19 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_19,
        out_c0_exit16937_20 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_20,
        out_c0_exit16937_21 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_21,
        out_c0_exit16937_22 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_22,
        out_c0_exit16937_23 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_23,
        out_c0_exit16937_24 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_24,
        out_c0_exit16937_25 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_25,
        out_c0_exit16937_26 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_26,
        out_c0_exit16937_27 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_27,
        out_c0_exit16937_28 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_28,
        out_c0_exit16937_29 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_29,
        out_c0_exit16937_30 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_30,
        out_c0_exit16937_31 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_31,
        out_c0_exit16937_32 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_32,
        out_c0_exit16937_33 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_33,
        out_c0_exit16937_34 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_34,
        out_c0_exit16937_35 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_35,
        out_c0_exit16937_36 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_36,
        out_c0_exit16937_37 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_37,
        out_c0_exit16937_38 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_38,
        out_c0_exit16937_39 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_39,
        out_c0_exit16937_40 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_40,
        out_c0_exit16937_41 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_41,
        out_c0_exit16937_42 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_42,
        out_c0_exit16937_43 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_43,
        out_c0_exit16937_44 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_44,
        out_c0_exit16937_45 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_45,
        out_c0_exit16937_46 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_46,
        out_c0_exit16937_47 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_47,
        out_c0_exit16937_48 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_48,
        out_c0_exit16937_49 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_49,
        out_c0_exit16937_50 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_50,
        out_acl_hw_wg_id38 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_acl_hw_wg_id38,
        out_c0_exe110 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exe110,
        out_c0_exe21323 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exe21323,
        out_dag_node_pm_236 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_dag_node_pm_236,
        out_stall_out_0 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_stall_out_0,
        out_valid_out => ethash_calculate_dag_item_B6_merge_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_calculate_dag_item_B6_stall_region(BLACKBOX,66)
    thebb_ethash_calculate_dag_item_B6_stall_region : bb_ethash_calculate_dag_item_B6_stall_region
    PORT MAP (
        in_c0_exit16937_0 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_0,
        in_c0_exit16937_1 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_1,
        in_c0_exit16937_2 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_2,
        in_c0_exit16937_3 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_3,
        in_c0_exit16937_4 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_4,
        in_c0_exit16937_5 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_5,
        in_c0_exit16937_6 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_6,
        in_c0_exit16937_7 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_7,
        in_c0_exit16937_8 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_8,
        in_c0_exit16937_9 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_9,
        in_c0_exit16937_10 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_10,
        in_c0_exit16937_11 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_11,
        in_c0_exit16937_12 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_12,
        in_c0_exit16937_13 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_13,
        in_c0_exit16937_14 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_14,
        in_c0_exit16937_15 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_15,
        in_c0_exit16937_16 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_16,
        in_c0_exit16937_17 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_17,
        in_c0_exit16937_18 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_18,
        in_c0_exit16937_19 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_19,
        in_c0_exit16937_20 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_20,
        in_c0_exit16937_21 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_21,
        in_c0_exit16937_22 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_22,
        in_c0_exit16937_23 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_23,
        in_c0_exit16937_24 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_24,
        in_c0_exit16937_25 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_25,
        in_c0_exit16937_26 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_26,
        in_c0_exit16937_27 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_27,
        in_c0_exit16937_28 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_28,
        in_c0_exit16937_29 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_29,
        in_c0_exit16937_30 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_30,
        in_c0_exit16937_31 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_31,
        in_c0_exit16937_32 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_32,
        in_c0_exit16937_33 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_33,
        in_c0_exit16937_34 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_34,
        in_c0_exit16937_35 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_35,
        in_c0_exit16937_36 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_36,
        in_c0_exit16937_37 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_37,
        in_c0_exit16937_38 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_38,
        in_c0_exit16937_39 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_39,
        in_c0_exit16937_40 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_40,
        in_c0_exit16937_41 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_41,
        in_c0_exit16937_42 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_42,
        in_c0_exit16937_43 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_43,
        in_c0_exit16937_44 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_44,
        in_c0_exit16937_45 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_45,
        in_c0_exit16937_46 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_46,
        in_c0_exit16937_47 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_47,
        in_c0_exit16937_48 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_48,
        in_c0_exit16937_49 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_49,
        in_c0_exit16937_50 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exit16937_50,
        in_acl_hw_wg_id38 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_acl_hw_wg_id38,
        in_c0_exe110 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exe110,
        in_c0_exe21323 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_c0_exe21323,
        in_dag_node_pm_236 => ethash_calculate_dag_item_B6_merge_aunroll_x_out_dag_node_pm_236,
        in_flush => in_flush,
        in_g_dag => in_g_dag,
        in_stall_in => ethash_calculate_dag_item_B6_branch_out_stall_out,
        in_unnamed_ethash_calculate_dag_item15_avm_readdata => in_unnamed_ethash_calculate_dag_item15_avm_readdata,
        in_unnamed_ethash_calculate_dag_item15_avm_readdatavalid => in_unnamed_ethash_calculate_dag_item15_avm_readdatavalid,
        in_unnamed_ethash_calculate_dag_item15_avm_waitrequest => in_unnamed_ethash_calculate_dag_item15_avm_waitrequest,
        in_unnamed_ethash_calculate_dag_item15_avm_writeack => in_unnamed_ethash_calculate_dag_item15_avm_writeack,
        in_valid_in => ethash_calculate_dag_item_B6_merge_aunroll_x_out_valid_out,
        out_acl_hw_wg_id38 => bb_ethash_calculate_dag_item_B6_stall_region_out_acl_hw_wg_id38,
        out_lsu_unnamed_ethash_calculate_dag_item15_o_active => bb_ethash_calculate_dag_item_B6_stall_region_out_lsu_unnamed_ethash_calculate_dag_item15_o_active,
        out_stall_out => bb_ethash_calculate_dag_item_B6_stall_region_out_stall_out,
        out_unnamed_ethash_calculate_dag_item15_avm_address => bb_ethash_calculate_dag_item_B6_stall_region_out_unnamed_ethash_calculate_dag_item15_avm_address,
        out_unnamed_ethash_calculate_dag_item15_avm_burstcount => bb_ethash_calculate_dag_item_B6_stall_region_out_unnamed_ethash_calculate_dag_item15_avm_burstcount,
        out_unnamed_ethash_calculate_dag_item15_avm_byteenable => bb_ethash_calculate_dag_item_B6_stall_region_out_unnamed_ethash_calculate_dag_item15_avm_byteenable,
        out_unnamed_ethash_calculate_dag_item15_avm_enable => bb_ethash_calculate_dag_item_B6_stall_region_out_unnamed_ethash_calculate_dag_item15_avm_enable,
        out_unnamed_ethash_calculate_dag_item15_avm_read => bb_ethash_calculate_dag_item_B6_stall_region_out_unnamed_ethash_calculate_dag_item15_avm_read,
        out_unnamed_ethash_calculate_dag_item15_avm_write => bb_ethash_calculate_dag_item_B6_stall_region_out_unnamed_ethash_calculate_dag_item15_avm_write,
        out_unnamed_ethash_calculate_dag_item15_avm_writedata => bb_ethash_calculate_dag_item_B6_stall_region_out_unnamed_ethash_calculate_dag_item15_avm_writedata,
        out_valid_out => bb_ethash_calculate_dag_item_B6_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- ethash_calculate_dag_item_B6_branch(BLACKBOX,67)
    theethash_calculate_dag_item_B6_branch : ethash_calculate_dag_item_B6_branch
    PORT MAP (
        in_acl_hw_wg_id38 => bb_ethash_calculate_dag_item_B6_stall_region_out_acl_hw_wg_id38,
        in_stall_in_0 => in_stall_in_0,
        in_valid_in => bb_ethash_calculate_dag_item_B6_stall_region_out_valid_out,
        out_acl_hw_wg_id38 => ethash_calculate_dag_item_B6_branch_out_acl_hw_wg_id38,
        out_stall_out => ethash_calculate_dag_item_B6_branch_out_stall_out,
        out_valid_out_0 => ethash_calculate_dag_item_B6_branch_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- out_acl_hw_wg_id38(GPOUT,68)
    out_acl_hw_wg_id38 <= ethash_calculate_dag_item_B6_branch_out_acl_hw_wg_id38;

    -- out_lsu_unnamed_ethash_calculate_dag_item15_o_active(GPOUT,69)
    out_lsu_unnamed_ethash_calculate_dag_item15_o_active <= bb_ethash_calculate_dag_item_B6_stall_region_out_lsu_unnamed_ethash_calculate_dag_item15_o_active;

    -- out_stall_out_0(GPOUT,70)
    out_stall_out_0 <= ethash_calculate_dag_item_B6_merge_aunroll_x_out_stall_out_0;

    -- out_unnamed_ethash_calculate_dag_item15_avm_address(GPOUT,71)
    out_unnamed_ethash_calculate_dag_item15_avm_address <= bb_ethash_calculate_dag_item_B6_stall_region_out_unnamed_ethash_calculate_dag_item15_avm_address;

    -- out_unnamed_ethash_calculate_dag_item15_avm_burstcount(GPOUT,72)
    out_unnamed_ethash_calculate_dag_item15_avm_burstcount <= bb_ethash_calculate_dag_item_B6_stall_region_out_unnamed_ethash_calculate_dag_item15_avm_burstcount;

    -- out_unnamed_ethash_calculate_dag_item15_avm_byteenable(GPOUT,73)
    out_unnamed_ethash_calculate_dag_item15_avm_byteenable <= bb_ethash_calculate_dag_item_B6_stall_region_out_unnamed_ethash_calculate_dag_item15_avm_byteenable;

    -- out_unnamed_ethash_calculate_dag_item15_avm_enable(GPOUT,74)
    out_unnamed_ethash_calculate_dag_item15_avm_enable <= bb_ethash_calculate_dag_item_B6_stall_region_out_unnamed_ethash_calculate_dag_item15_avm_enable;

    -- out_unnamed_ethash_calculate_dag_item15_avm_read(GPOUT,75)
    out_unnamed_ethash_calculate_dag_item15_avm_read <= bb_ethash_calculate_dag_item_B6_stall_region_out_unnamed_ethash_calculate_dag_item15_avm_read;

    -- out_unnamed_ethash_calculate_dag_item15_avm_write(GPOUT,76)
    out_unnamed_ethash_calculate_dag_item15_avm_write <= bb_ethash_calculate_dag_item_B6_stall_region_out_unnamed_ethash_calculate_dag_item15_avm_write;

    -- out_unnamed_ethash_calculate_dag_item15_avm_writedata(GPOUT,77)
    out_unnamed_ethash_calculate_dag_item15_avm_writedata <= bb_ethash_calculate_dag_item_B6_stall_region_out_unnamed_ethash_calculate_dag_item15_avm_writedata;

    -- out_valid_out_0(GPOUT,78)
    out_valid_out_0 <= ethash_calculate_dag_item_B6_branch_out_valid_out_0;

END normal;
