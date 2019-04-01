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

-- VHDL created from bb_ethash_search_B0
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

entity bb_ethash_search_B0 is
    port (
        in_acl_hw_wg_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_g_dag : in std_logic_vector(63 downto 0);  -- ufix64
        in_g_header : in std_logic_vector(63 downto 0);  -- ufix64
        in_g_output : in std_logic_vector(63 downto 0);  -- ufix64
        in_global_id_0_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_isolate : in std_logic_vector(31 downto 0);  -- ufix32
        in_memcoalesce_g_header_load_0_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_memcoalesce_g_header_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_g_header_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_g_header_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_start_nonce : in std_logic_vector(63 downto 0);  -- ufix64
        in_target : in std_logic_vector(63 downto 0);  -- ufix64
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_wgl_0_enter_exit_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_wgl_0_enter_exit_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_wgl_0_wgs_wg_size : in std_logic_vector(31 downto 0);  -- ufix32
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
        out_memcoalesce_g_header_load_0_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        out_memcoalesce_g_header_load_0_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_g_header_load_0_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_memcoalesce_g_header_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_g_header_load_0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_g_header_load_0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_g_header_load_0_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_wgl_0_enter_exit_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_wgl_0_enter_exit_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_ethash_search_B0;

architecture normal of bb_ethash_search_B0 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_ethash_search_B0_stall_region is
        port (
            in_acl_hw_wg_id : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_g_header : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_global_id_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memcoalesce_g_header_load_0_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_memcoalesce_g_header_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_g_header_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_g_header_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_start_nonce : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_wgl_0_enter_exit_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_wgl_0_enter_exit_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_wgl_0_wgs_wg_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_0979 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_0981 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_0983 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_0985 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_1980 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_1982 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_1984 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_1986 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_add : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_global_id_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_g_header_load_0_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_memcoalesce_g_header_load_0_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_g_header_load_0_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_memcoalesce_g_header_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_g_header_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_g_header_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_g_header_load_0_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_wgl_0_enter_exit_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_wgl_0_enter_exit_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component ethash_search_B0_branch is
        port (
            in_acl_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_0979 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_0981 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_0983 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_0985 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_1980 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_1982 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_1984 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_1986 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_add : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_global_id_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_0_addr : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_0979 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_0981 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_0983 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_0985 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_1980 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_1982 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_1984 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_1986 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_add : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_global_id_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_0_addr : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component ethash_search_B0_merge is
        port (
            in_acl_hw_wg_id_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_id_0_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_hw_wg_id : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_global_id_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_ethash_search_B0_stall_region_out_acl_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B0_stall_region_out_acl_0979 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B0_stall_region_out_acl_0981 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B0_stall_region_out_acl_0983 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B0_stall_region_out_acl_0985 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B0_stall_region_out_acl_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B0_stall_region_out_acl_1980 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B0_stall_region_out_acl_1982 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B0_stall_region_out_acl_1984 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B0_stall_region_out_acl_1986 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B0_stall_region_out_add : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B0_stall_region_out_global_id_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B0_stall_region_out_l_grpid_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B0_stall_region_out_l_grpid_0_addr : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_search_B0_stall_region_out_memcoalesce_g_header_load_0_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal bb_ethash_search_B0_stall_region_out_memcoalesce_g_header_load_0_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B0_stall_region_out_memcoalesce_g_header_load_0_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B0_stall_region_out_memcoalesce_g_header_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B0_stall_region_out_memcoalesce_g_header_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B0_stall_region_out_memcoalesce_g_header_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B0_stall_region_out_memcoalesce_g_header_load_0_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal bb_ethash_search_B0_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B0_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B0_stall_region_out_wgl_0_enter_exit_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B0_stall_region_out_wgl_0_enter_exit_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B0_branch_out_acl_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B0_branch_out_acl_0979 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B0_branch_out_acl_0981 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B0_branch_out_acl_0983 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B0_branch_out_acl_0985 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B0_branch_out_acl_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B0_branch_out_acl_1980 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B0_branch_out_acl_1982 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B0_branch_out_acl_1984 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B0_branch_out_acl_1986 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B0_branch_out_add : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B0_branch_out_global_id_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B0_branch_out_l_grpid_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B0_branch_out_l_grpid_0_addr : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B0_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B0_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B0_merge_out_acl_hw_wg_id : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B0_merge_out_global_id_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B0_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B0_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- ethash_search_B0_merge(BLACKBOX,4)
    theethash_search_B0_merge : ethash_search_B0_merge
    PORT MAP (
        in_acl_hw_wg_id_0 => in_acl_hw_wg_id_0,
        in_global_id_0_0 => in_global_id_0_0,
        in_stall_in => bb_ethash_search_B0_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        out_acl_hw_wg_id => ethash_search_B0_merge_out_acl_hw_wg_id,
        out_global_id_0 => ethash_search_B0_merge_out_global_id_0,
        out_stall_out_0 => ethash_search_B0_merge_out_stall_out_0,
        out_valid_out => ethash_search_B0_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_search_B0_stall_region(BLACKBOX,2)
    thebb_ethash_search_B0_stall_region : bb_ethash_search_B0_stall_region
    PORT MAP (
        in_acl_hw_wg_id => ethash_search_B0_merge_out_acl_hw_wg_id,
        in_flush => in_flush,
        in_g_header => in_g_header,
        in_global_id_0 => ethash_search_B0_merge_out_global_id_0,
        in_memcoalesce_g_header_load_0_avm_readdata => in_memcoalesce_g_header_load_0_avm_readdata,
        in_memcoalesce_g_header_load_0_avm_readdatavalid => in_memcoalesce_g_header_load_0_avm_readdatavalid,
        in_memcoalesce_g_header_load_0_avm_waitrequest => in_memcoalesce_g_header_load_0_avm_waitrequest,
        in_memcoalesce_g_header_load_0_avm_writeack => in_memcoalesce_g_header_load_0_avm_writeack,
        in_stall_in => ethash_search_B0_branch_out_stall_out,
        in_start_nonce => in_start_nonce,
        in_valid_in => ethash_search_B0_merge_out_valid_out,
        in_wgl_0_enter_exit_stall_in => in_wgl_0_enter_exit_stall_in,
        in_wgl_0_enter_exit_valid_in => in_wgl_0_enter_exit_valid_in,
        in_wgl_0_wgs_wg_size => in_wgl_0_wgs_wg_size,
        out_acl_0 => bb_ethash_search_B0_stall_region_out_acl_0,
        out_acl_0979 => bb_ethash_search_B0_stall_region_out_acl_0979,
        out_acl_0981 => bb_ethash_search_B0_stall_region_out_acl_0981,
        out_acl_0983 => bb_ethash_search_B0_stall_region_out_acl_0983,
        out_acl_0985 => bb_ethash_search_B0_stall_region_out_acl_0985,
        out_acl_1 => bb_ethash_search_B0_stall_region_out_acl_1,
        out_acl_1980 => bb_ethash_search_B0_stall_region_out_acl_1980,
        out_acl_1982 => bb_ethash_search_B0_stall_region_out_acl_1982,
        out_acl_1984 => bb_ethash_search_B0_stall_region_out_acl_1984,
        out_acl_1986 => bb_ethash_search_B0_stall_region_out_acl_1986,
        out_add => bb_ethash_search_B0_stall_region_out_add,
        out_global_id_0 => bb_ethash_search_B0_stall_region_out_global_id_0,
        out_l_grpid_0 => bb_ethash_search_B0_stall_region_out_l_grpid_0,
        out_l_grpid_0_addr => bb_ethash_search_B0_stall_region_out_l_grpid_0_addr,
        out_memcoalesce_g_header_load_0_avm_address => bb_ethash_search_B0_stall_region_out_memcoalesce_g_header_load_0_avm_address,
        out_memcoalesce_g_header_load_0_avm_burstcount => bb_ethash_search_B0_stall_region_out_memcoalesce_g_header_load_0_avm_burstcount,
        out_memcoalesce_g_header_load_0_avm_byteenable => bb_ethash_search_B0_stall_region_out_memcoalesce_g_header_load_0_avm_byteenable,
        out_memcoalesce_g_header_load_0_avm_enable => bb_ethash_search_B0_stall_region_out_memcoalesce_g_header_load_0_avm_enable,
        out_memcoalesce_g_header_load_0_avm_read => bb_ethash_search_B0_stall_region_out_memcoalesce_g_header_load_0_avm_read,
        out_memcoalesce_g_header_load_0_avm_write => bb_ethash_search_B0_stall_region_out_memcoalesce_g_header_load_0_avm_write,
        out_memcoalesce_g_header_load_0_avm_writedata => bb_ethash_search_B0_stall_region_out_memcoalesce_g_header_load_0_avm_writedata,
        out_stall_out => bb_ethash_search_B0_stall_region_out_stall_out,
        out_valid_out => bb_ethash_search_B0_stall_region_out_valid_out,
        out_wgl_0_enter_exit_stall_out => bb_ethash_search_B0_stall_region_out_wgl_0_enter_exit_stall_out,
        out_wgl_0_enter_exit_valid_out => bb_ethash_search_B0_stall_region_out_wgl_0_enter_exit_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- ethash_search_B0_branch(BLACKBOX,3)
    theethash_search_B0_branch : ethash_search_B0_branch
    PORT MAP (
        in_acl_0 => bb_ethash_search_B0_stall_region_out_acl_0,
        in_acl_0979 => bb_ethash_search_B0_stall_region_out_acl_0979,
        in_acl_0981 => bb_ethash_search_B0_stall_region_out_acl_0981,
        in_acl_0983 => bb_ethash_search_B0_stall_region_out_acl_0983,
        in_acl_0985 => bb_ethash_search_B0_stall_region_out_acl_0985,
        in_acl_1 => bb_ethash_search_B0_stall_region_out_acl_1,
        in_acl_1980 => bb_ethash_search_B0_stall_region_out_acl_1980,
        in_acl_1982 => bb_ethash_search_B0_stall_region_out_acl_1982,
        in_acl_1984 => bb_ethash_search_B0_stall_region_out_acl_1984,
        in_acl_1986 => bb_ethash_search_B0_stall_region_out_acl_1986,
        in_add => bb_ethash_search_B0_stall_region_out_add,
        in_global_id_0 => bb_ethash_search_B0_stall_region_out_global_id_0,
        in_l_grpid_0 => bb_ethash_search_B0_stall_region_out_l_grpid_0,
        in_l_grpid_0_addr => bb_ethash_search_B0_stall_region_out_l_grpid_0_addr,
        in_stall_in_0 => in_stall_in_0,
        in_valid_in => bb_ethash_search_B0_stall_region_out_valid_out,
        out_acl_0 => ethash_search_B0_branch_out_acl_0,
        out_acl_0979 => ethash_search_B0_branch_out_acl_0979,
        out_acl_0981 => ethash_search_B0_branch_out_acl_0981,
        out_acl_0983 => ethash_search_B0_branch_out_acl_0983,
        out_acl_0985 => ethash_search_B0_branch_out_acl_0985,
        out_acl_1 => ethash_search_B0_branch_out_acl_1,
        out_acl_1980 => ethash_search_B0_branch_out_acl_1980,
        out_acl_1982 => ethash_search_B0_branch_out_acl_1982,
        out_acl_1984 => ethash_search_B0_branch_out_acl_1984,
        out_acl_1986 => ethash_search_B0_branch_out_acl_1986,
        out_add => ethash_search_B0_branch_out_add,
        out_global_id_0 => ethash_search_B0_branch_out_global_id_0,
        out_l_grpid_0 => ethash_search_B0_branch_out_l_grpid_0,
        out_l_grpid_0_addr => ethash_search_B0_branch_out_l_grpid_0_addr,
        out_stall_out => ethash_search_B0_branch_out_stall_out,
        out_valid_out_0 => ethash_search_B0_branch_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- out_acl_0(GPOUT,23)
    out_acl_0 <= ethash_search_B0_branch_out_acl_0;

    -- out_acl_0979(GPOUT,24)
    out_acl_0979 <= ethash_search_B0_branch_out_acl_0979;

    -- out_acl_0981(GPOUT,25)
    out_acl_0981 <= ethash_search_B0_branch_out_acl_0981;

    -- out_acl_0983(GPOUT,26)
    out_acl_0983 <= ethash_search_B0_branch_out_acl_0983;

    -- out_acl_0985(GPOUT,27)
    out_acl_0985 <= ethash_search_B0_branch_out_acl_0985;

    -- out_acl_1(GPOUT,28)
    out_acl_1 <= ethash_search_B0_branch_out_acl_1;

    -- out_acl_1980(GPOUT,29)
    out_acl_1980 <= ethash_search_B0_branch_out_acl_1980;

    -- out_acl_1982(GPOUT,30)
    out_acl_1982 <= ethash_search_B0_branch_out_acl_1982;

    -- out_acl_1984(GPOUT,31)
    out_acl_1984 <= ethash_search_B0_branch_out_acl_1984;

    -- out_acl_1986(GPOUT,32)
    out_acl_1986 <= ethash_search_B0_branch_out_acl_1986;

    -- out_add(GPOUT,33)
    out_add <= ethash_search_B0_branch_out_add;

    -- out_global_id_0(GPOUT,34)
    out_global_id_0 <= ethash_search_B0_branch_out_global_id_0;

    -- out_l_grpid_0(GPOUT,35)
    out_l_grpid_0 <= ethash_search_B0_branch_out_l_grpid_0;

    -- out_l_grpid_0_addr(GPOUT,36)
    out_l_grpid_0_addr <= ethash_search_B0_branch_out_l_grpid_0_addr;

    -- out_memcoalesce_g_header_load_0_avm_address(GPOUT,37)
    out_memcoalesce_g_header_load_0_avm_address <= bb_ethash_search_B0_stall_region_out_memcoalesce_g_header_load_0_avm_address;

    -- out_memcoalesce_g_header_load_0_avm_burstcount(GPOUT,38)
    out_memcoalesce_g_header_load_0_avm_burstcount <= bb_ethash_search_B0_stall_region_out_memcoalesce_g_header_load_0_avm_burstcount;

    -- out_memcoalesce_g_header_load_0_avm_byteenable(GPOUT,39)
    out_memcoalesce_g_header_load_0_avm_byteenable <= bb_ethash_search_B0_stall_region_out_memcoalesce_g_header_load_0_avm_byteenable;

    -- out_memcoalesce_g_header_load_0_avm_enable(GPOUT,40)
    out_memcoalesce_g_header_load_0_avm_enable <= bb_ethash_search_B0_stall_region_out_memcoalesce_g_header_load_0_avm_enable;

    -- out_memcoalesce_g_header_load_0_avm_read(GPOUT,41)
    out_memcoalesce_g_header_load_0_avm_read <= bb_ethash_search_B0_stall_region_out_memcoalesce_g_header_load_0_avm_read;

    -- out_memcoalesce_g_header_load_0_avm_write(GPOUT,42)
    out_memcoalesce_g_header_load_0_avm_write <= bb_ethash_search_B0_stall_region_out_memcoalesce_g_header_load_0_avm_write;

    -- out_memcoalesce_g_header_load_0_avm_writedata(GPOUT,43)
    out_memcoalesce_g_header_load_0_avm_writedata <= bb_ethash_search_B0_stall_region_out_memcoalesce_g_header_load_0_avm_writedata;

    -- out_stall_out_0(GPOUT,44)
    out_stall_out_0 <= ethash_search_B0_merge_out_stall_out_0;

    -- out_valid_out_0(GPOUT,45)
    out_valid_out_0 <= ethash_search_B0_branch_out_valid_out_0;

    -- out_wgl_0_enter_exit_stall_out(GPOUT,46)
    out_wgl_0_enter_exit_stall_out <= bb_ethash_search_B0_stall_region_out_wgl_0_enter_exit_stall_out;

    -- out_wgl_0_enter_exit_valid_out(GPOUT,47)
    out_wgl_0_enter_exit_valid_out <= bb_ethash_search_B0_stall_region_out_wgl_0_enter_exit_valid_out;

END normal;
