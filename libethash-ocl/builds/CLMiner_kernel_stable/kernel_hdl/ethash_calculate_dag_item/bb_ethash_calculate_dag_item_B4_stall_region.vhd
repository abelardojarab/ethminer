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

-- VHDL created from bb_ethash_calculate_dag_item_B4_stall_region
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

entity bb_ethash_calculate_dag_item_B4_stall_region is
    port (
        in_acl_hw_wg_id40 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe11220 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe113 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe21325 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe1031 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe1132 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe129 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe1533 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe1634 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe2035 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_c1_exe230 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit28_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_4 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_5 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_6 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_7 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_8 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_9 : in std_logic_vector(127 downto 0);  -- ufix128
        in_c1_exit28_10 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_11 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_12 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_13 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_14 : in std_logic_vector(127 downto 0);  -- ufix128
        in_c1_exit28_15 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_16 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_17 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_18 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit28_19 : in std_logic_vector(127 downto 0);  -- ufix128
        in_c1_exit28_20 : in std_logic_vector(1663 downto 0);  -- ufix1664
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
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_ethash_calculate_dag_item_B4_stall_region;

architecture normal of bb_ethash_calculate_dag_item_B4_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_ethash_calculate_dag_item348_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_unnamed_ethash_calculate_dag_item349_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_unnamed_ethash_calculate_dag_item350_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal c_i1664_123665200736552267043659068439766192117139699548811766084510893867041005930989495028879964560695069471600710011174973097365714375339861655837526960362893153904737035080433664_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal c_i1664_44462416477094044620016814065517364315819234512137839319418223093753683069769152238984782576173969417485953521141049383745107056455283979316385016701612810119562585078620415976730705698345087039035930761275083827265405596065418173652685035788898113991627042329246850314029877161622487411877779578892097029690461532001915311366849061134218949608898309803267515444168740883382082347292091144374843000979886753412839969023769104988783743286325443195934492676727024387349726977358561281_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal i_dag_node_pm_pms_dl1236_pms_dm_ethash_calculate_dag_item_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal i_dag_node_pm_pms_dl1236_pms_dm_ethash_calculate_dag_item_vt_const_1599_q : STD_LOGIC_VECTOR (1087 downto 0);
    signal i_dag_node_pm_pms_dl1236_pms_dm_ethash_calculate_dag_item_vt_join_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal i_pms_cs1241_pms_vs_pms_vm_pms_d_ethash_calculate_dag_item_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal i_pms_cs1241_pms_vs_pms_vm_pms_d_ethash_calculate_dag_item_vt_const_1599_q : STD_LOGIC_VECTOR (1087 downto 0);
    signal i_pms_cs1241_pms_vs_pms_vm_pms_d_ethash_calculate_dag_item_vt_join_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal i_unnamed_ethash_calculate_dag_item342_vt_const_127_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_unnamed_ethash_calculate_dag_item342_vt_join_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_unnamed_ethash_calculate_dag_item342_vt_select_63_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_unnamed_ethash_calculate_dag_item344_vt_join_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_unnamed_ethash_calculate_dag_item344_vt_select_63_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_unnamed_ethash_calculate_dag_item346_vt_join_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_unnamed_ethash_calculate_dag_item346_vt_select_63_b : STD_LOGIC_VECTOR (63 downto 0);
    signal rightShiftStage0Idx1Rng64_uid60_i_unnamed_ethash_calculate_dag_item343_shift_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal rightShiftStage0Idx1_uid62_i_unnamed_ethash_calculate_dag_item343_shift_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal rightShiftStage0_uid64_i_unnamed_ethash_calculate_dag_item343_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid64_i_unnamed_ethash_calculate_dag_item343_shift_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal rightShiftStage0Idx1Rng64_uid69_i_unnamed_ethash_calculate_dag_item345_shift_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal rightShiftStage0Idx1_uid71_i_unnamed_ethash_calculate_dag_item345_shift_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal rightShiftStage0_uid73_i_unnamed_ethash_calculate_dag_item345_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid73_i_unnamed_ethash_calculate_dag_item345_shift_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal rightShiftStage0Idx1Rng64_uid78_i_unnamed_ethash_calculate_dag_item347_shift_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal rightShiftStage0Idx1_uid80_i_unnamed_ethash_calculate_dag_item347_shift_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal rightShiftStage0_uid82_i_unnamed_ethash_calculate_dag_item347_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid82_i_unnamed_ethash_calculate_dag_item347_shift_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_unnamed_ethash_calculate_dag_item352_unnamed_ethash_calculate_dag_item9_select_0_x_merged_bit_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_ethash_calculate_dag_item352_unnamed_ethash_calculate_dag_item9_select_0_x_merged_bit_select_c : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_ethash_calculate_dag_item354_unnamed_ethash_calculate_dag_item11_select_0_x_merged_bit_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_ethash_calculate_dag_item354_unnamed_ethash_calculate_dag_item11_select_0_x_merged_bit_select_c : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_ethash_calculate_dag_item356_unnamed_ethash_calculate_dag_item13_select_0_x_merged_bit_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_ethash_calculate_dag_item356_unnamed_ethash_calculate_dag_item13_select_0_x_merged_bit_select_c : STD_LOGIC_VECTOR (31 downto 0);
    signal i_dag_node_pm_pms_dl1236_pms_dm_ethash_calculate_dag_item_vt_select_1663_merged_bit_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_dag_node_pm_pms_dl1236_pms_dm_ethash_calculate_dag_item_vt_select_1663_merged_bit_select_c : STD_LOGIC_VECTOR (511 downto 0);
    signal i_pms_cs1241_pms_vs_pms_vm_pms_d_ethash_calculate_dag_item_vt_select_1663_merged_bit_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_pms_cs1241_pms_vs_pms_vm_pms_d_ethash_calculate_dag_item_vt_select_1663_merged_bit_select_c : STD_LOGIC_VECTOR (511 downto 0);
    signal bubble_join_stall_entry_aunroll_q : STD_LOGIC_VECTOR (2305 downto 0);
    signal bubble_select_stall_entry_aunroll_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_c : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_aunroll_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_e : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_aunroll_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_h : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_i : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_j : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_k : STD_LOGIC_VECTOR (1663 downto 0);
    signal bubble_select_stall_entry_aunroll_l : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_m : STD_LOGIC_VECTOR (127 downto 0);
    signal bubble_select_stall_entry_aunroll_n : STD_LOGIC_VECTOR (127 downto 0);
    signal bubble_select_stall_entry_aunroll_o : STD_LOGIC_VECTOR (127 downto 0);
    signal SE_stall_entry_aunroll_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_V0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- SE_stall_entry_aunroll(STALLENABLE,107)
    -- Valid signal propagation
    SE_stall_entry_aunroll_V0 <= SE_stall_entry_aunroll_wireValid;
    -- Backward Stall generation
    SE_stall_entry_aunroll_backStall <= in_stall_in or not (SE_stall_entry_aunroll_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_aunroll_wireValid <= in_valid_in;

    -- i_pms_cs1241_pms_vs_pms_vm_pms_d_ethash_calculate_dag_item_vt_const_1599(CONSTANT,36)
    i_pms_cs1241_pms_vs_pms_vm_pms_d_ethash_calculate_dag_item_vt_const_1599_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000001";

    -- c_i1664_123665200736552267043659068439766192117139699548811766084510893867041005930989495028879964560695069471600710011174973097365714375339861655837526960362893153904737035080433664(CONSTANT,26)
    c_i1664_123665200736552267043659068439766192117139699548811766084510893867041005930989495028879964560695069471600710011174973097365714375339861655837526960362893153904737035080433664_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

    -- i_dag_node_pm_pms_dl1236_pms_dm_ethash_calculate_dag_item_vt_const_1599(CONSTANT,31)
    i_dag_node_pm_pms_dl1236_pms_dm_ethash_calculate_dag_item_vt_const_1599_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

    -- c_i1664_44462416477094044620016814065517364315819234512137839319418223093753683069769152238984782576173969417485953521141049383745107056455283979316385016701612810119562585078620415976730705698345087039035930761275083827265405596065418173652685035788898113991627042329246850314029877161622487411877779578892097029690461532001915311366849061134218949608898309803267515444168740883382082347292091144374843000979886753412839969023769104988783743286325443195934492676727024387349726977358561281(CONSTANT,27)
    c_i1664_44462416477094044620016814065517364315819234512137839319418223093753683069769152238984782576173969417485953521141049383745107056455283979316385016701612810119562585078620415976730705698345087039035930761275083827265405596065418173652685035788898113991627042329246850314029877161622487411877779578892097029690461532001915311366849061134218949608898309803267515444168740883382082347292091144374843000979886753412839969023769104988783743286325443195934492676727024387349726977358561281_q <= "11111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111";

    -- i_dag_node_pm_pms_dl1236_pms_dm_ethash_calculate_dag_item(LOGICAL,30)@0
    i_dag_node_pm_pms_dl1236_pms_dm_ethash_calculate_dag_item_q <= bubble_select_stall_entry_aunroll_k and c_i1664_44462416477094044620016814065517364315819234512137839319418223093753683069769152238984782576173969417485953521141049383745107056455283979316385016701612810119562585078620415976730705698345087039035930761275083827265405596065418173652685035788898113991627042329246850314029877161622487411877779578892097029690461532001915311366849061134218949608898309803267515444168740883382082347292091144374843000979886753412839969023769104988783743286325443195934492676727024387349726977358561281_q;

    -- i_dag_node_pm_pms_dl1236_pms_dm_ethash_calculate_dag_item_vt_select_1663_merged_bit_select(BITSELECT,89)@0
    i_dag_node_pm_pms_dl1236_pms_dm_ethash_calculate_dag_item_vt_select_1663_merged_bit_select_b <= i_dag_node_pm_pms_dl1236_pms_dm_ethash_calculate_dag_item_q(1663 downto 1600);
    i_dag_node_pm_pms_dl1236_pms_dm_ethash_calculate_dag_item_vt_select_1663_merged_bit_select_c <= i_dag_node_pm_pms_dl1236_pms_dm_ethash_calculate_dag_item_q(511 downto 0);

    -- i_dag_node_pm_pms_dl1236_pms_dm_ethash_calculate_dag_item_vt_join(BITJOIN,32)@0
    i_dag_node_pm_pms_dl1236_pms_dm_ethash_calculate_dag_item_vt_join_q <= i_dag_node_pm_pms_dl1236_pms_dm_ethash_calculate_dag_item_vt_select_1663_merged_bit_select_b & i_dag_node_pm_pms_dl1236_pms_dm_ethash_calculate_dag_item_vt_const_1599_q & i_dag_node_pm_pms_dl1236_pms_dm_ethash_calculate_dag_item_vt_select_1663_merged_bit_select_c;

    -- i_pms_cs1241_pms_vs_pms_vm_pms_d_ethash_calculate_dag_item(LOGICAL,35)@0
    i_pms_cs1241_pms_vs_pms_vm_pms_d_ethash_calculate_dag_item_q <= i_dag_node_pm_pms_dl1236_pms_dm_ethash_calculate_dag_item_vt_join_q or c_i1664_123665200736552267043659068439766192117139699548811766084510893867041005930989495028879964560695069471600710011174973097365714375339861655837526960362893153904737035080433664_q;

    -- i_pms_cs1241_pms_vs_pms_vm_pms_d_ethash_calculate_dag_item_vt_select_1663_merged_bit_select(BITSELECT,90)@0
    i_pms_cs1241_pms_vs_pms_vm_pms_d_ethash_calculate_dag_item_vt_select_1663_merged_bit_select_b <= i_pms_cs1241_pms_vs_pms_vm_pms_d_ethash_calculate_dag_item_q(1663 downto 1600);
    i_pms_cs1241_pms_vs_pms_vm_pms_d_ethash_calculate_dag_item_vt_select_1663_merged_bit_select_c <= i_pms_cs1241_pms_vs_pms_vm_pms_d_ethash_calculate_dag_item_q(511 downto 0);

    -- i_pms_cs1241_pms_vs_pms_vm_pms_d_ethash_calculate_dag_item_vt_join(BITJOIN,37)@0
    i_pms_cs1241_pms_vs_pms_vm_pms_d_ethash_calculate_dag_item_vt_join_q <= i_pms_cs1241_pms_vs_pms_vm_pms_d_ethash_calculate_dag_item_vt_select_1663_merged_bit_select_b & i_pms_cs1241_pms_vs_pms_vm_pms_d_ethash_calculate_dag_item_vt_const_1599_q & i_pms_cs1241_pms_vs_pms_vm_pms_d_ethash_calculate_dag_item_vt_select_1663_merged_bit_select_c;

    -- bubble_join_stall_entry_aunroll(BITJOIN,92)
    bubble_join_stall_entry_aunroll_q <= in_c1_exit28_19 & in_c1_exit28_14 & in_c1_exit28_9 & in_c1_exe230 & in_c1_exe2035 & in_c1_exe1634 & in_c1_exe1533 & in_c1_exe129 & in_c1_exe1132 & in_c1_exe1031 & in_c0_exe21325 & in_c0_exe113 & in_c0_exe11220 & in_acl_hw_wg_id40;

    -- bubble_select_stall_entry_aunroll(BITSELECT,93)
    bubble_select_stall_entry_aunroll_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(31 downto 0));
    bubble_select_stall_entry_aunroll_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(32 downto 32));
    bubble_select_stall_entry_aunroll_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(64 downto 33));
    bubble_select_stall_entry_aunroll_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(65 downto 65));
    bubble_select_stall_entry_aunroll_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(97 downto 66));
    bubble_select_stall_entry_aunroll_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(129 downto 98));
    bubble_select_stall_entry_aunroll_h <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(161 downto 130));
    bubble_select_stall_entry_aunroll_i <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(193 downto 162));
    bubble_select_stall_entry_aunroll_j <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(225 downto 194));
    bubble_select_stall_entry_aunroll_k <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(1889 downto 226));
    bubble_select_stall_entry_aunroll_l <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(1921 downto 1890));
    bubble_select_stall_entry_aunroll_m <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(2049 downto 1922));
    bubble_select_stall_entry_aunroll_n <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(2177 downto 2050));
    bubble_select_stall_entry_aunroll_o <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(2305 downto 2178));

    -- i_unnamed_ethash_calculate_dag_item342_vt_const_127(CONSTANT,40)
    i_unnamed_ethash_calculate_dag_item342_vt_const_127_q <= "0000000000000000000000000000000000000000000000000000000000000000";

    -- rightShiftStage0Idx1Rng64_uid78_i_unnamed_ethash_calculate_dag_item347_shift_x(BITSELECT,77)@0
    rightShiftStage0Idx1Rng64_uid78_i_unnamed_ethash_calculate_dag_item347_shift_x_b <= bubble_select_stall_entry_aunroll_n(127 downto 64);

    -- rightShiftStage0Idx1_uid80_i_unnamed_ethash_calculate_dag_item347_shift_x(BITJOIN,79)@0
    rightShiftStage0Idx1_uid80_i_unnamed_ethash_calculate_dag_item347_shift_x_q <= i_unnamed_ethash_calculate_dag_item342_vt_const_127_q & rightShiftStage0Idx1Rng64_uid78_i_unnamed_ethash_calculate_dag_item347_shift_x_b;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- rightShiftStage0_uid82_i_unnamed_ethash_calculate_dag_item347_shift_x(MUX,81)@0
    rightShiftStage0_uid82_i_unnamed_ethash_calculate_dag_item347_shift_x_s <= VCC_q;
    rightShiftStage0_uid82_i_unnamed_ethash_calculate_dag_item347_shift_x_combproc: PROCESS (rightShiftStage0_uid82_i_unnamed_ethash_calculate_dag_item347_shift_x_s, bubble_select_stall_entry_aunroll_n, rightShiftStage0Idx1_uid80_i_unnamed_ethash_calculate_dag_item347_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid82_i_unnamed_ethash_calculate_dag_item347_shift_x_s) IS
            WHEN "0" => rightShiftStage0_uid82_i_unnamed_ethash_calculate_dag_item347_shift_x_q <= bubble_select_stall_entry_aunroll_n;
            WHEN "1" => rightShiftStage0_uid82_i_unnamed_ethash_calculate_dag_item347_shift_x_q <= rightShiftStage0Idx1_uid80_i_unnamed_ethash_calculate_dag_item347_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid82_i_unnamed_ethash_calculate_dag_item347_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_unnamed_ethash_calculate_dag_item346_vt_select_63(BITSELECT,48)@0
    i_unnamed_ethash_calculate_dag_item346_vt_select_63_b <= rightShiftStage0_uid82_i_unnamed_ethash_calculate_dag_item347_shift_x_q(63 downto 0);

    -- i_unnamed_ethash_calculate_dag_item346_vt_join(BITJOIN,47)@0
    i_unnamed_ethash_calculate_dag_item346_vt_join_q <= i_unnamed_ethash_calculate_dag_item342_vt_const_127_q & i_unnamed_ethash_calculate_dag_item346_vt_select_63_b;

    -- i_unnamed_ethash_calculate_dag_item350_sel_x(BITSELECT,18)@0
    i_unnamed_ethash_calculate_dag_item350_sel_x_b <= i_unnamed_ethash_calculate_dag_item346_vt_join_q(63 downto 0);

    -- i_unnamed_ethash_calculate_dag_item356_unnamed_ethash_calculate_dag_item13_select_0_x_merged_bit_select(BITSELECT,88)@0
    i_unnamed_ethash_calculate_dag_item356_unnamed_ethash_calculate_dag_item13_select_0_x_merged_bit_select_b <= i_unnamed_ethash_calculate_dag_item350_sel_x_b(31 downto 0);
    i_unnamed_ethash_calculate_dag_item356_unnamed_ethash_calculate_dag_item13_select_0_x_merged_bit_select_c <= i_unnamed_ethash_calculate_dag_item350_sel_x_b(63 downto 32);

    -- rightShiftStage0Idx1Rng64_uid69_i_unnamed_ethash_calculate_dag_item345_shift_x(BITSELECT,68)@0
    rightShiftStage0Idx1Rng64_uid69_i_unnamed_ethash_calculate_dag_item345_shift_x_b <= bubble_select_stall_entry_aunroll_o(127 downto 64);

    -- rightShiftStage0Idx1_uid71_i_unnamed_ethash_calculate_dag_item345_shift_x(BITJOIN,70)@0
    rightShiftStage0Idx1_uid71_i_unnamed_ethash_calculate_dag_item345_shift_x_q <= i_unnamed_ethash_calculate_dag_item342_vt_const_127_q & rightShiftStage0Idx1Rng64_uid69_i_unnamed_ethash_calculate_dag_item345_shift_x_b;

    -- rightShiftStage0_uid73_i_unnamed_ethash_calculate_dag_item345_shift_x(MUX,72)@0
    rightShiftStage0_uid73_i_unnamed_ethash_calculate_dag_item345_shift_x_s <= VCC_q;
    rightShiftStage0_uid73_i_unnamed_ethash_calculate_dag_item345_shift_x_combproc: PROCESS (rightShiftStage0_uid73_i_unnamed_ethash_calculate_dag_item345_shift_x_s, bubble_select_stall_entry_aunroll_o, rightShiftStage0Idx1_uid71_i_unnamed_ethash_calculate_dag_item345_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid73_i_unnamed_ethash_calculate_dag_item345_shift_x_s) IS
            WHEN "0" => rightShiftStage0_uid73_i_unnamed_ethash_calculate_dag_item345_shift_x_q <= bubble_select_stall_entry_aunroll_o;
            WHEN "1" => rightShiftStage0_uid73_i_unnamed_ethash_calculate_dag_item345_shift_x_q <= rightShiftStage0Idx1_uid71_i_unnamed_ethash_calculate_dag_item345_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid73_i_unnamed_ethash_calculate_dag_item345_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_unnamed_ethash_calculate_dag_item344_vt_select_63(BITSELECT,45)@0
    i_unnamed_ethash_calculate_dag_item344_vt_select_63_b <= rightShiftStage0_uid73_i_unnamed_ethash_calculate_dag_item345_shift_x_q(63 downto 0);

    -- i_unnamed_ethash_calculate_dag_item344_vt_join(BITJOIN,44)@0
    i_unnamed_ethash_calculate_dag_item344_vt_join_q <= i_unnamed_ethash_calculate_dag_item342_vt_const_127_q & i_unnamed_ethash_calculate_dag_item344_vt_select_63_b;

    -- i_unnamed_ethash_calculate_dag_item349_sel_x(BITSELECT,17)@0
    i_unnamed_ethash_calculate_dag_item349_sel_x_b <= i_unnamed_ethash_calculate_dag_item344_vt_join_q(63 downto 0);

    -- i_unnamed_ethash_calculate_dag_item354_unnamed_ethash_calculate_dag_item11_select_0_x_merged_bit_select(BITSELECT,87)@0
    i_unnamed_ethash_calculate_dag_item354_unnamed_ethash_calculate_dag_item11_select_0_x_merged_bit_select_b <= i_unnamed_ethash_calculate_dag_item349_sel_x_b(31 downto 0);
    i_unnamed_ethash_calculate_dag_item354_unnamed_ethash_calculate_dag_item11_select_0_x_merged_bit_select_c <= i_unnamed_ethash_calculate_dag_item349_sel_x_b(63 downto 32);

    -- rightShiftStage0Idx1Rng64_uid60_i_unnamed_ethash_calculate_dag_item343_shift_x(BITSELECT,59)@0
    rightShiftStage0Idx1Rng64_uid60_i_unnamed_ethash_calculate_dag_item343_shift_x_b <= bubble_select_stall_entry_aunroll_m(127 downto 64);

    -- rightShiftStage0Idx1_uid62_i_unnamed_ethash_calculate_dag_item343_shift_x(BITJOIN,61)@0
    rightShiftStage0Idx1_uid62_i_unnamed_ethash_calculate_dag_item343_shift_x_q <= i_unnamed_ethash_calculate_dag_item342_vt_const_127_q & rightShiftStage0Idx1Rng64_uid60_i_unnamed_ethash_calculate_dag_item343_shift_x_b;

    -- rightShiftStage0_uid64_i_unnamed_ethash_calculate_dag_item343_shift_x(MUX,63)@0
    rightShiftStage0_uid64_i_unnamed_ethash_calculate_dag_item343_shift_x_s <= VCC_q;
    rightShiftStage0_uid64_i_unnamed_ethash_calculate_dag_item343_shift_x_combproc: PROCESS (rightShiftStage0_uid64_i_unnamed_ethash_calculate_dag_item343_shift_x_s, bubble_select_stall_entry_aunroll_m, rightShiftStage0Idx1_uid62_i_unnamed_ethash_calculate_dag_item343_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid64_i_unnamed_ethash_calculate_dag_item343_shift_x_s) IS
            WHEN "0" => rightShiftStage0_uid64_i_unnamed_ethash_calculate_dag_item343_shift_x_q <= bubble_select_stall_entry_aunroll_m;
            WHEN "1" => rightShiftStage0_uid64_i_unnamed_ethash_calculate_dag_item343_shift_x_q <= rightShiftStage0Idx1_uid62_i_unnamed_ethash_calculate_dag_item343_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid64_i_unnamed_ethash_calculate_dag_item343_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_unnamed_ethash_calculate_dag_item342_vt_select_63(BITSELECT,42)@0
    i_unnamed_ethash_calculate_dag_item342_vt_select_63_b <= rightShiftStage0_uid64_i_unnamed_ethash_calculate_dag_item343_shift_x_q(63 downto 0);

    -- i_unnamed_ethash_calculate_dag_item342_vt_join(BITJOIN,41)@0
    i_unnamed_ethash_calculate_dag_item342_vt_join_q <= i_unnamed_ethash_calculate_dag_item342_vt_const_127_q & i_unnamed_ethash_calculate_dag_item342_vt_select_63_b;

    -- i_unnamed_ethash_calculate_dag_item348_sel_x(BITSELECT,16)@0
    i_unnamed_ethash_calculate_dag_item348_sel_x_b <= i_unnamed_ethash_calculate_dag_item342_vt_join_q(63 downto 0);

    -- i_unnamed_ethash_calculate_dag_item352_unnamed_ethash_calculate_dag_item9_select_0_x_merged_bit_select(BITSELECT,86)@0
    i_unnamed_ethash_calculate_dag_item352_unnamed_ethash_calculate_dag_item9_select_0_x_merged_bit_select_b <= i_unnamed_ethash_calculate_dag_item348_sel_x_b(31 downto 0);
    i_unnamed_ethash_calculate_dag_item352_unnamed_ethash_calculate_dag_item9_select_0_x_merged_bit_select_c <= i_unnamed_ethash_calculate_dag_item348_sel_x_b(63 downto 32);

    -- dupName_0_sync_out_x(GPOUT,3)@0
    out_acl_01644 <= i_unnamed_ethash_calculate_dag_item352_unnamed_ethash_calculate_dag_item9_select_0_x_merged_bit_select_b;
    out_acl_01646 <= i_unnamed_ethash_calculate_dag_item354_unnamed_ethash_calculate_dag_item11_select_0_x_merged_bit_select_b;
    out_acl_01648 <= i_unnamed_ethash_calculate_dag_item356_unnamed_ethash_calculate_dag_item13_select_0_x_merged_bit_select_b;
    out_acl_11645 <= i_unnamed_ethash_calculate_dag_item352_unnamed_ethash_calculate_dag_item9_select_0_x_merged_bit_select_c;
    out_acl_11647 <= i_unnamed_ethash_calculate_dag_item354_unnamed_ethash_calculate_dag_item11_select_0_x_merged_bit_select_c;
    out_acl_11649 <= i_unnamed_ethash_calculate_dag_item356_unnamed_ethash_calculate_dag_item13_select_0_x_merged_bit_select_c;
    out_acl_hw_wg_id40 <= bubble_select_stall_entry_aunroll_b;
    out_c0_exe11220 <= bubble_select_stall_entry_aunroll_c;
    out_c0_exe113 <= bubble_select_stall_entry_aunroll_d;
    out_c0_exe21325 <= bubble_select_stall_entry_aunroll_e;
    out_c1_exe1031 <= bubble_select_stall_entry_aunroll_f;
    out_c1_exe1132 <= bubble_select_stall_entry_aunroll_g;
    out_c1_exe129 <= bubble_select_stall_entry_aunroll_h;
    out_c1_exe1533 <= bubble_select_stall_entry_aunroll_i;
    out_c1_exe1634 <= bubble_select_stall_entry_aunroll_j;
    out_c1_exe230 <= bubble_select_stall_entry_aunroll_l;
    out_pms_cs1241_pms_vs_pms_vm_pms_d <= i_pms_cs1241_pms_vs_pms_vm_pms_d_ethash_calculate_dag_item_vt_join_q;
    out_valid_out <= SE_stall_entry_aunroll_V0;

    -- sync_out(GPOUT,55)@0
    out_stall_out <= SE_stall_entry_aunroll_backStall;

END normal;
