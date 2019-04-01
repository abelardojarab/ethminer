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

-- VHDL created from bb_ethash_calculate_dag_item_B2
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

entity bb_ethash_calculate_dag_item_B2 is
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
        in_g_dag : in std_logic_vector(63 downto 0);  -- ufix64
        in_g_light : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
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
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_ethash_calculate_dag_item_B2;

architecture normal of bb_ethash_calculate_dag_item_B2 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component ethash_calculate_dag_item_B2_merge is
        port (
            in_c0_exit1118_0_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit1118_0_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit1118_0_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit1118_0_3 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_c0_exit1118_0_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit1118_0_5 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_c0_exit1118_0_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_14 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_17 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_18 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_19 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_20 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_21 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_22 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_23 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_24 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_25 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_26 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_27 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_28 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_29 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_30 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_31 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_32 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_33 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_34 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_35 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_36 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_37 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_38 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_39 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_40 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_41 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_42 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_43 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_44 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_45 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_46 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_47 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_48 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_49 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_0_50 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_hw_wg_id42_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe11222_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe115_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe21327_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dag_node_pm_017_0 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit1118_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit1118_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit1118_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit1118_3 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_c0_exit1118_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit1118_5 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_c0_exit1118_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_19 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_20 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_21 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_22 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_23 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_25 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_26 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_27 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_28 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_29 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_30 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_31 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_32 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_33 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_34 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_35 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_36 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_37 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_38 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_39 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_40 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_41 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_42 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_43 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_44 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_45 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_46 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_47 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_48 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_49 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1118_50 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_hw_wg_id42 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe11222 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe115 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe21327 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_dag_node_pm_017 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_ethash_calculate_dag_item_B2_stall_region is
        port (
            in_c0_exit1118_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit1118_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit1118_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit1118_3 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_c0_exit1118_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit1118_5 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_c0_exit1118_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_14 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_17 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_18 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_19 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_20 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_21 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_22 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_23 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_24 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_25 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_26 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_27 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_28 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_29 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_30 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_31 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_32 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_33 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_34 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_35 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_36 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_37 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_38 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_39 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_40 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_41 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_42 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_43 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_44 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_45 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_46 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_47 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_48 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_49 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1118_50 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_hw_wg_id42 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe11222 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe115 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe21327 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dag_node_pm_017 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_hw_wg_id42 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe11222 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe115 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe21327 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_dag_node_pm_017 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_pre693_pml_t_bitcast_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre693_pml_t_bitcast_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre693_pml_t_bitcast_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre693_pml_t_bitcast_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre694_pml_t_bitcast_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre694_pml_t_bitcast_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre694_pml_t_bitcast_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre694_pml_t_bitcast_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre695_pml_t_bitcast_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre695_pml_t_bitcast_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre695_pml_t_bitcast_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre695_pml_t_bitcast_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre_pml_t_bitcast_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre_pml_t_bitcast_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre_pml_t_bitcast_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre_pml_t_bitcast_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component ethash_calculate_dag_item_B2_branch is
        port (
            in_acl_hw_wg_id42 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe11222 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe115 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe21327 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dag_node_pm_017 : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_pre693_pml_t_bitcast_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_pre693_pml_t_bitcast_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_pre693_pml_t_bitcast_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_pre693_pml_t_bitcast_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_pre694_pml_t_bitcast_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_pre694_pml_t_bitcast_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_pre694_pml_t_bitcast_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_pre694_pml_t_bitcast_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_pre695_pml_t_bitcast_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_pre695_pml_t_bitcast_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_pre695_pml_t_bitcast_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_pre695_pml_t_bitcast_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_pre_pml_t_bitcast_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_pre_pml_t_bitcast_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_pre_pml_t_bitcast_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_pre_pml_t_bitcast_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_hw_wg_id42 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe11222 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe115 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe21327 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_dag_node_pm_017 : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_pre693_pml_t_bitcast_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre693_pml_t_bitcast_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre693_pml_t_bitcast_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre693_pml_t_bitcast_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre694_pml_t_bitcast_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre694_pml_t_bitcast_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre694_pml_t_bitcast_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre694_pml_t_bitcast_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre695_pml_t_bitcast_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre695_pml_t_bitcast_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre695_pml_t_bitcast_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre695_pml_t_bitcast_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre_pml_t_bitcast_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre_pml_t_bitcast_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre_pml_t_bitcast_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_pre_pml_t_bitcast_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_3 : STD_LOGIC_VECTOR (1663 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_5 : STD_LOGIC_VECTOR (1663 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_19 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_20 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_21 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_22 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_23 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_24 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_25 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_26 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_27 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_28 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_29 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_30 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_31 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_32 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_33 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_34 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_35 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_36 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_37 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_38 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_39 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_40 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_41 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_42 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_43 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_44 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_45 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_46 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_47 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_48 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_49 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_50 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_acl_hw_wg_id42 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exe11222 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exe115 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exe21327 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_dag_node_pm_017 : STD_LOGIC_VECTOR (1663 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B2_merge_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B2_stall_region_out_acl_hw_wg_id42 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_stall_region_out_c0_exe11222 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B2_stall_region_out_c0_exe115 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_stall_region_out_c0_exe21327 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B2_stall_region_out_dag_node_pm_017 : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B2_stall_region_out_pre693_pml_t_bitcast_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_stall_region_out_pre693_pml_t_bitcast_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_stall_region_out_pre693_pml_t_bitcast_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_stall_region_out_pre693_pml_t_bitcast_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_stall_region_out_pre694_pml_t_bitcast_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_stall_region_out_pre694_pml_t_bitcast_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_stall_region_out_pre694_pml_t_bitcast_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_stall_region_out_pre694_pml_t_bitcast_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_stall_region_out_pre695_pml_t_bitcast_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_stall_region_out_pre695_pml_t_bitcast_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_stall_region_out_pre695_pml_t_bitcast_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_stall_region_out_pre695_pml_t_bitcast_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_stall_region_out_pre_pml_t_bitcast_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_stall_region_out_pre_pml_t_bitcast_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_stall_region_out_pre_pml_t_bitcast_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_stall_region_out_pre_pml_t_bitcast_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B2_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B2_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B2_branch_out_acl_hw_wg_id42 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_branch_out_c0_exe11222 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B2_branch_out_c0_exe115 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_branch_out_c0_exe21327 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B2_branch_out_dag_node_pm_017 : STD_LOGIC_VECTOR (1663 downto 0);
    signal ethash_calculate_dag_item_B2_branch_out_pre693_pml_t_bitcast_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_branch_out_pre693_pml_t_bitcast_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_branch_out_pre693_pml_t_bitcast_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_branch_out_pre693_pml_t_bitcast_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_branch_out_pre694_pml_t_bitcast_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_branch_out_pre694_pml_t_bitcast_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_branch_out_pre694_pml_t_bitcast_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_branch_out_pre694_pml_t_bitcast_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_branch_out_pre695_pml_t_bitcast_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_branch_out_pre695_pml_t_bitcast_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_branch_out_pre695_pml_t_bitcast_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_branch_out_pre695_pml_t_bitcast_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_branch_out_pre_pml_t_bitcast_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_branch_out_pre_pml_t_bitcast_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_branch_out_pre_pml_t_bitcast_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_branch_out_pre_pml_t_bitcast_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B2_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B2_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- ethash_calculate_dag_item_B2_merge_aunroll_x(BLACKBOX,2)
    theethash_calculate_dag_item_B2_merge_aunroll_x : ethash_calculate_dag_item_B2_merge
    PORT MAP (
        in_c0_exit1118_0_0 => in_c0_exit1118_0_0,
        in_c0_exit1118_0_1 => in_c0_exit1118_0_1,
        in_c0_exit1118_0_2 => in_c0_exit1118_0_2,
        in_c0_exit1118_0_3 => in_c0_exit1118_0_3,
        in_c0_exit1118_0_4 => in_c0_exit1118_0_4,
        in_c0_exit1118_0_5 => in_c0_exit1118_0_5,
        in_c0_exit1118_0_6 => in_c0_exit1118_0_6,
        in_c0_exit1118_0_7 => in_c0_exit1118_0_7,
        in_c0_exit1118_0_8 => in_c0_exit1118_0_8,
        in_c0_exit1118_0_9 => in_c0_exit1118_0_9,
        in_c0_exit1118_0_10 => in_c0_exit1118_0_10,
        in_c0_exit1118_0_11 => in_c0_exit1118_0_11,
        in_c0_exit1118_0_12 => in_c0_exit1118_0_12,
        in_c0_exit1118_0_13 => in_c0_exit1118_0_13,
        in_c0_exit1118_0_14 => in_c0_exit1118_0_14,
        in_c0_exit1118_0_15 => in_c0_exit1118_0_15,
        in_c0_exit1118_0_16 => in_c0_exit1118_0_16,
        in_c0_exit1118_0_17 => in_c0_exit1118_0_17,
        in_c0_exit1118_0_18 => in_c0_exit1118_0_18,
        in_c0_exit1118_0_19 => in_c0_exit1118_0_19,
        in_c0_exit1118_0_20 => in_c0_exit1118_0_20,
        in_c0_exit1118_0_21 => in_c0_exit1118_0_21,
        in_c0_exit1118_0_22 => in_c0_exit1118_0_22,
        in_c0_exit1118_0_23 => in_c0_exit1118_0_23,
        in_c0_exit1118_0_24 => in_c0_exit1118_0_24,
        in_c0_exit1118_0_25 => in_c0_exit1118_0_25,
        in_c0_exit1118_0_26 => in_c0_exit1118_0_26,
        in_c0_exit1118_0_27 => in_c0_exit1118_0_27,
        in_c0_exit1118_0_28 => in_c0_exit1118_0_28,
        in_c0_exit1118_0_29 => in_c0_exit1118_0_29,
        in_c0_exit1118_0_30 => in_c0_exit1118_0_30,
        in_c0_exit1118_0_31 => in_c0_exit1118_0_31,
        in_c0_exit1118_0_32 => in_c0_exit1118_0_32,
        in_c0_exit1118_0_33 => in_c0_exit1118_0_33,
        in_c0_exit1118_0_34 => in_c0_exit1118_0_34,
        in_c0_exit1118_0_35 => in_c0_exit1118_0_35,
        in_c0_exit1118_0_36 => in_c0_exit1118_0_36,
        in_c0_exit1118_0_37 => in_c0_exit1118_0_37,
        in_c0_exit1118_0_38 => in_c0_exit1118_0_38,
        in_c0_exit1118_0_39 => in_c0_exit1118_0_39,
        in_c0_exit1118_0_40 => in_c0_exit1118_0_40,
        in_c0_exit1118_0_41 => in_c0_exit1118_0_41,
        in_c0_exit1118_0_42 => in_c0_exit1118_0_42,
        in_c0_exit1118_0_43 => in_c0_exit1118_0_43,
        in_c0_exit1118_0_44 => in_c0_exit1118_0_44,
        in_c0_exit1118_0_45 => in_c0_exit1118_0_45,
        in_c0_exit1118_0_46 => in_c0_exit1118_0_46,
        in_c0_exit1118_0_47 => in_c0_exit1118_0_47,
        in_c0_exit1118_0_48 => in_c0_exit1118_0_48,
        in_c0_exit1118_0_49 => in_c0_exit1118_0_49,
        in_c0_exit1118_0_50 => in_c0_exit1118_0_50,
        in_acl_hw_wg_id42_0 => in_acl_hw_wg_id42_0,
        in_c0_exe11222_0 => in_c0_exe11222_0,
        in_c0_exe115_0 => in_c0_exe115_0,
        in_c0_exe21327_0 => in_c0_exe21327_0,
        in_dag_node_pm_017_0 => in_dag_node_pm_017_0,
        in_stall_in => bb_ethash_calculate_dag_item_B2_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        out_c0_exit1118_0 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_0,
        out_c0_exit1118_1 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_1,
        out_c0_exit1118_2 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_2,
        out_c0_exit1118_3 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_3,
        out_c0_exit1118_4 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_4,
        out_c0_exit1118_5 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_5,
        out_c0_exit1118_6 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_6,
        out_c0_exit1118_7 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_7,
        out_c0_exit1118_8 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_8,
        out_c0_exit1118_9 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_9,
        out_c0_exit1118_10 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_10,
        out_c0_exit1118_11 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_11,
        out_c0_exit1118_12 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_12,
        out_c0_exit1118_13 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_13,
        out_c0_exit1118_14 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_14,
        out_c0_exit1118_15 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_15,
        out_c0_exit1118_16 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_16,
        out_c0_exit1118_17 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_17,
        out_c0_exit1118_18 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_18,
        out_c0_exit1118_19 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_19,
        out_c0_exit1118_20 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_20,
        out_c0_exit1118_21 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_21,
        out_c0_exit1118_22 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_22,
        out_c0_exit1118_23 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_23,
        out_c0_exit1118_24 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_24,
        out_c0_exit1118_25 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_25,
        out_c0_exit1118_26 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_26,
        out_c0_exit1118_27 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_27,
        out_c0_exit1118_28 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_28,
        out_c0_exit1118_29 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_29,
        out_c0_exit1118_30 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_30,
        out_c0_exit1118_31 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_31,
        out_c0_exit1118_32 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_32,
        out_c0_exit1118_33 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_33,
        out_c0_exit1118_34 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_34,
        out_c0_exit1118_35 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_35,
        out_c0_exit1118_36 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_36,
        out_c0_exit1118_37 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_37,
        out_c0_exit1118_38 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_38,
        out_c0_exit1118_39 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_39,
        out_c0_exit1118_40 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_40,
        out_c0_exit1118_41 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_41,
        out_c0_exit1118_42 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_42,
        out_c0_exit1118_43 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_43,
        out_c0_exit1118_44 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_44,
        out_c0_exit1118_45 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_45,
        out_c0_exit1118_46 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_46,
        out_c0_exit1118_47 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_47,
        out_c0_exit1118_48 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_48,
        out_c0_exit1118_49 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_49,
        out_c0_exit1118_50 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_50,
        out_acl_hw_wg_id42 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_acl_hw_wg_id42,
        out_c0_exe11222 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exe11222,
        out_c0_exe115 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exe115,
        out_c0_exe21327 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exe21327,
        out_dag_node_pm_017 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_dag_node_pm_017,
        out_stall_out_0 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_stall_out_0,
        out_valid_out => ethash_calculate_dag_item_B2_merge_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_calculate_dag_item_B2_stall_region(BLACKBOX,63)
    thebb_ethash_calculate_dag_item_B2_stall_region : bb_ethash_calculate_dag_item_B2_stall_region
    PORT MAP (
        in_c0_exit1118_0 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_0,
        in_c0_exit1118_1 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_1,
        in_c0_exit1118_2 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_2,
        in_c0_exit1118_3 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_3,
        in_c0_exit1118_4 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_4,
        in_c0_exit1118_5 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_5,
        in_c0_exit1118_6 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_6,
        in_c0_exit1118_7 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_7,
        in_c0_exit1118_8 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_8,
        in_c0_exit1118_9 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_9,
        in_c0_exit1118_10 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_10,
        in_c0_exit1118_11 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_11,
        in_c0_exit1118_12 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_12,
        in_c0_exit1118_13 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_13,
        in_c0_exit1118_14 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_14,
        in_c0_exit1118_15 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_15,
        in_c0_exit1118_16 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_16,
        in_c0_exit1118_17 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_17,
        in_c0_exit1118_18 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_18,
        in_c0_exit1118_19 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_19,
        in_c0_exit1118_20 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_20,
        in_c0_exit1118_21 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_21,
        in_c0_exit1118_22 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_22,
        in_c0_exit1118_23 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_23,
        in_c0_exit1118_24 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_24,
        in_c0_exit1118_25 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_25,
        in_c0_exit1118_26 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_26,
        in_c0_exit1118_27 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_27,
        in_c0_exit1118_28 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_28,
        in_c0_exit1118_29 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_29,
        in_c0_exit1118_30 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_30,
        in_c0_exit1118_31 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_31,
        in_c0_exit1118_32 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_32,
        in_c0_exit1118_33 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_33,
        in_c0_exit1118_34 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_34,
        in_c0_exit1118_35 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_35,
        in_c0_exit1118_36 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_36,
        in_c0_exit1118_37 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_37,
        in_c0_exit1118_38 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_38,
        in_c0_exit1118_39 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_39,
        in_c0_exit1118_40 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_40,
        in_c0_exit1118_41 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_41,
        in_c0_exit1118_42 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_42,
        in_c0_exit1118_43 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_43,
        in_c0_exit1118_44 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_44,
        in_c0_exit1118_45 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_45,
        in_c0_exit1118_46 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_46,
        in_c0_exit1118_47 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_47,
        in_c0_exit1118_48 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_48,
        in_c0_exit1118_49 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_49,
        in_c0_exit1118_50 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exit1118_50,
        in_acl_hw_wg_id42 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_acl_hw_wg_id42,
        in_c0_exe11222 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exe11222,
        in_c0_exe115 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exe115,
        in_c0_exe21327 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_c0_exe21327,
        in_dag_node_pm_017 => ethash_calculate_dag_item_B2_merge_aunroll_x_out_dag_node_pm_017,
        in_stall_in => ethash_calculate_dag_item_B2_branch_out_stall_out,
        in_valid_in => ethash_calculate_dag_item_B2_merge_aunroll_x_out_valid_out,
        out_acl_hw_wg_id42 => bb_ethash_calculate_dag_item_B2_stall_region_out_acl_hw_wg_id42,
        out_c0_exe11222 => bb_ethash_calculate_dag_item_B2_stall_region_out_c0_exe11222,
        out_c0_exe115 => bb_ethash_calculate_dag_item_B2_stall_region_out_c0_exe115,
        out_c0_exe21327 => bb_ethash_calculate_dag_item_B2_stall_region_out_c0_exe21327,
        out_dag_node_pm_017 => bb_ethash_calculate_dag_item_B2_stall_region_out_dag_node_pm_017,
        out_pre693_pml_t_bitcast_0 => bb_ethash_calculate_dag_item_B2_stall_region_out_pre693_pml_t_bitcast_0,
        out_pre693_pml_t_bitcast_1 => bb_ethash_calculate_dag_item_B2_stall_region_out_pre693_pml_t_bitcast_1,
        out_pre693_pml_t_bitcast_2 => bb_ethash_calculate_dag_item_B2_stall_region_out_pre693_pml_t_bitcast_2,
        out_pre693_pml_t_bitcast_3 => bb_ethash_calculate_dag_item_B2_stall_region_out_pre693_pml_t_bitcast_3,
        out_pre694_pml_t_bitcast_0 => bb_ethash_calculate_dag_item_B2_stall_region_out_pre694_pml_t_bitcast_0,
        out_pre694_pml_t_bitcast_1 => bb_ethash_calculate_dag_item_B2_stall_region_out_pre694_pml_t_bitcast_1,
        out_pre694_pml_t_bitcast_2 => bb_ethash_calculate_dag_item_B2_stall_region_out_pre694_pml_t_bitcast_2,
        out_pre694_pml_t_bitcast_3 => bb_ethash_calculate_dag_item_B2_stall_region_out_pre694_pml_t_bitcast_3,
        out_pre695_pml_t_bitcast_0 => bb_ethash_calculate_dag_item_B2_stall_region_out_pre695_pml_t_bitcast_0,
        out_pre695_pml_t_bitcast_1 => bb_ethash_calculate_dag_item_B2_stall_region_out_pre695_pml_t_bitcast_1,
        out_pre695_pml_t_bitcast_2 => bb_ethash_calculate_dag_item_B2_stall_region_out_pre695_pml_t_bitcast_2,
        out_pre695_pml_t_bitcast_3 => bb_ethash_calculate_dag_item_B2_stall_region_out_pre695_pml_t_bitcast_3,
        out_pre_pml_t_bitcast_0 => bb_ethash_calculate_dag_item_B2_stall_region_out_pre_pml_t_bitcast_0,
        out_pre_pml_t_bitcast_1 => bb_ethash_calculate_dag_item_B2_stall_region_out_pre_pml_t_bitcast_1,
        out_pre_pml_t_bitcast_2 => bb_ethash_calculate_dag_item_B2_stall_region_out_pre_pml_t_bitcast_2,
        out_pre_pml_t_bitcast_3 => bb_ethash_calculate_dag_item_B2_stall_region_out_pre_pml_t_bitcast_3,
        out_stall_out => bb_ethash_calculate_dag_item_B2_stall_region_out_stall_out,
        out_valid_out => bb_ethash_calculate_dag_item_B2_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- ethash_calculate_dag_item_B2_branch(BLACKBOX,64)
    theethash_calculate_dag_item_B2_branch : ethash_calculate_dag_item_B2_branch
    PORT MAP (
        in_acl_hw_wg_id42 => bb_ethash_calculate_dag_item_B2_stall_region_out_acl_hw_wg_id42,
        in_c0_exe11222 => bb_ethash_calculate_dag_item_B2_stall_region_out_c0_exe11222,
        in_c0_exe115 => bb_ethash_calculate_dag_item_B2_stall_region_out_c0_exe115,
        in_c0_exe21327 => bb_ethash_calculate_dag_item_B2_stall_region_out_c0_exe21327,
        in_dag_node_pm_017 => bb_ethash_calculate_dag_item_B2_stall_region_out_dag_node_pm_017,
        in_pre693_pml_t_bitcast_0 => bb_ethash_calculate_dag_item_B2_stall_region_out_pre693_pml_t_bitcast_0,
        in_pre693_pml_t_bitcast_1 => bb_ethash_calculate_dag_item_B2_stall_region_out_pre693_pml_t_bitcast_1,
        in_pre693_pml_t_bitcast_2 => bb_ethash_calculate_dag_item_B2_stall_region_out_pre693_pml_t_bitcast_2,
        in_pre693_pml_t_bitcast_3 => bb_ethash_calculate_dag_item_B2_stall_region_out_pre693_pml_t_bitcast_3,
        in_pre694_pml_t_bitcast_0 => bb_ethash_calculate_dag_item_B2_stall_region_out_pre694_pml_t_bitcast_0,
        in_pre694_pml_t_bitcast_1 => bb_ethash_calculate_dag_item_B2_stall_region_out_pre694_pml_t_bitcast_1,
        in_pre694_pml_t_bitcast_2 => bb_ethash_calculate_dag_item_B2_stall_region_out_pre694_pml_t_bitcast_2,
        in_pre694_pml_t_bitcast_3 => bb_ethash_calculate_dag_item_B2_stall_region_out_pre694_pml_t_bitcast_3,
        in_pre695_pml_t_bitcast_0 => bb_ethash_calculate_dag_item_B2_stall_region_out_pre695_pml_t_bitcast_0,
        in_pre695_pml_t_bitcast_1 => bb_ethash_calculate_dag_item_B2_stall_region_out_pre695_pml_t_bitcast_1,
        in_pre695_pml_t_bitcast_2 => bb_ethash_calculate_dag_item_B2_stall_region_out_pre695_pml_t_bitcast_2,
        in_pre695_pml_t_bitcast_3 => bb_ethash_calculate_dag_item_B2_stall_region_out_pre695_pml_t_bitcast_3,
        in_pre_pml_t_bitcast_0 => bb_ethash_calculate_dag_item_B2_stall_region_out_pre_pml_t_bitcast_0,
        in_pre_pml_t_bitcast_1 => bb_ethash_calculate_dag_item_B2_stall_region_out_pre_pml_t_bitcast_1,
        in_pre_pml_t_bitcast_2 => bb_ethash_calculate_dag_item_B2_stall_region_out_pre_pml_t_bitcast_2,
        in_pre_pml_t_bitcast_3 => bb_ethash_calculate_dag_item_B2_stall_region_out_pre_pml_t_bitcast_3,
        in_stall_in_0 => in_stall_in_0,
        in_valid_in => bb_ethash_calculate_dag_item_B2_stall_region_out_valid_out,
        out_acl_hw_wg_id42 => ethash_calculate_dag_item_B2_branch_out_acl_hw_wg_id42,
        out_c0_exe11222 => ethash_calculate_dag_item_B2_branch_out_c0_exe11222,
        out_c0_exe115 => ethash_calculate_dag_item_B2_branch_out_c0_exe115,
        out_c0_exe21327 => ethash_calculate_dag_item_B2_branch_out_c0_exe21327,
        out_dag_node_pm_017 => ethash_calculate_dag_item_B2_branch_out_dag_node_pm_017,
        out_pre693_pml_t_bitcast_0 => ethash_calculate_dag_item_B2_branch_out_pre693_pml_t_bitcast_0,
        out_pre693_pml_t_bitcast_1 => ethash_calculate_dag_item_B2_branch_out_pre693_pml_t_bitcast_1,
        out_pre693_pml_t_bitcast_2 => ethash_calculate_dag_item_B2_branch_out_pre693_pml_t_bitcast_2,
        out_pre693_pml_t_bitcast_3 => ethash_calculate_dag_item_B2_branch_out_pre693_pml_t_bitcast_3,
        out_pre694_pml_t_bitcast_0 => ethash_calculate_dag_item_B2_branch_out_pre694_pml_t_bitcast_0,
        out_pre694_pml_t_bitcast_1 => ethash_calculate_dag_item_B2_branch_out_pre694_pml_t_bitcast_1,
        out_pre694_pml_t_bitcast_2 => ethash_calculate_dag_item_B2_branch_out_pre694_pml_t_bitcast_2,
        out_pre694_pml_t_bitcast_3 => ethash_calculate_dag_item_B2_branch_out_pre694_pml_t_bitcast_3,
        out_pre695_pml_t_bitcast_0 => ethash_calculate_dag_item_B2_branch_out_pre695_pml_t_bitcast_0,
        out_pre695_pml_t_bitcast_1 => ethash_calculate_dag_item_B2_branch_out_pre695_pml_t_bitcast_1,
        out_pre695_pml_t_bitcast_2 => ethash_calculate_dag_item_B2_branch_out_pre695_pml_t_bitcast_2,
        out_pre695_pml_t_bitcast_3 => ethash_calculate_dag_item_B2_branch_out_pre695_pml_t_bitcast_3,
        out_pre_pml_t_bitcast_0 => ethash_calculate_dag_item_B2_branch_out_pre_pml_t_bitcast_0,
        out_pre_pml_t_bitcast_1 => ethash_calculate_dag_item_B2_branch_out_pre_pml_t_bitcast_1,
        out_pre_pml_t_bitcast_2 => ethash_calculate_dag_item_B2_branch_out_pre_pml_t_bitcast_2,
        out_pre_pml_t_bitcast_3 => ethash_calculate_dag_item_B2_branch_out_pre_pml_t_bitcast_3,
        out_stall_out => ethash_calculate_dag_item_B2_branch_out_stall_out,
        out_valid_out_0 => ethash_calculate_dag_item_B2_branch_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- out_acl_hw_wg_id42(GPOUT,65)
    out_acl_hw_wg_id42 <= ethash_calculate_dag_item_B2_branch_out_acl_hw_wg_id42;

    -- out_c0_exe11222(GPOUT,66)
    out_c0_exe11222 <= ethash_calculate_dag_item_B2_branch_out_c0_exe11222;

    -- out_c0_exe115(GPOUT,67)
    out_c0_exe115 <= ethash_calculate_dag_item_B2_branch_out_c0_exe115;

    -- out_c0_exe21327(GPOUT,68)
    out_c0_exe21327 <= ethash_calculate_dag_item_B2_branch_out_c0_exe21327;

    -- out_dag_node_pm_017(GPOUT,69)
    out_dag_node_pm_017 <= ethash_calculate_dag_item_B2_branch_out_dag_node_pm_017;

    -- out_pre693_pml_t_bitcast_0(GPOUT,70)
    out_pre693_pml_t_bitcast_0 <= ethash_calculate_dag_item_B2_branch_out_pre693_pml_t_bitcast_0;

    -- out_pre693_pml_t_bitcast_1(GPOUT,71)
    out_pre693_pml_t_bitcast_1 <= ethash_calculate_dag_item_B2_branch_out_pre693_pml_t_bitcast_1;

    -- out_pre693_pml_t_bitcast_2(GPOUT,72)
    out_pre693_pml_t_bitcast_2 <= ethash_calculate_dag_item_B2_branch_out_pre693_pml_t_bitcast_2;

    -- out_pre693_pml_t_bitcast_3(GPOUT,73)
    out_pre693_pml_t_bitcast_3 <= ethash_calculate_dag_item_B2_branch_out_pre693_pml_t_bitcast_3;

    -- out_pre694_pml_t_bitcast_0(GPOUT,74)
    out_pre694_pml_t_bitcast_0 <= ethash_calculate_dag_item_B2_branch_out_pre694_pml_t_bitcast_0;

    -- out_pre694_pml_t_bitcast_1(GPOUT,75)
    out_pre694_pml_t_bitcast_1 <= ethash_calculate_dag_item_B2_branch_out_pre694_pml_t_bitcast_1;

    -- out_pre694_pml_t_bitcast_2(GPOUT,76)
    out_pre694_pml_t_bitcast_2 <= ethash_calculate_dag_item_B2_branch_out_pre694_pml_t_bitcast_2;

    -- out_pre694_pml_t_bitcast_3(GPOUT,77)
    out_pre694_pml_t_bitcast_3 <= ethash_calculate_dag_item_B2_branch_out_pre694_pml_t_bitcast_3;

    -- out_pre695_pml_t_bitcast_0(GPOUT,78)
    out_pre695_pml_t_bitcast_0 <= ethash_calculate_dag_item_B2_branch_out_pre695_pml_t_bitcast_0;

    -- out_pre695_pml_t_bitcast_1(GPOUT,79)
    out_pre695_pml_t_bitcast_1 <= ethash_calculate_dag_item_B2_branch_out_pre695_pml_t_bitcast_1;

    -- out_pre695_pml_t_bitcast_2(GPOUT,80)
    out_pre695_pml_t_bitcast_2 <= ethash_calculate_dag_item_B2_branch_out_pre695_pml_t_bitcast_2;

    -- out_pre695_pml_t_bitcast_3(GPOUT,81)
    out_pre695_pml_t_bitcast_3 <= ethash_calculate_dag_item_B2_branch_out_pre695_pml_t_bitcast_3;

    -- out_pre_pml_t_bitcast_0(GPOUT,82)
    out_pre_pml_t_bitcast_0 <= ethash_calculate_dag_item_B2_branch_out_pre_pml_t_bitcast_0;

    -- out_pre_pml_t_bitcast_1(GPOUT,83)
    out_pre_pml_t_bitcast_1 <= ethash_calculate_dag_item_B2_branch_out_pre_pml_t_bitcast_1;

    -- out_pre_pml_t_bitcast_2(GPOUT,84)
    out_pre_pml_t_bitcast_2 <= ethash_calculate_dag_item_B2_branch_out_pre_pml_t_bitcast_2;

    -- out_pre_pml_t_bitcast_3(GPOUT,85)
    out_pre_pml_t_bitcast_3 <= ethash_calculate_dag_item_B2_branch_out_pre_pml_t_bitcast_3;

    -- out_stall_out_0(GPOUT,86)
    out_stall_out_0 <= ethash_calculate_dag_item_B2_merge_aunroll_x_out_stall_out_0;

    -- out_valid_out_0(GPOUT,87)
    out_valid_out_0 <= ethash_calculate_dag_item_B2_branch_out_valid_out_0;

END normal;
