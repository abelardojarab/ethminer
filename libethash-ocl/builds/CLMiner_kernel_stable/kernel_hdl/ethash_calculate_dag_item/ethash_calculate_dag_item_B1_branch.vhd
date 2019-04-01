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

-- VHDL created from ethash_calculate_dag_item_B1_branch
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

entity ethash_calculate_dag_item_B1_branch is
    port (
        in_c0_exit11_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit11_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit11_2 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit11_3 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_c0_exit11_4 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit11_5 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_c0_exit11_6 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_7 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_8 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_9 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_10 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_11 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_12 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_13 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_14 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_15 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_16 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_17 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_18 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_19 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_20 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_21 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_22 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_23 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_24 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_25 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_26 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_27 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_28 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_29 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_30 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_31 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_32 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_33 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_34 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_35 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_36 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_37 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_38 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_39 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_40 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_41 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_42 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_43 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_44 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_45 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_46 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_47 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_48 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_49 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit11_50 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_hw_wg_id43 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe10 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe11 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe112 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe116 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe12 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe13 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe14 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe15 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe16 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe17 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe18 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe19 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe20 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe21 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe213 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe22 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe23 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe24 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe25 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe26 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe27 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe28 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe29 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe30 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe31 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe32 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe33 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe34 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe35 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe36 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe37 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe38 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe39 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe4 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe40 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe41 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe42 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe43 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe44 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe45 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe46 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe47 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe48 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe49 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe5 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_c0_exe50 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe6 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe7 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe8 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe9 : in std_logic_vector(31 downto 0);  -- ufix32
        in_dag_node_pm_0 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit11_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit11_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit11_2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit11_3 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_c0_exit11_4 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit11_5 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_c0_exit11_6 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_7 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_8 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_9 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_10 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_11 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_12 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_13 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_14 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_15 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_16 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_17 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_18 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_19 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_20 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_21 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_22 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_23 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_24 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_25 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_26 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_27 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_28 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_29 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_30 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_31 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_32 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_33 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_34 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_35 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_36 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_37 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_38 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_39 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_40 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_41 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_42 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_43 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_44 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_45 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_46 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_47 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_48 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_49 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit11_50 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_hw_wg_id43 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe10 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe11 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe112 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe116 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe12 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe13 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe14 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe15 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe16 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe17 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe18 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe19 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe20 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe21 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe213 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe22 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe23 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe24 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe25 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe26 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe27 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe28 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe29 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe30 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe31 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe32 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe33 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe34 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe35 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe36 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe37 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe38 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe39 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe40 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe41 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe42 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe43 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe44 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe45 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe46 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe47 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe48 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe49 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe5 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_c0_exe50 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe6 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe7 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe8 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe9 : out std_logic_vector(31 downto 0);  -- ufix32
        out_dag_node_pm_0 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end ethash_calculate_dag_item_B1_branch;

architecture normal of ethash_calculate_dag_item_B1_branch is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit11_reg_0_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit11_reg_1_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit11_reg_2_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit11_reg_3_x_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal c0_exit11_reg_4_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit11_reg_5_x_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal c0_exit11_reg_6_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_7_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_8_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_9_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_10_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_11_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_12_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_13_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_14_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_15_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_16_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_17_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_18_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_19_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_20_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_21_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_22_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_23_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_24_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_25_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_26_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_27_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_28_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_29_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_30_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_31_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_32_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_33_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_34_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_35_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_36_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_37_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_38_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_39_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_40_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_41_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_42_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_43_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_44_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_45_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_46_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_47_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_48_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_49_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit11_reg_50_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal acl_hw_wg_id43_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe10_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe112_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe116_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe11_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe12_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe13_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe14_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe15_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe16_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe17_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe18_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe19_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe20_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe213_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe21_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe22_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe23_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe24_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe25_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe26_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe27_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe28_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe29_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe30_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe31_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe32_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe33_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe34_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe35_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe36_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe37_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe38_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe39_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe40_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe41_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe42_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe43_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe44_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe45_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe46_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe47_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe48_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe49_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe4_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe50_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe5_reg_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal c0_exe6_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe7_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe8_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe9_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal dag_node_pm_0_reg_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal ethash_calculate_dag_item_B1_branch_enable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B1_branch_enable_not_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_in_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_in_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_0_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_1_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_0_and_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_1_and_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- not_stall_in_1(LOGICAL,319)
    not_stall_in_1_q <= not (in_stall_in_1);

    -- c0_exe4_cmp(LOGICAL,308)
    c0_exe4_cmp_q <= not (in_c0_exe4);

    -- valid_out_1_and(LOGICAL,327)
    valid_out_1_and_q <= in_valid_in and c0_exe4_cmp_q;

    -- valid_1_reg(REG,325)
    valid_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_1_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                valid_1_reg_q <= valid_out_1_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_1(LOGICAL,321)
    not_valid_1_q <= not (valid_1_reg_q);

    -- not_valid_or_not_stall_1(LOGICAL,323)
    not_valid_or_not_stall_1_q <= not_valid_1_q or not_stall_in_1_q;

    -- not_stall_in_0(LOGICAL,318)
    not_stall_in_0_q <= not (in_stall_in_0);

    -- valid_out_0_and(LOGICAL,326)
    valid_out_0_and_q <= in_valid_in and in_c0_exe4;

    -- valid_0_reg(REG,324)
    valid_0_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_0_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                valid_0_reg_q <= valid_out_0_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_0(LOGICAL,320)
    not_valid_0_q <= not (valid_0_reg_q);

    -- not_valid_or_not_stall_0(LOGICAL,322)
    not_valid_or_not_stall_0_q <= not_valid_0_q or not_stall_in_0_q;

    -- ethash_calculate_dag_item_B1_branch_enable(LOGICAL,316)
    ethash_calculate_dag_item_B1_branch_enable_q <= not_valid_or_not_stall_0_q and not_valid_or_not_stall_1_q;

    -- c0_exit11_reg_0_x(REG,2)
    c0_exit11_reg_0_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_0_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_0_x_q <= in_c0_exit11_0;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_0(GPOUT,159)
    out_c0_exit11_0 <= c0_exit11_reg_0_x_q;

    -- c0_exit11_reg_1_x(REG,3)
    c0_exit11_reg_1_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_1_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_1_x_q <= in_c0_exit11_1;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_1(GPOUT,160)
    out_c0_exit11_1 <= c0_exit11_reg_1_x_q;

    -- c0_exit11_reg_2_x(REG,4)
    c0_exit11_reg_2_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_2_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_2_x_q <= in_c0_exit11_2;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_2(GPOUT,161)
    out_c0_exit11_2 <= c0_exit11_reg_2_x_q;

    -- c0_exit11_reg_3_x(REG,5)
    c0_exit11_reg_3_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_3_x_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_3_x_q <= in_c0_exit11_3;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_3(GPOUT,162)
    out_c0_exit11_3 <= c0_exit11_reg_3_x_q;

    -- c0_exit11_reg_4_x(REG,6)
    c0_exit11_reg_4_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_4_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_4_x_q <= in_c0_exit11_4;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_4(GPOUT,163)
    out_c0_exit11_4 <= c0_exit11_reg_4_x_q;

    -- c0_exit11_reg_5_x(REG,7)
    c0_exit11_reg_5_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_5_x_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_5_x_q <= in_c0_exit11_5;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_5(GPOUT,164)
    out_c0_exit11_5 <= c0_exit11_reg_5_x_q;

    -- c0_exit11_reg_6_x(REG,8)
    c0_exit11_reg_6_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_6_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_6_x_q <= in_c0_exit11_6;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_6(GPOUT,165)
    out_c0_exit11_6 <= c0_exit11_reg_6_x_q;

    -- c0_exit11_reg_7_x(REG,9)
    c0_exit11_reg_7_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_7_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_7_x_q <= in_c0_exit11_7;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_7(GPOUT,166)
    out_c0_exit11_7 <= c0_exit11_reg_7_x_q;

    -- c0_exit11_reg_8_x(REG,10)
    c0_exit11_reg_8_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_8_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_8_x_q <= in_c0_exit11_8;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_8(GPOUT,167)
    out_c0_exit11_8 <= c0_exit11_reg_8_x_q;

    -- c0_exit11_reg_9_x(REG,11)
    c0_exit11_reg_9_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_9_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_9_x_q <= in_c0_exit11_9;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_9(GPOUT,168)
    out_c0_exit11_9 <= c0_exit11_reg_9_x_q;

    -- c0_exit11_reg_10_x(REG,12)
    c0_exit11_reg_10_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_10_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_10_x_q <= in_c0_exit11_10;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_10(GPOUT,169)
    out_c0_exit11_10 <= c0_exit11_reg_10_x_q;

    -- c0_exit11_reg_11_x(REG,13)
    c0_exit11_reg_11_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_11_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_11_x_q <= in_c0_exit11_11;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_11(GPOUT,170)
    out_c0_exit11_11 <= c0_exit11_reg_11_x_q;

    -- c0_exit11_reg_12_x(REG,14)
    c0_exit11_reg_12_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_12_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_12_x_q <= in_c0_exit11_12;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_12(GPOUT,171)
    out_c0_exit11_12 <= c0_exit11_reg_12_x_q;

    -- c0_exit11_reg_13_x(REG,15)
    c0_exit11_reg_13_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_13_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_13_x_q <= in_c0_exit11_13;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_13(GPOUT,172)
    out_c0_exit11_13 <= c0_exit11_reg_13_x_q;

    -- c0_exit11_reg_14_x(REG,16)
    c0_exit11_reg_14_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_14_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_14_x_q <= in_c0_exit11_14;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_14(GPOUT,173)
    out_c0_exit11_14 <= c0_exit11_reg_14_x_q;

    -- c0_exit11_reg_15_x(REG,17)
    c0_exit11_reg_15_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_15_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_15_x_q <= in_c0_exit11_15;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_15(GPOUT,174)
    out_c0_exit11_15 <= c0_exit11_reg_15_x_q;

    -- c0_exit11_reg_16_x(REG,18)
    c0_exit11_reg_16_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_16_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_16_x_q <= in_c0_exit11_16;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_16(GPOUT,175)
    out_c0_exit11_16 <= c0_exit11_reg_16_x_q;

    -- c0_exit11_reg_17_x(REG,19)
    c0_exit11_reg_17_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_17_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_17_x_q <= in_c0_exit11_17;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_17(GPOUT,176)
    out_c0_exit11_17 <= c0_exit11_reg_17_x_q;

    -- c0_exit11_reg_18_x(REG,20)
    c0_exit11_reg_18_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_18_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_18_x_q <= in_c0_exit11_18;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_18(GPOUT,177)
    out_c0_exit11_18 <= c0_exit11_reg_18_x_q;

    -- c0_exit11_reg_19_x(REG,21)
    c0_exit11_reg_19_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_19_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_19_x_q <= in_c0_exit11_19;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_19(GPOUT,178)
    out_c0_exit11_19 <= c0_exit11_reg_19_x_q;

    -- c0_exit11_reg_20_x(REG,22)
    c0_exit11_reg_20_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_20_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_20_x_q <= in_c0_exit11_20;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_20(GPOUT,179)
    out_c0_exit11_20 <= c0_exit11_reg_20_x_q;

    -- c0_exit11_reg_21_x(REG,23)
    c0_exit11_reg_21_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_21_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_21_x_q <= in_c0_exit11_21;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_21(GPOUT,180)
    out_c0_exit11_21 <= c0_exit11_reg_21_x_q;

    -- c0_exit11_reg_22_x(REG,24)
    c0_exit11_reg_22_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_22_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_22_x_q <= in_c0_exit11_22;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_22(GPOUT,181)
    out_c0_exit11_22 <= c0_exit11_reg_22_x_q;

    -- c0_exit11_reg_23_x(REG,25)
    c0_exit11_reg_23_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_23_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_23_x_q <= in_c0_exit11_23;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_23(GPOUT,182)
    out_c0_exit11_23 <= c0_exit11_reg_23_x_q;

    -- c0_exit11_reg_24_x(REG,26)
    c0_exit11_reg_24_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_24_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_24_x_q <= in_c0_exit11_24;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_24(GPOUT,183)
    out_c0_exit11_24 <= c0_exit11_reg_24_x_q;

    -- c0_exit11_reg_25_x(REG,27)
    c0_exit11_reg_25_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_25_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_25_x_q <= in_c0_exit11_25;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_25(GPOUT,184)
    out_c0_exit11_25 <= c0_exit11_reg_25_x_q;

    -- c0_exit11_reg_26_x(REG,28)
    c0_exit11_reg_26_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_26_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_26_x_q <= in_c0_exit11_26;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_26(GPOUT,185)
    out_c0_exit11_26 <= c0_exit11_reg_26_x_q;

    -- c0_exit11_reg_27_x(REG,29)
    c0_exit11_reg_27_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_27_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_27_x_q <= in_c0_exit11_27;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_27(GPOUT,186)
    out_c0_exit11_27 <= c0_exit11_reg_27_x_q;

    -- c0_exit11_reg_28_x(REG,30)
    c0_exit11_reg_28_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_28_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_28_x_q <= in_c0_exit11_28;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_28(GPOUT,187)
    out_c0_exit11_28 <= c0_exit11_reg_28_x_q;

    -- c0_exit11_reg_29_x(REG,31)
    c0_exit11_reg_29_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_29_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_29_x_q <= in_c0_exit11_29;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_29(GPOUT,188)
    out_c0_exit11_29 <= c0_exit11_reg_29_x_q;

    -- c0_exit11_reg_30_x(REG,32)
    c0_exit11_reg_30_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_30_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_30_x_q <= in_c0_exit11_30;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_30(GPOUT,189)
    out_c0_exit11_30 <= c0_exit11_reg_30_x_q;

    -- c0_exit11_reg_31_x(REG,33)
    c0_exit11_reg_31_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_31_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_31_x_q <= in_c0_exit11_31;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_31(GPOUT,190)
    out_c0_exit11_31 <= c0_exit11_reg_31_x_q;

    -- c0_exit11_reg_32_x(REG,34)
    c0_exit11_reg_32_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_32_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_32_x_q <= in_c0_exit11_32;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_32(GPOUT,191)
    out_c0_exit11_32 <= c0_exit11_reg_32_x_q;

    -- c0_exit11_reg_33_x(REG,35)
    c0_exit11_reg_33_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_33_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_33_x_q <= in_c0_exit11_33;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_33(GPOUT,192)
    out_c0_exit11_33 <= c0_exit11_reg_33_x_q;

    -- c0_exit11_reg_34_x(REG,36)
    c0_exit11_reg_34_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_34_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_34_x_q <= in_c0_exit11_34;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_34(GPOUT,193)
    out_c0_exit11_34 <= c0_exit11_reg_34_x_q;

    -- c0_exit11_reg_35_x(REG,37)
    c0_exit11_reg_35_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_35_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_35_x_q <= in_c0_exit11_35;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_35(GPOUT,194)
    out_c0_exit11_35 <= c0_exit11_reg_35_x_q;

    -- c0_exit11_reg_36_x(REG,38)
    c0_exit11_reg_36_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_36_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_36_x_q <= in_c0_exit11_36;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_36(GPOUT,195)
    out_c0_exit11_36 <= c0_exit11_reg_36_x_q;

    -- c0_exit11_reg_37_x(REG,39)
    c0_exit11_reg_37_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_37_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_37_x_q <= in_c0_exit11_37;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_37(GPOUT,196)
    out_c0_exit11_37 <= c0_exit11_reg_37_x_q;

    -- c0_exit11_reg_38_x(REG,40)
    c0_exit11_reg_38_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_38_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_38_x_q <= in_c0_exit11_38;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_38(GPOUT,197)
    out_c0_exit11_38 <= c0_exit11_reg_38_x_q;

    -- c0_exit11_reg_39_x(REG,41)
    c0_exit11_reg_39_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_39_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_39_x_q <= in_c0_exit11_39;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_39(GPOUT,198)
    out_c0_exit11_39 <= c0_exit11_reg_39_x_q;

    -- c0_exit11_reg_40_x(REG,42)
    c0_exit11_reg_40_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_40_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_40_x_q <= in_c0_exit11_40;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_40(GPOUT,199)
    out_c0_exit11_40 <= c0_exit11_reg_40_x_q;

    -- c0_exit11_reg_41_x(REG,43)
    c0_exit11_reg_41_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_41_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_41_x_q <= in_c0_exit11_41;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_41(GPOUT,200)
    out_c0_exit11_41 <= c0_exit11_reg_41_x_q;

    -- c0_exit11_reg_42_x(REG,44)
    c0_exit11_reg_42_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_42_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_42_x_q <= in_c0_exit11_42;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_42(GPOUT,201)
    out_c0_exit11_42 <= c0_exit11_reg_42_x_q;

    -- c0_exit11_reg_43_x(REG,45)
    c0_exit11_reg_43_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_43_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_43_x_q <= in_c0_exit11_43;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_43(GPOUT,202)
    out_c0_exit11_43 <= c0_exit11_reg_43_x_q;

    -- c0_exit11_reg_44_x(REG,46)
    c0_exit11_reg_44_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_44_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_44_x_q <= in_c0_exit11_44;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_44(GPOUT,203)
    out_c0_exit11_44 <= c0_exit11_reg_44_x_q;

    -- c0_exit11_reg_45_x(REG,47)
    c0_exit11_reg_45_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_45_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_45_x_q <= in_c0_exit11_45;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_45(GPOUT,204)
    out_c0_exit11_45 <= c0_exit11_reg_45_x_q;

    -- c0_exit11_reg_46_x(REG,48)
    c0_exit11_reg_46_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_46_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_46_x_q <= in_c0_exit11_46;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_46(GPOUT,205)
    out_c0_exit11_46 <= c0_exit11_reg_46_x_q;

    -- c0_exit11_reg_47_x(REG,49)
    c0_exit11_reg_47_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_47_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_47_x_q <= in_c0_exit11_47;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_47(GPOUT,206)
    out_c0_exit11_47 <= c0_exit11_reg_47_x_q;

    -- c0_exit11_reg_48_x(REG,50)
    c0_exit11_reg_48_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_48_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_48_x_q <= in_c0_exit11_48;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_48(GPOUT,207)
    out_c0_exit11_48 <= c0_exit11_reg_48_x_q;

    -- c0_exit11_reg_49_x(REG,51)
    c0_exit11_reg_49_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_49_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_49_x_q <= in_c0_exit11_49;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_49(GPOUT,208)
    out_c0_exit11_49 <= c0_exit11_reg_49_x_q;

    -- c0_exit11_reg_50_x(REG,52)
    c0_exit11_reg_50_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit11_reg_50_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exit11_reg_50_x_q <= in_c0_exit11_50;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit11_50(GPOUT,209)
    out_c0_exit11_50 <= c0_exit11_reg_50_x_q;

    -- acl_hw_wg_id43_reg(REG,264)
    acl_hw_wg_id43_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            acl_hw_wg_id43_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                acl_hw_wg_id43_reg_q <= in_acl_hw_wg_id43;
            END IF;
        END IF;
    END PROCESS;

    -- out_acl_hw_wg_id43(GPOUT,210)
    out_acl_hw_wg_id43 <= acl_hw_wg_id43_reg_q;

    -- c0_exe10_reg(REG,265)
    c0_exe10_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe10_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe10_reg_q <= in_c0_exe10;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe10(GPOUT,211)
    out_c0_exe10 <= c0_exe10_reg_q;

    -- c0_exe11_reg(REG,268)
    c0_exe11_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe11_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe11_reg_q <= in_c0_exe11;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe11(GPOUT,212)
    out_c0_exe11 <= c0_exe11_reg_q;

    -- c0_exe112_reg(REG,266)
    c0_exe112_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe112_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe112_reg_q <= in_c0_exe112;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe112(GPOUT,213)
    out_c0_exe112 <= c0_exe112_reg_q;

    -- c0_exe116_reg(REG,267)
    c0_exe116_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe116_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe116_reg_q <= in_c0_exe116;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe116(GPOUT,214)
    out_c0_exe116 <= c0_exe116_reg_q;

    -- c0_exe12_reg(REG,269)
    c0_exe12_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe12_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe12_reg_q <= in_c0_exe12;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe12(GPOUT,215)
    out_c0_exe12 <= c0_exe12_reg_q;

    -- c0_exe13_reg(REG,270)
    c0_exe13_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe13_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe13_reg_q <= in_c0_exe13;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe13(GPOUT,216)
    out_c0_exe13 <= c0_exe13_reg_q;

    -- c0_exe14_reg(REG,271)
    c0_exe14_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe14_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe14_reg_q <= in_c0_exe14;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe14(GPOUT,217)
    out_c0_exe14 <= c0_exe14_reg_q;

    -- c0_exe15_reg(REG,272)
    c0_exe15_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe15_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe15_reg_q <= in_c0_exe15;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe15(GPOUT,218)
    out_c0_exe15 <= c0_exe15_reg_q;

    -- c0_exe16_reg(REG,273)
    c0_exe16_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe16_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe16_reg_q <= in_c0_exe16;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe16(GPOUT,219)
    out_c0_exe16 <= c0_exe16_reg_q;

    -- c0_exe17_reg(REG,274)
    c0_exe17_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe17_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe17_reg_q <= in_c0_exe17;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe17(GPOUT,220)
    out_c0_exe17 <= c0_exe17_reg_q;

    -- c0_exe18_reg(REG,275)
    c0_exe18_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe18_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe18_reg_q <= in_c0_exe18;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe18(GPOUT,221)
    out_c0_exe18 <= c0_exe18_reg_q;

    -- c0_exe19_reg(REG,276)
    c0_exe19_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe19_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe19_reg_q <= in_c0_exe19;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe19(GPOUT,222)
    out_c0_exe19 <= c0_exe19_reg_q;

    -- c0_exe20_reg(REG,277)
    c0_exe20_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe20_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe20_reg_q <= in_c0_exe20;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe20(GPOUT,223)
    out_c0_exe20 <= c0_exe20_reg_q;

    -- c0_exe21_reg(REG,279)
    c0_exe21_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe21_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe21_reg_q <= in_c0_exe21;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe21(GPOUT,224)
    out_c0_exe21 <= c0_exe21_reg_q;

    -- c0_exe213_reg(REG,278)
    c0_exe213_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe213_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe213_reg_q <= in_c0_exe213;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe213(GPOUT,225)
    out_c0_exe213 <= c0_exe213_reg_q;

    -- c0_exe22_reg(REG,280)
    c0_exe22_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe22_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe22_reg_q <= in_c0_exe22;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe22(GPOUT,226)
    out_c0_exe22 <= c0_exe22_reg_q;

    -- c0_exe23_reg(REG,281)
    c0_exe23_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe23_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe23_reg_q <= in_c0_exe23;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe23(GPOUT,227)
    out_c0_exe23 <= c0_exe23_reg_q;

    -- c0_exe24_reg(REG,282)
    c0_exe24_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe24_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe24_reg_q <= in_c0_exe24;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe24(GPOUT,228)
    out_c0_exe24 <= c0_exe24_reg_q;

    -- c0_exe25_reg(REG,283)
    c0_exe25_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe25_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe25_reg_q <= in_c0_exe25;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe25(GPOUT,229)
    out_c0_exe25 <= c0_exe25_reg_q;

    -- c0_exe26_reg(REG,284)
    c0_exe26_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe26_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe26_reg_q <= in_c0_exe26;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe26(GPOUT,230)
    out_c0_exe26 <= c0_exe26_reg_q;

    -- c0_exe27_reg(REG,285)
    c0_exe27_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe27_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe27_reg_q <= in_c0_exe27;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe27(GPOUT,231)
    out_c0_exe27 <= c0_exe27_reg_q;

    -- c0_exe28_reg(REG,286)
    c0_exe28_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe28_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe28_reg_q <= in_c0_exe28;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe28(GPOUT,232)
    out_c0_exe28 <= c0_exe28_reg_q;

    -- c0_exe29_reg(REG,287)
    c0_exe29_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe29_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe29_reg_q <= in_c0_exe29;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe29(GPOUT,233)
    out_c0_exe29 <= c0_exe29_reg_q;

    -- c0_exe30_reg(REG,288)
    c0_exe30_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe30_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe30_reg_q <= in_c0_exe30;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe30(GPOUT,234)
    out_c0_exe30 <= c0_exe30_reg_q;

    -- c0_exe31_reg(REG,289)
    c0_exe31_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe31_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe31_reg_q <= in_c0_exe31;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe31(GPOUT,235)
    out_c0_exe31 <= c0_exe31_reg_q;

    -- c0_exe32_reg(REG,290)
    c0_exe32_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe32_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe32_reg_q <= in_c0_exe32;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe32(GPOUT,236)
    out_c0_exe32 <= c0_exe32_reg_q;

    -- c0_exe33_reg(REG,291)
    c0_exe33_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe33_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe33_reg_q <= in_c0_exe33;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe33(GPOUT,237)
    out_c0_exe33 <= c0_exe33_reg_q;

    -- c0_exe34_reg(REG,292)
    c0_exe34_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe34_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe34_reg_q <= in_c0_exe34;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe34(GPOUT,238)
    out_c0_exe34 <= c0_exe34_reg_q;

    -- c0_exe35_reg(REG,293)
    c0_exe35_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe35_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe35_reg_q <= in_c0_exe35;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe35(GPOUT,239)
    out_c0_exe35 <= c0_exe35_reg_q;

    -- c0_exe36_reg(REG,294)
    c0_exe36_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe36_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe36_reg_q <= in_c0_exe36;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe36(GPOUT,240)
    out_c0_exe36 <= c0_exe36_reg_q;

    -- c0_exe37_reg(REG,295)
    c0_exe37_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe37_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe37_reg_q <= in_c0_exe37;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe37(GPOUT,241)
    out_c0_exe37 <= c0_exe37_reg_q;

    -- c0_exe38_reg(REG,296)
    c0_exe38_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe38_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe38_reg_q <= in_c0_exe38;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe38(GPOUT,242)
    out_c0_exe38 <= c0_exe38_reg_q;

    -- c0_exe39_reg(REG,297)
    c0_exe39_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe39_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe39_reg_q <= in_c0_exe39;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe39(GPOUT,243)
    out_c0_exe39 <= c0_exe39_reg_q;

    -- c0_exe40_reg(REG,298)
    c0_exe40_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe40_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe40_reg_q <= in_c0_exe40;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe40(GPOUT,244)
    out_c0_exe40 <= c0_exe40_reg_q;

    -- c0_exe41_reg(REG,299)
    c0_exe41_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe41_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe41_reg_q <= in_c0_exe41;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe41(GPOUT,245)
    out_c0_exe41 <= c0_exe41_reg_q;

    -- c0_exe42_reg(REG,300)
    c0_exe42_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe42_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe42_reg_q <= in_c0_exe42;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe42(GPOUT,246)
    out_c0_exe42 <= c0_exe42_reg_q;

    -- c0_exe43_reg(REG,301)
    c0_exe43_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe43_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe43_reg_q <= in_c0_exe43;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe43(GPOUT,247)
    out_c0_exe43 <= c0_exe43_reg_q;

    -- c0_exe44_reg(REG,302)
    c0_exe44_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe44_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe44_reg_q <= in_c0_exe44;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe44(GPOUT,248)
    out_c0_exe44 <= c0_exe44_reg_q;

    -- c0_exe45_reg(REG,303)
    c0_exe45_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe45_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe45_reg_q <= in_c0_exe45;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe45(GPOUT,249)
    out_c0_exe45 <= c0_exe45_reg_q;

    -- c0_exe46_reg(REG,304)
    c0_exe46_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe46_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe46_reg_q <= in_c0_exe46;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe46(GPOUT,250)
    out_c0_exe46 <= c0_exe46_reg_q;

    -- c0_exe47_reg(REG,305)
    c0_exe47_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe47_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe47_reg_q <= in_c0_exe47;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe47(GPOUT,251)
    out_c0_exe47 <= c0_exe47_reg_q;

    -- c0_exe48_reg(REG,306)
    c0_exe48_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe48_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe48_reg_q <= in_c0_exe48;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe48(GPOUT,252)
    out_c0_exe48 <= c0_exe48_reg_q;

    -- c0_exe49_reg(REG,307)
    c0_exe49_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe49_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe49_reg_q <= in_c0_exe49;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe49(GPOUT,253)
    out_c0_exe49 <= c0_exe49_reg_q;

    -- c0_exe5_reg(REG,310)
    c0_exe5_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe5_reg_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe5_reg_q <= in_c0_exe5;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe5(GPOUT,254)
    out_c0_exe5 <= c0_exe5_reg_q;

    -- c0_exe50_reg(REG,309)
    c0_exe50_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe50_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe50_reg_q <= in_c0_exe50;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe50(GPOUT,255)
    out_c0_exe50 <= c0_exe50_reg_q;

    -- c0_exe6_reg(REG,311)
    c0_exe6_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe6_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe6_reg_q <= in_c0_exe6;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe6(GPOUT,256)
    out_c0_exe6 <= c0_exe6_reg_q;

    -- c0_exe7_reg(REG,312)
    c0_exe7_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe7_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe7_reg_q <= in_c0_exe7;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe7(GPOUT,257)
    out_c0_exe7 <= c0_exe7_reg_q;

    -- c0_exe8_reg(REG,313)
    c0_exe8_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe8_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe8_reg_q <= in_c0_exe8;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe8(GPOUT,258)
    out_c0_exe8 <= c0_exe8_reg_q;

    -- c0_exe9_reg(REG,314)
    c0_exe9_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe9_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                c0_exe9_reg_q <= in_c0_exe9;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe9(GPOUT,259)
    out_c0_exe9 <= c0_exe9_reg_q;

    -- dag_node_pm_0_reg(REG,315)
    dag_node_pm_0_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            dag_node_pm_0_reg_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B1_branch_enable_q = "1") THEN
                dag_node_pm_0_reg_q <= in_dag_node_pm_0;
            END IF;
        END IF;
    END PROCESS;

    -- out_dag_node_pm_0(GPOUT,260)
    out_dag_node_pm_0 <= dag_node_pm_0_reg_q;

    -- ethash_calculate_dag_item_B1_branch_enable_not(LOGICAL,317)
    ethash_calculate_dag_item_B1_branch_enable_not_q <= not (ethash_calculate_dag_item_B1_branch_enable_q);

    -- out_stall_out(GPOUT,261)
    out_stall_out <= ethash_calculate_dag_item_B1_branch_enable_not_q;

    -- out_valid_out_0(GPOUT,262)
    out_valid_out_0 <= valid_0_reg_q;

    -- out_valid_out_1(GPOUT,263)
    out_valid_out_1 <= valid_1_reg_q;

END normal;
