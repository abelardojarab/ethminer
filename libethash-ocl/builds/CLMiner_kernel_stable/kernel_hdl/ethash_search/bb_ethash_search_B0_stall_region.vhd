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

-- VHDL created from bb_ethash_search_B0_stall_region
-- VHDL created on Mon Apr  1 13:53:05 2019


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

entity bb_ethash_search_B0_stall_region is
    port (
        in_wgl_0_wgs_wg_size : in std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_g_header_load_0_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        out_memcoalesce_g_header_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_g_header_load_0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_g_header_load_0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_g_header_load_0_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_memcoalesce_g_header_load_0_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_memcoalesce_g_header_load_0_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        in_g_header : in std_logic_vector(63 downto 0);  -- ufix64
        in_acl_hw_wg_id : in std_logic_vector(31 downto 0);  -- ufix32
        in_global_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_acl_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_0979 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_0981 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_0983 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_0985 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_1980 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_1982 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_1984 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_1986 : out std_logic_vector(31 downto 0);  -- ufix32
        out_add : out std_logic_vector(63 downto 0);  -- ufix64
        out_global_id_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_grpid_0_addr : out std_logic_vector(31 downto 0);  -- ufix32
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_g_header_load_0_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_memcoalesce_g_header_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_g_header_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_g_header_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_start_nonce : in std_logic_vector(63 downto 0);  -- ufix64
        in_wgl_0_enter_exit_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_wgl_0_enter_exit_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_wgl_0_enter_exit_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_wgl_0_enter_exit_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_ethash_search_B0_stall_region;

architecture normal of bb_ethash_search_B0_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component ethash_search_B0_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_memcoalesce_g_header_load_0_ethash_search5 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_g_header_load_0_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_memcoalesce_g_header_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_g_header_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_g_header_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata_0 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_readdata_1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_readdata_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_readdata_3 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_memcoalesce_g_header_load_0_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_memcoalesce_g_header_load_0_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_g_header_load_0_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_memcoalesce_g_header_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_g_header_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_g_header_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_g_header_load_0_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_wg_limiter_enter_l_grpid_0_ethash_search0 is
        port (
            in_i_data : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_wgl_0_enter_exit_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_wgl_0_enter_exit_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_wgl_0_wgs_wg_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_wgl_0_enter_exit_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_wgl_0_enter_exit_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_g_header_sync_buffer_ethash_search3 is
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


    component i_syncbuf_start_nonce_sync_buffer_ethash_search15 is
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


    component acl_data_fifo is
        generic (
            DEPTH : INTEGER := 0;
            DATA_WIDTH : INTEGER := 32;
            STRICT_DEPTH : INTEGER := 0;
            ALLOW_FULL_WRITE : INTEGER := 0;
            IMPL : STRING := "ram"
        );
        port (
            clock : in std_logic;
            resetn : in std_logic;
            valid_in : in std_logic;
            stall_in : in std_logic;
            data_in : in std_logic_vector(DATA_WIDTH - 1 downto 0);
            valid_out : out std_logic;
            stall_out : out std_logic;
            data_out : out std_logic_vector(DATA_WIDTH - 1 downto 0);
            full : out std_logic;
            almost_full : out std_logic
        );
    end component;



    component acl_valid_fifo_counter is
        generic (
            DEPTH : INTEGER := 0;
            ASYNC_RESET : INTEGER := 1;
            STRICT_DEPTH : INTEGER := 0;
            ALLOW_FULL_WRITE : INTEGER := 0
        );
        port (
            clock : in std_logic;
            resetn : in std_logic;
            valid_in : in std_logic;
            stall_in : in std_logic;
            valid_out : out std_logic;
            stall_out : out std_logic;
            full : out std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bgTrunc_i_add_ethash_search_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B0_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B0_merge_reg_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B0_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B0_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_conv4_ethash_search_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_o_readdata_0 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_o_readdata_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_o_readdata_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_o_readdata_3 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_memcoalesce_g_header_load_0_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_memcoalesce_g_header_load_0_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_memcoalesce_g_header_load_0_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_memcoalesce_g_header_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_memcoalesce_g_header_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_memcoalesce_g_header_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_memcoalesce_g_header_load_0_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_wg_limiter_enter_l_grpid_0_ethash_search_out_o_data : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_wg_limiter_enter_l_grpid_0_ethash_search_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_wg_limiter_enter_l_grpid_0_ethash_search_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_wg_limiter_enter_l_grpid_0_ethash_search_out_wgl_0_enter_exit_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_wg_limiter_enter_l_grpid_0_ethash_search_out_wgl_0_enter_exit_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_add_ethash_search_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_add_ethash_search_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_add_ethash_search_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_add_ethash_search_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_conv4_ethash_search_vt_const_63_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv4_ethash_search_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_conv4_ethash_search_vt_select_31_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_l_grpid_0_addr_ethash_search_vt_const_9_q : STD_LOGIC_VECTOR (9 downto 0);
    signal i_l_grpid_0_addr_ethash_search_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_l_grpid_0_addr_ethash_search_vt_select_31_b : STD_LOGIC_VECTOR (21 downto 0);
    signal i_syncbuf_g_header_sync_buffer_ethash_search_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_g_header_sync_buffer_ethash_search_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_g_header_sync_buffer_ethash_search_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_start_nonce_sync_buffer_ethash_search_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_start_nonce_sync_buffer_ethash_search_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_start_nonce_sync_buffer_ethash_search_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0Idx1Pad8_uid65_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0Idx1Rng8_uid66_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_in : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx1Rng8_uid66_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx1_uid67_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0_uid69_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid69_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx1Pad2_uid70_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_q : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1Idx1Rng2_uid71_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_in : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage1Idx1Rng2_uid71_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_b : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage1Idx1_uid72_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1_uid74_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage1_uid74_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_ethash_search18_unnamed_ethash_search4_select_0_x_merged_bit_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_ethash_search18_unnamed_ethash_search4_select_0_x_merged_bit_select_c : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_ethash_search8_unnamed_ethash_search0_select_0_x_merged_bit_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_ethash_search8_unnamed_ethash_search0_select_0_x_merged_bit_select_c : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_ethash_search10_unnamed_ethash_search1_select_0_x_merged_bit_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_ethash_search10_unnamed_ethash_search1_select_0_x_merged_bit_select_c : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_ethash_search12_unnamed_ethash_search2_select_0_x_merged_bit_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_ethash_search12_unnamed_ethash_search2_select_0_x_merged_bit_select_c : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_ethash_search14_unnamed_ethash_search3_select_0_x_merged_bit_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_ethash_search14_unnamed_ethash_search3_select_0_x_merged_bit_select_c : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_ethash_search_B0_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_ethash_search_B0_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_ethash_search_B0_merge_reg_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_q : STD_LOGIC_VECTOR (255 downto 0);
    signal bubble_select_i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_c : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_d : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_e : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_acl_wg_limiter_enter_l_grpid_0_ethash_search_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_acl_wg_limiter_enter_l_grpid_0_ethash_search_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_g_header_sync_buffer_ethash_search_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_g_header_sync_buffer_ethash_search_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_syncbuf_start_nonce_sync_buffer_ethash_search_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_start_nonce_sync_buffer_ethash_search_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_out_ethash_search_B0_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B0_merge_reg_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B0_merge_reg_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B0_merge_reg_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B0_merge_reg_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B0_merge_reg_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B0_merge_reg_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B0_merge_reg_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B0_merge_reg_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B0_merge_reg_aunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B0_merge_reg_aunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B0_merge_reg_aunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B0_merge_reg_aunroll_x_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B0_merge_reg_aunroll_x_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B0_merge_reg_aunroll_x_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B0_merge_reg_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B0_merge_reg_aunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B0_merge_reg_aunroll_x_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B0_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B0_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B0_merge_reg_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B0_merge_reg_aunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_ethash_search_B0_merge_reg_aunroll_x_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_g_header_sync_buffer_ethash_search_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_g_header_sync_buffer_ethash_search_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_g_header_sync_buffer_ethash_search_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_ethash_search_B0_merge_reg_aunroll_x_2_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_ethash_search_B0_merge_reg_aunroll_x_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_ethash_search_B0_merge_reg_aunroll_x_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_ethash_search_B0_merge_reg_aunroll_x_2_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_ethash_search_B0_merge_reg_aunroll_x_2_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_ethash_search_B0_merge_reg_aunroll_x_2_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_ethash_search_B0_merge_reg_aunroll_x_2_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_ethash_search_B0_merge_reg_aunroll_x_2_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_ethash_search_B0_merge_reg_aunroll_x_2_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_ethash_search_B0_merge_reg_aunroll_x_2_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_ethash_search_B0_merge_reg_aunroll_x_2_reg_stall_out_bitsignaltemp : std_logic;

begin


    -- bubble_join_ethash_search_B0_merge_reg_aunroll_x(BITJOIN,87)
    bubble_join_ethash_search_B0_merge_reg_aunroll_x_q <= ethash_search_B0_merge_reg_aunroll_x_out_data_out_1 & ethash_search_B0_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_ethash_search_B0_merge_reg_aunroll_x(BITSELECT,88)
    bubble_select_ethash_search_B0_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B0_merge_reg_aunroll_x_q(31 downto 0));
    bubble_select_ethash_search_B0_merge_reg_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_ethash_search_B0_merge_reg_aunroll_x_q(63 downto 32));

    -- bubble_join_redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo(BITJOIN,114)
    bubble_join_redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_q <= redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_data_out;

    -- bubble_select_redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo(BITSELECT,115)
    bubble_select_redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_q(31 downto 0));

    -- i_acl_wg_limiter_enter_l_grpid_0_ethash_search(BLACKBOX,42)@10
    -- in in_i_stall@20000000
    -- out out_o_data@11
    -- out out_o_stall@20000000
    -- out out_o_valid@11
    -- out out_wgl_0_enter_exit_stall_out@20000000
    -- out out_wgl_0_enter_exit_valid_out@20000000
    thei_acl_wg_limiter_enter_l_grpid_0_ethash_search : i_acl_wg_limiter_enter_l_grpid_0_ethash_search0
    PORT MAP (
        in_i_data => bubble_select_redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_b,
        in_i_stall => SE_out_redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_backStall,
        in_i_valid => SE_out_redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_V0,
        in_wgl_0_enter_exit_stall_in => in_wgl_0_enter_exit_stall_in,
        in_wgl_0_enter_exit_valid_in => in_wgl_0_enter_exit_valid_in,
        in_wgl_0_wgs_wg_size => in_wgl_0_wgs_wg_size,
        out_o_data => i_acl_wg_limiter_enter_l_grpid_0_ethash_search_out_o_data,
        out_o_stall => i_acl_wg_limiter_enter_l_grpid_0_ethash_search_out_o_stall,
        out_o_valid => i_acl_wg_limiter_enter_l_grpid_0_ethash_search_out_o_valid,
        out_wgl_0_enter_exit_stall_out => i_acl_wg_limiter_enter_l_grpid_0_ethash_search_out_wgl_0_enter_exit_stall_out,
        out_wgl_0_enter_exit_valid_out => i_acl_wg_limiter_enter_l_grpid_0_ethash_search_out_wgl_0_enter_exit_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo(STALLENABLE,149)
    -- Valid signal propagation
    SE_out_redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_V0 <= SE_out_redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_backStall <= i_acl_wg_limiter_enter_l_grpid_0_ethash_search_out_o_stall or not (SE_out_redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_wireValid <= redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_valid_out;

    -- redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo(STALLFIFO,85)
    redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_valid_in <= SE_out_ethash_search_B0_merge_reg_aunroll_x_V3;
    redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_stall_in <= SE_out_redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_backStall;
    redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_data_in <= bubble_select_ethash_search_B0_merge_reg_aunroll_x_c;
    redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_valid_in_bitsignaltemp <= redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_valid_in(0);
    redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_stall_in_bitsignaltemp <= redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_stall_in(0);
    redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_valid_out(0) <= redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_valid_out_bitsignaltemp;
    redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_stall_out(0) <= redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_stall_out_bitsignaltemp;
    theredist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 10,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_valid_in_bitsignaltemp,
        stall_in => redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B0_merge_reg_aunroll_x_c,
        valid_out => redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_valid_out_bitsignaltemp,
        stall_out => redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_stall_out_bitsignaltemp,
        data_out => redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo(STALLFIFO,84)
    redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_valid_in <= SE_out_ethash_search_B0_merge_reg_aunroll_x_V2;
    redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_stall_in <= SE_out_redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_backStall;
    redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_data_in <= bubble_select_ethash_search_B0_merge_reg_aunroll_x_b;
    redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_valid_in_bitsignaltemp <= redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_valid_in(0);
    redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_stall_in_bitsignaltemp <= redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_stall_in(0);
    redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_valid_out(0) <= redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_valid_out_bitsignaltemp;
    redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_stall_out(0) <= redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_stall_out_bitsignaltemp;
    theredist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 11,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_valid_in_bitsignaltemp,
        stall_in => redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_ethash_search_B0_merge_reg_aunroll_x_b,
        valid_out => redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_valid_out_bitsignaltemp,
        stall_out => redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_stall_out_bitsignaltemp,
        data_out => redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- i_syncbuf_start_nonce_sync_buffer_ethash_search(BLACKBOX,53)@11
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_start_nonce_sync_buffer_ethash_search : i_syncbuf_start_nonce_sync_buffer_ethash_search15
    PORT MAP (
        in_buffer_in => in_start_nonce,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_backStall,
        in_valid_in => SE_out_bubble_out_ethash_search_B0_merge_reg_aunroll_x_2_V0,
        out_buffer_out => i_syncbuf_start_nonce_sync_buffer_ethash_search_out_buffer_out,
        out_stall_out => i_syncbuf_start_nonce_sync_buffer_ethash_search_out_stall_out,
        out_valid_out => i_syncbuf_start_nonce_sync_buffer_ethash_search_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_ethash_search_B0_merge_reg_aunroll_x_2(STALLENABLE,157)
    -- Valid signal propagation
    SE_out_bubble_out_ethash_search_B0_merge_reg_aunroll_x_2_V0 <= SE_out_bubble_out_ethash_search_B0_merge_reg_aunroll_x_2_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_ethash_search_B0_merge_reg_aunroll_x_2_backStall <= i_syncbuf_start_nonce_sync_buffer_ethash_search_out_stall_out or not (SE_out_bubble_out_ethash_search_B0_merge_reg_aunroll_x_2_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_ethash_search_B0_merge_reg_aunroll_x_2_wireValid <= bubble_out_ethash_search_B0_merge_reg_aunroll_x_2_reg_valid_out;

    -- bubble_out_ethash_search_B0_merge_reg_aunroll_x_2_reg(STALLFIFO,194)
    bubble_out_ethash_search_B0_merge_reg_aunroll_x_2_reg_valid_in <= SE_out_ethash_search_B0_merge_reg_aunroll_x_V1;
    bubble_out_ethash_search_B0_merge_reg_aunroll_x_2_reg_stall_in <= SE_out_bubble_out_ethash_search_B0_merge_reg_aunroll_x_2_backStall;
    bubble_out_ethash_search_B0_merge_reg_aunroll_x_2_reg_valid_in_bitsignaltemp <= bubble_out_ethash_search_B0_merge_reg_aunroll_x_2_reg_valid_in(0);
    bubble_out_ethash_search_B0_merge_reg_aunroll_x_2_reg_stall_in_bitsignaltemp <= bubble_out_ethash_search_B0_merge_reg_aunroll_x_2_reg_stall_in(0);
    bubble_out_ethash_search_B0_merge_reg_aunroll_x_2_reg_valid_out(0) <= bubble_out_ethash_search_B0_merge_reg_aunroll_x_2_reg_valid_out_bitsignaltemp;
    bubble_out_ethash_search_B0_merge_reg_aunroll_x_2_reg_stall_out(0) <= bubble_out_ethash_search_B0_merge_reg_aunroll_x_2_reg_stall_out_bitsignaltemp;
    thebubble_out_ethash_search_B0_merge_reg_aunroll_x_2_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 11,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_ethash_search_B0_merge_reg_aunroll_x_2_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_ethash_search_B0_merge_reg_aunroll_x_2_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_ethash_search_B0_merge_reg_aunroll_x_2_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_ethash_search_B0_merge_reg_aunroll_x_2_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_stall_entry(STALLENABLE,133)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= ethash_search_B0_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,107)
    bubble_join_stall_entry_q <= in_global_id_0 & in_acl_hw_wg_id;

    -- bubble_select_stall_entry(BITSELECT,108)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(31 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(63 downto 32));

    -- ethash_search_B0_merge_reg_aunroll_x(BLACKBOX,18)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_data_out_1@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    theethash_search_B0_merge_reg_aunroll_x : ethash_search_B0_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_c,
        in_data_in_1 => bubble_select_stall_entry_b,
        in_stall_in => SE_out_ethash_search_B0_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => ethash_search_B0_merge_reg_aunroll_x_out_data_out_0,
        out_data_out_1 => ethash_search_B0_merge_reg_aunroll_x_out_data_out_1,
        out_stall_out => ethash_search_B0_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => ethash_search_B0_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_ethash_search_B0_merge_reg_aunroll_x(STALLENABLE,118)
    SE_out_ethash_search_B0_merge_reg_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_ethash_search_B0_merge_reg_aunroll_x_fromReg0 <= (others => '0');
            SE_out_ethash_search_B0_merge_reg_aunroll_x_fromReg1 <= (others => '0');
            SE_out_ethash_search_B0_merge_reg_aunroll_x_fromReg2 <= (others => '0');
            SE_out_ethash_search_B0_merge_reg_aunroll_x_fromReg3 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_ethash_search_B0_merge_reg_aunroll_x_fromReg0 <= SE_out_ethash_search_B0_merge_reg_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_ethash_search_B0_merge_reg_aunroll_x_fromReg1 <= SE_out_ethash_search_B0_merge_reg_aunroll_x_toReg1;
            -- Succesor 2
            SE_out_ethash_search_B0_merge_reg_aunroll_x_fromReg2 <= SE_out_ethash_search_B0_merge_reg_aunroll_x_toReg2;
            -- Succesor 3
            SE_out_ethash_search_B0_merge_reg_aunroll_x_fromReg3 <= SE_out_ethash_search_B0_merge_reg_aunroll_x_toReg3;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_ethash_search_B0_merge_reg_aunroll_x_consumed0 <= (not (i_syncbuf_g_header_sync_buffer_ethash_search_out_stall_out) and SE_out_ethash_search_B0_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B0_merge_reg_aunroll_x_fromReg0;
    SE_out_ethash_search_B0_merge_reg_aunroll_x_consumed1 <= (not (bubble_out_ethash_search_B0_merge_reg_aunroll_x_2_reg_stall_out) and SE_out_ethash_search_B0_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B0_merge_reg_aunroll_x_fromReg1;
    SE_out_ethash_search_B0_merge_reg_aunroll_x_consumed2 <= (not (redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_stall_out) and SE_out_ethash_search_B0_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B0_merge_reg_aunroll_x_fromReg2;
    SE_out_ethash_search_B0_merge_reg_aunroll_x_consumed3 <= (not (redist1_ethash_search_B0_merge_reg_aunroll_x_out_data_out_1_9_fifo_stall_out) and SE_out_ethash_search_B0_merge_reg_aunroll_x_wireValid) or SE_out_ethash_search_B0_merge_reg_aunroll_x_fromReg3;
    -- Consuming
    SE_out_ethash_search_B0_merge_reg_aunroll_x_StallValid <= SE_out_ethash_search_B0_merge_reg_aunroll_x_backStall and SE_out_ethash_search_B0_merge_reg_aunroll_x_wireValid;
    SE_out_ethash_search_B0_merge_reg_aunroll_x_toReg0 <= SE_out_ethash_search_B0_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B0_merge_reg_aunroll_x_consumed0;
    SE_out_ethash_search_B0_merge_reg_aunroll_x_toReg1 <= SE_out_ethash_search_B0_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B0_merge_reg_aunroll_x_consumed1;
    SE_out_ethash_search_B0_merge_reg_aunroll_x_toReg2 <= SE_out_ethash_search_B0_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B0_merge_reg_aunroll_x_consumed2;
    SE_out_ethash_search_B0_merge_reg_aunroll_x_toReg3 <= SE_out_ethash_search_B0_merge_reg_aunroll_x_StallValid and SE_out_ethash_search_B0_merge_reg_aunroll_x_consumed3;
    -- Backward Stall generation
    SE_out_ethash_search_B0_merge_reg_aunroll_x_or0 <= SE_out_ethash_search_B0_merge_reg_aunroll_x_consumed0;
    SE_out_ethash_search_B0_merge_reg_aunroll_x_or1 <= SE_out_ethash_search_B0_merge_reg_aunroll_x_consumed1 and SE_out_ethash_search_B0_merge_reg_aunroll_x_or0;
    SE_out_ethash_search_B0_merge_reg_aunroll_x_or2 <= SE_out_ethash_search_B0_merge_reg_aunroll_x_consumed2 and SE_out_ethash_search_B0_merge_reg_aunroll_x_or1;
    SE_out_ethash_search_B0_merge_reg_aunroll_x_wireStall <= not (SE_out_ethash_search_B0_merge_reg_aunroll_x_consumed3 and SE_out_ethash_search_B0_merge_reg_aunroll_x_or2);
    SE_out_ethash_search_B0_merge_reg_aunroll_x_backStall <= SE_out_ethash_search_B0_merge_reg_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_ethash_search_B0_merge_reg_aunroll_x_V0 <= SE_out_ethash_search_B0_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B0_merge_reg_aunroll_x_fromReg0);
    SE_out_ethash_search_B0_merge_reg_aunroll_x_V1 <= SE_out_ethash_search_B0_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B0_merge_reg_aunroll_x_fromReg1);
    SE_out_ethash_search_B0_merge_reg_aunroll_x_V2 <= SE_out_ethash_search_B0_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B0_merge_reg_aunroll_x_fromReg2);
    SE_out_ethash_search_B0_merge_reg_aunroll_x_V3 <= SE_out_ethash_search_B0_merge_reg_aunroll_x_wireValid and not (SE_out_ethash_search_B0_merge_reg_aunroll_x_fromReg3);
    -- Computing multiple Valid(s)
    SE_out_ethash_search_B0_merge_reg_aunroll_x_wireValid <= ethash_search_B0_merge_reg_aunroll_x_out_valid_out;

    -- i_syncbuf_g_header_sync_buffer_ethash_search(BLACKBOX,52)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_g_header_sync_buffer_ethash_search : i_syncbuf_g_header_sync_buffer_ethash_search3
    PORT MAP (
        in_buffer_in => in_g_header,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_g_header_sync_buffer_ethash_search_backStall,
        in_valid_in => SE_out_ethash_search_B0_merge_reg_aunroll_x_V0,
        out_buffer_out => i_syncbuf_g_header_sync_buffer_ethash_search_out_buffer_out,
        out_stall_out => i_syncbuf_g_header_sync_buffer_ethash_search_out_stall_out,
        out_valid_out => i_syncbuf_g_header_sync_buffer_ethash_search_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_syncbuf_g_header_sync_buffer_ethash_search(STALLENABLE,130)
    -- Valid signal propagation
    SE_out_i_syncbuf_g_header_sync_buffer_ethash_search_V0 <= SE_out_i_syncbuf_g_header_sync_buffer_ethash_search_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_g_header_sync_buffer_ethash_search_backStall <= i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_o_stall or not (SE_out_i_syncbuf_g_header_sync_buffer_ethash_search_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_g_header_sync_buffer_ethash_search_wireValid <= i_syncbuf_g_header_sync_buffer_ethash_search_out_valid_out;

    -- SE_out_redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo(STALLENABLE,147)
    -- Valid signal propagation
    SE_out_redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_V0 <= SE_out_redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_backStall <= in_stall_in or not (SE_out_redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_and0 <= redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_valid_out;
    SE_out_redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_and1 <= i_syncbuf_start_nonce_sync_buffer_ethash_search_out_valid_out and SE_out_redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_and0;
    SE_out_redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_and2 <= i_acl_wg_limiter_enter_l_grpid_0_ethash_search_out_o_valid and SE_out_redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_and1;
    SE_out_redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_wireValid <= i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_o_valid and SE_out_redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_and2;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- bubble_join_i_syncbuf_g_header_sync_buffer_ethash_search(BITJOIN,100)
    bubble_join_i_syncbuf_g_header_sync_buffer_ethash_search_q <= i_syncbuf_g_header_sync_buffer_ethash_search_out_buffer_out;

    -- bubble_select_i_syncbuf_g_header_sync_buffer_ethash_search(BITSELECT,101)
    bubble_select_i_syncbuf_g_header_sync_buffer_ethash_search_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_g_header_sync_buffer_ethash_search_q(63 downto 0));

    -- i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x(BLACKBOX,24)@1
    -- in in_i_stall@20000000
    -- out out_o_readdata_0@11
    -- out out_o_readdata_1@11
    -- out out_o_readdata_2@11
    -- out out_o_readdata_3@11
    -- out out_memcoalesce_g_header_load_0_avm_address@20000000
    -- out out_memcoalesce_g_header_load_0_avm_burstcount@20000000
    -- out out_memcoalesce_g_header_load_0_avm_byteenable@20000000
    -- out out_memcoalesce_g_header_load_0_avm_enable@20000000
    -- out out_memcoalesce_g_header_load_0_avm_read@20000000
    -- out out_memcoalesce_g_header_load_0_avm_write@20000000
    -- out out_memcoalesce_g_header_load_0_avm_writedata@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@11
    thei_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x : i_load_memcoalesce_g_header_load_0_ethash_search5
    PORT MAP (
        in_flush => in_flush,
        in_i_address => bubble_select_i_syncbuf_g_header_sync_buffer_ethash_search_b,
        in_i_predicate => GND_q,
        in_i_stall => SE_out_redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_backStall,
        in_i_valid => SE_out_i_syncbuf_g_header_sync_buffer_ethash_search_V0,
        in_memcoalesce_g_header_load_0_avm_readdata => in_memcoalesce_g_header_load_0_avm_readdata,
        in_memcoalesce_g_header_load_0_avm_readdatavalid => in_memcoalesce_g_header_load_0_avm_readdatavalid,
        in_memcoalesce_g_header_load_0_avm_waitrequest => in_memcoalesce_g_header_load_0_avm_waitrequest,
        in_memcoalesce_g_header_load_0_avm_writeack => in_memcoalesce_g_header_load_0_avm_writeack,
        out_o_readdata_0 => i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_o_readdata_0,
        out_o_readdata_1 => i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_o_readdata_1,
        out_o_readdata_2 => i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_o_readdata_2,
        out_o_readdata_3 => i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_o_readdata_3,
        out_memcoalesce_g_header_load_0_avm_address => i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_memcoalesce_g_header_load_0_avm_address,
        out_memcoalesce_g_header_load_0_avm_burstcount => i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_memcoalesce_g_header_load_0_avm_burstcount,
        out_memcoalesce_g_header_load_0_avm_byteenable => i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_memcoalesce_g_header_load_0_avm_byteenable,
        out_memcoalesce_g_header_load_0_avm_enable => i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_memcoalesce_g_header_load_0_avm_enable,
        out_memcoalesce_g_header_load_0_avm_read => i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_memcoalesce_g_header_load_0_avm_read,
        out_memcoalesce_g_header_load_0_avm_write => i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_memcoalesce_g_header_load_0_avm_write,
        out_memcoalesce_g_header_load_0_avm_writedata => i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_memcoalesce_g_header_load_0_avm_writedata,
        out_o_stall => i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_o_stall,
        out_o_valid => i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_ext_sig_sync_out_x(GPOUT,4)
    out_memcoalesce_g_header_load_0_avm_address <= i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_memcoalesce_g_header_load_0_avm_address;
    out_memcoalesce_g_header_load_0_avm_enable <= i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_memcoalesce_g_header_load_0_avm_enable;
    out_memcoalesce_g_header_load_0_avm_read <= i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_memcoalesce_g_header_load_0_avm_read;
    out_memcoalesce_g_header_load_0_avm_write <= i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_memcoalesce_g_header_load_0_avm_write;
    out_memcoalesce_g_header_load_0_avm_writedata <= i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_memcoalesce_g_header_load_0_avm_writedata;
    out_memcoalesce_g_header_load_0_avm_byteenable <= i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_memcoalesce_g_header_load_0_avm_byteenable;
    out_memcoalesce_g_header_load_0_avm_burstcount <= i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_memcoalesce_g_header_load_0_avm_burstcount;

    -- leftShiftStage1Idx1Rng2_uid71_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x(BITSELECT,70)@11
    leftShiftStage1Idx1Rng2_uid71_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_in <= leftShiftStage0_uid69_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_q(29 downto 0);
    leftShiftStage1Idx1Rng2_uid71_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_b <= leftShiftStage1Idx1Rng2_uid71_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_in(29 downto 0);

    -- leftShiftStage1Idx1Pad2_uid70_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x(CONSTANT,69)
    leftShiftStage1Idx1Pad2_uid70_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_q <= "00";

    -- leftShiftStage1Idx1_uid72_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x(BITJOIN,71)@11
    leftShiftStage1Idx1_uid72_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_q <= leftShiftStage1Idx1Rng2_uid71_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_b & leftShiftStage1Idx1Pad2_uid70_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_q;

    -- leftShiftStage0Idx1Rng8_uid66_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x(BITSELECT,65)@11
    leftShiftStage0Idx1Rng8_uid66_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_in <= bubble_select_i_acl_wg_limiter_enter_l_grpid_0_ethash_search_b(23 downto 0);
    leftShiftStage0Idx1Rng8_uid66_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_b <= leftShiftStage0Idx1Rng8_uid66_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_in(23 downto 0);

    -- leftShiftStage0Idx1Pad8_uid65_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x(CONSTANT,64)
    leftShiftStage0Idx1Pad8_uid65_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_q <= "00000000";

    -- leftShiftStage0Idx1_uid67_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x(BITJOIN,66)@11
    leftShiftStage0Idx1_uid67_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_q <= leftShiftStage0Idx1Rng8_uid66_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_b & leftShiftStage0Idx1Pad8_uid65_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_q;

    -- leftShiftStage0_uid69_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x(MUX,68)@11
    leftShiftStage0_uid69_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_s <= VCC_q;
    leftShiftStage0_uid69_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_combproc: PROCESS (leftShiftStage0_uid69_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_s, bubble_select_i_acl_wg_limiter_enter_l_grpid_0_ethash_search_b, leftShiftStage0Idx1_uid67_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid69_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid69_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_q <= bubble_select_i_acl_wg_limiter_enter_l_grpid_0_ethash_search_b;
            WHEN "1" => leftShiftStage0_uid69_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_q <= leftShiftStage0Idx1_uid67_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid69_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- leftShiftStage1_uid74_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x(MUX,73)@11
    leftShiftStage1_uid74_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_s <= VCC_q;
    leftShiftStage1_uid74_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_combproc: PROCESS (leftShiftStage1_uid74_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_s, leftShiftStage0_uid69_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_q, leftShiftStage1Idx1_uid72_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_q)
    BEGIN
        CASE (leftShiftStage1_uid74_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_s) IS
            WHEN "0" => leftShiftStage1_uid74_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_q <= leftShiftStage0_uid69_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_q;
            WHEN "1" => leftShiftStage1_uid74_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_q <= leftShiftStage1Idx1_uid72_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_q;
            WHEN OTHERS => leftShiftStage1_uid74_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_l_grpid_0_addr_ethash_search_vt_select_31(BITSELECT,50)@11
    i_l_grpid_0_addr_ethash_search_vt_select_31_b <= leftShiftStage1_uid74_i_l_grpid_0_addr_ethash_search_ethash_search2_shift_x_q(31 downto 10);

    -- i_l_grpid_0_addr_ethash_search_vt_const_9(CONSTANT,48)
    i_l_grpid_0_addr_ethash_search_vt_const_9_q <= "0000000000";

    -- i_l_grpid_0_addr_ethash_search_vt_join(BITJOIN,49)@11
    i_l_grpid_0_addr_ethash_search_vt_join_q <= i_l_grpid_0_addr_ethash_search_vt_select_31_b & i_l_grpid_0_addr_ethash_search_vt_const_9_q;

    -- bubble_join_i_acl_wg_limiter_enter_l_grpid_0_ethash_search(BITJOIN,96)
    bubble_join_i_acl_wg_limiter_enter_l_grpid_0_ethash_search_q <= i_acl_wg_limiter_enter_l_grpid_0_ethash_search_out_o_data;

    -- bubble_select_i_acl_wg_limiter_enter_l_grpid_0_ethash_search(BITSELECT,97)
    bubble_select_i_acl_wg_limiter_enter_l_grpid_0_ethash_search_b <= STD_LOGIC_VECTOR(bubble_join_i_acl_wg_limiter_enter_l_grpid_0_ethash_search_q(31 downto 0));

    -- bubble_join_redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo(BITJOIN,111)
    bubble_join_redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_q <= redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_data_out;

    -- bubble_select_redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo(BITSELECT,112)
    bubble_select_redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_q(31 downto 0));

    -- bubble_join_i_syncbuf_start_nonce_sync_buffer_ethash_search(BITJOIN,103)
    bubble_join_i_syncbuf_start_nonce_sync_buffer_ethash_search_q <= i_syncbuf_start_nonce_sync_buffer_ethash_search_out_buffer_out;

    -- bubble_select_i_syncbuf_start_nonce_sync_buffer_ethash_search(BITSELECT,104)
    bubble_select_i_syncbuf_start_nonce_sync_buffer_ethash_search_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_start_nonce_sync_buffer_ethash_search_q(63 downto 0));

    -- i_conv4_ethash_search_vt_const_63(CONSTANT,45)
    i_conv4_ethash_search_vt_const_63_q <= "00000000000000000000000000000000";

    -- i_conv4_ethash_search_sel_x(BITSELECT,19)@11
    i_conv4_ethash_search_sel_x_b <= std_logic_vector(resize(unsigned(bubble_select_redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_b(31 downto 0)), 64));

    -- i_conv4_ethash_search_vt_select_31(BITSELECT,47)@11
    i_conv4_ethash_search_vt_select_31_b <= i_conv4_ethash_search_sel_x_b(31 downto 0);

    -- i_conv4_ethash_search_vt_join(BITJOIN,46)@11
    i_conv4_ethash_search_vt_join_q <= i_conv4_ethash_search_vt_const_63_q & i_conv4_ethash_search_vt_select_31_b;

    -- i_add_ethash_search(ADD,43)@11
    i_add_ethash_search_a <= STD_LOGIC_VECTOR("0" & i_conv4_ethash_search_vt_join_q);
    i_add_ethash_search_b <= STD_LOGIC_VECTOR("0" & bubble_select_i_syncbuf_start_nonce_sync_buffer_ethash_search_b);
    i_add_ethash_search_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add_ethash_search_a) + UNSIGNED(i_add_ethash_search_b));
    i_add_ethash_search_q <= i_add_ethash_search_o(64 downto 0);

    -- bgTrunc_i_add_ethash_search_sel_x(BITSELECT,2)@11
    bgTrunc_i_add_ethash_search_sel_x_b <= i_add_ethash_search_q(63 downto 0);

    -- i_unnamed_ethash_search18_unnamed_ethash_search4_select_0_x_merged_bit_select(BITSELECT,77)@11
    i_unnamed_ethash_search18_unnamed_ethash_search4_select_0_x_merged_bit_select_b <= bgTrunc_i_add_ethash_search_sel_x_b(31 downto 0);
    i_unnamed_ethash_search18_unnamed_ethash_search4_select_0_x_merged_bit_select_c <= bgTrunc_i_add_ethash_search_sel_x_b(63 downto 32);

    -- bubble_join_i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x(BITJOIN,92)
    bubble_join_i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_q <= i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_o_readdata_3 & i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_o_readdata_2 & i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_o_readdata_1 & i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_out_o_readdata_0;

    -- bubble_select_i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x(BITSELECT,93)
    bubble_select_i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_q(63 downto 0));
    bubble_select_i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_q(127 downto 64));
    bubble_select_i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_q(191 downto 128));
    bubble_select_i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_q(255 downto 192));

    -- i_unnamed_ethash_search14_unnamed_ethash_search3_select_0_x_merged_bit_select(BITSELECT,81)@11
    i_unnamed_ethash_search14_unnamed_ethash_search3_select_0_x_merged_bit_select_b <= bubble_select_i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_e(31 downto 0);
    i_unnamed_ethash_search14_unnamed_ethash_search3_select_0_x_merged_bit_select_c <= bubble_select_i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_e(63 downto 32);

    -- i_unnamed_ethash_search12_unnamed_ethash_search2_select_0_x_merged_bit_select(BITSELECT,80)@11
    i_unnamed_ethash_search12_unnamed_ethash_search2_select_0_x_merged_bit_select_b <= bubble_select_i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_d(31 downto 0);
    i_unnamed_ethash_search12_unnamed_ethash_search2_select_0_x_merged_bit_select_c <= bubble_select_i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_d(63 downto 32);

    -- i_unnamed_ethash_search10_unnamed_ethash_search1_select_0_x_merged_bit_select(BITSELECT,79)@11
    i_unnamed_ethash_search10_unnamed_ethash_search1_select_0_x_merged_bit_select_b <= bubble_select_i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_c(31 downto 0);
    i_unnamed_ethash_search10_unnamed_ethash_search1_select_0_x_merged_bit_select_c <= bubble_select_i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_c(63 downto 32);

    -- i_unnamed_ethash_search8_unnamed_ethash_search0_select_0_x_merged_bit_select(BITSELECT,78)@11
    i_unnamed_ethash_search8_unnamed_ethash_search0_select_0_x_merged_bit_select_b <= bubble_select_i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_b(31 downto 0);
    i_unnamed_ethash_search8_unnamed_ethash_search0_select_0_x_merged_bit_select_c <= bubble_select_i_load_memcoalesce_g_header_load_0_ethash_search_aunroll_x_b(63 downto 32);

    -- dupName_0_sync_out_x(GPOUT,9)@11
    out_acl_0 <= i_unnamed_ethash_search8_unnamed_ethash_search0_select_0_x_merged_bit_select_b;
    out_acl_0979 <= i_unnamed_ethash_search10_unnamed_ethash_search1_select_0_x_merged_bit_select_b;
    out_acl_0981 <= i_unnamed_ethash_search12_unnamed_ethash_search2_select_0_x_merged_bit_select_b;
    out_acl_0983 <= i_unnamed_ethash_search14_unnamed_ethash_search3_select_0_x_merged_bit_select_b;
    out_acl_0985 <= i_unnamed_ethash_search18_unnamed_ethash_search4_select_0_x_merged_bit_select_b;
    out_acl_1 <= i_unnamed_ethash_search8_unnamed_ethash_search0_select_0_x_merged_bit_select_c;
    out_acl_1980 <= i_unnamed_ethash_search10_unnamed_ethash_search1_select_0_x_merged_bit_select_c;
    out_acl_1982 <= i_unnamed_ethash_search12_unnamed_ethash_search2_select_0_x_merged_bit_select_c;
    out_acl_1984 <= i_unnamed_ethash_search14_unnamed_ethash_search3_select_0_x_merged_bit_select_c;
    out_acl_1986 <= i_unnamed_ethash_search18_unnamed_ethash_search4_select_0_x_merged_bit_select_c;
    out_add <= bgTrunc_i_add_ethash_search_sel_x_b;
    out_global_id_0 <= bubble_select_redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_b;
    out_l_grpid_0 <= bubble_select_i_acl_wg_limiter_enter_l_grpid_0_ethash_search_b;
    out_l_grpid_0_addr <= i_l_grpid_0_addr_ethash_search_vt_join_q;
    out_valid_out <= SE_out_redist0_ethash_search_B0_merge_reg_aunroll_x_out_data_out_0_10_fifo_V0;

    -- ext_sig_sync_out(GPOUT,41)
    out_wgl_0_enter_exit_valid_out <= i_acl_wg_limiter_enter_l_grpid_0_ethash_search_out_wgl_0_enter_exit_valid_out;
    out_wgl_0_enter_exit_stall_out <= i_acl_wg_limiter_enter_l_grpid_0_ethash_search_out_wgl_0_enter_exit_stall_out;

    -- sync_out(GPOUT,60)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
