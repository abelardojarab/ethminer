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

-- VHDL created from ethash_calculate_dag_item_B5_branch
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

entity ethash_calculate_dag_item_B5_branch is
    port (
        in_c0_exit169_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit169_1 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_c0_exit169_2 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit169_3 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_c0_exit169_4 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_5 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_6 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_7 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_8 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_9 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_10 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_11 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_12 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_13 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_14 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_15 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_16 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_17 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_18 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_19 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_20 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_21 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_22 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_23 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_24 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_25 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_26 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_27 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_28 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_29 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_30 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_31 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_32 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_33 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_34 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_35 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_36 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_37 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_38 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_39 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_40 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_41 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_42 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_43 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_44 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_45 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_46 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_47 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_48 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_49 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit169_50 : in std_logic_vector(31 downto 0);  -- ufix32
        in_acl_hw_wg_id39 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe10179 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe111 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe11180 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe11219 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe12181 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe13182 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe14183 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe15184 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe16185 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe17186 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe18187 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe19188 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe20189 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe21190 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe21324 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe2171 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe22191 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe23192 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe24193 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe25194 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe26195 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe27196 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe28197 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe29198 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe30199 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe31200 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe3172 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_c0_exe32201 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe33202 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe34203 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe35204 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe36205 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe37206 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe38207 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe39208 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe40209 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe41210 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe4173 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe42211 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe43212 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe44213 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe45214 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe46215 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe47216 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe48217 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe49218 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe50219 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe5174 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe6175 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe7176 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe8177 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe9178 : in std_logic_vector(31 downto 0);  -- ufix32
        in_dag_node_pm_2 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit169_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit169_1 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_c0_exit169_2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit169_3 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_c0_exit169_4 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_5 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_6 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_7 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_8 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_9 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_10 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_11 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_12 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_13 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_14 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_15 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_16 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_17 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_18 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_19 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_20 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_21 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_22 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_23 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_24 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_25 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_26 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_27 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_28 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_29 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_30 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_31 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_32 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_33 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_34 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_35 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_36 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_37 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_38 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_39 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_40 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_41 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_42 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_43 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_44 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_45 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_46 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_47 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_48 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_49 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit169_50 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_hw_wg_id39 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe10179 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe111 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe11180 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe11219 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe12181 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe13182 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe14183 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe15184 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe16185 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe17186 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe18187 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe19188 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe20189 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe21190 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe21324 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe22191 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe23192 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe24193 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe25194 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe26195 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe27196 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe28197 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe29198 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe30199 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe31200 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe3172 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_c0_exe32201 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe33202 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe34203 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe35204 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe36205 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe37206 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe38207 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe39208 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe40209 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe41210 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe4173 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe42211 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe43212 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe44213 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe45214 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe46215 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe47216 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe48217 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe49218 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe50219 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe5174 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe6175 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe7176 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe8177 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe9178 : out std_logic_vector(31 downto 0);  -- ufix32
        out_dag_node_pm_2 : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end ethash_calculate_dag_item_B5_branch;

architecture normal of ethash_calculate_dag_item_B5_branch is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit169_reg_0_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit169_reg_1_x_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal c0_exit169_reg_2_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit169_reg_3_x_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal c0_exit169_reg_4_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_5_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_6_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_7_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_8_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_9_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_10_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_11_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_12_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_13_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_14_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_15_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_16_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_17_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_18_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_19_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_20_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_21_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_22_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_23_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_24_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_25_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_26_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_27_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_28_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_29_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_30_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_31_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_32_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_33_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_34_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_35_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_36_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_37_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_38_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_39_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_40_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_41_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_42_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_43_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_44_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_45_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_46_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_47_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_48_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_49_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit169_reg_50_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal acl_hw_wg_id39_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe10179_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe11180_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe111_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe11219_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe12181_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe13182_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe14183_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe15184_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe16185_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe17186_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe18187_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe19188_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe20189_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe21190_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe21324_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe2171_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe22191_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe23192_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe24193_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe25194_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe26195_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe27196_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe28197_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe29198_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe30199_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe31200_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe3172_reg_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal c0_exe32201_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe33202_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe34203_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe35204_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe36205_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe37206_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe38207_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe39208_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe40209_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe41210_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe4173_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe42211_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe43212_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe44213_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe45214_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe46215_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe47216_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe48217_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe49218_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe50219_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe5174_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe6175_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe7176_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe8177_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe9178_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal dag_node_pm_2_reg_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal ethash_calculate_dag_item_B5_branch_enable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B5_branch_enable_not_q : STD_LOGIC_VECTOR (0 downto 0);
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

    -- not_stall_in_1(LOGICAL,325)
    not_stall_in_1_q <= not (in_stall_in_1);

    -- c0_exe2171_cmp(LOGICAL,284)
    c0_exe2171_cmp_q <= not (in_c0_exe2171);

    -- valid_out_1_and(LOGICAL,333)
    valid_out_1_and_q <= in_valid_in and c0_exe2171_cmp_q;

    -- valid_1_reg(REG,331)
    valid_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_1_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                valid_1_reg_q <= valid_out_1_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_1(LOGICAL,327)
    not_valid_1_q <= not (valid_1_reg_q);

    -- not_valid_or_not_stall_1(LOGICAL,329)
    not_valid_or_not_stall_1_q <= not_valid_1_q or not_stall_in_1_q;

    -- not_stall_in_0(LOGICAL,324)
    not_stall_in_0_q <= not (in_stall_in_0);

    -- valid_out_0_and(LOGICAL,332)
    valid_out_0_and_q <= in_valid_in and in_c0_exe2171;

    -- valid_0_reg(REG,330)
    valid_0_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_0_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                valid_0_reg_q <= valid_out_0_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_0(LOGICAL,326)
    not_valid_0_q <= not (valid_0_reg_q);

    -- not_valid_or_not_stall_0(LOGICAL,328)
    not_valid_or_not_stall_0_q <= not_valid_0_q or not_stall_in_0_q;

    -- ethash_calculate_dag_item_B5_branch_enable(LOGICAL,322)
    ethash_calculate_dag_item_B5_branch_enable_q <= not_valid_or_not_stall_0_q and not_valid_or_not_stall_1_q;

    -- c0_exit169_reg_0_x(REG,2)
    c0_exit169_reg_0_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_0_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_0_x_q <= in_c0_exit169_0;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_0(GPOUT,161)
    out_c0_exit169_0 <= c0_exit169_reg_0_x_q;

    -- c0_exit169_reg_1_x(REG,3)
    c0_exit169_reg_1_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_1_x_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_1_x_q <= in_c0_exit169_1;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_1(GPOUT,162)
    out_c0_exit169_1 <= c0_exit169_reg_1_x_q;

    -- c0_exit169_reg_2_x(REG,4)
    c0_exit169_reg_2_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_2_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_2_x_q <= in_c0_exit169_2;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_2(GPOUT,163)
    out_c0_exit169_2 <= c0_exit169_reg_2_x_q;

    -- c0_exit169_reg_3_x(REG,5)
    c0_exit169_reg_3_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_3_x_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_3_x_q <= in_c0_exit169_3;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_3(GPOUT,164)
    out_c0_exit169_3 <= c0_exit169_reg_3_x_q;

    -- c0_exit169_reg_4_x(REG,6)
    c0_exit169_reg_4_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_4_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_4_x_q <= in_c0_exit169_4;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_4(GPOUT,165)
    out_c0_exit169_4 <= c0_exit169_reg_4_x_q;

    -- c0_exit169_reg_5_x(REG,7)
    c0_exit169_reg_5_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_5_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_5_x_q <= in_c0_exit169_5;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_5(GPOUT,166)
    out_c0_exit169_5 <= c0_exit169_reg_5_x_q;

    -- c0_exit169_reg_6_x(REG,8)
    c0_exit169_reg_6_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_6_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_6_x_q <= in_c0_exit169_6;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_6(GPOUT,167)
    out_c0_exit169_6 <= c0_exit169_reg_6_x_q;

    -- c0_exit169_reg_7_x(REG,9)
    c0_exit169_reg_7_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_7_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_7_x_q <= in_c0_exit169_7;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_7(GPOUT,168)
    out_c0_exit169_7 <= c0_exit169_reg_7_x_q;

    -- c0_exit169_reg_8_x(REG,10)
    c0_exit169_reg_8_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_8_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_8_x_q <= in_c0_exit169_8;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_8(GPOUT,169)
    out_c0_exit169_8 <= c0_exit169_reg_8_x_q;

    -- c0_exit169_reg_9_x(REG,11)
    c0_exit169_reg_9_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_9_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_9_x_q <= in_c0_exit169_9;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_9(GPOUT,170)
    out_c0_exit169_9 <= c0_exit169_reg_9_x_q;

    -- c0_exit169_reg_10_x(REG,12)
    c0_exit169_reg_10_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_10_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_10_x_q <= in_c0_exit169_10;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_10(GPOUT,171)
    out_c0_exit169_10 <= c0_exit169_reg_10_x_q;

    -- c0_exit169_reg_11_x(REG,13)
    c0_exit169_reg_11_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_11_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_11_x_q <= in_c0_exit169_11;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_11(GPOUT,172)
    out_c0_exit169_11 <= c0_exit169_reg_11_x_q;

    -- c0_exit169_reg_12_x(REG,14)
    c0_exit169_reg_12_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_12_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_12_x_q <= in_c0_exit169_12;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_12(GPOUT,173)
    out_c0_exit169_12 <= c0_exit169_reg_12_x_q;

    -- c0_exit169_reg_13_x(REG,15)
    c0_exit169_reg_13_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_13_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_13_x_q <= in_c0_exit169_13;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_13(GPOUT,174)
    out_c0_exit169_13 <= c0_exit169_reg_13_x_q;

    -- c0_exit169_reg_14_x(REG,16)
    c0_exit169_reg_14_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_14_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_14_x_q <= in_c0_exit169_14;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_14(GPOUT,175)
    out_c0_exit169_14 <= c0_exit169_reg_14_x_q;

    -- c0_exit169_reg_15_x(REG,17)
    c0_exit169_reg_15_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_15_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_15_x_q <= in_c0_exit169_15;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_15(GPOUT,176)
    out_c0_exit169_15 <= c0_exit169_reg_15_x_q;

    -- c0_exit169_reg_16_x(REG,18)
    c0_exit169_reg_16_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_16_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_16_x_q <= in_c0_exit169_16;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_16(GPOUT,177)
    out_c0_exit169_16 <= c0_exit169_reg_16_x_q;

    -- c0_exit169_reg_17_x(REG,19)
    c0_exit169_reg_17_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_17_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_17_x_q <= in_c0_exit169_17;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_17(GPOUT,178)
    out_c0_exit169_17 <= c0_exit169_reg_17_x_q;

    -- c0_exit169_reg_18_x(REG,20)
    c0_exit169_reg_18_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_18_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_18_x_q <= in_c0_exit169_18;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_18(GPOUT,179)
    out_c0_exit169_18 <= c0_exit169_reg_18_x_q;

    -- c0_exit169_reg_19_x(REG,21)
    c0_exit169_reg_19_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_19_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_19_x_q <= in_c0_exit169_19;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_19(GPOUT,180)
    out_c0_exit169_19 <= c0_exit169_reg_19_x_q;

    -- c0_exit169_reg_20_x(REG,22)
    c0_exit169_reg_20_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_20_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_20_x_q <= in_c0_exit169_20;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_20(GPOUT,181)
    out_c0_exit169_20 <= c0_exit169_reg_20_x_q;

    -- c0_exit169_reg_21_x(REG,23)
    c0_exit169_reg_21_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_21_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_21_x_q <= in_c0_exit169_21;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_21(GPOUT,182)
    out_c0_exit169_21 <= c0_exit169_reg_21_x_q;

    -- c0_exit169_reg_22_x(REG,24)
    c0_exit169_reg_22_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_22_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_22_x_q <= in_c0_exit169_22;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_22(GPOUT,183)
    out_c0_exit169_22 <= c0_exit169_reg_22_x_q;

    -- c0_exit169_reg_23_x(REG,25)
    c0_exit169_reg_23_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_23_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_23_x_q <= in_c0_exit169_23;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_23(GPOUT,184)
    out_c0_exit169_23 <= c0_exit169_reg_23_x_q;

    -- c0_exit169_reg_24_x(REG,26)
    c0_exit169_reg_24_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_24_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_24_x_q <= in_c0_exit169_24;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_24(GPOUT,185)
    out_c0_exit169_24 <= c0_exit169_reg_24_x_q;

    -- c0_exit169_reg_25_x(REG,27)
    c0_exit169_reg_25_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_25_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_25_x_q <= in_c0_exit169_25;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_25(GPOUT,186)
    out_c0_exit169_25 <= c0_exit169_reg_25_x_q;

    -- c0_exit169_reg_26_x(REG,28)
    c0_exit169_reg_26_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_26_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_26_x_q <= in_c0_exit169_26;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_26(GPOUT,187)
    out_c0_exit169_26 <= c0_exit169_reg_26_x_q;

    -- c0_exit169_reg_27_x(REG,29)
    c0_exit169_reg_27_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_27_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_27_x_q <= in_c0_exit169_27;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_27(GPOUT,188)
    out_c0_exit169_27 <= c0_exit169_reg_27_x_q;

    -- c0_exit169_reg_28_x(REG,30)
    c0_exit169_reg_28_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_28_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_28_x_q <= in_c0_exit169_28;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_28(GPOUT,189)
    out_c0_exit169_28 <= c0_exit169_reg_28_x_q;

    -- c0_exit169_reg_29_x(REG,31)
    c0_exit169_reg_29_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_29_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_29_x_q <= in_c0_exit169_29;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_29(GPOUT,190)
    out_c0_exit169_29 <= c0_exit169_reg_29_x_q;

    -- c0_exit169_reg_30_x(REG,32)
    c0_exit169_reg_30_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_30_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_30_x_q <= in_c0_exit169_30;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_30(GPOUT,191)
    out_c0_exit169_30 <= c0_exit169_reg_30_x_q;

    -- c0_exit169_reg_31_x(REG,33)
    c0_exit169_reg_31_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_31_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_31_x_q <= in_c0_exit169_31;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_31(GPOUT,192)
    out_c0_exit169_31 <= c0_exit169_reg_31_x_q;

    -- c0_exit169_reg_32_x(REG,34)
    c0_exit169_reg_32_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_32_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_32_x_q <= in_c0_exit169_32;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_32(GPOUT,193)
    out_c0_exit169_32 <= c0_exit169_reg_32_x_q;

    -- c0_exit169_reg_33_x(REG,35)
    c0_exit169_reg_33_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_33_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_33_x_q <= in_c0_exit169_33;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_33(GPOUT,194)
    out_c0_exit169_33 <= c0_exit169_reg_33_x_q;

    -- c0_exit169_reg_34_x(REG,36)
    c0_exit169_reg_34_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_34_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_34_x_q <= in_c0_exit169_34;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_34(GPOUT,195)
    out_c0_exit169_34 <= c0_exit169_reg_34_x_q;

    -- c0_exit169_reg_35_x(REG,37)
    c0_exit169_reg_35_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_35_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_35_x_q <= in_c0_exit169_35;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_35(GPOUT,196)
    out_c0_exit169_35 <= c0_exit169_reg_35_x_q;

    -- c0_exit169_reg_36_x(REG,38)
    c0_exit169_reg_36_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_36_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_36_x_q <= in_c0_exit169_36;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_36(GPOUT,197)
    out_c0_exit169_36 <= c0_exit169_reg_36_x_q;

    -- c0_exit169_reg_37_x(REG,39)
    c0_exit169_reg_37_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_37_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_37_x_q <= in_c0_exit169_37;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_37(GPOUT,198)
    out_c0_exit169_37 <= c0_exit169_reg_37_x_q;

    -- c0_exit169_reg_38_x(REG,40)
    c0_exit169_reg_38_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_38_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_38_x_q <= in_c0_exit169_38;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_38(GPOUT,199)
    out_c0_exit169_38 <= c0_exit169_reg_38_x_q;

    -- c0_exit169_reg_39_x(REG,41)
    c0_exit169_reg_39_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_39_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_39_x_q <= in_c0_exit169_39;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_39(GPOUT,200)
    out_c0_exit169_39 <= c0_exit169_reg_39_x_q;

    -- c0_exit169_reg_40_x(REG,42)
    c0_exit169_reg_40_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_40_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_40_x_q <= in_c0_exit169_40;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_40(GPOUT,201)
    out_c0_exit169_40 <= c0_exit169_reg_40_x_q;

    -- c0_exit169_reg_41_x(REG,43)
    c0_exit169_reg_41_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_41_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_41_x_q <= in_c0_exit169_41;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_41(GPOUT,202)
    out_c0_exit169_41 <= c0_exit169_reg_41_x_q;

    -- c0_exit169_reg_42_x(REG,44)
    c0_exit169_reg_42_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_42_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_42_x_q <= in_c0_exit169_42;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_42(GPOUT,203)
    out_c0_exit169_42 <= c0_exit169_reg_42_x_q;

    -- c0_exit169_reg_43_x(REG,45)
    c0_exit169_reg_43_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_43_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_43_x_q <= in_c0_exit169_43;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_43(GPOUT,204)
    out_c0_exit169_43 <= c0_exit169_reg_43_x_q;

    -- c0_exit169_reg_44_x(REG,46)
    c0_exit169_reg_44_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_44_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_44_x_q <= in_c0_exit169_44;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_44(GPOUT,205)
    out_c0_exit169_44 <= c0_exit169_reg_44_x_q;

    -- c0_exit169_reg_45_x(REG,47)
    c0_exit169_reg_45_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_45_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_45_x_q <= in_c0_exit169_45;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_45(GPOUT,206)
    out_c0_exit169_45 <= c0_exit169_reg_45_x_q;

    -- c0_exit169_reg_46_x(REG,48)
    c0_exit169_reg_46_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_46_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_46_x_q <= in_c0_exit169_46;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_46(GPOUT,207)
    out_c0_exit169_46 <= c0_exit169_reg_46_x_q;

    -- c0_exit169_reg_47_x(REG,49)
    c0_exit169_reg_47_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_47_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_47_x_q <= in_c0_exit169_47;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_47(GPOUT,208)
    out_c0_exit169_47 <= c0_exit169_reg_47_x_q;

    -- c0_exit169_reg_48_x(REG,50)
    c0_exit169_reg_48_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_48_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_48_x_q <= in_c0_exit169_48;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_48(GPOUT,209)
    out_c0_exit169_48 <= c0_exit169_reg_48_x_q;

    -- c0_exit169_reg_49_x(REG,51)
    c0_exit169_reg_49_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_49_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_49_x_q <= in_c0_exit169_49;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_49(GPOUT,210)
    out_c0_exit169_49 <= c0_exit169_reg_49_x_q;

    -- c0_exit169_reg_50_x(REG,52)
    c0_exit169_reg_50_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit169_reg_50_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exit169_reg_50_x_q <= in_c0_exit169_50;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit169_50(GPOUT,211)
    out_c0_exit169_50 <= c0_exit169_reg_50_x_q;

    -- acl_hw_wg_id39_reg(REG,268)
    acl_hw_wg_id39_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            acl_hw_wg_id39_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                acl_hw_wg_id39_reg_q <= in_acl_hw_wg_id39;
            END IF;
        END IF;
    END PROCESS;

    -- out_acl_hw_wg_id39(GPOUT,212)
    out_acl_hw_wg_id39 <= acl_hw_wg_id39_reg_q;

    -- c0_exe10179_reg(REG,269)
    c0_exe10179_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe10179_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe10179_reg_q <= in_c0_exe10179;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe10179(GPOUT,213)
    out_c0_exe10179 <= c0_exe10179_reg_q;

    -- c0_exe111_reg(REG,271)
    c0_exe111_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe111_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe111_reg_q <= in_c0_exe111;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe111(GPOUT,214)
    out_c0_exe111 <= c0_exe111_reg_q;

    -- c0_exe11180_reg(REG,270)
    c0_exe11180_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe11180_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe11180_reg_q <= in_c0_exe11180;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe11180(GPOUT,215)
    out_c0_exe11180 <= c0_exe11180_reg_q;

    -- c0_exe11219_reg(REG,272)
    c0_exe11219_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe11219_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe11219_reg_q <= in_c0_exe11219;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe11219(GPOUT,216)
    out_c0_exe11219 <= c0_exe11219_reg_q;

    -- c0_exe12181_reg(REG,273)
    c0_exe12181_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe12181_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe12181_reg_q <= in_c0_exe12181;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe12181(GPOUT,217)
    out_c0_exe12181 <= c0_exe12181_reg_q;

    -- c0_exe13182_reg(REG,274)
    c0_exe13182_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe13182_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe13182_reg_q <= in_c0_exe13182;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe13182(GPOUT,218)
    out_c0_exe13182 <= c0_exe13182_reg_q;

    -- c0_exe14183_reg(REG,275)
    c0_exe14183_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe14183_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe14183_reg_q <= in_c0_exe14183;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe14183(GPOUT,219)
    out_c0_exe14183 <= c0_exe14183_reg_q;

    -- c0_exe15184_reg(REG,276)
    c0_exe15184_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe15184_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe15184_reg_q <= in_c0_exe15184;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe15184(GPOUT,220)
    out_c0_exe15184 <= c0_exe15184_reg_q;

    -- c0_exe16185_reg(REG,277)
    c0_exe16185_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe16185_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe16185_reg_q <= in_c0_exe16185;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe16185(GPOUT,221)
    out_c0_exe16185 <= c0_exe16185_reg_q;

    -- c0_exe17186_reg(REG,278)
    c0_exe17186_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe17186_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe17186_reg_q <= in_c0_exe17186;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe17186(GPOUT,222)
    out_c0_exe17186 <= c0_exe17186_reg_q;

    -- c0_exe18187_reg(REG,279)
    c0_exe18187_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe18187_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe18187_reg_q <= in_c0_exe18187;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe18187(GPOUT,223)
    out_c0_exe18187 <= c0_exe18187_reg_q;

    -- c0_exe19188_reg(REG,280)
    c0_exe19188_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe19188_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe19188_reg_q <= in_c0_exe19188;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe19188(GPOUT,224)
    out_c0_exe19188 <= c0_exe19188_reg_q;

    -- c0_exe20189_reg(REG,281)
    c0_exe20189_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe20189_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe20189_reg_q <= in_c0_exe20189;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe20189(GPOUT,225)
    out_c0_exe20189 <= c0_exe20189_reg_q;

    -- c0_exe21190_reg(REG,282)
    c0_exe21190_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe21190_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe21190_reg_q <= in_c0_exe21190;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe21190(GPOUT,226)
    out_c0_exe21190 <= c0_exe21190_reg_q;

    -- c0_exe21324_reg(REG,283)
    c0_exe21324_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe21324_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe21324_reg_q <= in_c0_exe21324;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe21324(GPOUT,227)
    out_c0_exe21324 <= c0_exe21324_reg_q;

    -- c0_exe22191_reg(REG,285)
    c0_exe22191_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe22191_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe22191_reg_q <= in_c0_exe22191;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe22191(GPOUT,228)
    out_c0_exe22191 <= c0_exe22191_reg_q;

    -- c0_exe23192_reg(REG,286)
    c0_exe23192_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe23192_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe23192_reg_q <= in_c0_exe23192;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe23192(GPOUT,229)
    out_c0_exe23192 <= c0_exe23192_reg_q;

    -- c0_exe24193_reg(REG,287)
    c0_exe24193_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe24193_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe24193_reg_q <= in_c0_exe24193;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe24193(GPOUT,230)
    out_c0_exe24193 <= c0_exe24193_reg_q;

    -- c0_exe25194_reg(REG,288)
    c0_exe25194_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe25194_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe25194_reg_q <= in_c0_exe25194;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe25194(GPOUT,231)
    out_c0_exe25194 <= c0_exe25194_reg_q;

    -- c0_exe26195_reg(REG,289)
    c0_exe26195_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe26195_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe26195_reg_q <= in_c0_exe26195;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe26195(GPOUT,232)
    out_c0_exe26195 <= c0_exe26195_reg_q;

    -- c0_exe27196_reg(REG,290)
    c0_exe27196_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe27196_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe27196_reg_q <= in_c0_exe27196;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe27196(GPOUT,233)
    out_c0_exe27196 <= c0_exe27196_reg_q;

    -- c0_exe28197_reg(REG,291)
    c0_exe28197_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe28197_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe28197_reg_q <= in_c0_exe28197;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe28197(GPOUT,234)
    out_c0_exe28197 <= c0_exe28197_reg_q;

    -- c0_exe29198_reg(REG,292)
    c0_exe29198_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe29198_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe29198_reg_q <= in_c0_exe29198;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe29198(GPOUT,235)
    out_c0_exe29198 <= c0_exe29198_reg_q;

    -- c0_exe30199_reg(REG,293)
    c0_exe30199_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe30199_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe30199_reg_q <= in_c0_exe30199;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe30199(GPOUT,236)
    out_c0_exe30199 <= c0_exe30199_reg_q;

    -- c0_exe31200_reg(REG,294)
    c0_exe31200_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe31200_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe31200_reg_q <= in_c0_exe31200;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe31200(GPOUT,237)
    out_c0_exe31200 <= c0_exe31200_reg_q;

    -- c0_exe3172_reg(REG,295)
    c0_exe3172_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe3172_reg_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe3172_reg_q <= in_c0_exe3172;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe3172(GPOUT,238)
    out_c0_exe3172 <= c0_exe3172_reg_q;

    -- c0_exe32201_reg(REG,296)
    c0_exe32201_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe32201_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe32201_reg_q <= in_c0_exe32201;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe32201(GPOUT,239)
    out_c0_exe32201 <= c0_exe32201_reg_q;

    -- c0_exe33202_reg(REG,297)
    c0_exe33202_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe33202_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe33202_reg_q <= in_c0_exe33202;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe33202(GPOUT,240)
    out_c0_exe33202 <= c0_exe33202_reg_q;

    -- c0_exe34203_reg(REG,298)
    c0_exe34203_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe34203_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe34203_reg_q <= in_c0_exe34203;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe34203(GPOUT,241)
    out_c0_exe34203 <= c0_exe34203_reg_q;

    -- c0_exe35204_reg(REG,299)
    c0_exe35204_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe35204_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe35204_reg_q <= in_c0_exe35204;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe35204(GPOUT,242)
    out_c0_exe35204 <= c0_exe35204_reg_q;

    -- c0_exe36205_reg(REG,300)
    c0_exe36205_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe36205_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe36205_reg_q <= in_c0_exe36205;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe36205(GPOUT,243)
    out_c0_exe36205 <= c0_exe36205_reg_q;

    -- c0_exe37206_reg(REG,301)
    c0_exe37206_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe37206_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe37206_reg_q <= in_c0_exe37206;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe37206(GPOUT,244)
    out_c0_exe37206 <= c0_exe37206_reg_q;

    -- c0_exe38207_reg(REG,302)
    c0_exe38207_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe38207_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe38207_reg_q <= in_c0_exe38207;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe38207(GPOUT,245)
    out_c0_exe38207 <= c0_exe38207_reg_q;

    -- c0_exe39208_reg(REG,303)
    c0_exe39208_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe39208_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe39208_reg_q <= in_c0_exe39208;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe39208(GPOUT,246)
    out_c0_exe39208 <= c0_exe39208_reg_q;

    -- c0_exe40209_reg(REG,304)
    c0_exe40209_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe40209_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe40209_reg_q <= in_c0_exe40209;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe40209(GPOUT,247)
    out_c0_exe40209 <= c0_exe40209_reg_q;

    -- c0_exe41210_reg(REG,305)
    c0_exe41210_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe41210_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe41210_reg_q <= in_c0_exe41210;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe41210(GPOUT,248)
    out_c0_exe41210 <= c0_exe41210_reg_q;

    -- c0_exe4173_reg(REG,306)
    c0_exe4173_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe4173_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe4173_reg_q <= in_c0_exe4173;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe4173(GPOUT,249)
    out_c0_exe4173 <= c0_exe4173_reg_q;

    -- c0_exe42211_reg(REG,307)
    c0_exe42211_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe42211_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe42211_reg_q <= in_c0_exe42211;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe42211(GPOUT,250)
    out_c0_exe42211 <= c0_exe42211_reg_q;

    -- c0_exe43212_reg(REG,308)
    c0_exe43212_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe43212_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe43212_reg_q <= in_c0_exe43212;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe43212(GPOUT,251)
    out_c0_exe43212 <= c0_exe43212_reg_q;

    -- c0_exe44213_reg(REG,309)
    c0_exe44213_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe44213_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe44213_reg_q <= in_c0_exe44213;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe44213(GPOUT,252)
    out_c0_exe44213 <= c0_exe44213_reg_q;

    -- c0_exe45214_reg(REG,310)
    c0_exe45214_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe45214_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe45214_reg_q <= in_c0_exe45214;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe45214(GPOUT,253)
    out_c0_exe45214 <= c0_exe45214_reg_q;

    -- c0_exe46215_reg(REG,311)
    c0_exe46215_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe46215_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe46215_reg_q <= in_c0_exe46215;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe46215(GPOUT,254)
    out_c0_exe46215 <= c0_exe46215_reg_q;

    -- c0_exe47216_reg(REG,312)
    c0_exe47216_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe47216_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe47216_reg_q <= in_c0_exe47216;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe47216(GPOUT,255)
    out_c0_exe47216 <= c0_exe47216_reg_q;

    -- c0_exe48217_reg(REG,313)
    c0_exe48217_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe48217_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe48217_reg_q <= in_c0_exe48217;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe48217(GPOUT,256)
    out_c0_exe48217 <= c0_exe48217_reg_q;

    -- c0_exe49218_reg(REG,314)
    c0_exe49218_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe49218_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe49218_reg_q <= in_c0_exe49218;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe49218(GPOUT,257)
    out_c0_exe49218 <= c0_exe49218_reg_q;

    -- c0_exe50219_reg(REG,315)
    c0_exe50219_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe50219_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe50219_reg_q <= in_c0_exe50219;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe50219(GPOUT,258)
    out_c0_exe50219 <= c0_exe50219_reg_q;

    -- c0_exe5174_reg(REG,316)
    c0_exe5174_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe5174_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe5174_reg_q <= in_c0_exe5174;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe5174(GPOUT,259)
    out_c0_exe5174 <= c0_exe5174_reg_q;

    -- c0_exe6175_reg(REG,317)
    c0_exe6175_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe6175_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe6175_reg_q <= in_c0_exe6175;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe6175(GPOUT,260)
    out_c0_exe6175 <= c0_exe6175_reg_q;

    -- c0_exe7176_reg(REG,318)
    c0_exe7176_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe7176_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe7176_reg_q <= in_c0_exe7176;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe7176(GPOUT,261)
    out_c0_exe7176 <= c0_exe7176_reg_q;

    -- c0_exe8177_reg(REG,319)
    c0_exe8177_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe8177_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe8177_reg_q <= in_c0_exe8177;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe8177(GPOUT,262)
    out_c0_exe8177 <= c0_exe8177_reg_q;

    -- c0_exe9178_reg(REG,320)
    c0_exe9178_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe9178_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                c0_exe9178_reg_q <= in_c0_exe9178;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe9178(GPOUT,263)
    out_c0_exe9178 <= c0_exe9178_reg_q;

    -- dag_node_pm_2_reg(REG,321)
    dag_node_pm_2_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            dag_node_pm_2_reg_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (ethash_calculate_dag_item_B5_branch_enable_q = "1") THEN
                dag_node_pm_2_reg_q <= in_dag_node_pm_2;
            END IF;
        END IF;
    END PROCESS;

    -- out_dag_node_pm_2(GPOUT,264)
    out_dag_node_pm_2 <= dag_node_pm_2_reg_q;

    -- ethash_calculate_dag_item_B5_branch_enable_not(LOGICAL,323)
    ethash_calculate_dag_item_B5_branch_enable_not_q <= not (ethash_calculate_dag_item_B5_branch_enable_q);

    -- out_stall_out(GPOUT,265)
    out_stall_out <= ethash_calculate_dag_item_B5_branch_enable_not_q;

    -- out_valid_out_0(GPOUT,266)
    out_valid_out_0 <= valid_0_reg_q;

    -- out_valid_out_1(GPOUT,267)
    out_valid_out_1 <= valid_1_reg_q;

END normal;
