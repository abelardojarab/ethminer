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

-- VHDL created from ethash_calculate_dag_item_function_wrapper
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

entity ethash_calculate_dag_item_function_wrapper is
    port (
        avm_memcoalesce_g_light_load_02193_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        avm_memcoalesce_g_light_load_02193_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_g_light_load_02193_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_g_light_load_02193_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_g_light_load_0_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        avm_memcoalesce_g_light_load_0_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_g_light_load_0_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_g_light_load_0_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_calculate_dag_item15_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        avm_unnamed_ethash_calculate_dag_item15_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_calculate_dag_item15_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_calculate_dag_item15_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        clock2x : in std_logic_vector(0 downto 0);  -- ufix1
        global_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        global_id_1 : in std_logic_vector(31 downto 0);  -- ufix32
        global_id_2 : in std_logic_vector(31 downto 0);  -- ufix32
        global_offset_0 : in std_logic_vector(31 downto 0);  -- ufix32
        global_offset_1 : in std_logic_vector(31 downto 0);  -- ufix32
        global_offset_2 : in std_logic_vector(31 downto 0);  -- ufix32
        global_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        global_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        global_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        group_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        group_id_1 : in std_logic_vector(31 downto 0);  -- ufix32
        group_id_2 : in std_logic_vector(31 downto 0);  -- ufix32
        kernel_arguments : in std_logic_vector(191 downto 0);  -- ufix192
        kernel_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        kernel_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        local_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        local_id_1 : in std_logic_vector(31 downto 0);  -- ufix32
        local_id_2 : in std_logic_vector(31 downto 0);  -- ufix32
        local_router_hang : in std_logic_vector(0 downto 0);  -- ufix1
        local_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        local_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        local_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        num_groups_0 : in std_logic_vector(31 downto 0);  -- ufix32
        num_groups_1 : in std_logic_vector(31 downto 0);  -- ufix32
        num_groups_2 : in std_logic_vector(31 downto 0);  -- ufix32
        stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        start : in std_logic_vector(0 downto 0);  -- ufix1
        valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        work_dim : in std_logic_vector(31 downto 0);  -- ufix32
        workgroup_size : in std_logic_vector(31 downto 0);  -- ufix32
        avm_memcoalesce_g_light_load_02193_address : out std_logic_vector(32 downto 0);  -- ufix33
        avm_memcoalesce_g_light_load_02193_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_memcoalesce_g_light_load_02193_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        avm_memcoalesce_g_light_load_02193_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_g_light_load_02193_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_g_light_load_02193_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_g_light_load_02193_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        avm_memcoalesce_g_light_load_0_address : out std_logic_vector(32 downto 0);  -- ufix33
        avm_memcoalesce_g_light_load_0_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_memcoalesce_g_light_load_0_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        avm_memcoalesce_g_light_load_0_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_g_light_load_0_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_g_light_load_0_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_g_light_load_0_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        avm_unnamed_ethash_calculate_dag_item15_address : out std_logic_vector(32 downto 0);  -- ufix33
        avm_unnamed_ethash_calculate_dag_item15_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_unnamed_ethash_calculate_dag_item15_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        avm_unnamed_ethash_calculate_dag_item15_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_calculate_dag_item15_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_calculate_dag_item15_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_ethash_calculate_dag_item15_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        clock2x_output : out std_logic_vector(0 downto 0);  -- ufix1
        has_a_lsu_active : out std_logic_vector(0 downto 0);  -- ufix1
        has_a_write_pending : out std_logic_vector(0 downto 0);  -- ufix1
        kernel_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        kernel_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end ethash_calculate_dag_item_function_wrapper;

architecture normal of ethash_calculate_dag_item_function_wrapper is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component acl_clock2x_holder is
        port (
            clock2x : in std_logic;
            myout : out std_logic;
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component ethash_calculate_dag_item_function is
        port (
            in_arg_acl_hw_wg_id : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_g_dag : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arg_g_light : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arg_global_id_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_isolate : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_start : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memcoalesce_g_light_load_02193_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_memcoalesce_g_light_load_02193_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_g_light_load_02193_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_g_light_load_02193_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_g_light_load_0_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_memcoalesce_g_light_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_g_light_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_g_light_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_start : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_calculate_dag_item15_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_unnamed_ethash_calculate_dag_item15_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_calculate_dag_item15_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_calculate_dag_item15_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_acl_hw_wg_id38 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_02193_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_02193_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_02193_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_02193_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_02193_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_02193_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_02193_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_0_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_0_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_g_light_load_0_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_o_active_unnamed_ethash_calculate_dag_item15 : out std_logic_vector(0 downto 0);  -- Fixed Point
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


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_1_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_2_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal acl_clock2x_dummy_consumer_clock2x : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_clock2x_dummy_consumer_clock2x_bitsignaltemp : std_logic;
    signal acl_clock2x_dummy_consumer_myout : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_clock2x_dummy_consumer_myout_bitsignaltemp : std_logic;
    signal arg_g_dag_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal arg_g_light_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal arg_isolate_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal arg_start_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal const_32_bit_zero_q : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_02193_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_02193_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_02193_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_02193_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_02193_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_02193_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_02193_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_0_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_0_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_0_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal ethash_calculate_dag_item_function_out_o_active_unnamed_ethash_calculate_dag_item15 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_function_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_function_out_unnamed_ethash_calculate_dag_item15_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal ethash_calculate_dag_item_function_out_unnamed_ethash_calculate_dag_item15_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal ethash_calculate_dag_item_function_out_unnamed_ethash_calculate_dag_item15_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_calculate_dag_item_function_out_unnamed_ethash_calculate_dag_item15_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_function_out_unnamed_ethash_calculate_dag_item15_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_function_out_unnamed_ethash_calculate_dag_item15_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_calculate_dag_item_function_out_unnamed_ethash_calculate_dag_item15_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal ethash_calculate_dag_item_function_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ip_dsdk_adapt_cast_b : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- arg_start_select(BITSELECT,9)
    arg_start_select_b <= kernel_arguments(31 downto 0);

    -- ip_dsdk_adapt_cast(BITSELECT,56)
    ip_dsdk_adapt_cast_b <= arg_start_select_b(31 downto 0);

    -- arg_isolate_select(BITSELECT,8)
    arg_isolate_select_b <= kernel_arguments(191 downto 160);

    -- dupName_2_ip_dsdk_adapt_cast_x(BITSELECT,4)
    dupName_2_ip_dsdk_adapt_cast_x_b <= arg_isolate_select_b(31 downto 0);

    -- arg_g_light_select(BITSELECT,7)
    arg_g_light_select_b <= kernel_arguments(95 downto 32);

    -- dupName_0_ip_dsdk_adapt_cast_x(BITSELECT,2)
    dupName_0_ip_dsdk_adapt_cast_x_b <= arg_g_light_select_b(63 downto 0);

    -- arg_g_dag_select(BITSELECT,6)
    arg_g_dag_select_b <= kernel_arguments(159 downto 96);

    -- dupName_1_ip_dsdk_adapt_cast_x(BITSELECT,3)
    dupName_1_ip_dsdk_adapt_cast_x_b <= arg_g_dag_select_b(63 downto 0);

    -- const_32_bit_zero(CONSTANT,11)
    const_32_bit_zero_q <= "00000000000000000000000000000000";

    -- ethash_calculate_dag_item_function(BLACKBOX,12)
    theethash_calculate_dag_item_function : ethash_calculate_dag_item_function
    PORT MAP (
        in_arg_acl_hw_wg_id => const_32_bit_zero_q,
        in_arg_g_dag => dupName_1_ip_dsdk_adapt_cast_x_b,
        in_arg_g_light => dupName_0_ip_dsdk_adapt_cast_x_b,
        in_arg_global_id_0 => global_id_0,
        in_arg_global_size_0 => global_size_0,
        in_arg_global_size_1 => global_size_1,
        in_arg_global_size_2 => global_size_2,
        in_arg_isolate => dupName_2_ip_dsdk_adapt_cast_x_b,
        in_arg_local_size_0 => local_size_0,
        in_arg_local_size_1 => local_size_1,
        in_arg_local_size_2 => local_size_2,
        in_arg_start => ip_dsdk_adapt_cast_b,
        in_memcoalesce_g_light_load_02193_avm_readdata => avm_memcoalesce_g_light_load_02193_readdata,
        in_memcoalesce_g_light_load_02193_avm_readdatavalid => avm_memcoalesce_g_light_load_02193_readdatavalid,
        in_memcoalesce_g_light_load_02193_avm_waitrequest => avm_memcoalesce_g_light_load_02193_waitrequest,
        in_memcoalesce_g_light_load_02193_avm_writeack => avm_memcoalesce_g_light_load_02193_writeack,
        in_memcoalesce_g_light_load_0_avm_readdata => avm_memcoalesce_g_light_load_0_readdata,
        in_memcoalesce_g_light_load_0_avm_readdatavalid => avm_memcoalesce_g_light_load_0_readdatavalid,
        in_memcoalesce_g_light_load_0_avm_waitrequest => avm_memcoalesce_g_light_load_0_waitrequest,
        in_memcoalesce_g_light_load_0_avm_writeack => avm_memcoalesce_g_light_load_0_writeack,
        in_stall_in => GND_q,
        in_start => start,
        in_unnamed_ethash_calculate_dag_item15_avm_readdata => avm_unnamed_ethash_calculate_dag_item15_readdata,
        in_unnamed_ethash_calculate_dag_item15_avm_readdatavalid => avm_unnamed_ethash_calculate_dag_item15_readdatavalid,
        in_unnamed_ethash_calculate_dag_item15_avm_waitrequest => avm_unnamed_ethash_calculate_dag_item15_waitrequest,
        in_unnamed_ethash_calculate_dag_item15_avm_writeack => avm_unnamed_ethash_calculate_dag_item15_writeack,
        in_valid_in => kernel_valid_in,
        out_memcoalesce_g_light_load_02193_avm_address => ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_02193_avm_address,
        out_memcoalesce_g_light_load_02193_avm_burstcount => ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_02193_avm_burstcount,
        out_memcoalesce_g_light_load_02193_avm_byteenable => ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_02193_avm_byteenable,
        out_memcoalesce_g_light_load_02193_avm_enable => ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_02193_avm_enable,
        out_memcoalesce_g_light_load_02193_avm_read => ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_02193_avm_read,
        out_memcoalesce_g_light_load_02193_avm_write => ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_02193_avm_write,
        out_memcoalesce_g_light_load_02193_avm_writedata => ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_02193_avm_writedata,
        out_memcoalesce_g_light_load_0_avm_address => ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_0_avm_address,
        out_memcoalesce_g_light_load_0_avm_burstcount => ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_0_avm_burstcount,
        out_memcoalesce_g_light_load_0_avm_byteenable => ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_0_avm_byteenable,
        out_memcoalesce_g_light_load_0_avm_enable => ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_0_avm_enable,
        out_memcoalesce_g_light_load_0_avm_read => ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_0_avm_read,
        out_memcoalesce_g_light_load_0_avm_write => ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_0_avm_write,
        out_memcoalesce_g_light_load_0_avm_writedata => ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_0_avm_writedata,
        out_o_active_unnamed_ethash_calculate_dag_item15 => ethash_calculate_dag_item_function_out_o_active_unnamed_ethash_calculate_dag_item15,
        out_stall_out => ethash_calculate_dag_item_function_out_stall_out,
        out_unnamed_ethash_calculate_dag_item15_avm_address => ethash_calculate_dag_item_function_out_unnamed_ethash_calculate_dag_item15_avm_address,
        out_unnamed_ethash_calculate_dag_item15_avm_burstcount => ethash_calculate_dag_item_function_out_unnamed_ethash_calculate_dag_item15_avm_burstcount,
        out_unnamed_ethash_calculate_dag_item15_avm_byteenable => ethash_calculate_dag_item_function_out_unnamed_ethash_calculate_dag_item15_avm_byteenable,
        out_unnamed_ethash_calculate_dag_item15_avm_enable => ethash_calculate_dag_item_function_out_unnamed_ethash_calculate_dag_item15_avm_enable,
        out_unnamed_ethash_calculate_dag_item15_avm_read => ethash_calculate_dag_item_function_out_unnamed_ethash_calculate_dag_item15_avm_read,
        out_unnamed_ethash_calculate_dag_item15_avm_write => ethash_calculate_dag_item_function_out_unnamed_ethash_calculate_dag_item15_avm_write,
        out_unnamed_ethash_calculate_dag_item15_avm_writedata => ethash_calculate_dag_item_function_out_unnamed_ethash_calculate_dag_item15_avm_writedata,
        out_valid_out => ethash_calculate_dag_item_function_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- avm_memcoalesce_g_light_load_02193_address(GPOUT,57)
    avm_memcoalesce_g_light_load_02193_address <= ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_02193_avm_address;

    -- avm_memcoalesce_g_light_load_02193_burstcount(GPOUT,58)
    avm_memcoalesce_g_light_load_02193_burstcount <= ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_02193_avm_burstcount;

    -- avm_memcoalesce_g_light_load_02193_byteenable(GPOUT,59)
    avm_memcoalesce_g_light_load_02193_byteenable <= ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_02193_avm_byteenable;

    -- avm_memcoalesce_g_light_load_02193_enable(GPOUT,60)
    avm_memcoalesce_g_light_load_02193_enable <= ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_02193_avm_enable;

    -- avm_memcoalesce_g_light_load_02193_read(GPOUT,61)
    avm_memcoalesce_g_light_load_02193_read <= ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_02193_avm_read;

    -- avm_memcoalesce_g_light_load_02193_write(GPOUT,62)
    avm_memcoalesce_g_light_load_02193_write <= ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_02193_avm_write;

    -- avm_memcoalesce_g_light_load_02193_writedata(GPOUT,63)
    avm_memcoalesce_g_light_load_02193_writedata <= ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_02193_avm_writedata;

    -- avm_memcoalesce_g_light_load_0_address(GPOUT,64)
    avm_memcoalesce_g_light_load_0_address <= ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_0_avm_address;

    -- avm_memcoalesce_g_light_load_0_burstcount(GPOUT,65)
    avm_memcoalesce_g_light_load_0_burstcount <= ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_0_avm_burstcount;

    -- avm_memcoalesce_g_light_load_0_byteenable(GPOUT,66)
    avm_memcoalesce_g_light_load_0_byteenable <= ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_0_avm_byteenable;

    -- avm_memcoalesce_g_light_load_0_enable(GPOUT,67)
    avm_memcoalesce_g_light_load_0_enable <= ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_0_avm_enable;

    -- avm_memcoalesce_g_light_load_0_read(GPOUT,68)
    avm_memcoalesce_g_light_load_0_read <= ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_0_avm_read;

    -- avm_memcoalesce_g_light_load_0_write(GPOUT,69)
    avm_memcoalesce_g_light_load_0_write <= ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_0_avm_write;

    -- avm_memcoalesce_g_light_load_0_writedata(GPOUT,70)
    avm_memcoalesce_g_light_load_0_writedata <= ethash_calculate_dag_item_function_out_memcoalesce_g_light_load_0_avm_writedata;

    -- avm_unnamed_ethash_calculate_dag_item15_address(GPOUT,71)
    avm_unnamed_ethash_calculate_dag_item15_address <= ethash_calculate_dag_item_function_out_unnamed_ethash_calculate_dag_item15_avm_address;

    -- avm_unnamed_ethash_calculate_dag_item15_burstcount(GPOUT,72)
    avm_unnamed_ethash_calculate_dag_item15_burstcount <= ethash_calculate_dag_item_function_out_unnamed_ethash_calculate_dag_item15_avm_burstcount;

    -- avm_unnamed_ethash_calculate_dag_item15_byteenable(GPOUT,73)
    avm_unnamed_ethash_calculate_dag_item15_byteenable <= ethash_calculate_dag_item_function_out_unnamed_ethash_calculate_dag_item15_avm_byteenable;

    -- avm_unnamed_ethash_calculate_dag_item15_enable(GPOUT,74)
    avm_unnamed_ethash_calculate_dag_item15_enable <= ethash_calculate_dag_item_function_out_unnamed_ethash_calculate_dag_item15_avm_enable;

    -- avm_unnamed_ethash_calculate_dag_item15_read(GPOUT,75)
    avm_unnamed_ethash_calculate_dag_item15_read <= ethash_calculate_dag_item_function_out_unnamed_ethash_calculate_dag_item15_avm_read;

    -- avm_unnamed_ethash_calculate_dag_item15_write(GPOUT,76)
    avm_unnamed_ethash_calculate_dag_item15_write <= ethash_calculate_dag_item_function_out_unnamed_ethash_calculate_dag_item15_avm_write;

    -- avm_unnamed_ethash_calculate_dag_item15_writedata(GPOUT,77)
    avm_unnamed_ethash_calculate_dag_item15_writedata <= ethash_calculate_dag_item_function_out_unnamed_ethash_calculate_dag_item15_avm_writedata;

    -- acl_clock2x_dummy_consumer(EXTIFACE,5)
    acl_clock2x_dummy_consumer_clock2x <= clock2x;
    acl_clock2x_dummy_consumer_clock2x_bitsignaltemp <= acl_clock2x_dummy_consumer_clock2x(0);
    acl_clock2x_dummy_consumer_myout(0) <= acl_clock2x_dummy_consumer_myout_bitsignaltemp;
    theacl_clock2x_dummy_consumer : acl_clock2x_holder
    PORT MAP (
        clock2x => acl_clock2x_dummy_consumer_clock2x_bitsignaltemp,
        myout => acl_clock2x_dummy_consumer_myout_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- clock2x_output(GPOUT,78)
    clock2x_output <= acl_clock2x_dummy_consumer_myout;

    -- has_a_lsu_active(GPOUT,79)
    has_a_lsu_active <= ethash_calculate_dag_item_function_out_o_active_unnamed_ethash_calculate_dag_item15;

    -- has_a_write_pending(GPOUT,80)
    has_a_write_pending <= ethash_calculate_dag_item_function_out_o_active_unnamed_ethash_calculate_dag_item15;

    -- kernel_stall_out(GPOUT,81)
    kernel_stall_out <= ethash_calculate_dag_item_function_out_stall_out;

    -- kernel_valid_out(GPOUT,82)
    kernel_valid_out <= ethash_calculate_dag_item_function_out_valid_out;

END normal;
