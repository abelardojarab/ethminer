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

-- VHDL created from i_sfc_logic_c1_for_end91_ethash_search_c1_enter_ethash_search348
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

entity i_sfc_logic_c1_for_end91_ethash_search_c1_enter_ethash_search348 is
    port (
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search37_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search37_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_unnamed_ethash_search37_2 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search37_3 : in std_logic_vector(63 downto 0);  -- ufix64
        in_unnamed_ethash_search37_4 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_ethash_search37_5 : in std_logic_vector(31 downto 0);  -- ufix32
        in_unnamed_ethash_search37_6 : in std_logic_vector(31 downto 0);  -- ufix32
        in_unnamed_ethash_search37_7 : in std_logic_vector(31 downto 0);  -- ufix32
        in_unnamed_ethash_search37_8 : in std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exi4_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exi4_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exi4_2 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exi4_3 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exi4_4 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_null_load_016_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memcoalesce_null_load_016_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_null_load_016_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_null_load_016_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_016_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_null_load_016_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_016_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_016_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_016_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_memcoalesce_null_load_016_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_memcoalesce_null_load_016_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c1_for_end91_ethash_search_c1_enter_ethash_search348;

architecture normal of i_sfc_logic_c1_for_end91_ethash_search_c1_enter_ethash_search348 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_load_memcoalesce_null_load_016_ethash_search350 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_bitwiseor : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_016_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_016_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_016_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_016_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata_0 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_readdata_1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_016_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_016_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_016_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_016_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_016_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_016_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_016_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_null_load_016_ethash_search_aunroll_x_out_o_readdata_0 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_memcoalesce_null_load_016_ethash_search_aunroll_x_out_o_readdata_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_memcoalesce_null_load_016_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_null_load_016_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_null_load_016_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_null_load_016_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_null_load_016_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_null_load_016_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_null_load_016_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal i_acl_1410_ethash_search_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_1410_ethash_search_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_1411_ethash_search_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_1411_ethash_search_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_1412_ethash_search_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_1412_ethash_search_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_ethash_search_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_ethash_search_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_ethash_search353_unnamed_ethash_search38_select_0_x_merged_bit_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_ethash_search353_unnamed_ethash_search38_select_0_x_merged_bit_select_c : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_ethash_search355_unnamed_ethash_search39_select_0_x_merged_bit_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_ethash_search355_unnamed_ethash_search39_select_0_x_merged_bit_select_c : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_sync_in_aunroll_x_in_i_valid_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_sync_in_aunroll_x_in_unnamed_ethash_search37_4_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_mem_reset0 : std_logic;
    signal redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve : boolean;
    attribute preserve of redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_rdcnt_i : signal is true;
    signal redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_cmp_b : STD_LOGIC_VECTOR (2 downto 0);
    signal redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only : boolean;
    attribute preserve_syn_only of redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_sticky_ena_q : signal is true;
    signal redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_mem_reset0 : std_logic;
    signal redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_rdcnt_i : signal is true;
    signal redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_cmp_b : STD_LOGIC_VECTOR (2 downto 0);
    signal redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_sticky_ena_q : signal is true;
    signal redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_mem_reset0 : std_logic;
    signal redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_rdcnt_i : signal is true;
    signal redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_cmp_b : STD_LOGIC_VECTOR (2 downto 0);
    signal redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_sticky_ena_q : signal is true;
    signal redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_mem_reset0 : std_logic;
    signal redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_rdcnt_i : signal is true;
    signal redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_cmp_b : STD_LOGIC_VECTOR (2 downto 0);
    signal redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_sticky_ena_q : signal is true;
    signal redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist0_sync_in_aunroll_x_in_i_valid_5(DELAY,19)
    redist0_sync_in_aunroll_x_in_i_valid_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist0_sync_in_aunroll_x_in_i_valid_5_q, clk => clock, aclr => resetn );

    -- i_load_memcoalesce_null_load_016_ethash_search_aunroll_x(BLACKBOX,2)@173
    -- in in_i_stall@20000000
    -- out out_o_readdata_0@178
    -- out out_o_readdata_1@178
    -- out out_memcoalesce_null_load_016_avm_address@20000000
    -- out out_memcoalesce_null_load_016_avm_burstcount@20000000
    -- out out_memcoalesce_null_load_016_avm_byteenable@20000000
    -- out out_memcoalesce_null_load_016_avm_enable@20000000
    -- out out_memcoalesce_null_load_016_avm_read@20000000
    -- out out_memcoalesce_null_load_016_avm_write@20000000
    -- out out_memcoalesce_null_load_016_avm_writedata@20000000
    -- out out_o_stall@177
    -- out out_o_valid@178
    thei_load_memcoalesce_null_load_016_ethash_search_aunroll_x : i_load_memcoalesce_null_load_016_ethash_search350
    PORT MAP (
        in_flush => in_flush,
        in_i_address => in_unnamed_ethash_search37_1,
        in_i_bitwiseor => in_unnamed_ethash_search37_3,
        in_i_predicate => in_unnamed_ethash_search37_2,
        in_i_stall => GND_q,
        in_i_valid => in_i_valid,
        in_memcoalesce_null_load_016_avm_readdata => in_memcoalesce_null_load_016_avm_readdata,
        in_memcoalesce_null_load_016_avm_readdatavalid => in_memcoalesce_null_load_016_avm_readdatavalid,
        in_memcoalesce_null_load_016_avm_waitrequest => in_memcoalesce_null_load_016_avm_waitrequest,
        in_memcoalesce_null_load_016_avm_writeack => in_memcoalesce_null_load_016_avm_writeack,
        out_o_readdata_0 => i_load_memcoalesce_null_load_016_ethash_search_aunroll_x_out_o_readdata_0,
        out_o_readdata_1 => i_load_memcoalesce_null_load_016_ethash_search_aunroll_x_out_o_readdata_1,
        out_memcoalesce_null_load_016_avm_address => i_load_memcoalesce_null_load_016_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_address,
        out_memcoalesce_null_load_016_avm_burstcount => i_load_memcoalesce_null_load_016_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_burstcount,
        out_memcoalesce_null_load_016_avm_byteenable => i_load_memcoalesce_null_load_016_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_byteenable,
        out_memcoalesce_null_load_016_avm_enable => i_load_memcoalesce_null_load_016_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_enable,
        out_memcoalesce_null_load_016_avm_read => i_load_memcoalesce_null_load_016_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_read,
        out_memcoalesce_null_load_016_avm_write => i_load_memcoalesce_null_load_016_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_write,
        out_memcoalesce_null_load_016_avm_writedata => i_load_memcoalesce_null_load_016_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- i_unnamed_ethash_search353_unnamed_ethash_search38_select_0_x_merged_bit_select(BITSELECT,17)@178
    i_unnamed_ethash_search353_unnamed_ethash_search38_select_0_x_merged_bit_select_b <= i_load_memcoalesce_null_load_016_ethash_search_aunroll_x_out_o_readdata_0(31 downto 0);
    i_unnamed_ethash_search353_unnamed_ethash_search38_select_0_x_merged_bit_select_c <= i_load_memcoalesce_null_load_016_ethash_search_aunroll_x_out_o_readdata_0(63 downto 32);

    -- redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_notEnable(LOGICAL,61)
    redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_nor(LOGICAL,62)
    redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_nor_q <= not (redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_notEnable_q or redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_sticky_ena_q);

    -- redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_mem_last(CONSTANT,58)
    redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_mem_last_q <= "010";

    -- redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_cmp(LOGICAL,59)
    redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_cmp_b <= STD_LOGIC_VECTOR("0" & redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_rdcnt_q);
    redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_cmp_q <= "1" WHEN redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_mem_last_q = redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_cmp_b ELSE "0";

    -- redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_cmpReg(REG,60)
    redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_cmpReg_q <= STD_LOGIC_VECTOR(redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_cmp_q);
        END IF;
    END PROCESS;

    -- redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_sticky_ena(REG,63)
    redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_nor_q = "1") THEN
                redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_sticky_ena_q <= STD_LOGIC_VECTOR(redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_enaAnd(LOGICAL,64)
    redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_enaAnd_q <= redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_sticky_ena_q and VCC_q;

    -- redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_rdcnt(COUNTER,56)
    -- low=0, high=3, step=1, init=0
    redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_rdcnt_i <= TO_UNSIGNED(0, 2);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_rdcnt_i <= redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_rdcnt_i, 2)));

    -- redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_wraddr(REG,57)
    redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_wraddr_q <= "11";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_wraddr_q <= STD_LOGIC_VECTOR(redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_mem(DUALMEM,55)
    redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_mem_ia <= STD_LOGIC_VECTOR(in_unnamed_ethash_search37_8);
    redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_mem_aa <= redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_wraddr_q;
    redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_mem_ab <= redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_rdcnt_q;
    redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_mem_reset0 <= not (resetn);
    redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 32,
        widthad_b => 2,
        numwords_b => 4,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Arria 10"
    )
    PORT MAP (
        clocken1 => redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_mem_reset0,
        clock1 => clock,
        address_a => redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_mem_aa,
        data_a => redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_mem_ab,
        q_b => redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_mem_iq
    );
    redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_mem_q <= redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_mem_iq(31 downto 0);

    -- redist1_sync_in_aunroll_x_in_unnamed_ethash_search37_4_5(DELAY,20)
    redist1_sync_in_aunroll_x_in_unnamed_ethash_search37_4_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_unnamed_ethash_search37_4, xout => redist1_sync_in_aunroll_x_in_unnamed_ethash_search37_4_5_q, clk => clock, aclr => resetn );

    -- i_acl_1412_ethash_search(MUX,14)@178
    i_acl_1412_ethash_search_s <= redist1_sync_in_aunroll_x_in_unnamed_ethash_search37_4_5_q;
    i_acl_1412_ethash_search_combproc: PROCESS (i_acl_1412_ethash_search_s, redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_mem_q, i_unnamed_ethash_search353_unnamed_ethash_search38_select_0_x_merged_bit_select_c)
    BEGIN
        CASE (i_acl_1412_ethash_search_s) IS
            WHEN "0" => i_acl_1412_ethash_search_q <= redist5_sync_in_aunroll_x_in_unnamed_ethash_search37_8_5_mem_q;
            WHEN "1" => i_acl_1412_ethash_search_q <= i_unnamed_ethash_search353_unnamed_ethash_search38_select_0_x_merged_bit_select_c;
            WHEN OTHERS => i_acl_1412_ethash_search_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_notEnable(LOGICAL,51)
    redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_nor(LOGICAL,52)
    redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_nor_q <= not (redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_notEnable_q or redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_sticky_ena_q);

    -- redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_mem_last(CONSTANT,48)
    redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_mem_last_q <= "010";

    -- redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_cmp(LOGICAL,49)
    redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_cmp_b <= STD_LOGIC_VECTOR("0" & redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_rdcnt_q);
    redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_cmp_q <= "1" WHEN redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_mem_last_q = redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_cmp_b ELSE "0";

    -- redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_cmpReg(REG,50)
    redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_cmpReg_q <= STD_LOGIC_VECTOR(redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_cmp_q);
        END IF;
    END PROCESS;

    -- redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_sticky_ena(REG,53)
    redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_nor_q = "1") THEN
                redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_sticky_ena_q <= STD_LOGIC_VECTOR(redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_enaAnd(LOGICAL,54)
    redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_enaAnd_q <= redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_sticky_ena_q and VCC_q;

    -- redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_rdcnt(COUNTER,46)
    -- low=0, high=3, step=1, init=0
    redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_rdcnt_i <= TO_UNSIGNED(0, 2);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_rdcnt_i <= redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_rdcnt_i, 2)));

    -- redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_wraddr(REG,47)
    redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_wraddr_q <= "11";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_wraddr_q <= STD_LOGIC_VECTOR(redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_mem(DUALMEM,45)
    redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_mem_ia <= STD_LOGIC_VECTOR(in_unnamed_ethash_search37_7);
    redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_mem_aa <= redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_wraddr_q;
    redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_mem_ab <= redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_rdcnt_q;
    redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_mem_reset0 <= not (resetn);
    redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 32,
        widthad_b => 2,
        numwords_b => 4,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Arria 10"
    )
    PORT MAP (
        clocken1 => redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_mem_reset0,
        clock1 => clock,
        address_a => redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_mem_aa,
        data_a => redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_mem_ab,
        q_b => redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_mem_iq
    );
    redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_mem_q <= redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_mem_iq(31 downto 0);

    -- i_acl_1411_ethash_search(MUX,13)@178
    i_acl_1411_ethash_search_s <= redist1_sync_in_aunroll_x_in_unnamed_ethash_search37_4_5_q;
    i_acl_1411_ethash_search_combproc: PROCESS (i_acl_1411_ethash_search_s, redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_mem_q, i_unnamed_ethash_search353_unnamed_ethash_search38_select_0_x_merged_bit_select_b)
    BEGIN
        CASE (i_acl_1411_ethash_search_s) IS
            WHEN "0" => i_acl_1411_ethash_search_q <= redist4_sync_in_aunroll_x_in_unnamed_ethash_search37_7_5_mem_q;
            WHEN "1" => i_acl_1411_ethash_search_q <= i_unnamed_ethash_search353_unnamed_ethash_search38_select_0_x_merged_bit_select_b;
            WHEN OTHERS => i_acl_1411_ethash_search_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_unnamed_ethash_search355_unnamed_ethash_search39_select_0_x_merged_bit_select(BITSELECT,18)@178
    i_unnamed_ethash_search355_unnamed_ethash_search39_select_0_x_merged_bit_select_b <= i_load_memcoalesce_null_load_016_ethash_search_aunroll_x_out_o_readdata_1(31 downto 0);
    i_unnamed_ethash_search355_unnamed_ethash_search39_select_0_x_merged_bit_select_c <= i_load_memcoalesce_null_load_016_ethash_search_aunroll_x_out_o_readdata_1(63 downto 32);

    -- redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_notEnable(LOGICAL,41)
    redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_nor(LOGICAL,42)
    redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_nor_q <= not (redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_notEnable_q or redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_sticky_ena_q);

    -- redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_mem_last(CONSTANT,38)
    redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_mem_last_q <= "010";

    -- redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_cmp(LOGICAL,39)
    redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_cmp_b <= STD_LOGIC_VECTOR("0" & redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_rdcnt_q);
    redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_cmp_q <= "1" WHEN redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_mem_last_q = redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_cmp_b ELSE "0";

    -- redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_cmpReg(REG,40)
    redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_cmpReg_q <= STD_LOGIC_VECTOR(redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_cmp_q);
        END IF;
    END PROCESS;

    -- redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_sticky_ena(REG,43)
    redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_nor_q = "1") THEN
                redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_sticky_ena_q <= STD_LOGIC_VECTOR(redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_enaAnd(LOGICAL,44)
    redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_enaAnd_q <= redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_sticky_ena_q and VCC_q;

    -- redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_rdcnt(COUNTER,36)
    -- low=0, high=3, step=1, init=0
    redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_rdcnt_i <= TO_UNSIGNED(0, 2);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_rdcnt_i <= redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_rdcnt_i, 2)));

    -- redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_wraddr(REG,37)
    redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_wraddr_q <= "11";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_wraddr_q <= STD_LOGIC_VECTOR(redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_mem(DUALMEM,35)
    redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_mem_ia <= STD_LOGIC_VECTOR(in_unnamed_ethash_search37_6);
    redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_mem_aa <= redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_wraddr_q;
    redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_mem_ab <= redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_rdcnt_q;
    redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_mem_reset0 <= not (resetn);
    redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 32,
        widthad_b => 2,
        numwords_b => 4,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Arria 10"
    )
    PORT MAP (
        clocken1 => redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_mem_reset0,
        clock1 => clock,
        address_a => redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_mem_aa,
        data_a => redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_mem_ab,
        q_b => redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_mem_iq
    );
    redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_mem_q <= redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_mem_iq(31 downto 0);

    -- i_acl_1410_ethash_search(MUX,12)@178
    i_acl_1410_ethash_search_s <= redist1_sync_in_aunroll_x_in_unnamed_ethash_search37_4_5_q;
    i_acl_1410_ethash_search_combproc: PROCESS (i_acl_1410_ethash_search_s, redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_mem_q, i_unnamed_ethash_search355_unnamed_ethash_search39_select_0_x_merged_bit_select_c)
    BEGIN
        CASE (i_acl_1410_ethash_search_s) IS
            WHEN "0" => i_acl_1410_ethash_search_q <= redist3_sync_in_aunroll_x_in_unnamed_ethash_search37_6_5_mem_q;
            WHEN "1" => i_acl_1410_ethash_search_q <= i_unnamed_ethash_search355_unnamed_ethash_search39_select_0_x_merged_bit_select_c;
            WHEN OTHERS => i_acl_1410_ethash_search_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_notEnable(LOGICAL,31)
    redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_nor(LOGICAL,32)
    redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_nor_q <= not (redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_notEnable_q or redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_sticky_ena_q);

    -- redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_mem_last(CONSTANT,28)
    redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_mem_last_q <= "010";

    -- redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_cmp(LOGICAL,29)
    redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_cmp_b <= STD_LOGIC_VECTOR("0" & redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_rdcnt_q);
    redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_cmp_q <= "1" WHEN redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_mem_last_q = redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_cmp_b ELSE "0";

    -- redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_cmpReg(REG,30)
    redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_cmpReg_q <= STD_LOGIC_VECTOR(redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_cmp_q);
        END IF;
    END PROCESS;

    -- redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_sticky_ena(REG,33)
    redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_nor_q = "1") THEN
                redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_sticky_ena_q <= STD_LOGIC_VECTOR(redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_enaAnd(LOGICAL,34)
    redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_enaAnd_q <= redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_sticky_ena_q and VCC_q;

    -- redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_rdcnt(COUNTER,26)
    -- low=0, high=3, step=1, init=0
    redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_rdcnt_i <= TO_UNSIGNED(0, 2);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_rdcnt_i <= redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_rdcnt_i, 2)));

    -- redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_wraddr(REG,27)
    redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_wraddr_q <= "11";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_wraddr_q <= STD_LOGIC_VECTOR(redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_mem(DUALMEM,25)
    redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_mem_ia <= STD_LOGIC_VECTOR(in_unnamed_ethash_search37_5);
    redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_mem_aa <= redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_wraddr_q;
    redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_mem_ab <= redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_rdcnt_q;
    redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_mem_reset0 <= not (resetn);
    redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 32,
        widthad_b => 2,
        numwords_b => 4,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Arria 10"
    )
    PORT MAP (
        clocken1 => redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_mem_reset0,
        clock1 => clock,
        address_a => redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_mem_aa,
        data_a => redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_mem_ab,
        q_b => redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_mem_iq
    );
    redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_mem_q <= redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_mem_iq(31 downto 0);

    -- i_acl_ethash_search(MUX,15)@178
    i_acl_ethash_search_s <= redist1_sync_in_aunroll_x_in_unnamed_ethash_search37_4_5_q;
    i_acl_ethash_search_combproc: PROCESS (i_acl_ethash_search_s, redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_mem_q, i_unnamed_ethash_search355_unnamed_ethash_search39_select_0_x_merged_bit_select_b)
    BEGIN
        CASE (i_acl_ethash_search_s) IS
            WHEN "0" => i_acl_ethash_search_q <= redist2_sync_in_aunroll_x_in_unnamed_ethash_search37_5_5_mem_q;
            WHEN "1" => i_acl_ethash_search_q <= i_unnamed_ethash_search355_unnamed_ethash_search39_select_0_x_merged_bit_select_b;
            WHEN OTHERS => i_acl_ethash_search_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,8)@178
    out_c1_exi4_0 <= GND_q;
    out_c1_exi4_1 <= i_acl_ethash_search_q;
    out_c1_exi4_2 <= i_acl_1410_ethash_search_q;
    out_c1_exi4_3 <= i_acl_1411_ethash_search_q;
    out_c1_exi4_4 <= i_acl_1412_ethash_search_q;
    out_o_valid <= redist0_sync_in_aunroll_x_in_i_valid_5_q;

    -- ext_sig_sync_out(GPOUT,11)
    out_memcoalesce_null_load_016_avm_address <= i_load_memcoalesce_null_load_016_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_address;
    out_memcoalesce_null_load_016_avm_enable <= i_load_memcoalesce_null_load_016_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_enable;
    out_memcoalesce_null_load_016_avm_read <= i_load_memcoalesce_null_load_016_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_read;
    out_memcoalesce_null_load_016_avm_write <= i_load_memcoalesce_null_load_016_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_write;
    out_memcoalesce_null_load_016_avm_writedata <= i_load_memcoalesce_null_load_016_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_writedata;
    out_memcoalesce_null_load_016_avm_byteenable <= i_load_memcoalesce_null_load_016_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_byteenable;
    out_memcoalesce_null_load_016_avm_burstcount <= i_load_memcoalesce_null_load_016_ethash_search_aunroll_x_out_memcoalesce_null_load_016_avm_burstcount;

END normal;
