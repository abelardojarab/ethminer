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

-- VHDL created from bb_ethash_calculate_dag_item_B2_stall_region
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

entity bb_ethash_calculate_dag_item_B2_stall_region is
    port (
        in_acl_hw_wg_id42 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe11222 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe115 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe21327 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit1118_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit1118_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit1118_2 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit1118_3 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_c0_exit1118_4 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit1118_5 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_c0_exit1118_6 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_7 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_8 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_9 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_10 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_11 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_12 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_13 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_14 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_15 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_16 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_17 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_18 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_19 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_20 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_21 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_22 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_23 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_24 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_25 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_26 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_27 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_28 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_29 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_30 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_31 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_32 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_33 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_34 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_35 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_36 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_37 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_38 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_39 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_40 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_41 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_42 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_43 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_44 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_45 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_46 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_47 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_48 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_49 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1118_50 : in std_logic_vector(31 downto 0);  -- ufix32
        in_dag_node_pm_017 : in std_logic_vector(1663 downto 0);  -- ufix1664
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
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_ethash_calculate_dag_item_B2_stall_region;

architecture normal of bb_ethash_calculate_dag_item_B2_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_pre693_pml_t_ethash_calculate_dag_item_sel_x_b : STD_LOGIC_VECTOR (127 downto 0);
    signal i_pre694_pml_t_ethash_calculate_dag_item_sel_x_b : STD_LOGIC_VECTOR (127 downto 0);
    signal i_pre695_pml_t_ethash_calculate_dag_item_sel_x_b : STD_LOGIC_VECTOR (127 downto 0);
    signal i_c0_exe3_ethash_calculate_dag_item_vt_const_1663_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_c0_exe3_ethash_calculate_dag_item_vt_join_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal i_c0_exe3_ethash_calculate_dag_item_vt_select_1535_b : STD_LOGIC_VECTOR (1535 downto 0);
    signal i_pre694_pml_s_ethash_calculate_dag_item_vt_const_1663_q : STD_LOGIC_VECTOR (255 downto 0);
    signal i_pre694_pml_s_ethash_calculate_dag_item_vt_join_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal i_pre694_pml_s_ethash_calculate_dag_item_vt_select_1407_b : STD_LOGIC_VECTOR (1407 downto 0);
    signal i_pre695_pml_s_ethash_calculate_dag_item_vt_const_1663_q : STD_LOGIC_VECTOR (383 downto 0);
    signal i_pre695_pml_s_ethash_calculate_dag_item_vt_join_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal i_pre695_pml_s_ethash_calculate_dag_item_vt_select_1279_b : STD_LOGIC_VECTOR (1279 downto 0);
    signal rightShiftStage0Idx1_uid59_i_pre694_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item254_shift_x_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal rightShiftStage0_uid61_i_pre694_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item254_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid61_i_pre694_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item254_shift_x_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal rightShiftStage1Idx1Rng128_uid71_i_pre695_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item256_shift_x_b : STD_LOGIC_VECTOR (1535 downto 0);
    signal rightShiftStage1Idx1_uid73_i_pre695_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item256_shift_x_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal rightShiftStage1_uid75_i_pre695_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item256_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage1_uid75_i_pre695_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item256_shift_x_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal i_pre693_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item253_pre693_pml_t_bitcast_select_0_x_merged_bit_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_pre693_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item253_pre693_pml_t_bitcast_select_0_x_merged_bit_select_c : STD_LOGIC_VECTOR (31 downto 0);
    signal i_pre693_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item253_pre693_pml_t_bitcast_select_0_x_merged_bit_select_d : STD_LOGIC_VECTOR (31 downto 0);
    signal i_pre693_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item253_pre693_pml_t_bitcast_select_0_x_merged_bit_select_e : STD_LOGIC_VECTOR (31 downto 0);
    signal i_pre694_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item255_pre694_pml_t_bitcast_select_0_x_merged_bit_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_pre694_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item255_pre694_pml_t_bitcast_select_0_x_merged_bit_select_c : STD_LOGIC_VECTOR (31 downto 0);
    signal i_pre694_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item255_pre694_pml_t_bitcast_select_0_x_merged_bit_select_d : STD_LOGIC_VECTOR (31 downto 0);
    signal i_pre694_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item255_pre694_pml_t_bitcast_select_0_x_merged_bit_select_e : STD_LOGIC_VECTOR (31 downto 0);
    signal i_pre695_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item257_pre695_pml_t_bitcast_select_0_x_merged_bit_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_pre695_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item257_pre695_pml_t_bitcast_select_0_x_merged_bit_select_c : STD_LOGIC_VECTOR (31 downto 0);
    signal i_pre695_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item257_pre695_pml_t_bitcast_select_0_x_merged_bit_select_d : STD_LOGIC_VECTOR (31 downto 0);
    signal i_pre695_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item257_pre695_pml_t_bitcast_select_0_x_merged_bit_select_e : STD_LOGIC_VECTOR (31 downto 0);
    signal i_pre_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item252_pre_pml_t_bitcast_select_0_x_merged_bit_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_pre_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item252_pre_pml_t_bitcast_select_0_x_merged_bit_select_c : STD_LOGIC_VECTOR (31 downto 0);
    signal i_pre_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item252_pre_pml_t_bitcast_select_0_x_merged_bit_select_d : STD_LOGIC_VECTOR (31 downto 0);
    signal i_pre_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item252_pre_pml_t_bitcast_select_0_x_merged_bit_select_e : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0Idx1Rng256_uid57_i_pre694_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item254_shift_x_merged_bit_select_b : STD_LOGIC_VECTOR (1407 downto 0);
    signal rightShiftStage0Idx1Rng256_uid57_i_pre694_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item254_shift_x_merged_bit_select_c : STD_LOGIC_VECTOR (127 downto 0);
    signal bubble_join_stall_entry_aunroll_q : STD_LOGIC_VECTOR (3393 downto 0);
    signal bubble_select_stall_entry_aunroll_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_c : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_aunroll_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_e : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_aunroll_f : STD_LOGIC_VECTOR (1663 downto 0);
    signal bubble_select_stall_entry_aunroll_g : STD_LOGIC_VECTOR (1663 downto 0);
    signal SE_stall_entry_aunroll_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_V0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- SE_stall_entry_aunroll(STALLENABLE,97)
    -- Valid signal propagation
    SE_stall_entry_aunroll_V0 <= SE_stall_entry_aunroll_wireValid;
    -- Backward Stall generation
    SE_stall_entry_aunroll_backStall <= in_stall_in or not (SE_stall_entry_aunroll_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_aunroll_wireValid <= in_valid_in;

    -- rightShiftStage0Idx1Rng256_uid57_i_pre694_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item254_shift_x_merged_bit_select(BITSELECT,84)@0
    rightShiftStage0Idx1Rng256_uid57_i_pre694_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item254_shift_x_merged_bit_select_b <= bubble_select_stall_entry_aunroll_g(1663 downto 256);
    rightShiftStage0Idx1Rng256_uid57_i_pre694_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item254_shift_x_merged_bit_select_c <= bubble_select_stall_entry_aunroll_g(127 downto 0);

    -- i_pre_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item252_pre_pml_t_bitcast_select_0_x_merged_bit_select(BITSELECT,83)@0
    i_pre_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item252_pre_pml_t_bitcast_select_0_x_merged_bit_select_b <= rightShiftStage0Idx1Rng256_uid57_i_pre694_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item254_shift_x_merged_bit_select_c(31 downto 0);
    i_pre_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item252_pre_pml_t_bitcast_select_0_x_merged_bit_select_c <= rightShiftStage0Idx1Rng256_uid57_i_pre694_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item254_shift_x_merged_bit_select_c(63 downto 32);
    i_pre_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item252_pre_pml_t_bitcast_select_0_x_merged_bit_select_d <= rightShiftStage0Idx1Rng256_uid57_i_pre694_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item254_shift_x_merged_bit_select_c(95 downto 64);
    i_pre_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item252_pre_pml_t_bitcast_select_0_x_merged_bit_select_e <= rightShiftStage0Idx1Rng256_uid57_i_pre694_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item254_shift_x_merged_bit_select_c(127 downto 96);

    -- i_pre695_pml_s_ethash_calculate_dag_item_vt_const_1663(CONSTANT,44)
    i_pre695_pml_s_ethash_calculate_dag_item_vt_const_1663_q <= "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

    -- i_c0_exe3_ethash_calculate_dag_item_vt_const_1663(CONSTANT,36)
    i_c0_exe3_ethash_calculate_dag_item_vt_const_1663_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

    -- rightShiftStage1Idx1Rng128_uid71_i_pre695_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item256_shift_x(BITSELECT,70)@0
    rightShiftStage1Idx1Rng128_uid71_i_pre695_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item256_shift_x_b <= rightShiftStage0_uid61_i_pre694_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item254_shift_x_q(1663 downto 128);

    -- rightShiftStage1Idx1_uid73_i_pre695_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item256_shift_x(BITJOIN,72)@0
    rightShiftStage1Idx1_uid73_i_pre695_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item256_shift_x_q <= i_c0_exe3_ethash_calculate_dag_item_vt_const_1663_q & rightShiftStage1Idx1Rng128_uid71_i_pre695_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item256_shift_x_b;

    -- i_pre694_pml_s_ethash_calculate_dag_item_vt_const_1663(CONSTANT,40)
    i_pre694_pml_s_ethash_calculate_dag_item_vt_const_1663_q <= "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

    -- rightShiftStage0Idx1_uid59_i_pre694_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item254_shift_x(BITJOIN,58)@0
    rightShiftStage0Idx1_uid59_i_pre694_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item254_shift_x_q <= i_pre694_pml_s_ethash_calculate_dag_item_vt_const_1663_q & rightShiftStage0Idx1Rng256_uid57_i_pre694_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item254_shift_x_merged_bit_select_b;

    -- rightShiftStage0_uid61_i_pre694_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item254_shift_x(MUX,60)@0
    rightShiftStage0_uid61_i_pre694_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item254_shift_x_s <= VCC_q;
    rightShiftStage0_uid61_i_pre694_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item254_shift_x_combproc: PROCESS (rightShiftStage0_uid61_i_pre694_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item254_shift_x_s, bubble_select_stall_entry_aunroll_g, rightShiftStage0Idx1_uid59_i_pre694_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item254_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid61_i_pre694_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item254_shift_x_s) IS
            WHEN "0" => rightShiftStage0_uid61_i_pre694_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item254_shift_x_q <= bubble_select_stall_entry_aunroll_g;
            WHEN "1" => rightShiftStage0_uid61_i_pre694_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item254_shift_x_q <= rightShiftStage0Idx1_uid59_i_pre694_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item254_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid61_i_pre694_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item254_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- rightShiftStage1_uid75_i_pre695_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item256_shift_x(MUX,74)@0
    rightShiftStage1_uid75_i_pre695_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item256_shift_x_s <= VCC_q;
    rightShiftStage1_uid75_i_pre695_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item256_shift_x_combproc: PROCESS (rightShiftStage1_uid75_i_pre695_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item256_shift_x_s, rightShiftStage0_uid61_i_pre694_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item254_shift_x_q, rightShiftStage1Idx1_uid73_i_pre695_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item256_shift_x_q)
    BEGIN
        CASE (rightShiftStage1_uid75_i_pre695_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item256_shift_x_s) IS
            WHEN "0" => rightShiftStage1_uid75_i_pre695_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item256_shift_x_q <= rightShiftStage0_uid61_i_pre694_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item254_shift_x_q;
            WHEN "1" => rightShiftStage1_uid75_i_pre695_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item256_shift_x_q <= rightShiftStage1Idx1_uid73_i_pre695_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item256_shift_x_q;
            WHEN OTHERS => rightShiftStage1_uid75_i_pre695_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item256_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_pre695_pml_s_ethash_calculate_dag_item_vt_select_1279(BITSELECT,46)@0
    i_pre695_pml_s_ethash_calculate_dag_item_vt_select_1279_b <= rightShiftStage1_uid75_i_pre695_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item256_shift_x_q(1279 downto 0);

    -- i_pre695_pml_s_ethash_calculate_dag_item_vt_join(BITJOIN,45)@0
    i_pre695_pml_s_ethash_calculate_dag_item_vt_join_q <= i_pre695_pml_s_ethash_calculate_dag_item_vt_const_1663_q & i_pre695_pml_s_ethash_calculate_dag_item_vt_select_1279_b;

    -- i_pre695_pml_t_ethash_calculate_dag_item_sel_x(BITSELECT,26)@0
    i_pre695_pml_t_ethash_calculate_dag_item_sel_x_b <= i_pre695_pml_s_ethash_calculate_dag_item_vt_join_q(127 downto 0);

    -- i_pre695_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item257_pre695_pml_t_bitcast_select_0_x_merged_bit_select(BITSELECT,82)@0
    i_pre695_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item257_pre695_pml_t_bitcast_select_0_x_merged_bit_select_b <= i_pre695_pml_t_ethash_calculate_dag_item_sel_x_b(31 downto 0);
    i_pre695_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item257_pre695_pml_t_bitcast_select_0_x_merged_bit_select_c <= i_pre695_pml_t_ethash_calculate_dag_item_sel_x_b(63 downto 32);
    i_pre695_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item257_pre695_pml_t_bitcast_select_0_x_merged_bit_select_d <= i_pre695_pml_t_ethash_calculate_dag_item_sel_x_b(95 downto 64);
    i_pre695_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item257_pre695_pml_t_bitcast_select_0_x_merged_bit_select_e <= i_pre695_pml_t_ethash_calculate_dag_item_sel_x_b(127 downto 96);

    -- i_pre694_pml_s_ethash_calculate_dag_item_vt_select_1407(BITSELECT,42)@0
    i_pre694_pml_s_ethash_calculate_dag_item_vt_select_1407_b <= rightShiftStage0_uid61_i_pre694_pml_s_ethash_calculate_dag_item_ethash_calculate_dag_item254_shift_x_q(1407 downto 0);

    -- i_pre694_pml_s_ethash_calculate_dag_item_vt_join(BITJOIN,41)@0
    i_pre694_pml_s_ethash_calculate_dag_item_vt_join_q <= i_pre694_pml_s_ethash_calculate_dag_item_vt_const_1663_q & i_pre694_pml_s_ethash_calculate_dag_item_vt_select_1407_b;

    -- i_pre694_pml_t_ethash_calculate_dag_item_sel_x(BITSELECT,17)@0
    i_pre694_pml_t_ethash_calculate_dag_item_sel_x_b <= i_pre694_pml_s_ethash_calculate_dag_item_vt_join_q(127 downto 0);

    -- i_pre694_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item255_pre694_pml_t_bitcast_select_0_x_merged_bit_select(BITSELECT,81)@0
    i_pre694_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item255_pre694_pml_t_bitcast_select_0_x_merged_bit_select_b <= i_pre694_pml_t_ethash_calculate_dag_item_sel_x_b(31 downto 0);
    i_pre694_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item255_pre694_pml_t_bitcast_select_0_x_merged_bit_select_c <= i_pre694_pml_t_ethash_calculate_dag_item_sel_x_b(63 downto 32);
    i_pre694_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item255_pre694_pml_t_bitcast_select_0_x_merged_bit_select_d <= i_pre694_pml_t_ethash_calculate_dag_item_sel_x_b(95 downto 64);
    i_pre694_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item255_pre694_pml_t_bitcast_select_0_x_merged_bit_select_e <= i_pre694_pml_t_ethash_calculate_dag_item_sel_x_b(127 downto 96);

    -- i_c0_exe3_ethash_calculate_dag_item_vt_select_1535(BITSELECT,38)@0
    i_c0_exe3_ethash_calculate_dag_item_vt_select_1535_b <= bubble_select_stall_entry_aunroll_f(1535 downto 0);

    -- i_c0_exe3_ethash_calculate_dag_item_vt_join(BITJOIN,37)@0
    i_c0_exe3_ethash_calculate_dag_item_vt_join_q <= i_c0_exe3_ethash_calculate_dag_item_vt_const_1663_q & i_c0_exe3_ethash_calculate_dag_item_vt_select_1535_b;

    -- i_pre693_pml_t_ethash_calculate_dag_item_sel_x(BITSELECT,8)@0
    i_pre693_pml_t_ethash_calculate_dag_item_sel_x_b <= i_c0_exe3_ethash_calculate_dag_item_vt_join_q(127 downto 0);

    -- i_pre693_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item253_pre693_pml_t_bitcast_select_0_x_merged_bit_select(BITSELECT,80)@0
    i_pre693_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item253_pre693_pml_t_bitcast_select_0_x_merged_bit_select_b <= i_pre693_pml_t_ethash_calculate_dag_item_sel_x_b(31 downto 0);
    i_pre693_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item253_pre693_pml_t_bitcast_select_0_x_merged_bit_select_c <= i_pre693_pml_t_ethash_calculate_dag_item_sel_x_b(63 downto 32);
    i_pre693_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item253_pre693_pml_t_bitcast_select_0_x_merged_bit_select_d <= i_pre693_pml_t_ethash_calculate_dag_item_sel_x_b(95 downto 64);
    i_pre693_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item253_pre693_pml_t_bitcast_select_0_x_merged_bit_select_e <= i_pre693_pml_t_ethash_calculate_dag_item_sel_x_b(127 downto 96);

    -- bubble_join_stall_entry_aunroll(BITJOIN,86)
    bubble_join_stall_entry_aunroll_q <= in_dag_node_pm_017 & in_c0_exit1118_3 & in_c0_exe21327 & in_c0_exe115 & in_c0_exe11222 & in_acl_hw_wg_id42;

    -- bubble_select_stall_entry_aunroll(BITSELECT,87)
    bubble_select_stall_entry_aunroll_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(31 downto 0));
    bubble_select_stall_entry_aunroll_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(32 downto 32));
    bubble_select_stall_entry_aunroll_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(64 downto 33));
    bubble_select_stall_entry_aunroll_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(65 downto 65));
    bubble_select_stall_entry_aunroll_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(1729 downto 66));
    bubble_select_stall_entry_aunroll_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(3393 downto 1730));

    -- dupName_0_sync_out_x(GPOUT,3)@0
    out_acl_hw_wg_id42 <= bubble_select_stall_entry_aunroll_b;
    out_c0_exe11222 <= bubble_select_stall_entry_aunroll_c;
    out_c0_exe115 <= bubble_select_stall_entry_aunroll_d;
    out_c0_exe21327 <= bubble_select_stall_entry_aunroll_e;
    out_dag_node_pm_017 <= bubble_select_stall_entry_aunroll_g;
    out_pre693_pml_t_bitcast_0 <= i_pre693_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item253_pre693_pml_t_bitcast_select_0_x_merged_bit_select_b;
    out_pre693_pml_t_bitcast_1 <= i_pre693_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item253_pre693_pml_t_bitcast_select_0_x_merged_bit_select_c;
    out_pre693_pml_t_bitcast_2 <= i_pre693_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item253_pre693_pml_t_bitcast_select_0_x_merged_bit_select_d;
    out_pre693_pml_t_bitcast_3 <= i_pre693_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item253_pre693_pml_t_bitcast_select_0_x_merged_bit_select_e;
    out_pre694_pml_t_bitcast_0 <= i_pre694_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item255_pre694_pml_t_bitcast_select_0_x_merged_bit_select_b;
    out_pre694_pml_t_bitcast_1 <= i_pre694_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item255_pre694_pml_t_bitcast_select_0_x_merged_bit_select_c;
    out_pre694_pml_t_bitcast_2 <= i_pre694_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item255_pre694_pml_t_bitcast_select_0_x_merged_bit_select_d;
    out_pre694_pml_t_bitcast_3 <= i_pre694_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item255_pre694_pml_t_bitcast_select_0_x_merged_bit_select_e;
    out_pre695_pml_t_bitcast_0 <= i_pre695_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item257_pre695_pml_t_bitcast_select_0_x_merged_bit_select_b;
    out_pre695_pml_t_bitcast_1 <= i_pre695_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item257_pre695_pml_t_bitcast_select_0_x_merged_bit_select_c;
    out_pre695_pml_t_bitcast_2 <= i_pre695_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item257_pre695_pml_t_bitcast_select_0_x_merged_bit_select_d;
    out_pre695_pml_t_bitcast_3 <= i_pre695_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item257_pre695_pml_t_bitcast_select_0_x_merged_bit_select_e;
    out_pre_pml_t_bitcast_0 <= i_pre_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item252_pre_pml_t_bitcast_select_0_x_merged_bit_select_b;
    out_pre_pml_t_bitcast_1 <= i_pre_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item252_pre_pml_t_bitcast_select_0_x_merged_bit_select_c;
    out_pre_pml_t_bitcast_2 <= i_pre_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item252_pre_pml_t_bitcast_select_0_x_merged_bit_select_d;
    out_pre_pml_t_bitcast_3 <= i_pre_pml_t_bitcast_ethash_calculate_dag_item_ethash_calculate_dag_item252_pre_pml_t_bitcast_select_0_x_merged_bit_select_e;
    out_valid_out <= SE_stall_entry_aunroll_V0;

    -- sync_out(GPOUT,52)@0
    out_stall_out <= SE_stall_entry_aunroll_backStall;

END normal;
