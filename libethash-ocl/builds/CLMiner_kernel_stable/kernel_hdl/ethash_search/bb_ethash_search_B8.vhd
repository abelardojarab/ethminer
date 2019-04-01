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

-- VHDL created from bb_ethash_search_B8
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

entity bb_ethash_search_B8 is
    port (
        in_call152_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_call152_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_call152_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_call152_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_g_output : in std_logic_vector(63 downto 0);  -- ufix64
        in_global_id_0190_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_01_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01232188_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11233189_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_state_10_2_cast184_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_11_2_cast186_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_8_2_cast180_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_9_2_cast182_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_target : in std_logic_vector(63 downto 0);  -- ufix64
        in_unnamed_ethash_search61_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_unnamed_ethash_search61_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search61_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search61_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search62_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_unnamed_ethash_search62_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search62_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search62_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search63_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_unnamed_ethash_search63_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search63_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search63_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search64_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_unnamed_ethash_search64_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search64_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search64_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_wgl_0_exit_exit_stall_out : in std_logic_vector(0 downto 0);  -- ufix1
        in_wgl_0_exit_exit_valid_out : in std_logic_vector(0 downto 0);  -- ufix1
        out_call152_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        out_call152_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_call152_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_call152_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_call152_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_call152_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_call152_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_lsu_call152_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        out_lsu_unnamed_ethash_search61_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        out_lsu_unnamed_ethash_search62_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        out_lsu_unnamed_ethash_search63_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        out_lsu_unnamed_ethash_search64_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search61_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        out_unnamed_ethash_search61_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_ethash_search61_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_ethash_search61_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search61_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search61_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search61_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_unnamed_ethash_search62_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        out_unnamed_ethash_search62_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_ethash_search62_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_ethash_search62_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search62_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search62_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search62_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_unnamed_ethash_search63_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        out_unnamed_ethash_search63_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_ethash_search63_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_ethash_search63_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search63_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search63_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search63_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_unnamed_ethash_search64_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        out_unnamed_ethash_search64_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_ethash_search64_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_ethash_search64_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search64_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search64_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search64_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_wgl_0_exit_exit_stall_in : out std_logic_vector(0 downto 0);  -- ufix1
        out_wgl_0_exit_exit_valid_in : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_ethash_search_B8;

architecture normal of bb_ethash_search_B8 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_ethash_search_B8_stall_region is
        port (
            in_call152_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_call152_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_call152_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_call152_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_g_output : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_global_id_0190 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_01 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01232188 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11233189 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_state_10_2_cast184 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_11_2_cast186 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_8_2_cast180 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_9_2_cast182 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_target : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_unnamed_ethash_search61_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_unnamed_ethash_search61_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search61_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search61_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search62_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_unnamed_ethash_search62_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search62_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search62_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search63_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_unnamed_ethash_search63_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search63_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search63_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search64_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_unnamed_ethash_search64_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search64_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search64_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_wgl_0_exit_exit_stall_out : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_wgl_0_exit_exit_valid_out : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_call152_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_call152_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_call152_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_call152_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_call152_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_call152_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_call152_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_lsu_call152_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_ethash_search61_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_ethash_search62_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_ethash_search63_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_ethash_search64_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search61_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_unnamed_ethash_search61_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_ethash_search61_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_unnamed_ethash_search61_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search61_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search61_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search61_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_unnamed_ethash_search62_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_unnamed_ethash_search62_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_ethash_search62_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_unnamed_ethash_search62_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search62_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search62_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search62_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_unnamed_ethash_search63_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_unnamed_ethash_search63_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_ethash_search63_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_unnamed_ethash_search63_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search63_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search63_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search63_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_unnamed_ethash_search64_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_unnamed_ethash_search64_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_ethash_search64_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_unnamed_ethash_search64_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search64_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search64_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search64_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_wgl_0_exit_exit_stall_in : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_wgl_0_exit_exit_valid_in : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component ethash_search_B8_branch is
        port (
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component ethash_search_B8_merge is
        port (
            in_global_id_0190_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_grpid_01_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_01232188_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_scalarizer_11233189_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_state_10_2_cast184_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_11_2_cast186_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_8_2_cast180_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_state_9_2_cast182_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_global_id_0190 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_grpid_01 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_01232188 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_scalarizer_11233189 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_state_10_2_cast184 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_11_2_cast186 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_8_2_cast180 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_state_9_2_cast182 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_ethash_search_B8_stall_region_out_call152_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal bb_ethash_search_B8_stall_region_out_call152_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_ethash_search_B8_stall_region_out_call152_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B8_stall_region_out_call152_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_stall_region_out_call152_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_stall_region_out_call152_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_stall_region_out_call152_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal bb_ethash_search_B8_stall_region_out_lsu_call152_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_stall_region_out_lsu_unnamed_ethash_search61_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_stall_region_out_lsu_unnamed_ethash_search62_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_stall_region_out_lsu_unnamed_ethash_search63_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_stall_region_out_lsu_unnamed_ethash_search64_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_stall_region_out_unnamed_ethash_search61_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal bb_ethash_search_B8_stall_region_out_unnamed_ethash_search61_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_ethash_search_B8_stall_region_out_unnamed_ethash_search61_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B8_stall_region_out_unnamed_ethash_search61_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_stall_region_out_unnamed_ethash_search61_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_stall_region_out_unnamed_ethash_search61_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_stall_region_out_unnamed_ethash_search61_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal bb_ethash_search_B8_stall_region_out_unnamed_ethash_search62_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal bb_ethash_search_B8_stall_region_out_unnamed_ethash_search62_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_ethash_search_B8_stall_region_out_unnamed_ethash_search62_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B8_stall_region_out_unnamed_ethash_search62_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_stall_region_out_unnamed_ethash_search62_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_stall_region_out_unnamed_ethash_search62_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_stall_region_out_unnamed_ethash_search62_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal bb_ethash_search_B8_stall_region_out_unnamed_ethash_search63_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal bb_ethash_search_B8_stall_region_out_unnamed_ethash_search63_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_ethash_search_B8_stall_region_out_unnamed_ethash_search63_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B8_stall_region_out_unnamed_ethash_search63_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_stall_region_out_unnamed_ethash_search63_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_stall_region_out_unnamed_ethash_search63_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_stall_region_out_unnamed_ethash_search63_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal bb_ethash_search_B8_stall_region_out_unnamed_ethash_search64_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal bb_ethash_search_B8_stall_region_out_unnamed_ethash_search64_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_ethash_search_B8_stall_region_out_unnamed_ethash_search64_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_ethash_search_B8_stall_region_out_unnamed_ethash_search64_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_stall_region_out_unnamed_ethash_search64_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_stall_region_out_unnamed_ethash_search64_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_stall_region_out_unnamed_ethash_search64_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal bb_ethash_search_B8_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_stall_region_out_wgl_0_exit_exit_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_ethash_search_B8_stall_region_out_wgl_0_exit_exit_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B8_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B8_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B8_merge_out_global_id_0190 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B8_merge_out_l_grpid_01 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B8_merge_out_scalarizer_01232188 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B8_merge_out_scalarizer_11233189 : STD_LOGIC_VECTOR (31 downto 0);
    signal ethash_search_B8_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ethash_search_B8_merge_out_state_10_2_cast184 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B8_merge_out_state_11_2_cast186 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B8_merge_out_state_8_2_cast180 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B8_merge_out_state_9_2_cast182 : STD_LOGIC_VECTOR (63 downto 0);
    signal ethash_search_B8_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- ethash_search_B8_branch(BLACKBOX,3)
    theethash_search_B8_branch : ethash_search_B8_branch
    PORT MAP (
        in_stall_in_0 => in_stall_in_0,
        in_valid_in => bb_ethash_search_B8_stall_region_out_valid_out,
        out_stall_out => ethash_search_B8_branch_out_stall_out,
        out_valid_out_0 => ethash_search_B8_branch_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- ethash_search_B8_merge(BLACKBOX,4)
    theethash_search_B8_merge : ethash_search_B8_merge
    PORT MAP (
        in_global_id_0190_0 => in_global_id_0190_0,
        in_l_grpid_01_0 => in_l_grpid_01_0,
        in_scalarizer_01232188_0 => in_scalarizer_01232188_0,
        in_scalarizer_11233189_0 => in_scalarizer_11233189_0,
        in_stall_in => bb_ethash_search_B8_stall_region_out_stall_out,
        in_state_10_2_cast184_0 => in_state_10_2_cast184_0,
        in_state_11_2_cast186_0 => in_state_11_2_cast186_0,
        in_state_8_2_cast180_0 => in_state_8_2_cast180_0,
        in_state_9_2_cast182_0 => in_state_9_2_cast182_0,
        in_valid_in_0 => in_valid_in_0,
        out_global_id_0190 => ethash_search_B8_merge_out_global_id_0190,
        out_l_grpid_01 => ethash_search_B8_merge_out_l_grpid_01,
        out_scalarizer_01232188 => ethash_search_B8_merge_out_scalarizer_01232188,
        out_scalarizer_11233189 => ethash_search_B8_merge_out_scalarizer_11233189,
        out_stall_out_0 => ethash_search_B8_merge_out_stall_out_0,
        out_state_10_2_cast184 => ethash_search_B8_merge_out_state_10_2_cast184,
        out_state_11_2_cast186 => ethash_search_B8_merge_out_state_11_2_cast186,
        out_state_8_2_cast180 => ethash_search_B8_merge_out_state_8_2_cast180,
        out_state_9_2_cast182 => ethash_search_B8_merge_out_state_9_2_cast182,
        out_valid_out => ethash_search_B8_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_ethash_search_B8_stall_region(BLACKBOX,2)
    thebb_ethash_search_B8_stall_region : bb_ethash_search_B8_stall_region
    PORT MAP (
        in_call152_avm_readdata => in_call152_avm_readdata,
        in_call152_avm_readdatavalid => in_call152_avm_readdatavalid,
        in_call152_avm_waitrequest => in_call152_avm_waitrequest,
        in_call152_avm_writeack => in_call152_avm_writeack,
        in_flush => in_flush,
        in_g_output => in_g_output,
        in_global_id_0190 => ethash_search_B8_merge_out_global_id_0190,
        in_l_grpid_01 => ethash_search_B8_merge_out_l_grpid_01,
        in_scalarizer_01232188 => ethash_search_B8_merge_out_scalarizer_01232188,
        in_scalarizer_11233189 => ethash_search_B8_merge_out_scalarizer_11233189,
        in_stall_in => ethash_search_B8_branch_out_stall_out,
        in_state_10_2_cast184 => ethash_search_B8_merge_out_state_10_2_cast184,
        in_state_11_2_cast186 => ethash_search_B8_merge_out_state_11_2_cast186,
        in_state_8_2_cast180 => ethash_search_B8_merge_out_state_8_2_cast180,
        in_state_9_2_cast182 => ethash_search_B8_merge_out_state_9_2_cast182,
        in_target => in_target,
        in_unnamed_ethash_search61_avm_readdata => in_unnamed_ethash_search61_avm_readdata,
        in_unnamed_ethash_search61_avm_readdatavalid => in_unnamed_ethash_search61_avm_readdatavalid,
        in_unnamed_ethash_search61_avm_waitrequest => in_unnamed_ethash_search61_avm_waitrequest,
        in_unnamed_ethash_search61_avm_writeack => in_unnamed_ethash_search61_avm_writeack,
        in_unnamed_ethash_search62_avm_readdata => in_unnamed_ethash_search62_avm_readdata,
        in_unnamed_ethash_search62_avm_readdatavalid => in_unnamed_ethash_search62_avm_readdatavalid,
        in_unnamed_ethash_search62_avm_waitrequest => in_unnamed_ethash_search62_avm_waitrequest,
        in_unnamed_ethash_search62_avm_writeack => in_unnamed_ethash_search62_avm_writeack,
        in_unnamed_ethash_search63_avm_readdata => in_unnamed_ethash_search63_avm_readdata,
        in_unnamed_ethash_search63_avm_readdatavalid => in_unnamed_ethash_search63_avm_readdatavalid,
        in_unnamed_ethash_search63_avm_waitrequest => in_unnamed_ethash_search63_avm_waitrequest,
        in_unnamed_ethash_search63_avm_writeack => in_unnamed_ethash_search63_avm_writeack,
        in_unnamed_ethash_search64_avm_readdata => in_unnamed_ethash_search64_avm_readdata,
        in_unnamed_ethash_search64_avm_readdatavalid => in_unnamed_ethash_search64_avm_readdatavalid,
        in_unnamed_ethash_search64_avm_waitrequest => in_unnamed_ethash_search64_avm_waitrequest,
        in_unnamed_ethash_search64_avm_writeack => in_unnamed_ethash_search64_avm_writeack,
        in_valid_in => ethash_search_B8_merge_out_valid_out,
        in_wgl_0_exit_exit_stall_out => in_wgl_0_exit_exit_stall_out,
        in_wgl_0_exit_exit_valid_out => in_wgl_0_exit_exit_valid_out,
        out_call152_avm_address => bb_ethash_search_B8_stall_region_out_call152_avm_address,
        out_call152_avm_burstcount => bb_ethash_search_B8_stall_region_out_call152_avm_burstcount,
        out_call152_avm_byteenable => bb_ethash_search_B8_stall_region_out_call152_avm_byteenable,
        out_call152_avm_enable => bb_ethash_search_B8_stall_region_out_call152_avm_enable,
        out_call152_avm_read => bb_ethash_search_B8_stall_region_out_call152_avm_read,
        out_call152_avm_write => bb_ethash_search_B8_stall_region_out_call152_avm_write,
        out_call152_avm_writedata => bb_ethash_search_B8_stall_region_out_call152_avm_writedata,
        out_lsu_call152_o_active => bb_ethash_search_B8_stall_region_out_lsu_call152_o_active,
        out_lsu_unnamed_ethash_search61_o_active => bb_ethash_search_B8_stall_region_out_lsu_unnamed_ethash_search61_o_active,
        out_lsu_unnamed_ethash_search62_o_active => bb_ethash_search_B8_stall_region_out_lsu_unnamed_ethash_search62_o_active,
        out_lsu_unnamed_ethash_search63_o_active => bb_ethash_search_B8_stall_region_out_lsu_unnamed_ethash_search63_o_active,
        out_lsu_unnamed_ethash_search64_o_active => bb_ethash_search_B8_stall_region_out_lsu_unnamed_ethash_search64_o_active,
        out_stall_out => bb_ethash_search_B8_stall_region_out_stall_out,
        out_unnamed_ethash_search61_avm_address => bb_ethash_search_B8_stall_region_out_unnamed_ethash_search61_avm_address,
        out_unnamed_ethash_search61_avm_burstcount => bb_ethash_search_B8_stall_region_out_unnamed_ethash_search61_avm_burstcount,
        out_unnamed_ethash_search61_avm_byteenable => bb_ethash_search_B8_stall_region_out_unnamed_ethash_search61_avm_byteenable,
        out_unnamed_ethash_search61_avm_enable => bb_ethash_search_B8_stall_region_out_unnamed_ethash_search61_avm_enable,
        out_unnamed_ethash_search61_avm_read => bb_ethash_search_B8_stall_region_out_unnamed_ethash_search61_avm_read,
        out_unnamed_ethash_search61_avm_write => bb_ethash_search_B8_stall_region_out_unnamed_ethash_search61_avm_write,
        out_unnamed_ethash_search61_avm_writedata => bb_ethash_search_B8_stall_region_out_unnamed_ethash_search61_avm_writedata,
        out_unnamed_ethash_search62_avm_address => bb_ethash_search_B8_stall_region_out_unnamed_ethash_search62_avm_address,
        out_unnamed_ethash_search62_avm_burstcount => bb_ethash_search_B8_stall_region_out_unnamed_ethash_search62_avm_burstcount,
        out_unnamed_ethash_search62_avm_byteenable => bb_ethash_search_B8_stall_region_out_unnamed_ethash_search62_avm_byteenable,
        out_unnamed_ethash_search62_avm_enable => bb_ethash_search_B8_stall_region_out_unnamed_ethash_search62_avm_enable,
        out_unnamed_ethash_search62_avm_read => bb_ethash_search_B8_stall_region_out_unnamed_ethash_search62_avm_read,
        out_unnamed_ethash_search62_avm_write => bb_ethash_search_B8_stall_region_out_unnamed_ethash_search62_avm_write,
        out_unnamed_ethash_search62_avm_writedata => bb_ethash_search_B8_stall_region_out_unnamed_ethash_search62_avm_writedata,
        out_unnamed_ethash_search63_avm_address => bb_ethash_search_B8_stall_region_out_unnamed_ethash_search63_avm_address,
        out_unnamed_ethash_search63_avm_burstcount => bb_ethash_search_B8_stall_region_out_unnamed_ethash_search63_avm_burstcount,
        out_unnamed_ethash_search63_avm_byteenable => bb_ethash_search_B8_stall_region_out_unnamed_ethash_search63_avm_byteenable,
        out_unnamed_ethash_search63_avm_enable => bb_ethash_search_B8_stall_region_out_unnamed_ethash_search63_avm_enable,
        out_unnamed_ethash_search63_avm_read => bb_ethash_search_B8_stall_region_out_unnamed_ethash_search63_avm_read,
        out_unnamed_ethash_search63_avm_write => bb_ethash_search_B8_stall_region_out_unnamed_ethash_search63_avm_write,
        out_unnamed_ethash_search63_avm_writedata => bb_ethash_search_B8_stall_region_out_unnamed_ethash_search63_avm_writedata,
        out_unnamed_ethash_search64_avm_address => bb_ethash_search_B8_stall_region_out_unnamed_ethash_search64_avm_address,
        out_unnamed_ethash_search64_avm_burstcount => bb_ethash_search_B8_stall_region_out_unnamed_ethash_search64_avm_burstcount,
        out_unnamed_ethash_search64_avm_byteenable => bb_ethash_search_B8_stall_region_out_unnamed_ethash_search64_avm_byteenable,
        out_unnamed_ethash_search64_avm_enable => bb_ethash_search_B8_stall_region_out_unnamed_ethash_search64_avm_enable,
        out_unnamed_ethash_search64_avm_read => bb_ethash_search_B8_stall_region_out_unnamed_ethash_search64_avm_read,
        out_unnamed_ethash_search64_avm_write => bb_ethash_search_B8_stall_region_out_unnamed_ethash_search64_avm_write,
        out_unnamed_ethash_search64_avm_writedata => bb_ethash_search_B8_stall_region_out_unnamed_ethash_search64_avm_writedata,
        out_valid_out => bb_ethash_search_B8_stall_region_out_valid_out,
        out_wgl_0_exit_exit_stall_in => bb_ethash_search_B8_stall_region_out_wgl_0_exit_exit_stall_in,
        out_wgl_0_exit_exit_valid_in => bb_ethash_search_B8_stall_region_out_wgl_0_exit_exit_valid_in,
        clock => clock,
        resetn => resetn
    );

    -- out_call152_avm_address(GPOUT,40)
    out_call152_avm_address <= bb_ethash_search_B8_stall_region_out_call152_avm_address;

    -- out_call152_avm_burstcount(GPOUT,41)
    out_call152_avm_burstcount <= bb_ethash_search_B8_stall_region_out_call152_avm_burstcount;

    -- out_call152_avm_byteenable(GPOUT,42)
    out_call152_avm_byteenable <= bb_ethash_search_B8_stall_region_out_call152_avm_byteenable;

    -- out_call152_avm_enable(GPOUT,43)
    out_call152_avm_enable <= bb_ethash_search_B8_stall_region_out_call152_avm_enable;

    -- out_call152_avm_read(GPOUT,44)
    out_call152_avm_read <= bb_ethash_search_B8_stall_region_out_call152_avm_read;

    -- out_call152_avm_write(GPOUT,45)
    out_call152_avm_write <= bb_ethash_search_B8_stall_region_out_call152_avm_write;

    -- out_call152_avm_writedata(GPOUT,46)
    out_call152_avm_writedata <= bb_ethash_search_B8_stall_region_out_call152_avm_writedata;

    -- out_lsu_call152_o_active(GPOUT,47)
    out_lsu_call152_o_active <= bb_ethash_search_B8_stall_region_out_lsu_call152_o_active;

    -- out_lsu_unnamed_ethash_search61_o_active(GPOUT,48)
    out_lsu_unnamed_ethash_search61_o_active <= bb_ethash_search_B8_stall_region_out_lsu_unnamed_ethash_search61_o_active;

    -- out_lsu_unnamed_ethash_search62_o_active(GPOUT,49)
    out_lsu_unnamed_ethash_search62_o_active <= bb_ethash_search_B8_stall_region_out_lsu_unnamed_ethash_search62_o_active;

    -- out_lsu_unnamed_ethash_search63_o_active(GPOUT,50)
    out_lsu_unnamed_ethash_search63_o_active <= bb_ethash_search_B8_stall_region_out_lsu_unnamed_ethash_search63_o_active;

    -- out_lsu_unnamed_ethash_search64_o_active(GPOUT,51)
    out_lsu_unnamed_ethash_search64_o_active <= bb_ethash_search_B8_stall_region_out_lsu_unnamed_ethash_search64_o_active;

    -- out_stall_out_0(GPOUT,52)
    out_stall_out_0 <= ethash_search_B8_merge_out_stall_out_0;

    -- out_unnamed_ethash_search61_avm_address(GPOUT,53)
    out_unnamed_ethash_search61_avm_address <= bb_ethash_search_B8_stall_region_out_unnamed_ethash_search61_avm_address;

    -- out_unnamed_ethash_search61_avm_burstcount(GPOUT,54)
    out_unnamed_ethash_search61_avm_burstcount <= bb_ethash_search_B8_stall_region_out_unnamed_ethash_search61_avm_burstcount;

    -- out_unnamed_ethash_search61_avm_byteenable(GPOUT,55)
    out_unnamed_ethash_search61_avm_byteenable <= bb_ethash_search_B8_stall_region_out_unnamed_ethash_search61_avm_byteenable;

    -- out_unnamed_ethash_search61_avm_enable(GPOUT,56)
    out_unnamed_ethash_search61_avm_enable <= bb_ethash_search_B8_stall_region_out_unnamed_ethash_search61_avm_enable;

    -- out_unnamed_ethash_search61_avm_read(GPOUT,57)
    out_unnamed_ethash_search61_avm_read <= bb_ethash_search_B8_stall_region_out_unnamed_ethash_search61_avm_read;

    -- out_unnamed_ethash_search61_avm_write(GPOUT,58)
    out_unnamed_ethash_search61_avm_write <= bb_ethash_search_B8_stall_region_out_unnamed_ethash_search61_avm_write;

    -- out_unnamed_ethash_search61_avm_writedata(GPOUT,59)
    out_unnamed_ethash_search61_avm_writedata <= bb_ethash_search_B8_stall_region_out_unnamed_ethash_search61_avm_writedata;

    -- out_unnamed_ethash_search62_avm_address(GPOUT,60)
    out_unnamed_ethash_search62_avm_address <= bb_ethash_search_B8_stall_region_out_unnamed_ethash_search62_avm_address;

    -- out_unnamed_ethash_search62_avm_burstcount(GPOUT,61)
    out_unnamed_ethash_search62_avm_burstcount <= bb_ethash_search_B8_stall_region_out_unnamed_ethash_search62_avm_burstcount;

    -- out_unnamed_ethash_search62_avm_byteenable(GPOUT,62)
    out_unnamed_ethash_search62_avm_byteenable <= bb_ethash_search_B8_stall_region_out_unnamed_ethash_search62_avm_byteenable;

    -- out_unnamed_ethash_search62_avm_enable(GPOUT,63)
    out_unnamed_ethash_search62_avm_enable <= bb_ethash_search_B8_stall_region_out_unnamed_ethash_search62_avm_enable;

    -- out_unnamed_ethash_search62_avm_read(GPOUT,64)
    out_unnamed_ethash_search62_avm_read <= bb_ethash_search_B8_stall_region_out_unnamed_ethash_search62_avm_read;

    -- out_unnamed_ethash_search62_avm_write(GPOUT,65)
    out_unnamed_ethash_search62_avm_write <= bb_ethash_search_B8_stall_region_out_unnamed_ethash_search62_avm_write;

    -- out_unnamed_ethash_search62_avm_writedata(GPOUT,66)
    out_unnamed_ethash_search62_avm_writedata <= bb_ethash_search_B8_stall_region_out_unnamed_ethash_search62_avm_writedata;

    -- out_unnamed_ethash_search63_avm_address(GPOUT,67)
    out_unnamed_ethash_search63_avm_address <= bb_ethash_search_B8_stall_region_out_unnamed_ethash_search63_avm_address;

    -- out_unnamed_ethash_search63_avm_burstcount(GPOUT,68)
    out_unnamed_ethash_search63_avm_burstcount <= bb_ethash_search_B8_stall_region_out_unnamed_ethash_search63_avm_burstcount;

    -- out_unnamed_ethash_search63_avm_byteenable(GPOUT,69)
    out_unnamed_ethash_search63_avm_byteenable <= bb_ethash_search_B8_stall_region_out_unnamed_ethash_search63_avm_byteenable;

    -- out_unnamed_ethash_search63_avm_enable(GPOUT,70)
    out_unnamed_ethash_search63_avm_enable <= bb_ethash_search_B8_stall_region_out_unnamed_ethash_search63_avm_enable;

    -- out_unnamed_ethash_search63_avm_read(GPOUT,71)
    out_unnamed_ethash_search63_avm_read <= bb_ethash_search_B8_stall_region_out_unnamed_ethash_search63_avm_read;

    -- out_unnamed_ethash_search63_avm_write(GPOUT,72)
    out_unnamed_ethash_search63_avm_write <= bb_ethash_search_B8_stall_region_out_unnamed_ethash_search63_avm_write;

    -- out_unnamed_ethash_search63_avm_writedata(GPOUT,73)
    out_unnamed_ethash_search63_avm_writedata <= bb_ethash_search_B8_stall_region_out_unnamed_ethash_search63_avm_writedata;

    -- out_unnamed_ethash_search64_avm_address(GPOUT,74)
    out_unnamed_ethash_search64_avm_address <= bb_ethash_search_B8_stall_region_out_unnamed_ethash_search64_avm_address;

    -- out_unnamed_ethash_search64_avm_burstcount(GPOUT,75)
    out_unnamed_ethash_search64_avm_burstcount <= bb_ethash_search_B8_stall_region_out_unnamed_ethash_search64_avm_burstcount;

    -- out_unnamed_ethash_search64_avm_byteenable(GPOUT,76)
    out_unnamed_ethash_search64_avm_byteenable <= bb_ethash_search_B8_stall_region_out_unnamed_ethash_search64_avm_byteenable;

    -- out_unnamed_ethash_search64_avm_enable(GPOUT,77)
    out_unnamed_ethash_search64_avm_enable <= bb_ethash_search_B8_stall_region_out_unnamed_ethash_search64_avm_enable;

    -- out_unnamed_ethash_search64_avm_read(GPOUT,78)
    out_unnamed_ethash_search64_avm_read <= bb_ethash_search_B8_stall_region_out_unnamed_ethash_search64_avm_read;

    -- out_unnamed_ethash_search64_avm_write(GPOUT,79)
    out_unnamed_ethash_search64_avm_write <= bb_ethash_search_B8_stall_region_out_unnamed_ethash_search64_avm_write;

    -- out_unnamed_ethash_search64_avm_writedata(GPOUT,80)
    out_unnamed_ethash_search64_avm_writedata <= bb_ethash_search_B8_stall_region_out_unnamed_ethash_search64_avm_writedata;

    -- out_valid_out_0(GPOUT,81)
    out_valid_out_0 <= ethash_search_B8_branch_out_valid_out_0;

    -- out_wgl_0_exit_exit_stall_in(GPOUT,82)
    out_wgl_0_exit_exit_stall_in <= bb_ethash_search_B8_stall_region_out_wgl_0_exit_exit_stall_in;

    -- out_wgl_0_exit_exit_valid_in(GPOUT,83)
    out_wgl_0_exit_exit_valid_in <= bb_ethash_search_B8_stall_region_out_wgl_0_exit_exit_valid_in;

END normal;
