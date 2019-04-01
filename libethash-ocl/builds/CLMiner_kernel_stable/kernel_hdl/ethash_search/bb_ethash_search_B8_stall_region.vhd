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

-- VHDL created from bb_ethash_search_B8_stall_region
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

entity bb_ethash_search_B8_stall_region is
    port (
        in_unnamed_ethash_search61_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_unnamed_ethash_search61_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search61_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search61_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_lsu_call152_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        in_g_output : in std_logic_vector(63 downto 0);  -- ufix64
        in_global_id_0190 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_grpid_01 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_01232188 : in std_logic_vector(31 downto 0);  -- ufix32
        in_scalarizer_11233189 : in std_logic_vector(31 downto 0);  -- ufix32
        in_state_10_2_cast184 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_11_2_cast186 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_8_2_cast180 : in std_logic_vector(63 downto 0);  -- ufix64
        in_state_9_2_cast182 : in std_logic_vector(63 downto 0);  -- ufix64
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search62_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_unnamed_ethash_search62_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search62_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search62_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search61_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        out_unnamed_ethash_search61_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search61_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search61_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search61_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_unnamed_ethash_search61_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_ethash_search61_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_target : in std_logic_vector(63 downto 0);  -- ufix64
        in_unnamed_ethash_search63_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_unnamed_ethash_search63_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search63_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search63_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_lsu_unnamed_ethash_search61_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search64_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_unnamed_ethash_search64_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search64_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search64_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search62_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        out_unnamed_ethash_search62_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search62_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search62_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search62_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_unnamed_ethash_search62_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_ethash_search62_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_wgl_0_exit_exit_valid_out : in std_logic_vector(0 downto 0);  -- ufix1
        in_wgl_0_exit_exit_stall_out : in std_logic_vector(0 downto 0);  -- ufix1
        out_lsu_unnamed_ethash_search62_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search63_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        out_unnamed_ethash_search63_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search63_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search63_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search63_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_unnamed_ethash_search63_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_ethash_search63_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_lsu_unnamed_ethash_search63_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search64_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        out_unnamed_ethash_search64_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search64_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search64_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_ethash_search64_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_unnamed_ethash_search64_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_ethash_search64_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_lsu_unnamed_ethash_search64_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        out_wgl_0_exit_exit_valid_in : out std_logic_vector(0 downto 0);  -- ufix1
        out_wgl_0_exit_exit_stall_in : out std_logic_vector(0 downto 0);  -- ufix1
        in_call152_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_call152_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_call152_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_call152_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_call152_avm_address : out std_logic_vector(32 downto 0);  -- ufix33
        out_call152_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_call152_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_call152_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_call152_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_call152_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_call152_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_ethash_search_B8_stall_region;

architecture normal of bb_ethash_search_B8_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_vol_store_unnamed_ethash_search63_ethash_search575 is
        port (
            in_i_writedata_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_writedata_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search63_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_unnamed_ethash_search63_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search63_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search63_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_ethash_search63_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search63_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_unnamed_ethash_search63_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_ethash_search63_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_unnamed_ethash_search63_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search63_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search63_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search63_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_wg_limiter_exit_unnamed_ethash_search65_ethash_search582 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_exit_stall_out : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_exit_valid_out : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_exit_stall_in : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_exit_valid_in : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_g_output_sync_buffer1_ethash_search561 is
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


    component i_syncbuf_g_output_sync_buffer2_ethash_search567 is
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


    component i_syncbuf_g_output_sync_buffer3_ethash_search572 is
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


    component i_syncbuf_g_output_sync_buffer4_ethash_search577 is
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


    component i_syncbuf_g_output_sync_buffer_ethash_search556 is
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


    component i_syncbuf_target_sync_buffer_ethash_search554 is
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


    component i_unknown_call152_ethash_search559 is
        port (
            in_call152_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_call152_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_call152_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_call152_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_writedata : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_call152_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_call152_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_call152_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_call152_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_call152_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_call152_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_call152_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_lsu_call152_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_vol_store_unnamed_ethash_search61_ethash_search565 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_writedata : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_unnamed_ethash_search61_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_unnamed_ethash_search61_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search61_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search61_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_ethash_search61_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search61_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_unnamed_ethash_search61_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_ethash_search61_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_unnamed_ethash_search61_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search61_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search61_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search61_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_vol_store_unnamed_ethash_search62_ethash_search570 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_writedata : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_unnamed_ethash_search62_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_unnamed_ethash_search62_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search62_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search62_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_ethash_search62_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search62_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_unnamed_ethash_search62_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_ethash_search62_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_unnamed_ethash_search62_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search62_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search62_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search62_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_vol_store_unnamed_ethash_search64_ethash_search580 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_writedata : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_unnamed_ethash_search64_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_unnamed_ethash_search64_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search64_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_ethash_search64_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_ethash_search64_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search64_avm_address : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_unnamed_ethash_search64_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_ethash_search64_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_unnamed_ethash_search64_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search64_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search64_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_ethash_search64_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
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
    signal i_arrayidx159_ethash_search_ethash_search569_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx159_ethash_search_ethash_search569_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx159_ethash_search_ethash_search569_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx159_ethash_search_ethash_search569_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx159_ethash_search_ethash_search569_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx159_ethash_search_ethash_search569_c_i64_8gr_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx162_ethash_search_ethash_search574_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx162_ethash_search_ethash_search574_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx162_ethash_search_ethash_search574_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx162_ethash_search_ethash_search574_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx162_ethash_search_ethash_search574_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx162_ethash_search_ethash_search574_c_i64_16_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx168_ethash_search_ethash_search579_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx168_ethash_search_ethash_search579_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx168_ethash_search_ethash_search579_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx168_ethash_search_ethash_search579_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx168_ethash_search_ethash_search579_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx168_ethash_search_ethash_search579_c_i64_32_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_cast1246_ethash_search_ethash_search553_acl_71245_join_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_gid156_ethash_search_ethash_search563_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_gid156_ethash_search_ethash_search563_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_gid156_ethash_search_ethash_search563_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_gid156_ethash_search_ethash_search563_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_gid156_ethash_search_ethash_search563_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_gid156_ethash_search_ethash_search563_c_i64_4gr_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_state_0_1_cast_ethash_search_ethash_search551_state_0_1_1_join_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_vol_store_unnamed_ethash_search63_ethash_search_aunroll_x_out_lsu_unnamed_ethash_search63_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal i_vol_store_unnamed_ethash_search63_ethash_search_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_vol_store_unnamed_ethash_search63_ethash_search_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_vol_store_unnamed_ethash_search63_ethash_search_aunroll_x_out_unnamed_ethash_search63_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal i_vol_store_unnamed_ethash_search63_ethash_search_aunroll_x_out_unnamed_ethash_search63_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_vol_store_unnamed_ethash_search63_ethash_search_aunroll_x_out_unnamed_ethash_search63_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal i_vol_store_unnamed_ethash_search63_ethash_search_aunroll_x_out_unnamed_ethash_search63_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_vol_store_unnamed_ethash_search63_ethash_search_aunroll_x_out_unnamed_ethash_search63_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_vol_store_unnamed_ethash_search63_ethash_search_aunroll_x_out_unnamed_ethash_search63_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_vol_store_unnamed_ethash_search63_ethash_search_aunroll_x_out_unnamed_ethash_search63_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_1421_xor_or_ethash_search_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_wg_limiter_exit_unnamed_ethash_search65_ethash_search_out_exit_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_wg_limiter_exit_unnamed_ethash_search65_ethash_search_out_exit_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_wg_limiter_exit_unnamed_ethash_search65_ethash_search_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_wg_limiter_exit_unnamed_ethash_search65_ethash_search_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp148_ethash_search_a : STD_LOGIC_VECTOR (65 downto 0);
    signal i_cmp148_ethash_search_b : STD_LOGIC_VECTOR (65 downto 0);
    signal i_cmp148_ethash_search_o : STD_LOGIC_VECTOR (65 downto 0);
    signal i_cmp148_ethash_search_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_g_output_sync_buffer1_ethash_search_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_g_output_sync_buffer1_ethash_search_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_g_output_sync_buffer1_ethash_search_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_g_output_sync_buffer2_ethash_search_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_g_output_sync_buffer2_ethash_search_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_g_output_sync_buffer2_ethash_search_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_g_output_sync_buffer3_ethash_search_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_g_output_sync_buffer3_ethash_search_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_g_output_sync_buffer3_ethash_search_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_g_output_sync_buffer4_ethash_search_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_g_output_sync_buffer4_ethash_search_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_g_output_sync_buffer4_ethash_search_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_g_output_sync_buffer_ethash_search_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_g_output_sync_buffer_ethash_search_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_g_output_sync_buffer_ethash_search_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_target_sync_buffer_ethash_search_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_target_sync_buffer_ethash_search_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_target_sync_buffer_ethash_search_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_tobool153_not_ethash_search_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unknown_call152_ethash_search_out_call152_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal i_unknown_call152_ethash_search_out_call152_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_unknown_call152_ethash_search_out_call152_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal i_unknown_call152_ethash_search_out_call152_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unknown_call152_ethash_search_out_call152_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unknown_call152_ethash_search_out_call152_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unknown_call152_ethash_search_out_call152_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal i_unknown_call152_ethash_search_out_lsu_call152_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unknown_call152_ethash_search_out_o_readdata : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unknown_call152_ethash_search_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unknown_call152_ethash_search_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_vol_store_unnamed_ethash_search61_ethash_search_out_lsu_unnamed_ethash_search61_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal i_vol_store_unnamed_ethash_search61_ethash_search_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_vol_store_unnamed_ethash_search61_ethash_search_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_vol_store_unnamed_ethash_search61_ethash_search_out_unnamed_ethash_search61_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal i_vol_store_unnamed_ethash_search61_ethash_search_out_unnamed_ethash_search61_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_vol_store_unnamed_ethash_search61_ethash_search_out_unnamed_ethash_search61_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal i_vol_store_unnamed_ethash_search61_ethash_search_out_unnamed_ethash_search61_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_vol_store_unnamed_ethash_search61_ethash_search_out_unnamed_ethash_search61_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_vol_store_unnamed_ethash_search61_ethash_search_out_unnamed_ethash_search61_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_vol_store_unnamed_ethash_search61_ethash_search_out_unnamed_ethash_search61_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal i_vol_store_unnamed_ethash_search62_ethash_search_out_lsu_unnamed_ethash_search62_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal i_vol_store_unnamed_ethash_search62_ethash_search_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_vol_store_unnamed_ethash_search62_ethash_search_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_vol_store_unnamed_ethash_search62_ethash_search_out_unnamed_ethash_search62_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal i_vol_store_unnamed_ethash_search62_ethash_search_out_unnamed_ethash_search62_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_vol_store_unnamed_ethash_search62_ethash_search_out_unnamed_ethash_search62_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal i_vol_store_unnamed_ethash_search62_ethash_search_out_unnamed_ethash_search62_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_vol_store_unnamed_ethash_search62_ethash_search_out_unnamed_ethash_search62_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_vol_store_unnamed_ethash_search62_ethash_search_out_unnamed_ethash_search62_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_vol_store_unnamed_ethash_search62_ethash_search_out_unnamed_ethash_search62_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal i_vol_store_unnamed_ethash_search64_ethash_search_out_lsu_unnamed_ethash_search64_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal i_vol_store_unnamed_ethash_search64_ethash_search_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_vol_store_unnamed_ethash_search64_ethash_search_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_vol_store_unnamed_ethash_search64_ethash_search_out_unnamed_ethash_search64_avm_address : STD_LOGIC_VECTOR (32 downto 0);
    signal i_vol_store_unnamed_ethash_search64_ethash_search_out_unnamed_ethash_search64_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_vol_store_unnamed_ethash_search64_ethash_search_out_unnamed_ethash_search64_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal i_vol_store_unnamed_ethash_search64_ethash_search_out_unnamed_ethash_search64_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_vol_store_unnamed_ethash_search64_ethash_search_out_unnamed_ethash_search64_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_vol_store_unnamed_ethash_search64_ethash_search_out_unnamed_ethash_search64_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_vol_store_unnamed_ethash_search64_ethash_search_out_unnamed_ethash_search64_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal i_astype_ethash_search_ethash_search552_astype_select_0_x_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_astype_ethash_search_ethash_search552_astype_select_0_x_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal i_astype_ethash_search_ethash_search552_astype_select_0_x_merged_bit_select_d : STD_LOGIC_VECTOR (7 downto 0);
    signal i_astype_ethash_search_ethash_search552_astype_select_0_x_merged_bit_select_e : STD_LOGIC_VECTOR (7 downto 0);
    signal i_astype_ethash_search_ethash_search552_astype_select_0_x_merged_bit_select_f : STD_LOGIC_VECTOR (7 downto 0);
    signal i_astype_ethash_search_ethash_search552_astype_select_0_x_merged_bit_select_g : STD_LOGIC_VECTOR (7 downto 0);
    signal i_astype_ethash_search_ethash_search552_astype_select_0_x_merged_bit_select_h : STD_LOGIC_VECTOR (7 downto 0);
    signal i_astype_ethash_search_ethash_search552_astype_select_0_x_merged_bit_select_i : STD_LOGIC_VECTOR (7 downto 0);
    signal redist0_stall_entry_o4_17_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_stall_entry_o4_17_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist0_stall_entry_o4_17_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_stall_entry_o4_17_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist0_stall_entry_o4_17_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_stall_entry_o4_17_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_stall_entry_o4_17_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist0_stall_entry_o4_17_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_stall_entry_o4_17_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist0_stall_entry_o4_17_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_stall_entry_o8_17_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_o8_17_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist1_stall_entry_o8_17_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_o8_17_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist1_stall_entry_o8_17_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist1_stall_entry_o8_17_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_o8_17_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist1_stall_entry_o8_17_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_o8_17_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist1_stall_entry_o8_17_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_stall_entry_o9_17_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_stall_entry_o9_17_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist2_stall_entry_o9_17_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_stall_entry_o9_17_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist2_stall_entry_o9_17_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_stall_entry_o9_17_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_stall_entry_o9_17_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist2_stall_entry_o9_17_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_stall_entry_o9_17_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist2_stall_entry_o9_17_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist3_stall_entry_o10_17_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_stall_entry_o10_17_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist3_stall_entry_o10_17_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_stall_entry_o10_17_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist3_stall_entry_o10_17_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist3_stall_entry_o10_17_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_stall_entry_o10_17_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist3_stall_entry_o10_17_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_stall_entry_o10_17_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist3_stall_entry_o10_17_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist4_stall_entry_o11_17_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_stall_entry_o11_17_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist4_stall_entry_o11_17_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_stall_entry_o11_17_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist4_stall_entry_o11_17_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist4_stall_entry_o11_17_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_stall_entry_o11_17_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist4_stall_entry_o11_17_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_stall_entry_o11_17_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist4_stall_entry_o11_17_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist5_i_cmp148_ethash_search_c_17_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_cmp148_ethash_search_c_17_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist5_i_cmp148_ethash_search_c_17_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_cmp148_ethash_search_c_17_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist5_i_cmp148_ethash_search_c_17_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_cmp148_ethash_search_c_17_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_cmp148_ethash_search_c_17_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist5_i_cmp148_ethash_search_c_17_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_cmp148_ethash_search_c_17_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist5_i_cmp148_ethash_search_c_17_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_syncbuf_g_output_sync_buffer1_ethash_search_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_g_output_sync_buffer1_ethash_search_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_syncbuf_g_output_sync_buffer2_ethash_search_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_g_output_sync_buffer2_ethash_search_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_syncbuf_g_output_sync_buffer3_ethash_search_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_g_output_sync_buffer3_ethash_search_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_syncbuf_g_output_sync_buffer4_ethash_search_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_g_output_sync_buffer4_ethash_search_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_syncbuf_g_output_sync_buffer_ethash_search_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_g_output_sync_buffer_ethash_search_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_syncbuf_target_sync_buffer_ethash_search_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_target_sync_buffer_ethash_search_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_unknown_call152_ethash_search_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_unknown_call152_ethash_search_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (383 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_f : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_g : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_h : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_i : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist0_stall_entry_o4_17_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist0_stall_entry_o4_17_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist1_stall_entry_o8_17_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist1_stall_entry_o8_17_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist2_stall_entry_o9_17_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist2_stall_entry_o9_17_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist3_stall_entry_o10_17_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist3_stall_entry_o10_17_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist4_stall_entry_o11_17_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist4_stall_entry_o11_17_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist5_i_cmp148_ethash_search_c_17_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist5_i_cmp148_ethash_search_c_17_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_wg_limiter_exit_unnamed_ethash_search65_ethash_search_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_wg_limiter_exit_unnamed_ethash_search65_ethash_search_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_g_output_sync_buffer_ethash_search_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_g_output_sync_buffer_ethash_search_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_g_output_sync_buffer_ethash_search_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_g_output_sync_buffer_ethash_search_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_target_sync_buffer_ethash_search_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_target_sync_buffer_ethash_search_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_target_sync_buffer_ethash_search_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_target_sync_buffer_ethash_search_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_target_sync_buffer_ethash_search_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_target_sync_buffer_ethash_search_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_target_sync_buffer_ethash_search_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_target_sync_buffer_ethash_search_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_target_sync_buffer_ethash_search_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_target_sync_buffer_ethash_search_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_target_sync_buffer_ethash_search_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_target_sync_buffer_ethash_search_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_target_sync_buffer_ethash_search_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_target_sync_buffer_ethash_search_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_vol_store_unnamed_ethash_search64_ethash_search_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_vol_store_unnamed_ethash_search64_ethash_search_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_vol_store_unnamed_ethash_search64_ethash_search_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_vol_store_unnamed_ethash_search64_ethash_search_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_vol_store_unnamed_ethash_search64_ethash_search_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_vol_store_unnamed_ethash_search64_ethash_search_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_stall_entry_o4_17_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_stall_entry_o4_17_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_stall_entry_o4_17_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_stall_entry_o4_17_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_stall_entry_o4_17_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_stall_entry_o9_17_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_stall_entry_o9_17_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_stall_entry_o9_17_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_stall_entry_o9_17_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_stall_entry_o9_17_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_stall_entry_o10_17_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_stall_entry_o10_17_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_stall_entry_o10_17_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_stall_entry_o10_17_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_stall_entry_o10_17_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist4_stall_entry_o11_17_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist4_stall_entry_o11_17_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist4_stall_entry_o11_17_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist4_stall_entry_o11_17_fifo_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist4_stall_entry_o11_17_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist4_stall_entry_o11_17_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_4_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_4_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_5_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_5_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_5_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_6_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_6_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_6_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_7_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_7_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_7_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_4_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_4_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_4_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_4_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_4_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_4_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_4_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_4_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_5_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_5_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_5_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_5_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_5_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_5_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_5_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_5_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_6_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_6_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_6_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_6_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_6_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_6_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_6_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_6_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_7_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_7_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_7_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_7_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_7_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_7_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_7_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_7_reg_stall_out_bitsignaltemp : std_logic;

begin


    -- c_i32_1gr(CONSTANT,72)
    c_i32_1gr_q <= "00000000000000000000000000000001";

    -- redist5_i_cmp148_ethash_search_c_17_fifo(STALLFIFO,113)
    redist5_i_cmp148_ethash_search_c_17_fifo_valid_in <= SE_out_i_syncbuf_target_sync_buffer_ethash_search_V1;
    redist5_i_cmp148_ethash_search_c_17_fifo_stall_in <= SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_backStall;
    redist5_i_cmp148_ethash_search_c_17_fifo_data_in <= i_cmp148_ethash_search_c;
    redist5_i_cmp148_ethash_search_c_17_fifo_valid_in_bitsignaltemp <= redist5_i_cmp148_ethash_search_c_17_fifo_valid_in(0);
    redist5_i_cmp148_ethash_search_c_17_fifo_stall_in_bitsignaltemp <= redist5_i_cmp148_ethash_search_c_17_fifo_stall_in(0);
    redist5_i_cmp148_ethash_search_c_17_fifo_valid_out(0) <= redist5_i_cmp148_ethash_search_c_17_fifo_valid_out_bitsignaltemp;
    redist5_i_cmp148_ethash_search_c_17_fifo_stall_out(0) <= redist5_i_cmp148_ethash_search_c_17_fifo_stall_out_bitsignaltemp;
    theredist5_i_cmp148_ethash_search_c_17_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 18,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist5_i_cmp148_ethash_search_c_17_fifo_valid_in_bitsignaltemp,
        stall_in => redist5_i_cmp148_ethash_search_c_17_fifo_stall_in_bitsignaltemp,
        data_in => i_cmp148_ethash_search_c,
        valid_out => redist5_i_cmp148_ethash_search_c_17_fifo_valid_out_bitsignaltemp,
        stall_out => redist5_i_cmp148_ethash_search_c_17_fifo_stall_out_bitsignaltemp,
        data_out => redist5_i_cmp148_ethash_search_c_17_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_acl_wg_limiter_exit_unnamed_ethash_search65_ethash_search(STALLENABLE,181)
    -- Backward Stall generation
    SE_out_i_acl_wg_limiter_exit_unnamed_ethash_search65_ethash_search_backStall <= "0";
    -- Computing multiple Valid(s)
    SE_out_i_acl_wg_limiter_exit_unnamed_ethash_search65_ethash_search_wireValid <= i_acl_wg_limiter_exit_unnamed_ethash_search65_ethash_search_out_valid_out;

    -- bubble_join_stall_entry(BITJOIN,140)
    bubble_join_stall_entry_q <= in_state_9_2_cast182 & in_state_8_2_cast180 & in_state_11_2_cast186 & in_state_10_2_cast184 & in_scalarizer_11233189 & in_scalarizer_01232188 & in_l_grpid_01 & in_global_id_0190;

    -- bubble_select_stall_entry(BITSELECT,141)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(31 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(63 downto 32));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(95 downto 64));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(127 downto 96));
    bubble_select_stall_entry_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(191 downto 128));
    bubble_select_stall_entry_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(255 downto 192));
    bubble_select_stall_entry_h <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(319 downto 256));
    bubble_select_stall_entry_i <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(383 downto 320));

    -- i_acl_wg_limiter_exit_unnamed_ethash_search65_ethash_search(BLACKBOX,78)@0
    -- in in_stall_in@20000000
    -- out out_data_out@1
    -- out out_exit_stall_in@1
    -- out out_exit_valid_in@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thei_acl_wg_limiter_exit_unnamed_ethash_search65_ethash_search : i_acl_wg_limiter_exit_unnamed_ethash_search65_ethash_search582
    PORT MAP (
        in_data_in => bubble_select_stall_entry_c,
        in_exit_stall_out => in_wgl_0_exit_exit_stall_out,
        in_exit_valid_out => in_wgl_0_exit_exit_valid_out,
        in_stall_in => SE_out_i_acl_wg_limiter_exit_unnamed_ethash_search65_ethash_search_backStall,
        in_valid_in => SE_stall_entry_V12,
        out_exit_stall_in => i_acl_wg_limiter_exit_unnamed_ethash_search65_ethash_search_out_exit_stall_in,
        out_exit_valid_in => i_acl_wg_limiter_exit_unnamed_ethash_search65_ethash_search_out_exit_valid_in,
        out_stall_out => i_acl_wg_limiter_exit_unnamed_ethash_search65_ethash_search_out_stall_out,
        out_valid_out => i_acl_wg_limiter_exit_unnamed_ethash_search65_ethash_search_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_redist0_stall_entry_o4_17_fifo(BITJOIN,150)
    bubble_join_redist0_stall_entry_o4_17_fifo_q <= redist0_stall_entry_o4_17_fifo_data_out;

    -- bubble_select_redist0_stall_entry_o4_17_fifo(BITSELECT,151)
    bubble_select_redist0_stall_entry_o4_17_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist0_stall_entry_o4_17_fifo_q(31 downto 0));

    -- SE_out_bubble_out_stall_entry_4(STALLENABLE,266)
    -- Valid signal propagation
    SE_out_bubble_out_stall_entry_4_V0 <= SE_out_bubble_out_stall_entry_4_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_stall_entry_4_backStall <= i_syncbuf_g_output_sync_buffer1_ethash_search_out_stall_out or not (SE_out_bubble_out_stall_entry_4_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_stall_entry_4_wireValid <= bubble_out_stall_entry_4_reg_valid_out;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_syncbuf_g_output_sync_buffer1_ethash_search(BLACKBOX,81)@17
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_g_output_sync_buffer1_ethash_search : i_syncbuf_g_output_sync_buffer1_ethash_search561
    PORT MAP (
        in_buffer_in => in_g_output,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_redist0_stall_entry_o4_17_fifo_backStall,
        in_valid_in => SE_out_bubble_out_stall_entry_4_V0,
        out_buffer_out => i_syncbuf_g_output_sync_buffer1_ethash_search_out_buffer_out,
        out_stall_out => i_syncbuf_g_output_sync_buffer1_ethash_search_out_stall_out,
        out_valid_out => i_syncbuf_g_output_sync_buffer1_ethash_search_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist0_stall_entry_o4_17_fifo(STALLENABLE,208)
    -- Valid signal propagation
    SE_out_redist0_stall_entry_o4_17_fifo_V0 <= SE_out_redist0_stall_entry_o4_17_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist0_stall_entry_o4_17_fifo_backStall <= i_vol_store_unnamed_ethash_search61_ethash_search_out_o_stall or not (SE_out_redist0_stall_entry_o4_17_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist0_stall_entry_o4_17_fifo_and0 <= redist0_stall_entry_o4_17_fifo_valid_out;
    SE_out_redist0_stall_entry_o4_17_fifo_and1 <= i_syncbuf_g_output_sync_buffer1_ethash_search_out_valid_out and SE_out_redist0_stall_entry_o4_17_fifo_and0;
    SE_out_redist0_stall_entry_o4_17_fifo_wireValid <= SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_V1 and SE_out_redist0_stall_entry_o4_17_fifo_and1;

    -- i_gid156_ethash_search_ethash_search563_c_i64_4gr_x(CONSTANT,66)
    i_gid156_ethash_search_ethash_search563_c_i64_4gr_x_q <= "0000000000000000000000000000000000000000000000000000000000000100";

    -- bubble_join_i_syncbuf_g_output_sync_buffer1_ethash_search(BITJOIN,116)
    bubble_join_i_syncbuf_g_output_sync_buffer1_ethash_search_q <= i_syncbuf_g_output_sync_buffer1_ethash_search_out_buffer_out;

    -- bubble_select_i_syncbuf_g_output_sync_buffer1_ethash_search(BITSELECT,117)
    bubble_select_i_syncbuf_g_output_sync_buffer1_ethash_search_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_g_output_sync_buffer1_ethash_search_q(63 downto 0));

    -- i_gid156_ethash_search_ethash_search563_add_x(ADD,65)@17
    i_gid156_ethash_search_ethash_search563_add_x_a <= STD_LOGIC_VECTOR("0" & bubble_select_i_syncbuf_g_output_sync_buffer1_ethash_search_b);
    i_gid156_ethash_search_ethash_search563_add_x_b <= STD_LOGIC_VECTOR("0" & i_gid156_ethash_search_ethash_search563_c_i64_4gr_x_q);
    i_gid156_ethash_search_ethash_search563_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_gid156_ethash_search_ethash_search563_add_x_a) + UNSIGNED(i_gid156_ethash_search_ethash_search563_add_x_b));
    i_gid156_ethash_search_ethash_search563_add_x_q <= i_gid156_ethash_search_ethash_search563_add_x_o(64 downto 0);

    -- i_gid156_ethash_search_ethash_search563_trunc_sel_x(BITSELECT,64)@17
    i_gid156_ethash_search_ethash_search563_trunc_sel_x_b <= i_gid156_ethash_search_ethash_search563_add_x_q(63 downto 0);

    -- i_vol_store_unnamed_ethash_search61_ethash_search(BLACKBOX,89)@17
    -- in in_i_stall@20000000
    -- out out_lsu_unnamed_ethash_search61_o_active@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@19
    -- out out_unnamed_ethash_search61_avm_address@20000000
    -- out out_unnamed_ethash_search61_avm_burstcount@20000000
    -- out out_unnamed_ethash_search61_avm_byteenable@20000000
    -- out out_unnamed_ethash_search61_avm_enable@20000000
    -- out out_unnamed_ethash_search61_avm_read@20000000
    -- out out_unnamed_ethash_search61_avm_write@20000000
    -- out out_unnamed_ethash_search61_avm_writedata@20000000
    thei_vol_store_unnamed_ethash_search61_ethash_search : i_vol_store_unnamed_ethash_search61_ethash_search565
    PORT MAP (
        in_flush => in_flush,
        in_i_address => i_gid156_ethash_search_ethash_search563_trunc_sel_x_b,
        in_i_predicate => i_acl_1421_xor_or_ethash_search_q,
        in_i_stall => SE_out_i_vol_store_unnamed_ethash_search64_ethash_search_backStall,
        in_i_valid => SE_out_redist0_stall_entry_o4_17_fifo_V0,
        in_i_writedata => bubble_select_redist0_stall_entry_o4_17_fifo_b,
        in_unnamed_ethash_search61_avm_readdata => in_unnamed_ethash_search61_avm_readdata,
        in_unnamed_ethash_search61_avm_readdatavalid => in_unnamed_ethash_search61_avm_readdatavalid,
        in_unnamed_ethash_search61_avm_waitrequest => in_unnamed_ethash_search61_avm_waitrequest,
        in_unnamed_ethash_search61_avm_writeack => in_unnamed_ethash_search61_avm_writeack,
        out_lsu_unnamed_ethash_search61_o_active => i_vol_store_unnamed_ethash_search61_ethash_search_out_lsu_unnamed_ethash_search61_o_active,
        out_o_stall => i_vol_store_unnamed_ethash_search61_ethash_search_out_o_stall,
        out_o_valid => i_vol_store_unnamed_ethash_search61_ethash_search_out_o_valid,
        out_unnamed_ethash_search61_avm_address => i_vol_store_unnamed_ethash_search61_ethash_search_out_unnamed_ethash_search61_avm_address,
        out_unnamed_ethash_search61_avm_burstcount => i_vol_store_unnamed_ethash_search61_ethash_search_out_unnamed_ethash_search61_avm_burstcount,
        out_unnamed_ethash_search61_avm_byteenable => i_vol_store_unnamed_ethash_search61_ethash_search_out_unnamed_ethash_search61_avm_byteenable,
        out_unnamed_ethash_search61_avm_enable => i_vol_store_unnamed_ethash_search61_ethash_search_out_unnamed_ethash_search61_avm_enable,
        out_unnamed_ethash_search61_avm_read => i_vol_store_unnamed_ethash_search61_ethash_search_out_unnamed_ethash_search61_avm_read,
        out_unnamed_ethash_search61_avm_write => i_vol_store_unnamed_ethash_search61_ethash_search_out_unnamed_ethash_search61_avm_write,
        out_unnamed_ethash_search61_avm_writedata => i_vol_store_unnamed_ethash_search61_ethash_search_out_unnamed_ethash_search61_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_redist3_stall_entry_o10_17_fifo(BITJOIN,159)
    bubble_join_redist3_stall_entry_o10_17_fifo_q <= redist3_stall_entry_o10_17_fifo_data_out;

    -- bubble_select_redist3_stall_entry_o10_17_fifo(BITSELECT,160)
    bubble_select_redist3_stall_entry_o10_17_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist3_stall_entry_o10_17_fifo_q(63 downto 0));

    -- SE_out_bubble_out_stall_entry_5(STALLENABLE,268)
    -- Valid signal propagation
    SE_out_bubble_out_stall_entry_5_V0 <= SE_out_bubble_out_stall_entry_5_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_stall_entry_5_backStall <= i_syncbuf_g_output_sync_buffer2_ethash_search_out_stall_out or not (SE_out_bubble_out_stall_entry_5_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_stall_entry_5_wireValid <= bubble_out_stall_entry_5_reg_valid_out;

    -- i_syncbuf_g_output_sync_buffer2_ethash_search(BLACKBOX,82)@17
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_g_output_sync_buffer2_ethash_search : i_syncbuf_g_output_sync_buffer2_ethash_search567
    PORT MAP (
        in_buffer_in => in_g_output,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_redist3_stall_entry_o10_17_fifo_backStall,
        in_valid_in => SE_out_bubble_out_stall_entry_5_V0,
        out_buffer_out => i_syncbuf_g_output_sync_buffer2_ethash_search_out_buffer_out,
        out_stall_out => i_syncbuf_g_output_sync_buffer2_ethash_search_out_stall_out,
        out_valid_out => i_syncbuf_g_output_sync_buffer2_ethash_search_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist3_stall_entry_o10_17_fifo(STALLENABLE,214)
    -- Valid signal propagation
    SE_out_redist3_stall_entry_o10_17_fifo_V0 <= SE_out_redist3_stall_entry_o10_17_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist3_stall_entry_o10_17_fifo_backStall <= i_vol_store_unnamed_ethash_search62_ethash_search_out_o_stall or not (SE_out_redist3_stall_entry_o10_17_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist3_stall_entry_o10_17_fifo_and0 <= redist3_stall_entry_o10_17_fifo_valid_out;
    SE_out_redist3_stall_entry_o10_17_fifo_and1 <= i_syncbuf_g_output_sync_buffer2_ethash_search_out_valid_out and SE_out_redist3_stall_entry_o10_17_fifo_and0;
    SE_out_redist3_stall_entry_o10_17_fifo_wireValid <= SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_V2 and SE_out_redist3_stall_entry_o10_17_fifo_and1;

    -- i_arrayidx159_ethash_search_ethash_search569_c_i64_8gr_x(CONSTANT,45)
    i_arrayidx159_ethash_search_ethash_search569_c_i64_8gr_x_q <= "0000000000000000000000000000000000000000000000000000000000001000";

    -- bubble_join_i_syncbuf_g_output_sync_buffer2_ethash_search(BITJOIN,119)
    bubble_join_i_syncbuf_g_output_sync_buffer2_ethash_search_q <= i_syncbuf_g_output_sync_buffer2_ethash_search_out_buffer_out;

    -- bubble_select_i_syncbuf_g_output_sync_buffer2_ethash_search(BITSELECT,120)
    bubble_select_i_syncbuf_g_output_sync_buffer2_ethash_search_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_g_output_sync_buffer2_ethash_search_q(63 downto 0));

    -- i_arrayidx159_ethash_search_ethash_search569_add_x(ADD,44)@17
    i_arrayidx159_ethash_search_ethash_search569_add_x_a <= STD_LOGIC_VECTOR("0" & bubble_select_i_syncbuf_g_output_sync_buffer2_ethash_search_b);
    i_arrayidx159_ethash_search_ethash_search569_add_x_b <= STD_LOGIC_VECTOR("0" & i_arrayidx159_ethash_search_ethash_search569_c_i64_8gr_x_q);
    i_arrayidx159_ethash_search_ethash_search569_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx159_ethash_search_ethash_search569_add_x_a) + UNSIGNED(i_arrayidx159_ethash_search_ethash_search569_add_x_b));
    i_arrayidx159_ethash_search_ethash_search569_add_x_q <= i_arrayidx159_ethash_search_ethash_search569_add_x_o(64 downto 0);

    -- i_arrayidx159_ethash_search_ethash_search569_trunc_sel_x(BITSELECT,43)@17
    i_arrayidx159_ethash_search_ethash_search569_trunc_sel_x_b <= i_arrayidx159_ethash_search_ethash_search569_add_x_q(63 downto 0);

    -- i_vol_store_unnamed_ethash_search62_ethash_search(BLACKBOX,90)@17
    -- in in_i_stall@20000000
    -- out out_lsu_unnamed_ethash_search62_o_active@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@19
    -- out out_unnamed_ethash_search62_avm_address@20000000
    -- out out_unnamed_ethash_search62_avm_burstcount@20000000
    -- out out_unnamed_ethash_search62_avm_byteenable@20000000
    -- out out_unnamed_ethash_search62_avm_enable@20000000
    -- out out_unnamed_ethash_search62_avm_read@20000000
    -- out out_unnamed_ethash_search62_avm_write@20000000
    -- out out_unnamed_ethash_search62_avm_writedata@20000000
    thei_vol_store_unnamed_ethash_search62_ethash_search : i_vol_store_unnamed_ethash_search62_ethash_search570
    PORT MAP (
        in_flush => in_flush,
        in_i_address => i_arrayidx159_ethash_search_ethash_search569_trunc_sel_x_b,
        in_i_predicate => i_acl_1421_xor_or_ethash_search_q,
        in_i_stall => SE_out_i_vol_store_unnamed_ethash_search64_ethash_search_backStall,
        in_i_valid => SE_out_redist3_stall_entry_o10_17_fifo_V0,
        in_i_writedata => bubble_select_redist3_stall_entry_o10_17_fifo_b,
        in_unnamed_ethash_search62_avm_readdata => in_unnamed_ethash_search62_avm_readdata,
        in_unnamed_ethash_search62_avm_readdatavalid => in_unnamed_ethash_search62_avm_readdatavalid,
        in_unnamed_ethash_search62_avm_waitrequest => in_unnamed_ethash_search62_avm_waitrequest,
        in_unnamed_ethash_search62_avm_writeack => in_unnamed_ethash_search62_avm_writeack,
        out_lsu_unnamed_ethash_search62_o_active => i_vol_store_unnamed_ethash_search62_ethash_search_out_lsu_unnamed_ethash_search62_o_active,
        out_o_stall => i_vol_store_unnamed_ethash_search62_ethash_search_out_o_stall,
        out_o_valid => i_vol_store_unnamed_ethash_search62_ethash_search_out_o_valid,
        out_unnamed_ethash_search62_avm_address => i_vol_store_unnamed_ethash_search62_ethash_search_out_unnamed_ethash_search62_avm_address,
        out_unnamed_ethash_search62_avm_burstcount => i_vol_store_unnamed_ethash_search62_ethash_search_out_unnamed_ethash_search62_avm_burstcount,
        out_unnamed_ethash_search62_avm_byteenable => i_vol_store_unnamed_ethash_search62_ethash_search_out_unnamed_ethash_search62_avm_byteenable,
        out_unnamed_ethash_search62_avm_enable => i_vol_store_unnamed_ethash_search62_ethash_search_out_unnamed_ethash_search62_avm_enable,
        out_unnamed_ethash_search62_avm_read => i_vol_store_unnamed_ethash_search62_ethash_search_out_unnamed_ethash_search62_avm_read,
        out_unnamed_ethash_search62_avm_write => i_vol_store_unnamed_ethash_search62_ethash_search_out_unnamed_ethash_search62_avm_write,
        out_unnamed_ethash_search62_avm_writedata => i_vol_store_unnamed_ethash_search62_ethash_search_out_unnamed_ethash_search62_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_redist2_stall_entry_o9_17_fifo(BITJOIN,156)
    bubble_join_redist2_stall_entry_o9_17_fifo_q <= redist2_stall_entry_o9_17_fifo_data_out;

    -- bubble_select_redist2_stall_entry_o9_17_fifo(BITSELECT,157)
    bubble_select_redist2_stall_entry_o9_17_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist2_stall_entry_o9_17_fifo_q(63 downto 0));

    -- SE_out_bubble_out_stall_entry_7(STALLENABLE,272)
    -- Valid signal propagation
    SE_out_bubble_out_stall_entry_7_V0 <= SE_out_bubble_out_stall_entry_7_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_stall_entry_7_backStall <= i_syncbuf_g_output_sync_buffer4_ethash_search_out_stall_out or not (SE_out_bubble_out_stall_entry_7_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_stall_entry_7_wireValid <= bubble_out_stall_entry_7_reg_valid_out;

    -- i_syncbuf_g_output_sync_buffer4_ethash_search(BLACKBOX,84)@17
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_g_output_sync_buffer4_ethash_search : i_syncbuf_g_output_sync_buffer4_ethash_search577
    PORT MAP (
        in_buffer_in => in_g_output,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_redist2_stall_entry_o9_17_fifo_backStall,
        in_valid_in => SE_out_bubble_out_stall_entry_7_V0,
        out_buffer_out => i_syncbuf_g_output_sync_buffer4_ethash_search_out_buffer_out,
        out_stall_out => i_syncbuf_g_output_sync_buffer4_ethash_search_out_stall_out,
        out_valid_out => i_syncbuf_g_output_sync_buffer4_ethash_search_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist2_stall_entry_o9_17_fifo(STALLENABLE,212)
    -- Valid signal propagation
    SE_out_redist2_stall_entry_o9_17_fifo_V0 <= SE_out_redist2_stall_entry_o9_17_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist2_stall_entry_o9_17_fifo_backStall <= i_vol_store_unnamed_ethash_search64_ethash_search_out_o_stall or not (SE_out_redist2_stall_entry_o9_17_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist2_stall_entry_o9_17_fifo_and0 <= redist2_stall_entry_o9_17_fifo_valid_out;
    SE_out_redist2_stall_entry_o9_17_fifo_and1 <= i_syncbuf_g_output_sync_buffer4_ethash_search_out_valid_out and SE_out_redist2_stall_entry_o9_17_fifo_and0;
    SE_out_redist2_stall_entry_o9_17_fifo_wireValid <= SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_V3 and SE_out_redist2_stall_entry_o9_17_fifo_and1;

    -- i_arrayidx168_ethash_search_ethash_search579_c_i64_32_x(CONSTANT,53)
    i_arrayidx168_ethash_search_ethash_search579_c_i64_32_x_q <= "0000000000000000000000000000000000000000000000000000000000100000";

    -- bubble_join_i_syncbuf_g_output_sync_buffer4_ethash_search(BITJOIN,125)
    bubble_join_i_syncbuf_g_output_sync_buffer4_ethash_search_q <= i_syncbuf_g_output_sync_buffer4_ethash_search_out_buffer_out;

    -- bubble_select_i_syncbuf_g_output_sync_buffer4_ethash_search(BITSELECT,126)
    bubble_select_i_syncbuf_g_output_sync_buffer4_ethash_search_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_g_output_sync_buffer4_ethash_search_q(63 downto 0));

    -- i_arrayidx168_ethash_search_ethash_search579_add_x(ADD,52)@17
    i_arrayidx168_ethash_search_ethash_search579_add_x_a <= STD_LOGIC_VECTOR("0" & bubble_select_i_syncbuf_g_output_sync_buffer4_ethash_search_b);
    i_arrayidx168_ethash_search_ethash_search579_add_x_b <= STD_LOGIC_VECTOR("0" & i_arrayidx168_ethash_search_ethash_search579_c_i64_32_x_q);
    i_arrayidx168_ethash_search_ethash_search579_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx168_ethash_search_ethash_search579_add_x_a) + UNSIGNED(i_arrayidx168_ethash_search_ethash_search579_add_x_b));
    i_arrayidx168_ethash_search_ethash_search579_add_x_q <= i_arrayidx168_ethash_search_ethash_search579_add_x_o(64 downto 0);

    -- i_arrayidx168_ethash_search_ethash_search579_trunc_sel_x(BITSELECT,51)@17
    i_arrayidx168_ethash_search_ethash_search579_trunc_sel_x_b <= i_arrayidx168_ethash_search_ethash_search579_add_x_q(63 downto 0);

    -- i_vol_store_unnamed_ethash_search64_ethash_search(BLACKBOX,91)@17
    -- in in_i_stall@20000000
    -- out out_lsu_unnamed_ethash_search64_o_active@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@19
    -- out out_unnamed_ethash_search64_avm_address@20000000
    -- out out_unnamed_ethash_search64_avm_burstcount@20000000
    -- out out_unnamed_ethash_search64_avm_byteenable@20000000
    -- out out_unnamed_ethash_search64_avm_enable@20000000
    -- out out_unnamed_ethash_search64_avm_read@20000000
    -- out out_unnamed_ethash_search64_avm_write@20000000
    -- out out_unnamed_ethash_search64_avm_writedata@20000000
    thei_vol_store_unnamed_ethash_search64_ethash_search : i_vol_store_unnamed_ethash_search64_ethash_search580
    PORT MAP (
        in_flush => in_flush,
        in_i_address => i_arrayidx168_ethash_search_ethash_search579_trunc_sel_x_b,
        in_i_predicate => i_acl_1421_xor_or_ethash_search_q,
        in_i_stall => SE_out_i_vol_store_unnamed_ethash_search64_ethash_search_backStall,
        in_i_valid => SE_out_redist2_stall_entry_o9_17_fifo_V0,
        in_i_writedata => bubble_select_redist2_stall_entry_o9_17_fifo_b,
        in_unnamed_ethash_search64_avm_readdata => in_unnamed_ethash_search64_avm_readdata,
        in_unnamed_ethash_search64_avm_readdatavalid => in_unnamed_ethash_search64_avm_readdatavalid,
        in_unnamed_ethash_search64_avm_waitrequest => in_unnamed_ethash_search64_avm_waitrequest,
        in_unnamed_ethash_search64_avm_writeack => in_unnamed_ethash_search64_avm_writeack,
        out_lsu_unnamed_ethash_search64_o_active => i_vol_store_unnamed_ethash_search64_ethash_search_out_lsu_unnamed_ethash_search64_o_active,
        out_o_stall => i_vol_store_unnamed_ethash_search64_ethash_search_out_o_stall,
        out_o_valid => i_vol_store_unnamed_ethash_search64_ethash_search_out_o_valid,
        out_unnamed_ethash_search64_avm_address => i_vol_store_unnamed_ethash_search64_ethash_search_out_unnamed_ethash_search64_avm_address,
        out_unnamed_ethash_search64_avm_burstcount => i_vol_store_unnamed_ethash_search64_ethash_search_out_unnamed_ethash_search64_avm_burstcount,
        out_unnamed_ethash_search64_avm_byteenable => i_vol_store_unnamed_ethash_search64_ethash_search_out_unnamed_ethash_search64_avm_byteenable,
        out_unnamed_ethash_search64_avm_enable => i_vol_store_unnamed_ethash_search64_ethash_search_out_unnamed_ethash_search64_avm_enable,
        out_unnamed_ethash_search64_avm_read => i_vol_store_unnamed_ethash_search64_ethash_search_out_unnamed_ethash_search64_avm_read,
        out_unnamed_ethash_search64_avm_write => i_vol_store_unnamed_ethash_search64_ethash_search_out_unnamed_ethash_search64_avm_write,
        out_unnamed_ethash_search64_avm_writedata => i_vol_store_unnamed_ethash_search64_ethash_search_out_unnamed_ethash_search64_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_vol_store_unnamed_ethash_search64_ethash_search(STALLENABLE,203)
    -- Valid signal propagation
    SE_out_i_vol_store_unnamed_ethash_search64_ethash_search_V0 <= SE_out_i_vol_store_unnamed_ethash_search64_ethash_search_wireValid;
    -- Backward Stall generation
    SE_out_i_vol_store_unnamed_ethash_search64_ethash_search_backStall <= in_stall_in or not (SE_out_i_vol_store_unnamed_ethash_search64_ethash_search_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_vol_store_unnamed_ethash_search64_ethash_search_and0 <= i_vol_store_unnamed_ethash_search64_ethash_search_out_o_valid;
    SE_out_i_vol_store_unnamed_ethash_search64_ethash_search_and1 <= i_vol_store_unnamed_ethash_search62_ethash_search_out_o_valid and SE_out_i_vol_store_unnamed_ethash_search64_ethash_search_and0;
    SE_out_i_vol_store_unnamed_ethash_search64_ethash_search_and2 <= i_vol_store_unnamed_ethash_search61_ethash_search_out_o_valid and SE_out_i_vol_store_unnamed_ethash_search64_ethash_search_and1;
    SE_out_i_vol_store_unnamed_ethash_search64_ethash_search_wireValid <= i_vol_store_unnamed_ethash_search63_ethash_search_aunroll_x_out_o_valid and SE_out_i_vol_store_unnamed_ethash_search64_ethash_search_and2;

    -- c_i32_0gr(CONSTANT,71)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- bubble_join_i_unknown_call152_ethash_search(BITJOIN,134)
    bubble_join_i_unknown_call152_ethash_search_q <= i_unknown_call152_ethash_search_out_o_readdata;

    -- bubble_select_i_unknown_call152_ethash_search(BITSELECT,135)
    bubble_select_i_unknown_call152_ethash_search_b <= STD_LOGIC_VECTOR(bubble_join_i_unknown_call152_ethash_search_q(31 downto 0));

    -- i_tobool153_not_ethash_search(LOGICAL,87)@17
    i_tobool153_not_ethash_search_q <= "1" WHEN bubble_select_i_unknown_call152_ethash_search_b /= c_i32_0gr_q ELSE "0";

    -- bubble_join_redist5_i_cmp148_ethash_search_c_17_fifo(BITJOIN,165)
    bubble_join_redist5_i_cmp148_ethash_search_c_17_fifo_q <= redist5_i_cmp148_ethash_search_c_17_fifo_data_out;

    -- bubble_select_redist5_i_cmp148_ethash_search_c_17_fifo(BITSELECT,166)
    bubble_select_redist5_i_cmp148_ethash_search_c_17_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist5_i_cmp148_ethash_search_c_17_fifo_q(0 downto 0));

    -- i_acl_1421_xor_or_ethash_search(LOGICAL,77)@17
    i_acl_1421_xor_or_ethash_search_q <= bubble_select_redist5_i_cmp148_ethash_search_c_17_fifo_b or i_tobool153_not_ethash_search_q;

    -- i_arrayidx162_ethash_search_ethash_search574_c_i64_16_x(CONSTANT,49)
    i_arrayidx162_ethash_search_ethash_search574_c_i64_16_x_q <= "0000000000000000000000000000000000000000000000000000000000010000";

    -- bubble_join_i_syncbuf_g_output_sync_buffer3_ethash_search(BITJOIN,122)
    bubble_join_i_syncbuf_g_output_sync_buffer3_ethash_search_q <= i_syncbuf_g_output_sync_buffer3_ethash_search_out_buffer_out;

    -- bubble_select_i_syncbuf_g_output_sync_buffer3_ethash_search(BITSELECT,123)
    bubble_select_i_syncbuf_g_output_sync_buffer3_ethash_search_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_g_output_sync_buffer3_ethash_search_q(63 downto 0));

    -- i_arrayidx162_ethash_search_ethash_search574_add_x(ADD,48)@17
    i_arrayidx162_ethash_search_ethash_search574_add_x_a <= STD_LOGIC_VECTOR("0" & bubble_select_i_syncbuf_g_output_sync_buffer3_ethash_search_b);
    i_arrayidx162_ethash_search_ethash_search574_add_x_b <= STD_LOGIC_VECTOR("0" & i_arrayidx162_ethash_search_ethash_search574_c_i64_16_x_q);
    i_arrayidx162_ethash_search_ethash_search574_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx162_ethash_search_ethash_search574_add_x_a) + UNSIGNED(i_arrayidx162_ethash_search_ethash_search574_add_x_b));
    i_arrayidx162_ethash_search_ethash_search574_add_x_q <= i_arrayidx162_ethash_search_ethash_search574_add_x_o(64 downto 0);

    -- i_arrayidx162_ethash_search_ethash_search574_trunc_sel_x(BITSELECT,47)@17
    i_arrayidx162_ethash_search_ethash_search574_trunc_sel_x_b <= i_arrayidx162_ethash_search_ethash_search574_add_x_q(63 downto 0);

    -- bubble_join_redist1_stall_entry_o8_17_fifo(BITJOIN,153)
    bubble_join_redist1_stall_entry_o8_17_fifo_q <= redist1_stall_entry_o8_17_fifo_data_out;

    -- bubble_select_redist1_stall_entry_o8_17_fifo(BITSELECT,154)
    bubble_select_redist1_stall_entry_o8_17_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist1_stall_entry_o8_17_fifo_q(63 downto 0));

    -- bubble_join_redist4_stall_entry_o11_17_fifo(BITJOIN,162)
    bubble_join_redist4_stall_entry_o11_17_fifo_q <= redist4_stall_entry_o11_17_fifo_data_out;

    -- bubble_select_redist4_stall_entry_o11_17_fifo(BITSELECT,163)
    bubble_select_redist4_stall_entry_o11_17_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist4_stall_entry_o11_17_fifo_q(63 downto 0));

    -- i_vol_store_unnamed_ethash_search63_ethash_search_aunroll_x(BLACKBOX,69)@17
    -- in in_i_stall@20000000
    -- out out_lsu_unnamed_ethash_search63_o_active@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@19
    -- out out_unnamed_ethash_search63_avm_address@20000000
    -- out out_unnamed_ethash_search63_avm_burstcount@20000000
    -- out out_unnamed_ethash_search63_avm_byteenable@20000000
    -- out out_unnamed_ethash_search63_avm_enable@20000000
    -- out out_unnamed_ethash_search63_avm_read@20000000
    -- out out_unnamed_ethash_search63_avm_write@20000000
    -- out out_unnamed_ethash_search63_avm_writedata@20000000
    thei_vol_store_unnamed_ethash_search63_ethash_search_aunroll_x : i_vol_store_unnamed_ethash_search63_ethash_search575
    PORT MAP (
        in_i_writedata_0 => bubble_select_redist4_stall_entry_o11_17_fifo_b,
        in_i_writedata_1 => bubble_select_redist1_stall_entry_o8_17_fifo_b,
        in_flush => in_flush,
        in_i_address => i_arrayidx162_ethash_search_ethash_search574_trunc_sel_x_b,
        in_i_predicate => i_acl_1421_xor_or_ethash_search_q,
        in_i_stall => SE_out_i_vol_store_unnamed_ethash_search64_ethash_search_backStall,
        in_i_valid => SE_out_redist4_stall_entry_o11_17_fifo_V0,
        in_unnamed_ethash_search63_avm_readdata => in_unnamed_ethash_search63_avm_readdata,
        in_unnamed_ethash_search63_avm_readdatavalid => in_unnamed_ethash_search63_avm_readdatavalid,
        in_unnamed_ethash_search63_avm_waitrequest => in_unnamed_ethash_search63_avm_waitrequest,
        in_unnamed_ethash_search63_avm_writeack => in_unnamed_ethash_search63_avm_writeack,
        out_lsu_unnamed_ethash_search63_o_active => i_vol_store_unnamed_ethash_search63_ethash_search_aunroll_x_out_lsu_unnamed_ethash_search63_o_active,
        out_o_stall => i_vol_store_unnamed_ethash_search63_ethash_search_aunroll_x_out_o_stall,
        out_o_valid => i_vol_store_unnamed_ethash_search63_ethash_search_aunroll_x_out_o_valid,
        out_unnamed_ethash_search63_avm_address => i_vol_store_unnamed_ethash_search63_ethash_search_aunroll_x_out_unnamed_ethash_search63_avm_address,
        out_unnamed_ethash_search63_avm_burstcount => i_vol_store_unnamed_ethash_search63_ethash_search_aunroll_x_out_unnamed_ethash_search63_avm_burstcount,
        out_unnamed_ethash_search63_avm_byteenable => i_vol_store_unnamed_ethash_search63_ethash_search_aunroll_x_out_unnamed_ethash_search63_avm_byteenable,
        out_unnamed_ethash_search63_avm_enable => i_vol_store_unnamed_ethash_search63_ethash_search_aunroll_x_out_unnamed_ethash_search63_avm_enable,
        out_unnamed_ethash_search63_avm_read => i_vol_store_unnamed_ethash_search63_ethash_search_aunroll_x_out_unnamed_ethash_search63_avm_read,
        out_unnamed_ethash_search63_avm_write => i_vol_store_unnamed_ethash_search63_ethash_search_aunroll_x_out_unnamed_ethash_search63_avm_write,
        out_unnamed_ethash_search63_avm_writedata => i_vol_store_unnamed_ethash_search63_ethash_search_aunroll_x_out_unnamed_ethash_search63_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_stall_entry_6(STALLENABLE,270)
    -- Valid signal propagation
    SE_out_bubble_out_stall_entry_6_V0 <= SE_out_bubble_out_stall_entry_6_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_stall_entry_6_backStall <= i_syncbuf_g_output_sync_buffer3_ethash_search_out_stall_out or not (SE_out_bubble_out_stall_entry_6_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_stall_entry_6_wireValid <= bubble_out_stall_entry_6_reg_valid_out;

    -- i_syncbuf_g_output_sync_buffer3_ethash_search(BLACKBOX,83)@17
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_g_output_sync_buffer3_ethash_search : i_syncbuf_g_output_sync_buffer3_ethash_search572
    PORT MAP (
        in_buffer_in => in_g_output,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_redist4_stall_entry_o11_17_fifo_backStall,
        in_valid_in => SE_out_bubble_out_stall_entry_6_V0,
        out_buffer_out => i_syncbuf_g_output_sync_buffer3_ethash_search_out_buffer_out,
        out_stall_out => i_syncbuf_g_output_sync_buffer3_ethash_search_out_stall_out,
        out_valid_out => i_syncbuf_g_output_sync_buffer3_ethash_search_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist4_stall_entry_o11_17_fifo(STALLENABLE,216)
    -- Valid signal propagation
    SE_out_redist4_stall_entry_o11_17_fifo_V0 <= SE_out_redist4_stall_entry_o11_17_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist4_stall_entry_o11_17_fifo_backStall <= i_vol_store_unnamed_ethash_search63_ethash_search_aunroll_x_out_o_stall or not (SE_out_redist4_stall_entry_o11_17_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist4_stall_entry_o11_17_fifo_and0 <= redist4_stall_entry_o11_17_fifo_valid_out;
    SE_out_redist4_stall_entry_o11_17_fifo_and1 <= redist1_stall_entry_o8_17_fifo_valid_out and SE_out_redist4_stall_entry_o11_17_fifo_and0;
    SE_out_redist4_stall_entry_o11_17_fifo_and2 <= i_syncbuf_g_output_sync_buffer3_ethash_search_out_valid_out and SE_out_redist4_stall_entry_o11_17_fifo_and1;
    SE_out_redist4_stall_entry_o11_17_fifo_wireValid <= SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_V0 and SE_out_redist4_stall_entry_o11_17_fifo_and2;

    -- redist4_stall_entry_o11_17_fifo(STALLFIFO,112)
    redist4_stall_entry_o11_17_fifo_valid_in <= SE_stall_entry_V10;
    redist4_stall_entry_o11_17_fifo_stall_in <= SE_out_redist4_stall_entry_o11_17_fifo_backStall;
    redist4_stall_entry_o11_17_fifo_data_in <= bubble_select_stall_entry_i;
    redist4_stall_entry_o11_17_fifo_valid_in_bitsignaltemp <= redist4_stall_entry_o11_17_fifo_valid_in(0);
    redist4_stall_entry_o11_17_fifo_stall_in_bitsignaltemp <= redist4_stall_entry_o11_17_fifo_stall_in(0);
    redist4_stall_entry_o11_17_fifo_valid_out(0) <= redist4_stall_entry_o11_17_fifo_valid_out_bitsignaltemp;
    redist4_stall_entry_o11_17_fifo_stall_out(0) <= redist4_stall_entry_o11_17_fifo_stall_out_bitsignaltemp;
    theredist4_stall_entry_o11_17_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 18,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist4_stall_entry_o11_17_fifo_valid_in_bitsignaltemp,
        stall_in => redist4_stall_entry_o11_17_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_i,
        valid_out => redist4_stall_entry_o11_17_fifo_valid_out_bitsignaltemp,
        stall_out => redist4_stall_entry_o11_17_fifo_stall_out_bitsignaltemp,
        data_out => redist4_stall_entry_o11_17_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist3_stall_entry_o10_17_fifo(STALLFIFO,111)
    redist3_stall_entry_o10_17_fifo_valid_in <= SE_stall_entry_V9;
    redist3_stall_entry_o10_17_fifo_stall_in <= SE_out_redist3_stall_entry_o10_17_fifo_backStall;
    redist3_stall_entry_o10_17_fifo_data_in <= bubble_select_stall_entry_h;
    redist3_stall_entry_o10_17_fifo_valid_in_bitsignaltemp <= redist3_stall_entry_o10_17_fifo_valid_in(0);
    redist3_stall_entry_o10_17_fifo_stall_in_bitsignaltemp <= redist3_stall_entry_o10_17_fifo_stall_in(0);
    redist3_stall_entry_o10_17_fifo_valid_out(0) <= redist3_stall_entry_o10_17_fifo_valid_out_bitsignaltemp;
    redist3_stall_entry_o10_17_fifo_stall_out(0) <= redist3_stall_entry_o10_17_fifo_stall_out_bitsignaltemp;
    theredist3_stall_entry_o10_17_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 18,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist3_stall_entry_o10_17_fifo_valid_in_bitsignaltemp,
        stall_in => redist3_stall_entry_o10_17_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_h,
        valid_out => redist3_stall_entry_o10_17_fifo_valid_out_bitsignaltemp,
        stall_out => redist3_stall_entry_o10_17_fifo_stall_out_bitsignaltemp,
        data_out => redist3_stall_entry_o10_17_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist2_stall_entry_o9_17_fifo(STALLFIFO,110)
    redist2_stall_entry_o9_17_fifo_valid_in <= SE_stall_entry_V8;
    redist2_stall_entry_o9_17_fifo_stall_in <= SE_out_redist2_stall_entry_o9_17_fifo_backStall;
    redist2_stall_entry_o9_17_fifo_data_in <= bubble_select_stall_entry_g;
    redist2_stall_entry_o9_17_fifo_valid_in_bitsignaltemp <= redist2_stall_entry_o9_17_fifo_valid_in(0);
    redist2_stall_entry_o9_17_fifo_stall_in_bitsignaltemp <= redist2_stall_entry_o9_17_fifo_stall_in(0);
    redist2_stall_entry_o9_17_fifo_valid_out(0) <= redist2_stall_entry_o9_17_fifo_valid_out_bitsignaltemp;
    redist2_stall_entry_o9_17_fifo_stall_out(0) <= redist2_stall_entry_o9_17_fifo_stall_out_bitsignaltemp;
    theredist2_stall_entry_o9_17_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 18,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist2_stall_entry_o9_17_fifo_valid_in_bitsignaltemp,
        stall_in => redist2_stall_entry_o9_17_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_g,
        valid_out => redist2_stall_entry_o9_17_fifo_valid_out_bitsignaltemp,
        stall_out => redist2_stall_entry_o9_17_fifo_stall_out_bitsignaltemp,
        data_out => redist2_stall_entry_o9_17_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist1_stall_entry_o8_17_fifo(STALLFIFO,109)
    redist1_stall_entry_o8_17_fifo_valid_in <= SE_stall_entry_V7;
    redist1_stall_entry_o8_17_fifo_stall_in <= SE_out_redist4_stall_entry_o11_17_fifo_backStall;
    redist1_stall_entry_o8_17_fifo_data_in <= bubble_select_stall_entry_f;
    redist1_stall_entry_o8_17_fifo_valid_in_bitsignaltemp <= redist1_stall_entry_o8_17_fifo_valid_in(0);
    redist1_stall_entry_o8_17_fifo_stall_in_bitsignaltemp <= redist1_stall_entry_o8_17_fifo_stall_in(0);
    redist1_stall_entry_o8_17_fifo_valid_out(0) <= redist1_stall_entry_o8_17_fifo_valid_out_bitsignaltemp;
    redist1_stall_entry_o8_17_fifo_stall_out(0) <= redist1_stall_entry_o8_17_fifo_stall_out_bitsignaltemp;
    theredist1_stall_entry_o8_17_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 18,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist1_stall_entry_o8_17_fifo_valid_in_bitsignaltemp,
        stall_in => redist1_stall_entry_o8_17_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_f,
        valid_out => redist1_stall_entry_o8_17_fifo_valid_out_bitsignaltemp,
        stall_out => redist1_stall_entry_o8_17_fifo_stall_out_bitsignaltemp,
        data_out => redist1_stall_entry_o8_17_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist0_stall_entry_o4_17_fifo(STALLFIFO,108)
    redist0_stall_entry_o4_17_fifo_valid_in <= SE_stall_entry_V6;
    redist0_stall_entry_o4_17_fifo_stall_in <= SE_out_redist0_stall_entry_o4_17_fifo_backStall;
    redist0_stall_entry_o4_17_fifo_data_in <= bubble_select_stall_entry_b;
    redist0_stall_entry_o4_17_fifo_valid_in_bitsignaltemp <= redist0_stall_entry_o4_17_fifo_valid_in(0);
    redist0_stall_entry_o4_17_fifo_stall_in_bitsignaltemp <= redist0_stall_entry_o4_17_fifo_stall_in(0);
    redist0_stall_entry_o4_17_fifo_valid_out(0) <= redist0_stall_entry_o4_17_fifo_valid_out_bitsignaltemp;
    redist0_stall_entry_o4_17_fifo_stall_out(0) <= redist0_stall_entry_o4_17_fifo_stall_out_bitsignaltemp;
    theredist0_stall_entry_o4_17_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 18,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist0_stall_entry_o4_17_fifo_valid_in_bitsignaltemp,
        stall_in => redist0_stall_entry_o4_17_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_b,
        valid_out => redist0_stall_entry_o4_17_fifo_valid_out_bitsignaltemp,
        stall_out => redist0_stall_entry_o4_17_fifo_stall_out_bitsignaltemp,
        data_out => redist0_stall_entry_o4_17_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_out_stall_entry_7_reg(STALLFIFO,300)
    bubble_out_stall_entry_7_reg_valid_in <= SE_stall_entry_V5;
    bubble_out_stall_entry_7_reg_stall_in <= SE_out_bubble_out_stall_entry_7_backStall;
    bubble_out_stall_entry_7_reg_valid_in_bitsignaltemp <= bubble_out_stall_entry_7_reg_valid_in(0);
    bubble_out_stall_entry_7_reg_stall_in_bitsignaltemp <= bubble_out_stall_entry_7_reg_stall_in(0);
    bubble_out_stall_entry_7_reg_valid_out(0) <= bubble_out_stall_entry_7_reg_valid_out_bitsignaltemp;
    bubble_out_stall_entry_7_reg_stall_out(0) <= bubble_out_stall_entry_7_reg_stall_out_bitsignaltemp;
    thebubble_out_stall_entry_7_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 18,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_stall_entry_7_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_stall_entry_7_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_stall_entry_7_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_stall_entry_7_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- bubble_out_stall_entry_6_reg(STALLFIFO,299)
    bubble_out_stall_entry_6_reg_valid_in <= SE_stall_entry_V4;
    bubble_out_stall_entry_6_reg_stall_in <= SE_out_bubble_out_stall_entry_6_backStall;
    bubble_out_stall_entry_6_reg_valid_in_bitsignaltemp <= bubble_out_stall_entry_6_reg_valid_in(0);
    bubble_out_stall_entry_6_reg_stall_in_bitsignaltemp <= bubble_out_stall_entry_6_reg_stall_in(0);
    bubble_out_stall_entry_6_reg_valid_out(0) <= bubble_out_stall_entry_6_reg_valid_out_bitsignaltemp;
    bubble_out_stall_entry_6_reg_stall_out(0) <= bubble_out_stall_entry_6_reg_stall_out_bitsignaltemp;
    thebubble_out_stall_entry_6_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 18,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_stall_entry_6_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_stall_entry_6_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_stall_entry_6_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_stall_entry_6_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- bubble_out_stall_entry_5_reg(STALLFIFO,298)
    bubble_out_stall_entry_5_reg_valid_in <= SE_stall_entry_V3;
    bubble_out_stall_entry_5_reg_stall_in <= SE_out_bubble_out_stall_entry_5_backStall;
    bubble_out_stall_entry_5_reg_valid_in_bitsignaltemp <= bubble_out_stall_entry_5_reg_valid_in(0);
    bubble_out_stall_entry_5_reg_stall_in_bitsignaltemp <= bubble_out_stall_entry_5_reg_stall_in(0);
    bubble_out_stall_entry_5_reg_valid_out(0) <= bubble_out_stall_entry_5_reg_valid_out_bitsignaltemp;
    bubble_out_stall_entry_5_reg_stall_out(0) <= bubble_out_stall_entry_5_reg_stall_out_bitsignaltemp;
    thebubble_out_stall_entry_5_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 18,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_stall_entry_5_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_stall_entry_5_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_stall_entry_5_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_stall_entry_5_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- bubble_out_stall_entry_4_reg(STALLFIFO,297)
    bubble_out_stall_entry_4_reg_valid_in <= SE_stall_entry_V2;
    bubble_out_stall_entry_4_reg_stall_in <= SE_out_bubble_out_stall_entry_4_backStall;
    bubble_out_stall_entry_4_reg_valid_in_bitsignaltemp <= bubble_out_stall_entry_4_reg_valid_in(0);
    bubble_out_stall_entry_4_reg_stall_in_bitsignaltemp <= bubble_out_stall_entry_4_reg_stall_in(0);
    bubble_out_stall_entry_4_reg_valid_out(0) <= bubble_out_stall_entry_4_reg_valid_out_bitsignaltemp;
    bubble_out_stall_entry_4_reg_stall_out(0) <= bubble_out_stall_entry_4_reg_stall_out_bitsignaltemp;
    thebubble_out_stall_entry_4_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 18,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_stall_entry_4_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_stall_entry_4_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_stall_entry_4_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_stall_entry_4_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_stall_entry(STALLENABLE,204)
    SE_stall_entry_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_stall_entry_fromReg0 <= (others => '0');
            SE_stall_entry_fromReg1 <= (others => '0');
            SE_stall_entry_fromReg2 <= (others => '0');
            SE_stall_entry_fromReg3 <= (others => '0');
            SE_stall_entry_fromReg4 <= (others => '0');
            SE_stall_entry_fromReg5 <= (others => '0');
            SE_stall_entry_fromReg6 <= (others => '0');
            SE_stall_entry_fromReg7 <= (others => '0');
            SE_stall_entry_fromReg8 <= (others => '0');
            SE_stall_entry_fromReg9 <= (others => '0');
            SE_stall_entry_fromReg10 <= (others => '0');
            SE_stall_entry_fromReg11 <= (others => '0');
            SE_stall_entry_fromReg12 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_stall_entry_fromReg0 <= SE_stall_entry_toReg0;
            -- Succesor 1
            SE_stall_entry_fromReg1 <= SE_stall_entry_toReg1;
            -- Succesor 2
            SE_stall_entry_fromReg2 <= SE_stall_entry_toReg2;
            -- Succesor 3
            SE_stall_entry_fromReg3 <= SE_stall_entry_toReg3;
            -- Succesor 4
            SE_stall_entry_fromReg4 <= SE_stall_entry_toReg4;
            -- Succesor 5
            SE_stall_entry_fromReg5 <= SE_stall_entry_toReg5;
            -- Succesor 6
            SE_stall_entry_fromReg6 <= SE_stall_entry_toReg6;
            -- Succesor 7
            SE_stall_entry_fromReg7 <= SE_stall_entry_toReg7;
            -- Succesor 8
            SE_stall_entry_fromReg8 <= SE_stall_entry_toReg8;
            -- Succesor 9
            SE_stall_entry_fromReg9 <= SE_stall_entry_toReg9;
            -- Succesor 10
            SE_stall_entry_fromReg10 <= SE_stall_entry_toReg10;
            -- Succesor 11
            SE_stall_entry_fromReg11 <= SE_stall_entry_toReg11;
            -- Succesor 12
            SE_stall_entry_fromReg12 <= SE_stall_entry_toReg12;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_stall_entry_consumed0 <= (not (i_syncbuf_g_output_sync_buffer_ethash_search_out_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg0;
    SE_stall_entry_consumed1 <= (not (i_syncbuf_target_sync_buffer_ethash_search_out_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg1;
    SE_stall_entry_consumed2 <= (not (bubble_out_stall_entry_4_reg_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg2;
    SE_stall_entry_consumed3 <= (not (bubble_out_stall_entry_5_reg_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg3;
    SE_stall_entry_consumed4 <= (not (bubble_out_stall_entry_6_reg_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg4;
    SE_stall_entry_consumed5 <= (not (bubble_out_stall_entry_7_reg_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg5;
    SE_stall_entry_consumed6 <= (not (redist0_stall_entry_o4_17_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg6;
    SE_stall_entry_consumed7 <= (not (redist1_stall_entry_o8_17_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg7;
    SE_stall_entry_consumed8 <= (not (redist2_stall_entry_o9_17_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg8;
    SE_stall_entry_consumed9 <= (not (redist3_stall_entry_o10_17_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg9;
    SE_stall_entry_consumed10 <= (not (redist4_stall_entry_o11_17_fifo_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg10;
    SE_stall_entry_consumed11 <= (not (SE_out_i_syncbuf_target_sync_buffer_ethash_search_backStall) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg11;
    SE_stall_entry_consumed12 <= (not (i_acl_wg_limiter_exit_unnamed_ethash_search65_ethash_search_out_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg12;
    -- Consuming
    SE_stall_entry_StallValid <= SE_stall_entry_backStall and SE_stall_entry_wireValid;
    SE_stall_entry_toReg0 <= SE_stall_entry_StallValid and SE_stall_entry_consumed0;
    SE_stall_entry_toReg1 <= SE_stall_entry_StallValid and SE_stall_entry_consumed1;
    SE_stall_entry_toReg2 <= SE_stall_entry_StallValid and SE_stall_entry_consumed2;
    SE_stall_entry_toReg3 <= SE_stall_entry_StallValid and SE_stall_entry_consumed3;
    SE_stall_entry_toReg4 <= SE_stall_entry_StallValid and SE_stall_entry_consumed4;
    SE_stall_entry_toReg5 <= SE_stall_entry_StallValid and SE_stall_entry_consumed5;
    SE_stall_entry_toReg6 <= SE_stall_entry_StallValid and SE_stall_entry_consumed6;
    SE_stall_entry_toReg7 <= SE_stall_entry_StallValid and SE_stall_entry_consumed7;
    SE_stall_entry_toReg8 <= SE_stall_entry_StallValid and SE_stall_entry_consumed8;
    SE_stall_entry_toReg9 <= SE_stall_entry_StallValid and SE_stall_entry_consumed9;
    SE_stall_entry_toReg10 <= SE_stall_entry_StallValid and SE_stall_entry_consumed10;
    SE_stall_entry_toReg11 <= SE_stall_entry_StallValid and SE_stall_entry_consumed11;
    SE_stall_entry_toReg12 <= SE_stall_entry_StallValid and SE_stall_entry_consumed12;
    -- Backward Stall generation
    SE_stall_entry_or0 <= SE_stall_entry_consumed0;
    SE_stall_entry_or1 <= SE_stall_entry_consumed1 and SE_stall_entry_or0;
    SE_stall_entry_or2 <= SE_stall_entry_consumed2 and SE_stall_entry_or1;
    SE_stall_entry_or3 <= SE_stall_entry_consumed3 and SE_stall_entry_or2;
    SE_stall_entry_or4 <= SE_stall_entry_consumed4 and SE_stall_entry_or3;
    SE_stall_entry_or5 <= SE_stall_entry_consumed5 and SE_stall_entry_or4;
    SE_stall_entry_or6 <= SE_stall_entry_consumed6 and SE_stall_entry_or5;
    SE_stall_entry_or7 <= SE_stall_entry_consumed7 and SE_stall_entry_or6;
    SE_stall_entry_or8 <= SE_stall_entry_consumed8 and SE_stall_entry_or7;
    SE_stall_entry_or9 <= SE_stall_entry_consumed9 and SE_stall_entry_or8;
    SE_stall_entry_or10 <= SE_stall_entry_consumed10 and SE_stall_entry_or9;
    SE_stall_entry_or11 <= SE_stall_entry_consumed11 and SE_stall_entry_or10;
    SE_stall_entry_wireStall <= not (SE_stall_entry_consumed12 and SE_stall_entry_or11);
    SE_stall_entry_backStall <= SE_stall_entry_wireStall;
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg0);
    SE_stall_entry_V1 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg1);
    SE_stall_entry_V2 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg2);
    SE_stall_entry_V3 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg3);
    SE_stall_entry_V4 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg4);
    SE_stall_entry_V5 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg5);
    SE_stall_entry_V6 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg6);
    SE_stall_entry_V7 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg7);
    SE_stall_entry_V8 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg8);
    SE_stall_entry_V9 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg9);
    SE_stall_entry_V10 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg10);
    SE_stall_entry_V11 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg11);
    SE_stall_entry_V12 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg12);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- i_syncbuf_target_sync_buffer_ethash_search(BLACKBOX,86)@0
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_target_sync_buffer_ethash_search : i_syncbuf_target_sync_buffer_ethash_search554
    PORT MAP (
        in_buffer_in => in_target,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_target_sync_buffer_ethash_search_backStall,
        in_valid_in => SE_stall_entry_V1,
        out_buffer_out => i_syncbuf_target_sync_buffer_ethash_search_out_buffer_out,
        out_stall_out => i_syncbuf_target_sync_buffer_ethash_search_out_stall_out,
        out_valid_out => i_syncbuf_target_sync_buffer_ethash_search_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_syncbuf_target_sync_buffer_ethash_search(STALLENABLE,194)
    SE_out_i_syncbuf_target_sync_buffer_ethash_search_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_syncbuf_target_sync_buffer_ethash_search_fromReg0 <= (others => '0');
            SE_out_i_syncbuf_target_sync_buffer_ethash_search_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_syncbuf_target_sync_buffer_ethash_search_fromReg0 <= SE_out_i_syncbuf_target_sync_buffer_ethash_search_toReg0;
            -- Succesor 1
            SE_out_i_syncbuf_target_sync_buffer_ethash_search_fromReg1 <= SE_out_i_syncbuf_target_sync_buffer_ethash_search_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_syncbuf_target_sync_buffer_ethash_search_consumed0 <= (not (SE_out_i_syncbuf_g_output_sync_buffer_ethash_search_backStall) and SE_out_i_syncbuf_target_sync_buffer_ethash_search_wireValid) or SE_out_i_syncbuf_target_sync_buffer_ethash_search_fromReg0;
    SE_out_i_syncbuf_target_sync_buffer_ethash_search_consumed1 <= (not (redist5_i_cmp148_ethash_search_c_17_fifo_stall_out) and SE_out_i_syncbuf_target_sync_buffer_ethash_search_wireValid) or SE_out_i_syncbuf_target_sync_buffer_ethash_search_fromReg1;
    -- Consuming
    SE_out_i_syncbuf_target_sync_buffer_ethash_search_StallValid <= SE_out_i_syncbuf_target_sync_buffer_ethash_search_backStall and SE_out_i_syncbuf_target_sync_buffer_ethash_search_wireValid;
    SE_out_i_syncbuf_target_sync_buffer_ethash_search_toReg0 <= SE_out_i_syncbuf_target_sync_buffer_ethash_search_StallValid and SE_out_i_syncbuf_target_sync_buffer_ethash_search_consumed0;
    SE_out_i_syncbuf_target_sync_buffer_ethash_search_toReg1 <= SE_out_i_syncbuf_target_sync_buffer_ethash_search_StallValid and SE_out_i_syncbuf_target_sync_buffer_ethash_search_consumed1;
    -- Backward Stall generation
    SE_out_i_syncbuf_target_sync_buffer_ethash_search_or0 <= SE_out_i_syncbuf_target_sync_buffer_ethash_search_consumed0;
    SE_out_i_syncbuf_target_sync_buffer_ethash_search_wireStall <= not (SE_out_i_syncbuf_target_sync_buffer_ethash_search_consumed1 and SE_out_i_syncbuf_target_sync_buffer_ethash_search_or0);
    SE_out_i_syncbuf_target_sync_buffer_ethash_search_backStall <= SE_out_i_syncbuf_target_sync_buffer_ethash_search_wireStall;
    -- Valid signal propagation
    SE_out_i_syncbuf_target_sync_buffer_ethash_search_V0 <= SE_out_i_syncbuf_target_sync_buffer_ethash_search_wireValid and not (SE_out_i_syncbuf_target_sync_buffer_ethash_search_fromReg0);
    SE_out_i_syncbuf_target_sync_buffer_ethash_search_V1 <= SE_out_i_syncbuf_target_sync_buffer_ethash_search_wireValid and not (SE_out_i_syncbuf_target_sync_buffer_ethash_search_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_target_sync_buffer_ethash_search_and0 <= i_syncbuf_target_sync_buffer_ethash_search_out_valid_out;
    SE_out_i_syncbuf_target_sync_buffer_ethash_search_wireValid <= SE_stall_entry_V11 and SE_out_i_syncbuf_target_sync_buffer_ethash_search_and0;

    -- i_syncbuf_g_output_sync_buffer_ethash_search(BLACKBOX,85)@0
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_g_output_sync_buffer_ethash_search : i_syncbuf_g_output_sync_buffer_ethash_search556
    PORT MAP (
        in_buffer_in => in_g_output,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_g_output_sync_buffer_ethash_search_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_buffer_out => i_syncbuf_g_output_sync_buffer_ethash_search_out_buffer_out,
        out_stall_out => i_syncbuf_g_output_sync_buffer_ethash_search_out_stall_out,
        out_valid_out => i_syncbuf_g_output_sync_buffer_ethash_search_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_syncbuf_g_output_sync_buffer_ethash_search(STALLENABLE,192)
    -- Valid signal propagation
    SE_out_i_syncbuf_g_output_sync_buffer_ethash_search_V0 <= SE_out_i_syncbuf_g_output_sync_buffer_ethash_search_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_g_output_sync_buffer_ethash_search_backStall <= i_unknown_call152_ethash_search_out_o_stall or not (SE_out_i_syncbuf_g_output_sync_buffer_ethash_search_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_g_output_sync_buffer_ethash_search_and0 <= i_syncbuf_g_output_sync_buffer_ethash_search_out_valid_out;
    SE_out_i_syncbuf_g_output_sync_buffer_ethash_search_wireValid <= SE_out_i_syncbuf_target_sync_buffer_ethash_search_V0 and SE_out_i_syncbuf_g_output_sync_buffer_ethash_search_and0;

    -- SE_out_redist5_i_cmp148_ethash_search_c_17_fifo(STALLENABLE,218)
    SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_fromReg0 <= (others => '0');
            SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_fromReg1 <= (others => '0');
            SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_fromReg2 <= (others => '0');
            SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_fromReg3 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_fromReg0 <= SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_toReg0;
            -- Succesor 1
            SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_fromReg1 <= SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_toReg1;
            -- Succesor 2
            SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_fromReg2 <= SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_toReg2;
            -- Succesor 3
            SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_fromReg3 <= SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_toReg3;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_consumed0 <= (not (SE_out_redist4_stall_entry_o11_17_fifo_backStall) and SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_wireValid) or SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_fromReg0;
    SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_consumed1 <= (not (SE_out_redist0_stall_entry_o4_17_fifo_backStall) and SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_wireValid) or SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_fromReg1;
    SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_consumed2 <= (not (SE_out_redist3_stall_entry_o10_17_fifo_backStall) and SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_wireValid) or SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_fromReg2;
    SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_consumed3 <= (not (SE_out_redist2_stall_entry_o9_17_fifo_backStall) and SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_wireValid) or SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_fromReg3;
    -- Consuming
    SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_StallValid <= SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_backStall and SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_wireValid;
    SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_toReg0 <= SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_StallValid and SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_consumed0;
    SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_toReg1 <= SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_StallValid and SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_consumed1;
    SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_toReg2 <= SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_StallValid and SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_consumed2;
    SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_toReg3 <= SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_StallValid and SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_consumed3;
    -- Backward Stall generation
    SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_or0 <= SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_consumed0;
    SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_or1 <= SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_consumed1 and SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_or0;
    SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_or2 <= SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_consumed2 and SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_or1;
    SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_wireStall <= not (SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_consumed3 and SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_or2);
    SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_backStall <= SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_V0 <= SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_wireValid and not (SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_fromReg0);
    SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_V1 <= SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_wireValid and not (SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_fromReg1);
    SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_V2 <= SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_wireValid and not (SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_fromReg2);
    SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_V3 <= SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_wireValid and not (SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_fromReg3);
    -- Computing multiple Valid(s)
    SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_and0 <= redist5_i_cmp148_ethash_search_c_17_fifo_valid_out;
    SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_wireValid <= i_unknown_call152_ethash_search_out_o_valid and SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_and0;

    -- i_state_0_1_cast_ethash_search_ethash_search551_state_0_1_1_join_x(BITJOIN,68)@0
    i_state_0_1_cast_ethash_search_ethash_search551_state_0_1_1_join_x_q <= bubble_select_stall_entry_e & bubble_select_stall_entry_d;

    -- i_astype_ethash_search_ethash_search552_astype_select_0_x_merged_bit_select(BITSELECT,101)@0
    i_astype_ethash_search_ethash_search552_astype_select_0_x_merged_bit_select_b <= i_state_0_1_cast_ethash_search_ethash_search551_state_0_1_1_join_x_q(7 downto 0);
    i_astype_ethash_search_ethash_search552_astype_select_0_x_merged_bit_select_c <= i_state_0_1_cast_ethash_search_ethash_search551_state_0_1_1_join_x_q(15 downto 8);
    i_astype_ethash_search_ethash_search552_astype_select_0_x_merged_bit_select_d <= i_state_0_1_cast_ethash_search_ethash_search551_state_0_1_1_join_x_q(23 downto 16);
    i_astype_ethash_search_ethash_search552_astype_select_0_x_merged_bit_select_e <= i_state_0_1_cast_ethash_search_ethash_search551_state_0_1_1_join_x_q(31 downto 24);
    i_astype_ethash_search_ethash_search552_astype_select_0_x_merged_bit_select_f <= i_state_0_1_cast_ethash_search_ethash_search551_state_0_1_1_join_x_q(39 downto 32);
    i_astype_ethash_search_ethash_search552_astype_select_0_x_merged_bit_select_g <= i_state_0_1_cast_ethash_search_ethash_search551_state_0_1_1_join_x_q(47 downto 40);
    i_astype_ethash_search_ethash_search552_astype_select_0_x_merged_bit_select_h <= i_state_0_1_cast_ethash_search_ethash_search551_state_0_1_1_join_x_q(55 downto 48);
    i_astype_ethash_search_ethash_search552_astype_select_0_x_merged_bit_select_i <= i_state_0_1_cast_ethash_search_ethash_search551_state_0_1_1_join_x_q(63 downto 56);

    -- i_cast1246_ethash_search_ethash_search553_acl_71245_join_x(BITJOIN,63)@0
    i_cast1246_ethash_search_ethash_search553_acl_71245_join_x_q <= i_astype_ethash_search_ethash_search552_astype_select_0_x_merged_bit_select_b & i_astype_ethash_search_ethash_search552_astype_select_0_x_merged_bit_select_c & i_astype_ethash_search_ethash_search552_astype_select_0_x_merged_bit_select_d & i_astype_ethash_search_ethash_search552_astype_select_0_x_merged_bit_select_e & i_astype_ethash_search_ethash_search552_astype_select_0_x_merged_bit_select_f & i_astype_ethash_search_ethash_search552_astype_select_0_x_merged_bit_select_g & i_astype_ethash_search_ethash_search552_astype_select_0_x_merged_bit_select_h & i_astype_ethash_search_ethash_search552_astype_select_0_x_merged_bit_select_i;

    -- bubble_join_i_syncbuf_target_sync_buffer_ethash_search(BITJOIN,131)
    bubble_join_i_syncbuf_target_sync_buffer_ethash_search_q <= i_syncbuf_target_sync_buffer_ethash_search_out_buffer_out;

    -- bubble_select_i_syncbuf_target_sync_buffer_ethash_search(BITSELECT,132)
    bubble_select_i_syncbuf_target_sync_buffer_ethash_search_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_target_sync_buffer_ethash_search_q(63 downto 0));

    -- i_cmp148_ethash_search(COMPARE,79)@0
    i_cmp148_ethash_search_a <= STD_LOGIC_VECTOR("00" & bubble_select_i_syncbuf_target_sync_buffer_ethash_search_b);
    i_cmp148_ethash_search_b <= STD_LOGIC_VECTOR("00" & i_cast1246_ethash_search_ethash_search553_acl_71245_join_x_q);
    i_cmp148_ethash_search_o <= STD_LOGIC_VECTOR(UNSIGNED(i_cmp148_ethash_search_a) - UNSIGNED(i_cmp148_ethash_search_b));
    i_cmp148_ethash_search_c(0) <= i_cmp148_ethash_search_o(65);

    -- bubble_join_i_syncbuf_g_output_sync_buffer_ethash_search(BITJOIN,128)
    bubble_join_i_syncbuf_g_output_sync_buffer_ethash_search_q <= i_syncbuf_g_output_sync_buffer_ethash_search_out_buffer_out;

    -- bubble_select_i_syncbuf_g_output_sync_buffer_ethash_search(BITSELECT,129)
    bubble_select_i_syncbuf_g_output_sync_buffer_ethash_search_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_g_output_sync_buffer_ethash_search_q(63 downto 0));

    -- i_unknown_call152_ethash_search(BLACKBOX,88)@0
    -- in in_i_stall@20000000
    -- out out_call152_avm_address@20000000
    -- out out_call152_avm_burstcount@20000000
    -- out out_call152_avm_byteenable@20000000
    -- out out_call152_avm_enable@20000000
    -- out out_call152_avm_read@20000000
    -- out out_call152_avm_write@20000000
    -- out out_call152_avm_writedata@20000000
    -- out out_lsu_call152_o_active@20000000
    -- out out_o_readdata@17
    -- out out_o_stall@20000000
    -- out out_o_valid@17
    thei_unknown_call152_ethash_search : i_unknown_call152_ethash_search559
    PORT MAP (
        in_call152_avm_readdata => in_call152_avm_readdata,
        in_call152_avm_readdatavalid => in_call152_avm_readdatavalid,
        in_call152_avm_waitrequest => in_call152_avm_waitrequest,
        in_call152_avm_writeack => in_call152_avm_writeack,
        in_flush => in_flush,
        in_i_address => bubble_select_i_syncbuf_g_output_sync_buffer_ethash_search_b,
        in_i_predicate => i_cmp148_ethash_search_c,
        in_i_stall => SE_out_redist5_i_cmp148_ethash_search_c_17_fifo_backStall,
        in_i_valid => SE_out_i_syncbuf_g_output_sync_buffer_ethash_search_V0,
        in_i_writedata => c_i32_1gr_q,
        out_call152_avm_address => i_unknown_call152_ethash_search_out_call152_avm_address,
        out_call152_avm_burstcount => i_unknown_call152_ethash_search_out_call152_avm_burstcount,
        out_call152_avm_byteenable => i_unknown_call152_ethash_search_out_call152_avm_byteenable,
        out_call152_avm_enable => i_unknown_call152_ethash_search_out_call152_avm_enable,
        out_call152_avm_read => i_unknown_call152_ethash_search_out_call152_avm_read,
        out_call152_avm_write => i_unknown_call152_ethash_search_out_call152_avm_write,
        out_call152_avm_writedata => i_unknown_call152_ethash_search_out_call152_avm_writedata,
        out_lsu_call152_o_active => i_unknown_call152_ethash_search_out_lsu_call152_o_active,
        out_o_readdata => i_unknown_call152_ethash_search_out_o_readdata,
        out_o_stall => i_unknown_call152_ethash_search_out_o_stall,
        out_o_valid => i_unknown_call152_ethash_search_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_ext_sig_sync_out_x(GPOUT,3)
    out_lsu_call152_o_active <= i_unknown_call152_ethash_search_out_lsu_call152_o_active;

    -- dupName_0_sync_out_x(GPOUT,8)@19
    out_valid_out <= SE_out_i_vol_store_unnamed_ethash_search64_ethash_search_V0;

    -- dupName_1_ext_sig_sync_out_x(GPOUT,10)
    out_unnamed_ethash_search61_avm_address <= i_vol_store_unnamed_ethash_search61_ethash_search_out_unnamed_ethash_search61_avm_address;
    out_unnamed_ethash_search61_avm_enable <= i_vol_store_unnamed_ethash_search61_ethash_search_out_unnamed_ethash_search61_avm_enable;
    out_unnamed_ethash_search61_avm_read <= i_vol_store_unnamed_ethash_search61_ethash_search_out_unnamed_ethash_search61_avm_read;
    out_unnamed_ethash_search61_avm_write <= i_vol_store_unnamed_ethash_search61_ethash_search_out_unnamed_ethash_search61_avm_write;
    out_unnamed_ethash_search61_avm_writedata <= i_vol_store_unnamed_ethash_search61_ethash_search_out_unnamed_ethash_search61_avm_writedata;
    out_unnamed_ethash_search61_avm_byteenable <= i_vol_store_unnamed_ethash_search61_ethash_search_out_unnamed_ethash_search61_avm_byteenable;
    out_unnamed_ethash_search61_avm_burstcount <= i_vol_store_unnamed_ethash_search61_ethash_search_out_unnamed_ethash_search61_avm_burstcount;

    -- dupName_2_ext_sig_sync_out_x(GPOUT,15)
    out_lsu_unnamed_ethash_search61_o_active <= i_vol_store_unnamed_ethash_search61_ethash_search_out_lsu_unnamed_ethash_search61_o_active;

    -- dupName_3_ext_sig_sync_out_x(GPOUT,19)
    out_unnamed_ethash_search62_avm_address <= i_vol_store_unnamed_ethash_search62_ethash_search_out_unnamed_ethash_search62_avm_address;
    out_unnamed_ethash_search62_avm_enable <= i_vol_store_unnamed_ethash_search62_ethash_search_out_unnamed_ethash_search62_avm_enable;
    out_unnamed_ethash_search62_avm_read <= i_vol_store_unnamed_ethash_search62_ethash_search_out_unnamed_ethash_search62_avm_read;
    out_unnamed_ethash_search62_avm_write <= i_vol_store_unnamed_ethash_search62_ethash_search_out_unnamed_ethash_search62_avm_write;
    out_unnamed_ethash_search62_avm_writedata <= i_vol_store_unnamed_ethash_search62_ethash_search_out_unnamed_ethash_search62_avm_writedata;
    out_unnamed_ethash_search62_avm_byteenable <= i_vol_store_unnamed_ethash_search62_ethash_search_out_unnamed_ethash_search62_avm_byteenable;
    out_unnamed_ethash_search62_avm_burstcount <= i_vol_store_unnamed_ethash_search62_ethash_search_out_unnamed_ethash_search62_avm_burstcount;

    -- dupName_4_ext_sig_sync_out_x(GPOUT,23)
    out_lsu_unnamed_ethash_search62_o_active <= i_vol_store_unnamed_ethash_search62_ethash_search_out_lsu_unnamed_ethash_search62_o_active;

    -- dupName_5_ext_sig_sync_out_x(GPOUT,26)
    out_unnamed_ethash_search63_avm_address <= i_vol_store_unnamed_ethash_search63_ethash_search_aunroll_x_out_unnamed_ethash_search63_avm_address;
    out_unnamed_ethash_search63_avm_enable <= i_vol_store_unnamed_ethash_search63_ethash_search_aunroll_x_out_unnamed_ethash_search63_avm_enable;
    out_unnamed_ethash_search63_avm_read <= i_vol_store_unnamed_ethash_search63_ethash_search_aunroll_x_out_unnamed_ethash_search63_avm_read;
    out_unnamed_ethash_search63_avm_write <= i_vol_store_unnamed_ethash_search63_ethash_search_aunroll_x_out_unnamed_ethash_search63_avm_write;
    out_unnamed_ethash_search63_avm_writedata <= i_vol_store_unnamed_ethash_search63_ethash_search_aunroll_x_out_unnamed_ethash_search63_avm_writedata;
    out_unnamed_ethash_search63_avm_byteenable <= i_vol_store_unnamed_ethash_search63_ethash_search_aunroll_x_out_unnamed_ethash_search63_avm_byteenable;
    out_unnamed_ethash_search63_avm_burstcount <= i_vol_store_unnamed_ethash_search63_ethash_search_aunroll_x_out_unnamed_ethash_search63_avm_burstcount;

    -- dupName_6_ext_sig_sync_out_x(GPOUT,29)
    out_lsu_unnamed_ethash_search63_o_active <= i_vol_store_unnamed_ethash_search63_ethash_search_aunroll_x_out_lsu_unnamed_ethash_search63_o_active;

    -- dupName_7_ext_sig_sync_out_x(GPOUT,32)
    out_unnamed_ethash_search64_avm_address <= i_vol_store_unnamed_ethash_search64_ethash_search_out_unnamed_ethash_search64_avm_address;
    out_unnamed_ethash_search64_avm_enable <= i_vol_store_unnamed_ethash_search64_ethash_search_out_unnamed_ethash_search64_avm_enable;
    out_unnamed_ethash_search64_avm_read <= i_vol_store_unnamed_ethash_search64_ethash_search_out_unnamed_ethash_search64_avm_read;
    out_unnamed_ethash_search64_avm_write <= i_vol_store_unnamed_ethash_search64_ethash_search_out_unnamed_ethash_search64_avm_write;
    out_unnamed_ethash_search64_avm_writedata <= i_vol_store_unnamed_ethash_search64_ethash_search_out_unnamed_ethash_search64_avm_writedata;
    out_unnamed_ethash_search64_avm_byteenable <= i_vol_store_unnamed_ethash_search64_ethash_search_out_unnamed_ethash_search64_avm_byteenable;
    out_unnamed_ethash_search64_avm_burstcount <= i_vol_store_unnamed_ethash_search64_ethash_search_out_unnamed_ethash_search64_avm_burstcount;

    -- dupName_8_ext_sig_sync_out_x(GPOUT,35)
    out_lsu_unnamed_ethash_search64_o_active <= i_vol_store_unnamed_ethash_search64_ethash_search_out_lsu_unnamed_ethash_search64_o_active;

    -- dupName_9_ext_sig_sync_out_x(GPOUT,38)
    out_wgl_0_exit_exit_valid_in <= i_acl_wg_limiter_exit_unnamed_ethash_search65_ethash_search_out_exit_valid_in;
    out_wgl_0_exit_exit_stall_in <= i_acl_wg_limiter_exit_unnamed_ethash_search65_ethash_search_out_exit_stall_in;

    -- ext_sig_sync_out(GPOUT,76)
    out_call152_avm_address <= i_unknown_call152_ethash_search_out_call152_avm_address;
    out_call152_avm_enable <= i_unknown_call152_ethash_search_out_call152_avm_enable;
    out_call152_avm_read <= i_unknown_call152_ethash_search_out_call152_avm_read;
    out_call152_avm_write <= i_unknown_call152_ethash_search_out_call152_avm_write;
    out_call152_avm_writedata <= i_unknown_call152_ethash_search_out_call152_avm_writedata;
    out_call152_avm_byteenable <= i_unknown_call152_ethash_search_out_call152_avm_byteenable;
    out_call152_avm_burstcount <= i_unknown_call152_ethash_search_out_call152_avm_burstcount;

    -- sync_out(GPOUT,100)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
