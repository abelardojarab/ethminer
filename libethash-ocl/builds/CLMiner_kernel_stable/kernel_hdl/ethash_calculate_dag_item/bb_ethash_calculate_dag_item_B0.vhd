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

-- VHDL created from bb_ethash_calculate_dag_item_B0
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

entity bb_ethash_calculate_dag_item_B0 is
    port (
        in_acl_hw_wg_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_g_dag : in std_logic_vector(63 downto 0);  -- ufix64
        in_g_light : in std_logic_vector(63 downto 0);  -- ufix64
        in_global_id_0_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_isolate : in std_logic_vector(31 downto 0);  -- ufix32
        in_memcoalesce_g_light_load_0_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_memcoalesce_g_light_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_g_light_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_g_light_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_start : in std_logic_vector(31 downto 0);  -- ufix32
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_acl_01361 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_01370 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_01379 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_01385 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_01387 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_11362 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_11371 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_11380 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_11386 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_11388 : out std_logic_vector(31 downto 0);  -- ufix32
        out_acl_hw_wg_id : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_g_light_load_0_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        out_memcoalesce_g_light_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_memcoalesce_g_light_load_0_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_memcoalesce_g_light_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_g_light_load_0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_g_light_load_0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_g_light_load_0_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_reduction_ethash_calculate_dag_item_4_compressed : out std_logic_vector(1663 downto 0);  -- ufix1664
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_ethash_calculate_dag_item_B0;

architecture normal of bb_ethash_calculate_dag_item_B0 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_ethash_calculate_dag_item_B0_stall_region is
        port (
            in_acl_hw_wg_id : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_g_light : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_global_id_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memcoalesce_g_light_load_0_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_memcoalesce_g_light_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_g_light_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_g_light_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_start : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_01361 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_01370 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_01379 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_01385 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_01387 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_11362 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_11371 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_11380 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_11386 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_11388 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_hw_wg_id : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_0_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_0_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_0_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_reduction_ethash_calculate_dag_item_4_compressed : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component ethash_calculate_dag_item_B0_branch is
        port (
            in_acl_01361 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_01370 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_01379 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_01385 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_01387 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_11362 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_11371 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_11380 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_11386 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_11388 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_acl_hw_wg_id : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_reduction_ethash_calculate_dag_item_4_compressed : in std_logic_vector(1663 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_01361 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_01370 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_01379 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_01385 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_01387 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_11362 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_11371 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_11380 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_11386 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_11388 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_acl_hw_wg_id : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_reduction_ethash_calculate_dag_item_4_compressed : out std_logic_vector(1663 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component ethash_calculate_dag_item_B0_merge is
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


    signal bb_ethash_calculate_dag_item_B0_stall_region_out_acl_01361 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B0_stall_region_out_acl_01370 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B0_stall_region_out_acl_01379 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B0_stall_region_out_acl_01385 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B0_stall_region_out_acl_01387 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B0_stall_region_out_acl_11362 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B0_stall_region_out_acl_11371 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B0_stall_region_out_acl_11380 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B0_stall_region_out_acl_11386 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B0_stall_region_out_acl_11388 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B0_stall_region_out_acl_hw_wg_id : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B0_stall_region_out_c0_exe1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_ethash_calculate_dag_item_B0_stall_region_out_memcoalesce_g_light_load_0_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal bb_ethash_calculate_dag_item_B0_stall_region_out_memcoalesce_g_light_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_ethash_calculate_dag_item_B0_stall_region_out_memcoalesce_g_light_load_0_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_calculate_dag_item_B0_stall_region_out_memcoalesce_g_light_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B0_stall_region_out_memcoalesce_g_light_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B0_stall_region_out_memcoalesce_g_light_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B0_stall_region_out_memcoalesce_g_light_load_0_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal bb_ethash_calculate_dag_item_B0_stall_region_out_reduction_ethash_calculate_dag_item_4_compressed : STD_LOGIC_VECTOR (1663 downto 0);
    signal bb_ethash_calculate_dag_item_B0_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_calculate_dag_item_B0_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B0_branch_out_acl_01361 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B0_branch_out_acl_01370 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B0_branch_out_acl_01379 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B0_branch_out_acl_01385 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B0_branch_out_acl_01387 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B0_branch_out_acl_11362 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B0_branch_out_acl_11371 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B0_branch_out_acl_11380 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B0_branch_out_acl_11386 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B0_branch_out_acl_11388 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B0_branch_out_acl_hw_wg_id : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B0_branch_out_c0_exe1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B0_branch_out_reduction_ethash_calculate_dag_item_4_compressed : STD_LOGIC_VECTOR (1663 downto 0);
    signal ethash_calculate_dag_item_B0_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B0_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B0_merge_out_acl_hw_wg_id : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B0_merge_out_global_id_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_B0_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_B0_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- ethash_calculate_dag_item_B0_merge(BLACKBOX,4)
    theethash_calculate_dag_item_B0_merge : ethash_calculate_dag_item_B0_merge
    PORT MAP (
        in_acl_hw_wg_id_0 => in_acl_hw_wg_id_0,
        in_global_id_0_0 => in_global_id_0_0,
        in_stall_in => bb_ethash_calculate_dag_item_B0_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        out_acl_hw_wg_id => ethash_calculate_dag_item_B0_merge_out_acl_hw_wg_id,
        out_global_id_0 => ethash_calculate_dag_item_B0_merge_out_global_id_0,
        out_stall_out_0 => ethash_calculate_dag_item_B0_merge_out_stall_out_0,
        out_valid_out => ethash_calculate_dag_item_B0_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_calculate_dag_item_B0_stall_region(BLACKBOX,2)
    thebb_ethash_calculate_dag_item_B0_stall_region : bb_ethash_calculate_dag_item_B0_stall_region
    PORT MAP (
        in_acl_hw_wg_id => ethash_calculate_dag_item_B0_merge_out_acl_hw_wg_id,
        in_flush => in_flush,
        in_g_light => in_g_light,
        in_global_id_0 => ethash_calculate_dag_item_B0_merge_out_global_id_0,
        in_memcoalesce_g_light_load_0_avm_readdata => in_memcoalesce_g_light_load_0_avm_readdata,
        in_memcoalesce_g_light_load_0_avm_readdatavalid => in_memcoalesce_g_light_load_0_avm_readdatavalid,
        in_memcoalesce_g_light_load_0_avm_waitrequest => in_memcoalesce_g_light_load_0_avm_waitrequest,
        in_memcoalesce_g_light_load_0_avm_writeack => in_memcoalesce_g_light_load_0_avm_writeack,
        in_stall_in => ethash_calculate_dag_item_B0_branch_out_stall_out,
        in_start => in_start,
        in_valid_in => ethash_calculate_dag_item_B0_merge_out_valid_out,
        out_acl_01361 => bb_ethash_calculate_dag_item_B0_stall_region_out_acl_01361,
        out_acl_01370 => bb_ethash_calculate_dag_item_B0_stall_region_out_acl_01370,
        out_acl_01379 => bb_ethash_calculate_dag_item_B0_stall_region_out_acl_01379,
        out_acl_01385 => bb_ethash_calculate_dag_item_B0_stall_region_out_acl_01385,
        out_acl_01387 => bb_ethash_calculate_dag_item_B0_stall_region_out_acl_01387,
        out_acl_11362 => bb_ethash_calculate_dag_item_B0_stall_region_out_acl_11362,
        out_acl_11371 => bb_ethash_calculate_dag_item_B0_stall_region_out_acl_11371,
        out_acl_11380 => bb_ethash_calculate_dag_item_B0_stall_region_out_acl_11380,
        out_acl_11386 => bb_ethash_calculate_dag_item_B0_stall_region_out_acl_11386,
        out_acl_11388 => bb_ethash_calculate_dag_item_B0_stall_region_out_acl_11388,
        out_acl_hw_wg_id => bb_ethash_calculate_dag_item_B0_stall_region_out_acl_hw_wg_id,
        out_c0_exe1 => bb_ethash_calculate_dag_item_B0_stall_region_out_c0_exe1,
        out_memcoalesce_g_light_load_0_avm_address => bb_ethash_calculate_dag_item_B0_stall_region_out_memcoalesce_g_light_load_0_avm_address,
        out_memcoalesce_g_light_load_0_avm_burstcount => bb_ethash_calculate_dag_item_B0_stall_region_out_memcoalesce_g_light_load_0_avm_burstcount,
        out_memcoalesce_g_light_load_0_avm_byteenable => bb_ethash_calculate_dag_item_B0_stall_region_out_memcoalesce_g_light_load_0_avm_byteenable,
        out_memcoalesce_g_light_load_0_avm_enable => bb_ethash_calculate_dag_item_B0_stall_region_out_memcoalesce_g_light_load_0_avm_enable,
        out_memcoalesce_g_light_load_0_avm_read => bb_ethash_calculate_dag_item_B0_stall_region_out_memcoalesce_g_light_load_0_avm_read,
        out_memcoalesce_g_light_load_0_avm_write => bb_ethash_calculate_dag_item_B0_stall_region_out_memcoalesce_g_light_load_0_avm_write,
        out_memcoalesce_g_light_load_0_avm_writedata => bb_ethash_calculate_dag_item_B0_stall_region_out_memcoalesce_g_light_load_0_avm_writedata,
        out_reduction_ethash_calculate_dag_item_4_compressed => bb_ethash_calculate_dag_item_B0_stall_region_out_reduction_ethash_calculate_dag_item_4_compressed,
        out_stall_out => bb_ethash_calculate_dag_item_B0_stall_region_out_stall_out,
        out_valid_out => bb_ethash_calculate_dag_item_B0_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- ethash_calculate_dag_item_B0_branch(BLACKBOX,3)
    theethash_calculate_dag_item_B0_branch : ethash_calculate_dag_item_B0_branch
    PORT MAP (
        in_acl_01361 => bb_ethash_calculate_dag_item_B0_stall_region_out_acl_01361,
        in_acl_01370 => bb_ethash_calculate_dag_item_B0_stall_region_out_acl_01370,
        in_acl_01379 => bb_ethash_calculate_dag_item_B0_stall_region_out_acl_01379,
        in_acl_01385 => bb_ethash_calculate_dag_item_B0_stall_region_out_acl_01385,
        in_acl_01387 => bb_ethash_calculate_dag_item_B0_stall_region_out_acl_01387,
        in_acl_11362 => bb_ethash_calculate_dag_item_B0_stall_region_out_acl_11362,
        in_acl_11371 => bb_ethash_calculate_dag_item_B0_stall_region_out_acl_11371,
        in_acl_11380 => bb_ethash_calculate_dag_item_B0_stall_region_out_acl_11380,
        in_acl_11386 => bb_ethash_calculate_dag_item_B0_stall_region_out_acl_11386,
        in_acl_11388 => bb_ethash_calculate_dag_item_B0_stall_region_out_acl_11388,
        in_acl_hw_wg_id => bb_ethash_calculate_dag_item_B0_stall_region_out_acl_hw_wg_id,
        in_c0_exe1 => bb_ethash_calculate_dag_item_B0_stall_region_out_c0_exe1,
        in_reduction_ethash_calculate_dag_item_4_compressed => bb_ethash_calculate_dag_item_B0_stall_region_out_reduction_ethash_calculate_dag_item_4_compressed,
        in_stall_in_0 => in_stall_in_0,
        in_valid_in => bb_ethash_calculate_dag_item_B0_stall_region_out_valid_out,
        out_acl_01361 => ethash_calculate_dag_item_B0_branch_out_acl_01361,
        out_acl_01370 => ethash_calculate_dag_item_B0_branch_out_acl_01370,
        out_acl_01379 => ethash_calculate_dag_item_B0_branch_out_acl_01379,
        out_acl_01385 => ethash_calculate_dag_item_B0_branch_out_acl_01385,
        out_acl_01387 => ethash_calculate_dag_item_B0_branch_out_acl_01387,
        out_acl_11362 => ethash_calculate_dag_item_B0_branch_out_acl_11362,
        out_acl_11371 => ethash_calculate_dag_item_B0_branch_out_acl_11371,
        out_acl_11380 => ethash_calculate_dag_item_B0_branch_out_acl_11380,
        out_acl_11386 => ethash_calculate_dag_item_B0_branch_out_acl_11386,
        out_acl_11388 => ethash_calculate_dag_item_B0_branch_out_acl_11388,
        out_acl_hw_wg_id => ethash_calculate_dag_item_B0_branch_out_acl_hw_wg_id,
        out_c0_exe1 => ethash_calculate_dag_item_B0_branch_out_c0_exe1,
        out_reduction_ethash_calculate_dag_item_4_compressed => ethash_calculate_dag_item_B0_branch_out_reduction_ethash_calculate_dag_item_4_compressed,
        out_stall_out => ethash_calculate_dag_item_B0_branch_out_stall_out,
        out_valid_out_0 => ethash_calculate_dag_item_B0_branch_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- out_acl_01361(GPOUT,18)
    out_acl_01361 <= ethash_calculate_dag_item_B0_branch_out_acl_01361;

    -- out_acl_01370(GPOUT,19)
    out_acl_01370 <= ethash_calculate_dag_item_B0_branch_out_acl_01370;

    -- out_acl_01379(GPOUT,20)
    out_acl_01379 <= ethash_calculate_dag_item_B0_branch_out_acl_01379;

    -- out_acl_01385(GPOUT,21)
    out_acl_01385 <= ethash_calculate_dag_item_B0_branch_out_acl_01385;

    -- out_acl_01387(GPOUT,22)
    out_acl_01387 <= ethash_calculate_dag_item_B0_branch_out_acl_01387;

    -- out_acl_11362(GPOUT,23)
    out_acl_11362 <= ethash_calculate_dag_item_B0_branch_out_acl_11362;

    -- out_acl_11371(GPOUT,24)
    out_acl_11371 <= ethash_calculate_dag_item_B0_branch_out_acl_11371;

    -- out_acl_11380(GPOUT,25)
    out_acl_11380 <= ethash_calculate_dag_item_B0_branch_out_acl_11380;

    -- out_acl_11386(GPOUT,26)
    out_acl_11386 <= ethash_calculate_dag_item_B0_branch_out_acl_11386;

    -- out_acl_11388(GPOUT,27)
    out_acl_11388 <= ethash_calculate_dag_item_B0_branch_out_acl_11388;

    -- out_acl_hw_wg_id(GPOUT,28)
    out_acl_hw_wg_id <= ethash_calculate_dag_item_B0_branch_out_acl_hw_wg_id;

    -- out_c0_exe1(GPOUT,29)
    out_c0_exe1 <= ethash_calculate_dag_item_B0_branch_out_c0_exe1;

    -- out_memcoalesce_g_light_load_0_avm_address(GPOUT,30)
    out_memcoalesce_g_light_load_0_avm_address <= bb_ethash_calculate_dag_item_B0_stall_region_out_memcoalesce_g_light_load_0_avm_address;

    -- out_memcoalesce_g_light_load_0_avm_burstcount(GPOUT,31)
    out_memcoalesce_g_light_load_0_avm_burstcount <= bb_ethash_calculate_dag_item_B0_stall_region_out_memcoalesce_g_light_load_0_avm_burstcount;

    -- out_memcoalesce_g_light_load_0_avm_byteenable(GPOUT,32)
    out_memcoalesce_g_light_load_0_avm_byteenable <= bb_ethash_calculate_dag_item_B0_stall_region_out_memcoalesce_g_light_load_0_avm_byteenable;

    -- out_memcoalesce_g_light_load_0_avm_enable(GPOUT,33)
    out_memcoalesce_g_light_load_0_avm_enable <= bb_ethash_calculate_dag_item_B0_stall_region_out_memcoalesce_g_light_load_0_avm_enable;

    -- out_memcoalesce_g_light_load_0_avm_read(GPOUT,34)
    out_memcoalesce_g_light_load_0_avm_read <= bb_ethash_calculate_dag_item_B0_stall_region_out_memcoalesce_g_light_load_0_avm_read;

    -- out_memcoalesce_g_light_load_0_avm_write(GPOUT,35)
    out_memcoalesce_g_light_load_0_avm_write <= bb_ethash_calculate_dag_item_B0_stall_region_out_memcoalesce_g_light_load_0_avm_write;

    -- out_memcoalesce_g_light_load_0_avm_writedata(GPOUT,36)
    out_memcoalesce_g_light_load_0_avm_writedata <= bb_ethash_calculate_dag_item_B0_stall_region_out_memcoalesce_g_light_load_0_avm_writedata;

    -- out_reduction_ethash_calculate_dag_item_4_compressed(GPOUT,37)
    out_reduction_ethash_calculate_dag_item_4_compressed <= ethash_calculate_dag_item_B0_branch_out_reduction_ethash_calculate_dag_item_4_compressed;

    -- out_stall_out_0(GPOUT,38)
    out_stall_out_0 <= ethash_calculate_dag_item_B0_merge_out_stall_out_0;

    -- out_valid_out_0(GPOUT,39)
    out_valid_out_0 <= ethash_calculate_dag_item_B0_branch_out_valid_out_0;

END normal;
