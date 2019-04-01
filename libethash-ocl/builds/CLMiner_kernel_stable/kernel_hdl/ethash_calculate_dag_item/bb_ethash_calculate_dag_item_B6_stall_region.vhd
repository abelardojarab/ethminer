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

-- VHDL created from bb_ethash_calculate_dag_item_B6_stall_region
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

entity bb_ethash_calculate_dag_item_B6_stall_region is
    port (
        in_acl_hw_wg_id38 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe110 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe21323 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit16937_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit16937_1 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_c0_exit16937_2 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit16937_3 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_c0_exit16937_4 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_5 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_6 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_7 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_8 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_9 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_10 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_11 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_12 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_13 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_14 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_15 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_16 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_17 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_18 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_19 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_20 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_21 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_22 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_23 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_24 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_25 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_26 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_27 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_28 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_29 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_30 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_31 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_32 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_33 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_34 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_35 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_36 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_37 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_38 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_39 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_40 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_41 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_42 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_43 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_44 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_45 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_46 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_47 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_48 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_49 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit16937_50 : in std_logic_vector(31 downto 0);  -- ufix32
        in_dag_node_pm_236 : in std_logic_vector(1663 downto 0);  -- ufix1664
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_lsu_unnamed_ethash_calculate_dag_item15_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        in_g_dag : in std_logic_vector(63 downto 0);  -- ufix64
        out_acl_hw_wg_id38 : out std_logic_vector(31 downto 0);  -- ufix32
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_calculate_dag_item15_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_unnamed_ethash_calculate_dag_item15_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_calculate_dag_item15_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_calculate_dag_item15_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_calculate_dag_item15_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        out_unnamed_ethash_calculate_dag_item15_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_calculate_dag_item15_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_calculate_dag_item15_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_calculate_dag_item15_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_unnamed_ethash_calculate_dag_item15_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_ethash_calculate_dag_item15_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_ethash_calculate_dag_item_B6_stall_region;

architecture normal of bb_ethash_calculate_dag_item_B6_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item520 is
        port (
            in_i_writedata_0_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_writedata_0_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_writedata_0_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_writedata_0_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_writedata_1_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_writedata_1_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_writedata_1_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_writedata_1_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_writedata_2_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_writedata_2_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_writedata_2_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_writedata_2_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_writedata_3_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_writedata_3_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_writedata_3_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_writedata_3_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_calculate_dag_item15_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_unnamed_ethash_calculate_dag_item15_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_calculate_dag_item15_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_calculate_dag_item15_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_ethash_calculate_dag_item15_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_calculate_dag_item15_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_unnamed_ethash_calculate_dag_item15_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_ethash_calculate_dag_item15_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_unnamed_ethash_calculate_dag_item15_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_calculate_dag_item15_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_calculate_dag_item15_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_calculate_dag_item15_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_g_dag_sync_buffer_ethash_calculate_dag_item517 is
        port (
            in_buffer_in : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_out_lsu_unnamed_ethash_calculate_dag_item15_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_multconst_x_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_0_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_0_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_1_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_1_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_2_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_2_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_3_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_3_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_0_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_0_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_1_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_1_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_2_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_2_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_3_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_3_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_0_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_0_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_1_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_1_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_2_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_2_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_3_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_3_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_extract_t2168_ethash_calculate_dag_item_sel_x_b : STD_LOGIC_VECTOR (127 downto 0);
    signal i_extract_t2170_ethash_calculate_dag_item_sel_x_b : STD_LOGIC_VECTOR (127 downto 0);
    signal i_extract_t2172_ethash_calculate_dag_item_sel_x_b : STD_LOGIC_VECTOR (127 downto 0);
    signal i_idxprom56_ethash_calculate_dag_item_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_c0_exe1170_ethash_calculate_dag_item_vt_const_1663_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_c0_exe1170_ethash_calculate_dag_item_vt_join_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal i_c0_exe1170_ethash_calculate_dag_item_vt_select_1535_b : STD_LOGIC_VECTOR (1535 downto 0);
    signal i_extract2169_ethash_calculate_dag_item_vt_const_1663_q : STD_LOGIC_VECTOR (255 downto 0);
    signal i_extract2169_ethash_calculate_dag_item_vt_join_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal i_extract2169_ethash_calculate_dag_item_vt_select_1407_b : STD_LOGIC_VECTOR (1407 downto 0);
    signal i_extract2171_ethash_calculate_dag_item_vt_const_1663_q : STD_LOGIC_VECTOR (383 downto 0);
    signal i_extract2171_ethash_calculate_dag_item_vt_join_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal i_extract2171_ethash_calculate_dag_item_vt_select_1279_b : STD_LOGIC_VECTOR (1279 downto 0);
    signal i_idxprom56_ethash_calculate_dag_item_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_idxprom56_ethash_calculate_dag_item_vt_select_31_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_g_dag_sync_buffer_ethash_calculate_dag_item_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_g_dag_sync_buffer_ethash_calculate_dag_item_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_g_dag_sync_buffer_ethash_calculate_dag_item_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_join_13_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_align_14_q : STD_LOGIC_VECTOR (42 downto 0);
    signal i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_align_14_qint : STD_LOGIC_VECTOR (42 downto 0);
    signal i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_join_16_q : STD_LOGIC_VECTOR (70 downto 0);
    signal i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (71 downto 0);
    signal i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (71 downto 0);
    signal i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (71 downto 0);
    signal i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (71 downto 0);
    signal rightShiftStage0Idx1_uid118_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal rightShiftStage0_uid120_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid120_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal rightShiftStage1Idx1Rng128_uid130_i_extract2171_ethash_calculate_dag_item_ethash_calculate_dag_item512_shift_x_b : STD_LOGIC_VECTOR (1535 downto 0);
    signal rightShiftStage1Idx1_uid132_i_extract2171_ethash_calculate_dag_item_ethash_calculate_dag_item512_shift_x_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal rightShiftStage1_uid134_i_extract2171_ethash_calculate_dag_item_ethash_calculate_dag_item512_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage1_uid134_i_extract2171_ethash_calculate_dag_item_ethash_calculate_dag_item512_shift_x_q : STD_LOGIC_VECTOR (1663 downto 0);
    signal i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal i_phitmp2173_ethash_calculate_dag_item_ethash_calculate_dag_item515_phitmp2173_select_0_x_merged_bit_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_phitmp2173_ethash_calculate_dag_item_ethash_calculate_dag_item515_phitmp2173_select_0_x_merged_bit_select_c : STD_LOGIC_VECTOR (31 downto 0);
    signal i_phitmp2173_ethash_calculate_dag_item_ethash_calculate_dag_item515_phitmp2173_select_0_x_merged_bit_select_d : STD_LOGIC_VECTOR (31 downto 0);
    signal i_phitmp2173_ethash_calculate_dag_item_ethash_calculate_dag_item515_phitmp2173_select_0_x_merged_bit_select_e : STD_LOGIC_VECTOR (31 downto 0);
    signal i_phitmp2174_ethash_calculate_dag_item_ethash_calculate_dag_item514_phitmp2174_select_0_x_merged_bit_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_phitmp2174_ethash_calculate_dag_item_ethash_calculate_dag_item514_phitmp2174_select_0_x_merged_bit_select_c : STD_LOGIC_VECTOR (31 downto 0);
    signal i_phitmp2174_ethash_calculate_dag_item_ethash_calculate_dag_item514_phitmp2174_select_0_x_merged_bit_select_d : STD_LOGIC_VECTOR (31 downto 0);
    signal i_phitmp2174_ethash_calculate_dag_item_ethash_calculate_dag_item514_phitmp2174_select_0_x_merged_bit_select_e : STD_LOGIC_VECTOR (31 downto 0);
    signal i_phitmp2175_ethash_calculate_dag_item_ethash_calculate_dag_item513_phitmp2175_select_0_x_merged_bit_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_phitmp2175_ethash_calculate_dag_item_ethash_calculate_dag_item513_phitmp2175_select_0_x_merged_bit_select_c : STD_LOGIC_VECTOR (31 downto 0);
    signal i_phitmp2175_ethash_calculate_dag_item_ethash_calculate_dag_item513_phitmp2175_select_0_x_merged_bit_select_d : STD_LOGIC_VECTOR (31 downto 0);
    signal i_phitmp2175_ethash_calculate_dag_item_ethash_calculate_dag_item513_phitmp2175_select_0_x_merged_bit_select_e : STD_LOGIC_VECTOR (31 downto 0);
    signal i_phitmp_ethash_calculate_dag_item_ethash_calculate_dag_item516_phitmp_select_0_x_merged_bit_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_phitmp_ethash_calculate_dag_item_ethash_calculate_dag_item516_phitmp_select_0_x_merged_bit_select_c : STD_LOGIC_VECTOR (31 downto 0);
    signal i_phitmp_ethash_calculate_dag_item_ethash_calculate_dag_item516_phitmp_select_0_x_merged_bit_select_d : STD_LOGIC_VECTOR (31 downto 0);
    signal i_phitmp_ethash_calculate_dag_item_ethash_calculate_dag_item516_phitmp_select_0_x_merged_bit_select_e : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_b : STD_LOGIC_VECTOR (1407 downto 0);
    signal rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c : STD_LOGIC_VECTOR (127 downto 0);
    signal redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_q : STD_LOGIC_VECTOR (127 downto 0);
    signal redist1_stall_entry_aunroll_o4_3_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_stall_entry_aunroll_o4_3_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_stall_entry_aunroll_o4_3_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_stall_entry_aunroll_o6_1_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_idxprom56_ethash_calculate_dag_item_vt_select_31_b_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_i_extract_t2172_ethash_calculate_dag_item_sel_x_b_1_0_q : STD_LOGIC_VECTOR (127 downto 0);
    signal redist5_i_extract_t2170_ethash_calculate_dag_item_sel_x_b_1_0_q : STD_LOGIC_VECTOR (127 downto 0);
    signal redist6_i_extract_t2168_ethash_calculate_dag_item_sel_x_b_1_0_q : STD_LOGIC_VECTOR (127 downto 0);
    signal bubble_join_i_syncbuf_g_dag_sync_buffer_ethash_calculate_dag_item_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_g_dag_sync_buffer_ethash_calculate_dag_item_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_stall_entry_aunroll_q : STD_LOGIC_VECTOR (3392 downto 0);
    signal bubble_select_stall_entry_aunroll_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_d : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_aunroll_e : STD_LOGIC_VECTOR (1663 downto 0);
    signal bubble_select_stall_entry_aunroll_f : STD_LOGIC_VECTOR (1663 downto 0);
    signal SE_out_i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_phitmp2175_ethash_calculate_dag_item_ethash_calculate_dag_item513_phitmp2175_select_0_x_merged_bit_select_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_phitmp2175_ethash_calculate_dag_item_ethash_calculate_dag_item513_phitmp2175_select_0_x_merged_bit_select_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_phitmp2175_ethash_calculate_dag_item_ethash_calculate_dag_item513_phitmp2175_select_0_x_merged_bit_select_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_phitmp2175_ethash_calculate_dag_item_ethash_calculate_dag_item513_phitmp2175_select_0_x_merged_bit_select_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_R_v_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_s_tv_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o4_3_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o4_3_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o4_3_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o4_3_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o4_3_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o4_3_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o4_3_2_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o4_3_2_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o4_3_2_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o4_3_2_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o4_3_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o4_3_2_V0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_syncbuf_g_dag_sync_buffer_ethash_calculate_dag_item(BLACKBOX,86)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_g_dag_sync_buffer_ethash_calculate_dag_item : i_syncbuf_g_dag_sync_buffer_ethash_calculate_dag_item517
    PORT MAP (
        in_buffer_in => in_g_dag,
        in_i_dependence => GND_q,
        in_stall_in => SE_i_phitmp2175_ethash_calculate_dag_item_ethash_calculate_dag_item513_phitmp2175_select_0_x_merged_bit_select_backStall,
        in_valid_in => SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_V2,
        out_buffer_out => i_syncbuf_g_dag_sync_buffer_ethash_calculate_dag_item_out_buffer_out,
        out_stall_out => i_syncbuf_g_dag_sync_buffer_ethash_calculate_dag_item_out_stall_out,
        out_valid_out => i_syncbuf_g_dag_sync_buffer_ethash_calculate_dag_item_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_redist1_stall_entry_aunroll_o4_3_2(STALLENABLE,232)
    -- Valid signal propagation
    SE_redist1_stall_entry_aunroll_o4_3_2_V0 <= SE_redist1_stall_entry_aunroll_o4_3_2_R_v_0;
    -- Stall signal propagation
    SE_redist1_stall_entry_aunroll_o4_3_2_s_tv_0 <= SE_out_i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_backStall and SE_redist1_stall_entry_aunroll_o4_3_2_R_v_0;
    -- Backward Enable generation
    SE_redist1_stall_entry_aunroll_o4_3_2_backEN <= not (SE_redist1_stall_entry_aunroll_o4_3_2_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_stall_entry_aunroll_o4_3_2_v_s_0 <= SE_redist1_stall_entry_aunroll_o4_3_2_backEN and SE_redist1_stall_entry_aunroll_o4_3_1_V0;
    -- Backward Stall generation
    SE_redist1_stall_entry_aunroll_o4_3_2_backStall <= not (SE_redist1_stall_entry_aunroll_o4_3_2_v_s_0);
    SE_redist1_stall_entry_aunroll_o4_3_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_stall_entry_aunroll_o4_3_2_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o4_3_2_backEN = "0") THEN
                SE_redist1_stall_entry_aunroll_o4_3_2_R_v_0 <= SE_redist1_stall_entry_aunroll_o4_3_2_R_v_0 and SE_redist1_stall_entry_aunroll_o4_3_2_s_tv_0;
            ELSE
                SE_redist1_stall_entry_aunroll_o4_3_2_R_v_0 <= SE_redist1_stall_entry_aunroll_o4_3_2_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist1_stall_entry_aunroll_o4_3_1(STALLENABLE,231)
    -- Valid signal propagation
    SE_redist1_stall_entry_aunroll_o4_3_1_V0 <= SE_redist1_stall_entry_aunroll_o4_3_1_R_v_0;
    -- Stall signal propagation
    SE_redist1_stall_entry_aunroll_o4_3_1_s_tv_0 <= SE_redist1_stall_entry_aunroll_o4_3_2_backStall and SE_redist1_stall_entry_aunroll_o4_3_1_R_v_0;
    -- Backward Enable generation
    SE_redist1_stall_entry_aunroll_o4_3_1_backEN <= not (SE_redist1_stall_entry_aunroll_o4_3_1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_stall_entry_aunroll_o4_3_1_v_s_0 <= SE_redist1_stall_entry_aunroll_o4_3_1_backEN and SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_V0;
    -- Backward Stall generation
    SE_redist1_stall_entry_aunroll_o4_3_1_backStall <= not (SE_redist1_stall_entry_aunroll_o4_3_1_v_s_0);
    SE_redist1_stall_entry_aunroll_o4_3_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_stall_entry_aunroll_o4_3_1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o4_3_1_backEN = "0") THEN
                SE_redist1_stall_entry_aunroll_o4_3_1_R_v_0 <= SE_redist1_stall_entry_aunroll_o4_3_1_R_v_0 and SE_redist1_stall_entry_aunroll_o4_3_1_s_tv_0;
            ELSE
                SE_redist1_stall_entry_aunroll_o4_3_1_R_v_0 <= SE_redist1_stall_entry_aunroll_o4_3_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_stall_entry_aunroll(STALLENABLE,206)
    -- Valid signal propagation
    SE_stall_entry_aunroll_V0 <= SE_stall_entry_aunroll_wireValid;
    -- Backward Stall generation
    SE_stall_entry_aunroll_backStall <= SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_backStall or not (SE_stall_entry_aunroll_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_aunroll_wireValid <= in_valid_in;

    -- SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0(STALLENABLE,229)
    -- Valid signal propagation
    SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_V0 <= SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_R_v_0;
    SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_V1 <= SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_R_v_1;
    SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_V2 <= SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_R_v_2;
    -- Stall signal propagation
    SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_s_tv_0 <= SE_redist1_stall_entry_aunroll_o4_3_1_backStall and SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_R_v_0;
    SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_s_tv_1 <= SE_i_phitmp2175_ethash_calculate_dag_item_ethash_calculate_dag_item513_phitmp2175_select_0_x_merged_bit_select_backStall and SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_R_v_1;
    SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_s_tv_2 <= i_syncbuf_g_dag_sync_buffer_ethash_calculate_dag_item_out_stall_out and SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_R_v_2;
    -- Backward Enable generation
    SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_or0 <= SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_s_tv_0;
    SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_or1 <= SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_s_tv_1 or SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_or0;
    SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_backEN <= not (SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_s_tv_2 or SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_or1);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_v_s_0 <= SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_backEN and SE_stall_entry_aunroll_V0;
    -- Backward Stall generation
    SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_backStall <= not (SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_v_s_0);
    SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_R_v_0 <= (others => '0');
            SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_R_v_1 <= (others => '0');
            SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_R_v_2 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_backEN = "0") THEN
                SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_R_v_0 <= SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_R_v_0 and SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_s_tv_0;
            ELSE
                SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_R_v_0 <= SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_v_s_0;
            END IF;

            IF (SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_backEN = "0") THEN
                SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_R_v_1 <= SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_R_v_1 and SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_s_tv_1;
            ELSE
                SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_R_v_1 <= SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_v_s_0;
            END IF;

            IF (SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_backEN = "0") THEN
                SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_R_v_2 <= SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_R_v_2 and SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_s_tv_2;
            ELSE
                SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_R_v_2 <= SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_i_phitmp2175_ethash_calculate_dag_item_ethash_calculate_dag_item513_phitmp2175_select_0_x_merged_bit_select(STALLENABLE,225)
    -- Valid signal propagation
    SE_i_phitmp2175_ethash_calculate_dag_item_ethash_calculate_dag_item513_phitmp2175_select_0_x_merged_bit_select_V0 <= SE_i_phitmp2175_ethash_calculate_dag_item_ethash_calculate_dag_item513_phitmp2175_select_0_x_merged_bit_select_wireValid;
    -- Backward Stall generation
    SE_i_phitmp2175_ethash_calculate_dag_item_ethash_calculate_dag_item513_phitmp2175_select_0_x_merged_bit_select_backStall <= i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_stall or not (SE_i_phitmp2175_ethash_calculate_dag_item_ethash_calculate_dag_item513_phitmp2175_select_0_x_merged_bit_select_wireValid);
    -- Computing multiple Valid(s)
    SE_i_phitmp2175_ethash_calculate_dag_item_ethash_calculate_dag_item513_phitmp2175_select_0_x_merged_bit_select_and0 <= SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_V1;
    SE_i_phitmp2175_ethash_calculate_dag_item_ethash_calculate_dag_item513_phitmp2175_select_0_x_merged_bit_select_wireValid <= i_syncbuf_g_dag_sync_buffer_ethash_calculate_dag_item_out_valid_out and SE_i_phitmp2175_ethash_calculate_dag_item_ethash_calculate_dag_item513_phitmp2175_select_0_x_merged_bit_select_and0;

    -- SE_out_i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x(STALLENABLE,175)
    -- Valid signal propagation
    SE_out_i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_V0 <= SE_out_i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_backStall <= in_stall_in or not (SE_out_i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_and0 <= i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_valid;
    SE_out_i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_wireValid <= SE_redist1_stall_entry_aunroll_o4_3_2_V0 and SE_out_i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_and0;

    -- bubble_join_stall_entry_aunroll(BITJOIN,171)
    bubble_join_stall_entry_aunroll_q <= in_dag_node_pm_236 & in_c0_exit16937_1 & in_c0_exe21323 & in_c0_exe110 & in_acl_hw_wg_id38;

    -- bubble_select_stall_entry_aunroll(BITSELECT,172)
    bubble_select_stall_entry_aunroll_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(31 downto 0));
    bubble_select_stall_entry_aunroll_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(63 downto 32));
    bubble_select_stall_entry_aunroll_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(64 downto 64));
    bubble_select_stall_entry_aunroll_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(1728 downto 65));
    bubble_select_stall_entry_aunroll_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(3392 downto 1729));

    -- redist2_stall_entry_aunroll_o6_1_0(REG,161)
    redist2_stall_entry_aunroll_o6_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_stall_entry_aunroll_o6_1_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_backEN = "1") THEN
                redist2_stall_entry_aunroll_o6_1_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_aunroll_d);
            END IF;
        END IF;
    END PROCESS;

    -- i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_multconst_x(CONSTANT,13)
    i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_multconst_x_q <= "000000000000000000000000000000000000000000000000000000000";

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- c_i32_0gr(CONSTANT,63)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- i_idxprom56_ethash_calculate_dag_item_sel_x(BITSELECT,43)@0
    i_idxprom56_ethash_calculate_dag_item_sel_x_b <= std_logic_vector(resize(unsigned(bubble_select_stall_entry_aunroll_c(31 downto 0)), 64));

    -- i_idxprom56_ethash_calculate_dag_item_vt_select_31(BITSELECT,84)@0
    i_idxprom56_ethash_calculate_dag_item_vt_select_31_b <= i_idxprom56_ethash_calculate_dag_item_sel_x_b(31 downto 0);

    -- redist3_i_idxprom56_ethash_calculate_dag_item_vt_select_31_b_1_0(REG,162)
    redist3_i_idxprom56_ethash_calculate_dag_item_vt_select_31_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_i_idxprom56_ethash_calculate_dag_item_vt_select_31_b_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_backEN = "1") THEN
                redist3_i_idxprom56_ethash_calculate_dag_item_vt_select_31_b_1_0_q <= STD_LOGIC_VECTOR(i_idxprom56_ethash_calculate_dag_item_vt_select_31_b);
            END IF;
        END IF;
    END PROCESS;

    -- i_idxprom56_ethash_calculate_dag_item_vt_join(BITJOIN,83)@1
    i_idxprom56_ethash_calculate_dag_item_vt_join_q <= c_i32_0gr_q & redist3_i_idxprom56_ethash_calculate_dag_item_vt_select_31_b_1_0_q;

    -- i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_bs1_merged_bit_select(BITSELECT,148)@1
    i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_bs1_merged_bit_select_b <= i_idxprom56_ethash_calculate_dag_item_vt_join_q(17 downto 0);
    i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_bs1_merged_bit_select_c <= i_idxprom56_ethash_calculate_dag_item_vt_join_q(63 downto 54);
    i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_bs1_merged_bit_select_d <= i_idxprom56_ethash_calculate_dag_item_vt_join_q(35 downto 18);
    i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_bs1_merged_bit_select_e <= i_idxprom56_ethash_calculate_dag_item_vt_join_q(53 downto 36);

    -- i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_im3_shift0(BITSHIFT,141)@1
    i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_im3_shift0_qint <= i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_bs1_merged_bit_select_c & "000000";
    i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_im3_shift0_q <= i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_im3_shift0_qint(15 downto 0);

    -- i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_align_15(BITSHIFT,109)@1
    i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_im3_shift0_q) & "00000000000";
    i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_align_15_q <= i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_im6_shift0(BITSHIFT,142)@1
    i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_im6_shift0_qint <= i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_bs1_merged_bit_select_d & "000000";
    i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_im6_shift0_q <= i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_im6_shift0_qint(23 downto 0);

    -- i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_align_14(BITSHIFT,108)@1
    i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_align_14_q <= i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_align_14_qint(42 downto 0);

    -- i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_join_16(BITJOIN,110)@1
    i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_join_16_q <= i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_align_15_q & i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_align_14_q;

    -- i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_im9_shift0(BITSHIFT,143)@1
    i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_im9_shift0_qint <= i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_bs1_merged_bit_select_e & "000000";
    i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_im9_shift0_q <= i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_im9_shift0_qint(23 downto 0);

    -- i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_align_12(BITSHIFT,106)@1
    i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_im9_shift0_q) & "00000000000";
    i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_align_12_q <= i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_im0_shift0(BITSHIFT,140)@1
    i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_im0_shift0_qint <= i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_bs1_merged_bit_select_b & "000000";
    i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_im0_shift0_q <= i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_im0_shift0_qint(23 downto 0);

    -- i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_join_13(BITJOIN,107)@1
    i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_join_13_q <= i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_im0_shift0_q);

    -- i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_result_add_0_0(ADD,111)@1
    i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_join_13_q);
    i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_join_16_q);
    i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_result_add_0_0_b));
    i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_result_add_0_0_q <= i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_result_add_0_0_o(71 downto 0);

    -- i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_extender_x(BITJOIN,12)@1
    i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_extender_x_q <= i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_multconst_x_q & i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_x_result_add_0_0_q(70 downto 0);

    -- i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_trunc_sel_x(BITSELECT,14)@1
    i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_trunc_sel_x_b <= i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_mult_extender_x_q(63 downto 0);

    -- bubble_join_i_syncbuf_g_dag_sync_buffer_ethash_calculate_dag_item(BITJOIN,168)
    bubble_join_i_syncbuf_g_dag_sync_buffer_ethash_calculate_dag_item_q <= i_syncbuf_g_dag_sync_buffer_ethash_calculate_dag_item_out_buffer_out;

    -- bubble_select_i_syncbuf_g_dag_sync_buffer_ethash_calculate_dag_item(BITSELECT,169)
    bubble_select_i_syncbuf_g_dag_sync_buffer_ethash_calculate_dag_item_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_g_dag_sync_buffer_ethash_calculate_dag_item_q(63 downto 0));

    -- i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_add_x(ADD,15)@1
    i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_add_x_a <= STD_LOGIC_VECTOR("0" & bubble_select_i_syncbuf_g_dag_sync_buffer_ethash_calculate_dag_item_b);
    i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_add_x_b <= STD_LOGIC_VECTOR("0" & i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_trunc_sel_x_b);
    i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_add_x_a) + UNSIGNED(i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_add_x_b));
    i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_add_x_q <= i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_add_x_o(64 downto 0);

    -- i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_dupName_0_trunc_sel_x(BITSELECT,9)@1
    i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_dupName_0_trunc_sel_x_b <= i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_add_x_q(63 downto 0);

    -- i_extract2171_ethash_calculate_dag_item_vt_const_1663(CONSTANT,74)
    i_extract2171_ethash_calculate_dag_item_vt_const_1663_q <= "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

    -- i_c0_exe1170_ethash_calculate_dag_item_vt_const_1663(CONSTANT,68)
    i_c0_exe1170_ethash_calculate_dag_item_vt_const_1663_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

    -- rightShiftStage1Idx1Rng128_uid130_i_extract2171_ethash_calculate_dag_item_ethash_calculate_dag_item512_shift_x(BITSELECT,129)@0
    rightShiftStage1Idx1Rng128_uid130_i_extract2171_ethash_calculate_dag_item_ethash_calculate_dag_item512_shift_x_b <= rightShiftStage0_uid120_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_q(1663 downto 128);

    -- rightShiftStage1Idx1_uid132_i_extract2171_ethash_calculate_dag_item_ethash_calculate_dag_item512_shift_x(BITJOIN,131)@0
    rightShiftStage1Idx1_uid132_i_extract2171_ethash_calculate_dag_item_ethash_calculate_dag_item512_shift_x_q <= i_c0_exe1170_ethash_calculate_dag_item_vt_const_1663_q & rightShiftStage1Idx1Rng128_uid130_i_extract2171_ethash_calculate_dag_item_ethash_calculate_dag_item512_shift_x_b;

    -- i_extract2169_ethash_calculate_dag_item_vt_const_1663(CONSTANT,71)
    i_extract2169_ethash_calculate_dag_item_vt_const_1663_q <= "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

    -- rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select(BITSELECT,149)@0
    rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_b <= bubble_select_stall_entry_aunroll_f(1663 downto 256);
    rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c <= bubble_select_stall_entry_aunroll_f(127 downto 0);

    -- rightShiftStage0Idx1_uid118_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x(BITJOIN,117)@0
    rightShiftStage0Idx1_uid118_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_q <= i_extract2169_ethash_calculate_dag_item_vt_const_1663_q & rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_b;

    -- rightShiftStage0_uid120_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x(MUX,119)@0
    rightShiftStage0_uid120_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_s <= VCC_q;
    rightShiftStage0_uid120_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_combproc: PROCESS (rightShiftStage0_uid120_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_s, bubble_select_stall_entry_aunroll_f, rightShiftStage0Idx1_uid118_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid120_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_s) IS
            WHEN "0" => rightShiftStage0_uid120_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_q <= bubble_select_stall_entry_aunroll_f;
            WHEN "1" => rightShiftStage0_uid120_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_q <= rightShiftStage0Idx1_uid118_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid120_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1_uid134_i_extract2171_ethash_calculate_dag_item_ethash_calculate_dag_item512_shift_x(MUX,133)@0
    rightShiftStage1_uid134_i_extract2171_ethash_calculate_dag_item_ethash_calculate_dag_item512_shift_x_s <= VCC_q;
    rightShiftStage1_uid134_i_extract2171_ethash_calculate_dag_item_ethash_calculate_dag_item512_shift_x_combproc: PROCESS (rightShiftStage1_uid134_i_extract2171_ethash_calculate_dag_item_ethash_calculate_dag_item512_shift_x_s, rightShiftStage0_uid120_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_q, rightShiftStage1Idx1_uid132_i_extract2171_ethash_calculate_dag_item_ethash_calculate_dag_item512_shift_x_q)
    BEGIN
        CASE (rightShiftStage1_uid134_i_extract2171_ethash_calculate_dag_item_ethash_calculate_dag_item512_shift_x_s) IS
            WHEN "0" => rightShiftStage1_uid134_i_extract2171_ethash_calculate_dag_item_ethash_calculate_dag_item512_shift_x_q <= rightShiftStage0_uid120_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_q;
            WHEN "1" => rightShiftStage1_uid134_i_extract2171_ethash_calculate_dag_item_ethash_calculate_dag_item512_shift_x_q <= rightShiftStage1Idx1_uid132_i_extract2171_ethash_calculate_dag_item_ethash_calculate_dag_item512_shift_x_q;
            WHEN OTHERS => rightShiftStage1_uid134_i_extract2171_ethash_calculate_dag_item_ethash_calculate_dag_item512_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_extract2171_ethash_calculate_dag_item_vt_select_1279(BITSELECT,76)@0
    i_extract2171_ethash_calculate_dag_item_vt_select_1279_b <= rightShiftStage1_uid134_i_extract2171_ethash_calculate_dag_item_ethash_calculate_dag_item512_shift_x_q(1279 downto 0);

    -- i_extract2171_ethash_calculate_dag_item_vt_join(BITJOIN,75)@0
    i_extract2171_ethash_calculate_dag_item_vt_join_q <= i_extract2171_ethash_calculate_dag_item_vt_const_1663_q & i_extract2171_ethash_calculate_dag_item_vt_select_1279_b;

    -- i_extract_t2172_ethash_calculate_dag_item_sel_x(BITSELECT,41)@0
    i_extract_t2172_ethash_calculate_dag_item_sel_x_b <= i_extract2171_ethash_calculate_dag_item_vt_join_q(127 downto 0);

    -- redist4_i_extract_t2172_ethash_calculate_dag_item_sel_x_b_1_0(REG,163)
    redist4_i_extract_t2172_ethash_calculate_dag_item_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_i_extract_t2172_ethash_calculate_dag_item_sel_x_b_1_0_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_backEN = "1") THEN
                redist4_i_extract_t2172_ethash_calculate_dag_item_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(i_extract_t2172_ethash_calculate_dag_item_sel_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- i_phitmp2175_ethash_calculate_dag_item_ethash_calculate_dag_item513_phitmp2175_select_0_x_merged_bit_select(BITSELECT,146)@1
    i_phitmp2175_ethash_calculate_dag_item_ethash_calculate_dag_item513_phitmp2175_select_0_x_merged_bit_select_b <= redist4_i_extract_t2172_ethash_calculate_dag_item_sel_x_b_1_0_q(31 downto 0);
    i_phitmp2175_ethash_calculate_dag_item_ethash_calculate_dag_item513_phitmp2175_select_0_x_merged_bit_select_c <= redist4_i_extract_t2172_ethash_calculate_dag_item_sel_x_b_1_0_q(63 downto 32);
    i_phitmp2175_ethash_calculate_dag_item_ethash_calculate_dag_item513_phitmp2175_select_0_x_merged_bit_select_d <= redist4_i_extract_t2172_ethash_calculate_dag_item_sel_x_b_1_0_q(95 downto 64);
    i_phitmp2175_ethash_calculate_dag_item_ethash_calculate_dag_item513_phitmp2175_select_0_x_merged_bit_select_e <= redist4_i_extract_t2172_ethash_calculate_dag_item_sel_x_b_1_0_q(127 downto 96);

    -- i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_3_x(MUX,30)@1
    i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_3_x_s <= redist2_stall_entry_aunroll_o6_1_0_q;
    i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_3_x_combproc: PROCESS (i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_3_x_s, i_phitmp2175_ethash_calculate_dag_item_ethash_calculate_dag_item513_phitmp2175_select_0_x_merged_bit_select_e, c_i32_0gr_q)
    BEGIN
        CASE (i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_3_x_s) IS
            WHEN "0" => i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_3_x_q <= i_phitmp2175_ethash_calculate_dag_item_ethash_calculate_dag_item513_phitmp2175_select_0_x_merged_bit_select_e;
            WHEN "1" => i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_3_x_q <= c_i32_0gr_q;
            WHEN OTHERS => i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_3_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_extract2169_ethash_calculate_dag_item_vt_select_1407(BITSELECT,73)@0
    i_extract2169_ethash_calculate_dag_item_vt_select_1407_b <= rightShiftStage0_uid120_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_q(1407 downto 0);

    -- i_extract2169_ethash_calculate_dag_item_vt_join(BITJOIN,72)@0
    i_extract2169_ethash_calculate_dag_item_vt_join_q <= i_extract2169_ethash_calculate_dag_item_vt_const_1663_q & i_extract2169_ethash_calculate_dag_item_vt_select_1407_b;

    -- i_extract_t2170_ethash_calculate_dag_item_sel_x(BITSELECT,40)@0
    i_extract_t2170_ethash_calculate_dag_item_sel_x_b <= i_extract2169_ethash_calculate_dag_item_vt_join_q(127 downto 0);

    -- redist5_i_extract_t2170_ethash_calculate_dag_item_sel_x_b_1_0(REG,164)
    redist5_i_extract_t2170_ethash_calculate_dag_item_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_i_extract_t2170_ethash_calculate_dag_item_sel_x_b_1_0_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_backEN = "1") THEN
                redist5_i_extract_t2170_ethash_calculate_dag_item_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(i_extract_t2170_ethash_calculate_dag_item_sel_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- i_phitmp2174_ethash_calculate_dag_item_ethash_calculate_dag_item514_phitmp2174_select_0_x_merged_bit_select(BITSELECT,145)@1
    i_phitmp2174_ethash_calculate_dag_item_ethash_calculate_dag_item514_phitmp2174_select_0_x_merged_bit_select_b <= redist5_i_extract_t2170_ethash_calculate_dag_item_sel_x_b_1_0_q(31 downto 0);
    i_phitmp2174_ethash_calculate_dag_item_ethash_calculate_dag_item514_phitmp2174_select_0_x_merged_bit_select_c <= redist5_i_extract_t2170_ethash_calculate_dag_item_sel_x_b_1_0_q(63 downto 32);
    i_phitmp2174_ethash_calculate_dag_item_ethash_calculate_dag_item514_phitmp2174_select_0_x_merged_bit_select_d <= redist5_i_extract_t2170_ethash_calculate_dag_item_sel_x_b_1_0_q(95 downto 64);
    i_phitmp2174_ethash_calculate_dag_item_ethash_calculate_dag_item514_phitmp2174_select_0_x_merged_bit_select_e <= redist5_i_extract_t2170_ethash_calculate_dag_item_sel_x_b_1_0_q(127 downto 96);

    -- i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_3_x(MUX,26)@1
    i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_3_x_s <= redist2_stall_entry_aunroll_o6_1_0_q;
    i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_3_x_combproc: PROCESS (i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_3_x_s, i_phitmp2174_ethash_calculate_dag_item_ethash_calculate_dag_item514_phitmp2174_select_0_x_merged_bit_select_e, c_i32_0gr_q)
    BEGIN
        CASE (i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_3_x_s) IS
            WHEN "0" => i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_3_x_q <= i_phitmp2174_ethash_calculate_dag_item_ethash_calculate_dag_item514_phitmp2174_select_0_x_merged_bit_select_e;
            WHEN "1" => i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_3_x_q <= c_i32_0gr_q;
            WHEN OTHERS => i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_3_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_c0_exe1170_ethash_calculate_dag_item_vt_select_1535(BITSELECT,70)@0
    i_c0_exe1170_ethash_calculate_dag_item_vt_select_1535_b <= bubble_select_stall_entry_aunroll_e(1535 downto 0);

    -- i_c0_exe1170_ethash_calculate_dag_item_vt_join(BITJOIN,69)@0
    i_c0_exe1170_ethash_calculate_dag_item_vt_join_q <= i_c0_exe1170_ethash_calculate_dag_item_vt_const_1663_q & i_c0_exe1170_ethash_calculate_dag_item_vt_select_1535_b;

    -- i_extract_t2168_ethash_calculate_dag_item_sel_x(BITSELECT,39)@0
    i_extract_t2168_ethash_calculate_dag_item_sel_x_b <= i_c0_exe1170_ethash_calculate_dag_item_vt_join_q(127 downto 0);

    -- redist6_i_extract_t2168_ethash_calculate_dag_item_sel_x_b_1_0(REG,165)
    redist6_i_extract_t2168_ethash_calculate_dag_item_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_i_extract_t2168_ethash_calculate_dag_item_sel_x_b_1_0_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_backEN = "1") THEN
                redist6_i_extract_t2168_ethash_calculate_dag_item_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(i_extract_t2168_ethash_calculate_dag_item_sel_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- i_phitmp2173_ethash_calculate_dag_item_ethash_calculate_dag_item515_phitmp2173_select_0_x_merged_bit_select(BITSELECT,144)@1
    i_phitmp2173_ethash_calculate_dag_item_ethash_calculate_dag_item515_phitmp2173_select_0_x_merged_bit_select_b <= redist6_i_extract_t2168_ethash_calculate_dag_item_sel_x_b_1_0_q(31 downto 0);
    i_phitmp2173_ethash_calculate_dag_item_ethash_calculate_dag_item515_phitmp2173_select_0_x_merged_bit_select_c <= redist6_i_extract_t2168_ethash_calculate_dag_item_sel_x_b_1_0_q(63 downto 32);
    i_phitmp2173_ethash_calculate_dag_item_ethash_calculate_dag_item515_phitmp2173_select_0_x_merged_bit_select_d <= redist6_i_extract_t2168_ethash_calculate_dag_item_sel_x_b_1_0_q(95 downto 64);
    i_phitmp2173_ethash_calculate_dag_item_ethash_calculate_dag_item515_phitmp2173_select_0_x_merged_bit_select_e <= redist6_i_extract_t2168_ethash_calculate_dag_item_sel_x_b_1_0_q(127 downto 96);

    -- i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_3_x(MUX,22)@1
    i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_3_x_s <= redist2_stall_entry_aunroll_o6_1_0_q;
    i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_3_x_combproc: PROCESS (i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_3_x_s, i_phitmp2173_ethash_calculate_dag_item_ethash_calculate_dag_item515_phitmp2173_select_0_x_merged_bit_select_e, c_i32_0gr_q)
    BEGIN
        CASE (i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_3_x_s) IS
            WHEN "0" => i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_3_x_q <= i_phitmp2173_ethash_calculate_dag_item_ethash_calculate_dag_item515_phitmp2173_select_0_x_merged_bit_select_e;
            WHEN "1" => i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_3_x_q <= c_i32_0gr_q;
            WHEN OTHERS => i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_3_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_2_x(MUX,29)@1
    i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_2_x_s <= redist2_stall_entry_aunroll_o6_1_0_q;
    i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_2_x_combproc: PROCESS (i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_2_x_s, i_phitmp2175_ethash_calculate_dag_item_ethash_calculate_dag_item513_phitmp2175_select_0_x_merged_bit_select_d, c_i32_0gr_q)
    BEGIN
        CASE (i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_2_x_s) IS
            WHEN "0" => i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_2_x_q <= i_phitmp2175_ethash_calculate_dag_item_ethash_calculate_dag_item513_phitmp2175_select_0_x_merged_bit_select_d;
            WHEN "1" => i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_2_x_q <= c_i32_0gr_q;
            WHEN OTHERS => i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_2_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_2_x(MUX,25)@1
    i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_2_x_s <= redist2_stall_entry_aunroll_o6_1_0_q;
    i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_2_x_combproc: PROCESS (i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_2_x_s, i_phitmp2174_ethash_calculate_dag_item_ethash_calculate_dag_item514_phitmp2174_select_0_x_merged_bit_select_d, c_i32_0gr_q)
    BEGIN
        CASE (i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_2_x_s) IS
            WHEN "0" => i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_2_x_q <= i_phitmp2174_ethash_calculate_dag_item_ethash_calculate_dag_item514_phitmp2174_select_0_x_merged_bit_select_d;
            WHEN "1" => i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_2_x_q <= c_i32_0gr_q;
            WHEN OTHERS => i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_2_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_2_x(MUX,21)@1
    i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_2_x_s <= redist2_stall_entry_aunroll_o6_1_0_q;
    i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_2_x_combproc: PROCESS (i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_2_x_s, i_phitmp2173_ethash_calculate_dag_item_ethash_calculate_dag_item515_phitmp2173_select_0_x_merged_bit_select_d, c_i32_0gr_q)
    BEGIN
        CASE (i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_2_x_s) IS
            WHEN "0" => i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_2_x_q <= i_phitmp2173_ethash_calculate_dag_item_ethash_calculate_dag_item515_phitmp2173_select_0_x_merged_bit_select_d;
            WHEN "1" => i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_2_x_q <= c_i32_0gr_q;
            WHEN OTHERS => i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_2_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_1_x(MUX,28)@1
    i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_1_x_s <= redist2_stall_entry_aunroll_o6_1_0_q;
    i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_1_x_combproc: PROCESS (i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_1_x_s, i_phitmp2175_ethash_calculate_dag_item_ethash_calculate_dag_item513_phitmp2175_select_0_x_merged_bit_select_c, c_i32_0gr_q)
    BEGIN
        CASE (i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_1_x_s) IS
            WHEN "0" => i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_1_x_q <= i_phitmp2175_ethash_calculate_dag_item_ethash_calculate_dag_item513_phitmp2175_select_0_x_merged_bit_select_c;
            WHEN "1" => i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_1_x_q <= c_i32_0gr_q;
            WHEN OTHERS => i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_1_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_1_x(MUX,24)@1
    i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_1_x_s <= redist2_stall_entry_aunroll_o6_1_0_q;
    i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_1_x_combproc: PROCESS (i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_1_x_s, i_phitmp2174_ethash_calculate_dag_item_ethash_calculate_dag_item514_phitmp2174_select_0_x_merged_bit_select_c, c_i32_0gr_q)
    BEGIN
        CASE (i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_1_x_s) IS
            WHEN "0" => i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_1_x_q <= i_phitmp2174_ethash_calculate_dag_item_ethash_calculate_dag_item514_phitmp2174_select_0_x_merged_bit_select_c;
            WHEN "1" => i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_1_x_q <= c_i32_0gr_q;
            WHEN OTHERS => i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_1_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_1_x(MUX,20)@1
    i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_1_x_s <= redist2_stall_entry_aunroll_o6_1_0_q;
    i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_1_x_combproc: PROCESS (i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_1_x_s, i_phitmp2173_ethash_calculate_dag_item_ethash_calculate_dag_item515_phitmp2173_select_0_x_merged_bit_select_c, c_i32_0gr_q)
    BEGIN
        CASE (i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_1_x_s) IS
            WHEN "0" => i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_1_x_q <= i_phitmp2173_ethash_calculate_dag_item_ethash_calculate_dag_item515_phitmp2173_select_0_x_merged_bit_select_c;
            WHEN "1" => i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_1_x_q <= c_i32_0gr_q;
            WHEN OTHERS => i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_1_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_0_x(MUX,27)@1
    i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_0_x_s <= redist2_stall_entry_aunroll_o6_1_0_q;
    i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_0_x_combproc: PROCESS (i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_0_x_s, i_phitmp2175_ethash_calculate_dag_item_ethash_calculate_dag_item513_phitmp2175_select_0_x_merged_bit_select_b, c_i32_0gr_q)
    BEGIN
        CASE (i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_0_x_s) IS
            WHEN "0" => i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_0_x_q <= i_phitmp2175_ethash_calculate_dag_item_ethash_calculate_dag_item513_phitmp2175_select_0_x_merged_bit_select_b;
            WHEN "1" => i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_0_x_q <= c_i32_0gr_q;
            WHEN OTHERS => i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_0_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_0_x(MUX,23)@1
    i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_0_x_s <= redist2_stall_entry_aunroll_o6_1_0_q;
    i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_0_x_combproc: PROCESS (i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_0_x_s, i_phitmp2174_ethash_calculate_dag_item_ethash_calculate_dag_item514_phitmp2174_select_0_x_merged_bit_select_b, c_i32_0gr_q)
    BEGIN
        CASE (i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_0_x_s) IS
            WHEN "0" => i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_0_x_q <= i_phitmp2174_ethash_calculate_dag_item_ethash_calculate_dag_item514_phitmp2174_select_0_x_merged_bit_select_b;
            WHEN "1" => i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_0_x_q <= c_i32_0gr_q;
            WHEN OTHERS => i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_0_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_0_x(MUX,19)@1
    i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_0_x_s <= redist2_stall_entry_aunroll_o6_1_0_q;
    i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_0_x_combproc: PROCESS (i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_0_x_s, i_phitmp2173_ethash_calculate_dag_item_ethash_calculate_dag_item515_phitmp2173_select_0_x_merged_bit_select_b, c_i32_0gr_q)
    BEGIN
        CASE (i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_0_x_s) IS
            WHEN "0" => i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_0_x_q <= i_phitmp2173_ethash_calculate_dag_item_ethash_calculate_dag_item515_phitmp2173_select_0_x_merged_bit_select_b;
            WHEN "1" => i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_0_x_q <= c_i32_0gr_q;
            WHEN OTHERS => i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_0_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0(REG,157)
    redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_backEN = "1") THEN
                redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_q <= STD_LOGIC_VECTOR(rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c);
            END IF;
        END IF;
    END PROCESS;

    -- i_phitmp_ethash_calculate_dag_item_ethash_calculate_dag_item516_phitmp_select_0_x_merged_bit_select(BITSELECT,147)@1
    i_phitmp_ethash_calculate_dag_item_ethash_calculate_dag_item516_phitmp_select_0_x_merged_bit_select_b <= redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_q(31 downto 0);
    i_phitmp_ethash_calculate_dag_item_ethash_calculate_dag_item516_phitmp_select_0_x_merged_bit_select_c <= redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_q(63 downto 32);
    i_phitmp_ethash_calculate_dag_item_ethash_calculate_dag_item516_phitmp_select_0_x_merged_bit_select_d <= redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_q(95 downto 64);
    i_phitmp_ethash_calculate_dag_item_ethash_calculate_dag_item516_phitmp_select_0_x_merged_bit_select_e <= redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_q(127 downto 96);

    -- i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x(BLACKBOX,3)@1
    -- in in_i_stall@20000000
    -- out out_lsu_unnamed_ethash_calculate_dag_item15_o_active@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@3
    -- out out_unnamed_ethash_calculate_dag_item15_avm_address@20000000
    -- out out_unnamed_ethash_calculate_dag_item15_avm_burstcount@20000000
    -- out out_unnamed_ethash_calculate_dag_item15_avm_byteenable@20000000
    -- out out_unnamed_ethash_calculate_dag_item15_avm_enable@20000000
    -- out out_unnamed_ethash_calculate_dag_item15_avm_read@20000000
    -- out out_unnamed_ethash_calculate_dag_item15_avm_write@20000000
    -- out out_unnamed_ethash_calculate_dag_item15_avm_writedata@20000000
    thei_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x : i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item520
    PORT MAP (
        in_i_writedata_0_0 => i_phitmp_ethash_calculate_dag_item_ethash_calculate_dag_item516_phitmp_select_0_x_merged_bit_select_b,
        in_i_writedata_0_1 => i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_0_x_q,
        in_i_writedata_0_2 => i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_0_x_q,
        in_i_writedata_0_3 => i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_0_x_q,
        in_i_writedata_1_0 => i_phitmp_ethash_calculate_dag_item_ethash_calculate_dag_item516_phitmp_select_0_x_merged_bit_select_c,
        in_i_writedata_1_1 => i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_1_x_q,
        in_i_writedata_1_2 => i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_1_x_q,
        in_i_writedata_1_3 => i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_1_x_q,
        in_i_writedata_2_0 => i_phitmp_ethash_calculate_dag_item_ethash_calculate_dag_item516_phitmp_select_0_x_merged_bit_select_d,
        in_i_writedata_2_1 => i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_2_x_q,
        in_i_writedata_2_2 => i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_2_x_q,
        in_i_writedata_2_3 => i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_2_x_q,
        in_i_writedata_3_0 => i_phitmp_ethash_calculate_dag_item_ethash_calculate_dag_item516_phitmp_select_0_x_merged_bit_select_e,
        in_i_writedata_3_1 => i_dag_node_pm_2_lcssa_lcssa_off128_select_ethash_calculate_dag_item_3_x_q,
        in_i_writedata_3_2 => i_dag_node_pm_2_lcssa_lcssa_off256_select_ethash_calculate_dag_item_3_x_q,
        in_i_writedata_3_3 => i_dag_node_pm_2_lcssa_lcssa_off384_select_ethash_calculate_dag_item_3_x_q,
        in_flush => in_flush,
        in_i_address => i_arrayidx59_ethash_calculate_dag_item_ethash_calculate_dag_item519_dupName_0_trunc_sel_x_b,
        in_i_predicate => redist2_stall_entry_aunroll_o6_1_0_q,
        in_i_stall => SE_out_i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_backStall,
        in_i_valid => SE_i_phitmp2175_ethash_calculate_dag_item_ethash_calculate_dag_item513_phitmp2175_select_0_x_merged_bit_select_V0,
        in_unnamed_ethash_calculate_dag_item15_avm_readdata => in_unnamed_ethash_calculate_dag_item15_avm_readdata,
        in_unnamed_ethash_calculate_dag_item15_avm_readdatavalid => in_unnamed_ethash_calculate_dag_item15_avm_readdatavalid,
        in_unnamed_ethash_calculate_dag_item15_avm_waitrequest => in_unnamed_ethash_calculate_dag_item15_avm_waitrequest,
        in_unnamed_ethash_calculate_dag_item15_avm_writeack => in_unnamed_ethash_calculate_dag_item15_avm_writeack,
        out_lsu_unnamed_ethash_calculate_dag_item15_o_active => i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_out_lsu_unnamed_ethash_calculate_dag_item15_o_active,
        out_o_stall => i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_stall,
        out_o_valid => i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_out_o_valid,
        out_unnamed_ethash_calculate_dag_item15_avm_address => i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_address,
        out_unnamed_ethash_calculate_dag_item15_avm_burstcount => i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_burstcount,
        out_unnamed_ethash_calculate_dag_item15_avm_byteenable => i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_byteenable,
        out_unnamed_ethash_calculate_dag_item15_avm_enable => i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_enable,
        out_unnamed_ethash_calculate_dag_item15_avm_read => i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_read,
        out_unnamed_ethash_calculate_dag_item15_avm_write => i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_write,
        out_unnamed_ethash_calculate_dag_item15_avm_writedata => i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_ext_sig_sync_out_x(GPOUT,4)
    out_lsu_unnamed_ethash_calculate_dag_item15_o_active <= i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_out_lsu_unnamed_ethash_calculate_dag_item15_o_active;

    -- redist1_stall_entry_aunroll_o4_3_0(REG,158)
    redist1_stall_entry_aunroll_o4_3_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_aunroll_o4_3_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_rightShiftStage0Idx1Rng256_uid116_i_extract2169_ethash_calculate_dag_item_ethash_calculate_dag_item511_shift_x_merged_bit_select_c_1_0_backEN = "1") THEN
                redist1_stall_entry_aunroll_o4_3_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_aunroll_b);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_stall_entry_aunroll_o4_3_1(REG,159)
    redist1_stall_entry_aunroll_o4_3_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_aunroll_o4_3_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o4_3_1_backEN = "1") THEN
                redist1_stall_entry_aunroll_o4_3_1_q <= STD_LOGIC_VECTOR(redist1_stall_entry_aunroll_o4_3_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_stall_entry_aunroll_o4_3_2(REG,160)
    redist1_stall_entry_aunroll_o4_3_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_aunroll_o4_3_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o4_3_2_backEN = "1") THEN
                redist1_stall_entry_aunroll_o4_3_2_q <= STD_LOGIC_VECTOR(redist1_stall_entry_aunroll_o4_3_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- dupName_0_sync_out_x(GPOUT,8)@3
    out_acl_hw_wg_id38 <= redist1_stall_entry_aunroll_o4_3_2_q;
    out_valid_out <= SE_out_i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_V0;

    -- ext_sig_sync_out(GPOUT,67)
    out_unnamed_ethash_calculate_dag_item15_avm_address <= i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_address;
    out_unnamed_ethash_calculate_dag_item15_avm_enable <= i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_enable;
    out_unnamed_ethash_calculate_dag_item15_avm_read <= i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_read;
    out_unnamed_ethash_calculate_dag_item15_avm_write <= i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_write;
    out_unnamed_ethash_calculate_dag_item15_avm_writedata <= i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_writedata;
    out_unnamed_ethash_calculate_dag_item15_avm_byteenable <= i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_byteenable;
    out_unnamed_ethash_calculate_dag_item15_avm_burstcount <= i_store_unnamed_ethash_calculate_dag_item15_ethash_calculate_dag_item_aunroll_vunroll_x_out_unnamed_ethash_calculate_dag_item15_avm_burstcount;

    -- sync_out(GPOUT,93)@0
    out_stall_out <= SE_stall_entry_aunroll_backStall;

END normal;
